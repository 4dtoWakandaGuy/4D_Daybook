If (False:C215)
	//object Name: [USER]BK_FileOptions.Pop-up%2FDrop-down List17
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
	//Array TEXT(DM_at_SOPriceGroups;0)
	//ARRAY TEXT(DM_at_ContactTYPE_PPG;0)
	//ARRAY TEXT(DM_at_ContactTYPE_SPG;0)
	//ARRAY TEXT(DM_at_ContactTypeCode;0)
	//ARRAY TEXT(DM_at_ContactTypeName;0)
	//ARRAY TEXT(DM_at_POPriceGroupCodes;0)
	//ARRAY TEXT(DM_at_POPriceGroups;0)
	//ARRAY TEXT(DM_at_SOPriceGroupNames;0)
	C_BOOLEAN:C305(DM_Bo_Modified)
	C_LONGINT:C283($_l_event; $_l_PriceGroupPosition; DM_l_CurrentOptions)
	C_TEXT:C284($_t_ContactType; $_t_oldMethodName; DM_t_ContactPOPriceGroupCode; DM_t_ContactSOPriceGroupCode; DM_t_ContactSOPriceGroupName; DM_t_ContactTypeCode; DM_t_ContactTypeName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_FileOptions.Pop-up/Drop-down List17"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (DM_at_ContactTypeName>0)
			$_t_ContactType:=DM_at_ContactTypeName{DM_at_ContactTypeName}
			If ($_t_ContactType#DM_t_ContactTypeName)
				If (DM_t_ContactTypeName#"") & (DM_l_CurrentOptions>0)
					Gen_Confirm("Change default Contact type  from"+DM_t_ContactTypeName+" to "+$_t_ContactType; "Yes"; "No")
					If (OK=1)
						DM_t_ContactTypeName:=$_t_ContactType
						DM_t_ContactTypeCode:=DM_at_ContactTypeCode{DM_at_ContactTypeName}
						If (DM_t_ContactSOPriceGroupCode="")
							$_l_PriceGroupPosition:=Find in array:C230(DM_at_SOPriceGroups; DM_at_ContactTYPE_SPG{DM_at_ContactTypeName})
							If ($_l_PriceGroupPosition>0)
								DM_t_ContactSOPriceGroupCode:=DM_at_SOPriceGroups{$_l_PriceGroupPosition}
								DM_t_ContactSOPriceGroupName:=DM_at_SOPriceGroupNames{$_l_PriceGroupPosition}
							End if 
						End if 
						If (DM_t_ContactPOPriceGroupCode="")
							$_l_PriceGroupPosition:=Find in array:C230(DM_at_POPriceGroups; DM_at_ContactTYPE_PPG{DM_at_ContactTypeName})
							If ($_l_PriceGroupPosition>0)
								DM_t_ContactPOPriceGroupCode:=DM_at_POPriceGroups{$_l_PriceGroupPosition}
								DM_t_ContactSOPriceGroupName:=DM_at_POPriceGroupCodes{$_l_PriceGroupPosition}
							End if 
						End if 
						DM_Bo_Modified:=True:C214
					End if 
				Else 
					DM_t_ContactTypeName:=$_t_ContactType
					DM_t_ContactTypeCode:=DM_at_ContactTypeCode{DM_at_ContactTypeName}
					If (DM_t_ContactSOPriceGroupCode="")
						$_l_PriceGroupPosition:=Find in array:C230(DM_at_SOPriceGroups; DM_at_ContactTYPE_SPG{DM_at_ContactTypeName})
						If ($_l_PriceGroupPosition>0)
							DM_t_ContactSOPriceGroupCode:=DM_at_SOPriceGroups{$_l_PriceGroupPosition}
							DM_t_ContactSOPriceGroupName:=DM_at_SOPriceGroupNames{$_l_PriceGroupPosition}
						End if 
					End if 
					If (DM_t_ContactPOPriceGroupCode="")
						$_l_PriceGroupPosition:=Find in array:C230(DM_at_POPriceGroups; DM_at_ContactTYPE_PPG{DM_at_ContactTypeName})
						If ($_l_PriceGroupPosition>0)
							DM_t_ContactPOPriceGroupCode:=DM_at_POPriceGroups{$_l_PriceGroupPosition}
							DM_t_ContactSOPriceGroupName:=DM_at_POPriceGroupCodes{$_l_PriceGroupPosition}
						End if 
					End if 
					
					DM_Bo_Modified:=True:C214
				End if 
			End if 
		End if 
End case 
DM_at_ContactTypeName:=0
ERR_MethodTrackerReturn("OBJ [USER].BK_FileOptions.Pop-up/Drop-down List17"; $_t_oldMethodName)