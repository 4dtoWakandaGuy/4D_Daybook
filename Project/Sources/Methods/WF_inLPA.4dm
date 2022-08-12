//%attributes = {}
If (False:C215)
	//Project Method Name:      WF_inLPA
	//------------------ Method Notes ------------------
	//This method executes when saving a Workflow Record.
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 07:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array LONGINT(WFM_al_WorkflowTables;0)
	//Array TEXT(WFM_at_ScriptCodes;0)
	//Array TEXT(WFM_at_ScriptNames;0)
	//Array TEXT(WFM_at_WorkflowTables;0)
	C_LONGINT:C283(SD2_l_CBonChangeState; SD2_l_CBoncreateNewrecord; SD2_l_CBonDeleterecord; SD2_l_CBonUpdaterecord)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WF_inLPA")
SET BLOB SIZE:C606([WORKFLOW_CONTROL:51]WF_Control:17; 0)


VARIABLE TO BLOB:C532(WFM_at_WorkflowTables; [WORKFLOW_CONTROL:51]WF_Control:17; *)
VARIABLE TO BLOB:C532(WFM_al_WorkflowTables; [WORKFLOW_CONTROL:51]WF_Control:17; *)
VARIABLE TO BLOB:C532(WFM_at_ScriptNames; [WORKFLOW_CONTROL:51]WF_Control:17; *)
VARIABLE TO BLOB:C532(WFM_at_ScriptCodes; [WORKFLOW_CONTROL:51]WF_Control:17; *)
VARIABLE TO BLOB:C532(SD2_l_CBoncreateNewrecord; [WORKFLOW_CONTROL:51]WF_Control:17; *)
VARIABLE TO BLOB:C532(SD2_l_CBonUpdaterecord; [WORKFLOW_CONTROL:51]WF_Control:17; *)
VARIABLE TO BLOB:C532(SD2_l_CBonChangeState; [WORKFLOW_CONTROL:51]WF_Control:17; *)
VARIABLE TO BLOB:C532(SD2_l_CBonDeleterecord; [WORKFLOW_CONTROL:51]WF_Control:17; *)
ERR_MethodTrackerReturn("WF_inLPA"; $_t_oldMethodName)