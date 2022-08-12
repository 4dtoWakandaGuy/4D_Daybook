If (False:C215)
	//Table Form Method Name: [WORKFLOW_CONTROL]Workflow_Control_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_OBJECT:C1216($_obj_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [WORKFLOW_CONTROL].Workflow_Control_In"; Form event code:C388)
$_obj_event:=FORM Event:C1606
Sequences_InLP($_obj_event.code)
ERR_MethodTrackerReturn("FM [WORKFLOW_CONTROL].Workflow_Control_In"; $_t_oldMethodName)
