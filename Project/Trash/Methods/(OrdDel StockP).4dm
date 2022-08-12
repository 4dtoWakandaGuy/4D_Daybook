//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrdDel StockP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2010 11:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_OIModified; 0)
	ARRAY BOOLEAN:C223($_abo_ProductMaintainStock; 0)
	ARRAY DATE:C224($_ad_DeliveryDate; 0)
	ARRAY DATE:C224($_ad_POPurchaseOrderDates; 0)
	ARRAY INTEGER:C220($_ai_OISortOrder; 0)
	ARRAY LONGINT:C221($_al_ArraySize; 0)
	ARRAY LONGINT:C221($_al_CSItemNumbers; 0)
	ARRAY LONGINT:C221($_al_CSStockNumbers; 0)
	ARRAY LONGINT:C221($_al_CurrentStockRecordIDS; 0)
	ARRAY LONGINT:C221($_al_ForceRecalc; 0)
	ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
	ARRAY LONGINT:C221($_al_SIAllocatedItemIDS; 0)
	ARRAY LONGINT:C221($_al_UnallocatedFromItem; 0)
	ARRAY LONGINT:C221($_al_UnallocatedStockItemID; 0)
	ARRAY POINTER:C280($_aptr_Fields; 0)
	ARRAY REAL:C219($_ar_AllocatedQuantities; 0)
	ARRAY REAL:C219($_ar_CSCostPrices; 0)
	ARRAY REAL:C219($_ar_CSQuantities; 0)
	ARRAY REAL:C219($_ar_DeliveredThisTIme; 0)
	ARRAY REAL:C219($_ar_OICostAmounts; 0)
	ARRAY REAL:C219($_ar_OICostPrices; 0)
	ARRAY REAL:C219($_ar_OIDeliveredQuantities; 0)
	ARRAY REAL:C219($_ar_OIQuantity; 0)
	ARRAY REAL:C219($_ar_SIAllocatedItemQuantities; 0)
	ARRAY REAL:C219($_ar_UnallocatedQuantity; 0)
	ARRAY TEXT:C222($_at_OIInvoiceNumber; 0)
	ARRAY TEXT:C222($_at_AllocationMovementTypes; 0)
	ARRAY TEXT:C222($_at_CSLocations; 0)
	ARRAY TEXT:C222($_at_CSProductCodes; 0)
	ARRAY TEXT:C222($_at_CSSerialNumbers; 0)
	ARRAY TEXT:C222($_at_IncomingStockMovementTypes; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_OIProductCodes; 0)
	ARRAY TEXT:C222($_at_OIPurchaseOrderNumbers; 0)
	ARRAY TEXT:C222($_at_OISerialNumbers; 0)
	ARRAY TEXT:C222($_at_OISupplierCodes; 0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_StockMovementTypes; 0)
	//ARRAY TEXT(STK_at_AllocationAds;0)
	//ARRAY TEXT(STK_at_allocationMovement;0)
	//ARRAY TEXT(STK_at_POAds;0)
	//ARRAY TEXT(STK_at_POMovement;0)
	//ARRAY TEXT(STK_at_unAllocationAds;0)
	//ARRAY TEXT(STK_at_unallocationMovement;0)
	C_BOOLEAN:C305(<>PersAnOver; <>StockAnal; <>StockPostAu; <>StockPostIn; $_bo_AlertTimes; $_bo_CheckStockItemTypeIndex; $_bo_Edits; $_bo_IsAnalysed; $_bo_MaintainStock; $_bo_NoWarning; $_bo_Skip)
	C_BOOLEAN:C305($_bo_Update; $_bo_UseISO; DB_bo_RecordModified; STK_bo_AllocTypesKnown; STK_bo_DeferValidation; STK_bo_inTransaction)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_StockItemsHeaderDateWas; $_d_TransactionDate; STK_d_DeliveryDate)
	C_LONGINT:C283($_l_AddtoCSID; $_l_AllocationUpdateProcess; $_l_CheckUnallocationsIndex; $_l_DeliveredIndex; $_l_DeliveryReference; $_l_DuplicateIndex; $_l_Index; $_l_IsFound; $_l_LinesCreated; $_l_OIOrderItemNumber; $_l_PeriodID)
	C_LONGINT:C283($_l_PostCSIndex; $_l_PostIndex; $_l_PostMovementProcess; $_l_RecordsInselection; $_l_SizeOfArray2; $_l_TakeFromCurrentStockID; $_l_UnallocationIndex; $_l_UnallocationRow; xNext)
	C_REAL:C285($_r_Allocated; $_r_CalledOff; $_r_Cost; $_r_CurrentAllocateQuantity; $_r_DeliverOnly; $_r_PossibleAllocatedQuantity; $_r_Quantity; $_r_QuantitytoDeliver; $_r_ToAllocate; $_r_ToAllocateQuantity; $_r_ToDeliver)
	C_REAL:C285($_r_TotalAllocatedQuantity; $_r_TotalCost; $_r_UnallocatedSum)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>Per_t_CurrentDefaultAnalCode; <>SYS_t_LastSavedTableName; $_t_AddToType; $_t_AnalysisCode; $_t_CompanyCode; $_t_CompanyCodeOLD; $_t_Currency; $_t_CurrencyCode; $_t_CurrentFormUsage; $_t_CurrentFormUsage2)
	C_TEXT:C284($_t_LayerCode; $_t_LocationCode; $_t_MovementType; $_t_oldMethodName; $_t_OrderCode; $_t_PeriodCode; $_t_StatusOLD; $_t_StockMovementType; $_t_StockTypeMinus; $_t_TimeTakenMessage; $0)
	C_TEXT:C284($1; $2; $3; $4; $5; $6; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; STK_T_DELIVERYREFERENCE)
	C_TEXT:C284(vCompCode; Vstatus)
	C_TIME:C306($_ti_p0Time; $_ti_p1Time; $_ti_p2Time; $_ti_p3Time; $_ti_p4Time; $_ti_P5Time; $_ti_P7Time)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrdDel StockP")
//OrdDel StockP
$_bo_AlertTimes:=False:C215

READ WRITE:C146([STOCK_MOVEMENTS:40])
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
READ WRITE:C146([STOCK_LEVELS:58])
READ WRITE:C146([CURRENT_STOCK:62])
//TRACE
$_ti_p0Time:=Current time:C178
$_ti_p1Time:=Current time:C178
$_ti_p2Time:=Current time:C178
$_ti_p3Time:=Current time:C178
$_ti_p4Time:=Current time:C178
$_ti_P5Time:=Current time:C178
//This should create a delivery for the allocated quantity(or allocate stock and thats the delivered quantity as well. it will return the delivery reference
$_r_Cost:=0
OK:=1
$0:=""
If (Count parameters:C259<6)
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
Else 
	If ([MOVEMENT_TYPES:60]Type_Code:1#$6)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$6)
	End if 
	If ($6="")
		$_bo_NoWarning:=True:C214
	End if 
End if 

If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
	If (Not:C34($_bo_NoWarning))
		Gen_Alert("Please create a Stock Movement Type suitable for Delivery Notes before using "+"this function"; "Cancel")
		OK:=0
	Else 
		OK:=1
	End if 
Else 
	OK:=1
	If (Records in selection:C76([MOVEMENT_TYPES:60])>1)
		Check_MinorFS("Movement Type"; ->[MOVEMENT_TYPES:60]; ->[MOVEMENT_TYPES:60]Type_Code:1; ->[MOVEMENT_TYPES:60]Type_Name:2)
	End if 
	If (OK=1)
		//  START TRANSACTION
		ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
		//FIRST RECORD([ORDER ITEMS])
		ARRAY INTEGER:C220($_ai_OISortOrder; 0)
		ARRAY TEXT:C222($_at_OrderCodes; 0)
		ARRAY TEXT:C222($_at_OIInvoiceNumber; 0)
		ARRAY DATE:C224($_ad_DeliveryDate; 0)
		ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
		ARRAY REAL:C219($_ar_OIQuantity; 0)
		ARRAY TEXT:C222($_at_OIProductCodes; 0)
		ARRAY REAL:C219($_ar_AllocatedQuantities; 0)
		ARRAY TEXT:C222($_at_OIPurchaseOrderNumbers; 0)
		ARRAY DATE:C224($_ad_POPurchaseOrderDates; 0)
		ARRAY TEXT:C222($_at_OISupplierCodes; 0)
		ARRAY REAL:C219($_ar_OICostPrices; 0)
		ARRAY TEXT:C222($_at_OISerialNumbers; 0)
		ARRAY REAL:C219($_ar_OICostAmounts; 0)
		ARRAY REAL:C219($_ar_OIDeliveredQuantities; 0)
		SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Sort_Order:26; $_ai_OISortOrder; [ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes; [ORDER_ITEMS:25]Invoice_Number:17; $_at_OIInvoiceNumber; [ORDER_ITEMS:25]Delivery_Date:11; $_ad_DeliveryDate; [ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers; [ORDER_ITEMS:25]Quantity:3; $_ar_OIQuantity; [ORDER_ITEMS:25]Product_Code:2; $_at_OIProductCodes; [ORDER_ITEMS:25]Allocated:28; $_ar_AllocatedQuantities; [ORDER_ITEMS:25]Purchase_Order_Number:18; $_at_OIPurchaseOrderNumbers; [ORDER_ITEMS:25]Purchase_Order_Date:19; $_ad_POPurchaseOrderDates; [ORDER_ITEMS:25]Supplier_Code:20; $_at_OISupplierCodes; [ORDER_ITEMS:25]Cost_Price:5; $_ar_OICostPrices; [ORDER_ITEMS:25]Serial_Number:24; $_at_OISerialNumbers; [ORDER_ITEMS:25]Cost_Amount:15; $_ar_OICostAmounts; [ORDER_ITEMS:25]Delivered:51; $_ar_OIDeliveredQuantities)
		ARRAY REAL:C219($_ar_DeliveredThisTIme; 0)
		ARRAY REAL:C219($_ar_DeliveredThisTIme; Size of array:C274($_ai_OISortOrder))
		
		$_al_ArraySize:=Size of array:C274($_ai_OISortOrder)
		ARRAY BOOLEAN:C223($_abo_OIModified; 0)
		ARRAY BOOLEAN:C223($_abo_OIModified; $_al_ArraySize)
		ARRAY TEXT:C222($_at_ProductCodes; 0)
		ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
		For ($_l_Index; 1; Size of array:C274($_at_OIProductCodes))
			If ($_at_OIProductCodes{$_l_Index}#"")
				APPEND TO ARRAY:C911($_at_ProductCodes; $_at_OIProductCodes{$_l_Index})
			End if 
			If ($_at_OIInvoiceNumber{$_l_Index}#"")
				APPEND TO ARRAY:C911($_at_InvoiceNumbers; $_at_OIInvoiceNumber{$_l_Index})
			End if 
		End for 
		$_ti_p1Time:=Current time:C178
		QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
		SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]Maintain_Stock:14; $_abo_ProductMaintainStock)
		StartTransaction
		
		$_bo_MaintainStock:=False:C215
		//Create a Movement
		
		
		If (Count parameters:C259>=1)
			$_t_CurrentFormUsage2:=$1  //<-Pass DB_t_CurrentFormUsage2
			
			$_t_CompanyCode:=$2
			$_t_CurrencyCode:=$3
			$_t_AnalysisCode:=$4
			$_t_LayerCode:=$5
		Else 
			$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
			RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
			$_t_CompanyCode:=[ORDERS:24]Company_Code:1
			$_t_CurrencyCode:=[ORDERS:24]Currency_Code:32
			$_t_AnalysisCode:=[ORDERS:24]Analysis_Code:33
			$_t_LayerCode:=[ORDERS:24]Layer_Code:47
			
		End if 
		ARRAY LONGINT:C221($_al_ForceRecalc; 0)
		
		CREATE RECORD:C68([STOCK_MOVEMENTS:40])
		Movement_Code
		[STOCK_MOVEMENTS:40]MovementSourceTable:16:=Table:C252(->[ORDERS:24])
		[STOCK_MOVEMENTS:40]MovementSourceField:17:=Field:C253(->[ORDERS:24]Order_Code:3)
		[STOCK_MOVEMENTS:40]Company_From:2:=$_t_CompanyCode
		[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
		If ((Records in selection:C76([MOVEMENT_TYPES:60])>0) & ([MOVEMENT_TYPES:60]Stock_Minus:4#"") & ([MOVEMENT_TYPES:60]Stock_Plus:3#""))
			[STOCK_MOVEMENTS:40]Type_Number:4:=MoveTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
			If (<>StockPostIn)  //(DB_t_CurrentFormUsage="ID")
				
				If (Size of array:C274($_at_InvoiceNumbers)>0)
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{1})
					[STOCK_MOVEMENTS:40]Movement_Date:5:=[INVOICES:39]Invoice_Date:4
				Else 
					If (Size of array:C274($_ad_DeliveryDate)>0)
						[STOCK_MOVEMENTS:40]Movement_Date:5:=$_ad_DeliveryDate{1}
					Else 
						[STOCK_MOVEMENTS:40]Movement_Date:5:=[ORDER_ITEMS:25]Delivery_Date:11
					End if 
				End if 
			Else 
				If (Size of array:C274($_ad_DeliveryDate)>0)
					[STOCK_MOVEMENTS:40]Movement_Date:5:=$_ad_DeliveryDate{1}
				Else 
					[STOCK_MOVEMENTS:40]Movement_Date:5:=[ORDER_ITEMS:25]Delivery_Date:11
				End if 
			End if 
			If ([STOCK_MOVEMENTS:40]Movement_Date:5=!00-00-00!)
				[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
			End if 
			If ($_t_CurrencyCode#"")
				[STOCK_MOVEMENTS:40]Currency_Code:10:=$_t_CurrencyCode
			Else 
				[STOCK_MOVEMENTS:40]Currency_Code:10:=<>SYS_t_BaseCurrency
			End if 
			If (($_t_AnalysisCode="") & (<>PersAnOver))
				[STOCK_MOVEMENTS:40]Analysis_Code:9:=<>Per_t_CurrentDefaultAnalCode
			Else 
				[STOCK_MOVEMENTS:40]Analysis_Code:9:=$_t_AnalysisCode
			End if 
			If ($_t_LayerCode#"")
				[STOCK_MOVEMENTS:40]Layer_Code:11:=$_t_LayerCode
			Else 
				[STOCK_MOVEMENTS:40]Layer_Code:11:=DB_GetLedgerActualLayer
			End if 
			FIRST RECORD:C50([ORDER_ITEMS:25])
			
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_IsFound)
			
			$_l_DeliveryReference:=1
			STK_T_DELIVERYREFERENCE:=""
			Repeat 
				STK_T_DELIVERYREFERENCE:=[ORDER_ITEMS:25]Order_Code:1+"/"+String:C10($_l_DeliveryReference)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45=STK_T_DELIVERYREFERENCE)
				If ($_l_IsFound>0)
					$_l_DeliveryReference:=$_l_DeliveryReference+1
				End if 
			Until ($_l_IsFound=0)
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			
			//Add the Stock Items
			$_t_MovementType:=[MOVEMENT_TYPES:60]Type_Code:1
			If (Not:C34(STK_bo_AllocTypesKnown))
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_POAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_POMovement)
				
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_AllocationAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_allocationMovement)
				
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Minus:4; STK_at_unAllocationAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_unallocationMovement)
				
				STK_bo_AllocTypesKnown:=True:C214
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
			SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationMovementTypes)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]UseForStockReceipt:33=True:C214)
			SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_IncomingStockMovementTypes)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
			$_ti_p2Time:=Current time:C178
			$_l_LinesCreated:=0
			For ($_l_PostIndex; 1; $_al_ArraySize)
				//While ((Not(End selection([ORDER ITEMS]))) & (OK=1))
				$_l_UnallocationRow:=Find in array:C230($_at_ProductCodes; $_at_OIProductCodes{$_l_PostIndex})
				If ($_l_UnallocationRow>0)
					$_bo_MaintainStock:=$_abo_ProductMaintainStock{$_l_UnallocationRow}
				Else 
					$_bo_MaintainStock:=False:C215
				End if 
				
				If ($_bo_MaintainStock)
					While (Semaphore:C143("CurrentStock"+$_at_OIProductCodes{$_l_PostIndex}))  //Prevent any other process from creating the same stock level
						ALERT:C41("in OrDel StockP")
						
						DelayTicks(2)
					End while 
					$_r_ToDeliver:=($_ar_OIQuantity{$_l_PostIndex}-$_ar_OIDeliveredQuantities{$_l_PostIndex})
					$_r_ToAllocate:=$_ar_OIQuantity{$_l_PostIndex}-$_ar_AllocatedQuantities{$_l_PostIndex}
					$_r_DeliverOnly:=0
					If ($_r_ToAllocate>$_r_ToDeliver)
						//Somhow the delivery quantity is marked without an allocation made
						$_r_DeliverOnly:=$_r_ToAllocate-$_r_ToDeliver
					End if 
					If ([MOVEMENT_TYPES:60]Alloc_Type:10) & ($_r_ToAllocate>0)
						If (Not:C34($_bo_CheckStockItemTypeIndex))
							ARRAY POINTER:C280($_aptr_Fields; 7)
							$_aptr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
							$_aptr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
							$_aptr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
							$_aptr_Fields{4}:=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							$_aptr_Fields{5}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
							$_aptr_Fields{6}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
							$_aptr_Fields{7}:=->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
							
							CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_Fields; Standard BTree index:K58:3; "StockAllocatable")
							
							$_bo_CheckStockItemTypeIndex:=True:C214
						End if 
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_OIProductCodes{$_l_PostIndex}; *)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0; *)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
						If (<>StockAnal)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_t_AnalysisCode; *)
						Else 
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28="@"; *)
						End if 
						If ($_t_LayerCode#"")
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$_t_LayerCode; *)
						Else 
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27="@"; *)
						End if 
						If ($_t_CurrencyCode#"")
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_t_CurrencyCode)
						Else 
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=<>SYS_t_BaseCurrency)
						End if 
						
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_IncomingStockMovementTypes)
						
						//here we shoud get stock at the correct location
						COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$UseForDel")
						$_r_QuantitytoDeliver:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
						If ($_r_QuantitytoDeliver>$_r_ToAllocate-$_r_DeliverOnly)
							$_r_QuantitytoDeliver:=$_r_ToAllocate-$_r_DeliverOnly
						End if 
						
						
					Else 
						//Delivery only-get the allocated quantities
						If ($_r_ToAllocate>$_r_ToDeliver)
							$_r_ToDeliver:=$_r_ToDeliver-($_r_ToAllocate-$_r_ToDeliver)
						End if 
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=$_al_OrderItemNumbers{$_l_PostIndex})
						SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25; $_al_UnallocatedFromItem; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_UnallocatedQuantity; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_UnallocatedStockItemID)
						$_bo_UseISO:=False:C215
						
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=$_al_OrderItemNumbers{$_l_PostIndex})
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_OrderItemNumbers{$_l_PostIndex})
							$_bo_UseISO:=True:C214
						End if 
						//QUERY SELECTION WITH ARRAY([STOCK ITEMS]xstockMovementType;$AllocMoves)
						If (Size of array:C274(STK_at_AllocationAds)>1)
							QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; STK_at_AllocationAds)
						Else 
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=STK_at_AllocationAds{1})
						End if 
						
						
						
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_StockMovementTypes)
						If (Size of array:C274($_at_StockMovementTypes)>=1)
							If (Not:C34($_bo_UseISO))
								$_l_UnallocationRow:=Find in array:C230($_at_StockMovementTypes; STK_at_allocationMovement{1})
								If ($_l_UnallocationRow<0)
									$_t_StockMovementType:=$_at_StockMovementTypes{1}
								Else 
									$_t_StockMovementType:=$_at_StockMovementTypes{$_l_UnallocationRow}
								End if 
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=$_t_StockMovementType)
							Else 
								QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; STK_at_AllocationAds)
								
							End if 
						End if 
						$_r_UnallocatedSum:=0
						//TRACE
						$_r_QuantitytoDeliver:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
						SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SIAllocatedItemIDS; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_SIAllocatedItemQuantities)
						For ($_l_CheckUnallocationsIndex; 1; Size of array:C274($_al_UnallocatedFromItem))
							$_l_UnallocationRow:=Find in array:C230($_al_SIAllocatedItemIDS; $_al_UnallocatedStockItemID{$_l_CheckUnallocationsIndex})
							If ($_l_UnallocationRow>0)
								$_r_UnallocatedSum:=$_r_UnallocatedSum+$_ar_UnallocatedQuantity{$_l_CheckUnallocationsIndex}
							End if 
						End for 
						
						$_r_QuantitytoDeliver:=$_r_QuantitytoDeliver-$_r_UnallocatedSum
						If ($_r_QuantitytoDeliver>($_r_ToDeliver))
							$_r_QuantitytoDeliver:=$_r_ToDeliver
						End if 
						
						
						COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$UseForDel")
					End if 
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
					
					$_bo_MaintainStock:=True:C214
					If ($_r_QuantitytoDeliver>0)
						//This is the quantity we are gong to deliver
						$_r_ToDeliver:=$_r_QuantitytoDeliver
						USE NAMED SELECTION:C332("$UseForDel")
						$_l_RecordsInselection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
						For ($_l_DuplicateIndex; 1; $_l_RecordsInselection)
							USE NAMED SELECTION:C332("$UseForDel")
							GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_DuplicateIndex)
							If ($_r_ToDeliver>0)
								If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
									STK_ItemDuplicate
									$_l_LinesCreated:=$_l_LinesCreated
									//APPEND TO ARRAY($_al_ForceRecalc;[STOCK_MOVEMENT_ITEMS]x_ID)
									
									
									$_r_CalledOff:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									$_t_AddToType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
									$_l_AddtoCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
									$_t_Currency:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
									$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
									$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
									$_t_LocationCode:=[STOCK_MOVEMENT_ITEMS:27]Location:7
									$_l_OIOrderItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8  //This will only be filled in if its allocated-we will move the allocation from the on order item to the instock item.
									
									$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
									[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
									If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>=$_r_ToDeliver)
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_ToDeliver
										$_r_ToDeliver:=0
									Else 
										$_r_ToDeliver:=$_r_ToDeliver-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									End if 
									$_ar_DeliveredThisTIme{$_l_PostIndex}:=$_ar_DeliveredThisTIme{$_l_PostIndex}+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_OrderItemNumbers{$_l_PostIndex}
									If ([MOVEMENT_TYPES:60]Alloc_Type:10)
										[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=$_al_OrderItemNumbers{$_l_PostIndex}
									Else 
										[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
									End if 
									
									[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=$_t_CompanyCode
									[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=$_at_OrderCodes{$_l_PostIndex}
									[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									
									[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									$_l_TakeFromCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
									[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_TakeFromCurrentStockID
									[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
									[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
									[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									
									$_d_StockItemsHeaderDateWas:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
									If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26#[STOCK_MOVEMENTS:40]Movement_Date:5)
										[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=[STOCK_MOVEMENTS:40]Movement_Date:5
									End if 
									[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_t_LayerCode
									[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_t_LocationCode
									[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_t_AnalysisCode
									[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_t_Currency
									[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
									If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27#[STOCK_MOVEMENTS:40]Layer_Code:11)
										[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=[STOCK_MOVEMENTS:40]Layer_Code:11
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28#[STOCK_MOVEMENTS:40]Analysis_Code:9)
										[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[STOCK_MOVEMENTS:40]Analysis_Code:9
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#[STOCK_MOVEMENTS:40]Currency_Code:10)
										If ($_d_StockItemsHeaderDateWas=!00-00-00!)
											$_d_StockItemsHeaderDateWas:=Current date:C33(*)
										End if 
										If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#0)
											[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=Cat_ConvertValue([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENTS:40]Currency_Code:10; $_d_StockItemsHeaderDateWas)
										End if 
										[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[STOCK_MOVEMENTS:40]Currency_Code:10
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#[STOCK_MOVEMENTS:40]Movement_Type:6)
										[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=[STOCK_MOVEMENTS:40]Movement_Type:6
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
										[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
									End if 
									If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39) | ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40<0)
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
										[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
									Else 
										[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
									End if 
									[STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45:=STK_T_DELIVERYREFERENCE
									//[ORDER ITEMS]Item_Locked:=False
									$_bo_Edits:=STK_SetHeaderInfo
									[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
									[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19:=0
									//note that the trigger will update the called off on the previous stock..that is the trigger on the stock movement
									//this is so if we cancell the stock movement we dont make the amount wrong preventing a call off(make sure is we cancel that the items here get deleted)
									<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
									Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									//If ([STOCK_MOVEMENT_ITEMS]X_CopiedFromID>0)
									//While (Test semaphore("$SettingCalledOff"))
									//DelayTicks (3)
									//End while
									//$_l_NewProcessess:=New process("STK_SetCalledOffInProcess";128000;"Set Called Off";[STOCK_MOVEMENT_ITEMS]X_CopiedFromID;[STOCK_MOVEMENT_ITEMS]Quantity;Current process)
									//While (Test semaphore("$SettingCalledOff"))
									//DelayTicks (3)
									//End while
									//End if
									$_ar_OIDeliveredQuantities{$_l_PostIndex}:=$_ar_OIDeliveredQuantities{$_l_PostIndex}+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									If ([MOVEMENT_TYPES:60]Alloc_Type:10)
										$_ar_AllocatedQuantities{$_l_PostIndex}:=$_ar_AllocatedQuantities+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									End if 
								End if 
							End if 
							
							
						End for 
					End if 
				Else 
					$_ar_OIDeliveredQuantities{$_l_PostIndex}:=$_ar_OIQuantity{$_l_PostIndex}
				End if 
				
				If (False:C215)
					If ($_al_OrderItemNumbers{$_l_PostIndex}=0)
						REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
					Else 
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=$_al_OrderItemNumbers{$_l_PostIndex})
						OrdDel_AllowSrc
					End if 
					$_bo_Skip:=False:C215
					If ($_t_CurrentFormUsage2#"Alloc")
						
						If (($_ar_OIQuantity{$_l_PostIndex}<0) & (Records in selection:C76([CURRENT_STOCK:62])=0))
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_OIProductCodes{$_l_PostIndex})
							QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3=[MOVEMENT_TYPES:60]Stock_Plus:3)
							CREATE SET:C116([CURRENT_STOCK:62]; "$productMatching")
							$_t_CompanyCodeOLD:=vCompCode
							vCompCode:=$_t_CompanyCode
							READ WRITE:C146([CURRENT_STOCK:62])
							USE SET:C118("$productMatching")
							QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5#0; *)
							QUERY SELECTION:C341([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Quantity:4>0)
							StockCurr_ACLSr(False:C215)
							If (Records in selection:C76([CURRENT_STOCK:62])>0)
								QUERY SELECTION BY FORMULA:C207([CURRENT_STOCK:62]; OrdDel_StkPNegS)  // this piece of code changes the current order item record anyway so how this ever could have worked!
								
							End if 
							vCompCode:=$_t_CompanyCodeOLD
							//USE NAMED SELECTION("$ODOI")
							$_r_PossibleAllocatedQuantity:=Gen_Round(Sum:C1([CURRENT_STOCK:62]Quantity:4); 2; 6)
							$_r_ToAllocateQuantity:=Abs:C99($_ar_OIQuantity{$_l_PostIndex})
							If ($_r_PossibleAllocatedQuantity<$_r_ToAllocateQuantity)
								Gen_Confirm3("There is insufficient Current "+[MOVEMENT_TYPES:60]Stock_Plus:3+" Stock of "+$_at_OIProductCodes{$_l_PostIndex}+" for this customer.  Do you want to create negative "+[MOVEMENT_TYPES:60]Stock_Plus:3+" Stock?"; "Skip"; "Cancel"; "Negative")
								If (OK=1) | (xNext=1)
									If (xNext=0)
										$_bo_Skip:=True:C214
									End if 
								End if 
							Else 
								If (Records in selection:C76([CURRENT_STOCK:62])>1)
									$_r_PossibleAllocatedQuantity:=0
									COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$ODCS")
									While ((OK=1) & ($_r_PossibleAllocatedQuantity<$_r_ToAllocateQuantity))
										$_t_StatusOLD:=Vstatus
										vStatus:=[MOVEMENT_TYPES:60]Stock_Plus:3
										StockI_CurrDisp("Select returning Current Stock")
										$_r_PossibleAllocatedQuantity:=Gen_Round(Sum:C1([CURRENT_STOCK:62]Quantity:4); 2; 6)
										If ($_r_PossibleAllocatedQuantity<$_r_ToAllocateQuantity)
											Gen_Alert("Please select sufficient Stock to cover a Quantity of "+String:C10($_r_ToAllocateQuantity); "Try again")
											USE NAMED SELECTION:C332("$ODCS")
										End if 
									End while 
									CLEAR NAMED SELECTION:C333("$ODCS")
								End if 
								
								If (OK=1)
									$_r_TotalAllocatedQuantity:=$_r_ToAllocateQuantity
									$_r_Allocated:=0
									$_r_TotalCost:=0
									CREATE EMPTY SET:C140([CURRENT_STOCK:62]; "$CS")
									SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CurrentStockRecordIDS)
									$_l_RecordsInselection:=Records in selection:C76([CURRENT_STOCK:62])
									
									FIRST RECORD:C50([CURRENT_STOCK:62])
									CREATE EMPTY SET:C140([CURRENT_STOCK:62]; "USED")
									For ($_l_UnallocationIndex; 1; $_l_RecordsInselection)
										QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_CurrentStockRecordIDS{$_l_UnallocationIndex})
										If ($_r_Allocated<$_r_TotalAllocatedQuantity) & (OK=1)
											//While ((Not(End selection([CURRENT STOCK]))) & ($_r_Allocated<$_r_TotalAllocatedQuantity) & (OK=1))
											
											$_l_AllocationUpdateProcess:=New process:C317("STK_MovePostLevelinProcess"; 64000; "Update Allocation "+[CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; -1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
											
											
											If (OK=1)
												$_r_Quantity:=$_r_ToAllocateQuantity
												If ($_r_Quantity>[CURRENT_STOCK:62]Quantity:4)
													$_r_Quantity:=[CURRENT_STOCK:62]Quantity:4
												End if 
												If ((([CURRENT_STOCK:62]Serial_Number:2#"") & ([CURRENT_STOCK:62]Quantity:4=1)) | ([CURRENT_STOCK:62]Quantity:4=$_r_Quantity))
													RELATE ONE:C42([CURRENT_STOCK:62]Item_Number:5)
													[CURRENT_STOCK:62]Item_Number:5:=0
													$_r_TotalCost:=$_r_TotalCost+[CURRENT_STOCK:62]Total_Cost:9
													If ([CURRENT_STOCK:62]X_ID:13=0)
														[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
													End if 
													ADD TO SET:C119([CURRENT_STOCK:62]; "USED")
													DB_SaveRecord(->[CURRENT_STOCK:62])
													AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
													If (OK=1)
														ADD TO SET:C119([CURRENT_STOCK:62]; "$CS")
														//Move_PostLevCur (->[CURRENT STOCK]Stock Type;1)
														$_l_AllocationUpdateProcess:=New process:C317("STK_MovePostLevelinProcess"; 64000; "Update Allocation "+[CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; 1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
														
													End if 
												Else 
													[CURRENT_STOCK:62]Quantity:4:=Gen_Round(([CURRENT_STOCK:62]Quantity:4-$_r_Quantity); 2; 6)
													[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
													If ([CURRENT_STOCK:62]X_ID:13=0)
														[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
													End if 
													
													DB_SaveRecord(->[CURRENT_STOCK:62])
													AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
													//Move_PostLevCur (->[CURRENT STOCK]Stock Type;1)
													$_l_AllocationUpdateProcess:=New process:C317("STK_MovePostLevelinProcess"; 64000; "Update Allocation "+[CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; 1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
													
													COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$SC")
													DUPLICATE RECORD:C225([CURRENT_STOCK:62])
													[CURRENT_STOCK:62]X_ID:13:=0
													[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
													[CURRENT_STOCK:62]Stock_Number:7:=Gen_Code(18; ->[CURRENT_STOCK:62]Stock_Number:7)
													[CURRENT_STOCK:62]Quantity:4:=$_r_Quantity
													[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
													$_r_TotalCost:=$_r_TotalCost+[CURRENT_STOCK:62]Total_Cost:9
													[CURRENT_STOCK:62]Item_Number:5:=0
													If ([CURRENT_STOCK:62]X_ID:13=0)
														[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
													End if 
													
													DB_SaveRecord(->[CURRENT_STOCK:62])
													ADD TO SET:C119([CURRENT_STOCK:62]; "USED")
													AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
													If (OK=1)
														ADD TO SET:C119([CURRENT_STOCK:62]; "$CS")
														//Move_PostLevCur (->[CURRENT STOCK]Stock Type;1)
														$_l_AllocationUpdateProcess:=New process:C317("STK_MovePostLevelinProcess"; 64000; "Update Allocation "+[CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; 1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
														
													End if 
													USE NAMED SELECTION:C332("$SC")
													CLEAR NAMED SELECTION:C333("$SC")
												End if 
												$_r_Allocated:=Round:C94(($_r_Allocated+$_r_Quantity); 2)
												$_r_ToAllocateQuantity:=Round:C94(($_r_ToAllocateQuantity-$_r_Quantity); 2)
												[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
												//  [ORDER ITEMS]Allocated:=Round(([ORDER ITEMS]Allocated+$_r_Quantity);2)
												//  DB_SaveRecord(->[ORDER ITEMS])
												AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
											End if 
											NEXT RECORD:C51([CURRENT_STOCK:62])
											//  End if
											//End while
										Else 
											$_l_UnallocationIndex:=$_l_RecordsInselection
										End if 
									End for 
									USE SET:C118("USED")
									CLEAR SET:C117("USED")
									
									USE SET:C118("$CS")
									
									If (OK=1)
										//NB: this searches for the Current Stock again
										USE NAMED SELECTION:C332("$ODOI")
										
										$_ar_OICostPrices{$_l_PostIndex}:=Gen_Round(($_r_TotalCost/$_r_TotalAllocatedQuantity); 2; 2)
										$_abo_OIModified{$_l_PostIndex}:=True:C214
										//Calc_Item <--do this when you update the order items
										
										If ([CURRENT_STOCK:62]X_ID:13=0)
											[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
										End if 
										
										//DB_SaveRecord (->[ORDER ITEMS])
										AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
										//NB: cannot do OrderI_AllOIUp here to make it recalc Alloc on negatives
										//cos is the wrong Item - would have to be above, but is not easy
									End if 
								End if 
								
							End if 
							USE NAMED SELECTION:C332("$ODSTKP")
							USE NAMED SELECTION:C332("$ODOI")
							CLEAR NAMED SELECTION:C333("$ODOI")
						Else 
							
							$_r_CurrentAllocateQuantity:=Gen_Round(Sum:C1([CURRENT_STOCK:62]Quantity:4); 2; 6)
							If ($_ar_OIQuantity{$_l_PostIndex}>$_r_CurrentAllocateQuantity)
								//New Rollo & Tony Allocation bit
								$_ar_AllocatedQuantities{$_l_PostIndex}:=$_r_CurrentAllocateQuantity
								$_abo_OIModified{$_l_PostIndex}:=True:C214
								READ WRITE:C146([CURRENT_STOCK:62])
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_OIProductCodes{$_l_PostIndex}; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=[MOVEMENT_TYPES:60]Stock_Minus:4; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Quantity:4>0)
								StockCurr_ACLSr(False:C215)
								$_r_PossibleAllocatedQuantity:=Gen_Round(Sum:C1([CURRENT_STOCK:62]Quantity:4); 2; 6)
								$_r_ToAllocateQuantity:=Gen_Round(($_ar_OIQuantity{$_l_PostIndex}-$_r_CurrentAllocateQuantity); 2; 6)
								$_r_TotalAllocatedQuantity:=$_r_ToAllocateQuantity
								If (Records in selection:C76([CURRENT_STOCK:62])>0)
									OK:=1
									$_r_Allocated:=0
									SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CurrentStockRecordIDS)
									$_l_RecordsInselection:=Records in selection:C76([CURRENT_STOCK:62])
									
									FIRST RECORD:C50([CURRENT_STOCK:62])
									CREATE EMPTY SET:C140([CURRENT_STOCK:62]; "USED")
									//NG major mod here-no longer update the currect stock quantities
									For ($_l_UnallocationIndex; 1; $_l_RecordsInselection)
										QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_CurrentStockRecordIDS{$_l_UnallocationIndex})
										If (($_r_Allocated<$_r_TotalAllocatedQuantity) & ($_ar_AllocatedQuantities{$_l_PostIndex}<$_ar_OIQuantity{$_l_PostIndex}) & (OK=1))
											//While ((Not(End selection([CURRENT STOCK]))) & ($_r_Allocated<$_r_TotalAllocatedQuantity) & ($_ar_AllocatedQuantities{$_l_PostIndex}<$_ar_OIQuantity{$_l_PostIndex}) & (OK=1))
											OrderI_AllSTChk([CURRENT_STOCK:62]Stock_Type:3)  //4.0.036b
											
											If (OK=1)
												//Move_PostLevCur (->[CURRENT STOCK]Stock Type;-1)
												$_bo_IsAnalysed:=STK_IsProductAnalysed([CURRENT_STOCK:62]Product_Code:1)
												
												If (Not:C34($_bo_IsAnalysed))
													$_l_AllocationUpdateProcess:=New process:C317("STK_MovePostLevelinProcess"; 64000; "Update Allocation "+[CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; -1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
												End if 
												$_r_Quantity:=$_r_ToAllocateQuantity
												If ($_r_Quantity>[CURRENT_STOCK:62]Quantity:4)
													$_r_Quantity:=[CURRENT_STOCK:62]Quantity:4
												End if 
												If ((([CURRENT_STOCK:62]Serial_Number:2#"") & ([CURRENT_STOCK:62]Quantity:4=1)) | ([CURRENT_STOCK:62]Quantity:4=$_r_Quantity))
													If (Not:C34($_bo_IsAnalysed))
														[CURRENT_STOCK:62]Item_Number:5:=$_al_OrderItemNumbers{$_l_PostIndex}
														If ([CURRENT_STOCK:62]X_ID:13=0)
															[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
														End if 
													End if 
													DB_SaveRecord(->[CURRENT_STOCK:62])
													ADD TO SET:C119([CURRENT_STOCK:62]; "USED")
													AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
													If (OK=1)
														//Move_PostLevCur (->[CURRENT STOCK]Stock Type;1)
														If (Not:C34($_bo_IsAnalysed))
															$_l_AllocationUpdateProcess:=New process:C317("STK_MovePostLevelinProcess"; 64000; "Update Allocation "+[CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; 1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
														End if 
													End if 
													
												Else 
													If (Not:C34($_bo_IsAnalysed))
														[CURRENT_STOCK:62]Quantity:4:=Gen_Round(([CURRENT_STOCK:62]Quantity:4-$_r_Quantity); 2; 6)
														[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
													End if 
													If ([CURRENT_STOCK:62]X_ID:13=0)
														[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
													End if 
													
													DB_SaveRecord(->[CURRENT_STOCK:62])
													AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
													//Move_PostLevCur (->[CURRENT STOCK]Stock Type;1)
													If (Not:C34($_bo_IsAnalysed))
														
														$_l_AllocationUpdateProcess:=New process:C317("STK_MovePostLevelinProcess"; 64000; "Update Allocation "+[CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; 1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
													End if 
													COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$SC")
													If (Not:C34($_bo_IsAnalysed))
														DUPLICATE RECORD:C225([CURRENT_STOCK:62])
														[CURRENT_STOCK:62]X_ID:13:=0
														[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
														[CURRENT_STOCK:62]Stock_Number:7:=Gen_Code(18; ->[CURRENT_STOCK:62]Stock_Number:7)
														[CURRENT_STOCK:62]Quantity:4:=$_r_Quantity
														[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
														[CURRENT_STOCK:62]Item_Number:5:=$_al_OrderItemNumbers{$_l_PostIndex}
														DB_SaveRecord(->[CURRENT_STOCK:62])
														AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
													End if 
													ADD TO SET:C119([CURRENT_STOCK:62]; "USED")
													If (OK=1)
														//Move_PostLevCur (->[CURRENT STOCK]Stock Type;1)
														If (Not:C34($_bo_IsAnalysed))
															$_l_AllocationUpdateProcess:=New process:C317("STK_MovePostLevelinProcess"; 64000; "Update Allocation "+[CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; 1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
														End if 
													End if 
													USE NAMED SELECTION:C332("$SC")
													CLEAR NAMED SELECTION:C333("$SC")
												End if 
												$_r_Allocated:=Round:C94(($_r_Allocated+$_r_Quantity); 2)
												$_r_ToAllocateQuantity:=Round:C94(($_r_ToAllocateQuantity-$_r_Quantity); 2)
												$_ar_AllocatedQuantities{$_l_PostIndex}:=Round:C94(($_ar_AllocatedQuantities{$_l_PostIndex}+$_r_Quantity); 2)
												$_abo_OIModified{$_l_PostIndex}:=True:C214
												//DB_SaveRecord (->[ORDER ITEMS])
												//AA_CheckFileUnlocked (->[ORDER ITEMS]x_ID)
												NEXT RECORD:C51([CURRENT_STOCK:62])
											End if 
											//End while
										Else 
											$_l_UnallocationIndex:=$_l_RecordsInselection
										End if 
									End for 
									USE SET:C118("USED")
									CLEAR SET:C117("USED")
									
								End if 
								
								If (OK=1)
									//NB: this searches for the Current Stock again
									$_bo_Update:=OrderItem_AllocationUpdate(->$_at_OIPurchaseOrderNumbers{$_l_PostIndex}; ->$_ad_POPurchaseOrderDates{$_l_PostIndex}; ->$_ar_AllocatedQuantities{$_l_PostIndex}; ->$_at_OISupplierCodes{$_l_PostIndex}; $_at_OIProductCodes{$_l_PostIndex}; $_ar_OIQuantity{$_l_PostIndex}; $_al_OrderItemNumbers{$_l_PostIndex}; ->$_ar_OICostAmounts{$_l_PostIndex}; ->$_at_OISerialNumbers{$_l_PostIndex}; ->$_ar_OICostPrices{$_l_PostIndex})
									
									
									
									If ($_bo_Update)
										$_abo_OIModified{$_l_PostIndex}:=True:C214
									End if 
									//OrderI_AllOIUp
									OrdDel_AllowSrc  //added 4.0.038 cos the above proc doesn't now do this
									
								End if 
							End if 
						End if 
					End if 
					
					If ((OK=1) & ($_bo_Skip=False:C215))
						$_r_PossibleAllocatedQuantity:=0
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							FIRST RECORD:C50([CURRENT_STOCK:62])
							SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Product_Code:1; $_at_CSProductCodes; [CURRENT_STOCK:62]Item_Number:5; $_al_CSItemNumbers; [CURRENT_STOCK:62]Quantity:4; $_ar_CSQuantities; [CURRENT_STOCK:62]Cost_Price:6; $_ar_CSCostPrices; [CURRENT_STOCK:62]Stock_Number:7; $_al_CSStockNumbers; [CURRENT_STOCK:62]Serial_Number:2; $_at_CSSerialNumbers; [CURRENT_STOCK:62]Location:8; $_at_CSLocations)
							
							$_l_SizeOfArray2:=Size of array:C274($_at_CSProductCodes)
							For ($_l_PostCSIndex; 1; $_l_SizeOfArray2)
								CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
								[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
								[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_at_CSProductCodes{$_l_PostCSIndex}
								If ($_ar_CSQuantities{$_l_PostCSIndex}>=0)  //4.0.030
									
									[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_CSItemNumbers{$_l_PostCSIndex}
									[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=""
									[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_CSQuantities{$_l_PostCSIndex}
								Else 
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Gen_Round((0-$_ar_CSQuantities{$_l_PostCSIndex}); 2; 6)
								End if 
								[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=$_t_CompanyCode
								[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=$_at_OrderCodes{$_l_PostIndex}
								$_r_PossibleAllocatedQuantity:=Gen_Round(($_r_PossibleAllocatedQuantity+$_ar_CSQuantities{$_l_PostCSIndex}); 2; 6)
								[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_ar_CSCostPrices{$_l_PostCSIndex}
								[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
								
								[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=$_al_CSStockNumbers{$_l_PostCSIndex}
								[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=$_at_CSSerialNumbers{$_l_PostCSIndex}
								[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_at_CSLocations{$_l_PostCSIndex}
								$_r_Cost:=$_r_Cost+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
								[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								[STOCK_MOVEMENTS:40]Company_From:2:=$_t_CompanyCode
								$_bo_Edits:=STK_SetHeaderInfo
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
								AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							End for 
						End if 
						
						If ($_t_CurrentFormUsage2="Alloc")
							$_r_Quantity:=$_ar_AllocatedQuantities{$_l_PostIndex}
						Else 
							If ($_ar_OIQuantity{$_l_PostIndex}<0)
								$_r_Quantity:=Abs:C99($_ar_OIQuantity{$_l_PostIndex})
							Else 
								$_r_Quantity:=$_ar_OIQuantity{$_l_PostIndex}
							End if 
						End if 
						If (($_r_PossibleAllocatedQuantity<$_r_Quantity) & (OK=1))
							$_r_Quantity:=Round:C94(($_r_Quantity-$_r_PossibleAllocatedQuantity); 2)
							If ($_r_Quantity>0)
								CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
								[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
								[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_at_OIProductCodes{$_l_PostIndex}
								If ($_ar_AllocatedQuantities{$_l_PostIndex}>=0)  //4.0.030
									
									[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_OrderItemNumbers{$_l_PostIndex}
									[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=$_t_CompanyCode
									[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=$_at_OrderCodes{$_l_PostIndex}
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Quantity
								Else 
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Gen_Round((0-$_r_Quantity); 2; 6)
								End if 
								[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_ar_OICostPrices{$_l_PostIndex}
								[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
								
								[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=$_at_OISerialNumbers{$_l_PostIndex}
								$_r_Cost:=$_r_Cost+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
								[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								$_bo_Edits:=STK_SetHeaderInfo
								
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
								AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							End if 
						End if 
						
					End if 
				End if 
				CLEAR SEMAPHORE:C144("CurrentStock"+$_at_OIProductCodes{$_l_PostIndex})
				
				
				//NEXT RECORD([ORDER ITEMS])
				//End while
			End for 
			$_ti_p3Time:=Current time:C178
			$_ti_p4Time:=Current time:C178
			If (($_bo_MaintainStock) & (OK=1))
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					
					[STOCK_MOVEMENTS:40]Total_Cost:8:=Round:C94(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
					STK_bo_DeferValidation:=True:C214
					STK_bo_inTransaction:=True:C214
					DB_SaveRecord(->[STOCK_MOVEMENTS:40])
					$_ti_p4Time:=Current time:C178
					$0:=STK_T_DELIVERYREFERENCE
					
					//$_l_UnallocationRow:=Find in array($_abo_OIModified;True)  `Just be careful that nothing above changed the sort order!!!
					//If ($_l_UnallocationRow>0)
					QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers)
					
					ARRAY TO SELECTION:C261($_ar_AllocatedQuantities; [ORDER_ITEMS:25]Allocated:28; $_at_OIPurchaseOrderNumbers; [ORDER_ITEMS:25]Purchase_Order_Number:18; $_ad_POPurchaseOrderDates; [ORDER_ITEMS:25]Purchase_Order_Date:19; $_at_OISupplierCodes; [ORDER_ITEMS:25]Supplier_Code:20; $_ar_OICostPrices; [ORDER_ITEMS:25]Cost_Price:5; $_ar_OICostAmounts; [ORDER_ITEMS:25]Cost_Amount:15; $_at_OISerialNumbers; [ORDER_ITEMS:25]Serial_Number:24; $_ar_OIDeliveredQuantities; [ORDER_ITEMS:25]Delivered:51; $_ar_AllocatedQuantities; [ORDER_ITEMS:25]Allocated:28)
					If (STK_d_DeliveryDate=!00-00-00!)
						STK_d_DeliveryDate:=Current date:C33(*)
					End if 
					For ($_l_DeliveredIndex; 1; Size of array:C274($_ar_OIDeliveredQuantities))
						If ($_ar_OIDeliveredQuantities{$_l_DeliveredIndex}>0)
							//this item is  delivered
							If ($_ar_DeliveredThisTIme{$_l_DeliveredIndex}=$_ar_OIQuantity{$_l_DeliveredIndex})
								//this item is fully delivered on this delivery
								QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_OrderItemNumbers{$_l_DeliveredIndex})
								If ([ORDER_ITEMS:25]Delivery_Number:49="")
									[ORDER_ITEMS:25]Delivery_Number:49:=STK_T_DELIVERYREFERENCE
									[ORDER_ITEMS:25]Delivery_Date:11:=STK_d_DeliveryDate
									SAVE RECORD:C53([ORDER_ITEMS:25])
								End if 
							Else 
								QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_OrderItemNumbers{$_l_DeliveredIndex})
								
								[ORDER_ITEMS:25]Delivery_Number:49:=[ORDER_ITEMS:25]Order_Code:1+"/M"
								[ORDER_ITEMS:25]Delivery_Date:11:=STK_d_DeliveryDate
								ORDI_setDelivered
								SAVE RECORD:C53([ORDER_ITEMS:25])
								
							End if 
						End if 
						
					End for 
					QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers)
					
					APPLY TO SELECTION:C70([ORDER_ITEMS:25]; Calc_Item)
				Else 
					$0:=""
					OK:=0
					Transact_End  // 13/05/02 pb
					
				End if 
				
				//End if
			Else 
				OK:=0
				Transact_End  // 13/05/02 pb
				
			End if 
			
			If (OK=1)
				$_bo_MaintainStock:=False:C215
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
				Move_InLPACheck
				If ((DB_t_CurrentFormUsage2#"NC") & (<>StockPostAu=False:C215) & (OK=1))
					Gen_Confirm("Do you want to view the Stock Movement before posting to accounting ledgers?"; "View"; "Post now")
					If (OK=1)
						$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
						DB_t_CurrentFormUsage:="Mod"
						FORM SET INPUT:C55([STOCK_MOVEMENTS:40]; "Movements_In13")  //NG April 2004 removed reference to ◊screen
						
						Open_Pro_Window("Delivery Stock Movement"; 0; 2; ->[STOCK_MOVEMENTS:40]; "Movements_In13")
						MODIFY RECORD:C57([STOCK_MOVEMENTS:40]; *)
						Close_ProWin(Table name:C256(->[STOCK_MOVEMENTS:40])+"_"+"Movements_In13")
						
						DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
						$_bo_MaintainStock:=True:C214
					Else 
						OK:=1
					End if 
				End if 
				
				If ((OK=1) & ($_bo_MaintainStock=False:C215))
					[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
					SAVE RECORD:C53([STOCK_MOVEMENTS:40])
					RELATE ONE:C42([STOCK_MOVEMENTS:40]Movement_Type:6)
					
					If (Application type:C494=4D Remote mode:K5:5)
						
						$_t_StockTypeMinus:=Move_InTypeChk
						If ($_t_StockTypeMinus="")
							If ([MOVEMENT_TYPES:60]Trans_Code:17#"")
								//`there will be an invoice posting
								$_l_PeriodID:=Check_Period([STOCK_MOVEMENTS:40]Movement_Date:5)
								$_t_PeriodCode:=""
								$_d_TransactionDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
								Check_PerClose(->$_t_PeriodCode; ->$_d_TransactionDate)
								If ($_t_PeriodCode="")
									$_t_PeriodCode:=[PERIODS:33]Period_Code:1
								End if 
								If ($_d_TransactionDate=!00-00-00!)
									$_d_TransactionDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
								End if 
							Else 
								$_t_PeriodCode:=""
								$_d_TransactionDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
							End if 
							If ($_d_TransactionDate=!00-00-00!)
								Gen_Alert("The   posting of this of "+Term_StoWT("Stock")+" Movement has not taken place:"+" no valid Period found."; "")
								OK:=0
								Transact_End  //
								
							Else 
								Transact_End
								$_l_PostMovementProcess:=Execute on server:C373("Move_InPost"; 128000; "Post Stock Movement"+[STOCK_MOVEMENTS:40]Movement_Code:1; [STOCK_MOVEMENTS:40]Movement_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6; False:C215; DB_t_CurrentFormUsage; $_t_PeriodCode)
								//If (Size of array($_al_ForceRecalc)>0) & (False)
								//For ($_l_Index;1;Size of array($_al_ForceRecalc))
								//QUERY([STOCK_MOVEMENT_ITEMS];[STOCK_MOVEMENT_ITEMS]x_ID=$_al_ForceRecalc{$_l_Index})
								//STK_UpdateCalledOffQuantity   //here we ONLY update the stock movement items we copied from
								//<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
								//DB_SaveRecord (->[STOCK_MOVEMENT_ITEMS];False)
								
								//End for
								//End if
							End if 
						Else 
							Gen_Alert("Stock Type "+$_t_StockTypeMinus+" does not exist, so this Movement cannot be posted"; "Cancel")
							OK:=0
							Transact_End
						End if 
					Else 
						$_t_StockTypeMinus:=Move_InTypeChk
						If ($_t_StockTypeMinus="")
							Transact_End
							
							$_l_PostMovementProcess:=New process:C317("Move_InPost"; 64000; "Post Stock Movement"+[STOCK_MOVEMENTS:40]Movement_Code:1; [STOCK_MOVEMENTS:40]Movement_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6; True:C214; DB_t_CurrentFormUsage)
							//If (Size of array($_al_ForceRecalc)>0) & (False)
							//For ($_l_Index;1;Size of array($_al_ForceRecalc))
							//QUERY([STOCK_MOVEMENT_ITEMS];[STOCK_MOVEMENT_ITEMS]x_ID=$_al_ForceRecalc{$_l_Index})
							//STK_UpdateCalledOffQuantity   //here we ONLY update the stock movement items we copied from
							//<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
							//DB_SaveRecord (->[STOCK_MOVEMENT_ITEMS];False)
							
							//End for
							//End if
						Else 
							Gen_Alert("Stock Type "+$_t_StockTypeMinus+" does not exist, so this Movement cannot be posted"; "Cancel")
							OK:=0
							Transact_End
						End if 
						
					End if 
				End if 
			End if 
			$_ti_P5Time:=Current time:C178
		Else 
			Gen_Alert("The Delivery-Type Stock Movement must have both Plus and Minus Stock Types "+"defined."; "Cancel")
			OK:=0
			Transact_End  // 13/05/02 pb
			
		End if 
		If (OK=1)
			DB_bo_RecordModified:=True:C214
			DB_t_CallOnCloseorSave:="File"
		Else 
			If ($_bo_MaintainStock)
				Gen_Alert("The Stock Posting has been Cancelled"; "")
				OK:=0
			End if 
		End if 
		//    Transact EndNF
		
	End if 
End if 
STK_bo_inTransaction:=False:C215
READ ONLY:C145([STOCK_MOVEMENTS:40])
READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
READ ONLY:C145([STOCK_LEVELS:58])
READ ONLY:C145([CURRENT_STOCK:62])
UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
UNLOAD RECORD:C212([STOCK_LEVELS:58])
UNLOAD RECORD:C212([CURRENT_STOCK:62])

READ WRITE:C146([ORDER_ITEMS:25])

If ($_bo_AlertTimes)
	$_ti_P7Time:=Current time:C178
	$_t_TimeTakenMessage:="Total Time Taken For Creation of Delivery Movements "+String:C10($_ti_P7Time-$_ti_p0Time)+"Seconds"+Char:C90(13)
	$_t_TimeTakenMessage:=$_t_TimeTakenMessage+"Loading order items (Phase one) took"+String:C10($_ti_p1Time-$_ti_p0Time)+"Seconds"+Char:C90(13)
	$_t_TimeTakenMessage:=$_t_TimeTakenMessage+"Creating Stock movement no items (Phase two) took"+String:C10($_ti_p2Time-$_ti_p1Time)+"Seconds"+Char:C90(13)
	$_t_TimeTakenMessage:=$_t_TimeTakenMessage+"Creating Stock movement items (Phase three) took"+String:C10($_ti_p3Time-$_ti_p2Time)+"Seconds/ Average="+String:C10(($_ti_p3Time-$_ti_p2Time)/$_l_LinesCreated)+"per item"+Char:C90(13)
	$_t_TimeTakenMessage:=$_t_TimeTakenMessage+"Saving Stock movement and items (Phase four) took"+String:C10($_ti_p4Time-$_ti_p3Time)+"Seconds"+Char:C90(13)
	$_t_TimeTakenMessage:=$_t_TimeTakenMessage+"Posting and completion   (Phase five) took"+String:C10($_ti_P5Time-$_ti_p4Time)+"Seconds"+Char:C90(13)
	SET TEXT TO PASTEBOARD:C523($_t_TimeTakenMessage)
	ALERT:C41("On the clipboard"+$_t_TimeTakenMessage)
End if 
ERR_MethodTrackerReturn("OrdDel StockP"; $_t_oldMethodName)