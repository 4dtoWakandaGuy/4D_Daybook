If (False:C215)
	//object Name: [ACCOUNT_BALANCES]dCurrConv.oRateType
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dCurrConv.oRateType"; Form event code:C388)
//Check_Lists (->vType_;"Rate Types")
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dCurrConv.oRateType"; $_t_oldMethodName)
