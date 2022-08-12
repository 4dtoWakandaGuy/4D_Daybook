If (False:C215)
	//object Name: [DIARY]Diary_AlarmManager.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(SD_l_alarmPostpone)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_AlarmManager.Button1"; Form event code:C388)
If (SD_l_alarmPostpone=0)
	SD_l_alarmPostpone:=5
End if 
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_AlarmManager.Button1"; $_t_oldMethodName)