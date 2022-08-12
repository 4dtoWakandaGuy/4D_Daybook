If (False:C215)
	//object Name: [ACCOUNT_BALANCES]dCurrConv1.Variable5
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dCurrConv1.Variable5"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dCurrConv1.Variable5"; $_t_oldMethodName)