//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_AllocAu2
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
	ARRAY LONGINT:C221($_al_AllocateStockRecordIDS; 0; 0)
	ARRAY LONGINT:C221($_al_ForceRecalc; 0)
	ARRAY LONGINT:C221($_al_IncludeOrderItems; 0)
	ARRAY LONGINT:C221($_al_OrderItemsLeft; 0)
	ARRAY LONGINT:C221($_al_SelectRows; 0)
	ARRAY LONGINT:C221($_al_StockItemIDS; 0)
	ARRAY POINTER:C280($_aptr_FieldsArray; 0)
	ARRAY REAL:C219($_ar_AllocResidualStockQty; 0)
	ARRAY REAL:C219($_ar_AllocStockPrice; 0)
	ARRAY REAL:C219($_ar_AllocStockQty; 0)
	ARRAY REAL:C219($_ar_TotalCosts; 0)
	ARRAY REAL:C219($_ar_UnitCosts; 0)
	ARRAY REAL:C219($_ar_UnitQuantities; 0)
	ARRAY TEXT:C222($_at_AllocateSerialNo; 0)
	ARRAY TEXT:C222($_at_AllocationCurrency; 0)
	ARRAY TEXT:C222($_at_AllocatonMovementTypes; 0)
	ARRAY TEXT:C222($_at_AllocLocationCodes; 0)
	ARRAY TEXT:C222($_at_AllocProductCodes; 0)
	ARRAY TEXT:C222($_at_AllocPurchaseOrderNum; 0)
	ARRAY TEXT:C222($_at_AlocStockTypes; 0)
	ARRAY TEXT:C222($_at_CurrenciesRange; 0)
	ARRAY TEXT:C222($_at_IncomingStockAdds; 0)
	ARRAY TEXT:C222($_at_IncomingStockAdds2; 0)
	ARRAY TEXT:C222($_at_IncomingStockMoveTypes; 0)
	ARRAY TEXT:C222($_at_IncomingStockMoveTypes2; 0)
	ARRAY TEXT:C222($_at_LocationsRange; 0)
	ARRAY TEXT:C222($_at_ProductCodeRange; 0)
	ARRAY TEXT:C222($_at_SerialNos; 0)
	ARRAY TEXT:C222($_at_StockTypes; 0)
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; <>StockAnal; $_bo_AllocCLog; $_bo_AutoMessages; $_bo_CheckedAllocated; $_bo_CheckedFree; $_bo_CheckedOnOrder; $_bo_CreateStockMovement; $_bo_Edits; $_bo_TryWithPONumber; $_bo_UnloadStockMovement)
	C_BOOLEAN:C305(DSPLY_bo_PrefsLoaded; ORD_bo_NoRebuild; ORD_bo_Rebuild; STK_bo_AllocationRecord; STK_bo_DeferValidation; STK_bo_inTransaction; STK_bo_ReloadScreen)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_StockHeaderDateWas)
	C_LONGINT:C283($_l_AddToCurrentStockID; $_l_ArraySize; $_l_ColumnNumber; $_l_CurrenciesIndex; $_l_CurrencyIndex; $_l_CurrencyRow; $_l_Index; $_l_LineCount; $_l_LineNumber; $_l_LocationsIndex; $_l_MoveTypeIndex2)
	C_LONGINT:C283($_l_MoveTypeRow; $_l_OrderItemNumber; $_l_OrderItemRow; $_l_PointerDataType; $_l_ProductRangeIndex; $_l_RecordsinOISelection; $_l_SelectedRecordNumber; $_l_SelectedRecordNumberOrderIte; $_l_SerialRow; $_l_StockCurrentOrderItemNo; $_l_StockMovementItemID)
	C_LONGINT:C283($_l_StockMovItemNumber; $_l_StockTypeIndex; $_l_Thermometer; $_l_TotalLineCount; $_l_UnusedIndex; $1; $2; $3; IP_l_Message; STK_l_OrderItemNumber)
	C_POINTER:C301($_ptr_QuantityArray; $4; $5)
	C_REAL:C285($_r_Allocate; $_r_AverageUnitCost; $_r_CalledOffQuantity; $_r_PercentageDone; $_r_Quantity; $_r_QuantityRequired; $_r_QuantitytoSplittoff; $_r_SubPointerValue; $_r_SumCosts; $_r_Summmy; $_r_Total)
	C_REAL:C285($_r_TotalAllocate; $_r_TotalAvailable; $_r_TotalQuantity; vQuantity)
	C_TEXT:C284(<>STK_T_AllocLog; <>SYS_t_BaseCurrency; $_t_AddToStockType; $_t_AnalysisCode; $_t_Currency; $_t_CurrencyCode; $_t_LayerCode; $_t_Location; $_t_oldMethodName; $_t_OrderCode; $_t_TryPONumber)
	C_TEXT:C284($0; vProdCode)
	C_TIME:C306($_ti_DocumentRef; STK_ti_RecordDocument)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OrderI_AllocAu2")

//there is modified V13 behaviour in here that needs testing••
$_bo_AllocCLog:=(STK_bo_AllocCLog) | (<>STK_bo_AllocationLog)

//[PROCESSES_TO_HANDLE]Status

If (STK_bo_AllocationRecord)
	$_ti_DocumentRef:=STK_ti_RecordDocument
End if 
STK_bo_AllocationRecord:=True:C214


$_t_oldMethodName:=ERR_MethodTracker("OrderI_AllocAu2"; Form event code:C388)
//OrderI_AllocAu2
$_bo_UnloadStockMovement:=True:C214
READ ONLY:C145([STOCK_MOVEMENTS:40])
UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
READ WRITE:C146([STOCK_MOVEMENTS:40])
//READ WRITE([STOCK ITEMS])
READ WRITE:C146([CURRENT_STOCK:62])
READ WRITE:C146([STOCK_LEVELS:58])
If (Count parameters:C259>=1)
	$_l_OrderItemNumber:=$1
Else 
	$_l_OrderItemNumber:=0
End if 
//  START TRANSACTION
STK_bo_ReloadScreen:=False:C215
ARRAY LONGINT:C221($_al_OrderItemsLeft; 0)

COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "ToAllocate")
DISTINCT VALUES:C339([ORDER_ITEMS:25]Product_Code:2; $_at_ProductCodeRange)
//SELECTION TO ARRAY([ORDER_ITEMS]x_ID;$_al_OrderItemsLeft)
Repeat 
	
	ARRAY LONGINT:C221($_al_IncludeOrderItems; 0)
	SELECTION TO ARRAY:C260([ORDER_ITEMS:25]x_ID:58; $_al_IncludeOrderItems)
	If (False:C215)
		For ($_l_ProductRangeIndex; 1; Size of array:C274($_at_ProductCodeRange))
			USE NAMED SELECTION:C332("ToAllocate")
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$_at_ProductCodeRange{$_l_ProductRangeIndex})
			If (Records in selection:C76([ORDER_ITEMS:25])>1)
				For ($_l_UnusedIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
					$_l_OrderItemRow:=Find in array:C230($_al_OrderItemsLeft; [ORDER_ITEMS:25]x_ID:58)
					If ($_l_OrderItemRow>0)
						APPEND TO ARRAY:C911($_al_IncludeOrderItems; [ORDER_ITEMS:25]x_ID:58)
						DELETE FROM ARRAY:C228($_al_OrderItemsLeft; $_l_OrderItemRow)
						$_l_UnusedIndex:=99999
					End if 
					NEXT RECORD:C51([ORDER_ITEMS:25])
				End for 
			Else 
				$_l_OrderItemRow:=Find in array:C230($_al_OrderItemsLeft; [ORDER_ITEMS:25]x_ID:58)
				If ($_l_OrderItemRow>0)
					APPEND TO ARRAY:C911($_al_IncludeOrderItems; [ORDER_ITEMS:25]x_ID:58)
					DELETE FROM ARRAY:C228($_al_OrderItemsLeft; $_l_OrderItemRow)
				End if 
			End if 
		End for 
	End if 
	
	If (Size of array:C274($_al_IncludeOrderItems)>0) | (True:C214)
		USE NAMED SELECTION:C332("ToAllocate")
		QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]x_ID:58; $_al_IncludeOrderItems)
		//
		//we will now have no more than one of each product
		If (Count parameters:C259<3)  //if passed 3 parameters we should already be in a transaction creating a multiline allocation
			StartTransaction  // 13/05/02 pb
		End if 
		If ($_bo_AllocCLog)
			<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Transaction Started:="+String:C10(Current time:C178)
		End if 
		If (Count parameters:C259<3)
			CREATE RECORD:C68([STOCK_MOVEMENTS:40])
			$_bo_CreateStockMovement:=True:C214
		Else 
			$_bo_UnloadStockMovement:=False:C215
			If ($2=1)
				CREATE RECORD:C68([STOCK_MOVEMENTS:40])
				$_bo_CreateStockMovement:=True:C214
				$_bo_UnloadStockMovement:=False:C215
			Else 
				$_bo_CreateStockMovement:=False:C215
			End if 
		End if 
		$0:=""
		ARRAY TEXT:C222($_at_AllocatonMovementTypes; 0)
		If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
			SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocatonMovementTypes)
			If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
				Gen_Alert(Term_StoWT("Please create a Stock Movement Type suitable for Allocations before using this ")+"function"; "Cancel")
				$0:=""
			End if 
		End if 
		ARRAY LONGINT:C221($_al_ForceRecalc; 0)
		
		If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
			If ($_bo_CreateStockMovement)
				Movement_Code
				If ($_bo_AllocCLog)
					<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Movement Code Created:="+[STOCK_MOVEMENTS:40]Movement_Code:1+String:C10(Current time:C178)
				End if 
				If ($_bo_AutoMessages)
					Gen_Alert("Creating Stock movment"+[STOCK_MOVEMENTS:40]Movement_Code:1)
					
				End if 
				[STOCK_MOVEMENTS:40]MovementSourceTable:16:=Table:C252(->[ORDERS:24])
				[STOCK_MOVEMENTS:40]MovementSourceField:17:=Field:C253(->[ORDERS:24]Order_Code:3)
				[STOCK_MOVEMENTS:40]Company_From:2:=[ORDERS:24]Company_Code:1
				[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
				[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
				If ($_bo_AllocCLog)
					<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Movement Type Number Created:="+[STOCK_MOVEMENTS:40]Type_Number:4+String:C10(Current time:C178)
				End if 
				[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
				[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
				If (<>StockAnal)
					[STOCK_MOVEMENTS:40]Analysis_Code:9:=[ORDERS:24]Analysis_Code:33
				End if 
				[STOCK_MOVEMENTS:40]Currency_Code:10:=[ORDERS:24]Currency_Code:32
				[STOCK_MOVEMENTS:40]Layer_Code:11:=[ORDERS:24]Layer_Code:47
			End if 
			If (STK_bo_AllocationRecord)
				//SEND PACKET($_ti_DocumentRef;"Stock Movement Created"+([STOCK_MOVEMENTS]Movement_Code)+Char(13))
				
				
			End if 
			
			If (Records in selection:C76([ORDER_ITEMS:25])>1) & (Selected record number:C246([ORDER_ITEMS:25])#1)
				FIRST RECORD:C50([ORDER_ITEMS:25])
			Else 
				If ($_l_OrderItemNumber#0)
					If ([ORDER_ITEMS:25]Item_Number:27#$_l_OrderItemNumber)
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_OrderItemNumber)
					End if 
				End if 
			End if 
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Get Order items Allocated Qty Starts"+String:C10($_l_OrderItemNumber)+" "+String:C10(Current time:C178)
			End if 
			[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Get Order items Allocated Qty Ends"+String:C10($_l_OrderItemNumber)+" "+String:C10(Current time:C178)
			End if 
			//Gen_Alert ("Order item allocate"+String([ORDER ITEMS]Allocated))
			//DSPLY_bo_DisplayProgressBars:=True
			//THERM_l_ThermoProc:=False
			DSPLY_bo_PrefsLoaded:=True:C214
			
			$_l_Thermometer:=OPEN_THERMOMETER("Allocation Stock..."; True:C214; True:C214; True:C214)  //Disallow user auto close -kmw 03/03/09 v631b120o
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Open Thermometer"+" "+String:C10(Current time:C178)
				
			End if 
			$_l_LineCount:=1
			$_l_TotalLineCount:=(Records in selection:C76([ORDER_ITEMS:25]))
			
			
			While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (OK=1))
				$_l_LineCount:=$_l_LineCount+1
				$_r_PercentageDone:=Int:C8($_l_LineCount/$_l_TotalLineCount)*100
				SET_THERMOMETER("Allocation On Order item "+String:C10($_l_LineCount)+" of "+String:C10($_l_TotalLineCount)+".."; $_r_PercentageDone)
				
				//SET_AUTOTHERM ("Allocation On Order item "+String($_l_LineCount)+" of "+String($_l_TotalLineCount)+"..";$_l_LineCount;$_l_TotalLineCount)  //Changed to autotherm -kmw 27/02/09 v631b120o
				
				If (STK_bo_AllocationRecord)
					//SEND PACKET($_ti_DocumentRef;"Allocating on order item"+String([ORDER_ITEMS]Item_Number)+Char(13))
					
				End if 
				If ($_bo_AllocCLog)
					<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Allocation an order item, Line Number"+String:C10($_l_LineCount)+" "+String:C10(Current time:C178)
				End if 
				
				If ($_bo_AutoMessages)
					Gen_Alert("Looking for stock of product"+[ORDER_ITEMS:25]Product_Code:2+" Order item allocate"+String:C10([ORDER_ITEMS:25]Allocated:28))
					
				End if 
				If ($_bo_AllocCLog)
					<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Looking for stock of product"+[ORDER_ITEMS:25]Product_Code:2+" Order item allocate"+String:C10([ORDER_ITEMS:25]Allocated:28)+" "+String:C10(Current time:C178)
				End if 
				$_r_TotalQuantity:=$_r_TotalQuantity+[ORDER_ITEMS:25]Quantity:3
				$_r_TotalAllocate:=$_r_TotalAllocate+[ORDER_ITEMS:25]Allocated:28
				If ([ORDER_ITEMS:25]Allocated:28#0)
					$0:="PART"
				End if 
				
				
				If ($_bo_AutoMessages)
					Gen_Alert("Quantity to allocate on this line now calculated at "+String:C10($_r_TotalAllocate))
				End if 
				If ($_bo_AllocCLog)
					<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Quantity to allocate on this line now calculated at "+String:C10($_r_TotalAllocate)+" "+String:C10(Current time:C178)
				End if 
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]UseForStockReceipt:33=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_IncomingStockMoveTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_IncomingStockAdds)
				//Gen_Alert ("Incoming stock types loaded")
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_IncomingStockMoveTypes2; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_IncomingStockAdds2)
				For ($_l_MoveTypeIndex2; 1; Size of array:C274($_at_IncomingStockMoveTypes2))
					$_l_MoveTypeRow:=Find in array:C230($_at_IncomingStockMoveTypes; $_at_IncomingStockMoveTypes2{$_l_MoveTypeIndex2})
					If ($_l_MoveTypeRow<0)
						APPEND TO ARRAY:C911($_at_IncomingStockMoveTypes; $_at_IncomingStockMoveTypes2{$_l_MoveTypeIndex2})
						APPEND TO ARRAY:C911($_at_IncomingStockAdds; $_at_IncomingStockAdds2{$_l_MoveTypeIndex2})
						
					End if 
				End for 
				If ($_bo_AllocCLog)
					<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Loaded relevant movent types"+" "+String:C10(Current time:C178)
				End if 
				
				If ([ORDER_ITEMS:25]Item_Number:27#0)
					If ([ORDER_ITEMS:25]Product_Code:2#"")
						While (Semaphore:C143("CurrentStock"+[ORDER_ITEMS:25]Product_Code:2))  //Prevent any other process from creating the same current stock
							//ALERT("in OrderI_AllocAu2")
							If ($_bo_AllocCLog)
								<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"waiting for semaphore"+"CurrentStock"+[ORDER_ITEMS:25]Product_Code:2+" "+String:C10(Current time:C178)
							End if 
							
							DelayTicks(2)
						End while 
						If ([ORDER_ITEMS:25]Purchase_Order_Number:18#"BUNDLE@")
							If ([ORDER_ITEMS:25]Invoice_Number:17#"ASS COMP")
								If ([ORDER_ITEMS:25]Quantity:3>0)  //was # before 4.0.030
									
									
									
									If (STK_IsProductAnalysed([ORDER_ITEMS:25]Product_Code:2))
										If ($_bo_AutoMessages)
											$_r_Summmy:=([ORDER_ITEMS:25]Allocated:28)
										End if 
										If ([ORDER_ITEMS:25]Allocated:28<[ORDER_ITEMS:25]Quantity:3)
											RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
											If ([PRODUCTS:9]Maintain_Stock:14)
												$_r_QuantityRequired:=[ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28
												If (Count parameters:C259>=4)  //if a 4th parameter is passed this is a maximum qty to allocate-which may be less than the qty on the order
													
													
													
													$_l_PointerDataType:=Type:C295($4->)
													Case of 
														: ($_l_PointerDataType=Is longint:K8:6) | ($_l_PointerDataType=Is real:K8:4)
															
															
															
															If ($_r_QuantityRequired>$4->)
																$_r_QuantityRequired:=$4->
															End if 
														: ($_l_PointerDataType=LongInt array:K8:19) | ($_l_PointerDataType=Real array:K8:17)
															
															
															
															If ($1>0)
																
																$_ptr_QuantityArray:=$4
																$_r_SubPointerValue:=$_ptr_QuantityArray->{$2}
																If ($_r_SubPointerValue<$_r_QuantityRequired)
																	$_r_QuantityRequired:=$_r_SubPointerValue
																	
																	
																End if 
															Else 
																If (Count parameters:C259>=5)
																	$_l_OrderItemRow:=Find in array:C230($5->; [ORDER_ITEMS:25]Item_Number:27)
																	If ($_l_OrderItemRow>0)
																		$_ptr_QuantityArray:=$4
																		$_r_SubPointerValue:=$_ptr_QuantityArray->{$_l_OrderItemRow}
																		If ($_r_SubPointerValue<$_r_QuantityRequired)
																			$_r_QuantityRequired:=$_r_SubPointerValue
																		End if 
																	End if 
																End if 
															End if 
															
													End case 
												End if 
												vProdCode:=[ORDER_ITEMS:25]Product_Code:2
												ARRAY POINTER:C280($_aptr_FieldsArray; 3)
												$_aptr_FieldsArray{1}:=->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
												$_aptr_FieldsArray{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
												$_aptr_FieldsArray{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
												CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aptr_FieldsArray; Standard BTree index:K58:3; "SMIProductStock")
												
												
												
												If ($_bo_AllocCLog)
													<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Looking for stock movement items-with stock"+[ORDER_ITEMS:25]Product_Code:2+"Start  "+String:C10(Current time:C178)
												End if 
												
												
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2; *)
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
												CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$s1")
												QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
												SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocatonMovementTypes)
												QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocatonMovementTypes)
												If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
													CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$s2")
													DIFFERENCE:C122("$s1"; "$s2"; "$s1")
													USE SET:C118("$s1")
													
												Else 
													USE SET:C118("$s1")
												End if 
												//Remember here because we are only including ISOs this will only be items ordered for this order item-it will not include allocations
												QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_IncomingStockAdds)
												
												
												If ($_bo_AutoMessages)
													$_r_Summmy:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
													Gen_Alert("There appear to be "+String:C10($_r_Summmy)+"Free")
													
												End if 
												
												
												//`````````````````````````
												$_bo_CheckedFree:=False:C215
												$_bo_CheckedOnOrder:=False:C215
												$_bo_CheckedAllocated:=False:C215
												
												
												$_t_AnalysisCode:=[ORDERS:24]Analysis_Code:33
												$_t_LayerCode:=[ORDERS:24]Layer_Code:47
												If (<>StockAnal)
													QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_t_AnalysisCode)
												End if 
												If ($_t_LayerCode#"")
													QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$_t_LayerCode)
												End if 
												$_r_Allocate:=0
												
												If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
													ARRAY TEXT:C222($_at_LocationsRange; 0)
													DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_LocationsRange)
													ARRAY TEXT:C222($_at_CurrenciesRange; 0)
													DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_CurrenciesRange)
													$_l_CurrencyRow:=Find in array:C230($_at_CurrenciesRange; "")
													If ($_l_CurrencyRow>0)
														DELETE FROM ARRAY:C228($_at_CurrenciesRange; $_l_CurrencyRow)
													End if 
													If (Size of array:C274($_at_CurrenciesRange)=0)
														APPEND TO ARRAY:C911($_at_CurrenciesRange; <>SYS_t_BaseCurrency)
													End if 
													DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_StockTypes)
													COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$ForAllocation")
													
													ARRAY TEXT:C222($_at_AllocProductCodes; 0)
													
													ARRAY TEXT:C222($_at_AlocStockTypes; 0)
													ARRAY REAL:C219($_ar_AllocStockQty; 0)
													ARRAY REAL:C219($_ar_AllocResidualStockQty; 0)
													ARRAY REAL:C219($_ar_AllocStockPrice; 0)
													ARRAY TEXT:C222($_at_AllocationCurrency; 0)
													ARRAY TEXT:C222($_at_AllocateSerialNo; 0)
													ARRAY TEXT:C222($_at_AllocLocationCodes; 0)
													ARRAY LONGINT:C221($_al_AllocateStockRecordIDS; 0; 0)
													ARRAY TEXT:C222($_at_AllocPurchaseOrderNum; 0)
													
													$_t_TryPONumber:=""
													$_bo_TryWithPONumber:=False:C215
													If ([ORDER_ITEMS:25]Purchase_Order_Number:18#"")
														$_t_TryPONumber:=[ORDER_ITEMS:25]Purchase_Order_Number:18
														$_bo_TryWithPONumber:=True:C214
													End if 
													For ($_l_StockTypeIndex; 1; Size of array:C274($_at_StockTypes))
														For ($_l_CurrenciesIndex; 1; Size of array:C274($_at_CurrenciesRange))
															For ($_l_LocationsIndex; 1; Size of array:C274($_at_LocationsRange))
																USE NAMED SELECTION:C332("$ForAllocation")
																
																QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_at_StockTypes{$_l_StockTypeIndex}; *)
																QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Location:7=$_at_LocationsRange{$_l_LocationsIndex})
																If ($_at_CurrenciesRange{$_l_CurrenciesIndex}=<>SYS_t_BaseCurrency)
																	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=<>SYS_t_BaseCurrency; *)
																	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29="")
																Else 
																	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
																End if 
																If ($_bo_TryWithPONumber) & ($_t_TryPONumber#"") & ($_t_TryPONumber#"STOCK")
																	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20=$_t_TryPONumber)
																End if 
																If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)  //Try to use from the record witht the least quantity if we can
																	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Temp2")
																	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>=$_r_QuantityRequired)
																	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
																		ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; >)
																		REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 1)
																	Else 
																		USE NAMED SELECTION:C332("$Temp2")
																	End if 
																End if 
																If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
																	APPEND TO ARRAY:C911($_at_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
																	$_l_arraySize:=Size of array:C274($_al_AllocateStockRecordIDS)
																	INSERT IN ARRAY:C227($_al_AllocateStockRecordIDS; $_l_arraySize+1; 1)
																	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_AllocateStockRecordIDS{$_l_arraySize+1})
																	FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
																	
																	APPEND TO ARRAY:C911($_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
																	APPEND TO ARRAY:C911($_at_AlocStockTypes; $_at_StockTypes{$_l_StockTypeIndex})
																	APPEND TO ARRAY:C911($_ar_AllocStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
																	APPEND TO ARRAY:C911($_ar_AllocResidualStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
																	APPEND TO ARRAY:C911($_at_AllocPurchaseOrderNum; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
																	
																	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_UnitCosts; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_UnitQuantities)
																	FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
																	ARRAY REAL:C219($_ar_TotalCosts; 0)
																	ARRAY REAL:C219($_ar_TotalCosts; Size of array:C274($_ar_UnitQuantities))
																	
																	For ($_r_Total; 1; Size of array:C274($_ar_UnitQuantities))
																		$_ar_TotalCosts{$_r_Total}:=$_ar_UnitQuantities{$_r_Total}*$_ar_UnitCosts{$_r_Total}
																		//$_r_SumCosts:=$_r_SumCosts+$_ar_TotalCosts{$_r_Total}
																	End for 
																	$_r_SumCosts:=Sum:C1($_ar_TotalCosts)
																	$_r_AverageUnitCost:=$_r_SumCosts/(Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
																	APPEND TO ARRAY:C911($_ar_AllocStockPrice; Round:C94($_r_AverageUnitCost; 2))
																	APPEND TO ARRAY:C911($_at_AllocationCurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
																	DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNos)
																	$_l_SerialRow:=Find in array:C230($_at_SerialNos; "")
																	If ($_l_SerialRow>0)
																		DELETE FROM ARRAY:C228($_at_SerialNos; $_l_SerialRow)
																	End if 
																	If (Size of array:C274($_at_SerialNos)>1)
																		APPEND TO ARRAY:C911($_at_AllocateSerialNo; "Various")
																		
																	Else 
																		If (Size of array:C274($_at_SerialNos)>0)
																			APPEND TO ARRAY:C911($_at_AllocateSerialNo; $_at_SerialNos{1})
																		Else 
																			APPEND TO ARRAY:C911($_at_AllocateSerialNo; "")
																			
																		End if 
																	End if 
																	
																	
																Else 
																	APPEND TO ARRAY:C911($_at_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
																	APPEND TO ARRAY:C911($_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
																	APPEND TO ARRAY:C911($_at_AlocStockTypes; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31)
																	APPEND TO ARRAY:C911($_ar_AllocStockQty; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																	APPEND TO ARRAY:C911($_ar_AllocResidualStockQty; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
																	APPEND TO ARRAY:C911($_ar_AllocStockPrice; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
																	$_l_ArraySize:=Size of array:C274($_al_AllocateStockRecordIDS)
																	INSERT IN ARRAY:C227($_al_AllocateStockRecordIDS; $_l_ArraySize+1; 1)
																	APPEND TO ARRAY:C911($_al_AllocateStockRecordIDS{$_l_ArraySize+1}; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																	APPEND TO ARRAY:C911($_at_AllocationCurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
																	APPEND TO ARRAY:C911($_at_AllocateSerialNo; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
																	APPEND TO ARRAY:C911($_at_AllocPurchaseOrderNum; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
																	
																	
																	
																End if 
															End for 
														End for 
													End for 
													Repeat 
														If (Not:C34($_bo_TryWithPONumber))
															$_t_TryPONumber:=""
														End if 
														
														If (Size of array:C274($_at_AlocStockTypes)>0)
															//IN THIS BIT I WOULD LIKE TO USE THE PREFERENCES OF LOCATION -NEED USERS LOCATION ADDED FOR THAT!!!
															
															
															If ([ORDERS:24]Currency_Code:32#"")
																$_l_CurrencyRow:=Find in array:C230($_at_AllocationCurrency; [ORDERS:24]Currency_Code:32)
															Else 
																$_l_CurrencyRow:=Find in array:C230($_at_AllocationCurrency; <>SYS_t_BaseCurrency)
																If ($_l_CurrencyRow<0)
																	$_l_CurrencyRow:=Find in array:C230($_at_AllocationCurrency; "")
																	If ($_l_CurrencyRow<0)
																		$_l_CurrencyRow:=1
																	End if 
																End if 
															End if 
															ARRAY LONGINT:C221($_al_SelectRows; 0)
															$_r_TotalAvailable:=0
															If ($_l_CurrencyRow>0)
																$_t_Currency:=$_at_AllocationCurrency{$_l_CurrencyRow}
																For ($_l_CurrencyIndex; $_l_CurrencyRow; Size of array:C274($_at_AllocationCurrency))
																	If ($_at_AllocationCurrency{$_l_CurrencyIndex}=$_t_Currency)
																		If ($_bo_TryWithPONumber)
																			If ($_at_AllocPurchaseOrderNum{$_l_CurrencyRow}=$_t_TryPONumber)
																				
																				$_r_TotalAvailable:=$_r_TotalAvailable+$_ar_AllocResidualStockQty{$_l_CurrencyIndex}
																				//APPEND TO ARRAY($_at_AllocProductCodes;[STOCK_MOVEMENT_ITEMS]Product_Code)
																				//APPEND TO ARRAY($_at_AlocStockTypes;$_at_StockTypes{$_l_CurrencyIndex})
																				//APPEND TO ARRAY($_ar_AllocStockQty;Sum([STOCK_MOVEMENT_ITEMS]Quantity))
																				//APPEND TO ARRAY($_ar_AllocResidualStockQty;Sum([STOCK_MOVEMENT_ITEMS]X_Residual_Stock_Quantity))
																				//APPEND TO ARRAY($_at_AllocPurchaseOrderNum;[STOCK_MOVEMENT_ITEMS]Purchase_Order_Code)
																				
																			End if 
																		Else 
																			$_r_TotalAvailable:=$_r_TotalAvailable+$_ar_AllocResidualStockQty{$_l_CurrencyIndex}
																		End if 
																		
																		APPEND TO ARRAY:C911($_al_SelectRows; $_l_CurrencyIndex)
																		If ($_r_TotalAvailable>=$_r_QuantityRequired)
																			$_l_CurrencyIndex:=Size of array:C274($_at_AllocationCurrency)
																		End if 
																	End if 
																End for 
																
																If ($_r_TotalAvailable<$_r_QuantityRequired)
																	For ($_l_Index; 1; Size of array:C274($_at_AllocationCurrency))
																		If ($_at_AllocationCurrency{$_l_Index}#$_t_Currency)
																			$_r_TotalAvailable:=$_r_TotalAvailable+$_ar_AllocResidualStockQty{$_l_Index}
																			APPEND TO ARRAY:C911($_al_SelectRows; $_l_Index)
																			If ($_r_TotalAvailable>=$_r_QuantityRequired)
																				$_l_Index:=Size of array:C274($_at_AllocationCurrency)
																			End if 
																		End if 
																	End for 
																End if 
															End if 
														End if 
														$_bo_TryWithPONumber:=False:C215  // if the Sales order item has a PO number this will try to select stock with the PO number
														//it will then set this to false and if there was no enough will then try for stock without the PO number on
													Until ($_bo_TryWithPONumber=False:C215) & ($_t_TryPONumber="") | ($_r_TotalAvailable>=$_r_QuantityRequired)
													
													
													ARRAY LONGINT:C221($_al_StockItemIDS; 0)
													If ($_r_TotalAvailable>0)
														For ($_l_Index; 1; Size of array:C274($_al_SelectRows))
															$_l_LineNumber:=$_al_SelectRows{$_l_Index}
															For ($_l_ColumnNumber; 1; Size of array:C274($_al_AllocateStockRecordIDS{$_l_LineNumber}))
																
																If (Find in array:C230($_al_StockItemIDS; $_al_AllocateStockRecordIDS{$_l_LineNumber}{$_l_ColumnNumber})<0)
																	APPEND TO ARRAY:C911($_al_StockItemIDS; $_al_AllocateStockRecordIDS{$_l_LineNumber}{$_l_ColumnNumber})
																	
																End if 
															End for 
														End for 
														If ($_bo_AllocCLog)
															<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Looking for stock movement items-with stock"+[ORDER_ITEMS:25]Product_Code:2+"end  "+String:C10(Current time:C178)
														End if 
														If (Size of array:C274($_al_StockItemIDS)>0)
															For ($_l_Index; 1; Size of array:C274($_al_StockItemIDS))
																If ($_bo_AllocCLog)
																	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Getting Data from existing stock item"+" "+String:C10(Current time:C178)
																End if 
																If ($_r_QuantityRequired>0)
																	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockItemIDS{$_l_Index})
																	
																	STK_ItemDuplicate
																	[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
																	[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=False:C215
																	If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>=$_r_QuantityRequired)
																		$_r_Allocate:=$_r_Allocate+$_r_QuantityRequired
																		[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_QuantityRequired
																		
																		[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
																		$_r_QuantityRequired:=0
																	Else 
																		[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
																		$_r_Allocate:=$_r_Allocate+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																		
																		[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
																		$_r_QuantityRequired:=$_r_QuantityRequired-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																	End if 
																	[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=[ORDERS:24]Company_Code:1
																	[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=[ORDER_ITEMS:25]Order_Code:1
																	$_l_AddToCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
																	[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
																	[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_AddToCurrentStockID
																	[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																	
																	
																	STK_SetCreatedStockItem(-1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; 0; [ORDER_ITEMS:25]Item_Number:27)
																	
																	$_r_CalledOffQuantity:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
																	$_t_AddToStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
																	
																	$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
																	$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
																	$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
																	$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
																	$_l_StockMovItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8  //This will only be filled in if its allocated-we will move the allocation from the on order item to the instock item.
																	$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
																	$_d_StockHeaderDateWas:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
																	
																	
																	
																	//APPEND TO ARRAY($_al_ForceRecalc;[STOCK_MOVEMENT_ITEMS]x_ID)
																	If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26#[STOCK_MOVEMENTS:40]Movement_Date:5)
																		[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=[STOCK_MOVEMENTS:40]Movement_Date:5
																	End if 
																	[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_t_LayerCode
																	[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_t_Location
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
																		If ($_d_StockHeaderDateWas=!00-00-00!)
																			$_d_StockHeaderDateWas:=Current date:C33(*)
																		End if 
																		If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#0)
																			[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=Cat_ConvertValue([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENTS:40]Currency_Code:10; $_d_StockHeaderDateWas)
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
																	$_bo_Edits:=STK_SetHeaderInfo
																	[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19:=0
																	Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																	
																	//note that the trigger will update the called off on the previous stock..that is the trigger on the stock movement
																	//this is so if we cancell the stock movement we dont make the amount wrong preventing a call off(make sure is we cancel that the items here get deleted)
																	If ($_bo_AllocCLog)
																		<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Saving Stock movement item"+"  "+String:C10(Current time:C178)
																	End if 
																	
																	
																	If ($_bo_AutoMessages)
																		Gen_Alert("Saving ALO movement item")
																	End if 
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
																		$_r_QuantityRequired:=$_r_QuantityRequired+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																		DELETE RECORD:C58([STOCK_MOVEMENT_ITEMS:27])
																	End if 
																End if 
																
															End for 
														Else 
															
															If ($_bo_AutoMessages)
																Gen_Alert("No items to create the allocation from")
															End if 
														End if 
														If ($_r_QuantityRequired>0)
															If ($_bo_AllocCLog)
																<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Splitting Order item Start"+"  "+String:C10(Current time:C178)
															End if 
															//some are not allocated so split the order tiem
															$_l_SelectedRecordNumber:=Selected record number:C246([ORDER_ITEMS:25])
															COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
															$_l_StockCurrentOrderItemNo:=[ORDER_ITEMS:25]Item_Number:27
															$_r_QuantitytoSplittoff:=$_r_QuantityRequired
															//[ORDER ITEMS]Quantity:=[ORDER ITEMS]Quantity-$_r_QuantityRequired
															DB_SaveRecord(->[ORDER_ITEMS:25])
															$_r_Quantity:=vQuantity
															vQuantity:=$_r_QuantitytoSplittoff
															OrderI_Split2(True:C214)
															vQuantity:=$_r_Quantity
															STK_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
															STK_bo_ReloadScreen:=True:C214
															//need to update this one again though first
															
															QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_StockCurrentOrderItemNo)
															OrderI_AllOIUp
															SAVE RECORD:C53([ORDER_ITEMS:25])
															USE NAMED SELECTION:C332("$temp")
															GOTO SELECTED RECORD:C245([ORDER_ITEMS:25]; $_l_SelectedRecordNumber)
															If ($_bo_AllocCLog)
																<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Splitting Order item end"+"  "+String:C10(Current time:C178)
															End if 
															
														End if 
													Else 
														If ($_bo_AutoMessages)
															Gen_Alert("No items to create the allocation from")
														End if 
														
													End if 
													
													If (OK=1)
														//OrderI_AllCSUp2
														If ($_bo_AllocCLog)
															<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+Process_Name(Current process:C322)+"Update Allocated"+"  "+String:C10(Current time:C178)
														End if 
														If (OK=1)
															[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
															If ($_bo_AllocCLog)
																<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Save order item"+"  "+String:C10(Current time:C178)
															End if 
															DB_SaveRecord(->[ORDER_ITEMS:25])
															AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
															
														End if 
														If (OK=1)
															If ($_bo_AllocCLog)
																<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"OrderAllOIup"+"  "+String:C10(Current time:C178)
															End if 
															OrderI_AllOIUp
															$_r_TotalAllocate:=$_r_TotalAllocate+$_r_Allocate
														End if 
													End if 
												Else 
													$_r_TotalAllocate:=$_r_TotalAllocate+[ORDER_ITEMS:25]Quantity:3
												End if 
											Else 
												If ($_bo_AutoMessages)
													Gen_Alert("Product is not set to maintain stock")
												End if 
											End if 
										Else 
											If ($_bo_AutoMessages)
												Gen_Alert("Order items allocated is not less than order items quantity")
											End if 
										End if 
									Else 
										Gen_Alert("This product "+[ORDER_ITEMS:25]Product_Code:2+" has not had stock setup completed. Please complete this before allocation  of stock")
									End if 
								End if 
							End if 
						End if 
						
						CLEAR SEMAPHORE:C144("CurrentStock"+[ORDER_ITEMS:25]Product_Code:2)
						
					End if 
				End if 
				$_l_SelectedRecordNumberOrderIte:=Selected record number:C246([ORDER_ITEMS:25])
				$_l_RecordsinOISelection:=Records in selection:C76([ORDER_ITEMS:25])
				
				
				NEXT RECORD:C51([ORDER_ITEMS:25])
				
			End while 
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"End of Order item create allocation items"+"  "+String:C10(Current time:C178)
			End if 
			If (Records in selection:C76([ORDER_ITEMS:25])>1) & (Selected record number:C246([ORDER_ITEMS:25])#1)
				FIRST RECORD:C50([ORDER_ITEMS:25])
			Else 
				If ($_l_OrderItemNumber#0)
					If ([ORDER_ITEMS:25]Item_Number:27#$_l_OrderItemNumber)
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_OrderItemNumber)
					End if 
				End if 
			End if 
			
			
			
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
			[STOCK_MOVEMENTS:40]Total_Cost:8:=Round:C94(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				If ($_bo_AutoMessages)
					Gen_Alert("Saving  Stock movement")
				End if 
				STK_bo_DeferValidation:=True:C214
				STK_bo_inTransaction:=True:C214
				If (Count parameters:C259<3)
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Start saving stock movement"+"  "+String:C10(Current time:C178)
					End if 
					DB_SaveRecord(->[STOCK_MOVEMENTS:40])
				Else 
					If ($2=$3)
						If ($_bo_AllocCLog)
							<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Start saving stock movement"+"  "+String:C10(Current time:C178)
						End if 
						DB_SaveRecord(->[STOCK_MOVEMENTS:40])
					End if 
					
				End if 
				
			Else 
				If ($_bo_AutoMessages)
					Gen_Alert("No ALO movement items to save")
				End if 
				OK:=0
			End if 
			CLOSE_THERMOMETER
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Thermometer Closed"+"  "+String:C10(Current time:C178)
			End if 
			
			If (($_r_TotalAllocate=$_r_TotalQuantity) & ($0="PART"))
				$0:="FULL"
			End if 
			
			If (OK=1)
				//   Transact EndNF
				If ($_bo_AutoMessages)
					Gen_Alert("Committing data")
				End if 
				If (Count parameters:C259<3)
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Transaction Commit-start"+"  "+String:C10(Current time:C178)
					End if 
					Transact_End
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Transaction Commit-end"+"  "+String:C10(Current time:C178)
					End if 
				End if 
			Else 
				If ($_bo_AutoMessages)
					If (STK_bo_AllocationRecord)
						//SEND PACKET($_ti_DocumentRef;"Cancelling save"+Char(13))
						
					End if 
					Gen_Alert("Cancelling data")
				End if 
				If (Count parameters:C259<3)
					
					Transact_End
				End if 
				//Gen_Alert ("No Allocations have been made";"OK")
				If ($0#"FULL")
					$0:="None"
				End if 
			End if 
		Else 
			
			If (Count parameters:C259<3)
				Transact_End
			End if 
		End if 
	End if 
Until (Size of array:C274($_al_OrderItemsLeft)=0) | (Size of array:C274($_al_IncludeOrderItems)=0)

STK_bo_inTransaction:=False:C215
If ($_bo_AllocCLog)
	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Post Allocation Validation start"+"  "+String:C10(Current time:C178)
End if 
//If (Size of array($_al_ForceRecalc)>0)  /// December 2014 this should now not be needed
//For ($_l_ProductRangeIndex;1;Size of array($_al_ForceRecalc))
//QUERY([STOCK_MOVEMENT_ITEMS];[STOCK_MOVEMENT_ITEMS]x_ID=$_al_ForceRecalc{$_l_ProductRangeIndex})
//While (Not(Check_Locked (->[STOCK_MOVEMENT_ITEMS])))
//DelayTicks (10)
//End while
//STK_UpdateCalledOffQuantity   //here we ONLY update the stock movement items we copied from
//DB_SaveRecord (->[STOCK_MOVEMENT_ITEMS];False)
//End for
//End if


If ($_bo_AllocCLog)
	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Post Allocation Validation end"+"  "+String:C10(Current time:C178)
End if 
If (STK_bo_ReloadScreen)
	If (ORD_bo_NoRebuild)
		ORD_bo_Rebuild:=True:C214
	Else 
		IP_l_Message:=514
		POST OUTSIDE CALL:C329(Current process:C322)
	End if 
End if 

READ ONLY:C145([STOCK_MOVEMENTS:40])
READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
READ ONLY:C145([CURRENT_STOCK:62])
READ ONLY:C145([STOCK_LEVELS:58])
If ($_bo_UnloadStockMovement)
	UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
End if 
UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
UNLOAD RECORD:C212([CURRENT_STOCK:62])
UNLOAD RECORD:C212([STOCK_LEVELS:58])
ERR_MethodTrackerReturn("OrderI_AllocAu2"; $_t_oldMethodName)