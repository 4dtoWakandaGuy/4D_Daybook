//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_AllStSr2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2011 12:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ch1; vNo; vNo2; VrecNo; vSNo; vStockLevel; vStockUA)
	C_TEXT:C284($_t_oldMethodName; vStatus; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_AllStSr2")
//StockCurr_Sel3
STK_GetStockItemsP1
vNo2:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
vStockLevel:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
vStockUA:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
vTitle:=Uppercase:C13(Term_StoWT("CURRENT STOCK:  "+vStatus))
If (Record number:C243([ORDER_ITEMS:25])#VrecNo)
	GOTO RECORD:C242([ORDER_ITEMS:25]; vRecNo)
End if 
vSNo:=[ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28
If ((Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0) | (ch1=1))
	//StockCurr_Sel3
	STK_GetStockItemsP1
End if 
vNo:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
ERR_MethodTrackerReturn("OrderI_AllStSr2"; $_t_oldMethodName)