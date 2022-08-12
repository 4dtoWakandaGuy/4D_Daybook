If (False:C215)
	//object Name: [PERSONNEL]PER_DiarySetup.oPerTimeEndSetting
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD_bo_ChangePrefs)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].PER_DiarySetup.oPerTimeEndSetting"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		SD_bo_ChangePrefs:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].PER_DiarySetup.oPerTimeEndSetting"; $_t_oldMethodName)
