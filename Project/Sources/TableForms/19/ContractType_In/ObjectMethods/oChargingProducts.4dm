If (False:C215)
	//object Name: [CONTRACT_TYPES]ContractType_In.oChargingProducts
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACT_TYPES].ContractType_In.oChargingProducts"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [CONTRACT_TYPES].ContractType_In.oChargingProducts"; $_t_oldMethodName)