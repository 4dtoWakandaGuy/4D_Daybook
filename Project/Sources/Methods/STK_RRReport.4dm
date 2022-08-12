//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_RRReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   22/06/2011 17:06 v8.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ORD_at_OrderCodes;0)
	//ARRAY TEXT(ORD_at_ProductCodes;0)
	//ARRAY TEXT(STK_at_MIProductCodes;0)
	//ARRAY TEXT(STK_at_MovementCodes;0)
	//ARRAY TEXT(STK_at_OrderCodes;0)
	C_REAL:C285($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_RRReport")

QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Date:4>=Current date:C33-(365+(365/2)))
SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; ORD_at_OrderCodes)
ARRAY TEXT:C222(ORD_at_ProductCodes; Size of array:C274(ORD_at_OrderCodes))


QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Order_Code:1; ORD_at_OrderCodes)
DISTINCT VALUES:C339([ORDER_ITEMS:25]Product_Code:2; STK_at_OrderCodes)
QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; STK_at_OrderCodes)
QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Maintain_Stock:14=True:C214)
SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; STK_at_OrderCodes)

QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Type:6="ISO"; *)
QUERY:C277([STOCK_MOVEMENTS:40];  & ; [STOCK_MOVEMENTS:40]Movement_Date:5>=Current date:C33-(365+(365/2)))

SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; STK_at_MovementCodes)
QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; STK_at_MovementCodes)
DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; STK_at_MIProductCodes)
For ($_l_Index; 1; Size of array:C274(STK_at_MIProductCodes))
	If (Find in array:C230(STK_at_OrderCodes; STK_at_MIProductCodes{$_l_Index})<0)
		APPEND TO ARRAY:C911(ORD_at_ProductCodes; STK_at_MIProductCodes{$_l_Index})
	End if 
End for 
QUERY WITH ARRAY:C644([STOCK_LEVELS:58]Product_Code:1; STK_at_OrderCodes)
QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2="P")
ERR_MethodTrackerReturn("STK_RRReport"; $_t_oldMethodName)
