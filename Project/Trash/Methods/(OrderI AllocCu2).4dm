//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI AllocCu2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/10/2013 18:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ORDI_ad_AllocExpectedDate;0)
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	ARRAY LONGINT:C221($_al_ForceRecalculation; 0)
	ARRAY LONGINT:C221($_al_PurchaseOrderItemNumbers; 0)
	ARRAY LONGINT:C221($_al_SelectedRowNumbers; 0)
	//ARRAY LONGINT(ORDI_al_AllocItemNumbers;0)
	//ARRAY LONGINT(ORDI_al_AllocStockRecordIDS;0;0)
	//ARRAY LONGINT(STK_al_CSIDtoallocate;0)
	//ARRAY LONGINT(STK_al_LineIndex;0)
	//ARRAY LONGINT(STK_al_SRIDtoallocate;0)
	ARRAY POINTER:C280($_aptr_StockMovementFields; 0)
	ARRAY REAL:C219($_ar_TotalCosts; 0)
	ARRAY REAL:C219($_ar_UnitCosts; 0)
	ARRAY REAL:C219($_ar_UnitQuantities; 0)
	//ARRAY REAL(ORDI_ar_AllocResidualStockQty;0)
	//ARRAY REAL(ORDI_ar_AllocStockPrice;0)
	//ARRAY REAL(ORDI_ar_AllocStockQty;0)
	ARRAY TEXT:C222($_at_AddtoStockTypes; 0)
	ARRAY TEXT:C222($_at_AllocationMovementTypes; 0)
	ARRAY TEXT:C222($_at_AllocationsTypes; 0)
	ARRAY TEXT:C222($_at_allocationTypeCodes; 0)
	ARRAY TEXT:C222($_at_AllocationTypeNames; 0)
	ARRAY TEXT:C222($_at_CurrenciesRange; 0)
	ARRAY TEXT:C222($_at_LocationsRange; 0)
	ARRAY TEXT:C222($_at_ProducNames; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_PurchaseMovementTypes; 0)
	ARRAY TEXT:C222($_at_SerialNumbers; 0)
	ARRAY TEXT:C222($_at_StockReceiptaddtoStockType; 0)
	ARRAY TEXT:C222($_at_StockReceiptaddtoStockType2; 0)
	ARRAY TEXT:C222($_at_StockReceiptTypes; 0)
	ARRAY TEXT:C222($_at_StockReceiptTypes2; 0)
	//ARRAY TEXT(ORD_at_AllocSerialNo;0)
	//ARRAY TEXT(ORDI_AT_AllocCURRENCY;0)
	//ARRAY TEXT(ORDI_At_AllocLocationCodes;0)
	//ARRAY TEXT(ORDI_at_AllocOrderCodes;0)
	//ARRAY TEXT(ORDI_at_AllocProductCodes;0)
	//ARRAY TEXT(ORDI_at_AlocStockTypes;0)
	//ARRAY TEXT(STK_at_AllStockTypes;0)
	//ARRAY TEXT(STK_at_DisProductNames;0)
	//ARRAY TEXT(STK_at_DisStockTypeNames;0)
	//ARRAY TEXT(STK_at_FilterTypes;0)
	C_BOOLEAN:C305(<>STK_bo_TypesInited; <>StockAnal; <>SYS_bo_QuitCalled; $_bo_AllocatedAsked; $_bo_CheckAllocated; $_bo_CheckedAllocated; $_bo_CheckedFreee; $_bo_CheckedOnOrder; $_bo_CheckOnOrder; $_bo_Continue; $_bo_EditsMade)
	C_BOOLEAN:C305($_bo_Exit; $_bo_Modified; $_bo_NoCommit; $_bo_OnOrderAsked; $_bo_Unallocate; $_bo_WarnZero; DB_bo_RecordModified; ORD_bo_NoRebuild; ORD_bo_Rebuild; STK_bo_AllocatedFromPO; STK_bo_AllocCLog)
	C_BOOLEAN:C305(STK_bo_DeferValidation; STK_bo_DoAllocate; STK_bo_DoooAllocate; STK_bo_inTransaction; STK_bo_ReloadScreen; STK_bo_ShowAllocated; STK_bo_ShowFREE; STK_bo_ShowOnOrder; STK_bo_SplitRemainder; STK_bo_unAllocate)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_StockItemHeaderDateWas)
	C_LONGINT:C283($_l_AddMode; $_l_AddtoCurrentStockID; $_l_AllocatedIndex; $_l_AllocateIndex; $_l_CheckForMoreIndex; $_l_CopiedFromMovementItemID; $_l_CurrenciesIndex; $_l_CurrentStockAllocated; $_l_DoDefaultsIndex; $_l_index2; $_l_ItemNumber)
	C_LONGINT:C283($_l_LocationsIndex; $_l_ProductSerialRow; $_l_RecordsInSelection; $_l_Required; $_l_Retries; $_l_Row; $_l_SelectedRowNumber; $_l_SerialsIndex; $_l_SizeofArray; $_l_StockCurrentOrderItem; $_l_StockMovementItemID)
	C_LONGINT:C283($_l_StockReceiptRow; $_l_TotalsIndex; ch1; DB_l_ButtonClickedFunction; STK_l_InitialPage; STK_l_OrderItemNumber; STL_l_CurrentFIlter; vAdd; vItemNum; vRecNo; xCancel)
	C_LONGINT:C283(xnext; xOK)
	C_REAL:C285($_r_AllocationQuantity; $_r_AverageUnityCost; $_r_CalledOffQuantity; $_r_Quantity; $_r_QuantityToSplitOFF; $_r_RemainderQuantity; $_r_RemainingQuantity; $_r_RemainingRequired; $_r_RequiredQuantity; $_r_ScreenHorizontalCenter; $_r_ScreenVerticalCenter)
	C_REAL:C285($_r_SumCosts; $_r_SumOfCosts; $_r_ToKeepFree; $_r_TotalResidualStockQuantity; STK_AllocationWIndowContext; STK_R_AllocatedQuantity; STK_R_QuantityRequired; vQuantity)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AddtoStockType; $_t_AnalysisCode; $_t_CloseSave; $_t_CurrencyCode; $_t_CurrentOutputform; $_t_LayerCode; $_t_LocationCode; $_t_oldMethodName; $_t_OrderCode; $_t_ProductCode)
	C_TEXT:C284(DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; STK_T_AllocfromAnalCode; STK_T_AllocFromLayerCode; STK_t_OrderCode; vProdCode; vProduct; vStatus; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI AllocCu2"; Form event code:C388)
//OrderI AllocCu2
//STK_bo_AllocCLog:=True
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
$_l_CurrentStockAllocated:=Find in array:C230(ST_ai_StatusUsage; 4)
STK_bo_ReloadScreen:=False:C215

If ($_l_CurrentStockAllocated>0)
	If (Not:C34(<>STK_bo_TypesInited))
		Order_Buttons
		<>STK_bo_TypesInited:=True:C214
	End if 
	If ((DB_t_CurrentFormUsage#"NA@") & ((DB_GetModuleSettingByNUM(Module_StockControl)=2) | (DB_GetModuleSettingByNUM(Module_StockControl)=4)) & ([ORDER_ITEMS:25]Item_Number:27#0) & ([ORDER_ITEMS:25]Quantity:3#0) & ([ORDER_ITEMS:25]Product_Code:2#""))
		
		
		DB_SaveRecord(->[ORDERS:24])
		AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)  //If put in causes duplicate orders
		
		
		[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		
		COPY NAMED SELECTION:C331([ORDERS:24]; "ALLOCOrders")
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "ALLOCOrder_Items")
		vStatus:=STK_at_AllStockTypes{STK_at_AllStockTypes}
		vProdCode:=[ORDER_ITEMS:25]Product_Code:2
		vRecNo:=Record number:C243([ORDER_ITEMS:25])
		vItemNum:=[ORDER_ITEMS:25]Item_Number:27
		ch1:=0
		// NG need to test this does not lock up the subsequent semaphore on the same machine.
		//semaphore here-because we are going to update the record probably
		While (Semaphore:C143("CurrentStock"+[ORDER_ITEMS:25]Product_Code:2))  //Prevent any other process from creating the same current stock
			ALERT:C41("in OrderI AllocCu2")
			
			DelayTicks(2)
		End while 
		//OrderI_AllStSr2   `
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationsTypes)
		
		
		//  START TRANSACTION
		//UNLOAD RECORD([STOCK ITEMS])
		//READ ONLY([STOCK ITEMS])
		
		//StartTransaction   `
		$_bo_WarnZero:=True:C214
		$_bo_Modified:=DB_bo_RecordModified
		$_t_CloseSave:=DB_t_CallOnCloseorSave
		$_l_AddMode:=vAdd
		vAdd:=0
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		vProduct:="Product:  "+Substring:C12([ORDER_ITEMS:25]Product_Code:2+": "+[PRODUCTS:9]Product_Name:2; 1; 40)
		//INPUT FORM([CURRENT STOCK];"StockCurr In"+◊Screen)
		//OUTPUT FORM([CURRENT STOCK];"StockCurr Alloc")
		
		//WIN_t_CurrentOutputform:="StockCurr Alloc"
		DB_bo_RecordModified:=False:C215
		DB_t_CallOnCloseorSave:="File"
		$_bo_CheckedFreee:=True:C214
		$_bo_CheckedAllocated:=False:C215
		
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]UseForStockReceipt:33=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_StockReceiptTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_StockReceiptaddtoStockType)
		
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_StockReceiptTypes2; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_StockReceiptaddtoStockType2)
		$_t_AnalysisCode:=[ORDERS:24]Analysis_Code:33
		$_t_LayerCode:=[ORDERS:24]Layer_Code:47
		For ($_l_index2; 1; Size of array:C274($_at_StockReceiptTypes2))
			$_l_StockReceiptRow:=Find in array:C230($_at_StockReceiptTypes; $_at_StockReceiptTypes2{$_l_index2})
			If ($_l_StockReceiptRow<0)
				APPEND TO ARRAY:C911($_at_StockReceiptTypes; $_at_StockReceiptTypes2{$_l_index2})
				APPEND TO ARRAY:C911($_at_StockReceiptaddtoStockType; $_at_StockReceiptaddtoStockType2{$_l_index2})
				
			End if 
		End for 
		ARRAY POINTER:C280($_aptr_StockMovementFields; 3)
		$_aptr_StockMovementFields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
		
		$_aptr_StockMovementFields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
		$_aptr_StockMovementFields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
		CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_StockMovementFields; Standard BTree index:K58:3; "SMIProductStock")
		
		
		
		
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27)  //Remember here because we are only including ISOs this will only be items ordered for this order item-it will not include allocations
		
		
		QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_StockReceiptaddtoStockType)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
			CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$s1")
			QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationsTypes)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$s2")
				DIFFERENCE:C122("$s1"; "$s2"; "$s1")
				USE SET:C118("$s1")
			Else 
				USE SET:C118("$s1")
			End if 
		End if 
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Allocatable")
		//STK_MenuUpdate ("Stock items";[STOCK ITEMS]Product Code;True)
		//Gen_Alert ("Called of validated")
		$_bo_CheckedFreee:=False:C215
		$_bo_CheckedOnOrder:=False:C215
		$_bo_CheckedAllocated:=False:C215
		STK_AllocationWIndowContext:=1
		$_bo_Unallocate:=False:C215
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
		READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
		StartTransaction
		USE NAMED SELECTION:C332("$Allocatable")
		If (Not:C34($_bo_CheckedFreee))
			If ([ORDER_ITEMS:25]Allocated:28=[ORDER_ITEMS:25]Quantity:3)
				// (Records in selection([STOCK ITEMS])=0)
				Gen_Alert("There is no stock to be allocated!"; "Continue")
				
				If (OK=1)  //z$Unallocate:=True
					
					
					//Else
					$_bo_CheckedFreee:=True:C214
					$_bo_CheckedOnOrder:=True:C214
					$_bo_CheckedAllocated:=True:C214
					
				End if 
				OK:=1
				//Else
				//$_bo_Unallocate:=True
				//End if
			End if 
		End if 
		$_bo_AllocatedAsked:=False:C215
		$_bo_OnOrderAsked:=False:C215
		ARRAY LONGINT:C221($_al_ForceRecalculation; 0)
		Repeat 
			$_bo_CheckAllocated:=False:C215
			$_bo_CheckOnOrder:=False:C215
			STK_T_AllocfromAnalCode:=[ORDERS:24]Analysis_Code:33
			STK_T_AllocFromLayerCode:=[ORDERS:24]Layer_Code:47
			If ((Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0) | ($_bo_Unallocate)) & (Not:C34($_bo_CheckedFreee))
				
				$_bo_CheckedFreee:=True:C214
				STK_T_AllocfromAnalCode:=[ORDERS:24]Analysis_Code:33
				STK_T_AllocFromLayerCode:=[ORDERS:24]Layer_Code:47
				$_t_AnalysisCode:=[ORDERS:24]Analysis_Code:33
				$_t_LayerCode:=[ORDERS:24]Layer_Code:47
				If (<>StockAnal)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_t_AnalysisCode)
				End if 
				If ($_t_LayerCode#"")
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$_t_LayerCode)
				End if 
				ARRAY TEXT:C222($_at_LocationsRange; 0)
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_LocationsRange)
				ARRAY TEXT:C222($_at_CurrenciesRange; 0)
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_CurrenciesRange)
				$_l_ProductSerialRow:=Find in array:C230($_at_CurrenciesRange; "")
				If ($_l_ProductSerialRow>0)
					DELETE FROM ARRAY:C228($_at_CurrenciesRange; $_l_ProductSerialRow)
				End if 
				If (Size of array:C274($_at_CurrenciesRange)=0)
					APPEND TO ARRAY:C911($_at_CurrenciesRange; <>SYS_t_BaseCurrency)
				End if 
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_AddtoStockTypes)
				COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$ForAllocation")
				ARRAY TEXT:C222(ORDI_at_AllocProductCodes; 0)
				
				ARRAY TEXT:C222(ORDI_at_AlocStockTypes; 0)
				ARRAY REAL:C219(ORDI_ar_AllocStockQty; 0)
				ARRAY REAL:C219(ORDI_ar_AllocResidualStockQty; 0)
				ARRAY REAL:C219(ORDI_ar_AllocStockPrice; 0)
				ARRAY TEXT:C222(ORDI_AT_AllocCURRENCY; 0)
				ARRAY TEXT:C222(ORD_at_AllocSerialNo; 0)
				ARRAY TEXT:C222(ORDI_At_AllocLocationCodes; 0)
				ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; 0; 0)
				ARRAY LONGINT:C221(ORDI_al_AllocItemNumbers; 0)
				For ($_l_SerialsIndex; 1; Size of array:C274($_at_AddtoStockTypes))
					For ($_l_CurrenciesIndex; 1; Size of array:C274($_at_CurrenciesRange))
						For ($_l_LocationsIndex; 1; Size of array:C274($_at_LocationsRange))
							USE NAMED SELECTION:C332("$ForAllocation")
							
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_at_AddtoStockTypes{$_l_SerialsIndex}; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Location:7=$_at_LocationsRange{$_l_LocationsIndex})
							If ($_at_CurrenciesRange{$_l_CurrenciesIndex}=<>SYS_t_BaseCurrency)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=<>SYS_t_BaseCurrency; *)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29="")
							Else 
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
							End if 
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
									APPEND TO ARRAY:C911(ORDI_At_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
									$_l_SizeofArray:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
									INSERT IN ARRAY:C227(ORDI_al_AllocStockRecordIDS; $_l_SizeofArray+1; 1)
									SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; ORDI_al_AllocStockRecordIDS{$_l_SizeofArray+1})
									FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
									APPEND TO ARRAY:C911(ORDI_al_AllocItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
									APPEND TO ARRAY:C911(ORDI_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
									APPEND TO ARRAY:C911(ORDI_at_AlocStockTypes; $_at_AddtoStockTypes{$_l_SerialsIndex})
									APPEND TO ARRAY:C911(ORDI_ar_AllocStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
									APPEND TO ARRAY:C911(ORDI_ar_AllocResidualStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
									SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_UnitCosts; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_UnitQuantities)
									FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
									ARRAY REAL:C219($_ar_TotalCosts; 0)
									ARRAY REAL:C219($_ar_TotalCosts; Size of array:C274($_ar_UnitQuantities))
									$_r_SumOfCosts:=0
									For ($_l_TotalsIndex; 1; Size of array:C274($_ar_UnitQuantities))
										$_ar_TotalCosts{$_l_TotalsIndex}:=$_ar_UnitQuantities{$_l_TotalsIndex}*$_ar_UnitCosts{$_l_TotalsIndex}
										$_r_SumOfCosts:=$_r_SumOfCosts+$_ar_TotalCosts{$_l_TotalsIndex}
									End for 
									$_r_AverageUnityCost:=$_r_SumOfCosts/(Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
									APPEND TO ARRAY:C911(ORDI_ar_AllocStockPrice; Round:C94($_r_AverageUnityCost; 2))
									APPEND TO ARRAY:C911(ORDI_AT_AllocCURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
									DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNumbers)
									$_l_ProductSerialRow:=Find in array:C230($_at_SerialNumbers; "")
									If ($_l_ProductSerialRow>0)
										DELETE FROM ARRAY:C228($_at_SerialNumbers; $_l_ProductSerialRow)
									End if 
									If (Size of array:C274($_at_SerialNumbers)>1)
										APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; "Various")
										
									Else 
										If (Size of array:C274($_at_SerialNumbers)>0)
											APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; $_at_SerialNumbers{1})
										Else 
											APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; "")
											
										End if 
									End if 
									
									
								Else 
									APPEND TO ARRAY:C911(ORDI_At_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
									APPEND TO ARRAY:C911(ORDI_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
									APPEND TO ARRAY:C911(ORDI_at_AlocStockTypes; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31)
									APPEND TO ARRAY:C911(ORDI_ar_AllocStockQty; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									APPEND TO ARRAY:C911(ORDI_ar_AllocResidualStockQty; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
									APPEND TO ARRAY:C911(ORDI_ar_AllocStockPrice; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
									$_l_SizeofArray:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
									INSERT IN ARRAY:C227(ORDI_al_AllocStockRecordIDS; $_l_SizeofArray+1; 1)
									APPEND TO ARRAY:C911(ORDI_al_AllocStockRecordIDS{$_l_SizeofArray+1}; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									APPEND TO ARRAY:C911(ORDI_AT_AllocCURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
									APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
									APPEND TO ARRAY:C911(ORDI_al_AllocItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
									
									
								End if 
							End if 
						End for 
					End for 
				End for 
				
				STK_R_AllocatedQuantity:=[ORDER_ITEMS:25]Allocated:28
				STK_R_QuantityRequired:=[ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28
				If (STK_R_QuantityRequired>0) | ($_bo_Unallocate) & (Size of array:C274(ORDI_al_AllocStockRecordIDS)>0)
					
					STK_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
					STK_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
					STK_bo_DoAllocate:=False:C215
					STK_bo_unAllocate:=False:C215
					STK_bo_ShowFREE:=True:C214
					STK_bo_ShowAllocated:=True:C214
					STK_bo_ShowOnOrder:=True:C214
					STK_l_InitialPage:=1
					STK_bo_DoooAllocate:=False:C215
					STK_bo_SplitRemainder:=False:C215
					If (Size of array:C274(ORDI_al_AllocStockRecordIDS)>1)
						Open_Pro_Window(Term_StoWT("Current Stock Allocation"); 0; 1; ->[CURRENT_STOCK:62]; "StockCurr Alloc")
						
						DIALOG:C40("STK_AllocationWIndow")
						CLOSE WINDOW:C154
					Else 
						$_l_Row:=1
						//````````
						$_r_RequiredQuantity:=STK_R_QuantityRequired
						ARRAY LONGINT:C221(STK_al_SRIDtoallocate; 0)
						If ($_l_Row>0)
							ARRAY LONGINT:C221(STK_al_SRIDtoallocate; 0)
							ARRAY LONGINT:C221($_al_SelectedRowNumbers; 1)
							$_al_SelectedRowNumbers{1}:=1
							For ($_l_DoDefaultsIndex; 1; 2)  //run through the selected twic-first only use the default-clear the row number so we dont do it a second time
								
								
								For ($_l_SerialsIndex; 1; Size of array:C274($_al_SelectedRowNumbers))
									$_l_SelectedRowNumber:=$_al_SelectedRowNumbers{$_l_SerialsIndex}
									If ($_l_DoDefaultsIndex=1)
										$_bo_Continue:=True:C214
									Else 
										//second pass
										$_bo_Continue:=True:C214
									End if 
									If (ORDI_al_AllocItemNumbers{$_l_SerialsIndex}=0)  //absolute prevention...
										
										
										
										
										
										If ($_bo_Continue)  // the following line will change to itterate the array of products..
											Case of 
												: (STK_R_QuantityRequired>0)
													//we dont need to know this..
													For ($_l_AllocatedIndex; 1; Size of array:C274(ORDI_al_AllocStockRecordIDS{1}))
														$_l_ProductSerialRow:=Find in array:C230(STK_al_SRIDtoallocate; ORDI_al_AllocStockRecordIDS{1}{$_l_AllocatedIndex})
														If ($_l_ProductSerialRow<0)
															APPEND TO ARRAY:C911(STK_al_SRIDtoallocate; ORDI_al_AllocStockRecordIDS{1}{$_l_AllocatedIndex})
														End if 
													End for 
													//there are enough to allocate-make sure you adjust quantity required after allocating
													ARRAY LONGINT:C221(STK_al_CSIDtoallocate; 0)
													//ARRAY REAL(STK_ar_CSQTYtoAllocate;0)
													//ARRAY LONGINT(STK_al_OIallocateTo;0)
													If (ORDI_ar_AllocResidualStockQty{$_l_SerialsIndex}>0)
														If (STK_R_QuantityRequired-ORDI_ar_AllocResidualStockQty{$_l_SerialsIndex}<0)
															STK_R_QuantityRequired:=0
														Else 
															STK_R_QuantityRequired:=STK_R_QuantityRequired-ORDI_ar_AllocResidualStockQty{$_l_SerialsIndex}
														End if 
														ORDI_ar_AllocResidualStockQty{$_l_SerialsIndex}:=0
														
													End if 
											End case 
											If (STK_R_QuantityRequired<=0)
												$_bo_Exit:=True:C214
												$_l_DoDefaultsIndex:=99999
											Else 
												$_r_RemainingQuantity:=0
												For ($_l_CheckForMoreIndex; 1; Size of array:C274(ORDI_ar_AllocResidualStockQty))
													$_r_RemainingQuantity:=$_r_RemainingQuantity+ORDI_ar_AllocResidualStockQty{$_l_CheckForMoreIndex}
												End for 
												If ($_r_RemainingQuantity>0)  //this bit cant actually happen.
													
													
													$_l_DoDefaultsIndex:=2
													//Gen_Confirm ("You have not allocated sufficient stock. . Do you wish to remain in this screen to allocate additional stock?";"Yes";"No")
													//If (OK=0)
													$_bo_Exit:=True:C214
													//Else
													//$_bo_Exit:=False
													//End if
													OK:=1
												Else 
													$_l_DoDefaultsIndex:=2
													xCancel:=0
													xnext:=0
													xOK:=0
													//Gen_Alert ("Additional Stock needs to be allocated. However thiere is no additional free stock";"Continue")
													Gen_Confirm3("Additional stock needs to be allocated. There is insufficent available free stock"; "Continue"; "Stop"; "Split Order Item")
													Case of 
														: (xcancel=1)  //stop
															
															
															$_bo_Exit:=False:C215
														: (xok=1)  //continue
															
															
															$_bo_Exit:=True:C214
														: (xNext=1)  //split
															
															
															$_bo_Exit:=True:C214
															STK_bo_SplitRemainder:=True:C214
													End case 
													xCancel:=0
													xnext:=0
													xOK:=0
												End if 
												
												
											End if 
										End if 
									End if 
								End for 
							End for 
							//Open window(20;20;20;20;Palette window
							If ($_bo_Exit)
								$_r_AllocationQuantity:=$_r_RequiredQuantity-STK_R_QuantityRequired
								$_r_ScreenHorizontalCenter:=Screen width:C187/2
								$_r_ScreenVerticalCenter:=Screen height:C188/2
								//Open window($_r_ScreenHorizontalCenter-150;$_r_ScreenVerticalCenter-100;$_r_ScreenHorizontalCenter+150;$_r_ScreenVerticalCenter;Palette window )
								//GOTO XY(0;0)
								
								//MESSAGE("inventory of "+String($_r_AllocationQuantity)+" is now allocated to this item")
								
								//DelayTicks (3*70)
								//CLOSE WINDOW
								STK_bo_DoAllocate:=True:C214
							Else 
								//stop allocation
								STK_bo_DoAllocate:=False:C215
								STK_bo_DoooAllocate:=False:C215
								STK_bo_unAllocate:=False:C215
								//CANCEL
							End if 
						End if 
						//``````````
					End if 
					
					Case of 
						: (STK_bo_DoAllocate)
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_l_OrderItemNumber)
							
							$_r_RemainingRequired:=[ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28
							//READ WRITE([STOCK MOVEMENTS])
							//READ WRITE([STOCK ITEMS])
							
							If (Size of array:C274(STK_al_SRIDtoallocate)>0)
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
								//if multiple types then select
								If ((Records in selection:C76([MOVEMENT_TYPES:60])>0) & ([MOVEMENT_TYPES:60]Stock_Plus:3#""))
									CREATE RECORD:C68([STOCK_MOVEMENTS:40])
									Movement_Code
									[STOCK_MOVEMENTS:40]MovementSourceTable:16:=Table:C252(->[ORDERS:24])
									[STOCK_MOVEMENTS:40]MovementSourceField:17:=Field:C253(->[ORDERS:24]Order_Code:3)
									[STOCK_MOVEMENTS:40]MovementSourceReference:18:=[ORDERS:24]Order_Code:3
									[STOCK_MOVEMENTS:40]Company_From:2:=[ORDERS:24]Company_Code:1
									[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
									
									[STOCK_MOVEMENTS:40]Type_Number:4:=MoveTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
									[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
									[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
									If (<>StockAnal)
										[STOCK_MOVEMENTS:40]Analysis_Code:9:=[ORDERS:24]Analysis_Code:33
									End if 
									[STOCK_MOVEMENTS:40]Currency_Code:10:=[ORDERS:24]Currency_Code:32
									[STOCK_MOVEMENTS:40]Layer_Code:11:=[ORDERS:24]Layer_Code:47
									
									
									For ($_l_SerialsIndex; 1; Size of array:C274(STK_al_SRIDtoallocate))
										If ($_r_RemainingRequired>0)
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_al_SRIDtoallocate{$_l_SerialsIndex})
											//Add the Stock Items
											If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0) & ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
												STK_ItemDuplicate
												//APPEND TO ARRAY($_al_ForceRecalculation;[STOCK_MOVEMENT_ITEMS]x_ID)// December 2014 this should now not be needed
												[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=False:C215
												If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>=$_r_RemainingRequired)
													[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_RemainingRequired
													$_r_RemainingRequired:=0
												Else 
													[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
													$_r_RemainingRequired:=$_r_RemainingRequired-[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
												End if 
												[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=[ORDERS:24]Company_Code:1
												[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=[ORDER_ITEMS:25]Order_Code:1
												$_l_AddtoCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
												[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_AddtoCurrentStockID
												[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
												
												STK_SetCreatedStockItem(-1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; 0; [ORDER_ITEMS:25]Item_Number:27)
												
												$_r_CalledOffQuantity:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
												$_t_AddtoStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
												
												$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
												$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
												$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
												$_t_LocationCode:=[STOCK_MOVEMENT_ITEMS:27]Location:7
												$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8  //This will only be filled in if its allocated-we will move the allocation from the on order item to the instock item.
												$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
												$_d_StockItemHeaderDateWas:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
												
												If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26#[STOCK_MOVEMENTS:40]Movement_Date:5)
													[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=[STOCK_MOVEMENTS:40]Movement_Date:5
												End if 
												[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_t_LayerCode
												[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_t_LocationCode
												[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_t_AnalysisCode
												[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_t_CurrencyCode
												[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
												If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27#[STOCK_MOVEMENTS:40]Layer_Code:11)
													[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=[STOCK_MOVEMENTS:40]Layer_Code:11
												End if 
												If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28#[STOCK_MOVEMENTS:40]Analysis_Code:9)
													[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[STOCK_MOVEMENTS:40]Analysis_Code:9
												End if 
												If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#[STOCK_MOVEMENTS:40]Currency_Code:10)
													If ($_d_StockItemHeaderDateWas=!00-00-00!)
														$_d_StockItemHeaderDateWas:=Current date:C33(*)
													End if 
													If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#0)
														[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=Cat_ConvertValue([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENTS:40]Currency_Code:10; $_d_StockItemHeaderDateWas)
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
												//[ORDER ITEMS]Item_Locked:=False
												$_bo_EditsMade:=STK_SetHeaderInfo
												[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19:=0
												
												//note that the trigger will update the called off on the previous stock..that is the trigger on the stock movement
												//this is so if we cancell the stock movement we dont make the amount wrong preventing a call off(make sure is we cancel that the items here get deleted)
												Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
												
												DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
												If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
													//While (Test semaphore("$SettingCalledOff"))
													//DelayTicks (3)
													//End while
													//$_l_NewProcessess:=New process("STK_SetCalledOffInProcess";128000;"Set Called Off";[STOCK_MOVEMENT_ITEMS]X_CopiedFromID;[STOCK_MOVEMENT_ITEMS]Quantity;Current process)
													//While (Test semaphore("$SettingCalledOff"))
													//DelayTicks (3)
													//End while
												Else 
													
													//Something is wrong with this allocation-the copied from has been taken off so it should not exist
													$_l_StockMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockMovementItemID)
													$_r_RemainingRequired:=$_r_RemainingRequired+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
													DELETE RECORD:C58([STOCK_MOVEMENT_ITEMS:27])
												End if 
												
											End if 
										End if 
									End for 
									READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
									[STOCK_MOVEMENTS:40]Total_Cost:8:=Round:C94(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
									STK_bo_DeferValidation:=True:C214
									STK_bo_inTransaction:=True:C214
									DB_SaveRecord(->[STOCK_MOVEMENTS:40])
									
									[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
									DB_SaveRecord(->[ORDER_ITEMS:25])
									AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
									
									If (OK=1)
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
										OrderI_AllCSUp
										If (OK=1)
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
											//Update the Order Item
											OrderI_AllOIUp
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
											
											FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
											If ([ORDER_ITEMS:25]Received_Date:21=!00-00-00!)
												$_l_CopiedFromMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
												If ($_l_CopiedFromMovementItemID>0)
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopiedFromMovementItemID)
													If ([STOCK_MOVEMENT_ITEMS:27]Date_Received:5#!00-00-00!)
														
														[ORDER_ITEMS:25]Received_Date:21:=[STOCK_MOVEMENT_ITEMS:27]Date_Received:5
													Else 
														[ORDER_ITEMS:25]Received_Date:21:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
													End if 
												End if 
											End if 
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
											DB_SaveRecord(->[ORDER_ITEMS:25])
										End if 
									End if 
									
								End if 
							End if 
							$_r_RemainingRequired:=[ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28
							If ($_r_RemainingRequired<=0)
								$_bo_CheckedAllocated:=True:C214
								$_bo_CheckedOnOrder:=True:C214
							Else 
								$_bo_CheckOnOrder:=True:C214
								$_bo_OnOrderAsked:=True:C214
								$_bo_WarnZero:=False:C215
								If (STK_bo_SplitRemainder)
									$_l_StockCurrentOrderItem:=STK_l_OrderItemNumber
									$_r_QuantityToSplitOFF:=$_r_RemainingRequired
									//[ORDER ITEMS]Quantity:=[ORDER ITEMS]Quantity-$_r_RemainingRequired
									DB_SaveRecord(->[ORDER_ITEMS:25])
									$_r_Quantity:=vQuantity
									vQuantity:=$_r_QuantityToSplitOFF
									OrderI_Split2(True:C214)
									vQuantity:=$_r_Quantity
									STK_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
									STK_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
									STK_bo_ReloadScreen:=True:C214
									//need to update this one again though first
									
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_StockCurrentOrderItem)
									OrderI_AllOIUp
									SAVE RECORD:C53([ORDER_ITEMS:25])
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_l_OrderItemNumber)
									
									
								End if 
							End if 
							
						: (STK_bo_unAllocate)
							
						: (STK_bo_DoooAllocate)
							$_bo_CheckedAllocated:=True:C214
							$_bo_CheckedOnOrder:=True:C214
							[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
							OrderI_AllOIUp
							//QUERY([STC
							DB_SaveRecord(->[ORDER_ITEMS:25])
							AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
							STK_bo_DoooAllocate:=False:C215
						Else 
							$_bo_CheckedAllocated:=True:C214
							$_bo_CheckedOnOrder:=True:C214
							
					End case 
					OK:=1
					DB_bo_RecordModified:=$_bo_Modified
					DB_t_CallOnCloseorSave:=$_t_CloseSave
					vAdd:=$_l_AddMode
				Else 
					$_bo_CheckedFreee:=True:C214
					If (Not:C34($_bo_CheckedAllocated))
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
						SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationMovementTypes)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationMovementTypes)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
						STK_MenuUpdate("Stock items"; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; True:C214)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#[ORDER_ITEMS:25]Item_Number:27)
						
						
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
							Gen_Confirm("Sorry there does not appear to be any free stock to allocate. Would you like  to check for stock allocated to other orders?"; "Yes"; "No")
							If (OK=1)
								$_bo_AllocatedAsked:=True:C214
								$_bo_CheckAllocated:=True:C214
							Else 
								
								$_bo_CheckOnOrder:=True:C214
								$_bo_OnOrderAsked:=False:C215
							End if 
						Else 
							$_bo_AllocatedAsked:=True:C214
							$_bo_CheckAllocated:=False:C215
							$_bo_CheckedAllocated:=True:C214
							$_bo_CheckOnOrder:=True:C214
						End if 
					End if 
				End if 
				
			Else 
				$_bo_CheckedFreee:=True:C214
				If (False:C215)
					If (Not:C34($_bo_CheckedAllocated))
						If (Not:C34($_bo_AllocatedAsked))
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
							SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationMovementTypes)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
							QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationMovementTypes)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
							STK_MenuUpdate("Stock items"; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; True:C214)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#[ORDER_ITEMS:25]Item_Number:27)
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								Gen_Confirm("Sorry there does not appear to be any free stock to allocate. Would you like  to check for stock allocated to other orders?"; "Yes"; "No")
								If (OK=1)
									$_bo_CheckAllocated:=True:C214
								Else 
									$_bo_CheckedAllocated:=True:C214
									$_bo_CheckOnOrder:=True:C214
								End if 
							Else 
								$_bo_CheckAllocated:=False:C215
								$_bo_CheckedAllocated:=True:C214
								$_bo_CheckOnOrder:=True:C214
							End if 
						End if 
					End if 
				Else 
					$_bo_OnOrderAsked:=True:C214
					//$_bo_CheckedAllocated:=True
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PurchaseMovementTypes)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_PurchaseMovementTypes)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)  // not already allocated to order items
					
					
					
					//so these are the allocated to other order stock items for this product..here we want the Order Code and Order item they belong to displayed
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						//Gen_Confirm ("Do you want to check stock on order";"Yes";"No")
						If (OK=1)
							$_bo_CheckOnOrder:=True:C214
						Else 
							$_bo_CheckOnOrder:=False:C215
							$_bo_CheckedOnOrder:=True:C214
							OK:=1
						End if 
					Else 
						$_bo_CheckOnOrder:=False:C215
						$_bo_CheckedOnOrder:=True:C214
						OK:=1
					End if 
					If (Not:C34($_bo_CheckedOnOrder)) & ($_bo_CheckOnOrder)
						$_bo_CheckOnOrder:=False:C215
						//Gen_Confirm ("Sorry there does not appear to be any free stock or previously allocated. Would you like  to check for stock on order?";"Yes";"No")
						If (OK=1)
							
							//```
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
							SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PurchaseMovementTypes)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
							QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_PurchaseMovementTypes)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)  // not already allocated to order items
							
							
							
							//so these are the allocated to other order stock items for this product..here we want the Order Code and Order item they belong to displayed
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								
								If (<>StockAnal)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=STK_T_AllocfromAnalCode)
								End if 
								If ($_t_LayerCode#"")
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=STK_T_AllocFromLayerCode)
								End if 
								ARRAY TEXT:C222($_at_LocationsRange; 0)
								DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_LocationsRange)
								ARRAY TEXT:C222($_at_CurrenciesRange; 0)
								DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_CurrenciesRange)
								$_l_ProductSerialRow:=Find in array:C230($_at_CurrenciesRange; "")
								If ($_l_ProductSerialRow>0)
									DELETE FROM ARRAY:C228($_at_CurrenciesRange; $_l_ProductSerialRow)
								End if 
								If (Size of array:C274($_at_CurrenciesRange)=0)
									APPEND TO ARRAY:C911($_at_CurrenciesRange; <>SYS_t_BaseCurrency)
								End if 
								DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_PurchaseOrderItemNumbers)
								//Note do not take out the ones with no po item number
								//$_l_ProductSerialRow:=Find in array($_al_PurchaseOrderItemNumbers;0)
								//If ($_l_ProductSerialRow>0)
								//If (Size of array($_al_PurchaseOrderItemNumbers)>0)
								//DELETE FROM ARRAY($_al_PurchaseOrderItemNumbers;$_l_ProductSerialRow)
								//End if
								//End if
								DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_AddtoStockTypes)
								COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$ForAllocation")
								ARRAY TEXT:C222(ORDI_at_AllocProductCodes; 0)
								
								ARRAY TEXT:C222(ORDI_at_AlocStockTypes; 0)
								ARRAY REAL:C219(ORDI_ar_AllocStockQty; 0)
								ARRAY REAL:C219(ORDI_ar_AllocResidualStockQty; 0)
								ARRAY REAL:C219(ORDI_ar_AllocStockPrice; 0)
								ARRAY TEXT:C222(ORDI_AT_AllocCURRENCY; 0)
								ARRAY TEXT:C222(ORD_at_AllocSerialNo; 0)
								ARRAY TEXT:C222(ORDI_At_AllocLocationCodes; 0)
								ARRAY LONGINT:C221(ORDI_al_AllocItemNumbers; 0)
								ARRAY DATE:C224(ORDI_ad_AllocExpectedDate; 0)
								ARRAY TEXT:C222(ORDI_at_AllocOrderCodes; 0)
								ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; 0; 0)
								For ($_l_SerialsIndex; 1; Size of array:C274($_at_AddtoStockTypes))
									For ($_l_CurrenciesIndex; 1; Size of array:C274($_at_CurrenciesRange))
										For ($_l_LocationsIndex; 1; Size of array:C274($_at_LocationsRange))
											For ($_l_AllocatedIndex; 1; Size of array:C274($_al_PurchaseOrderItemNumbers))
												USE NAMED SELECTION:C332("$ForAllocation")
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_at_AddtoStockTypes{$_l_SerialsIndex}; *)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Location:7=$_at_LocationsRange{$_l_LocationsIndex})
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_al_PurchaseOrderItemNumbers{$_l_AllocatedIndex})
												If ($_at_CurrenciesRange{$_l_CurrenciesIndex}=<>SYS_t_BaseCurrency)
													QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=<>SYS_t_BaseCurrency; *)
													QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29="")
												Else 
													QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
												End if 
												If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
													APPEND TO ARRAY:C911(ORDI_At_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
													$_l_SizeofArray:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
													INSERT IN ARRAY:C227(ORDI_al_AllocStockRecordIDS; $_l_SizeofArray+1; 1)
													SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; ORDI_al_AllocStockRecordIDS{$_l_SizeofArray+1})
													FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
													APPEND TO ARRAY:C911(ORDI_al_AllocItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
													APPEND TO ARRAY:C911(ORDI_at_AllocOrderCodes; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
													APPEND TO ARRAY:C911(ORDI_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
													APPEND TO ARRAY:C911(ORDI_ad_AllocExpectedDate; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44)
													APPEND TO ARRAY:C911(ORDI_at_AlocStockTypes; $_at_AddtoStockTypes{$_l_SerialsIndex})
													APPEND TO ARRAY:C911(ORDI_ar_AllocStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
													APPEND TO ARRAY:C911(ORDI_ar_AllocResidualStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
													SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_UnitCosts; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_UnitQuantities)
													FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
													ARRAY REAL:C219($_ar_TotalCosts; 0)
													ARRAY REAL:C219($_ar_TotalCosts; Size of array:C274($_ar_UnitQuantities))
													$_r_SumCosts:=0
													For ($_l_TotalsIndex; 1; Size of array:C274($_ar_UnitQuantities))
														$_ar_TotalCosts{$_l_TotalsIndex}:=$_ar_UnitQuantities{$_l_TotalsIndex}*$_ar_UnitCosts{$_l_TotalsIndex}
														$_r_SumCosts:=$_r_SumCosts+$_ar_TotalCosts{$_l_TotalsIndex}
													End for 
													$_r_AverageUnityCost:=$_r_SumCosts/(Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
													APPEND TO ARRAY:C911(ORDI_ar_AllocStockPrice; Round:C94($_r_AverageUnityCost; 2))
													APPEND TO ARRAY:C911(ORDI_AT_AllocCURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
													DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNumbers)
													$_l_ProductSerialRow:=Find in array:C230($_at_SerialNumbers; "")
													If ($_l_ProductSerialRow>0)
														DELETE FROM ARRAY:C228($_at_SerialNumbers; $_l_ProductSerialRow)
													End if 
													If (Size of array:C274($_at_SerialNumbers)>1)
														APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; "Various")
														
													Else 
														If (Size of array:C274($_at_SerialNumbers)>0)
															APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; $_at_SerialNumbers{1})
														Else 
															APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; "")
															
														End if 
													End if 
													
													
												Else 
													APPEND TO ARRAY:C911(ORDI_At_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
													APPEND TO ARRAY:C911(ORDI_al_AllocItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
													APPEND TO ARRAY:C911(ORDI_at_AllocOrderCodes; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
													APPEND TO ARRAY:C911(ORDI_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
													APPEND TO ARRAY:C911(ORDI_ad_AllocExpectedDate; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44)
													APPEND TO ARRAY:C911(ORDI_at_AlocStockTypes; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
													APPEND TO ARRAY:C911(ORDI_ar_AllocStockQty; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
													APPEND TO ARRAY:C911(ORDI_ar_AllocResidualStockQty; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
													APPEND TO ARRAY:C911(ORDI_ar_AllocStockPrice; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
													$_l_SizeofArray:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
													INSERT IN ARRAY:C227(ORDI_al_AllocStockRecordIDS; $_l_SizeofArray+1; 1)
													APPEND TO ARRAY:C911(ORDI_al_AllocStockRecordIDS{$_l_SizeofArray+1}; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													APPEND TO ARRAY:C911(ORDI_AT_AllocCURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
													APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
												End if 
											End for 
										End for 
									End for 
								End for 
								ARRAY TEXT:C222(STK_at_DisProductNames; 0)
								ARRAY TEXT:C222(STK_at_DisStockTypeNames; 0)
								If (Size of array:C274(ORDI_at_AllocProductCodes)>0)
									QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; ORDI_at_AllocProductCodes)
									SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]Product_Name:2; $_at_ProducNames)
									For ($_l_SerialsIndex; 1; Size of array:C274(ORDI_at_AllocProductCodes))
										$_l_ProductSerialRow:=Find in array:C230($_at_ProductCodes; ORDI_at_AllocProductCodes{$_l_SerialsIndex})
										If ($_l_ProductSerialRow>0)
											APPEND TO ARRAY:C911(STK_at_DisProductNames; $_at_ProducNames{$_l_ProductSerialRow})
										Else 
											APPEND TO ARRAY:C911(STK_at_DisProductNames; "")
										End if 
									End for 
									
								Else 
									QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=ORDI_at_AllocProductCodes{1})
									APPEND TO ARRAY:C911(STK_at_DisProductNames; [PRODUCTS:9]Product_Name:2)
								End if 
								QUERY WITH ARRAY:C644([STOCK_TYPES:59]Type_Code:1; ORDI_at_AlocStockTypes)
								SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_allocationTypeCodes; [STOCK_TYPES:59]Type_Name:2; $_at_AllocationTypeNames)
								For ($_l_SerialsIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
									$_l_ProductSerialRow:=Find in array:C230($_at_allocationTypeCodes; ORDI_at_AlocStockTypes{$_l_SerialsIndex})
									If ($_l_ProductSerialRow>0)
										APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; $_at_AllocationTypeNames{$_l_ProductSerialRow})
									Else 
										APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; "")
									End if 
									
								End for 
								$_at_SerialNumbers:=0
								For ($_l_SerialsIndex; 1; Size of array:C274(ORD_at_AllocSerialNo))
									If (ORD_at_AllocSerialNo{$_l_SerialsIndex}#"")
										$_at_SerialNumbers:=1
										$_l_SerialsIndex:=Size of array:C274(ORD_at_AllocSerialNo)
									End if 
									
								End for 
								ARRAY TEXT:C222(STK_at_DisProductNames; 0)
								ARRAY TEXT:C222(STK_at_DisStockTypeNames; 0)
								If (Size of array:C274(ORDI_at_AllocProductCodes)>0)
									QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; ORDI_at_AllocProductCodes)
									SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]Product_Name:2; $_at_ProducNames)
									For ($_l_SerialsIndex; 1; Size of array:C274(ORDI_at_AllocProductCodes))
										$_l_ProductSerialRow:=Find in array:C230($_at_ProductCodes; ORDI_at_AllocProductCodes{$_l_SerialsIndex})
										If ($_l_ProductSerialRow>0)
											APPEND TO ARRAY:C911(STK_at_DisProductNames; $_at_ProducNames{$_l_ProductSerialRow})
										Else 
											APPEND TO ARRAY:C911(STK_at_DisProductNames; "")
										End if 
									End for 
									
								Else 
									QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=ORDI_at_AllocProductCodes{1})
									APPEND TO ARRAY:C911(STK_at_DisProductNames; [PRODUCTS:9]Product_Name:2)
								End if 
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
								SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PurchaseMovementTypes)
								
								//Open_Pro_Window (Term_StoWT ("Current Stock Allocation");0;1;->[CURRENT STOCK];"StockCurr Alloc")
								STK_R_QuantityRequired:=[ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28
								STK_R_AllocatedQuantity:=[ORDER_ITEMS:25]Allocated:28
								STK_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
								STK_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
								STK_bo_DoAllocate:=False:C215
								STK_bo_unAllocate:=False:C215
								STK_bo_ShowFREE:=False:C215
								STK_bo_ShowAllocated:=False:C215
								STK_bo_ShowOnOrder:=True:C214
								STK_l_InitialPage:=3
								STK_bo_AllocatedFromPO:=False:C215
								//ORDI_al_AllocStockRecordIDS
								If (Size of array:C274(ORDI_al_AllocStockRecordIDS)>1) | (True:C214)
									Open_Pro_Window(Term_StoWT("Current Stock Allocation"); 0; 1; ->[CURRENT_STOCK:62]; "StockCurr Alloc")
									
									DIALOG:C40("STK_AllocationWIndow")
									CLOSE WINDOW:C154
								Else 
									//```
									//allocate from on order
									$_l_Required:=STK_R_QuantityRequired
									If (STK_R_QuantityRequired>0)
										$_l_Row:=1
										If ($_l_Row>0)
											Gen_Confirm("There is stock  on order, do you want to reserve it for thisi order?"; "Yes"; "No")
											If (OK=1)
												READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
												$_l_ItemNumber:=ORDI_al_AllocItemNumbers{$_l_Row}
												$_t_ProductCode:=ORDI_at_AllocProductCodes{$_l_Row}
												QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
												SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PurchaseMovementTypes)
												
												//```
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_l_ItemNumber; *)
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_ProductCode)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)  // not already allocated to order items
												
												
												QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_PurchaseMovementTypes)
												$_r_TotalResidualStockQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
												If ($_r_TotalResidualStockQuantity>STK_R_QuantityRequired)
													$_r_TotalResidualStockQuantity:=STK_R_QuantityRequired
												End if 
												If ($_r_TotalResidualStockQuantity>0)
													$_l_RecordsInSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
													COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$temp")
													READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
													For ($_l_AllocateIndex; 1; $_l_RecordsInSelection)
														If (STK_R_QuantityRequired>0)
															USE NAMED SELECTION:C332("$temp")
															GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_AllocateIndex)
															
															$_r_ToKeepFree:=0
															If ($_r_TotalResidualStockQuantity>0)
																//so if the quantity=1000 we have received 700 and we want 400 $_r_TotalResidualStockQuantity=300
																//f we simple say is quantity > $_r_TotalResidualStockQuantity then the answer is yes and we would keep 1000-300
																//but to make sure the already called off quantity is always retained then i have added this
																//the residual quantity is less than the original quantity..ie we have called some off(Received cancelled etc)
																//we must keep the called off quantity so in the above example 300 if that remainder is greater than the quantity we require we must ALSO keep that quantity
																
																If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																	//The $_r_TotalResidualStockQuantity is no greater than the residual.
																	//we have to keep the called off quantityIf ([STOCK ITEMS]XResidualStockQuantity<$_r_TotalResidualStockQuantity)
																	//if some have been received have to k
																	$_r_ToKeepFree:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
																	$_r_RemainderQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_ToKeepFree
																	If ($_r_RemainderQuantity>$_r_TotalResidualStockQuantity)
																		$_r_ToKeepFree:=$_r_ToKeepFree+($_r_RemainderQuantity-$_r_TotalResidualStockQuantity)
																	End if 
																Else 
																	If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>$_r_TotalResidualStockQuantity)
																		//if some have been received have to k
																		$_r_ToKeepFree:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_TotalResidualStockQuantity
																	End if 
																End if 
																
																If ($_r_ToKeepFree>0)
																	//START TRANSACTION
																	StartTransaction
																	$_bo_NoCommit:=False:C215
																	//Gen_Alert ("Stock item ("+String([STOCK ITEMS]x_ID)+") current quantity is "+String([STOCK ITEMS]Quantity)+"Should retain "+String($_r_ToKeepFree)+" and create an item with "+String($_r_TotalResidualStockQuantity))
																	
																	STK_ItemDuplicate
																	[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
																	STK_SetCreatedStockItem(0; $_r_TotalResidualStockQuantity; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; 0; STK_l_OrderItemNumber)
																	STK_R_QuantityRequired:=STK_R_QuantityRequired-$_r_TotalResidualStockQuantity
																	$_r_TotalResidualStockQuantity:=$_r_TotalResidualStockQuantity-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																	
																	USE NAMED SELECTION:C332("$temp")
																	GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_AllocateIndex)
																	//Gen_Alert ("Returned to stock item ("+String([STOCK ITEMS]x_ID)+" ) to change quantity to "+String($_r_ToKeepFree))
																	$_l_Retries:=0
																	While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_Retries<1000)
																		If ($_l_Retries>10)
																			Gen_Confirm("The stock item for PO movement"+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+" for product "+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+" is locked, Continue trying to allocate?"; "Yes"; "No")
																			If (OK=0)
																				$_l_Retries:=10001
																				$_bo_NoCommit:=True:C214
																			Else 
																				$_l_Retries:=1
																				DelayTicks(60*$_l_Retries)
																			End if 
																		Else 
																			$_l_Retries:=$_l_Retries+1
																			DelayTicks(60*$_l_Retries)
																		End if 
																	End while 
																	
																	[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_ToKeepFree
																	[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																	
																	[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
																	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																	STK_bo_AllocatedFromPO:=True:C214
																	If (Not:C34($_bo_NoCommit))
																		Transact_End(True:C214)
																	Else 
																		Transact_End(False:C215)
																	End if 
																	
																Else 
																	//TRACE
																	[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																	[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=STK_l_OrderItemNumber
																	[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=STK_l_OrderItemNumber
																	STK_R_QuantityRequired:=STK_R_QuantityRequired-$_r_TotalResidualStockQuantity
																	$_r_TotalResidualStockQuantity:=$_r_TotalResidualStockQuantity-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																	STK_bo_AllocatedFromPO:=True:C214
																	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																	
																End if 
																
															End if 
														End if 
													End for 
													If (STK_R_QuantityRequired=0)
														$_r_AllocationQuantity:=$_l_Required-STK_R_QuantityRequired
														$_r_ScreenHorizontalCenter:=Screen width:C187/2
														$_r_ScreenVerticalCenter:=Screen height:C188/2
														//Open window($_r_ScreenHorizontalCenter-150;$_r_ScreenVerticalCenter-100;$_r_ScreenHorizontalCenter+150;$_r_ScreenVerticalCenter;Palette window )
														//GOTO XY(0;0)
														//MESSAGE("inventory of "+String($_r_AllocationQuantity)+" is now allocated from on order stock to this item")
														//DelayTicks (3*70)
														//CLOSE WINDOW
														STK_bo_DoooAllocate:=True:C214
													End if 
													
												End if 
												
											End if 
											
											
										End if 
										
									End if 
									
									
									//```
								End if 
								
								If (STK_bo_AllocatedFromPO)
									[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
									DB_SaveRecord(->[ORDER_ITEMS:25])
									AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
								End if 
								If (OK=1)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
									OrderI_AllCSUp
									If (OK=1)
										//Update the Order Item
										OrderI_AllOIUp
									End if 
								End if 
								If ([ORDER_ITEMS:25]Allocated:28<[ORDER_ITEMS:25]Quantity:3)
									Gen_Confirm("Try again to allocate stock?"; "Yes"; "No")
									If (OK=1)
										$_bo_CheckedFreee:=True:C214
										STK_bo_ShowFREE:=True:C214
									End if 
								End if 
								OK:=1
								DB_bo_RecordModified:=$_bo_Modified
								DB_t_CallOnCloseorSave:=$_t_CloseSave
								vAdd:=$_l_AddMode
								$_bo_CheckedOnOrder:=True:C214
							Else 
								If ($_bo_WarnZero)
									//Gen_Alert ("Sorry there is no on order stock for this product!")
									$_bo_CheckedOnOrder:=True:C214
								End if 
								
							End if 
						Else 
							$_bo_CheckOnOrder:=False:C215
							$_bo_CheckedOnOrder:=True:C214
							OK:=1
						End if 
					Else 
						$_bo_CheckOnOrder:=False:C215
						$_bo_CheckedOnOrder:=True:C214
						OK:=1
					End if 
				End if 
			End if 
			
			If ($_bo_CheckAllocated) & (Not:C34($_bo_CheckedAllocated))
				$_bo_CheckAllocated:=False:C215
				$_bo_CheckedAllocated:=True:C214
				//Here we look up stock on order and display the window with that shown and let the user tab to allocated...
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationMovementTypes)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#[ORDER_ITEMS:25]Item_Number:27)
				
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationMovementTypes)
				//so these are the allocated to other order stock items for this product..here we want the Order Code and Order item they belong to displayed
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					
					If (<>StockAnal)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=STK_T_AllocfromAnalCode)
					End if 
					$_t_LayerCode:=""
					If ($_t_LayerCode#"")
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=STK_T_AllocFromLayerCode)
					End if 
					ARRAY TEXT:C222($_at_LocationsRange; 0)
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_LocationsRange)
					ARRAY TEXT:C222($_at_CurrenciesRange; 0)
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_CurrenciesRange)
					$_l_ProductSerialRow:=Find in array:C230($_at_CurrenciesRange; "")
					If ($_l_ProductSerialRow>0)
						DELETE FROM ARRAY:C228($_at_CurrenciesRange; $_l_ProductSerialRow)
					End if 
					If (Size of array:C274($_at_CurrenciesRange)=0)
						APPEND TO ARRAY:C911($_at_CurrenciesRange; <>SYS_t_BaseCurrency)
					End if 
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_PurchaseOrderItemNumbers)
					$_l_ProductSerialRow:=Find in array:C230($_al_PurchaseOrderItemNumbers; 0)
					If ($_l_ProductSerialRow>0)
						DELETE FROM ARRAY:C228($_al_PurchaseOrderItemNumbers; $_l_ProductSerialRow)
					End if 
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_AddtoStockTypes)
					COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$ForAllocation")
					ARRAY TEXT:C222(ORDI_at_AllocProductCodes; 0)
					
					ARRAY TEXT:C222(ORDI_at_AlocStockTypes; 0)
					ARRAY REAL:C219(ORDI_ar_AllocStockQty; 0)
					ARRAY REAL:C219(ORDI_ar_AllocResidualStockQty; 0)
					ARRAY REAL:C219(ORDI_ar_AllocStockPrice; 0)
					ARRAY TEXT:C222(ORDI_AT_AllocCURRENCY; 0)
					ARRAY TEXT:C222(ORD_at_AllocSerialNo; 0)
					ARRAY TEXT:C222(ORDI_At_AllocLocationCodes; 0)
					ARRAY LONGINT:C221(ORDI_al_AllocItemNumbers; 0)
					ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; 0; 0)
					ARRAY TEXT:C222(ORDI_at_AllocOrderCodes; 0)
					For ($_l_SerialsIndex; 1; Size of array:C274($_at_AddtoStockTypes))
						For ($_l_CurrenciesIndex; 1; Size of array:C274($_at_CurrenciesRange))
							For ($_l_LocationsIndex; 1; Size of array:C274($_at_LocationsRange))
								For ($_l_AllocatedIndex; 1; Size of array:C274($_al_PurchaseOrderItemNumbers))
									USE NAMED SELECTION:C332("$ForAllocation")
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_at_AddtoStockTypes{$_l_SerialsIndex}; *)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Location:7=$_at_LocationsRange{$_l_LocationsIndex})
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_PurchaseOrderItemNumbers{$_l_AllocatedIndex})
									
									If ($_at_CurrenciesRange{$_l_CurrenciesIndex}=<>SYS_t_BaseCurrency)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=<>SYS_t_BaseCurrency; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29="")
									Else 
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
									End if 
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
										APPEND TO ARRAY:C911(ORDI_At_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
										APPEND TO ARRAY:C911(ORDI_al_AllocItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
										APPEND TO ARRAY:C911(ORDI_at_AllocOrderCodes; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3)
										$_l_SizeofArray:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
										INSERT IN ARRAY:C227(ORDI_al_AllocStockRecordIDS; $_l_SizeofArray+1; 1)
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; ORDI_al_AllocStockRecordIDS{$_l_SizeofArray+1})
										FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
										APPEND TO ARRAY:C911(ORDI_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
										APPEND TO ARRAY:C911(ORDI_at_AlocStockTypes; $_at_AddtoStockTypes{$_l_SerialsIndex})
										APPEND TO ARRAY:C911(ORDI_ar_AllocStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
										APPEND TO ARRAY:C911(ORDI_ar_AllocResidualStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_UnitCosts; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_UnitQuantities)
										ARRAY REAL:C219($_ar_TotalCosts; 0)
										ARRAY REAL:C219($_ar_TotalCosts; Size of array:C274($_ar_UnitQuantities))
										$_r_SumCosts:=0
										For ($_l_TotalsIndex; 1; Size of array:C274($_ar_UnitQuantities))
											$_ar_TotalCosts{$_l_TotalsIndex}:=$_ar_UnitQuantities{$_l_TotalsIndex}*$_ar_UnitCosts{$_l_TotalsIndex}
											$_r_SumCosts:=$_r_SumCosts+$_ar_TotalCosts{$_l_TotalsIndex}
										End for 
										$_r_AverageUnityCost:=$_r_SumCosts/(Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
										APPEND TO ARRAY:C911(ORDI_ar_AllocStockPrice; Round:C94($_r_AverageUnityCost; 2))
										APPEND TO ARRAY:C911(ORDI_AT_AllocCURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
										DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNumbers)
										$_l_ProductSerialRow:=Find in array:C230($_at_SerialNumbers; "")
										If ($_l_ProductSerialRow>0)
											DELETE FROM ARRAY:C228($_at_SerialNumbers; $_l_ProductSerialRow)
										End if 
										If (Size of array:C274($_at_SerialNumbers)>1)
											APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; "Various")
											
										Else 
											If (Size of array:C274($_at_SerialNumbers)>0)
												APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; $_at_SerialNumbers{1})
											Else 
												APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; "")
												
											End if 
										End if 
										
										
									Else 
										APPEND TO ARRAY:C911(ORDI_At_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
										APPEND TO ARRAY:C911(ORDI_al_AllocItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
										APPEND TO ARRAY:C911(ORDI_at_AllocOrderCodes; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3)
										APPEND TO ARRAY:C911(ORDI_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
										APPEND TO ARRAY:C911(ORDI_at_AlocStockTypes; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
										APPEND TO ARRAY:C911(ORDI_ar_AllocStockQty; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										APPEND TO ARRAY:C911(ORDI_ar_AllocResidualStockQty; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
										APPEND TO ARRAY:C911(ORDI_ar_AllocStockPrice; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
										$_l_SizeofArray:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
										INSERT IN ARRAY:C227(ORDI_al_AllocStockRecordIDS; $_l_SizeofArray+1; 1)
										APPEND TO ARRAY:C911(ORDI_al_AllocStockRecordIDS{$_l_SizeofArray+1}; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										APPEND TO ARRAY:C911(ORDI_AT_AllocCURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
										APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
									End if 
								End for 
							End for 
						End for 
					End for 
					
					
					ARRAY TEXT:C222(STK_at_DisProductNames; 0)
					ARRAY TEXT:C222(STK_at_DisStockTypeNames; 0)
					If (Size of array:C274(ORDI_at_AllocProductCodes)>0)
						QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; ORDI_at_AllocProductCodes)
						SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]Product_Name:2; $_at_ProducNames)
						For ($_l_SerialsIndex; 1; Size of array:C274(ORDI_at_AllocProductCodes))
							$_l_ProductSerialRow:=Find in array:C230($_at_ProductCodes; ORDI_at_AllocProductCodes{$_l_SerialsIndex})
							If ($_l_ProductSerialRow>0)
								APPEND TO ARRAY:C911(STK_at_DisProductNames; $_at_ProducNames{$_l_ProductSerialRow})
							Else 
								APPEND TO ARRAY:C911(STK_at_DisProductNames; "")
							End if 
						End for 
						
					Else 
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=ORDI_at_AllocProductCodes{1})
						APPEND TO ARRAY:C911(STK_at_DisProductNames; [PRODUCTS:9]Product_Name:2)
					End if 
					QUERY WITH ARRAY:C644([STOCK_TYPES:59]Type_Code:1; ORDI_at_AlocStockTypes)
					SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_allocationTypeCodes; [STOCK_TYPES:59]Type_Name:2; $_at_AllocationTypeNames)
					For ($_l_SerialsIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
						$_l_ProductSerialRow:=Find in array:C230($_at_allocationTypeCodes; ORDI_at_AlocStockTypes{$_l_SerialsIndex})
						If ($_l_ProductSerialRow>0)
							APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; $_at_AllocationTypeNames{$_l_ProductSerialRow})
						Else 
							APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; "")
						End if 
						
					End for 
					$_at_SerialNumbers:=0
					For ($_l_SerialsIndex; 1; Size of array:C274(ORD_at_AllocSerialNo))
						If (ORD_at_AllocSerialNo{$_l_SerialsIndex}#"")
							$_at_SerialNumbers:=1
							$_l_SerialsIndex:=Size of array:C274(ORD_at_AllocSerialNo)
						End if 
						
					End for 
					ARRAY LONGINT:C221(STK_al_LineIndex; 0)
					ARRAY LONGINT:C221(STK_al_LineIndex; Size of array:C274(ORDI_at_AlocStockTypes))
					For ($_l_SerialsIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
						STK_al_LineIndex{$_l_SerialsIndex}:=$_l_SerialsIndex
					End for 
					ARRAY TEXT:C222(STK_at_DisProductNames; 0)
					ARRAY TEXT:C222(STK_at_DisStockTypeNames; 0)
					If (Size of array:C274(ORDI_at_AllocProductCodes)>0)
						QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; ORDI_at_AllocProductCodes)
						SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]Product_Name:2; $_at_ProducNames)
						For ($_l_SerialsIndex; 1; Size of array:C274(ORDI_at_AllocProductCodes))
							$_l_ProductSerialRow:=Find in array:C230($_at_ProductCodes; ORDI_at_AllocProductCodes{$_l_SerialsIndex})
							If ($_l_ProductSerialRow>0)
								APPEND TO ARRAY:C911(STK_at_DisProductNames; $_at_ProducNames{$_l_ProductSerialRow})
							Else 
								APPEND TO ARRAY:C911(STK_at_DisProductNames; "")
							End if 
						End for 
						
					Else 
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=ORDI_at_AllocProductCodes{1})
						APPEND TO ARRAY:C911(STK_at_DisProductNames; [PRODUCTS:9]Product_Name:2)
					End if 
					Open_Pro_Window(Term_StoWT("Current Stock Allocation"); 0; 1; ->[CURRENT_STOCK:62]; "StockCurr Alloc")
					STK_R_QuantityRequired:=[ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28
					STK_R_AllocatedQuantity:=[ORDER_ITEMS:25]Allocated:28
					STK_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
					STK_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
					STK_bo_DoAllocate:=False:C215
					STK_bo_unAllocate:=False:C215
					STK_bo_ShowFREE:=False:C215
					STK_bo_ShowAllocated:=True:C214
					STK_bo_ShowOnOrder:=False:C215
					STK_l_InitialPage:=2
					DIALOG:C40("STK_AllocationWIndow")
					CLOSE WINDOW:C154
					$_bo_CheckedAllocated:=True:C214
					Gen_Confirm("Try again to allocate stock?"; "Yes"; "No")
					If (OK=1)
						$_bo_CheckedFreee:=False:C215
						STK_bo_ShowFREE:=True:C214
					End if 
					OK:=1
					DB_bo_RecordModified:=$_bo_Modified
					DB_t_CallOnCloseorSave:=$_t_CloseSave
					vAdd:=$_l_AddMode
				Else 
					Gen_Alert("Sorry there is no stock allocated to other orders"; "OK")
					STK_at_FilterTypes:=STL_l_CurrentFIlter
					$_bo_CheckedAllocated:=True:C214
					$_bo_CheckOnOrder:=True:C214
				End if 
			Else 
				$_bo_CheckedAllocated:=True:C214
			End if 
			If ($_bo_CheckedAllocated=True:C214) & ($_bo_CheckedFreee=True:C214) & ($_bo_CheckOnOrder=True:C214)
				OK:=1
				If (Not:C34($_bo_OnOrderAsked))
					$_bo_OnOrderAsked:=True:C214
					$_bo_CheckedAllocated:=True:C214
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PurchaseMovementTypes)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_PurchaseMovementTypes)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)  // not already allocated to order items
					
					
					//so these are the allocated to other order stock items for this product..here we want the Order Code and Order item they belong to displayed
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						Gen_Confirm("Do you want to check stock on order"; "Yes"; "No")
						If (OK=1)
							$_bo_CheckOnOrder:=True:C214
						Else 
							$_bo_CheckOnOrder:=False:C215
							$_bo_CheckedOnOrder:=True:C214
							OK:=1
						End if 
					Else 
						$_bo_CheckOnOrder:=False:C215
						$_bo_CheckedOnOrder:=True:C214
						OK:=1
					End if 
				End if 
			End if 
			
			If (Not:C34($_bo_CheckedOnOrder)) & ($_bo_CheckOnOrder)
				$_bo_CheckOnOrder:=False:C215
				//Gen_Confirm ("Sorry there does not appear to be any free stock or previously allocated. Would you like  to check for stock on order?";"Yes";"No")
				If (OK=1)
					
					//```
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PurchaseMovementTypes)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)  // not already allocated to order items
					
					
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_PurchaseMovementTypes)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
					//so these are the allocated to other order stock items for this product..here we want the Order Code and Order item they belong to displayed
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						
						If (<>StockAnal)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=STK_T_AllocfromAnalCode)
						End if 
						If ($_t_LayerCode#"")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=STK_T_AllocFromLayerCode)
						End if 
						ARRAY TEXT:C222($_at_LocationsRange; 0)
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_LocationsRange)
						ARRAY TEXT:C222($_at_CurrenciesRange; 0)
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_CurrenciesRange)
						$_l_ProductSerialRow:=Find in array:C230($_at_CurrenciesRange; "")
						If ($_l_ProductSerialRow>0)
							DELETE FROM ARRAY:C228($_at_CurrenciesRange; $_l_ProductSerialRow)
						End if 
						If (Size of array:C274($_at_CurrenciesRange)=0)
							APPEND TO ARRAY:C911($_at_CurrenciesRange; <>SYS_t_BaseCurrency)
						End if 
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_PurchaseOrderItemNumbers)
						//Note do not take out the ones with no po item number
						//$_l_ProductSerialRow:=Find in array($_al_PurchaseOrderItemNumbers;0)
						//If ($_l_ProductSerialRow>0)
						//If (Size of array($_al_PurchaseOrderItemNumbers)>0)
						//DELETE FROM ARRAY($_al_PurchaseOrderItemNumbers;$_l_ProductSerialRow)
						//End if
						//End if
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_AddtoStockTypes)
						COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$ForAllocation")
						ARRAY TEXT:C222(ORDI_at_AllocProductCodes; 0)
						
						ARRAY TEXT:C222(ORDI_at_AlocStockTypes; 0)
						ARRAY REAL:C219(ORDI_ar_AllocStockQty; 0)
						ARRAY REAL:C219(ORDI_ar_AllocResidualStockQty; 0)
						ARRAY REAL:C219(ORDI_ar_AllocStockPrice; 0)
						ARRAY TEXT:C222(ORDI_AT_AllocCURRENCY; 0)
						ARRAY TEXT:C222(ORD_at_AllocSerialNo; 0)
						ARRAY TEXT:C222(ORDI_At_AllocLocationCodes; 0)
						ARRAY LONGINT:C221(ORDI_al_AllocItemNumbers; 0)
						ARRAY DATE:C224(ORDI_ad_AllocExpectedDate; 0)
						ARRAY TEXT:C222(ORDI_at_AllocOrderCodes; 0)
						ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; 0; 0)
						For ($_l_SerialsIndex; 1; Size of array:C274($_at_AddtoStockTypes))
							For ($_l_CurrenciesIndex; 1; Size of array:C274($_at_CurrenciesRange))
								For ($_l_LocationsIndex; 1; Size of array:C274($_at_LocationsRange))
									For ($_l_AllocatedIndex; 1; Size of array:C274($_al_PurchaseOrderItemNumbers))
										USE NAMED SELECTION:C332("$ForAllocation")
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_at_AddtoStockTypes{$_l_SerialsIndex}; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Location:7=$_at_LocationsRange{$_l_LocationsIndex})
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_al_PurchaseOrderItemNumbers{$_l_AllocatedIndex})
										If ($_at_CurrenciesRange{$_l_CurrenciesIndex}=<>SYS_t_BaseCurrency)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=<>SYS_t_BaseCurrency; *)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29="")
										Else 
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
										End if 
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
											APPEND TO ARRAY:C911(ORDI_At_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
											$_l_SizeofArray:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
											INSERT IN ARRAY:C227(ORDI_al_AllocStockRecordIDS; $_l_SizeofArray+1; 1)
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; ORDI_al_AllocStockRecordIDS{$_l_SizeofArray+1})
											FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
											APPEND TO ARRAY:C911(ORDI_al_AllocItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
											APPEND TO ARRAY:C911(ORDI_at_AllocOrderCodes; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
											APPEND TO ARRAY:C911(ORDI_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
											APPEND TO ARRAY:C911(ORDI_ad_AllocExpectedDate; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44)
											APPEND TO ARRAY:C911(ORDI_at_AlocStockTypes; $_at_AddtoStockTypes{$_l_SerialsIndex})
											APPEND TO ARRAY:C911(ORDI_ar_AllocStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
											APPEND TO ARRAY:C911(ORDI_ar_AllocResidualStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_UnitCosts; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_UnitQuantities)
											FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
											ARRAY REAL:C219($_ar_TotalCosts; 0)
											ARRAY REAL:C219($_ar_TotalCosts; Size of array:C274($_ar_UnitQuantities))
											$_r_SumCosts:=0
											For ($_l_TotalsIndex; 1; Size of array:C274($_ar_UnitQuantities))
												$_ar_TotalCosts{$_l_TotalsIndex}:=$_ar_UnitQuantities{$_l_TotalsIndex}*$_ar_UnitCosts{$_l_TotalsIndex}
												$_r_SumCosts:=$_r_SumCosts+$_ar_TotalCosts{$_l_TotalsIndex}
											End for 
											$_r_AverageUnityCost:=$_r_SumCosts/(Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
											APPEND TO ARRAY:C911(ORDI_ar_AllocStockPrice; Round:C94($_r_AverageUnityCost; 2))
											APPEND TO ARRAY:C911(ORDI_AT_AllocCURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
											DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNumbers)
											$_l_ProductSerialRow:=Find in array:C230($_at_SerialNumbers; "")
											If ($_l_ProductSerialRow>0)
												DELETE FROM ARRAY:C228($_at_SerialNumbers; $_l_ProductSerialRow)
											End if 
											If (Size of array:C274($_at_SerialNumbers)>1)
												APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; "Various")
												
											Else 
												If (Size of array:C274($_at_SerialNumbers)>0)
													APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; $_at_SerialNumbers{1})
												Else 
													APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; "")
													
												End if 
											End if 
											
											
										Else 
											APPEND TO ARRAY:C911(ORDI_At_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
											APPEND TO ARRAY:C911(ORDI_al_AllocItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
											APPEND TO ARRAY:C911(ORDI_at_AllocOrderCodes; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
											APPEND TO ARRAY:C911(ORDI_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
											APPEND TO ARRAY:C911(ORDI_ad_AllocExpectedDate; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44)
											APPEND TO ARRAY:C911(ORDI_at_AlocStockTypes; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
											APPEND TO ARRAY:C911(ORDI_ar_AllocStockQty; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
											APPEND TO ARRAY:C911(ORDI_ar_AllocResidualStockQty; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
											APPEND TO ARRAY:C911(ORDI_ar_AllocStockPrice; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
											$_l_SizeofArray:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
											INSERT IN ARRAY:C227(ORDI_al_AllocStockRecordIDS; $_l_SizeofArray+1; 1)
											APPEND TO ARRAY:C911(ORDI_al_AllocStockRecordIDS{$_l_SizeofArray+1}; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											APPEND TO ARRAY:C911(ORDI_AT_AllocCURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
											APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
										End if 
									End for 
								End for 
							End for 
						End for 
						ARRAY TEXT:C222(STK_at_DisProductNames; 0)
						ARRAY TEXT:C222(STK_at_DisStockTypeNames; 0)
						If (Size of array:C274(ORDI_at_AllocProductCodes)>0)
							QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; ORDI_at_AllocProductCodes)
							SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]Product_Name:2; $_at_ProducNames)
							For ($_l_SerialsIndex; 1; Size of array:C274(ORDI_at_AllocProductCodes))
								$_l_ProductSerialRow:=Find in array:C230($_at_ProductCodes; ORDI_at_AllocProductCodes{$_l_SerialsIndex})
								If ($_l_ProductSerialRow>0)
									APPEND TO ARRAY:C911(STK_at_DisProductNames; $_at_ProducNames{$_l_ProductSerialRow})
								Else 
									APPEND TO ARRAY:C911(STK_at_DisProductNames; "")
								End if 
							End for 
							
						Else 
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=ORDI_at_AllocProductCodes{1})
							APPEND TO ARRAY:C911(STK_at_DisProductNames; [PRODUCTS:9]Product_Name:2)
						End if 
						QUERY WITH ARRAY:C644([STOCK_TYPES:59]Type_Code:1; ORDI_at_AlocStockTypes)
						SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_allocationTypeCodes; [STOCK_TYPES:59]Type_Name:2; $_at_AllocationTypeNames)
						For ($_l_SerialsIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
							$_l_ProductSerialRow:=Find in array:C230($_at_allocationTypeCodes; ORDI_at_AlocStockTypes{$_l_SerialsIndex})
							If ($_l_ProductSerialRow>0)
								APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; $_at_AllocationTypeNames{$_l_ProductSerialRow})
							Else 
								APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; "")
							End if 
							
						End for 
						$_at_SerialNumbers:=0
						For ($_l_SerialsIndex; 1; Size of array:C274(ORD_at_AllocSerialNo))
							If (ORD_at_AllocSerialNo{$_l_SerialsIndex}#"")
								$_at_SerialNumbers:=1
								$_l_SerialsIndex:=Size of array:C274(ORD_at_AllocSerialNo)
							End if 
							
						End for 
						ARRAY TEXT:C222(STK_at_DisProductNames; 0)
						ARRAY TEXT:C222(STK_at_DisStockTypeNames; 0)
						If (Size of array:C274(ORDI_at_AllocProductCodes)>0)
							QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; ORDI_at_AllocProductCodes)
							SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]Product_Name:2; $_at_ProducNames)
							For ($_l_SerialsIndex; 1; Size of array:C274(ORDI_at_AllocProductCodes))
								$_l_ProductSerialRow:=Find in array:C230($_at_ProductCodes; ORDI_at_AllocProductCodes{$_l_SerialsIndex})
								If ($_l_ProductSerialRow>0)
									APPEND TO ARRAY:C911(STK_at_DisProductNames; $_at_ProducNames{$_l_ProductSerialRow})
								Else 
									APPEND TO ARRAY:C911(STK_at_DisProductNames; "")
								End if 
							End for 
							
						Else 
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=ORDI_at_AllocProductCodes{1})
							APPEND TO ARRAY:C911(STK_at_DisProductNames; [PRODUCTS:9]Product_Name:2)
						End if 
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
						SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PurchaseMovementTypes)
						
						//Open_Pro_Window (Term_StoWT ("Current Stock Allocation");0;1;->[CURRENT STOCK];"StockCurr Alloc")
						STK_R_QuantityRequired:=[ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28
						STK_R_AllocatedQuantity:=[ORDER_ITEMS:25]Allocated:28
						STK_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
						STK_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
						STK_bo_DoAllocate:=False:C215
						STK_bo_unAllocate:=False:C215
						STK_bo_ShowFREE:=False:C215
						STK_bo_ShowAllocated:=False:C215
						STK_bo_ShowOnOrder:=True:C214
						STK_l_InitialPage:=3
						STK_bo_AllocatedFromPO:=False:C215
						If (Size of array:C274(ORDI_al_AllocStockRecordIDS)>1) | (True:C214)
							Open_Pro_Window(Term_StoWT("Current Stock Allocation"); 0; 1; ->[CURRENT_STOCK:62]; "StockCurr Alloc")
							
							DIALOG:C40("STK_AllocationWIndow")
							CLOSE WINDOW:C154
						Else 
							//```
							//allocate from on order
							$_l_Required:=STK_R_QuantityRequired
							If (STK_R_QuantityRequired>0)
								$_l_Row:=1
								If ($_l_Row>0)
									Gen_Confirm("There is stock  on order, do you want to reserve it for thisi order?"; "Yes"; "No")
									If (OK=1)
										READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
										$_l_ItemNumber:=ORDI_al_AllocItemNumbers{$_l_Row}
										$_t_ProductCode:=ORDI_at_AllocProductCodes{$_l_Row}
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
										SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PurchaseMovementTypes)
										
										//```
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_l_ItemNumber; *)
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_ProductCode)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)  // not already allocated to order items
										
										
										QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_PurchaseMovementTypes)
										$_r_TotalResidualStockQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
										If ($_r_TotalResidualStockQuantity>STK_R_QuantityRequired)
											$_r_TotalResidualStockQuantity:=STK_R_QuantityRequired
										End if 
										If ($_r_TotalResidualStockQuantity>0)
											$_l_RecordsInSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
											COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$temp")
											READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
											For ($_l_AllocateIndex; 1; $_l_RecordsInSelection)
												If (STK_R_QuantityRequired>0)
													USE NAMED SELECTION:C332("$temp")
													GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_AllocateIndex)
													
													$_r_ToKeepFree:=0
													If ($_r_TotalResidualStockQuantity>0)
														//so if the quantity=1000 we have received 700 and we want 400 $_r_TotalResidualStockQuantity=300
														//f we simple say is quantity > $_r_TotalResidualStockQuantity then the answer is yes and we would keep 1000-300
														//but to make sure the already called off quantity is always retained then i have added this
														//the residual quantity is less than the original quantity..ie we have called some off(Received cancelled etc)
														//we must keep the called off quantity so in the above example 300 if that remainder is greater than the quantity we require we must ALSO keep that quantity
														
														If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
															//The $_r_TotalResidualStockQuantity is no greater than the residual.
															//we have to keep the called off quantityIf ([STOCK ITEMS]XResidualStockQuantity<$_r_TotalResidualStockQuantity)
															//if some have been received have to k
															$_r_ToKeepFree:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
															$_r_RemainderQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_ToKeepFree
															If ($_r_RemainderQuantity>$_r_TotalResidualStockQuantity)
																$_r_ToKeepFree:=$_r_ToKeepFree+($_r_RemainderQuantity-$_r_TotalResidualStockQuantity)
															End if 
														Else 
															If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>$_r_TotalResidualStockQuantity)
																//if some have been received have to k
																$_r_ToKeepFree:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_TotalResidualStockQuantity
															End if 
														End if 
														
														If ($_r_ToKeepFree>0)
															//START TRANSACTION
															StartTransaction
															$_bo_NoCommit:=False:C215
															//Gen_Alert ("Stock item ("+String([STOCK ITEMS]x_ID)+") current quantity is "+String([STOCK ITEMS]Quantity)+"Should retain "+String($_r_ToKeepFree)+" and create an item with "+String($_r_TotalResidualStockQuantity))
															
															STK_ItemDuplicate
															[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
															
															STK_SetCreatedStockItem(0; $_r_TotalResidualStockQuantity; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; 0; STK_l_OrderItemNumber)
															STK_R_QuantityRequired:=STK_R_QuantityRequired-$_r_TotalResidualStockQuantity
															$_r_TotalResidualStockQuantity:=$_r_TotalResidualStockQuantity-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
															USE NAMED SELECTION:C332("$temp")
															GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_AllocateIndex)
															//Gen_Alert ("Returned to stock item ("+String([STOCK ITEMS]x_ID)+" ) to change quantity to "+String($_r_ToKeepFree))
															$_l_Retries:=0
															While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_Retries<1000)
																If ($_l_Retries>10)
																	Gen_Confirm("The stock item for PO movement"+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+" for product "+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+" is locked, Continue trying to allocate?"; "Yes"; "No")
																	If (OK=0)
																		$_l_Retries:=10001
																		$_bo_NoCommit:=True:C214
																	Else 
																		$_l_Retries:=1
																		DelayTicks(60*$_l_Retries)
																	End if 
																Else 
																	$_l_Retries:=$_l_Retries+1
																	DelayTicks(60*$_l_Retries)
																End if 
															End while 
															
															[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_ToKeepFree
															[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
															[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
															[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
															
															DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
															
															STK_bo_AllocatedFromPO:=True:C214
															If (Not:C34($_bo_NoCommit))
																//VALIDATE TRANSACTION
																Transact_End(True:C214)
															Else 
																//CANCEL TRANSACTION
																Transact_End(False:C215)
															End if 
															
														Else 
															//TRACE
															[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
															[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=STK_l_OrderItemNumber
															[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=STK_l_OrderItemNumber
															STK_R_QuantityRequired:=STK_R_QuantityRequired-$_r_TotalResidualStockQuantity
															$_r_TotalResidualStockQuantity:=$_r_TotalResidualStockQuantity-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
															STK_bo_AllocatedFromPO:=True:C214
															DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
															
														End if 
														
													End if 
												End if 
											End for 
											If (STK_R_QuantityRequired=0)
												$_r_AllocationQuantity:=$_l_Required-STK_R_QuantityRequired
												$_r_ScreenHorizontalCenter:=Screen width:C187/2
												$_r_ScreenVerticalCenter:=Screen height:C188/2
												//Open window($_r_ScreenHorizontalCenter-150;$_r_ScreenVerticalCenter-100;$_r_ScreenHorizontalCenter+150;$_r_ScreenVerticalCenter;Palette window )
												//GOTO XY(0;0)
												//MESSAGE("inventory of "+String($_r_AllocationQuantity)+" is now allocated from on order stock to this item")
												//DelayTicks (3*70)
												//CLOSE WINDOW
												STK_bo_DoooAllocate:=True:C214
											End if 
											
										End if 
										
									End if 
									
									
								End if 
								
							End if 
							
							
							//```
						End if 
						If (STK_bo_AllocatedFromPO)
							[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
							DB_SaveRecord(->[ORDER_ITEMS:25])
							AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
						End if 
						If (OK=1)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
							OrderI_AllCSUp
							If (OK=1)
								//Update the Order Item
								OrderI_AllOIUp
							End if 
						End if 
						If ([ORDER_ITEMS:25]Allocated:28<[ORDER_ITEMS:25]Quantity:3)
							Gen_Confirm("Try again to allocate stock?"; "Yes"; "No")
							If (OK=1)
								$_bo_CheckedFreee:=True:C214
								STK_bo_ShowFREE:=True:C214
							End if 
						End if 
						OK:=1
						DB_bo_RecordModified:=$_bo_Modified
						DB_t_CallOnCloseorSave:=$_t_CloseSave
						vAdd:=$_l_AddMode
						$_bo_CheckedOnOrder:=True:C214
					Else 
						If ($_bo_WarnZero)
							Gen_Alert("Sorry there is no on order stock for this product!")
							$_bo_CheckedOnOrder:=True:C214
						End if 
						
					End if 
				Else 
					$_bo_CheckOnOrder:=False:C215
					$_bo_CheckedOnOrder:=True:C214
					OK:=1
				End if 
			Else 
				$_bo_CheckOnOrder:=False:C215
				$_bo_CheckedOnOrder:=True:C214
				OK:=1
			End if 
			
		Until ($_bo_CheckedFreee) & ($_bo_CheckedAllocated) & ($_bo_CheckedOnOrder)
		
		USE NAMED SELECTION:C332("ALLOCOrders")
		USE NAMED SELECTION:C332("ALLOCOrder_Items")
		GOTO RECORD:C242([ORDER_ITEMS:25]; vRecNo)
		If ([ORDER_ITEMS:25]Product_Code:2#"")
			RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		End if 
		CLEAR NAMED SELECTION:C333("ALLOCOrders")
		CLEAR NAMED SELECTION:C333("ALLOCOrder_Items")
		Transact_End
		STK_bo_inTransaction:=False:C215
		If (Size of array:C274($_al_ForceRecalculation)>0)
			//For ($_l_SerialsIndex;1;Size of array($_al_ForceRecalculation))
			//QUERY([STOCK_MOVEMENT_ITEMS];[STOCK_MOVEMENT_ITEMS]x_ID=$_al_ForceRecalculation{$_l_SerialsIndex})
			//While (Not(Check_Locked (->[STOCK_MOVEMENT_ITEMS];0)))
			//DelayTicks (2)
			//End while
			//STK_UpdateCalledOffQuantity
			//DB_SaveRecord (->[STOCK_MOVEMENT_ITEMS];False)
			//End for
		End if 
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
		
		If (STK_bo_ReloadScreen)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
			If (ORD_bo_NoRebuild)
				ORD_bo_Rebuild:=True:C214
			Else 
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("ReloadOrderItems")
				POST OUTSIDE CALL:C329(Current process:C322)
				
			End if 
		End if 
		
		CLEAR SEMAPHORE:C144("CurrentStock"+[ORDER_ITEMS:25]Product_Code:2)
		
		
	End if 
End if 
STK_bo_AllocCLog:=False:C215
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("OrderI AllocCu2"; $_t_oldMethodName)
