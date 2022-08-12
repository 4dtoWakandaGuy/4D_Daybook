//%attributes = {}

If (False:C215)
	//Project Method Name:      STK_AllocAutoOnReceipt
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
	//C_UNKNOWN(<>HoldQuit)
	ARRAY LONGINT:C221($_al_AllocateItemNumbers; 0)
	ARRAY LONGINT:C221($_al_ReAllocateItemNumber; 0)
	ARRAY LONGINT:C221($_al_ReAllocateTo; 0)
	ARRAY LONGINT:C221($_AL_AUTOALLOCATEOI; 0)
	ARRAY LONGINT:C221($_al_RemoveFromItemID; 0)
	//ARRAY LONGINT(STK_AL_AUTOALLOCATEOI;0)
	//ARRAY LONGINT(STK_al_RemoveFromItemID;0)
	ARRAY REAL:C219($_ar_ReAllocateQuantity; 0)
	ARRAY REAL:C219($_ar_AUTOALLOCATEQTY; 0)
	//ARRAY REAL(STK_ar_AUTOALLOCATEQTY;0)
	ARRAY TEXT:C222($_at_AllocateOrderCodes; 0)
	ARRAY TEXT:C222($_at_HandledOrderNumbers; 0)
	ARRAY TEXT:C222($_at_OrderCodeRange; 0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	ARRAY TEXT:C222($_at_StockMovementCodes; 0)
	C_BLOB:C604($_blb_AllocateList)
	C_BOOLEAN:C305($_bo_Exit; $_bo_NewRecord; $_bo_OK; $_bo_ProcessVisible; $_bo_ScriptExists; PS_bo_Showmessages; STK_bAllocateReady; STK_bo_AUTOmessageS)
	C_LONGINT:C283($_l_AllocateByOrderIndex; $_l_AllocationItemRow; $_l_AlreadyHandledRow; $_l_AutoAllocationRow; $_l_CallBackProcess; $_l_CopiedFromID; $_l_Delay; $_l_Holding; $_l_Index; $_l_ItemNumber; $_l_NewItemNumber)
	C_LONGINT:C283($_l_OrderCodeRangeIndex; $_l_OrderItemNumber; $_l_Process; $_l_ProcessState; $_l_ProcessTime; $_l_ReAllocateRow; $_l_Retries; $_l_StockItemNumber; $_l_TimeTaken; $_l_UniqueProcessID; $_l_UniqueProcessID2)
	C_REAL:C285($_r_CurrentOrderQuantity; $_r_QuantityReceived; $_r_Remaining; $_r_ToAllocate; $1)
	C_TEXT:C284($_t_AllocateResult; $_t_CurrentOrderCode; $_t_Machine; $_t_oldMethodName; $_t_OrderCode; $_t_OrderNumbers; $_t_processName; $_t_processName2; $_t_productCode; $_t_StockMovementCodes; $_t_user)
	C_TEXT:C284(STK_t_isoMovementCode; vStPrev)
	C_TIME:C306($_ti_Time; $_ti_Time2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_AllocAutoOnReceipt")

//testthis
//TRACE
$_t_oldMethodName:=ERR_MethodTracker("STK_AllocAutoOnReceipt")
//Open window(20;Screen height-100;200;Screen height;-Palette window)
//GOTO XY(0;0)
//MESSAGE("1")
//GOTO XY(0;0)
//MESSAGE("2")
//GOTO XY(0;0)
//MESSAGE("3")
If (Count parameters:C259>=1)
	//GOTO XY(0;0)
	//MESSAGE("4")
	$_l_CallBackProcess:=$1
	//GOTO XY(0;0)
	//MESSAGE("5")
	PROCESS PROPERTIES:C336($_l_CallBackProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
	//GOTO XY(0;0)
	//MESSAGE("6")
	ARRAY LONGINT:C221(STK_AL_AUTOALLOCATEOI; 0)
	//GOTO XY(0;0)
	//MESSAGE("7")
	ARRAY REAL:C219(STK_ar_AUTOALLOCATEQTY; 0)
	//GOTO XY(0;0)
	//MESSAGE("8")
	ARRAY LONGINT:C221(STK_al_RemoveFromItemID; 0)
	//GOTO XY(0;0)
	//MESSAGE("9")
	STK_bAllocateReady:=True:C214
	//GOTO XY(0;0)
	//MESSAGE("10")
	DelayTicks(60*30)
	//GOTO XY(0;0)
	//MESSAGE("11")
	$_l_Retries:=0
	$_l_Holding:=0
	While (<>HoldQuit)
		DelayTicks(2)
		//GOTO XY(0;0)
		//MESSAGE("12-"+String($_l_Holding))
		$_l_Holding:=$_l_Holding+1
	End while 
	<>HoldQuit:=True:C214
	//GOTO XY(0;0)
	//MESSAGE("13")
	// ////MESSAGE("Flag is on =should not be able to quit")
	If ($_l_CallBackProcess>0)
		//GOTO XY(0;0)
		//MESSAGE("13")
		$_bo_Exit:=False:C215
		//GOTO XY(0;0)
		//MESSAGE("14")
		$_l_Holding:=0
		//$_ti_DocumentRef:=Create document("";"TEXT")
		$_ti_Time:=Current time:C178
		While (Process state:C330($_l_CallBackProcess)>=0) & (Not:C34($_bo_Exit))
			//GOTO XY(0;0)
			//MESSAGE("15-"+String($_l_Holding))
			PROCESS PROPERTIES:C336($_l_CallBackProcess; $_t_processName2; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID2)
			//GOTO XY(0;0)
			//MESSAGE("16-"+String($_l_Holding))
			If ($_l_UniqueProcessID2#$_l_UniqueProcessID) | ($_t_processName#$_t_processName2)
				//GOTO XY(0;0)
				//MESSAGE("17-"+String($_l_Holding))
				$_bo_Exit:=True:C214
			Else 
				DelayTicks(2*Size of array:C274(STK_AL_AUTOALLOCATEOI))
				//GOTO XY(0;0)
				//MESSAGE("18-"+String($_l_Holding))
			End if 
			//GOTO XY(0;0)
			//MESSAGE("19-"+String($_l_Holding))
			$_l_Holding:=$_l_Holding+1
		End while 
		//GOTO XY(0;0)
		//MESSAGE("20")
		$_ti_Time2:=Current time:C178
		$_l_TimeTaken:=$_ti_Time2-$_ti_Time
		//SEND PACKET($_ti_DocumentRef;"Waiting for ISO to be saved took "+String($_l_TimeTaken)+Char(13))
		$_ti_Time:=Current time:C178
	End if 
	//GOTO XY(0;0)
	//MESSAGE("21")
	Start_Process
	//GOTO XY(0;0)
	//MESSAGE("22")
	ARRAY LONGINT:C221($_al_ReAllocateItemNumber; 0)
	//GOTO XY(0;0)
	//MESSAGE("23")
	ARRAY LONGINT:C221($_al_ReAllocateTo; 0)
	//GOTO XY(0;0)
	//MESSAGE("24")
	ARRAY REAL:C219($_ar_ReAllocateQuantity; 0)
	//GOTO XY(0;0)
	//MESSAGE("25")
	//Gen_Alert ("The process creating an ISO has now completed system is going to make sure stock is unallocated from the po movement item(s)")
	If (Size of array:C274(STK_AL_AUTOALLOCATEOI)>0)
		//GOTO XY(0;0)
		//MESSAGE("26")
		If (True:C214)
			//SET DATABASE PARAMETER(34;4)
			//TRACE
			//GOTO XY(0;0)
			//MESSAGE("27")
			//New Code June 2013
			READ ONLY:C145([ORDER_ITEMS:25])
			//GOTO XY(0;0)
			//MESSAGE("28")
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			//SEND PACKET($_ti_DocumentRef;"Waiting Till First Query starts "+String($_l_TimeTaken)+Char(13))
			$_ti_Time:=Current time:C178
			QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; STK_AL_AUTOALLOCATEOI)
			//GOTO XY(0;0)
			//MESSAGE("29")
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			//SEND PACKET($_ti_DocumentRef;"First Query took "+String($_l_TimeTaken)+Char(13))
			$_ti_Time:=Current time:C178
			SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_AllocateItemNumbers; [ORDER_ITEMS:25]Order_Code:1; $_at_AllocateOrderCodes)
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			//SEND PACKET($_ti_DocumentRef;"Selection To array Took "+String($_l_TimeTaken)+Char(13))
			$_ti_Time:=Current time:C178
			//GOTO XY(0;0)
			QUERY WITH ARRAY:C644([ORDERS:24]Order_Code:3; $_at_AllocateOrderCodes)
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			//SEND PACKET($_ti_DocumentRef;"Second Query took "+String($_l_TimeTaken)+Char(13))
			$_ti_Time:=Current time:C178
			SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; $_at_OrderCodeRange)
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			//SEND PACKET($_ti_DocumentRef;"Second selection to array took "+String($_l_TimeTaken)+Char(13))
			$_ti_Time:=Current time:C178
			//MESSAGE("30")
			ARRAY TEXT:C222($_at_HandledOrderNumbers; 0)
			//GOTO XY(0;0)
			//MESSAGE("31")
			QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]ServiceType:6="AutoAllocate")
			//GOTO XY(0;0)
			//MESSAGE("32")
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			//SEND PACKET($_ti_DocumentRef;"3rd Query took "+String($_l_TimeTaken)+Char(13))
			$_ti_Time:=Current time:C178
			CREATE SET:C116([PROCESSES_TO_HANDLE:115]; "$NotThisISO")
			//GOTO XY(0;0)
			//MESSAGE("33")
			$_t_OrderNumbers:=""
			//GOTO XY(0;0)
			//MESSAGE("34")
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			//SEND PACKET($_ti_DocumentRef;"Time to start of loop"+String($_l_TimeTaken)+Char(13))
			$_ti_Time:=Current time:C178
			For ($_l_OrderCodeRangeIndex; 1; Size of array:C274($_at_OrderCodeRange))
				//SEND PACKET($_ti_DocumentRef;"Loop ID($_l_OrderCodeRangeIndex)"+String($_l_OrderCodeRangeIndex)+Char(13))
				For ($_l_Index; 1; Size of array:C274(STK_AL_AUTOALLOCATEOI))
					//GOTO XY(0;0)
					//MESSAGE("35"+String($_l_Index))
					//SEND PACKET($_ti_DocumentRef;"Loop ID($_l_OrderCodeRangeIndex)"+String($_l_Index)+Char(13))
					$_l_OrderItemNumber:=STK_AL_AUTOALLOCATEOI{$_l_Index}
					//GOTO XY(0;0)
					//MESSAGE("36"+String($_l_Index))
					$_l_AllocationItemRow:=Find in array:C230($_al_AllocateItemNumbers; $_l_OrderItemNumber)
					//GOTO XY(0;0)
					//MESSAGE("37"+String($_l_Index))
					If ($_l_AllocationItemRow>0)
						//GOTO XY(0;0)
						//MESSAGE("38"+String($_l_Index))
						$_t_OrderCode:=$_at_AllocateOrderCodes{$_l_AllocationItemRow}
						//GOTO XY(0;0)
						//MESSAGE("39"+String($_l_Index))
						If ($_t_OrderNumbers="")
							//GOTO XY(0;0)
							//MESSAGE("40"+String($_l_Index))
							$_t_OrderNumbers:=$_t_OrderCode
							//GOTO XY(0;0)
							//MESSAGE("41"+String($_l_Index))
						Else 
							//GOTO XY(0;0)
							//MESSAGE("40-a"+String($_l_Index))
							If (Position:C15($_t_OrderCode; $_t_OrderNumbers)=0)
								$_t_OrderNumbers:=$_t_OrderNumbers+", "+$_t_OrderCode
							End if 
							//GOTO XY(0;0)
							//MESSAGE("41-a"+String($_l_Index))
						End if 
						//GOTO XY(0;0)
						//MESSAGE("42"+String($_l_Index))
						$_l_AlreadyHandledRow:=Find in array:C230($_at_HandledOrderNumbers; $_t_OrderCode)
						//GOTO XY(0;0)
						//MESSAGE("26"+String($_l_Index))
						If ($_l_AlreadyHandledRow<0)  //Only deal  with each order once
							//GOTO XY(0;0)
							//MESSAGE("27"+String($_l_Index))
							ARRAY LONGINT:C221($_AL_AUTOALLOCATEOI; 0)
							//GOTO XY(0;0)
							//MESSAGE("28"+String($_l_Index))
							ARRAY REAL:C219($_ar_AUTOALLOCATEQTY; 0)
							//GOTO XY(0;0)
							//MESSAGE("29"+String($_l_Index))
							ARRAY LONGINT:C221($_al_RemoveFromItemID; 0)
							//GOTO XY(0;0)
							//MESSAGE("30"+String($_l_Index))
							APPEND TO ARRAY:C911($_at_HandledOrderNumbers; $_t_OrderCode)
							//GOTO XY(0;0)
							//MESSAGE("31"+String($_l_Index))
							$_ti_Time2:=Current time:C178
							$_l_TimeTaken:=$_ti_Time2-$_ti_Time
							//SEND PACKET($_ti_DocumentRef;"Time to start of look 3 for "+String($_l_OrderCodeRangeIndex)+" "+String($_l_Index)+":"+String($_l_TimeTaken)+Char(13))
							$_ti_Time:=Current time:C178
							For ($_l_AllocateByOrderIndex; 1; Size of array:C274($_at_AllocateOrderCodes))
								//GOTO XY(0;0)
								//MESSAGE("32-"+String($_l_Index)+"-"+String($_l_AllocateByOrderIndex))
								If ($_at_AllocateOrderCodes{$_l_AllocateByOrderIndex}=$_t_OrderCode)
									//GOTO XY(0;0)
									//MESSAGE("33-"+String($_l_Index)+"-"+String($_l_AllocateByOrderIndex))
									$_l_AutoAllocationRow:=Find in array:C230(STK_AL_AUTOALLOCATEOI; $_al_AllocateItemNumbers{$_l_AllocateByOrderIndex})
									//GOTO XY(0;0)
									//MESSAGE("34-"+String($_l_Index)+"-"+String($_l_AllocateByOrderIndex))
									If ($_l_AutoAllocationRow>0)
										//GOTO XY(0;0)
										//MESSAGE("35-"+String($_l_Index)+"-"+String($_l_AllocateByOrderIndex))
										APPEND TO ARRAY:C911($_AL_AUTOALLOCATEOI; STK_AL_AUTOALLOCATEOI{$_l_AutoAllocationRow})
										APPEND TO ARRAY:C911($_ar_AUTOALLOCATEQTY; STK_ar_AUTOALLOCATEQTY{$_l_AutoAllocationRow})
										APPEND TO ARRAY:C911($_al_RemoveFromItemID; STK_al_RemoveFromItemID{$_l_AutoAllocationRow})
										//GOTO XY(0;0)
										//MESSAGE("36-"+String($_l_Index)+"-"+String($_l_AllocateByOrderIndex))
									End if 
								End if 
								$_ti_Time2:=Current time:C178
								$_l_TimeTaken:=$_ti_Time2-$_ti_Time
								//SEND PACKET($_ti_DocumentRef;"Time to for 3rd loop element "+String($_l_OrderCodeRangeIndex)+" "+String($_l_Index)+String($_l_AllocateByOrderIndex)+":"+String($_l_TimeTaken)+Char(13))
								$_ti_Time:=Current time:C178
							End for 
							//GOTO XY(0;0)
							//MESSAGE("37")
							$_ti_Time2:=Current time:C178
							$_l_TimeTaken:=$_ti_Time2-$_ti_Time
							//SEND PACKET($_ti_DocumentRef;"Time to start query for order"+String($_l_TimeTaken)+Char(13))
							$_ti_Time:=Current time:C178
							//Now create a record for process service to deak with
							QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode)
							//GOTO XY(0;0)
							//MESSAGE("38")
							$_ti_Time2:=Current time:C178
							$_l_TimeTaken:=$_ti_Time2-$_ti_Time
							//SEND PACKET($_ti_DocumentRef;"Time to query for order"+String($_l_TimeTaken)+Char(13))
							$_ti_Time:=Current time:C178
							//GOTO XY(0;0)
							//MESSAGE("39")
							SET BLOB SIZE:C606($_blb_AllocateList; 0)
							//GOTO XY(0;0)
							//MESSAGE("40")
							//GOTO XY(0;0)
							//MESSAGE("41")
							VARIABLE TO BLOB:C532($_AL_AUTOALLOCATEOI; $_blb_AllocateList; *)
							//GOTO XY(0;0)
							//MESSAGE("42")
							VARIABLE TO BLOB:C532($_ar_AUTOALLOCATEQTY; $_blb_AllocateList; *)
							//GOTO XY(0;0)
							//MESSAGE("43")
							VARIABLE TO BLOB:C532($_al_RemoveFromItemID; $_blb_AllocateList; *)
							//GOTO XY(0;0)
							//MESSAGE("44")
							//$_l_TableNumber:=Table(->[ORDERS])
							//$_Ptr_Table:=Table($_l_TableNumber)
							// ////MESSAGE("Creating AutoAllocate record for "+[ORDERS]Order_Code)
							PS_bo_Showmessages:=False:C215
							$_ti_Time2:=Current time:C178
							$_l_TimeTaken:=$_ti_Time2-$_ti_Time
							//SEND PACKET($_ti_DocumentRef;"Time to start of Process Call"+String($_l_TimeTaken)+Char(13))
							$_ti_Time:=Current time:C178
							//<>STK_ti_DocumentReference:=$_ti_DocumentRef
							ProcessServices_CreateRecord(->[ORDERS:24]; ->[ORDERS:24]x_ID:58; "AutoAllocate"; 0; 0; 0; False:C215; ->$_blb_AllocateList)
							PS_bo_Showmessages:=False:C215
						End if 
					End if 
				End for 
			End for 
			//SET DATABASE PARAMETER(34;0)
			Repeat 
				REDUCE SELECTION:C351([PROCESSES_TO_HANDLE:115]; 0)
				READ ONLY:C145([PROCESSES_TO_HANDLE:115])
				QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]ServiceType:6="AutoAllocate")
				CREATE SET:C116([PROCESSES_TO_HANDLE:115]; "$ThisISO")
				DIFFERENCE:C122("$ThisISO"; "$NotThisISO"; "$ThisISO")
				USE SET:C118("$ThisISO")
				QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=1)
				//This will only have ones added by this process(ish) that have not been processed yet"
				If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0)
					DelayTicks(60)
					// ////MESSAGE("Flag is on =should not be able to quit-waiting for processes to finish")
				End if 
			Until (Records in selection:C76([PROCESSES_TO_HANDLE:115])=0)
			STK_t_isoMovementCode:="Order Numbers: "+$_t_OrderNumbers
			$_bo_ScriptExists:=Macro_AccTypeDEF("OnReceipt")  //run macro "Command /OnReReceipt" if it exists
		Else 
			QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; STK_AL_AUTOALLOCATEOI)
			SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_AllocateItemNumbers; [ORDER_ITEMS:25]Order_Code:1; $_at_AllocateOrderCodes)
			DISTINCT VALUES:C339([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
			For ($_l_AllocateByOrderIndex; 1; Size of array:C274($_at_OrderCodes))
				$_t_CurrentOrderCode:=$_at_OrderCodes{$_l_AllocateByOrderIndex}
				$_bo_NewRecord:=True:C214
				For ($_l_Index; 1; Size of array:C274(STK_AL_AUTOALLOCATEOI))
					$_l_AllocationItemRow:=Find in array:C230($_al_AllocateItemNumbers; STK_AL_AUTOALLOCATEOI{$_l_Index})
					If ($_at_AllocateOrderCodes{$_l_AllocationItemRow}=$_t_CurrentOrderCode)
						//BRING TO FRONT(Current process)
						If (STK_al_RemoveFromItemID{$_l_Index}>0)
							// ////GOTO XY(0;0)
							//Gen_Alert ("Check Pre-allocation is removed")
							READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
							//trace(NG This does not look correct to me)--actually it is-its just checking the items exist-at this point they do(transaction is completed)
							//it is only checking the quantity received
							//(Same as STK_allocateonServer)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=STK_al_RemoveFromItemID{$_l_Index})
							$_r_QuantityReceived:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
							If ($_r_QuantityReceived>0)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_al_RemoveFromItemID{$_l_Index})
								$_l_Retries:=0
								$_l_Delay:=2
								Repeat 
									$_l_Retries:=$_l_Retries+1
									$_bo_OK:=Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1)
									If (Not:C34($_bo_OK))
										If ($_l_Retries>10)
											LOCKED BY:C353([STOCK_MOVEMENT_ITEMS:27]; $_l_Process; $_t_user; $_t_Machine; $_t_ProcessName)
											BRING TO FRONT:C326(Current process:C322)
											Gen_Alert("Stock movement item on the PO movement  is locked by "+$_t_ProcessName+" "+$_t_user+" "+$_t_Machine)
											DelayTicks(30*60)
											$_l_Retries:=1
										End if 
										// ////GOTO XY(0;0)
										// ////MESSAGE("Waitng for PO stock movement item")
										If (($_l_Retries/10)=(Int:C8($_l_Retries/10)))
											//only increase every 10 tries
											$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
										End if 
										DelayTicks(2*$_l_Delay)
									End if 
								Until ($_bo_OK=True:C214)
								$_l_StockItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
								If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<=$_r_QuantityReceived)
									[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
									[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
									[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
									//Gen_Alert ("stock item pre-allocated to SO "+String($_l_StockItemNumber)+" on movement "+[STOCK ITEMS]Movement Code+" Has been removed it will be re-allocated from stock in a few moments")
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
									APPEND TO ARRAY:C911($_al_ReAllocateItemNumber; $_l_ItemNumber)
									APPEND TO ARRAY:C911($_al_ReAllocateTo; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									APPEND TO ARRAY:C911($_ar_ReAllocateQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
									[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
								End if 
							End if 
						End if 
						//Gen_Alert ("PO Stock item Checked Now going to allocate to an order item")
						READ WRITE:C146([ORDER_ITEMS:25])
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_AL_AUTOALLOCATEOI{$_l_Index})
						If (Records in selection:C76([ORDER_ITEMS:25])=1)
							//Gen_Alert ("Sales Order item +String(STK_AL_AUTOALLOCATEOI{$_l_Index})+ is about to have stock allocatd to it")
							// ////GOTO XY(0;0)
							// ////MESSAGE("Allocating Stock to sales order item")
							QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
							$_l_Delay:=1
							$_l_Retries:=0
							$_l_Delay:=2
							Repeat 
								BRING TO FRONT:C326(Current process:C322)
								$_l_Retries:=$_l_Retries+1
								$_bo_OK:=Check_Locked(->[ORDER_ITEMS:25]; 1)
								If (Not:C34($_bo_OK))
									If ($_l_Retries>10)
										LOCKED BY:C353([ORDER_ITEMS:25]; $_l_Process; $_t_user; $_t_Machine; $_t_ProcessName)
										BRING TO FRONT:C326(Current process:C322)
										Gen_Alert("Sales order item is locked by "+$_t_ProcessName+" "+$_t_user+" "+$_t_Machine)
										DelayTicks(30*60)
										$_l_Retries:=1
									End if 
									// ////GOTO XY(0;0)
									// ////MESSAGE("Waiting for stock item to be unlocked")
									If (($_l_Retries/10)=(Int:C8($_l_Retries/10)))
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
							If ($_r_ToAllocate>STK_ar_AUTOALLOCATEQTY{$_l_Index})
								$_r_ToAllocate:=STK_ar_AUTOALLOCATEQTY{$_l_Index}
							End if 
							vStPrev:=""
							If (Gen_PPChkStSing(->[ORDERS:24]State:15; 4; False:C215))
								If ([ORDER_ITEMS:25]Item_Number:27#STK_AL_AUTOALLOCATEOI{$_l_Index})
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_AL_AUTOALLOCATEOI{$_l_Index})
								End if 
								$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
								QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode)
								CREATE SET:C116([ORDER_ITEMS:25]; "$CurrentOrderItems")
								QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_AL_AUTOALLOCATEOI{$_l_Index})
								STK_bo_AUTOmessageS:=False:C215
								If (OrderI_AllocAu1)
									If ([ORDER_ITEMS:25]Item_Number:27#STK_AL_AUTOALLOCATEOI{$_l_Index})
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_AL_AUTOALLOCATEOI{$_l_Index})
									End if 
									$_r_CurrentOrderQuantity:=[ORDER_ITEMS:25]Quantity:3
									$_t_AllocateResult:=OrderI_AllocAu2(STK_AL_AUTOALLOCATEOI{$_l_Index})
									If ([ORDER_ITEMS:25]Item_Number:27#STK_AL_AUTOALLOCATEOI{$_l_Index})
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_AL_AUTOALLOCATEOI{$_l_Index})
									End if 
									If ([ORDER_ITEMS:25]Quantity:3#$_r_CurrentOrderQuantity)
										$_l_ReAllocateRow:=Find in array:C230($_al_ReAllocateItemNumber; $_l_ItemNumber)
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
											If ([ORDER_ITEMS:25]Quantity:3>=$_ar_ReAllocateQuantity{$_l_ReAllocateRow})
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
											QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_AL_AUTOALLOCATEOI{$_l_Index})
											//APPEND TO ARRAY($_al_ReAllocateItemNumber;$_l_ItemNumber)
											//APPEND TO ARRAY($_al_ReAllocateTo;[STOCK ITEMS]x_ID)
											//APPEND TO ARRAY($_ar_ReAllocateQuantity;[STOCK ITEMS]Quantity)
										End if 
									End if 
									If ([ORDER_ITEMS:25]Received_Date:21=!00-00-00!)
										[ORDER_ITEMS:25]Received_Date:21:=Current date:C33(*)
									End if 
									[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
									DB_SaveRecord(->[ORDER_ITEMS:25])
									AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
								End if 
								STK_bo_AUTOmessageS:=False:C215
							Else 
								//Gen_Alert ("Order item state does not allow allocation!")
							End if 
						End if 
					End if 
				End for 
			End for 
			ARRAY TEXT:C222($_at_StockMovementCodes; 0)
			For ($_l_Index; 1; Size of array:C274(STK_AL_AUTOALLOCATEOI))
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=STK_AL_AUTOALLOCATEOI)
				ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; <)
				$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
				If ($_l_CopiedFromID>0)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopiedFromID)
					If (Find in array:C230($_at_StockMovementCodes; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)<0)
						APPEND TO ARRAY:C911($_at_StockMovementCodes; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
					End if 
				End if 
			End for 
			For ($_l_Index; 1; Size of array:C274($_at_StockMovementCodes))
				If ($_l_Index>1)
					$_t_StockMovementCodes:=$_t_StockMovementCodes+", "+$_at_StockMovementCodes{$_l_Index}
				Else 
					$_t_StockMovementCodes:=$_at_StockMovementCodes{$_l_Index}
				End if 
			End for 
			STK_t_isoMovementCode:=$_t_StockMovementCodes
			$_bo_ScriptExists:=Macro_AccTypeDEF("OnReceipt")  //run macro "Command /OnReReceipt" if it exists
		End if 
	Else 
		//Gen_Alert ("There are no -reallocations to do!")
	End if 
	<>HoldQuit:=False:C215
	// ////MESSAGE("Flag is off =should not be able to quit")
	//DelayTicks (600)
End if 
ERR_MethodTrackerReturn("STK_AllocAutoOnReceipt"; $_t_oldMethodName)