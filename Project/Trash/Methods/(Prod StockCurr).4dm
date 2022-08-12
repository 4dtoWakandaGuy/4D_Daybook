//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Prod StockCurr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/09/2010 08:36
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

$_t_oldMethodName:=ERR_MethodTracker("Prod StockCurr")
Menu_Record("Prod StockCurr"; "Current Stock")
If (Modified record:C314([PRODUCTS:9]))
	DB_SaveRecord(->[PRODUCTS:9])
	AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
End if 
//◊AutoFind:=True
//◊AutoOut:=True
//◊AutoFile:="Products"
//◊ProdCode:=[PRODUCTS]Product Code
//ZStockCurr_Mod
//$StockProcess:=0
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CURRENT_STOCK:62])); 0; ""; ->[CURRENT_STOCK:62]Product_Code:1; [PRODUCTS:9]Product_Code:1)
ERR_MethodTrackerReturn("Prod StockCurr"; $_t_oldMethodName)
