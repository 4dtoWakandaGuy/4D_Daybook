If (False:C215)
	//object Name: [USER]SD2_TabSettingForm.oFormNameSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/11/2012 16:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_FormID;0)
	//ARRAY LONGINT(SD_al_FormReferenceID;0)
	//ARRAY TEXT(SD2_at_DisplayedFormNames;0)
	C_BOOLEAN:C305(SD_bo_TabItemsModified)
	C_LONGINT:C283(SD_l_CurrentTab)
	C_TEXT:C284($_t_oldMethodName; SD2_t_VirtualFormName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_TabSettingForm.oFormNameSelect"; Form event code:C388)

If (SD2_at_DisplayedFormNames>0)
	If (SD2_at_DisplayedFormNames{SD2_at_DisplayedFormNames}="Other...")
		//need to select the default names.
	Else 
		SD_al_FormID{SD_l_CurrentTab}:=SD_al_FormReferenceID{SD2_at_DisplayedFormNames}
		SD_bo_TabItemsModified:=True:C214
		SD2_t_VirtualFormName:=SD2_at_DisplayedFormNames{SD2_at_DisplayedFormNames}
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_TabSettingForm.oFormNameSelect"; $_t_oldMethodName)
