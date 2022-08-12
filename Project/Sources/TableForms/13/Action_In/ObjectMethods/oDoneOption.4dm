If (False:C215)
	//object Name: [ACTIONS]Action_In.oDoneOption
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2013 23:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_DayNames;0)
	//ARRAY TEXT(SD2_at_DayNames2;0)
	//ARRAY TEXT(SD2_at_TimeType2;0)
	C_BOOLEAN:C305(SD2_bo_recordModified)
	C_LONGINT:C283($_l_event; CB_l_ExcludeNonWorking; CB_l_SetReminder; SD2_l_CBPostAction; SD2_l_ReminderTime)
	C_TEXT:C284($_t_oldMethodName; SD2_T_DayEnd; SD2_t_DayStart)
	C_TIME:C306(SD2_Ti_DayEnd; SD2_ti_TimeEnd; SD2_ti_TimeStart)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.oDoneOption"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		SD2_bo_recordModified:=True:C214
		If (SD2_l_CBPostAction=1)
			
			OBJECT SET ENTERABLE:C238(SD2_ti_TimeStart; False:C215)
			OBJECT SET ENTERABLE:C238(SD2_ti_TimeEnd; False:C215)
			OBJECT SET ENTERABLE:C238(SD2_t_DayStart; False:C215)
			OBJECT SET ENTERABLE:C238(SD2_Ti_DayEnd; False:C215)
			OBJECT SET VISIBLE:C603(SD2_at_DayNames; False:C215)
			OBJECT SET VISIBLE:C603(SD2_at_DayNames2; False:C215)
			OBJECT SET VISIBLE:C603(*; "oPicDayStart"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oPicDayEnd"; False:C215)
			OBJECT SET ENTERABLE:C238(CB_l_ExcludeNonWorking; False:C215)
			OBJECT SET ENTERABLE:C238(CB_l_SetReminder; False:C215)
			OBJECT SET ENTERABLE:C238(SD2_l_ReminderTime; False:C215)
			OBJECT SET VISIBLE:C603(SD2_at_TimeType2; False:C215)
			
			
			
		Else 
			OBJECT SET ENTERABLE:C238(SD2_ti_TimeStart; True:C214)
			OBJECT SET ENTERABLE:C238(SD2_ti_TimeEnd; True:C214)
			OBJECT SET ENTERABLE:C238(SD2_t_DayStart; True:C214)
			OBJECT SET ENTERABLE:C238(SD2_Ti_DayEnd; True:C214)
			OBJECT SET VISIBLE:C603(SD2_at_DayNames; True:C214)
			OBJECT SET VISIBLE:C603(SD2_at_DayNames2; True:C214)
			OBJECT SET VISIBLE:C603(*; "oPicDayStart"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oPicDayEnd"; True:C214)
			OBJECT SET ENTERABLE:C238(CB_l_ExcludeNonWorking; True:C214)
			OBJECT SET ENTERABLE:C238(CB_l_SetReminder; True:C214)
			OBJECT SET ENTERABLE:C238(SD2_l_ReminderTime; True:C214)
			OBJECT SET VISIBLE:C603(SD2_at_TimeType2; True:C214)
			
		End if 
		[ACTIONS:13]ActionRecordsCompletedEvent:37:=(SD2_l_CBPostAction=1)
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.oDoneOption"; $_t_oldMethodName)
