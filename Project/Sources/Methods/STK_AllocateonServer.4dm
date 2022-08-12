//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_AllocateonServer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/10/2012 15:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AllocateSOItemNumbers; 0)
	ARRAY LONGINT:C221($_al_ReAllocate; 0)
	ARRAY LONGINT:C221($_al_ReAllocateTo; 0)
	//ARRAY LONGINT(STK_al_AutoAllocateOI;0)
	//ARRAY LONGINT(STK_al_RemoveFromItemID;0)
	ARRAY REAL:C219($_ar_ReAllocateQuantities; 0)
	//ARRAY REAL(STK_ar_AUTOALLOCATEQTY;0)
	ARRAY TEXT:C222($_at_AllocateOrderCodes; 0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	C_BOOLEAN:C305($_bo_NewRecord; $_bo_OK; $_bo_ValidateTransaction; STK_bo_AUTOMESSAGES)
	C_LONGINT:C283($_l_AllocatebyOrderIndex; $_l_AllocationIndex; $_l_Delay; $_l_ItemNumber; $_l_ItemNumberRow; $_l_NewItemNumber; $_l_OrderItemNumber; $_l_Process; $_l_ReAllocateRow; $_l_Repeats; $_l_Retries)
	C_LONGINT:C283(STK_l_AllocationStatus)
	C_REAL:C285($_r_CurrentOrderQuantiy; $_r_QuantityReceived; $_r_Remaining; $_r_ToAllocate)
	C_TEXT:C284($_t_AllocateResult; $_t_CurrentOrderCode; $_t_Machine; $_t_oldMethodName; $_t_OrderCode; $_t_ProcessName; $_t_productCode; $_t_user; vStPrev)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_AllocateonServer")
STK_l_AllocationStatus:=0

ARRAY LONGINT:C221(STK_al_AutoAllocateOI; 0)
ARRAY LONGINT:C221(STK_al_RemoveFromItemID; 0)
ARRAY REAL:C219(STK_ar_AUTOALLOCATEQTY; 0)

Start_Process
STK_l_AllocationStatus:=1
Repeat 
	DelayTicks(10)
Until (STK_l_AllocationStatus=3)


ARRAY LONGINT:C221($_al_ReAllocate; 0)
ARRAY LONGINT:C221($_al_ReAllocateTo; 0)
ARRAY REAL:C219($_ar_ReAllocateQuantities; 0)

//Gen_Alert ("The process creating an ISO has now completed system is going to make sure stock is unallocated from the po movement item(s)")
If (Size of array:C274(STK_al_AutoAllocateOI)>0)
	QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; STK_al_AutoAllocateOI)
	SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_AllocateSOItemNumbers; [ORDER_ITEMS:25]Order_Code:1; $_at_AllocateOrderCodes)
	
	DISTINCT VALUES:C339([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
	For ($_l_AllocatebyOrderIndex; 1; Size of array:C274($_at_OrderCodes))
		
		$_t_CurrentOrderCode:=$_at_OrderCodes{$_l_AllocatebyOrderIndex}
		$_bo_NewRecord:=True:C214
		For ($_l_AllocationIndex; 1; Size of array:C274(STK_al_AutoAllocateOI))
			//START TRANSACTION
			StartTransaction
			$_bo_ValidateTransaction:=False:C215
			$_l_ItemNumberRow:=Find in array:C230($_al_AllocateSOItemNumbers; STK_al_AutoAllocateOI{$_l_AllocationIndex})
			If ($_at_AllocateOrderCodes{$_l_ItemNumberRow}=$_t_CurrentOrderCode)
				//BRING TO FRONT(Current process)
				If (STK_al_RemoveFromItemID{$_l_AllocationIndex}>0)
					//GOTO XY(0;0)
					//Gen_Alert ("Check Pre-allocation is removed")
					READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
					//trace(NG This does not look correct to me)--actually it is-its just checking the items exist-at this point they do(transaction is completed)
					//it is only checking the quantity received
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=STK_al_RemoveFromItemID{$_l_AllocationIndex})
					$_r_QuantityReceived:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					If ($_r_QuantityReceived>0)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_al_RemoveFromItemID{$_l_AllocationIndex})
						$_l_Repeats:=0
						$_l_Delay:=2
						Repeat 
							$_l_Repeats:=$_l_Repeats+1
							$_bo_OK:=Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1)
							If (Not:C34($_bo_OK))
								If ($_l_Repeats>10)
									LOCKED BY:C353([STOCK_MOVEMENT_ITEMS:27]; $_l_Process; $_t_user; $_t_Machine; $_t_ProcessName)
									DelayTicks(30*60)
									$_l_Repeats:=1
								End if 
								//GOTO XY(0;0)
								//MESSAGE("Waitng for PO stock movement item")
								If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
									//only increase every 10 tries
									$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
								End if 
								DelayTicks(2*$_l_Delay)
							End if 
						Until ($_bo_OK=True:C214)
						$_l_OrderItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
						If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<=$_r_QuantityReceived)
							[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
							[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
							[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
						Else 
							
							$_r_Remaining:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_QuantityReceived
							$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
							$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							
							[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_QuantityReceived
							[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
							//TRACE
							[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
							[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
							[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
							[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
							[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
							STK_ItemDuplicate
							[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Remaining
							[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
							[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
							//TRACE
							[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
							[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=$_t_OrderCode
							[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
							
							APPEND TO ARRAY:C911($_al_ReAllocate; $_l_ItemNumber)
							APPEND TO ARRAY:C911($_al_ReAllocateTo; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							APPEND TO ARRAY:C911($_ar_ReAllocateQuantities; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
							
							[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
							[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
						End if 
						
					End if 
				End if 
				READ WRITE:C146([ORDER_ITEMS:25])
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_al_AutoAllocateOI{$_l_AllocationIndex})
				If (Records in selection:C76([ORDER_ITEMS:25])=1)
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
					$_l_Delay:=1
					$_l_Repeats:=0
					$_l_Delay:=2
					Repeat 
						BRING TO FRONT:C326(Current process:C322)
						$_l_Repeats:=$_l_Repeats+1
						$_bo_OK:=Check_Locked(->[ORDER_ITEMS:25]; 1)
						If (Not:C34($_bo_OK))
							If ($_l_Repeats>10)
								LOCKED BY:C353([ORDER_ITEMS:25]; $_l_Process; $_t_user; $_t_Machine; $_t_ProcessName)
								DelayTicks(30*60)
								
								$_l_Repeats:=1
							End if 
							//GOTO XY(0;0)
							//MESSAGE("Waiting for stock item to be unlocked")
							If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
								//only increase every 10 tries
								$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
							End if 
							DelayTicks(2*$_l_Delay)
						End if 
					Until ($_bo_OK=True:C214)
					
					[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
					
					SAVE RECORD:C53([ORDER_ITEMS:25])
					//LOAD RECORD([ORDER ITEMS])
					
					
					$_r_ToAllocate:=[ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28
					If ($_r_ToAllocate>STK_ar_AUTOALLOCATEQTY{$_l_AllocationIndex})
						$_r_ToAllocate:=STK_ar_AUTOALLOCATEQTY{$_l_AllocationIndex}
					End if 
					vStPrev:=""
					If (Gen_PPChkStSing(->[ORDERS:24]State:15; 4; False:C215))
						If ([ORDER_ITEMS:25]Item_Number:27#STK_al_AutoAllocateOI{$_l_AllocationIndex})
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_al_AutoAllocateOI{$_l_AllocationIndex})
						End if 
						$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode)
						CREATE SET:C116([ORDER_ITEMS:25]; "$CurrentOrderItems")
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_al_AutoAllocateOI{$_l_AllocationIndex})
						STK_bo_AUTOMESSAGES:=False:C215
						
						If (OrderI_AllocAu1)
							If ([ORDER_ITEMS:25]Item_Number:27#STK_al_AutoAllocateOI{$_l_AllocationIndex})
								QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_al_AutoAllocateOI{$_l_AllocationIndex})
							End if 
							$_r_CurrentOrderQuantiy:=[ORDER_ITEMS:25]Quantity:3
							$_t_AllocateResult:=OrderI_AllocAu2(STK_al_AutoAllocateOI{$_l_AllocationIndex})
							If ([ORDER_ITEMS:25]Item_Number:27#STK_al_AutoAllocateOI{$_l_AllocationIndex})
								QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_al_AutoAllocateOI{$_l_AllocationIndex})
							End if 
							If ([ORDER_ITEMS:25]Quantity:3#$_r_CurrentOrderQuantiy)
								$_l_ReAllocateRow:=Find in array:C230($_al_ReAllocate; $_l_ItemNumber)
								//put the on order stock items onto the new unallocated sales order items
								If ($_l_ReAllocateRow>0)
									DB_SaveRecord(->[ORDER_ITEMS:25])
									$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
									$_t_productCode:=[ORDER_ITEMS:25]Product_Code:2
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode)
									CREATE SET:C116([ORDER_ITEMS:25]; "$CurrentOrderItems2")
									DIFFERENCE:C122("$CurrentOrderItems2"; "$CurrentOrderItems"; "$CurrentOrderItems2")
									USE SET:C118("$CurrentOrderItems2")
									QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$_t_productCode)
									If ([ORDER_ITEMS:25]Quantity:3>=$_ar_ReAllocateQuantities{$_l_ReAllocateRow})
										$_l_NewItemNumber:=[ORDER_ITEMS:25]Item_Number:27
										READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ReAllocateTo{$_l_ReAllocateRow})
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
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_al_AutoAllocateOI{$_l_AllocationIndex})
									//APPEND TO ARRAY($_al_ReAllocate;$_l_ItemNumber)
									//APPEND TO ARRAY($_al_ReAllocateTo;[STOCK ITEMS]x_ID)
									//APPEND TO ARRAY($_ar_ReAllocateQuantities;[STOCK ITEMS]Quantity)
								End if 
							End if 
							If ([ORDER_ITEMS:25]Required_Date:10=!00-00-00!)
								[ORDER_ITEMS:25]Received_Date:21:=Current date:C33(*)
							End if 
							[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
							//GOTO XY(0;0)
							//Gen_Alert ("Quantity allocated on sales order item "+String([ORDER ITEMS]Item Number)+" now="+String([ORDER ITEMS]Allocated))
							//Gen_Alert ("Order item stock allocated")
							$_bo_ValidateTransaction:=True:C214
							DB_SaveRecord(->[ORDER_ITEMS:25])
							AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
							
						End if 
						STK_bo_AUTOMESSAGES:=False:C215
					Else 
						//Gen_Alert ("Order item state does not allow allocation!")
						
					End if 
				End if 
			End if 
			If ($_bo_ValidateTransaction)
				//VALIDATE TRANSACTION
				Transact_End(True:C214)
			Else 
				//CANCEL TRANSACTION
				Transact_End(False:C215)
			End if 
		End for 
	End for 
	
Else 
	//Gen_Alert ("There are no -reallocations to do!")
	
End if 
STK_l_AllocationStatus:=4
$_l_Retries:=0
Repeat 
	DelayTicks(10)
	$_l_Retries:=$_l_Retries+1
Until (STK_l_AllocationStatus=0) | ($_l_Retries>100)
ERR_MethodTrackerReturn("STK_AllocateonServer"; $_t_oldMethodName)
