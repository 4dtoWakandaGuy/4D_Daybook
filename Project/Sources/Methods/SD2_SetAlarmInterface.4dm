//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SetAlarmInterface
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_ReminderTimes;0)
	C_BOOLEAN:C305($_bo_ShowReminders)
	C_LONGINT:C283($_l_OneDay; $_l_OneHour; $_l_ReminderTImeRow; SD2_l_CB_Alarmed; SD2_l_Completed; SD2_l_DiaryReminder)
	C_TEXT:C284($_t_oldMethodName; SD2_t_TimeFrame)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_SetAlarmInterface")

//[DIARY]Alarm_Timeframe
If (SD2_l_Completed=1) | ([DIARY:12]Done:14)  // we are recording a DONE action or this is a done action
	//the reminder options are not applicable
	OBJECT SET VISIBLE:C603(*; "oReminder@"; False:C215)
Else 
	//The reminders are only applicable if this is a future event
	$_bo_ShowReminders:=False:C215
	Case of 
		: ([DIARY:12]Date_Do_From:4>Current date:C33(*))
			$_bo_ShowReminders:=True:C214
		: ([DIARY:12]Date_Do_From:4=Current date:C33(*))
			If ([DIARY:12]Time_Do_From:6>Current time:C178(*))
				$_bo_ShowReminders:=True:C214
			End if 
	End case 
	If ($_bo_ShowReminders)
		OBJECT SET VISIBLE:C603(*; "oReminder@"; True:C214)
		If (SD2_l_CB_Alarmed=1)
			OBJECT SET VISIBLE:C603(SD2_l_DiaryReminder; True:C214)
			OBJECT SET VISIBLE:C603(SD2_at_ReminderTimes; True:C214)
			//calculate the
			//time frame value
			If (SD2_at_ReminderTimes=0)
				$_l_ReminderTImeRow:=Find in array:C230(SD2_at_ReminderTimes; SD2_t_TimeFrame)
				If ($_l_ReminderTImeRow>0)
					SD2_at_ReminderTimes:=$_l_ReminderTImeRow
				Else 
					SD2_at_ReminderTimes:=1  //minutes
				End if 
			End if 
			Case of 
				: (SD2_at_ReminderTimes=3)  // Days
					$_l_OneDay:=24*60
					[DIARY:12]Alarm_Timeframe:48:=SD2_l_DiaryReminder*$_l_OneDay
				: (SD2_at_ReminderTimes=2)  //Hours
					$_l_OneHour:=60
					[DIARY:12]Alarm_Timeframe:48:=SD2_l_DiaryReminder*$_l_OneHour
				Else 
					[DIARY:12]Alarm_Timeframe:48:=SD2_l_DiaryReminder  //minutes
			End case 
			
		Else 
			OBJECT SET VISIBLE:C603(SD2_l_DiaryReminder; False:C215)
			OBJECT SET VISIBLE:C603(SD2_at_ReminderTimes; False:C215)
		End if 
		
	Else 
		OBJECT SET VISIBLE:C603(*; "oReminder@"; False:C215)
	End if 
	
	
End if 
ERR_MethodTrackerReturn("SD2_SetAlarmInterface"; $_t_oldMethodName)
