If (False:C215)
	//object Name: [ACCOUNT_BALANCES]dCurrConv1.Button2
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dCurrConv1.Button2"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dCurrConv1.Button2"; $_t_oldMethodName)