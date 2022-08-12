If (False:C215)
	//object Name: [CONTRACTS]Contract_in.oContractChargable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CON_bo_Chargable; CON_cb_Chargable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.oContractChargable1"; Form event code:C388)

CON_bo_Chargable:=CON_cb_Chargable
ERR_MethodTrackerReturn("OBJ [CONTRACTS].Contract_in.oContractChargable1"; $_t_oldMethodName)