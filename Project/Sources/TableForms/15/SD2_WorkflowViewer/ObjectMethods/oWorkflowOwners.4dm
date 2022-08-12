If (False:C215)
	//object Name: [USER]SD2_WorkflowViewer.oWorkflowOwners
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/03/2010 14:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_SelectedWorflowOwners;0)
	//ARRAY TEXT(SD2_at_WorkflowOwnerNames;0)
	//ARRAY TEXT(SD2_at_WorkflowOwners;0)
	C_LONGINT:C283(SD2_l_IncludeFuture; SD2_l_IncludeOverdue)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_WorkflowViewer.oWorkflowOwners"; Form event code:C388)
If (SD2_at_WorkflowOwnerNames>0)
	
	If (SD2_at_WorkflowOwners{SD2_at_WorkflowOwnerNames}#"")
		SET TIMER:C645(0)
		ARRAY TEXT:C222(SD2_at_SelectedWorflowOwners; 1)
		SD2_at_SelectedWorflowOwners{1}:=SD2_at_WorkflowOwners{SD2_at_WorkflowOwnerNames}
		SD2_GetWorkflowActions(->SD2_at_SelectedWorflowOwners; SD2_l_IncludeOverdue; SD2_l_IncludeFuture)
		SET TIMER:C645(60*60*2)
	Else 
		SET TIMER:C645(0)
		//have to bring up a selector window here
		SET TIMER:C645(60*60*2)
		
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_WorkflowViewer.oWorkflowOwners"; $_t_oldMethodName)
