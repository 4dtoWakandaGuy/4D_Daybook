If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Pop-up%2FDrop-down List1
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
	//ARRAY LONGINT(SP_al_FilterProbability;0)
	C_DATE:C307(SP_D_FilterFromDate; SP_D_FilterToDate)
	C_LONGINT:C283(SP_l_GroupID; SP_l_PersonelID; SP_l_RelatedCompanyID; SP_l_SalesProjectionStateID)
	C_REAL:C285(SP_R_FilterProbability; SP_R_SalesProjectionPCT)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Pop-up/Drop-down List1"; Form event code:C388)
If (SP_al_FilterProbability>0)
	SP_R_SalesProjectionPCT:=SP_al_FilterProbability{SP_al_FilterProbability}
	SP_R_FilterProbability:=SP_R_SalesProjectionPCT
	SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
	
End if 
SP_al_FilterProbability:=0
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Pop-up/Drop-down List1"; $_t_oldMethodName)