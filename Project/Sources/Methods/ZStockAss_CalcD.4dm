//%attributes = {}
If (False:C215)
	//Project Method Name:      ZStockAss_CalcD
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
	C_TEXT:C284(<>ProdCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZStockAss_CalcD")
Menu_Record("ZStockAss_CalcD"; "Trial Assembly - Display")
<>ProdCode:=[PRODUCTS:9]Product_Code:1
ZProc("StockAss_CalcDP"; DB_ProcessMemoryinit(2); "Trial Assembly")
ERR_MethodTrackerReturn("ZStockAss_CalcD"; $_t_oldMethodName)