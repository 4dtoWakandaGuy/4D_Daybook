//%attributes = {}
If (False:C215)
	//Project Method Name:      ZAccBal_PL_B
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("ZAccBal_PL_B")
ZProc("ACC_BalPLBudget"; DB_ProcessMemoryinit(3); Term_NLWT("P&L v Budgets"))
ERR_MethodTrackerReturn("ZAccBal_PL_B"; $_t_oldMethodName)
