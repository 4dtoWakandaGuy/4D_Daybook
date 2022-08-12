//%attributes = {}
If (False:C215)
	//Project Method Name:      ZAcc_BalBudget
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/09/2010 11:04
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

$_t_oldMethodName:=ERR_MethodTracker("ZAcc_BalBudget")
//Replaced with a call to DB_menudisplayrecords
ZProc("Acc_BalBudget"; DB_ProcessMemoryinit(2); "Set up Budgets")
ERR_MethodTrackerReturn("ZAcc_BalBudget"; $_t_oldMethodName)