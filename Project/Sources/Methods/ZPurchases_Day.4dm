//%attributes = {}
If (False:C215)
	//Project Method Name:      ZPurchases_Day
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

$_t_oldMethodName:=ERR_MethodTracker("ZPurchases_Day")
ZProc("Purchases_Day"; DB_ProcessMemoryinit(2); Term_SLPLWT("Purchases_Daybook"))
ERR_MethodTrackerReturn("ZPurchases_Day"; $_t_oldMethodName)
