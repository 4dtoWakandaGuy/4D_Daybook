//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalPrintBlank
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vAccName)
	//C_UNKNOWN(vCode)
	C_REAL:C285(vBalance)
	C_TEXT:C284(vAccName; vCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalPrintBlank")
//ACC_BalPrintBlank
vCode:=""
vAccName:=""
vBalance:=0
Print form:C5([ACCOUNT_BALANCES:34]; "PL_Detail"; Form detail:K43:1)
ERR_MethodTrackerReturn("ACC_BalPrintBlank"; $_t_oldMethodName)
