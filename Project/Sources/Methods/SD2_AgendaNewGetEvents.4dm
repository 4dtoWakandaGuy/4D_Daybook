//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_AgendaNewGetEvents
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
	//Array LONGINT(SD2_al_CurrentDiaryPerson;0)
	C_DATE:C307(SD2_D_CurrentDateEnd; SD2_D_CurrentDateStart)
	C_LONGINT:C283(SD_l_priorityQuery; SD2_l_DiaryInstanceUID; SD2_l_IncludeCompleted)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_AgendaNewGetEvents")

If (False:C215)
	SD2_LoadSchedule(SD2_l_DiaryInstanceUID; 0; SD2_D_CurrentDateStart; SD2_D_CurrentDateEnd; ->SD2_al_CurrentDiaryPerson; SD2_l_IncludeCompleted; SD_l_priorityQuery)
	SD2_BuildDiaryDisplayRecords(SD2_l_DiaryInstanceUID; SD2_D_CurrentDateStart; SD2_D_CurrentDateEnd)
End if 
ERR_MethodTrackerReturn("SD2_AgendaNewGetEvents"; $_t_oldMethodName)