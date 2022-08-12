//%attributes = {}
If (False:C215)
	//Project Method Name:      ZStockAss_In
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

$_t_oldMethodName:=ERR_MethodTracker("ZStockAss_In")
DB_MenuNewRecord("StockMovementsAssembly")

//ZProc("StockAss_In"; DB_ProcessMemoryinit(4); "Enter Assembly")
ERR_MethodTrackerReturn("ZStockAss_In"; $_t_oldMethodName)