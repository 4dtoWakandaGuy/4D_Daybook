If (False:C215)
	//object Method Name: Object Name:      [STOCK_MOVEMENTS].Movements_in.oConsolidate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/05/2012 11:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	//ARRAY LONGINT(STK_al_LineIndex;0)
	//ARRAY LONGINT(STK_al_LineItemIDS;0)
	//ARRAY LONGINT(STK_al_LineItemIndexID;0)
	//ARRAY LONGINT(STK_al_LineSalesOrderItem;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
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
	C_BOOLEAN:C305(STK_bo_ConsolidatedView)
	C_LONGINT:C283($_l_add; $_l_ArraySize; $_l_ColumnIndex; $_l_FieldNumber; $_l_ItemIndex; $_l_LineItemRow; $_l_ProductCodeRow; $_l_StkPosition; $_l_Subtract; $_l_TableNumber; STK_but_consolidate)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_ptr_ArrayofColumnColors; $_ptr_ArrayofColumnFonts; $_ptr_ArrayofColumnFooters; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayofColumnLabels; $_ptr_ArrayofColumnLockFlags; $_ptr_ArrayofColumnWIdths)
	C_POINTER:C301($_ptr_EnterabilityArray; $_ptr_HasRollover; $_Ptr_ThisColumnArray)
	C_REAL:C285($_r_AverageCostPrice; $_r_TotalCostPrice)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS].Movements_in.oConsolidate"; Form event code:C388)

If (Not:C34(STK_bo_ConsolidatedView))
	//The actions here are 1) Build an array of the stock movement items. with one line per product.
	ARRAY LONGINT:C221(STK_al_LineIndex; 0)  //this array stays with the on screen sort as index of the line numbers
	ARRAY LONGINT:C221(STK_al_LineItemIDS; 0)  //This array does not get displayed and contains the Actual data item numbers
	ARRAY LONGINT:C221(STK_al_LineItemIndexID; 0)  //This array does not get displayed and contains the Line number index from the STK_al_LineIndex representing the row of the on screen selection
	ARRAY LONGINT:C221(STK_al_LineSalesOrderItem; 0)
	ARRAY TEXT:C222(STK_at_LinePurchaseOrder; 0)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
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
	
	For ($_l_ItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		$_l_ProductCodeRow:=Find in array:C230(STK_at_ProductCode; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		If ($_l_ProductCodeRow<0)
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
			$_l_ProductCodeRow:=Size of array:C274(STK_at_ProductCode)
			APPEND TO ARRAY:C911(STK_al_LineIndex; $_l_ProductCodeRow)
		Else 
			STK_ar_osAssembly{$_l_ProductCodeRow}:=STK_ar_osAssembly{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14
			STK_ar_osTotalCalledoff{$_l_ProductCodeRow}:=STK_ar_osTotalCalledoff{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
			
			If (STK_at_CompaniesTo{$_l_ProductCodeRow}#[STOCK_MOVEMENT_ITEMS:27]Company_To:2)
				STK_at_CompaniesTo{$_l_ProductCodeRow}:="Multiple"
			End if 
			STK_ar_TotalComponentQTY{$_l_ProductCodeRow}:=STK_ar_TotalComponentQTY{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15
			$_r_TotalCostPrice:=(STK_ar_AverageCostPrice{$_l_ProductCodeRow}*STK_ar_TotalQuantity{$_l_ProductCodeRow})+([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			$_r_AverageCostPrice:=$_r_TotalCostPrice/(STK_ar_TotalQuantity{$_l_ProductCodeRow})+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
			STK_ar_AverageCostPrice{$_l_ProductCodeRow}:=$_r_AverageCostPrice
			If ([STOCK_MOVEMENT_ITEMS:27]Date_Received:5#Date:C102(STK_at_DateReceived{$_l_ProductCodeRow}))
				STK_at_DateReceived{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6#Date:C102(STK_at_DateShipped{$_l_ProductCodeRow}))
				STK_at_DateShipped{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#Num:C11(STK_at_SOItemNumber{$_l_ProductCodeRow}))
				STK_at_SOItemNumber{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Location:7#STK_at_Location{$_l_ProductCodeRow})
				STK_at_Location{$_l_ProductCodeRow}:="Multiple"
			End if 
			STK_ar_TotalMoved{$_l_ProductCodeRow}:=STK_ar_TotalMoved{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40
			If (STK_at_MovementCode{$_l_ProductCodeRow}#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)  //might enable items from multiple movements
				STK_at_MovementCode{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Order_Code:3#STK_at_SOcode{$_l_ProductCodeRow})
				STK_at_SOcode{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20#STK_at_PurchaseorderCode{$_l_ProductCodeRow})
				STK_at_PurchaseorderCode{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21#Num:C11(STK_at_PurchaseOrderitemNumber{$_l_ProductCodeRow}))
				STK_at_PurchaseOrderitemNumber{$_l_ProductCodeRow}:="Multiple"
			End if 
			STK_ar_TotalQuantity{$_l_ProductCodeRow}:=STK_ar_TotalQuantity{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
			If (STK_at_SerialNum{$_l_ProductCodeRow}#[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
				STK_at_SerialNum{$_l_ProductCodeRow}:="Multiple"
			End if 
			STK_ar_TotalCost{$_l_ProductCodeRow}:=STK_ar_TotalCost{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
			If ([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43#STK_at_xPoItemDeliveryReference{$_l_ProductCodeRow})
				STK_at_xPoItemDeliveryReference{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44#Date:C102(STK_at_poItemExpectedDelDate{$_l_ProductCodeRow}))
				STK_at_poItemExpectedDelDate{$_l_ProductCodeRow}:="Multiple"
			End if 
			STK_ar_XResidualStockQuantity{$_l_ProductCodeRow}:=STK_ar_XResidualStockQuantity{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
			If ([STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45#STK_at_xSoItemDeliveryReference{$_l_ProductCodeRow})
				STK_at_xSoItemDeliveryReference{$_l_ProductCodeRow}:="Multiple"
			End if 
			
		End if 
		$_l_LineItemRow:=Find in array:C230(STK_al_LineItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		STK_al_LineItemIndexID{$_l_LineItemRow}:=$_l_ProductCodeRow
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
	End for 
	//Now get the fields for the current definition. and build an array based format for the same
	//STK_aptr_ItemPreferences
	If (Size of array:C274(STK_at_xSoItemDeliveryReference)#Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		
		$_ptr_ArrayFieldPointers:=STK_aptr_ItemPreferences{2}
		$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
		$_ptr_ArrayOfArrayNames:=STK_aptr_ItemPreferences{4}
		$_ptr_ArrayOfColumFormats:=STK_aptr_ItemPreferences{5}
		$_Ptr_ArrayofColumnFormulas:=STK_aptr_ItemPreferences{6}
		$_ptr_ArrayofColumnLabels:=STK_aptr_ItemPreferences{12}
		$_ptr_ArrayofColumnWIdths:=STK_aptr_ItemPreferences{13}
		$_ptr_EnterabilityArray:=STK_aptr_ItemPreferences{14}
		$_ptr_ArrayofColumnLockFlags:=STK_aptr_ItemPreferences{15}
		$_ptr_ArrayofColumnFonts:=STK_aptr_ItemPreferences{16}
		$_ptr_ArrayofColumnColors:=STK_aptr_ItemPreferences{17}
		$_ptr_ArrayofColumnFooters:=STK_aptr_ItemPreferences{18}
		$_ptr_HasRollover:=STK_aptr_ItemPreferences{21}
		For ($_l_ItemIndex; 1; Size of array:C274($_ptr_ArrayofArrayPointers->))
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}
			$_l_ArraySize:=Size of array:C274($_Ptr_ThisColumnArray->)
			If ($_l_ArraySize<Size of array:C274(STK_al_LineIndex))
				$_l_add:=Size of array:C274(STK_al_LineIndex)-$_l_add
				INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; Size of array:C274($_Ptr_ThisColumnArray->)+1; $_l_add)
			Else 
				$_l_Subtract:=$_l_ArraySize-Size of array:C274(STK_al_LineIndex)
				DELETE FROM ARRAY:C228($_Ptr_ThisColumnArray->; $_l_ArraySize-$_l_Subtract; $_l_Subtract)
			End if 
		End for 
		//Modify the current pointers
		For ($_l_ItemIndex; 1; Size of array:C274($_ptr_ArrayFieldPointers->))
			If ($_Ptr_ArrayofColumnFormulas->{$_l_ItemIndex}="")
				$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{$_l_ItemIndex})
				$_l_FieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_ItemIndex})
				If ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					Case of 
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_ar_osAssembly
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_ar_osAssembly"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_ar_osTotalCalledoff
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_ar_osTotalCalledoff"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Company_To:2))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_CompaniesTo
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_CompaniesTo"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_ar_TotalComponentQTY
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_ar_TotalComponentQTY"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_ar_AverageCostPrice
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_ar_AverageCostPrice"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Date_Received:5))
							//here we are setting the pointer to point at a text array instead of a data array
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_DateReceived
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_DateReceived"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_DateShipped
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_DateShipped"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_SOItemNumber
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_SOItemNumber"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_Location
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_Location"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_ar_TotalMoved
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_ar_TotalMoved"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_MovementCode
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_MovementCode"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_SOcode
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_SOcode"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_ProductCode
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_ProductCode"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_PurchaseorderCode
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_PurchaseorderCode"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_PurchaseOrderitemNumber
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_PurchaseOrderitemNumber"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Quantity:12))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_ar_TotalQuantity
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_ar_TotalQuantity"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_SerialNum
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_SerialNum"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_SerialNum
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_SerialNum"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_ar_TotalCost
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_ar_TotalCost"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_xPoItemDeliveryReference
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_xPoItemDeliveryReference"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_poItemExpectedDelDate
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_poItemExpectedDelDate"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_ar_XResidualStockQuantity
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_ar_XResidualStockQuantity"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45))
							$_ptr_ArrayofArrayPointers->{$_l_ItemIndex}:=->STK_at_xSoItemDeliveryReference
							$_ptr_ArrayOfArrayNames->{$_l_ItemIndex}:="STK_at_xSoItemDeliveryReference"
						Else 
							
							
							
					End case 
					//$_ptr_ArrayFieldPointers:=STK_aptr_ItemPreferences{2}
					//$_ptr_ArrayOfColumFormats:=STK_aptr_ItemPreferences{5}
					//$_Ptr_ArrayofColumnFormulas:=STK_aptr_ItemPreferences{6}
					//$_ptr_ArrayofColumnLabels:=STK_aptr_ItemPreferences{12}
					//$_ptr_ArrayofColumnWIdths:=STK_aptr_ItemPreferences{13}
					//$_ptr_EnterabilityArray:=STK_aptr_ItemPreferences{14}
					//$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
					//$_ptr_ArrayOfArrayNames:=STK_aptr_ItemPreferences{4}
					
				End if 
				
			End if 
		End for 
		APPEND TO ARRAY:C911($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		APPEND TO ARRAY:C911($_ptr_ArrayOfColumFormats->; "")
		APPEND TO ARRAY:C911($_ptr_ArrayofColumnLabels->; "Index")
		APPEND TO ARRAY:C911($_ptr_ArrayofColumnWIdths->; 0)
		APPEND TO ARRAY:C911($_ptr_EnterabilityArray->; False:C215)
		APPEND TO ARRAY:C911($_ptr_ArrayofArrayPointers->; ->STK_al_LineIndex)
		APPEND TO ARRAY:C911($_ptr_ArrayOfArrayNames->; "STK_al_LineIndex")
		APPEND TO ARRAY:C911($_ptr_ArrayofColumnLockFlags->; False:C215)
		APPEND TO ARRAY:C911($_ptr_ArrayofColumnFonts->; 9)
		APPEND TO ARRAY:C911($_ptr_ArrayofColumnFooters->; 1)
		APPEND TO ARRAY:C911($_ptr_ArrayofColumnColors->; "Black")
		APPEND TO ARRAY:C911($_Ptr_ArrayofColumnFormulas->; "")
		APPEND TO ARRAY:C911($_Ptr_ArrayofColumnFormulas->; "")
		APPEND TO ARRAY:C911($_ptr_HasRollover->; False:C215)
		
		//note displayed as text
		//have to add the index column
		
		STK_bo_ConsolidatedView:=True:C214
		OBJECT SET TITLE:C194(STK_but_consolidate; "Full View")
		$_ptr_ArrayFieldPointers:=STK_aptr_ItemPreferences{2}
		$_ptr_ArrayOfColumFormats:=STK_aptr_ItemPreferences{5}
		$_Ptr_ArrayofColumnFormulas:=STK_aptr_ItemPreferences{6}
		$_ptr_ArrayofColumnLabels:=STK_aptr_ItemPreferences{12}
		$_ptr_ArrayofColumnWIdths:=STK_aptr_ItemPreferences{13}
		$_ptr_EnterabilityArray:=STK_aptr_ItemPreferences{14}
		$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
		$_ptr_ArrayOfArrayNames:=STK_aptr_ItemPreferences{4}
		//modify the data held in the pointers
		For ($_l_ItemIndex; 1; Size of array:C274(STK_at_xSoItemDeliveryReference))
			For ($_l_ColumnIndex; 1; Size of array:C274($_ptr_ArrayOfArrayNames->))
				//if the array it is point at is named STK dont need to do anything..else we need to poplate or clear the array
				$_l_StkPosition:=Position:C15("STK_"; $_ptr_ArrayOfArrayNames->{$_l_ColumnIndex})
				If ($_l_StkPosition=0)
					USE NAMED SELECTION:C332("$CurrentSelection")
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=STK_at_ProductCode{$_l_ItemIndex})
					LBi_ArrUpdate(->STK_aptr_ItemPreferences; $_l_ItemIndex; True:C214; $_l_ColumnIndex; $_l_ColumnIndex)  //return the values to the arrays
				End if 
				
			End for 
			
		End for 
		LBi_inclSetup(->STK_aptr_ItemPreferences)
		LB_SetEnterable(->STK_LB_StockItems; False:C215; 0)  // for the moment
		Gen_Alert("To edit any records you must switch back to full view")
		
	Else 
		//there is no consolidation taking place dont fiddle with the display
	End if 
	
	
Else 
	
	//switch back to full view..any saves need to be done first
	ARRAY POINTER:C280(STK_aptr_ItemPreferences; 0)
	STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)  //New Call NG May 2004
	STK_bo_ConsolidatedView:=False:C215
	OBJECT SET TITLE:C194(STK_but_consolidate; "Consolidated View")
	
End if 




//note that if you add a line in the consolidated view we need to handle that as we do deleting a line and with changing quantites etc
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENTS].Movements_in.oConsolidate"; $_t_oldMethodName)
