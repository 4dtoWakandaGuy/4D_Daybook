If (False:C215)
	//object Name: [DIARY]Diary_AlarmManager.Button2
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_AlarmManager.Button2"; Form event code:C388)
SD_l_alarmPostpone:=-10
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_AlarmManager.Button2"; $_t_oldMethodName)