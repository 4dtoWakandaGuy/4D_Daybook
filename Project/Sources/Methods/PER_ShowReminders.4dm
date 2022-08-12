//%attributes = {}
If (False:C215)
	//Project Method Name:      PER_ShowReminders
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/03/2011 19:58 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_RunReminders; $_l_ShowNothing; $_l_ShowSchedule; $_l_ShowWorkflow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PER_ShowReminders")

$_l_ShowWorkflow:=0
$_l_ShowSchedule:=0
$_l_RunReminders:=0
$_l_ShowNothing:=0
Case of 
	: ([PERSONNEL:11]Startup_Diary:16=0)
		$_l_ShowNothing:=1
	: ([PERSONNEL:11]Startup_Diary:16=1)
		$_l_ShowSchedule:=1  // Value 1
	: ([PERSONNEL:11]Startup_Diary:16=2)
		$_l_ShowWorkflow:=1  //Value 2
	: ([PERSONNEL:11]Startup_Diary:16=3)
		$_l_ShowWorkflow:=1
		$_l_ShowSchedule:=1
	: ([PERSONNEL:11]Startup_Diary:16=4)  // reminders only=show nothing is set
		$_l_ShowWorkflow:=0  //
		$_l_ShowSchedule:=0
		$_l_RunReminders:=1  //Value 4
		$_l_ShowNothing:=1
	: ([PERSONNEL:11]Startup_Diary:16=5)  //Schedule and reminders
		$_l_ShowWorkflow:=0  //Value 1
		$_l_ShowSchedule:=1
		$_l_RunReminders:=1  //Value 4
	: ([PERSONNEL:11]Startup_Diary:16=6)  //WorkFlow and reminders
		$_l_ShowWorkflow:=1
		$_l_ShowSchedule:=0  // Value 2
		$_l_RunReminders:=1  //Value 4
	: ([PERSONNEL:11]Startup_Diary:16=7)  //WorkFlow  Schedule and reminders
		$_l_ShowWorkflow:=1  //Value 1
		$_l_ShowSchedule:=1  //Value 2
		$_l_RunReminders:=1  //Value 4
End case 
$0:=($_l_ShowWorkflow=1)
ERR_MethodTrackerReturn("PER_ShowReminders"; $_t_oldMethodName)
