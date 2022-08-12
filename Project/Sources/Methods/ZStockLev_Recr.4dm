//%attributes = {}
If (False:C215)
	//Project Method Name:      ZStockLev_Recr
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

$_t_oldMethodName:=ERR_MethodTracker("ZStockLev_Recr")
ZProc("StockLev_Recr"; DB_ProcessMemoryinit(2); "Recreate Levels")
ERR_MethodTrackerReturn("ZStockLev_Recr"; $_t_oldMethodName)
