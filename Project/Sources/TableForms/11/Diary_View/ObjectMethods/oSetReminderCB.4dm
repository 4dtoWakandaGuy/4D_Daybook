If (False:C215)
	//object Name: [PERSONNEL]Diary_View.oSetReminderCB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.oSetReminderCB"; Form event code:C388)
If ([DIARY:12]Time_Do_From:6#?00:00:00?)
	SD_Updatereminder
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.oSetReminderCB"; $_t_oldMethodName)
