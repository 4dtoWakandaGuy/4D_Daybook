//%attributes = {}
If (False:C215)
	//Project Method Name:      ZPurchases_InP
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

$_t_oldMethodName:=ERR_MethodTracker("ZPurchases_InP")
ZProc("Purchases_InP"; DB_ProcessMemoryinit(2); "Purchase Pre-Payment")
ERR_MethodTrackerReturn("ZPurchases_InP"; $_t_oldMethodName)