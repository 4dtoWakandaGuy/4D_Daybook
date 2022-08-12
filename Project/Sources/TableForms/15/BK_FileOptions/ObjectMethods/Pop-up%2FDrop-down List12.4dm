If (False:C215)
	//object Name: [USER]BK_FileOptions.Pop-up%2FDrop-down List12
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
	//ARRAY TEXT(DM_at_SOPriceGroupNames;0)
	//ARRAY TEXT(DM_at_SOPriceGroups;0)
	C_BOOLEAN:C305(DM_Bo_Modified)
	C_LONGINT:C283($_l_event; DM_l_CurrentOptions)
	C_TEXT:C284($_t_oldMethodName; $_t_PriceGroup; DM_t_ContactSOPriceGroupCode; DM_t_ContactSOPriceGroupName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_FileOptions.Pop-up/Drop-down List12"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		If (DM_at_SOPriceGroupNames>0)
			$_t_PriceGroup:=DM_at_SOPriceGroups{DM_at_SOPriceGroupNames}
			If ($_t_PriceGroup#DM_t_ContactSOPriceGroupCode)
				If (DM_t_ContactSOPriceGroupCode#"") & (DM_l_CurrentOptions>0)
					Gen_Confirm("Change default Purchase Price Group from"+DM_t_ContactSOPriceGroupName+" to "+$_t_PriceGroup; "Yes"; "No")
					If (OK=1)
						DM_t_ContactSOPriceGroupCode:=DM_at_SOPriceGroups{DM_at_SOPriceGroupNames}
						DM_t_ContactSOPriceGroupName:=DM_at_SOPriceGroupNames{DM_at_SOPriceGroupNames}
						
						DM_Bo_Modified:=True:C214
					End if 
				Else 
					DM_t_ContactSOPriceGroupCode:=DM_at_SOPriceGroups{DM_at_SOPriceGroupNames}
					DM_t_ContactSOPriceGroupName:=DM_at_SOPriceGroupNames{DM_at_SOPriceGroupNames}
					
					DM_Bo_Modified:=True:C214
				End if 
			End if 
		End if 
End case 
DM_at_SOPriceGroupNames:=0
ERR_MethodTrackerReturn("OBJ [USER].BK_FileOptions.Pop-up/Drop-down List12"; $_t_oldMethodName)