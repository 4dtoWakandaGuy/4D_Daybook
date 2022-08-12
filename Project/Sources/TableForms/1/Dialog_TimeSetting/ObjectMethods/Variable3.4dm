If (False:C215)
	//object Name: [CONTACTS]Dialog_TimeSetting.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_TimeSettingTypes;0)
	C_TEXT:C284($_t_oldMethodName; SD_t_TimeSettingType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Dialog_TimeSetting.Variable3"; Form event code:C388)
If (SD_at_TimeSettingTypes>0)
	SD_t_TimeSettingType:=SD_at_TimeSettingTypes{SD_at_TimeSettingTypes}
	SD_at_TimeSettingTypes:=0
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].Dialog_TimeSetting.Variable3"; $_t_oldMethodName)
