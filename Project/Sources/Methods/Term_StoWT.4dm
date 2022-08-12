//%attributes = {}
If (False:C215)
	//Project Method Name:      Term_StoWT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2012 12:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TermInv)
	C_TEXT:C284($_t_oldMethodName; $_t_StockTableName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Term_StoWT")
$0:=$1

$_t_StockTableName:=$1
$0:=DB_GetTranslatedTerminology(Table:C252(->[STOCK_MOVEMENTS:40]); $_t_StockTableName)
If (False:C215)
	If (<>TermInv)
		$0:=Replace string:C233($0; "Stock Control"; "Inventory")
		$0:=Replace string:C233($0; "Stock"; "Inventory")
	End if 
End if 
ERR_MethodTrackerReturn("Term_StoWT"; $_t_oldMethodName)
