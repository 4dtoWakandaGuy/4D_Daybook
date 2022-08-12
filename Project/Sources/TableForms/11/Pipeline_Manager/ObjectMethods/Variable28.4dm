If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable28
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SP_al_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	C_DATE:C307(SP_D_FilterFromDate; SP_D_FilterToDate)
	C_LONGINT:C283($_l_event; SP_l_GroupID; SP_l_PersonelID; SP_l_RelatedCompanyID; SP_l_SalesProjectionStateID)
	C_REAL:C285(SP_R_FilterProbability)
	C_TEXT:C284($_t_oldMethodName; SP_t_FilterStatus)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable28"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SP_at_ListPipelineStatus>0)
			SP_t_FilterStatus:=SP_at_ListPipelineStatus{SP_at_ListPipelineStatus}
			SP_l_SalesProjectionStateID:=SP_al_ListPipelineStatus{SP_at_ListPipelineStatus}
			SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Variable28"; $_t_oldMethodName)
