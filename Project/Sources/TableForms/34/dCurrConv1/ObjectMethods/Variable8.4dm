If (False:C215)
	//object Name: [ACCOUNT_BALANCES]dCurrConv1.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2011 05:29
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dCurrConv1.Variable8"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dCurrConv1.Variable8"; $_t_oldMethodName)