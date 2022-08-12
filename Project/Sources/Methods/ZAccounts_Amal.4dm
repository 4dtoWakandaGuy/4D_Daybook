//%attributes = {}
If (False:C215)
	//Project Method Name:      ZAccounts_Amal
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

$_t_oldMethodName:=ERR_MethodTracker("ZAccounts_Amal")
ZProc("Accounts_Amalgamate"; DB_ProcessMemoryinit(2); "Amalgamate Trans")
ERR_MethodTrackerReturn("ZAccounts_Amal"; $_t_oldMethodName)
