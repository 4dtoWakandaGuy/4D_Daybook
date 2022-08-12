If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable15
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
	C_BOOLEAN:C305(<>NoUpdate)
	C_DATE:C307(SP_D_tFilterFromDate; SP_D_tFilterToDate)
	C_LONGINT:C283(SP_l_tFilterStatus; SP_l_tFilterType; SP_l_tGroupID; SP_l_tPersonelID; SP_l_tSalesProjectionStateID)
	C_REAL:C285(SP_R_tFilterProbability)
	C_TEXT:C284($_t_oldMethodName; SP_t_AdHocName; SP_t_tFilterStatus)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable15"; Form event code:C388)
SP_t_tFilterStatus:=""
SP_l_tFilterStatus:=0
SP_D_tFilterFromDate:=!00-00-00!
SP_D_tFilterToDate:=!00-00-00!
SP_R_tFilterProbability:=0
SP_l_tSalesProjectionStateID:=0
SP_l_tFilterType:=0

<>NoUpdate:=False:C215
SP_FindTargets(SP_l_tPersonelID; SP_l_tGroupID; SP_t_AdHocName; SP_D_TFilterFromDate; SP_D_TFilterToDate; ->SP_l_tSalesProjectionStateID; SP_l_tFilterType)

//note that although there are other filters(company etc)
//these are cleared elsewhere
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Variable15"; $_t_oldMethodName)
