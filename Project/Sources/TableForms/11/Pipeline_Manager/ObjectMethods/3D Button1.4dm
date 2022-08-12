If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.3D Button1
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
	C_DATE:C307(SP_D_FilterFromDate; SP_D_FIltertoDate)
	C_LONGINT:C283(SP_l_GroupID; SP_l_PersonelID; SP_l_RelatedCompanyID; SP_l_SalesProjectionStateID)
	C_REAL:C285(SP_R_FilterProbability)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.3D Button1"; Form event code:C388)
GEN_CalInProcess(0; SP_D_FiltertoDate; "SP_D_FiltertoDate")
SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.3D Button1"; $_t_oldMethodName)