If (False:C215)
	//object Name: [USER]User_In.Variable92
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
	//C_UNKNOWN(APR_SPOrderAmount1)
	//C_UNKNOWN(APR_SPOrderAmount2)
	//C_UNKNOWN(APR_SPOrderAmount3)
	C_LONGINT:C283(APR_SPOrderAmount1; APR_SPOrderAmount2; APR_SPOrderAmount3; APR_SPOrderAmount0)
	C_REAL:C285(SP_R_OrderCostPlusPercent; SP_R_OrderCostPlusPercent)
	C_TEXT:C284(SP_t_OrderCostScript; $_t_oldMethodName; SP_t_OrderCostScript)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable92"; Form event code:C388)
If (SP_R_OrderCostPlusPercent#0)
	APR_SPOrderAmount3:=0
	APR_SPOrderAmount2:=1
	APR_SPOrderAmount1:=0
	APR_SPOrderAmount0:=0
	SP_t_OrderCostScript:=""
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable92"; $_t_oldMethodName)
