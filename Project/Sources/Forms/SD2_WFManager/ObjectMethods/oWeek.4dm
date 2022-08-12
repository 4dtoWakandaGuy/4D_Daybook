If (False:C215)
	//object Name: Object Name:      SD2_WFManager.oWeek
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 12:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SD2_D_CurrentDateEnd; SD2_D_CurrentDateStart; SD2_D_CurrentHighlightDay)
	C_LONGINT:C283($_l_AgendaArea; $_l_DayNumber; SD2_l_CalenderArea; SD2_l_CurrentScheduleView)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD2_WFManager.oWeek"; Form event code:C388)

$_l_AgendaArea:=SD2_l_CalenderArea
SD2_l_CurrentScheduleView:=2
$_l_DayNumber:=Day number:C114(SD2_D_CurrentHighlightDay)
Case of 
	: ($_l_DayNumber=7)
		SD2_D_CurrentDateStart:=SD2_D_CurrentHighlightDay-6
	: ($_l_DayNumber=6)
		SD2_D_CurrentDateStart:=SD2_D_CurrentHighlightDay-5
	: ($_l_DayNumber=5)
		SD2_D_CurrentDateStart:=SD2_D_CurrentHighlightDay-4
	: ($_l_DayNumber=4)
		SD2_D_CurrentDateStart:=SD2_D_CurrentHighlightDay-3
	: ($_l_DayNumber=3)
		SD2_D_CurrentDateStart:=SD2_D_CurrentHighlightDay-2
	: ($_l_DayNumber=2)
		SD2_D_CurrentDateStart:=SD2_D_CurrentHighlightDay-1
	Else 
		SD2_D_CurrentDateStart:=SD2_D_CurrentHighlightDay
End case 
SD2_D_CurrentDateEnd:=SD2_D_CurrentDateStart+6
ERR_MethodTrackerReturn("OBJ SD2_WFManager.oWeek"; $_t_oldMethodName)
