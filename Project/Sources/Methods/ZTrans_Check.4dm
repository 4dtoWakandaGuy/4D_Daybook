//%attributes = {}
If (False:C215)
	//Project Method Name:      ZTrans_Check
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/11/2010 22:34
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

$_t_oldMethodName:=ERR_MethodTracker("ZTrans_Check")
DBI_MenuDisplayRecords("TransactionsCheck")
ERR_MethodTrackerReturn("ZTrans_Check"; $_t_oldMethodName)