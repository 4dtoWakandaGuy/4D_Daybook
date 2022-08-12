//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalBudget
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/08/2010 17:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalBudget")
//Acc_BalBudget

DBI_MenuDisplayRecords("ACC BALANCESBUDGETS")
ERR_MethodTrackerReturn("Acc_BalBudget"; $_t_oldMethodName)
