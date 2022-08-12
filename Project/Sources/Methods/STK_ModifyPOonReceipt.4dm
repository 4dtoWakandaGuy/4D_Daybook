//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ModifyPOonReceipt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ReadOnlyState; $_bo_ReadOnlyState2; $_bo_ReadOnlyState3; $_bo_ReadOnlyState4; $_bo_UpdateSM; $3)
	C_LONGINT:C283(<>STK_l_ValidateCalledOff; $_l_addID; $_l_POItemID; $_l_Process; $_l_Retries; $_l_SelectedRecordNumber; $_l_StockItemID; $1; $4; STK_l_addID; STK_l_NewStockItemID)
	C_REAL:C285($_r_ItemMovedQuantity; $_r_OldQuantity; $_r_POItemQuantity; $_r_Quantity; $_r_QuantityRemaining; $_r_ThisItemQuantity; $_r_TotalStock; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ModifyPOonReceipt")

If (Count parameters:C259>=2)
	If ($3)
		//`alert("5")
		STK_l_NewStockItemID:=0
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Selection")
		$_l_SelectedRecordNumber:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
		
		//recall in a process..no need to wait for process to complete though...only hold so messaging is synchronous
		$_l_Process:=New process:C317("STK_ModifyPOonReceipt"; 256000; "Update PO Movement"; $1; $2; False:C215; Current process:C322)
		$_l_Retries:=0
		While (Process state:C330($_l_Process)>=0) & (Process_Name($_l_Process)="Update PO Movement")
			$_l_Retries:=$_l_Retries+1
			DelayTicks(60*(1+$_l_Retries))
		End while 
		
	Else 
		
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Selection")
		$_l_SelectedRecordNumber:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
		$_bo_UpdateSM:=False:C215
		$_bo_ReadOnlyState:=Read only state:C362([STOCK_MOVEMENT_ITEMS:27])
		$_bo_ReadOnlyState2:=Read only state:C362([STOCK_MOVEMENTS:40])
		$_bo_ReadOnlyState3:=Read only state:C362([PURCHASE_ORDERS_ITEMS:169])
		$_bo_ReadOnlyState4:=Read only state:C362([PURCHASE_ORDERS:57])
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#$1)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$1)
		End if 
		STK_l_NewStockItemID:=0
		$_r_OldQuantity:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
		If ($_r_OldQuantity#$2)
			
			Case of 
				: ($2=0)
					[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=""
					[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=!00-00-00!
				: ($2>$_r_OldQuantity)
					$_l_StockItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
					If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21#0)
						QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]POitemID:16=[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
						$_r_POItemQuantity:=[PURCHASE_ORDERS_ITEMS:169]Quantity:3
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=[PURCHASE_ORDERS_ITEMS:169]POitemID:16)
						$_r_ItemMovedQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockItemID)
						$_r_ThisItemQuantity:=$_r_OldQuantity
						$_r_TotalStock:=($_r_ItemMovedQuantity-$_r_ThisItemQuantity)+$2
						STK_l_NewStockItemID:=0
						If ($_r_TotalStock>$_r_POItemQuantity)
							Gen_Confirm("The Purchase order item for this is for a quantity of "+String:C10($_r_POItemQuantity)+" do you wish to change the purchase ordered Quantity to "+String:C10($_r_TotalStock)+"?"; "Yes"; "No")
							If (OK=1)
								READ WRITE:C146([PURCHASE_ORDERS:57])
								READ WRITE:C146([PURCHASE_ORDERS_ITEMS:169])
								QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]POitemID:16=[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
								If ([PURCHASE_ORDERS_ITEMS:169]Item_Number:6=0)
									//so here we increased the PO quantity so we can increase the stock item quantity
									[PURCHASE_ORDERS_ITEMS:169]Quantity:3:=$_r_TotalStock
									PurchOrd_SubCal
									SAVE RECORD:C53([PURCHASE_ORDERS_ITEMS:169])
									QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
									QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
									[PURCHASE_ORDERS:57]Total_Cost:4:=Gen_Round(Sum:C1([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5); 2; 2)
									SAVE RECORD:C53([PURCHASE_ORDERS:57])
									UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
									UNLOAD RECORD:C212([PURCHASE_ORDERS_ITEMS:169])
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$2
									[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
								Else 
									DUPLICATE RECORD:C225([PURCHASE_ORDERS_ITEMS:169])
									$_r_Quantity:=[PURCHASE_ORDERS_ITEMS:169]Quantity:3
									[PURCHASE_ORDERS_ITEMS:169]Quantity:3:=$_r_TotalStock-$_r_Quantity
									[PURCHASE_ORDERS_ITEMS:169]PurchaseInvoiceItemID:20:=0
									[PURCHASE_ORDERS_ITEMS:169]PurchaseinvoiceCode:19:=""
									[PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8:=""
									[PURCHASE_ORDERS_ITEMS:169]Item_Number:6:=0
									[PURCHASE_ORDERS_ITEMS:169]ID:17:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]ID:17)
									[PURCHASE_ORDERS_ITEMS:169]POitemID:16:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]POitemID:16)
									$_l_POItemID:=[PURCHASE_ORDERS_ITEMS:169]POitemID:16
									PurchOrd_SubCal
									SAVE RECORD:C53([PURCHASE_ORDERS_ITEMS:169])
									QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
									QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
									[PURCHASE_ORDERS:57]Total_Cost:4:=Gen_Round(Sum:C1([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5); 2; 2)
									SAVE RECORD:C53([PURCHASE_ORDERS:57])
									UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
									STK_ItemDuplicate
									[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
									[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=""
									[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
									[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=""
									[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=0
									[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=""
									[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=""
									[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=""
									[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=0
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
									
									STK_SetCreatedStockItem(0; ($_r_TotalStock-$_r_Quantity); 0; $_l_POItemID; 0)
									STK_l_NewStockItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
									
									//alert("8ec")
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
										End if 
									End if 
								End if 
							Else 
								//quantity exceeds po quantity.... but create new stock item not linke to po item
								$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
								STK_ItemDuplicate
								[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20:=""
								[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
								[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=""
								[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
								[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=""
								[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=0
								[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=""
								[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=""
								[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=""
								[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=0
								[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
								STK_SetCreatedStockItem(0; ($2-$_r_Quantity); 0; 0; 0)
								STK_l_NewStockItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
								If (False:C215)
									If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
										$_l_Process:=New process:C317("STK_ValidateCalledafterProcess"; 128000; "Validate Called off"+String:C10([STOCK_MOVEMENT_ITEMS:27]x_ID:16); Current process:C322; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; *)
									End if 
								End if 
								//alert("13")
								$_bo_UpdateSM:=True:C214
							End if 
						Else 
							//Quantity does not exceed the po quantity
							[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$2
							[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
							[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
							[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
							$_bo_UpdateSM:=True:C214
							
						End if 
						
					Else 
						//therer is no po item number
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$2
						[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
						[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
						$_bo_UpdateSM:=True:C214
						
					End if 
					
				: ($2<$_r_OldQuantity)
					//test to make sure this updates the copied from stock item iD correctly
					//This is simpler as we wont need to adjust where it copied from from etc or adjust the po item BUT we WILL split the item
					$_r_QuantityRemaining:=$_r_OldQuantity-$2
					[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=$2
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$2
					[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
					
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					STK_ItemDuplicate
					STK_SetCreatedStockItem(0; ($_r_QuantityRemaining); 0; 0; 0)
					STK_l_NewStockItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
					If (False:C215)
						If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
							$_l_Process:=New process:C317("STK_ValidateCalledafterProcess"; 128000; "Validate Called off"+String:C10([STOCK_MOVEMENT_ITEMS:27]x_ID:16); Current process:C322; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; *)
						End if 
					End if 
					$_bo_UpdateSM:=True:C214
					
					
			End case 
		End if 
		If (Count parameters:C259>=4)
			//Call back??
			If ($_bo_UpdateSM)
				//update the stock movement total
				
				READ WRITE:C146([STOCK_MOVEMENTS:40])
				If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
					QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
				[STOCK_MOVEMENTS:40]Total_Cost:8:=Round:C94(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
				
				DB_SaveRecord(->[STOCK_MOVEMENTS:40])
				
			End if 
			SET PROCESS VARIABLE:C370($4; STK_l_NewStockItemID; STK_l_NewStockItemID)
		Else 
			If ($_bo_ReadOnlyState)
				READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
			End if 
			LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
			If ($_bo_UpdateSM)
				//update the stock movement total
				//reload the stock items..not very good but has to be done
				If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
					QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
				[STOCK_MOVEMENTS:40]Total_Cost:8:=Round:C94(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
				
				DB_SaveRecord(->[STOCK_MOVEMENTS:40])
				STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
			End if 
			If ($_bo_ReadOnlyState3)
				UNLOAD RECORD:C212([PURCHASE_ORDERS_ITEMS:169])
				READ ONLY:C145([PURCHASE_ORDERS_ITEMS:169])
				LOAD RECORD:C52([PURCHASE_ORDERS_ITEMS:169])
			End if 
			If ($_bo_ReadOnlyState4)
				UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
				READ ONLY:C145([PURCHASE_ORDERS:57])
				LOAD RECORD:C52([PURCHASE_ORDERS:57])
			End if 
			//we are in the movement itself...so need to update the movement to reflect the changes
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("STK_ModifyPOonReceipt"; $_t_oldMethodName)
