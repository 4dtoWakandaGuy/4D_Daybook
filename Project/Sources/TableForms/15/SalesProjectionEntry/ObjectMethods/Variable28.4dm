If (False:C215)
	//object Name: [USER]SalesProjectionEntry.Variable28
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SP_al_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	C_LONGINT:C283($_l_event; SP_l_SalesProjectionStateID)
	C_TEXT:C284($_t_oldMethodName; SP_t_SalesProjectionState)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SalesProjectionEntry.Variable28"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SP_at_ListPipelineStatus>0)
			SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{SP_at_ListPipelineStatus}
			SP_l_SalesProjectionStateID:=SP_al_ListPipelineStatus{SP_at_ListPipelineStatus}
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SalesProjectionEntry.Variable28"; $_t_oldMethodName)
