If (False:C215)
	//object Name: [WORKFLOW_CONTROL]Workflow_Control_In.Pop-up%2FDrop-down List2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/10/2010 10:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_TimeRequired;0)
	C_TEXT:C284($_t_oldMethodName; SEQ_TIMERequired)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.oReserveTimeScalesDown"; Form event code:C388)
If (SD2_at_TimeRequired>0)
	Form:C1466.timerequired:=SD2_at_TimeRequired{SD2_at_TimeRequired}
	OBJECT SET VISIBLE:C603(*; "oWFReserveDays@"; (SD2_at_TimeRequired=1))
	OBJECT SET VISIBLE:C603(*; "oWFReserveHours@"; (SD2_at_TimeRequired=2))
	OBJECT SET VISIBLE:C603(*; "oWFReserveMinutes@"; (SD2_at_TimeRequired=3))
	
	Case of 
			
			
		: (SD2_at_TimeRequired=1)
			[WORKFLOW_CONTROL:51]TimeNeededDAYS:14:=Old:C35([WORKFLOW_CONTROL:51]TimeNeededDAYS:14)
			[WORKFLOW_CONTROL:51]TimeNeededHours:15:=0
			[WORKFLOW_CONTROL:51]TimeNeededMinutes:16:=0
		: (SD2_at_TimeRequired=2)
			[WORKFLOW_CONTROL:51]TimeNeededHours:15:=Old:C35([WORKFLOW_CONTROL:51]TimeNeededHours:15)
			[WORKFLOW_CONTROL:51]TimeNeededMinutes:16:=0
			[WORKFLOW_CONTROL:51]TimeNeededDAYS:14:=0
		: (SD2_at_TimeRequired=3)
			[WORKFLOW_CONTROL:51]TimeNeededMinutes:16:=Old:C35([WORKFLOW_CONTROL:51]TimeNeededMinutes:16)
			[WORKFLOW_CONTROL:51]TimeNeededHours:15:=0
			[WORKFLOW_CONTROL:51]TimeNeededDAYS:14:=0
	End case 
	SD2_at_TimeRequired{0}:=SD2_at_TimeRequired{SD2_at_TimeRequired}
	SD2_at_TimeRequired:=0
	OBJECT SET VISIBLE:C603(*; "oReserveTimeScale"; False:C215)
	
End if 
ERR_MethodTrackerReturn("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.oReserveTimeScalesDown"; $_t_oldMethodName)
