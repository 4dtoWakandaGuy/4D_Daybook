//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetStockItemsP2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetStockItemsP2")

If (<>StockAnal)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$1)
Else 
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27])  //
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
	If ($2=<>SYS_t_BaseCurrency)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$2; *)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29="")
	Else 
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$2)
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
	If ($3=DB_GetLedgerActualLayer)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$3; *)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27="")
	Else 
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$3)
	End if 
End if 
ERR_MethodTrackerReturn("STK_GetStockItemsP2"; $_t_oldMethodName)
