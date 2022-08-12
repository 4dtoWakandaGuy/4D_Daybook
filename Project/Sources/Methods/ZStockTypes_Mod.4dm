//%attributes = {}
If (False:C215)
	//Project Method Name:      ZStockTypes_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2012 13:57
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

$_t_oldMethodName:=ERR_MethodTracker("ZStockTypes_Mod")
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[STOCK_TYPES:59])))
ERR_MethodTrackerReturn("ZStockTypes_Mod"; $_t_oldMethodName)