//%attributes = {}
If (False:C215)
	//Project Method Name:      ZStockLev_Cons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/09/2010 09:49
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

$_t_oldMethodName:=ERR_MethodTracker("ZStockLev_Cons")
//NG -needs to be replacedNG
ZProc("StockLev_Cons"; DB_ProcessMemoryinit(2); Term_StoWT("Consolidate Stock"))
ERR_MethodTrackerReturn("ZStockLev_Cons"; $_t_oldMethodName)
