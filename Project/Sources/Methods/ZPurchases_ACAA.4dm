//%attributes = {}
If (False:C215)
	//Project Method Name:      ZPurchases_ACAA
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

$_t_oldMethodName:=ERR_MethodTracker("ZPurchases_ACAA")
ZProc("Purchases_ACAA"; DB_ProcessMemoryinit(2); Term_SLPLWT("Aged Creditors as at"))
ERR_MethodTrackerReturn("ZPurchases_ACAA"; $_t_oldMethodName)
