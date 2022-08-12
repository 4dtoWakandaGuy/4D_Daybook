
If (False:C215)
	//Object Name:      [WORKFLOW_Campaign].Campaign_Entry.oParticipAnts1
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_At_DiaryCode;0)
	C_BOOLEAN:C305(WF_BO_MODIFIED; WFM_bo_InDC)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_TEXT:C284($_t_DiaryCode; $_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY]WF_TaskManager.oWorkflowActions"; Form event code:C388)
Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		
		
		
		LISTBOX GET CELL POSITION:C971(*; "oWorkflowActions"; $_l_Row; $_l_Column)
		
		If ($_l_Row>0)
			WFM_bo_InDC:=True:C214
			SET TIMER:C645(0)
			$_t_DiaryCode:=SD2_At_DiaryCode{$_l_Row}
			WF_LaunchWorkflowAction($_t_DiaryCode; Current process:C322)
			HIDE PROCESS:C324(Current process:C322)
			
			
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [DIARY]WF_TaskManager.oWorkflowActions"; $_t_oldMethodName)
