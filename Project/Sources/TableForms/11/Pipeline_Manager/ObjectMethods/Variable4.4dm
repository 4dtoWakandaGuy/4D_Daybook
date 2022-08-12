If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable4
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
	C_DATE:C307(SP_D_FilterFromDate; SP_D_FilterToDate)
	C_LONGINT:C283(SP_l_FilterStatus; SP_l_GroupID; SP_l_PersonelID; SP_l_RelatedCompanyID; SP_l_SalesProjectionStateID)
	C_REAL:C285(SP_R_FilterProbability)
	C_TEXT:C284($_t_oldMethodName; SP_t_CompanyName; SP_t_FilterStatus)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable4"; Form event code:C388)
SP_t_FilterStatus:=""
SP_l_FilterStatus:=0
SP_D_FilterFromDate:=!00-00-00!
SP_D_FilterToDate:=!00-00-00!
SP_R_FilterProbability:=0
SP_l_SalesProjectionStateID:=0
SP_l_RelatedCompanyID:=0
SP_t_CompanyName:=""
SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Variable4"; $_t_oldMethodName)
