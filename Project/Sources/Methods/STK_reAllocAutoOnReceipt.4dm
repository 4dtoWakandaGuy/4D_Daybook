//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_reAllocAutoOnReceipt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/01/2012 10:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ReAllocateItem; 0)
	ARRAY LONGINT:C221($_al_ReAllocatetoMovementItemID; 0)
	//ARRAY LONGINT(STK_AL_AUTOALLOCATEOI;0)
	//ARRAY LONGINT(STK_al_RemoveFromItemID;0)
	ARRAY REAL:C219($_ar_ReAllocateQuantity; 0)
	//ARRAY REAL(STK_ar_AUTOALLOCATEQTY;0)
	ARRAY TEXT:C222($_at_PurchaseMovementTypes; 0)
	C_BOOLEAN:C305(<>HoldQuit; $_bo_Exit; $_bo_OK; $_bo_ProcessVisible; $_bo_Validate; STK_bo_AllocatedFromPO; STK_bo_DoooAllocate; STK_bAllocateReady)
	C_LONGINT:C283(<>STK_l_ValidateCalledOff; $_l_AllocateIndex; $_l_AllocateOnServerProcessID; $_l_CallBackProcess; $_l_Delay; $_l_Index; $_l_MovementItemNumber; $_l_NotPOMOvementItemID; $_l_ProcessState; $_l_ProcessTime; $_l_RecordsInSelection)
	C_LONGINT:C283($_l_Retries; $_l_UniqueProcessID; $_l_UniqueProcessID2; $1; $_l_addID; STK_l_addID; STK_l_OrderItemNumber; STK_l_ReallocateReady)
	C_REAL:C285($_r_QtytoAllocateFromPO; $_r_QuantityReceived; $_r_RemainingStock; $_r_SumAllocated; $_r_ToAllocate; $_r_toKeepFree; STK_R_QuantityRequired)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderCode; $_t_processName; $_t_processName2; vStPrev)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_reAllocAutoOnReceipt")

//this method is called when an PO movement is cancelled and some of the items are allocated to sales orders.
//this will try to auto allocate the quantity from another purchase order order and of course will take the allocation off the now cannels PO
//this is somewhat similare to the auto allocate process except the here we are doing something that current has no auto process and if it cant allocate then it needs to tell the user

If (Count parameters:C259>=1)
	
	$_l_CallBackProcess:=$1
	PROCESS PROPERTIES:C336($_l_CallBackProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
	ARRAY LONGINT:C221(STK_AL_AUTOALLOCATEOI; 0)
	ARRAY REAL:C219(STK_ar_AUTOALLOCATEQTY; 0)
	ARRAY LONGINT:C221(STK_al_RemoveFromItemID; 0)
	
	STK_bAllocateReady:=True:C214
	DelayTicks(60*30)
	
	If ($_l_CallBackProcess>0)
		$_bo_Exit:=False:C215
		While (Process state:C330($_l_CallBackProcess)>=0) & (Not:C34($_bo_Exit))
			PROCESS PROPERTIES:C336($_l_CallBackProcess; $_t_processName2; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID2)
			If ($_l_UniqueProcessID2#$_l_UniqueProcessID) | ($_t_processName#$_t_processName2)
				$_bo_Exit:=True:C214
			Else 
				DelayTicks(60)
			End if 
		End while 
	End if 
	While (<>HoldQuit)
		DelayTicks(10)
	End while 
	<>HoldQuit:=True:C214
	If (Application type:C494=4D Remote mode:K5:5)
		$_l_AllocateOnServerProcessID:=Execute on server:C373("STK_ReallocateOnServer"; 256000; "Reallocate Order items")
		STK_l_ReallocateReady:=0
		Repeat 
			GET PROCESS VARIABLE:C371($_l_AllocateOnServerProcessID; STK_l_ReallocateReady; STK_l_ReallocateReady)
			If (STK_l_ReallocateReady=0)
				DelayTicks(10)
			End if 
		Until (STK_l_ReallocateReady>0)
		
		VARIABLE TO VARIABLE:C635($_l_AllocateOnServerProcessID; STK_AL_AUTOALLOCATEOI; STK_AL_AUTOALLOCATEOI)
		VARIABLE TO VARIABLE:C635($_l_AllocateOnServerProcessID; STK_AL_AUTOALLOCATEOI; STK_al_RemoveFromItemID)
	Else 
		Start_Process
		ARRAY LONGINT:C221($_al_ReAllocateItem; 0)
		ARRAY LONGINT:C221($_al_ReAllocatetoMovementItemID; 0)
		ARRAY REAL:C219($_ar_ReAllocateQuantity; 0)
		//ProcessServices_CreateRecord (*->[ORDER ITEMS];->STK_AL_AUTOALLOCATEOI{$_l_Index};"ReAllocate";STK_al_RemoveFromItemID{$_l_Index}
		
		For ($_l_Index; 1; Size of array:C274(STK_AL_AUTOALLOCATEOI))
			If (STK_al_RemoveFromItemID{$_l_Index}>0)
				//START TRANSACTION
				StartTransaction
				$_bo_Validate:=False:C215
				//GOTO XY(0;0)
				//MESSAGE("Removing Pre-allocation")
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=STK_al_RemoveFromItemID{$_l_Index})
				$_r_QuantityReceived:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				If ($_r_QuantityReceived>0)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_al_RemoveFromItemID{$_l_Index})
					$_l_NotPOMOvementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
					$_r_QtytoAllocateFromPO:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					$_l_Retries:=0
					$_l_Delay:=2
					Repeat 
						$_l_Retries:=$_l_Retries+1
						$_bo_OK:=Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1)
						If (Not:C34($_bo_OK))
							If (($_l_Retries/10)=(Int:C8($_l_Retries/10)))
								//only increase every 10 tries
								$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
							End if 
							DelayTicks(2*$_l_Delay)
						End if 
					Until ($_bo_OK=True:C214)
					
					
					If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<=$_r_QuantityReceived)
						
						[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
						[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
						[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					Else 
						$_r_RemainingStock:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_QuantityReceived
						$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
						$_l_MovementItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
						
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_QuantityReceived
						[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
						
						[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
						[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
						[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
						[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
						[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
						STK_ItemDuplicate
						[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=$_t_OrderCode
						APPEND TO ARRAY:C911($_al_ReAllocateItem; $_l_MovementItemNumber)
						APPEND TO ARRAY:C911($_al_ReAllocatetoMovementItemID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						APPEND TO ARRAY:C911($_ar_ReAllocateQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
						
						STK_SetCreatedStockItem(0; $_r_RemainingStock; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; 0; $_l_MovementItemNumber)
						
						
					End if 
				End if 
			End if 
			READ WRITE:C146([ORDER_ITEMS:25])
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_AL_AUTOALLOCATEOI{$_l_Index})
			If (Records in selection:C76([ORDER_ITEMS:25])=1)
				//GOTO XY(0;0)
				//MESSAGE("Allocating Stock to sales order item")
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
				$_l_Delay:=1
				$_l_Retries:=0
				$_l_Delay:=2
				Repeat 
					$_l_Retries:=$_l_Retries+1
					$_bo_OK:=Check_Locked(->[ORDER_ITEMS:25]; 1)
					If (Not:C34($_bo_OK))
						GOTO XY:C161(0; 0)
						//MESSAGE("Waiting for order item to be unlocked")
						If (($_l_Retries/10)=(Int:C8($_l_Retries/10)))
							//only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(2*$_l_Delay)
					End if 
				Until ($_bo_OK=True:C214)
				//we just need to work our how many need allocation
				[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
				$_r_ToAllocate:=[ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28
				If ($_r_ToAllocate>STK_ar_AUTOALLOCATEQTY{$_l_Index})
					$_r_ToAllocate:=STK_ar_AUTOALLOCATEQTY{$_l_Index}
				End if 
				vStPrev:=""
				
				//If (Gen_PPChkStSing (->[ORDERS]State;4))
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PurchaseMovementTypes)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_PurchaseMovementTypes)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)  // not already allocated to order items
				
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16#$_l_NotPOMOvementItemID)
				$_r_SumAllocated:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				If ($_r_SumAllocated>=$_r_ToAllocate)
					If ($_r_SumAllocated>0)
						If ($_r_SumAllocated>$_r_ToAllocate)
							$_r_SumAllocated:=$_r_ToAllocate
						End if 
						$_l_RecordsInSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
						COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$temp")
						
						For ($_l_AllocateIndex; 1; $_l_RecordsInSelection)
							If ($_r_ToAllocate>0)
								USE NAMED SELECTION:C332("$temp")
								GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_AllocateIndex)
								
								$_r_toKeepFree:=0
								If ($_r_SumAllocated>0)
									If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>$_r_SumAllocated)
										$_r_toKeepFree:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_SumAllocated
										
										
									End if 
									If ($_r_toKeepFree>0)
										STK_ItemDuplicate
										STK_SetCreatedStockItem(0; $_r_SumAllocated; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; 0; STK_l_OrderItemNumber)
										$_r_ToAllocate:=$_r_ToAllocate-$_r_SumAllocated
										$_r_SumAllocated:=$_r_SumAllocated-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										If (False:C215)
											If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
												If (<>STK_l_ValidateCalledOff=0)
													//TRACE
													<>STK_l_ValidateCalledOff:=New process:C317("STK_ManageCalledOff"; 512000; "Validate Called off manager"; Current process:C322; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; *)
													
												Else 
													STK_l_addID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
													$_l_addID:=STK_l_addID
													While (Semaphore:C143("STKbVCM"))
														DelayTicks(2)
													End while 
													//`Repeat
													$_l_Retries:=0
													STK_l_addID:=$_l_addID
													SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_addCallingProcess; Current process:C322)
													SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_addID; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
													SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_Resume; Current process:C322)
													RESUME PROCESS:C320(<>STK_l_ValidateCalledOff)
													If (False:C215)
														Repeat 
															GET PROCESS VARIABLE:C371(<>STK_l_ValidateCalledOff; STK_l_addID; STK_l_addID)
															If (STK_l_addID>0)
																$_l_Retries:=$_l_Retries+1
																DelayTicks(60)
															End if 
														Until (STK_l_addID=0) | ($_l_Retries>2)
													End if 
													$_l_Retries:=0
													//Until (STK_l_addID=0)
													CLEAR SEMAPHORE:C144("STKbVCM")
													
												End if 
												
												//$_l_Process:=New Process("STK_ValidateCalledafterProcess";128000;"Validate Called off"+String([STOCK ITEMS]x_ID);Current process;[STOCK ITEMS]x_ID;*)
											End if 
										End if 
										USE NAMED SELECTION:C332("$temp")
										GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_AllocateIndex)
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_toKeepFree
										//TRACE
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										If (False:C215)
											
											If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
												If (<>STK_l_ValidateCalledOff=0)
													//TRACE
													<>STK_l_ValidateCalledOff:=New process:C317("STK_ManageCalledOff"; 512000; "Validate Called off manager"; Current process:C322; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
												Else 
													STK_l_addID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
													$_l_addID:=STK_l_addID
													While (Semaphore:C143("STKbVCM"))
														DelayTicks(2)
													End while 
													//Repeat
													$_l_Retries:=0
													STK_l_addID:=$_l_addID
													SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_addCallingProcess; Current process:C322)
													SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_addID; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
													SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_Resume; Current process:C322)
													RESUME PROCESS:C320(<>STK_l_ValidateCalledOff)
													If (False:C215)
														Repeat 
															GET PROCESS VARIABLE:C371(<>STK_l_ValidateCalledOff; STK_l_addID; STK_l_addID)
															If (STK_l_addID>0)
																$_l_Retries:=$_l_Retries+1
																DelayTicks(60)
															End if 
														Until (STK_l_addID=0) | ($_l_Retries>2)
													End if 
													$_l_Retries:=0
													//Until (STK_l_addID=0)
													
													CLEAR SEMAPHORE:C144("STKbVCM")
													
												End if 
												
												//$_l_Process:=New Process("STK_ValidateCalledafterProcess";128000;"Validate Called off"+String([STOCK ITEMS]x_ID);Current process;[STOCK ITEMS]x_ID;*)
											End if 
										End if 
									End if 
									STK_bo_AllocatedFromPO:=True:C214
								Else 
									
									[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=STK_l_OrderItemNumber
									[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=STK_l_OrderItemNumber
									$_r_ToAllocate:=$_r_ToAllocate-$_r_SumAllocated
									$_r_SumAllocated:=$_r_SumAllocated-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									STK_bo_AllocatedFromPO:=True:C214
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									If (False:C215)
										If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
											If (<>STK_l_ValidateCalledOff=0)
												//TRACE
												<>STK_l_ValidateCalledOff:=New process:C317("STK_ManageCalledOff"; 512000; "Validate Called off manager"; Current process:C322; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
											Else 
												STK_l_addID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
												$_l_addID:=STK_l_addID
												While (Semaphore:C143("STKbVCM"))
													DelayTicks(2)
												End while 
												//Repeat
												$_l_Retries:=0
												STK_l_addID:=$_l_addID
												SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_addCallingProcess; Current process:C322)
												SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_addID; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
												SET PROCESS VARIABLE:C370(<>STK_l_ValidateCalledOff; STK_l_Resume; Current process:C322)
												RESUME PROCESS:C320(<>STK_l_ValidateCalledOff)
												If (False:C215)
													Repeat 
														GET PROCESS VARIABLE:C371(<>STK_l_ValidateCalledOff; STK_l_addID; STK_l_addID)
														If (STK_l_addID>0)
															$_l_Retries:=$_l_Retries+1
															DelayTicks(60)
														End if 
													Until (STK_l_addID=0) | ($_l_Retries>2)
												End if 
												$_l_Retries:=0
												//Until (STK_l_addID=0)
												CLEAR SEMAPHORE:C144("STKbVCM")
												
											End if 
											
											//$_l_Process:=New Process("STK_ValidateCalledafterProcess";128000;"Validate Called off"+String([STOCK ITEMS]x_ID);Current process;[STOCK ITEMS]x_ID;*)
											
										End if 
									End if 
								End if 
							End if 
						End for 
						If (STK_R_QuantityRequired=0)
							
							STK_bo_DoooAllocate:=True:C214
						End if 
						
					End if 
					[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
					[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
					OrderI_AllOIUp
					DB_SaveRecord(->[ORDER_ITEMS:25])
					
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					
					
					
					$_bo_Validate:=True:C214
					//End if
				Else 
					
					//Gen_Alert ("Warning: Realocation of On Order stock for "+[ORDER ITEMS]Product Code+" on order "+[ORDER ITEMS]Order Code+" has not been possible please review the allocation on this sales order")
					
				End if 
			End if 
			If ($_bo_Validate)
				//VALIDATE TRANSACTION
				Transact_End(True:C214)
			Else 
				//CANCEL TRANSACTION
				Transact_End(False:C215)
			End if 
			
			
		End for 
	End if 
	<>HoldQuit:=False:C215
	
	
End if 
ERR_MethodTrackerReturn("STK_reAllocAutoOnReceipt"; $_t_oldMethodName)