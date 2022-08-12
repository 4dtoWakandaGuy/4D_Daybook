//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ShowSupplierProducts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: STK_ShowSupplierProducts
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(STK_ad_ExpectedDeliveryDate;0)
	ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
	ARRAY LONGINT:C221($_al_StockOINumbers; 0)
	//ARRAY LONGINT(STK_al_AllocStockOINumbers;0)
	//ARRAY LONGINT(STK_al_OrderedPOItemNumbers;0)
	//ARRAY LONGINT(STK_al_PartDeliveredItemNumbees;0)
	//ARRAY LONGINT(STK_al_ProductIDS;0)
	//ARRAY LONGINT(STK_al_StockItemNumbers;0)
	ARRAY REAL:C219($_ar_OrderItemQuantities; 0)
	//ARRAY REAL(STK_ar_AllocationsQuantities;0)
	//ARRAY REAL(STK_ar_AllocQuantitier;0)
	//ARRAY REAL(STK_ar_AllocQuantities;0)
	//ARRAY REAL(STK_ar_AwaitingPurchase;0)
	//ARRAY REAL(STK_ar_CurrentStock;0)
	//ARRAY REAL(STK_ar_DeliveredQuantities;0)
	//ARRAY REAL(STK_ar_FreeQuantities;0)
	//ARRAY REAL(STK_ar_FreeStockQuantites;0)
	//ARRAY REAL(STK_ar_NoAllocQuantities;0)
	//ARRAY REAL(STK_ar_NoAllocStockQuantites;0)
	//ARRAY REAL(STK_ar_OnOrderStock;0)
	//ARRAY REAL(STK_ar_OutstandingQuantities;0)
	//ARRAY REAL(STK_ar_PartDeliveredQuantities;0)
	//ARRAY REAL(STK_ar_PDOrdererdQuantites;0)
	//ARRAY REAL(STK_ar_PreSold;0)
	//ARRAY REAL(STK_ar_PurchasedQuantities;0)
	//ARRAY REAL(STK_ar_QuantitiesOnOrder;0)
	//ARRAY REAL(STK_ar_UnitCostPrice;0)
	ARRAY TEXT:C222($_at_allocationStockMovements; 0)
	ARRAY TEXT:C222($_at_DeliveryMovementTypes; 0)
	ARRAY TEXT:C222($_at_FreeStockTypes; 0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	ARRAY TEXT:C222($_at_POMovementTypes; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_UsageCodes; 0)
	//ARRAY TEXT(STK_at_AllocProducts;0)
	//ARRAY TEXT(STK_at_ALOCSoItemNumbers;0)
	//ARRAY TEXT(STK_at_DeliveryNumber;0)
	//ARRAY TEXT(STK_at_FREEMovementCodes;0)
	//ARRAY TEXT(STK_at_FreeProducts;0)
	//ARRAY TEXT(STK_at_MovementCodes;0)
	//ARRAY TEXT(STK_at_NoAllocOrderCodes;0)
	//ARRAY TEXT(STK_at_noAllocOrders;0)
	//ARRAY TEXT(STK_at_NoAlocProductCodes;0)
	//ARRAY TEXT(STK_at_PoNumbers;0)
	//ARRAY TEXT(STK_at_ProductCodes;0)
	//ARRAY TEXT(STK_at_ProductNames;0)
	//ARRAY TEXT(STK_at_PurchaseOrderCodes;0)
	//ARRAY TEXT(STK_at_PurchProducts;0)
	C_BOOLEAN:C305(<>STK_bo_UseNew; $_bo_ProductCodeInserted; $_bo_ProductCodesIndexnserted)
	C_LONGINT:C283($_l_CountProductCodes; $_l_Index; $_l_ProductCodesIndex; $_l_ProductCodesIndexnsertedAllo; $_l_ProductCodesIndexnsertedFree; $_l_Start; $_l_StockItemRow; $_l_TableNumber; $1; $3; $4)
	C_LONGINT:C283(STK_l_ProductProcesses)
	C_REAL:C285(STK_l_CallBackProcessID)
	C_TEXT:C284($_t_oldMethodName; $_t_productCode; $2; STK_t_SupplierCompanyCode; STK_t_WindowTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ShowSupplierProducts")

//This method will open a screen with products relating to a supplier(draggable to a purchase order)
//This can show
//1)all products where that supplier is on the list
//2)all products where the supplier is the prefered supplier
//3) all products where stock is pre-allocated(not ordered yet)-this only when using stock control.


If (Count parameters:C259>=2)
	Start_Process
	STK_l_CallBackProcessID:=$1
	STK_t_SupplierCompanyCode:=$2
	QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=STK_t_SupplierCompanyCode)
	SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
	QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
	QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
	QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Actual_End_Date:49>Current date:C33(*); *)
	QUERY SELECTION:C341([PRODUCTS:9];  | ; [PRODUCTS:9]Actual_End_Date:49=!00-00-00!)
	
	
	READ ONLY:C145([COMPANIES:2])
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=STK_t_SupplierCompanyCode)
	STK_t_WindowTitle:="Products from supplier: "+[COMPANIES:2]Company_Name:2
	//For the purposes of 1st test...
	ARRAY TEXT:C222(STK_at_ProductNames; 0)
	ARRAY TEXT:C222(STK_at_ProductCodes; 0)
	ARRAY LONGINT:C221(STK_al_ProductIDS; 0)
	SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; STK_at_ProductCodes; [PRODUCTS:9]X_ID:43; STK_al_ProductIDS; [PRODUCTS:9]Product_Name:2; STK_at_ProductNames)
	ARRAY REAL:C219(STK_ar_OnOrderStock; 0)
	ARRAY REAL:C219(STK_ar_PreSold; 0)
	ARRAY REAL:C219(STK_ar_AwaitingPurchase; 0)
	ARRAY REAL:C219(STK_ar_CurrentStock; 0)
	$_l_CountProductCodes:=Size of array:C274(STK_al_ProductIDS)
	ARRAY REAL:C219(STK_ar_OnOrderStock; $_l_CountProductCodes)
	ARRAY REAL:C219(STK_ar_PreSold; $_l_CountProductCodes)
	ARRAY REAL:C219(STK_ar_AwaitingPurchase; $_l_CountProductCodes)
	ARRAY REAL:C219(STK_ar_CurrentStock; $_l_CountProductCodes)
	
	QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Product_Code:2; STK_at_ProductCodes)
	CREATE SET:C116([ORDER_ITEMS:25]; "$salesofproducts")
	SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_StockOINumbers)
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_StockOINumbers)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
	
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; STK_al_StockItemNumbers)
	QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; STK_al_StockItemNumbers)
	//any order items not in this selection are not allocated-need to split them up by order status
	CREATE SET:C116([ORDER_ITEMS:25]; "$Allocated")
	DIFFERENCE:C122("$salesofproducts"; "$Allocated"; "$notAllocated")
	If (Records in set:C195("$notAllocated")>0)
		QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1="090024"+"@"; *)
		QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=4)
		SELECTION TO ARRAY:C260([CODE_USES:91]Code:1; $_at_UsageCodes)
		For ($_l_Index; 1; Size of array:C274($_at_UsageCodes))
			$_at_UsageCodes{$_l_Index}:=Substring:C12($_at_UsageCodes{$_l_Index}; 4)
		End for 
		USE SET:C118("$NotAllocated")
		DISTINCT VALUES:C339([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
		QUERY WITH ARRAY:C644([ORDERS:24]Order_Code:3; $_at_OrderCodes)
		QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_UsageCodes)
		SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; $_at_OrderCodes)
		QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
		CREATE SET:C116([ORDER_ITEMS:25]; "$ValidStates")
		INTERSECTION:C121("$NotAllocated"; "$ValidStates"; "$NotAllocated")
		USE SET:C118("$NotAllocated")
		QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Quantity:3>0)
		SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Product_Code:2; STK_at_NoAlocProductCodes; [ORDER_ITEMS:25]Order_Code:1; STK_at_noAllocOrders; [ORDER_ITEMS:25]Quantity:3; STK_ar_NoAllocQuantities)
		
		//SELECTION TO ARRAY([CODE USES]Use;ST_ai_StatusUsage)
		
		//break these down into order state
	Else 
		ARRAY TEXT:C222(STK_at_NoAlocProductCodes; 0)
		ARRAY TEXT:C222(STK_at_noAllocOrders; 0)
		ARRAY REAL:C219(STK_ar_NoAllocQuantities; 0)
		
	End if 
	USE SET:C118("$allocated")
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
	Case of 
		: (Records in selection:C76([MOVEMENT_TYPES:60])>1)
			SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_DeliveryMovementTypes)
			QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_DeliveryMovementTypes)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_StockOINumbers; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40; STK_ar_DeliveredQuantities)
			
		: (Records in selection:C76([MOVEMENT_TYPES:60])=1)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=[MOVEMENT_TYPES:60]Type_Code:1)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_StockOINumbers; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40; STK_ar_DeliveredQuantities)
		Else 
			ARRAY LONGINT:C221($_al_StockOINumbers; 0)
			ARRAY REAL:C219(STK_ar_DeliveredQuantities; 0)
	End case 
	If (Size of array:C274(STK_ar_DeliveredQuantities)>0)
		SORT ARRAY:C229($_al_StockOINumbers; STK_ar_DeliveredQuantities; >)
		For ($_l_Index; Size of array:C274($_al_StockOINumbers); 1; -1)
			If ($_l_Index>1)
				If ($_al_StockOINumbers{$_l_Index-1}=($_al_StockOINumbers{$_l_Index}))
					STK_ar_DeliveredQuantities{$_l_Index-1}:=STK_ar_DeliveredQuantities{$_l_Index}+STK_ar_DeliveredQuantities{$_l_Index-1}
					DELETE FROM ARRAY:C228(STK_ar_DeliveredQuantities; $_l_Index)
					DELETE FROM ARRAY:C228($_al_StockOINumbers; $_l_Index)
				End if 
			End if 
		End for 
		QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_StockOINumbers)
		CREATE SET:C116([ORDER_ITEMS:25]; "$Delivered")
		//note this bit below to cope with part deliveries
		ARRAY LONGINT:C221(STK_al_PartDeliveredItemNumbees; 0)
		ARRAY REAL:C219(STK_ar_PartDeliveredQuantities; 0)
		ARRAY REAL:C219(STK_ar_PDOrdererdQuantites; 0)
		SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers; [ORDER_ITEMS:25]Quantity:3; $_ar_OrderItemQuantities)
		For ($_l_ProductCodesIndex; 1; Size of array:C274($_al_OrderItemNumbers))
			$_l_StockItemRow:=Find in array:C230($_al_StockOINumbers; $_al_OrderItemNumbers{$_l_ProductCodesIndex})
			If ($_l_StockItemRow>0)
				If (STK_ar_DeliveredQuantities{$_l_StockItemRow}<$_ar_OrderItemQuantities{$_l_ProductCodesIndex})
					APPEND TO ARRAY:C911(STK_al_PartDeliveredItemNumbees; $_al_OrderItemNumbers{$_l_ProductCodesIndex})
					APPEND TO ARRAY:C911(STK_ar_PartDeliveredQuantities; STK_ar_DeliveredQuantities{$_l_StockItemRow})
					APPEND TO ARRAY:C911(STK_ar_PDOrdererdQuantites; $_ar_OrderItemQuantities{$_l_ProductCodesIndex})
				End if 
				
			End if 
			
		End for 
	Else 
		CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "$Delivered")
		ARRAY LONGINT:C221(STK_al_PartDeliveredItemNumbees; 0)
		ARRAY REAL:C219(STK_ar_PartDeliveredQuantities; 0)
		ARRAY REAL:C219(STK_ar_PDOrdererdQuantites; 0)
	End if 
	DIFFERENCE:C122("$allocated"; "$Delivered"; "$NotDelivered")
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
	SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Minus:4; $_at_FreeStockTypes)
	Case of 
		: (Records in selection:C76([MOVEMENT_TYPES:60])>1)
			SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_allocationStockMovements)
			QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_allocationStockMovements)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; STK_al_AllocStockOINumbers; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; STK_ar_AllocQuantities; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; STK_at_AllocProducts)
			
			
		: (Records in selection:C76([MOVEMENT_TYPES:60])=1)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=[MOVEMENT_TYPES:60]Type_Code:1)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; STK_al_AllocStockOINumbers; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; STK_ar_AllocQuantities; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; STK_at_AllocProducts)
			
		Else 
			ARRAY TEXT:C222(STK_at_AllocProducts; 0)
			ARRAY LONGINT:C221(STK_al_AllocStockOINumbers; 0)
			ARRAY REAL:C219(STK_ar_AllocQuantities; 0)
	End case 
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; STK_at_ProductCodes)
	CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$allProducts")
	ARRAY DATE:C224(STK_ad_ExpectedDeliveryDate; 0)
	
	Case of 
		: (Records in selection:C76([MOVEMENT_TYPES:60])>1)
			SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_POMovementTypes)
			QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_POMovementTypes)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; STK_al_OrderedPOItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; STK_at_PurchaseOrderCodes; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40; STK_ar_PurchasedQuantities; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; STK_ar_OutstandingQuantities; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; STK_at_PurchProducts; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43; STK_at_DeliveryNumber; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44; STK_ad_ExpectedDeliveryDate)
			
			
			
		: (Records in selection:C76([MOVEMENT_TYPES:60])=1)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=[MOVEMENT_TYPES:60]Type_Code:1)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; STK_al_OrderedPOItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; STK_at_PurchaseOrderCodes; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40; STK_ar_PurchasedQuantities; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; STK_ar_OutstandingQuantities; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; STK_at_PurchProducts; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43; STK_at_DeliveryNumber; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44; STK_ad_ExpectedDeliveryDate)
			
		Else 
			ARRAY TEXT:C222(STK_at_PurchaseOrderCodes; 0)
			ARRAY LONGINT:C221(STK_al_OrderedPOItemNumbers; 0)
			ARRAY REAL:C219(STK_ar_PurchasedQuantities; 0)
			ARRAY REAL:C219(STK_ar_OutstandingQuantities; 0)
			ARRAY TEXT:C222(STK_at_PurchProducts; 0)
			ARRAY TEXT:C222(STK_at_DeliveryNumber; 0)
			ARRAY DATE:C224(STK_ad_ExpectedDeliveryDate; 0)
	End case 
	USE SET:C118("$allProducts")
	QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_FreeStockTypes)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; STK_ar_FreeQuantities; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; STK_at_FreeProducts; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; STK_at_MovementCodes; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; STK_ar_UnitCostPrice)
	
	ARRAY TEXT:C222(STK_at_PoNumbers; 0)
	ARRAY REAL:C219(STK_ar_QuantitiesOnOrder; 0)
	ARRAY TEXT:C222(STK_at_ALOCSoItemNumbers; 0)  //Note text of because multiple
	ARRAY REAL:C219(STK_ar_AllocationsQuantities; 0)
	ARRAY TEXT:C222(STK_at_FREEMovementCodes; 0)  //Note text of because multiple
	ARRAY REAL:C219(STK_ar_FreeStockQuantites; 0)
	$_l_CountProductCodes:=Size of array:C274(STK_at_ProductCodes)
	//`on order
	ARRAY TEXT:C222(STK_at_PoNumbers; $_l_CountProductCodes)
	ARRAY REAL:C219(STK_ar_QuantitiesOnOrder; $_l_CountProductCodes)
	//`allocated to orders
	ARRAY TEXT:C222(STK_at_ALOCSoItemNumbers; $_l_CountProductCodes)  //Note text of because multiple
	ARRAY REAL:C219(STK_ar_AllocationsQuantities; $_l_CountProductCodes)
	//free stock
	ARRAY TEXT:C222(STK_at_FREEMovementCodes; $_l_CountProductCodes)  //Note text of because multiple
	ARRAY REAL:C219(STK_ar_FreeStockQuantites; $_l_CountProductCodes)
	
	ARRAY TEXT:C222(STK_at_NoAllocOrderCodes; $_l_CountProductCodes)  //Note text of because multiple
	ARRAY REAL:C219(STK_ar_NoAllocStockQuantites; $_l_CountProductCodes)
	
	//ARRAY TEXT(STK_at_AllocProducts;0)
	//ARRAY LONGINT(STK_al_AllocStockOINumbers;0)
	//ARRAY REAL(STK_ar_AllocQuantities;0)
	For ($_l_ProductCodesIndex; 1; $_l_CountProductCodes)
		$_t_productCode:=STK_at_ProductCodes{$_l_ProductCodesIndex}
		$_l_Start:=1
		$_bo_ProductCodesIndexnserted:=False:C215
		Repeat 
			$_l_StockItemRow:=Find in array:C230(STK_at_PurchProducts; $_t_productCode; $_l_Start)
			If ($_l_StockItemRow>0)
				$_l_Start:=$_l_StockItemRow+1
				If (Not:C34($_bo_ProductCodesIndexnserted))
					$_bo_ProductCodesIndexnserted:=True:C214
					STK_at_PoNumbers{$_l_ProductCodesIndex}:=STK_at_PurchaseOrderCodes{$_l_StockItemRow}
					STK_ar_QuantitiesOnOrder{$_l_ProductCodesIndex}:=STK_ar_OutstandingQuantities{$_l_StockItemRow}
				Else 
					If (STK_at_PoNumbers{$_l_ProductCodesIndex}#STK_at_PurchaseOrderCodes{$_l_StockItemRow})
						STK_at_PoNumbers{$_l_ProductCodesIndex}:="Multiple"
					End if 
					STK_ar_QuantitiesOnOrder{$_l_ProductCodesIndex}:=STK_ar_QuantitiesOnOrder{$_l_ProductCodesIndex}+STK_ar_OutstandingQuantities{$_l_StockItemRow}
				End if 
			End if 
			
			
		Until ($_l_StockItemRow<0)
		$_l_Start:=1
		$_bo_ProductCodeInserted:=False:C215
		Repeat 
			$_l_StockItemRow:=Find in array:C230(STK_at_FreeProducts; $_t_productCode; $_l_Start)
			If ($_l_StockItemRow>0)
				$_l_Start:=$_l_StockItemRow+1
				If (Not:C34($_bo_ProductCodeInserted))
					$_bo_ProductCodeInserted:=True:C214
					STK_at_FREEMovementCodes{$_l_ProductCodesIndex}:=STK_at_MovementCodes{$_l_StockItemRow}
					STK_ar_FreeStockQuantites{$_l_ProductCodesIndex}:=STK_ar_FreeQuantities{$_l_StockItemRow}
				Else 
					If (STK_at_FREEMovementCodes{$_l_ProductCodesIndex}#STK_at_MovementCodes{$_l_StockItemRow})
						STK_at_FREEMovementCodes{$_l_ProductCodesIndex}:="Multiple"
					End if 
					STK_ar_FreeStockQuantites{$_l_ProductCodesIndex}:=STK_ar_FreeStockQuantites{$_l_ProductCodesIndex}+STK_ar_FreeQuantities{$_l_StockItemRow}
				End if 
			End if 
			
			
		Until ($_l_StockItemRow<0)
		$_l_Start:=1
		$_bo_ProductCodeInserted:=False:C215
		Repeat 
			$_l_StockItemRow:=Find in array:C230(STK_at_AllocProducts; $_t_productCode; $_l_Start)
			If ($_l_StockItemRow>0)
				$_l_Start:=$_l_StockItemRow+1
				If (Not:C34($_bo_ProductCodeInserted))
					$_bo_ProductCodeInserted:=True:C214
					STK_at_ALOCSoItemNumbers{$_l_ProductCodesIndex}:=String:C10(STK_al_AllocStockOINumbers{$_l_StockItemRow})
					STK_ar_AllocationsQuantities{$_l_ProductCodesIndex}:=STK_ar_AllocQuantities{$_l_StockItemRow}
				Else 
					If (STK_at_ALOCSoItemNumbers{$_l_ProductCodesIndex}#String:C10(STK_at_MovementCodes{$_l_StockItemRow}))
						STK_at_ALOCSoItemNumbers{$_l_ProductCodesIndex}:="Multiple"
					End if 
					STK_ar_AllocationsQuantities{$_l_ProductCodesIndex}:=STK_ar_AllocationsQuantities{$_l_ProductCodesIndex}+STK_ar_AllocationsQuantities{$_l_StockItemRow}
				End if 
			End if 
			
			
		Until ($_l_StockItemRow<0)
		
		
		$_l_Start:=1
		$_bo_ProductCodeInserted:=False:C215
		Repeat 
			$_l_StockItemRow:=Find in array:C230(STK_at_NoAlocProductCodes; $_t_productCode; $_l_Start)
			If ($_l_StockItemRow>0)
				$_l_Start:=$_l_StockItemRow+1
				If (Not:C34($_bo_ProductCodeInserted))
					$_bo_ProductCodeInserted:=True:C214
					STK_at_NoAllocOrderCodes{$_l_ProductCodesIndex}:=(STK_at_noAllocOrders{$_l_StockItemRow})
					STK_ar_NoAllocStockQuantites{$_l_ProductCodesIndex}:=STK_ar_NoAllocQuantities{$_l_StockItemRow}
				Else 
					If (STK_at_NoAllocOrderCodes{$_l_ProductCodesIndex}#String:C10(STK_at_noAllocOrders{$_l_StockItemRow}))
						STK_at_NoAllocOrderCodes{$_l_ProductCodesIndex}:="Multiple"
					End if 
					STK_ar_NoAllocStockQuantites{$_l_ProductCodesIndex}:=STK_ar_NoAllocStockQuantites{$_l_ProductCodesIndex}+STK_ar_NoAllocQuantities{$_l_StockItemRow}
				End if 
			End if 
			
			
		Until ($_l_StockItemRow<0)
		
	End for 
	
	Open window:C153($3; $4; $3; $4; 1999)
	DIALOG:C40([USER:15]; "STK_ShowCurrentStock")
	CLOSE WINDOW:C154
	Process_End
	If (STK_l_CallBackProcessID>0)
		If (Process state:C330(STK_l_CallBackProcessID)>=0)
			SET PROCESS VARIABLE:C370(STK_l_CallBackProcessID; STK_l_ProductProcesses; 0)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("STK_ShowSupplierProducts"; $_t_oldMethodName)
