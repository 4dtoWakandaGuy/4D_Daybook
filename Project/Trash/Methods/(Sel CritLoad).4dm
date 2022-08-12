//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel CritLoad
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; vT; vTitle12; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel CritLoad")
//Sel CritLoad
Menu_Record("Sel CritLoad"; "Load Criteria ...")
If (vTitle13#"")
	$_l_TableNumber:=Table:C252(vFilePtr)
	$_t_Search:="©"+("0"*(3-Length:C16(String:C10($_l_TableNumber))))+String:C10($_l_TableNumber)
	vTitle12:=Gen_Request("Load Criteria named ..."; vTitle12)
	If (OK=1)
		If (Length:C16(vTitle12)>26)
			vTitle12:=Substring:C12(vTitle12; 1; 26)
			Gen_Confirm("NB: Only the 1st 26 characters can be used - the name have been shortened to "+vTitle12; "OK"; "Cancel")
		End if 
		If (OK=1)
			$_t_Search:=$_t_Search+vTitle12
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_Search)
			If (Records in selection:C76([SCRIPTS:80])=0)
				$_t_Search:=Sel_AtSign($_t_Search)
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_Search)
			End if 
			If (Records in selection:C76([SCRIPTS:80])>0)
				If (Records in selection:C76([SCRIPTS:80])>1)
					Check_MinorFS("Saved Criteria"; ->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; ->[SCRIPTS:80]Person:5)
				End if 
				If (OK=1)
					vT:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0)
					Sel_CritLoadVar("cSIS+cNAA+cNAL+◊NAL+"+vTitle13)
				End if 
				UNLOAD RECORD:C212([SCRIPTS:80])
			Else 
				Gen_Alert("No Criteria have been saved with that name"; "Cancel")
			End if 
		End if 
	End if 
Else 
	Gen_Alert("Criteria cannot be Loaded for this File"; "Cancel")
End if 
ERR_MethodTrackerReturn("Sel CritLoad"; $_t_oldMethodName)