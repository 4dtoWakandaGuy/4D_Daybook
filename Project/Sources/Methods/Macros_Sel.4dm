//%attributes = {}
If (False:C215)
	//Project Method Name:      Macros_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/03/2010 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>AutoProc; $_l_TableNumber; vP; xNext)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>SerialNo; $_t_oldMethodName; $_t_ScriptName; $_t_Search; $_t_SearchAt; VSELPREV)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macros_Sel")
//Macros_Sel

Load_Fields

vP:=1
If (vSelPrev="•FSC")
	Macros_SelP
Else 
	If ((<>SerialNo#"") & (<>AutoProc=676767))
		$_t_ScriptName:="Script: "+<>SerialNo
		<>SerialNo:=""
		<>AutoProc:=0
	End if 
	$_t_Search:=Gen_SearchA("Code, Group, Name, F Key or Person:"; vSelPrev; "Find Macros"; $_t_ScriptName; ""; "")
	If (OK=1)
		If (xNext=0)
			vSelPrev:=$_t_Search
			If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
				ALL RECORDS:C47([SCRIPTS:80])
				
			Else 
				If ($_t_Search="Macro: @")
					$_t_Search:=Substring:C12($_t_Search; 8; 51)
					QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_Search)
					If (Records in selection:C76([SCRIPTS:80])=0)
						QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="IMA "+$_t_Search; *)
						QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ITX "+$_t_Search; *)
						QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ITO "+$_t_Search)
					End if 
				Else 
					$_t_SearchAt:=Sel_AtSign($_t_Search)
					Sel_NoAtAt(->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; $_t_Search; $_t_SearchAt)
					If (Records in selection:C76([SCRIPTS:80])=0)
						QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="IMA "+$_t_SearchAt; *)
						QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ITX "+$_t_SearchAt; *)
						QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ITO "+$_t_SearchAt)
					End if 
					If (Records in selection:C76([SCRIPTS:80])=0)
						QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Group:9=$_t_SearchAt)
						If (Records in selection:C76([SCRIPTS:80])=0)
							QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Person:5=$_t_SearchAt)
							If (Records in selection:C76([SCRIPTS:80])=0)
								QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Keystroke:3=$_t_Search; *)
								QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
								If (Records in selection:C76([SCRIPTS:80])=0)
									QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Keystroke:3=$_t_Search)
									If (Records in selection:C76([SCRIPTS:80])=0)
										If ($_t_Search="Unspecified")
											$_l_TableNumber:=0
										Else 
											$_l_TableNumber:=DB_GetTableNumFromNameString($_t_Search)
										End if 
										If ($_l_TableNumber>=0)
											QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=$_l_TableNumber)
										Else 
											QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Name:2=$_t_SearchAt)
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		Else 
			Macros_SelP
		End if 
	Else 
		vP:=0
	End if 
End if 
ERR_MethodTrackerReturn("Macros_Sel"; $_t_oldMethodName)
