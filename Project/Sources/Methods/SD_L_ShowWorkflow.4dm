//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_l_ShowWorkflow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/10/2010 15:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SYS_l_WorkflowProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_l_ShowWorkflow")

<>SYS_l_WorkflowProcess:=ZProc_withReply("SD2_workflow_Mod"; DB_ProcessMemoryinit(4); "Tasks awaiting actions")
ERR_MethodTrackerReturn("SD_l_ShowWorkflow"; $_t_oldMethodName)