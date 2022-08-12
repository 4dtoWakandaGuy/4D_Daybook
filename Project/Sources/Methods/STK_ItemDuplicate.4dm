//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ItemDuplicate
	//------------------ Method Notes ------------------
	//when we use duplicate record on Stock items the DB_save record(pseudo trigger
	//it see values as changed
	//------------------ Revision Control ----------------
	//Date Created: 24/08/2012 19:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_IgnoreForCurrentStock; $_bo_InvertedMovementType; $_bo_SerialNumberWasonPrevious)
	C_DATE:C307($_d_DateReceived; $_d_DateShipped; $_d_HeaderDate; $_d_POItemExpectedDeliveryDate)
	C_LONGINT:C283($_l_AddtoCurrentStockID; $_l_CopiedFromID; $_l_ID; $_l_Index; $_l_ItemNumber; $_l_NonLinkedCopiedFromID; $_l_POItemNumber; $_l_RecordUpdateStamp; $_l_SalesOrderItemifAllocate; $_l_SalesOrderItemifUnallocate; $_l_StockItemThread)
	C_LONGINT:C283($_l_StockNumber; $_l_TakeFromCurrentStockID)
	C_REAL:C285($_r_AssemblyQuantity; $_r_CalledoffQuantity; $_r_ComponentQuantity; $_r_CostonPrevious; $_r_CostPrice; $_r_MovedQuantity; $_r_Quantity; $_r_ResidualStockQuantity; $_r_TotalCost)
	C_TEXT:C284($_t_AddtoStockType; $_t_AnalysisOnPrevious; $_t_CompanyTo; $_t_CurrencyonPrevious; $_t_HeaderAnalysis; $_t_HeaderCurrency; $_t_HeaderLayer; $_t_LayerOnPrevious; $_t_Location; $_t_LocationOnPrevious; $_t_MovementCode)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderCode; $_t_POCode; $_t_POItemDeliveryReference; $_t_productCode; $_t_SerialNumber; $_t_SOItemDeliveryReference; $_t_StockMovementType; $_t_TakeFromStockType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("STK_ItemDuplicate")
$_r_AssemblyQuantity:=[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14
$_r_CalledoffQuantity:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
$_t_CompanyTo:=[STOCK_MOVEMENT_ITEMS:27]Company_To:2
$_r_ComponentQuantity:=[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15
$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
$_d_DateReceived:=[STOCK_MOVEMENT_ITEMS:27]Date_Received:5
$_d_DateShipped:=[STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6
$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
$_r_MovedQuantity:=[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40
$_t_MovementCode:=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11
$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
$_t_POCode:=[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20
$_l_POItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21
$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
$_l_StockNumber:=[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9
$_l_StockItemThread:=[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19
$_r_TotalCost:=[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
$_l_ID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
$_l_AddtoCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
$_t_AddtoStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
$_t_AnalysisOnPrevious:=[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42
$_r_CostonPrevious:=[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35
$_t_CurrencyonPrevious:=[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36
$_t_HeaderAnalysis:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
$_t_HeaderCurrency:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
$_t_HeaderLayer:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
$_bo_IgnoreForCurrentStock:=[STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38
$_bo_InvertedMovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39
$_t_LayerOnPrevious:=[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41
$_t_LocationOnPrevious:=[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34
$_l_NonLinkedCopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47
$_t_POItemDeliveryReference:=[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43
$_d_POItemExpectedDeliveryDate:=[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44
$_l_RecordUpdateStamp:=[STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46
$_r_ResidualStockQuantity:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
$_l_SalesOrderItemifAllocate:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24
$_l_SalesOrderItemifUnallocate:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
$_bo_SerialNumberWasonPrevious:=[STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33
$_t_SOItemDeliveryReference:=[STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45
$_t_StockMovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
$_l_TakeFromCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
$_t_TakeFromStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14:=$_r_AssemblyQuantity
[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_CalledoffQuantity
[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=$_t_CompanyTo
[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15:=$_r_ComponentQuantity
[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_r_CostPrice
[STOCK_MOVEMENT_ITEMS:27]Date_Received:5:=$_d_DateReceived
[STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6:=$_d_DateShipped
[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_l_ItemNumber
[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_t_Location
[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=$_r_MovedQuantity
[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=$_t_MovementCode
[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=$_t_OrderCode
[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_t_productCode
[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20:=$_t_POCode
[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21:=$_l_POItemNumber
[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Quantity
[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=$_t_SerialNumber
[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=$_l_StockNumber
[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19:=$_l_StockItemThread
[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=$_r_TotalCost
[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_CopiedFromID
[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=$_l_ID
[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=$_l_AddtoCurrentStockID
[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=$_t_AddtoStockType
[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_t_AnalysisOnPrevious
[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=$_r_CostonPrevious
[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_t_CurrencyonPrevious
[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=$_t_HeaderAnalysis
[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=$_t_HeaderCurrency
[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=$_d_HeaderDate
[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=$_t_HeaderLayer
[STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38:=$_bo_IgnoreForCurrentStock
[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=$_bo_InvertedMovementType
[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_t_LayerOnPrevious
[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_t_LocationOnPrevious
[STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47:=$_l_NonLinkedCopiedFromID
[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=$_t_POItemDeliveryReference
[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=$_d_POItemExpectedDeliveryDate
[STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46:=$_l_RecordUpdateStamp
//TRACE
[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=$_r_ResidualStockQuantity
[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=$_l_SalesOrderItemifAllocate
[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_SalesOrderItemifUnallocate
[STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33:=$_bo_SerialNumberWasonPrevious
[STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45:=$_t_SOItemDeliveryReference
[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=$_t_StockMovementType
[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_TakeFromCurrentStockID
[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=$_t_TakeFromStockType
For ($_l_Index; 1; Count parameters:C259; 2)
	
	(${$_l_Index})->:=(${$_l_Index+1})
End for 
ERR_MethodTrackerReturn("STK_ItemDuplicate"; $_t_oldMethodName)
