If (False:C215)
	//object Name: [WORKFLOW_CONTROL]Workflow_Control_In.oInactive1
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
	C_LONGINT:C283(r3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.oInactive"; Form event code:C388)
If (r3=1)
	[WORKFLOW_CONTROL:51]Display:6:=3
End if 
ERR_MethodTrackerReturn("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.oInactive"; $_t_oldMethodName)
