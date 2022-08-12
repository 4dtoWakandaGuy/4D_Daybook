If (False:C215)
	//object Method Name: Object Name:      [USER].SD2_ScheduleWindow.oSHowTodo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 15:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; xNext)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oSHowTodo"; Form event code:C388)

$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Clicked:K2:4)
		xNext:=1
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		
		ZProc("SD2_workflow_Mod"; DB_ProcessMemoryinit(4); "Tasks awaiting actions")
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oSHowTodo"; $_t_oldMethodName)
