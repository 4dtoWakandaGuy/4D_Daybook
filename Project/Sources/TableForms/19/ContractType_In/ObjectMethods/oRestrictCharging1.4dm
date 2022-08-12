If (False:C215)
	//object Name: [CONTRACT_TYPES]ContractType_In.oRestrictCharging1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(CNT_l_SHowChargeActions)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACT_TYPES].ContractType_In.oRestrictCharging1"; Form event code:C388)
CNT_l_SHowChargeActions:=0
FORM GOTO PAGE:C247(2)
ERR_MethodTrackerReturn("OBJ:ContractType_In,SVS_lb_RestrictCharging"; $_t_oldMethodName)