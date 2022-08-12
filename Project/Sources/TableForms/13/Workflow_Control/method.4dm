If (False:C215)
	//Table Form Method Name: [ACTIONS]Workflow_Control
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ACTIONS].Workflow_Control"; Form event code:C388)
ERR_MethodTrackerReturn("FM [ACTIONS].Workflow_Control"; $_t_oldMethodName)