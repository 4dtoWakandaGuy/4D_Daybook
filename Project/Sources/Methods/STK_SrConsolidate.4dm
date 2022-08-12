//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SrConsolidate
	//------------------ Method Notes ------------------
	
	//This method can be called when printing a stcok movement. it will take the movement items and consolidate them.
	
	
	//------------------ Revision Control ----------------
	//Date Created: 02/03/2012 10:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_StockItemsIDS; 0)
	//ARRAY LONGINT(STK_al_LineIndex;0)
	//ARRAY LONGINT(STK_al_LineItemIDS;0)
	//ARRAY LONGINT(STK_al_LineItemIndexID;0)
	//ARRAY LONGINT(STK_al_LineSalesOrderItem;0)
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY REAL(STK_ar_AverageCostPrice;0)
	//ARRAY REAL(STK_ar_CalledOffQTY;0)
	//ARRAY REAL(STK_ar_ComponentQTY;0)
	//ARRAY REAL(STK_ar_CostPrice;0)
	//ARRAY REAL(STK_ar_osAssembly;0)
	//ARRAY REAL(STK_ar_osTotalCalledoff;0)
	//ARRAY REAL(STK_ar_TotalComponentQTY;0)
	//ARRAY REAL(STK_ar_TotalCost;0)
	//ARRAY REAL(STK_ar_TotalMoved;0)
	//ARRAY REAL(STK_ar_TotalQuantity;0)
	//ARRAY REAL(STK_ar_XResidualStockQuantity;0)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	//ARRAY TEXT(STK_at_CompaniesTo;0)
	//ARRAY TEXT(STK_at_DateReceived;0)
	//ARRAY TEXT(STK_at_DateShipped;0)
	//ARRAY TEXT(STK_at_LinePurchaseOrder;0)
	//ARRAY TEXT(STK_at_Location;0)
	//ARRAY TEXT(STK_at_MovementCode;0)
	//ARRAY TEXT(STK_at_poItemExpectedDelDate;0)
	//ARRAY TEXT(STK_at_ProductCode;0)
	//ARRAY TEXT(STK_at_PurchaseorderCode;0)
	//ARRAY TEXT(STK_at_PurchaseOrderitemNumber;0)
	//ARRAY TEXT(STK_at_SerialNum;0)
	//ARRAY TEXT(STK_at_SOcode;0)
	//ARRAY TEXT(STK_at_SOItemNumber;0)
	//ARRAY TEXT(STK_at_stockItemThread;0)
	//ARRAY TEXT(STK_at_StockNo;0)
	//ARRAY TEXT(STK_at_X_CopiedFromID;0)
	//ARRAY TEXT(STK_at_xPoItemDeliveryReference;0)
	//ARRAY TEXT(STK_at_xSoItemDeliveryReference;0)
	C_LONGINT:C283($_l_BuildIndex; $_l_DataRow; $_l_FindIndex; $_l_LineID; $_l_LineItemRow; $_l_RecordsInSelection; $_l_SizeofArray)
	C_REAL:C285($_r_AverageCostPrice; $_r_TotalCostPrice)
	C_TEXT:C284($_t_oldMethodName; vProduct)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_SrConsolidate")


ARRAY LONGINT:C221(STK_al_LineIndex; 0)  //this array stays with the on screen sort as index of the line numbers
ARRAY LONGINT:C221(STK_al_LineItemIDS; 0)  //This array does not get displayed and contains the Actual data item numbers
ARRAY LONGINT:C221(STK_al_LineItemIndexID; 0)  //This array does not get displayed and contains the Line number index from the STK_al_LineIndex representing the row of the on screen selection
ARRAY LONGINT:C221(STK_al_LineSalesOrderItem; 0)
ARRAY TEXT:C222(STK_at_LinePurchaseOrder; 0)

SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; STK_al_LineItemIDS; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; STK_al_LineSalesOrderItem; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; STK_at_LinePurchaseOrder; [STOCK_MOVEMENT_ITEMS:27]Company_To:2; STK_at_CompaniesTo; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18; STK_ar_CalledOffQTY; [STOCK_MOVEMENT_ITEMS:27]Component_Qty:15; STK_ar_ComponentQTY; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; STK_ar_CostPrice)


ARRAY LONGINT:C221(STK_al_LineItemIndexID; Size of array:C274(STK_al_LineItemIDS))
//we are now going to create arrays containing data from all fields on the stock items-one line per product code
ARRAY REAL:C219(STK_ar_osAssembly; 0)
ARRAY REAL:C219(STK_ar_osTotalCalledoff; 0)
ARRAY TEXT:C222(STK_at_CompaniesTo; 0)
ARRAY REAL:C219(STK_ar_TotalComponentQTY; 0)
ARRAY REAL:C219(STK_ar_AverageCostPrice; 0)
ARRAY TEXT:C222(STK_at_DateReceived; 0)  //note displayed as text
ARRAY TEXT:C222(STK_at_DateShipped; 0)
ARRAY TEXT:C222(STK_at_SOItemNumber; 0)  //note displayed as text
ARRAY TEXT:C222(STK_at_Location; 0)
ARRAY REAL:C219(STK_ar_TotalMoved; 0)
ARRAY TEXT:C222(STK_at_MovementCode; 0)
ARRAY TEXT:C222(STK_at_SOcode; 0)
ARRAY TEXT:C222(STK_at_ProductCode; 0)
ARRAY TEXT:C222(STK_at_PurchaseorderCode; 0)
ARRAY TEXT:C222(STK_at_PurchaseOrderitemNumber; 0)  //note TEXT
ARRAY REAL:C219(STK_ar_TotalQuantity; 0)
ARRAY TEXT:C222(STK_at_SerialNum; 0)
ARRAY TEXT:C222(STK_at_StockNo; 0)
ARRAY TEXT:C222(STK_at_stockItemThread; 0)
ARRAY REAL:C219(STK_ar_TotalCost; 0)
ARRAY TEXT:C222(STK_at_X_CopiedFromID; 0)  //note displayed as text(if displayed)
//Array[STOCK ITEMS]x_ID
ARRAY TEXT:C222(STK_at_xPoItemDeliveryReference; 0)
ARRAY TEXT:C222(STK_at_poItemExpectedDelDate; 0)
ARRAY REAL:C219(STK_ar_XResidualStockQuantity; 0)
ARRAY TEXT:C222(STK_at_xSoItemDeliveryReference; 0)
COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CurrentSelection")

FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])

For ($_l_DataRow; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
	$_l_SizeofArray:=Find in array:C230(STK_at_ProductCode; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
	If ($_l_SizeofArray<0)
		APPEND TO ARRAY:C911(STK_ar_osAssembly; [STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14)
		APPEND TO ARRAY:C911(STK_ar_osTotalCalledoff; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
		APPEND TO ARRAY:C911(STK_at_CompaniesTo; [STOCK_MOVEMENT_ITEMS:27]Company_To:2)
		APPEND TO ARRAY:C911(STK_ar_TotalComponentQTY; [STOCK_MOVEMENT_ITEMS:27]Component_Qty:15)
		APPEND TO ARRAY:C911(STK_ar_AverageCostPrice; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
		
		APPEND TO ARRAY:C911(STK_at_DateReceived; String:C10([STOCK_MOVEMENT_ITEMS:27]Date_Received:5; Internal date short:K1:7))
		//note displayed as text
		APPEND TO ARRAY:C911(STK_at_DateShipped; String:C10([STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6; Internal date short:K1:7))
		If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8>0)
			APPEND TO ARRAY:C911(STK_at_SOItemNumber; String:C10([STOCK_MOVEMENT_ITEMS:27]Item_Number:8))  //note displayed as text
		Else 
			APPEND TO ARRAY:C911(STK_at_SOItemNumber; "")
		End if 
		APPEND TO ARRAY:C911(STK_at_Location; [STOCK_MOVEMENT_ITEMS:27]Location:7)
		APPEND TO ARRAY:C911(STK_ar_TotalMoved; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
		APPEND TO ARRAY:C911(STK_at_MovementCode; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
		APPEND TO ARRAY:C911(STK_at_SOcode; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3)
		APPEND TO ARRAY:C911(STK_at_ProductCode; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		APPEND TO ARRAY:C911(STK_at_PurchaseorderCode; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
		APPEND TO ARRAY:C911(STK_at_PurchaseOrderitemNumber; String:C10([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21))  //note TEXT
		APPEND TO ARRAY:C911(STK_ar_TotalQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		APPEND TO ARRAY:C911(STK_at_SerialNum; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
		
		APPEND TO ARRAY:C911(STK_ar_TotalCost; [STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
		APPEND TO ARRAY:C911(STK_at_xPoItemDeliveryReference; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43)
		APPEND TO ARRAY:C911(STK_at_poItemExpectedDelDate; String:C10([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44; Internal date short:K1:7))
		APPEND TO ARRAY:C911(STK_ar_XResidualStockQuantity; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
		APPEND TO ARRAY:C911(STK_at_xSoItemDeliveryReference; [STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45)
		$_l_SizeofArray:=Size of array:C274(STK_at_ProductCode)
		APPEND TO ARRAY:C911(STK_al_LineIndex; $_l_SizeofArray)
	Else 
		STK_ar_osAssembly{$_l_SizeofArray}:=STK_ar_osAssembly{$_l_SizeofArray}+[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14
		STK_ar_osTotalCalledoff{$_l_SizeofArray}:=STK_ar_osTotalCalledoff{$_l_SizeofArray}+[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
		
		If (STK_at_CompaniesTo{$_l_SizeofArray}#[STOCK_MOVEMENT_ITEMS:27]Company_To:2)
			STK_at_CompaniesTo{$_l_SizeofArray}:="Multiple"
		End if 
		STK_ar_TotalComponentQTY{$_l_SizeofArray}:=STK_ar_TotalComponentQTY{$_l_SizeofArray}+[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15
		$_r_TotalCostPrice:=(STK_ar_AverageCostPrice{$_l_SizeofArray}*STK_ar_TotalQuantity{$_l_SizeofArray})+([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		$_r_AverageCostPrice:=$_r_TotalCostPrice/(STK_ar_TotalQuantity{$_l_SizeofArray})+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		STK_ar_AverageCostPrice{$_l_SizeofArray}:=$_r_AverageCostPrice
		If ([STOCK_MOVEMENT_ITEMS:27]Date_Received:5#Date:C102(STK_at_DateReceived{$_l_SizeofArray}))
			STK_at_DateReceived{$_l_SizeofArray}:="Multiple"
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6#Date:C102(STK_at_DateShipped{$_l_SizeofArray}))
			STK_at_DateShipped{$_l_SizeofArray}:="Multiple"
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#Num:C11(STK_at_SOItemNumber{$_l_SizeofArray}))
			STK_at_SOItemNumber{$_l_SizeofArray}:="Multiple"
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]Location:7#STK_at_Location{$_l_SizeofArray})
			STK_at_Location{$_l_SizeofArray}:="Multiple"
		End if 
		STK_ar_TotalMoved{$_l_SizeofArray}:=STK_ar_TotalMoved{$_l_SizeofArray}+[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40
		If (STK_at_MovementCode{$_l_SizeofArray}#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)  //might enable items from multiple movements
			STK_at_MovementCode{$_l_SizeofArray}:="Multiple"
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]Order_Code:3#STK_at_SOcode{$_l_SizeofArray})
			STK_at_SOcode{$_l_SizeofArray}:="Multiple"
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20#STK_at_PurchaseorderCode{$_l_SizeofArray})
			STK_at_PurchaseorderCode{$_l_SizeofArray}:="Multiple"
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21#Num:C11(STK_at_PurchaseOrderitemNumber{$_l_SizeofArray}))
			STK_at_PurchaseOrderitemNumber{$_l_SizeofArray}:="Multiple"
		End if 
		STK_ar_TotalQuantity{$_l_SizeofArray}:=STK_ar_TotalQuantity{$_l_SizeofArray}+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		If (STK_at_SerialNum{$_l_SizeofArray}#[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
			STK_at_SerialNum{$_l_SizeofArray}:="Multiple"
		End if 
		STK_ar_TotalCost{$_l_SizeofArray}:=STK_ar_TotalCost{$_l_SizeofArray}+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
		If ([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43#STK_at_xPoItemDeliveryReference{$_l_SizeofArray})
			STK_at_xPoItemDeliveryReference{$_l_SizeofArray}:="Multiple"
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44#Date:C102(STK_at_poItemExpectedDelDate{$_l_SizeofArray}))
			STK_at_poItemExpectedDelDate{$_l_SizeofArray}:="Multiple"
		End if 
		STK_ar_XResidualStockQuantity{$_l_SizeofArray}:=STK_ar_XResidualStockQuantity{$_l_SizeofArray}+[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
		If ([STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45#STK_at_xSoItemDeliveryReference{$_l_SizeofArray})
			STK_at_xSoItemDeliveryReference{$_l_SizeofArray}:="Multiple"
		End if 
		
	End if 
	$_l_LineItemRow:=Find in array:C230(STK_al_LineItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
	STK_al_LineItemIndexID{$_l_LineItemRow}:=$_l_SizeofArray
	NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
End for 

Movt_FormLP
$_l_RecordsInSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
Form_SRArray(Size of array:C274(STK_al_LineIndex))
$_l_DataRow:=1
//TRACE
For ($_l_BuildIndex; 1; Size of array:C274(STK_al_LineIndex))
	$_l_LineID:=STK_al_LineIndex{$_l_BuildIndex}
	
	ARRAY LONGINT:C221($_al_StockItemsIDS; 0)
	For ($_l_FindIndex; 1; Size of array:C274(STK_al_LineItemIndexID))
		If (STK_al_LineItemIndexID{$_l_FindIndex}=$_l_LineID)
			APPEND TO ARRAY:C911($_al_StockItemsIDS; STK_al_LineItemIDS{$_l_FindIndex})
		End if 
	End for 
	
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsIDS)
	Movt_FormItLP
	
	SRProdCode{$_l_DataRow}:=STK_at_ProductCode{$_l_BuildIndex}
	SRDesc{$_l_DataRow}:=vProduct
	SRSerial{$_l_DataRow}:=STK_at_SerialNum{$_l_BuildIndex}
	SRPrice{$_l_DataRow}:=STK_ar_AverageCostPrice{$_l_BuildIndex}
	SRQtyT{$_l_DataRow}:=STK_at_Location{$_l_BuildIndex}
	SRRate{$_l_DataRow}:=STK_ar_TotalQuantity{$_l_BuildIndex}
	SRAmount{$_l_DataRow}:=STK_ar_TotalCost{$_l_BuildIndex}
	$_l_DataRow:=$_l_DataRow+1
	
End for 

FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
ERR_MethodTrackerReturn("STK_SrConsolidate"; $_t_oldMethodName)
