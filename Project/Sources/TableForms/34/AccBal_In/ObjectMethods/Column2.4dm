If (False:C215)
	//object Name: [ACCOUNT_BALANCES]AccBal_in.Column2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2011 18:01
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].AccBal_in.Column2"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].AccBal_in.Column2"; $_t_oldMethodName)