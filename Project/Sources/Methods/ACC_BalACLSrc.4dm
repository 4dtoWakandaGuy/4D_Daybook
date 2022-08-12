//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalACLSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 09:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; vAnalCodeT; vLayer)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalACLSrc")

CREATE SET:C116([ACCOUNT_BALANCES:34]; "Master")
Sel_SIString(->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]Analysis_Code:1; ACC_t_AnalysisCodeFrom; vAnalCodeT)
Sel_SCurr(->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]Currency_Code:6; ACC_t_CurrencyCode)
Sel_SLayer(->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]Layer_Code:5; vLayer)
USE SET:C118("Master")
ERR_MethodTrackerReturn("ACC_BalACLSrc"; $_t_oldMethodName)
