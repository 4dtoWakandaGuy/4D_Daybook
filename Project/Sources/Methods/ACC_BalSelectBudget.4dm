//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalSelectBudget
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
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalSelectBudget")
DB_t_CurrentFormUsage:="Budget"
CREATE SET:C116([ACCOUNT_BALANCES:34]; "Master")
ACC_BalSelect
USE SET:C118("Master")
ERR_MethodTrackerReturn("ACC_BalSelectBudget"; $_t_oldMethodName)
