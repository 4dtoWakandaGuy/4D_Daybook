If (False:C215)
	//object Name: [USER]BK_FileOptions.Pop-up%2FDrop-down List25
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
	//ARRAY REAL(DM_ar_ContactTaxRate;0)
	//ARRAY TEXT(DM_at_ContactStageCode;0)
	//ARRAY TEXT(DM_at_ContactStageName;0)
	C_BOOLEAN:C305(DM_Bo_Modified)
	C_LONGINT:C283($_l_event; DM_l_CurrentOptions)
	C_REAL:C285(DM_R_ContactTaxRate)
	C_TEXT:C284($_t_oldMethodName; $_t_StageCode; DM_t_ContactStageCode; DM_t_ContactStageName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_FileOptions.Pop-up/Drop-down List25"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		If (DM_at_ContactStageName>0)
			$_t_StageCode:=DM_at_ContactStageCode{DM_at_ContactStageName}
			If ($_t_StageCode#DM_t_ContactStageCode)
				If (DM_t_ContactStageCode#"") & (DM_l_CurrentOptions>0)
					Gen_Confirm("Change default Credit stage from"+DM_t_ContactStageName+" to "+$_t_StageCode; "Yes"; "No")
					If (OK=1)
						DM_t_ContactStageCode:=DM_at_ContactStageCode{DM_at_ContactStageName}
						DM_t_ContactStageName:=DM_at_ContactStageName{DM_at_ContactStageName}
						DM_R_ContactTaxRate:=DM_ar_ContactTaxRate{DM_at_ContactStageName}
						DM_Bo_Modified:=True:C214
					End if 
				Else 
					DM_t_ContactStageCode:=DM_at_ContactStageCode{DM_at_ContactStageName}
					DM_t_ContactStageName:=DM_at_ContactStageName{DM_at_ContactStageName}
					DM_R_ContactTaxRate:=DM_ar_ContactTaxRate{DM_at_ContactStageName}
					
					DM_Bo_Modified:=True:C214
				End if 
			End if 
		End if 
End case 
DM_at_ContactStageName:=0
ERR_MethodTrackerReturn("OBJ [USER].BK_FileOptions.Pop-up/Drop-down List25"; $_t_oldMethodName)