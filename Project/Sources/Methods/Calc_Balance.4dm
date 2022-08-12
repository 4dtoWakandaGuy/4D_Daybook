//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_Balance
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vBalance)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_Balance")
vBalance:=0
FIRST RECORD:C50([ACCOUNT_BALANCES:34])
While (Not:C34(End selection:C36([ACCOUNT_BALANCES:34])))
	vBalance:=Round:C94((vBalance+[ACCOUNT_BALANCES:34]Balance:3); 2)
	NEXT RECORD:C51([ACCOUNT_BALANCES:34])
End while 
ERR_MethodTrackerReturn("Calc_Balance"; $_t_oldMethodName)
