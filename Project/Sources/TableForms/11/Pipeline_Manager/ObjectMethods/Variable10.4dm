If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable10
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
	C_LONGINT:C283($_l_CompanyID; SP_l_GroupID; SP_l_PersonelID; SP_l_RelatedCompanyID; SP_l_RelatedContactID; SP_l_SalesProjectionStateID)
	C_REAL:C285(SP_R_FilterProbability)
	C_TEXT:C284($_t_oldMethodName; SP_t_CompanyName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable10"; Form event code:C388)
$_l_CompanyID:=Check_CompanyID(->SP_t_CompanyName; ->SP_l_RelatedContactID; ->[PERSONNEL:11])
If ($_l_CompanyID>0)
	SP_l_RelatedCompanyID:=$_l_CompanyID
	SP_t_CompanyName:=SP_LoadCompany(SP_l_RelatedCompanyID)
End if 
SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Variable10"; $_t_oldMethodName)
