//%attributes = {}
If (False:C215)
	//Project Method Name:      ZStockCurr_List
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

$_t_oldMethodName:=ERR_MethodTracker("ZStockCurr_List")
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CURRENT_STOCK:62])))

//ZProc("StockCurr_List"; DB_ProcessMemoryinit(2); Term_StoWT("Current Stock_List"))
ERR_MethodTrackerReturn("ZStockCurr_List"; $_t_oldMethodName)
