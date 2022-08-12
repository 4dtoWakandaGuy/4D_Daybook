If (False:C215)
	//object Name: [USER]BK_FileOptions.Pop-up%2FDrop-down List16
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DM_at_ContactRoleCode;0)
	//ARRAY TEXT(DM_at_ContactRoleName;0)
	C_BOOLEAN:C305(DM_Bo_Modified)
	C_LONGINT:C283($_l_event; DM_l_CurrentOptions)
	C_TEXT:C284($_t_ContactRole; $_t_oldMethodName; DM_t_ContactRoleCode; DM_t_ContactRoleName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_FileOptions.Pop-up/Drop-down List16"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		If (DM_at_ContactRoleName>0)
			$_t_ContactRole:=DM_at_ContactRoleCode{DM_at_ContactRoleName}
			If ($_t_ContactRole#DM_t_ContactRoleCode)
				If (DM_t_ContactRoleCode#"") & (DM_l_CurrentOptions>0)
					Gen_Confirm("Change default Contact Role from"+DM_t_ContactRoleName+" to "+$_t_ContactRole; "Yes"; "No")
					If (OK=1)
						DM_t_ContactRoleCode:=DM_at_ContactRoleCode{DM_at_ContactRoleName}
						DM_t_ContactRoleName:=DM_at_ContactRoleName{DM_at_ContactRoleName}
						DM_Bo_Modified:=True:C214
					End if 
				Else 
					DM_t_ContactRoleCode:=DM_at_ContactRoleCode{DM_at_ContactRoleName}
					DM_t_ContactRoleName:=DM_at_ContactRoleName{DM_at_ContactRoleName}
					DM_Bo_Modified:=True:C214
				End if 
			End if 
		End if 
End case 
DM_at_ContactRoleName:=0
ERR_MethodTrackerReturn("OBJ [USER].BK_FileOptions.Pop-up/Drop-down List16"; $_t_oldMethodName)