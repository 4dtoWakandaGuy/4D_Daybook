//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel CritSave
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_Search; vT; vTitle12; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel CritSave")
//Sel CritSave
Menu_Record("Sel CritSave"; "Save Criteria ...")
If (vTitle13#"")
	$_l_TableNumber:=Table:C252(vFilePtr)
	If (Is table number valid:C999($_l_TableNumber))
		$_t_Search:="©"+("0"*(3-Length:C16(String:C10($_l_TableNumber))))+String:C10($_l_TableNumber)
		vTitle12:=Gen_Request("Save as ..."; vTitle12)
		If ((OK=1) & (vTitle12#""))
			If (Length:C16(vTitle12)>26)
				vTitle12:=Substring:C12(vTitle12; 1; 26)
				Gen_Confirm("NB: Only the 1st 26 characters can be used - the name have been shortened to "+vTitle12; "OK"; "Cancel")
			End if 
			If (OK=1)
				$_t_Search:=$_t_Search+vTitle12
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_Search)
				If (Records in selection:C76([SCRIPTS:80])>0)
					Gen_Confirm("Do you want to Replace Criteria saved with the same name?"; "Replace"; "Cancel")
				End if 
				If (OK=1)
					READ WRITE:C146([SCRIPTS:80])
					If (Records in selection:C76([SCRIPTS:80])=0)
						CREATE RECORD:C68([SCRIPTS:80])
						[SCRIPTS:80]Script_Code:1:=$_t_Search
					Else 
						LOAD RECORD:C52([SCRIPTS:80])
						If (Locked:C147([SCRIPTS:80]))
							Gen_Alert("Cannot save the Criteria - record in use")
							OK:=0
						End if 
					End if 
					If (OK=1)
						[SCRIPTS:80]Script_Name:2:=Uppers2(Lowercase:C14(Table name:C256($_l_TableNumber)))+" More Choices Saved Criteria "+String:C10(<>DB_d_CurrentDate)
						[SCRIPTS:80]Person:5:=<>PER_t_CurrentUserInitials
						vT:=""
						Sel_CritSaveVar("cSIS+cNAA+cNAL+◊NAL+"+vTitle13)
						[SCRIPTS:80]Recording_Text:4:=vT
						DB_SaveRecord(->[SCRIPTS:80])
					End if 
					READ ONLY:C145([SCRIPTS:80])
					UNLOAD RECORD:C212([SCRIPTS:80])
				End if 
			End if 
		End if 
	End if 
Else 
	Gen_Alert("Criteria cannot be Saved for this File"; "Cancel")
End if 
ERR_MethodTrackerReturn("Sel CritSave"; $_t_oldMethodName)