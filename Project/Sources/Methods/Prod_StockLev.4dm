//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_StockLev
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
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_TEXT:C284(<>AutoFile; <>ProdCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_StockLev")
Menu_Record("Prod_StockLev"; "Stock Levels")
If (Modified record:C314([PRODUCTS:9]))
	DB_SaveRecord(->[PRODUCTS:9])
	AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
End if 
<>AutoFind:=True:C214
<>DB_bo_AutoOut:=True:C214
<>AutoFile:="Products"
<>ProdCode:=[PRODUCTS:9]Product_Code:1
ZStockLev_Mod
ERR_MethodTrackerReturn("Prod_StockLev"; $_t_oldMethodName)