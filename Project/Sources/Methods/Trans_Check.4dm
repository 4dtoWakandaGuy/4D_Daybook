//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_Check
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:01
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

$_t_oldMethodName:=ERR_MethodTracker("Trans_Check")
DBI_MenuDisplayRecords("TransactionsCheck")
ERR_MethodTrackerReturn("Trans_Check"; $_t_oldMethodName)