//%attributes = {}
If (False:C215)
	//Project Method Name:      ZAccBal_Check
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2010 15:31
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

$_t_oldMethodName:=ERR_MethodTracker("ZAccBal_Check")
//ZACC_BalCheck


ZProc("ACC_ValidateBalances"; DB_ProcessMemoryinit(6); "Check Acc Balances")
ERR_MethodTrackerReturn("ZAccBal_Check"; $_t_oldMethodName)
