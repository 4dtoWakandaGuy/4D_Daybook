//%attributes = {}

If (False:C215)
	//Project Method Name:      ProcessService_ORDERS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AutoallocateOI; 0)
	ARRAY LONGINT:C221($_al_ReAllocateTo; 0)
	ARRAY LONGINT:C221($_al_Realocate; 0)
	ARRAY LONGINT:C221($_al_RemoveFromItemID; 0)
	ARRAY REAL:C219($_ar_CurrentOrderQuantities; 0)
	ARRAY REAL:C219($_ar_ReAllocateQuantity; 0)
	ARRAY REAL:C219($_ar_StkAutoAllocateQTY; 0)
	ARRAY REAL:C219($_ar_ToAllocate; 0)
	C_BOOLEAN:C305(<>SP_Bo_PrefsLoaded; $_bo_OK; $_bo_Run; $_bo_ValidateTransaction; $0; STK_bo_AllocationRecord; STK_bo_AutoMessages)
	C_LONGINT:C283(<>CB_SP_Orders; $_l_AllocationIndex; $_l_Delay; $_l_ItemNumber; $_l_MovementItemNumber; $_l_NewItemNumber; $_l_Num; $_l_offset; $_l_OrderItemRow; $_l_OrdersIndex; $_l_ReAllocateItemRow)
	C_LONGINT:C283($_l_RecordNumber; $_l_RecordsInSelectionOrders; $_l_Repeats; $_l_TableNumber)
	C_REAL:C285($_r_QuantityReceived; $_r_Remaining; $_r_ToAllocate)
	C_TEXT:C284($_t_addingStockMovement; $_t_AllocateResult; $_t_CurrentOrderCode; $_t_oldMethodName; $_t_OrderCode; $_t_productCode; $_t_StockMovementCode; vStPrev)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_ORDERS")

//ProcessService_ORDERS
// 12/1/2003 NG
// Runs various methods called from trigger

Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="AutoAllocate")
		//Open window(80;80;400;400;-Palette window)
		//TRACE
		
		
		//TRACE
		
		
		//test this
		
		$_l_RecordNumber:=Find in field:C653([ORDERS:24]x_ID:58; [PROCESSES_TO_HANDLE:115]RecordNumber:7)  // 26/02/03 pb
		
		//   If (Records in selection([ORDERS])=0)
		If ($_l_RecordNumber=-1)  // 26/02/03 pb
			
			[PROCESSES_TO_HANDLE:115]Comments:3:="Order record not found."
			[PROCESSES_TO_HANDLE:115]Status:2:=3
			DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
			$0:=True:C214
		Else 
			If (Test path name:C476("ProcessHandler.txt")#Is a document:K24:1)
				//$_ti_DocumentRef:=DB_CreateDocument ("ProcessHandler.txt";"TEXT")
				
				If (OK=1)
					//Close DocUMENT($_ti_DocumentRef)
					
				End if 
			End if 
			//$_ti_DocumentRef:=Append document("ProcessHandler.txt";"TEXT")
			
			READ WRITE:C146([ORDERS:24])
			READ WRITE:C146([ORDER_ITEMS:25])
			QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
			ARRAY LONGINT:C221($_al_AutoallocateOI; 0)
			ARRAY REAL:C219($_ar_StkAutoAllocateQTY; 0)
			ARRAY LONGINT:C221($_al_RemoveFromItemID; 0)
			$_l_offset:=0
			//These are the allocations for ONE order
			BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_al_AutoallocateOI; $_l_offset)
			BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_ar_StkAutoAllocateQTY; $_l_offset)
			BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_al_RemoveFromItemID; $_l_offset)
			//```
			$_t_CurrentOrderCode:=[ORDERS:24]Order_Code:3
			//For ($_l_AllocationIndex;1;Size of array($_al_AutoallocateOI))
			//SEND PACKET($_ti_DocumentRef;String($_al_AutoallocateOI{$_l_AllocationIndex})+" "+String($_ar_StkAutoAllocateQTY{$_l_AllocationIndex})+" "+String($_al_RemoveFromItemID{$_l_AllocationIndex})+Char(13))
			
			//End for
			
			//START TRANSACTION
			ARRAY LONGINT:C221($_al_Realocate; 0)
			ARRAY LONGINT:C221($_al_ReAllocateTo; 0)
			ARRAY REAL:C219($_ar_ReAllocateQuantity; 0)
			
			
			$_t_StockMovementCode:=""
			
			$_bo_ValidateTransaction:=True:C214
			$_t_addingStockMovement:=""
			If (Size of array:C274($_al_AutoallocateOI)>0)
				
				For ($_l_AllocationIndex; 1; Size of array:C274($_al_AutoallocateOI))
					$_bo_ValidateTransaction:=True:C214
					//MESSAGE("ALLOCATION HAPPENING")
					
					
					
					If ($_al_RemoveFromItemID{$_l_AllocationIndex}>0)
						READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_RemoveFromItemID{$_l_AllocationIndex})
						$_r_QuantityReceived:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
						If ($_r_QuantityReceived>0)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_RemoveFromItemID{$_l_AllocationIndex})
							$_l_Repeats:=0
							$_l_Delay:=2
							Repeat 
								$_l_Repeats:=$_l_Repeats+1
								$_bo_OK:=Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1)
								If (Not:C34($_bo_OK))
									DelayTicks(2*$_l_Delay)
								End if 
								If ($_l_Repeats>10)
									$_bo_ValidateTransaction:=False:C215
								End if 
							Until ($_bo_OK=True:C214)
							//SEND PACKET($_ti_DocumentRef;"Quantity Received"+String($_bo_ValidateTransaction)+Char(13))
							
							If ($_bo_ValidateTransaction)
								
								QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_AutoallocateOI{$_l_AllocationIndex})
								$_l_MovementItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
								If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<=$_r_QuantityReceived) & ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)  //We received the whole ordered quantity at least
									$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
									$_l_ItemNumber:=$_al_AutoallocateOI{$_l_AllocationIndex}
									
									[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
									[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
									
									[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
								Else 
									$_r_Remaining:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_QuantityReceived
									$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
									$_l_ItemNumber:=$_al_AutoallocateOI{$_l_AllocationIndex}
									
									
									//TRACE
									
									
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_QuantityReceived
									[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									//[STOCK_MOVEMENT_ITEMS]Called_Off_Quantity:=[STOCK_MOVEMENT_ITEMS]Called_Off_Quantity+$_r_QuantityReceived
									[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
									[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
									[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
									[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
									
									
									
									//````
									//The following quantity is not received. It was pre-allocated to the sales order item so the sales order item should have a remainder
									//split off into a new sales order item. The split off POM item will need to be 'allocated' to the new SO Item so  that on receipt it too becomes ALOd
									//The reallocations are done via the $_al_Realocate Arrays
									If ($_r_Remaining>0)
										STK_ItemDuplicate
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Remaining
										[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=$_t_OrderCode
										[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
										[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
										[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
										
										APPEND TO ARRAY:C911($_al_Realocate; $_l_ItemNumber)
										APPEND TO ARRAY:C911($_al_ReAllocateTo; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										APPEND TO ARRAY:C911($_ar_ReAllocateQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									End if 
									
								End if 
							End if 
						End if 
					End if 
				End for 
				If ($_bo_ValidateTransaction)
					//Gen_Alert ("PO Stock item Checked Now going to allocate to an order item")
					READ WRITE:C146([ORDER_ITEMS:25])
					QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_AutoallocateOI)
					FIRST RECORD:C50([ORDER_ITEMS:25])
					
					If (Records in selection:C76([ORDER_ITEMS:25])>=1)
						
						
						If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
							QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
						End if 
						ARRAY REAL:C219($_ar_ToAllocate; 0)
						ARRAY REAL:C219($_ar_CurrentOrderQuantities; 0)
						ARRAY REAL:C219($_ar_ToAllocate; Size of array:C274($_al_AutoallocateOI))
						ARRAY REAL:C219($_ar_CurrentOrderQuantities; Size of array:C274($_al_AutoallocateOI))
						COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$AllocateThese")
						$_l_RecordsInSelectionOrders:=Records in selection:C76([ORDER_ITEMS:25])
						For ($_l_OrdersIndex; 1; $_l_RecordsInSelectionOrders)
							USE NAMED SELECTION:C332("$AllocateThese")
							GOTO SELECTED RECORD:C245([ORDER_ITEMS:25]; $_l_OrdersIndex)
							
							
							$_l_Delay:=1
							$_l_Repeats:=0
							$_l_Delay:=2
							Repeat 
								
								
								$_l_Repeats:=$_l_Repeats+1
								$_bo_OK:=Check_Locked(->[ORDER_ITEMS:25]; 1)
								If (Not:C34($_bo_OK))
									DelayTicks(2*$_l_Delay)
								End if 
								If ($_l_Repeats>10)
									$_bo_ValidateTransaction:=False:C215
								End if 
							Until ($_bo_OK=True:C214)
							If ($_bo_ValidateTransaction)
								[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
								//SEND PACKET($_ti_DocumentRef;"Order Item"+String([ORDER_ITEMS]Item_Number)+"Currently Allocated "+String([ORDER_ITEMS]Allocated)+Char(13))
								
								
								SAVE RECORD:C53([ORDER_ITEMS:25])
								$_r_ToAllocate:=[ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28
								//SEND PACKET($_ti_DocumentRef;"Order Item"+String([ORDER_ITEMS]Item_Number)+"To Allocate "+String($_r_ToAllocate)+Char(13))
								
								
								$_l_OrderItemRow:=Find in array:C230($_al_AutoallocateOI; [ORDER_ITEMS:25]Item_Number:27)
								If ($_r_ToAllocate>$_ar_StkAutoAllocateQTY{$_l_OrderItemRow})
									$_r_ToAllocate:=$_ar_StkAutoAllocateQTY{$_l_OrderItemRow}
									
									
								End if 
								If ($_r_ToAllocate<0)
									$_r_ToAllocate:=0
								End if 
								$_ar_ToAllocate{$_l_OrderItemRow}:=$_r_ToAllocate
								vStPrev:=""
								//SEND PACKET($_ti_DocumentRef;"Order Item"+String([ORDER_ITEMS]Item_Number)+"To Allocate "+String($_r_ToAllocate)+Char(13))
								
								
								If (Gen_PPChkStSing(->[ORDERS:24]State:15; 4; False:C215)) & ($_r_ToAllocate>0)
									
									If ([ORDER_ITEMS:25]Item_Number:27#$_al_AutoallocateOI{$_l_OrderItemRow})
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_AutoallocateOI{$_l_OrderItemRow})
									End if 
									Repeat 
										
										
										$_l_Repeats:=$_l_Repeats+1
										$_bo_OK:=Check_Locked(->[ORDER_ITEMS:25]; 1)
										If (Not:C34($_bo_OK))
											DelayTicks(2*$_l_Delay)
										End if 
										If ($_l_Repeats>10)
											$_bo_ValidateTransaction:=False:C215
										End if 
									Until ($_bo_OK=True:C214)
									
									$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
									STK_bo_AutoMessages:=False:C215
									//$_l_AllocationIndex;1;Size of array($_al_AutoallocateOI))
									If (OrderI_AllocAu1)
										If ([ORDER_ITEMS:25]Item_Number:27#$_al_AutoallocateOI{$_l_OrderItemRow})
											QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_AutoallocateOI{$_l_OrderItemRow})
										End if 
										
										$_ar_CurrentOrderQuantities{$_l_OrderItemRow}:=[ORDER_ITEMS:25]Quantity:3
									End if 
								End if 
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End for 
						QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_AutoallocateOI)
						CREATE SET:C116([ORDER_ITEMS:25]; "$CurrentOrderItems")
						//STK_ti_RecordDocument:=$_ti_DocumentRef
						STK_bo_AllocationRecord:=False:C215
						
						
						$_t_AllocateResult:=OrderI_AllocAu2(0; 1; 1; ->$_ar_ToAllocate; ->$_al_AutoallocateOI)
						STK_bo_AllocationRecord:=True:C214
						USE SET:C118("$CurrentOrderItems")
						COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$AllocateThese")
						$_l_RecordsInSelectionOrders:=Records in selection:C76([ORDER_ITEMS:25])
						FIRST RECORD:C50([ORDER_ITEMS:25])
						For ($_l_OrdersIndex; 1; $_l_RecordsInSelectionOrders)
							USE NAMED SELECTION:C332("$AllocateThese")
							GOTO SELECTED RECORD:C245([ORDER_ITEMS:25]; $_l_OrdersIndex)
							
							$_l_OrderItemRow:=Find in array:C230($_al_AutoallocateOI; [ORDER_ITEMS:25]Item_Number:27)
							If ($_l_OrderItemRow>0)
								If ([ORDER_ITEMS:25]Item_Number:27#$_al_AutoallocateOI{$_l_OrderItemRow})
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_AutoallocateOI{$_l_OrderItemRow})
								End if 
								If ([ORDER_ITEMS:25]Quantity:3#$_ar_CurrentOrderQuantities{$_l_OrderItemRow})
									
									$_l_ReAllocateItemRow:=Find in array:C230($_al_Realocate; $_l_ItemNumber)
									//put the on order stock items onto the new unallocated sales order items
									If ($_l_ReAllocateItemRow>0)
										DB_SaveRecord(->[ORDER_ITEMS:25])
										$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
										$_t_productCode:=[ORDER_ITEMS:25]Product_Code:2
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode)
										CREATE SET:C116([ORDER_ITEMS:25]; "$CurrentOrderItems2")
										DIFFERENCE:C122("$CurrentOrderItems2"; "$CurrentOrderItems"; "$CurrentOrderItems2")
										USE SET:C118("$CurrentOrderItems2")
										QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$_t_productCode)
										If ([ORDER_ITEMS:25]Quantity:3>=$_ar_ReAllocateQuantity{$_l_ReAllocateItemRow})
											$_l_NewItemNumber:=[ORDER_ITEMS:25]Item_Number:27
											READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ReAllocateTo{$_l_ReAllocateItemRow})
											[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_l_NewItemNumber
											[ORDER_ITEMS:25]Purchase_Order_Number:18:=[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20
											If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20#"")
												QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
												[ORDER_ITEMS:25]Purchase_Order_Date:19:=[PURCHASE_ORDERS:57]Purchase_Order_Date:3
											End if 
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
											[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
											DB_SaveRecord(->[ORDER_ITEMS:25])
										End if 
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_AutoallocateOI{$_l_OrdersIndex})
										//APPEND TO ARRAY($_al_Realocate;$_l_ItemNumber)
										//APPEND TO ARRAY($_al_ReAllocateTo;[STOCK ITEMS]x_ID)
										//APPEND TO ARRAY($_ar_ReAllocateQuantity;[STOCK ITEMS]Quantity)
									End if 
								End if 
								If ([ORDER_ITEMS:25]Received_Date:21=!00-00-00!)
									[ORDER_ITEMS:25]Received_Date:21:=Current date:C33(*)
								End if 
								[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
								//GOTO XY(0;0)
								//Gen_Alert ("Quantity allocated on sales order item "+String([ORDER ITEMS]Item Number)+" now="+String([ORDER ITEMS]Allocated))
								//Gen_Alert ("Order item stock allocated")
								
								DB_SaveRecord(->[ORDER_ITEMS:25])
								AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End for 
					Else 
						$_bo_ValidateTransaction:=False:C215
					End if 
					STK_bo_AutoMessages:=False:C215
				Else 
					$_bo_ValidateTransaction:=False:C215
				End if 
			End if 
			//Close DocUMENT($_ti_DocumentRef)
			
			
			
			
			
			//End for
			
			$_t_StockMovementCode:=[STOCK_MOVEMENTS:40]Movement_Code:1
			DB_SaveRecord(->[STOCK_MOVEMENTS:40])
		End if 
		//MESSAGE("Created Movement"+$_t_StockMovementCode)
		
		
		If ($_bo_ValidateTransaction)
			//MESSAGE("Created Movement"+$_t_StockMovementCode)
			
			
			
			$0:=True:C214
		Else 
			//MESSAGE("CANCELLING Movement"+$_t_StockMovementCode)
			
			
			
			$0:=False:C215
		End if 
		
		
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Pipeline Update")
		//   $_t_oldMethodName:=ERR_MethodTracker ("ProcessService_ORDERS")  ` 26/02/03 pb
		//   QUERY([ORDERS];[ORDERS]x_ID=[ProcessesToHandle]RecordNumber)
		$_l_RecordNumber:=Find in field:C653([ORDERS:24]x_ID:58; [PROCESSES_TO_HANDLE:115]RecordNumber:7)  // 26/02/03 pb
		
		//   If (Records in selection([ORDERS])=0)
		If ($_l_RecordNumber=-1)  // 26/02/03 pb
			
			[PROCESSES_TO_HANDLE:115]Comments:3:="Order record not found."
			[PROCESSES_TO_HANDLE:115]Status:2:=3
			DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
			$0:=True:C214
		Else 
			//NG March 2004-cant use goto record in a transaction
			
			QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
			//GOTO RECORD([ORDERS];$_l_RecordNumber)  ` 26/02/03 pb
			$0:=True:C214
			$_l_TableNumber:=Table:C252(->[ORDERS:24])
			$_l_Num:=0
			$_bo_Run:=False:C215
			If (<>SP_Bo_PrefsLoaded)
				If (<>CB_SP_Orders=1)
					$_bo_Run:=True:C214
				End if 
			Else 
				$_bo_Run:=True:C214
			End if 
			If ($_bo_Run)
				SP_UpdatePipeline($_l_TableNumber; [ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; [ORDERS:24]Taken_By:17; $_l_Num; [ORDERS:24]Company_Code:1; $_l_Num; [ORDERS:24]Contact_Code:2; ""; $_l_Num; [ORDERS:24]Currency_Code:32; "")
			End if 
		End if 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Create Revision")
		READ ONLY:C145([ORDERS:24])
		READ ONLY:C145([ORDER_ITEMS:25])
		
		//NG March 2004-cant use goto record in a transaction
		QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		
		ORD_OrderCreateRevision([ORDERS:24]Order_Code:3)
		UNLOAD RECORD:C212([ORDERS:24])
		UNLOAD RECORD:C212([ORDER_ITEMS:25])
		$0:=True:C214
End case 
UNLOAD RECORD:C212([ORDERS:24])
UNLOAD RECORD:C212([ORDER_ITEMS:25])

UNLOAD RECORD:C212([SALES_PROJECTION:113])
ERR_MethodTrackerReturn("ProcessService_ORDERS"; $_t_oldMethodName)
