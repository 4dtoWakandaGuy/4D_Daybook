//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_unallocateinprocess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ForceRecalc; 0)
	ARRAY LONGINT:C221($_al_IDSonordertofreeup; 0)
	ARRAY LONGINT:C221($_al_IDsToUnallocate; 0)
	ARRAY LONGINT:C221($_al_OINumbers; 0)
	ARRAY LONGINT:C221($_al_OINumbersReturn; 0)
	ARRAY TEXT:C222($_at_AllocationAddToType; 0)
	ARRAY TEXT:C222($_at_AllocationTypes; 0)
	ARRAY TEXT:C222($_at_OrderTypes; 0)
	ARRAY TEXT:C222($_at_POAddtoStockTypes; 0)
	ARRAY TEXT:C222($_at_POAllocationTypes; 0)
	C_BOOLEAN:C305($_bo_Edits; $_bo_IsAnalysed; $_bo_OK; STK_bo_DeferValidation; STK_bo_inTransaction)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_StockItemHeaderDateWAS)
	C_LONGINT:C283($_l_AddToCurrentStockID; $_l_Index; $_l_OrderItemNumber; $_l_Records; $_l_Records2; $_l_SalesOrderItem; $_l_SMIItemNumber; $_l_UnAllocateIndex; $1; STK_l_TransactionID)
	C_REAL:C285($_r_CalledOffQuantity; $_r_Cost; $_r_Remainders; $_r_Stocktokeepallocated; $_r_ToUNallocateFree; $_r_ToUNallocateOnOrder; $2)
	C_TEXT:C284($_t_AddToStockType; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_Location; $_t_oldMethodName; $_t_OrderCode; vProdCode; vStatus; vStPrev)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_unallocateinprocess"; Form event code:C388)

Start_Process
If (Count parameters:C259>=1)
	$_l_SalesOrderItem:=$1
	If ([ORDER_ITEMS:25]Item_Number:27#$1)
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_SalesOrderItem)
	End if 
	If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
		QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
	End if 
	vStPrev:=""
	If (((DB_GetModuleSettingByNUM(Module_StockControl)=2) | (DB_GetModuleSettingByNUM(Module_StockControl)=4)))  //((DB_t_CurrentFormUsage#"NaNFixer ") | (◊SalesAlloc=True))
		
		If (Gen_PPChkStSing(->[ORDERS:24]State:15; 4))
			//if was asked the user here whether to move
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
			If ((Records in selection:C76([MOVEMENT_TYPES:60])>0) & ([MOVEMENT_TYPES:60]Stock_Plus:3#""))
				vStatus:=[MOVEMENT_TYPES:60]Stock_Plus:3
				QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=vStatus)
				If ([STOCK_TYPES:59]Allocated:6)
					//````````
					vProdCode:=[ORDER_ITEMS:25]Product_Code:2
					$_l_Records:=Records in selection:C76([ORDER_ITEMS:25])
					
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_AllocationAddToType)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_POAllocationTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_POAddtoStockTypes)
					SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OINumbers)
					QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_OINumbers)
					STK_MenuUpdate("Stock items"; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; True:C214)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationTypes)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_AllocationAddToType)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_OINumbersReturn)
					QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Item_Number:27; $_al_OINumbersReturn)
					CREATE SET:C116([ORDER_ITEMS:25]; "$SET1")
					QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_OINumbers)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_POAllocationTypes)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_POAddtoStockTypes)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_OINumbersReturn)
					QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Item_Number:27; $_al_OINumbersReturn)
					CREATE SET:C116([ORDER_ITEMS:25]; "$SET2")
					UNION:C120("$SET1"; "$SET2"; "$SET1")
					USE SET:C118("$SET1")
					QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Locked:16=False:C215)
					If (Records in selection:C76([ORDER_ITEMS:25])>0)
						If (OK=1)
							$_bo_OK:=True:C214
							If (Records in selection:C76([ORDER_ITEMS:25])<$_l_Records)
								$_l_Records2:=Records in selection:C76([ORDER_ITEMS:25])
								Gen_Confirm("You selected "+String:C10($_l_Records)+" However only "+String:C10($_l_Records2)+" can have stock unalloacted. Are you sure you want to Unallocate?"; "Yes"; "No")
								$_bo_OK:=(OK=1)
							Else 
								If ($_l_Records>1)
									Gen_Confirm("Are you sure you want to Unallocate from "+String:C10($_l_Records)+" Order Items?"; "Yes"; "No")
									$_bo_OK:=(OK=1)
								Else 
									Gen_Confirm("Are you sure you want to Unallocate?"; "Yes"; "No")
									$_bo_OK:=(OK=1)
								End if 
							End if 
							If ($_bo_OK)
								
								$_bo_IsAnalysed:=STK_IsProductAnalysed([ORDER_ITEMS:25]Product_Code:2)
								If ($_bo_IsAnalysed)
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
									If (Records in selection:C76([MOVEMENT_TYPES:60])>=1)
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
										SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes)
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
										READ WRITE:C146([STOCK_MOVEMENTS:40])
										READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
										READ WRITE:C146([CURRENT_STOCK:62])
										READ WRITE:C146([STOCK_LEVELS:58])
										//START TRANSACTION
										//C_LONGINT(STK_l_TransactionID)
										//STK_l_TransactionID:=AA_GetNextID (->STK_l_TransactionID)
										StartTransaction
										
										ARRAY LONGINT:C221($_al_ForceRecalc; 0)
										CREATE RECORD:C68([STOCK_MOVEMENTS:40])
										//Movement_CodeT  `Pointless assigning a temp code here
										Movement_Code
										[STOCK_MOVEMENTS:40]Company_From:2:=[ORDERS:24]Company_Code:1
										[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
										[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
										
										[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
										[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
										[STOCK_MOVEMENTS:40]Analysis_Code:9:=[ORDERS:24]Analysis_Code:33
										[STOCK_MOVEMENTS:40]Currency_Code:10:=[ORDERS:24]Currency_Code:32
										[STOCK_MOVEMENTS:40]Layer_Code:11:=[ORDERS:24]Layer_Code:47
										
										$_r_Cost:=0
										FIRST RECORD:C50([ORDER_ITEMS:25])
										While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (OK=1))
											If (Not:C34([ORDER_ITEMS:25]Item_Locked:16))
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27; *)
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
												QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationTypes)
												SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_IDsToUnallocate)
												ARRAY LONGINT:C221($_al_IDSonordertofreeup; 0)
												$_r_ToUNallocateOnOrder:=0
												$_r_ToUNallocateFree:=0
												If (Count parameters:C259<2)
													$_r_ToUNallocateFree:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
												Else 
													If ($2<Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
														$_r_ToUNallocateFree:=$2
													Else 
														$_r_ToUNallocateFree:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
													End if 
												End if 
												If (Count parameters:C259>=2)
													If ($_r_ToUNallocateFree<$2)
														$_r_Remainders:=$2-$_r_ToUNallocateFree
													Else 
														$_r_Remainders:=0
													End if 
												Else 
													$_r_Remainders:=[ORDER_ITEMS:25]Quantity:3-$_r_ToUNallocateFree
												End if 
												If ($_r_Remainders>0)
													
													QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
													SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_OrderTypes)
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27; *)
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
													QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_OrderTypes)
													SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_IDSonordertofreeup)
													If ($_r_ToUNallocateOnOrder>$_r_Remainders)
														$_r_ToUNallocateOnOrder:=$_r_Remainders
													Else 
														
														$_r_ToUNallocateOnOrder:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
													End if 
													
												Else 
													$_r_ToUNallocateOnOrder:=0
													
												End if 
												
												//$Totaltounallocate:=$_r_ToUNallocateOnOrder+$_r_ToUNallocateFree
												If (Size of array:C274($_al_IDsToUnallocate)>0)
													For ($_l_UnAllocateIndex; 1; Size of array:C274($_al_IDsToUnallocate))
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_IDsToUnallocate{$_l_UnAllocateIndex})
														If ($_r_ToUNallocateFree>0)
															STK_ItemDuplicate
															$_r_CalledOffQuantity:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
															$_t_AddToStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
															$_l_AddToCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
															$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
															$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
															$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
															$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
															$_l_SMIItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8  //This will only be filled in if its allocated-we will move the allocation from the on order item to the instock item.
															$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
															[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
															[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
															[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
															[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=[ORDER_ITEMS:25]Item_Number:27
															[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=[ORDERS:24]Company_Code:1
															[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=[ORDER_ITEMS:25]Order_Code:1
															[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
															[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
															[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_AddToCurrentStockID
															[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
															
															If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>=$_r_ToUNallocateFree)
																[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_ToUNallocateFree
															Else 
																[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
															End if 
															STK_SetCreatedStockItem(-1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
															
															$_r_ToUNallocateFree:=$_r_ToUNallocateFree-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
															$_d_StockItemHeaderDateWAS:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
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
																If ($_d_StockItemHeaderDateWAS=!00-00-00!)
																	$_d_StockItemHeaderDateWAS:=Current date:C33(*)
																End if 
																If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#0)
																	[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=Cat_ConvertValue([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENTS:40]Currency_Code:10; $_d_StockItemHeaderDateWAS)
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
															//note that the trigger will update the called off on the previous stock..that is the trigger on the stock movement
															//this is so if we cancell the stock movement we dont make the amount wrong preventing a call off(make sure is we cancel that the items here get deleted)
															DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
														End if 
													End for 
													
												End if 
												If (Size of array:C274($_al_IDSonordertofreeup)>0)
													For ($_l_UnAllocateIndex; 1; Size of array:C274($_al_IDSonordertofreeup))
														If ($_r_ToUNallocateOnOrder>0)
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_IDSonordertofreeup{$_l_UnAllocateIndex})
															$_l_OrderItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
															[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
															[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
															$_r_Stocktokeepallocated:=0
															//TRACE
															//Test this adjusts the correct current stock records as we have taken off hte item number!!!
															If ($_r_ToUNallocateOnOrder>[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																$_r_Stocktokeepallocated:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_ToUNallocateOnOrder
																[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_ToUNallocateOnOrder
																[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
																
															End if 
															
															
															DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
															
															$_r_ToUNallocateOnOrder:=$_r_ToUNallocateOnOrder-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
															If ($_r_Stocktokeepallocated>0)
																STK_ItemDuplicate
																APPEND TO ARRAY:C911($_al_ForceRecalc; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																STK_SetCreatedStockItem(0; ($_r_Stocktokeepallocated); [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; 0; $_l_OrderItemNumber)
															End if 
														End if 
													End for 
													
												End if 
												
												
												
												OrderI_Una2
												DB_SaveRecord(->[ORDER_ITEMS:25])
												
											Else 
												Gen_Alert("Invoiced items may not be un-allocated")
											End if 
											NEXT RECORD:C51([ORDER_ITEMS:25])
										End while 
										
										
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
										
										[STOCK_MOVEMENTS:40]Total_Cost:8:=Round:C94(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
										
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
											STK_bo_DeferValidation:=True:C214
											STK_bo_inTransaction:=True:C214
											DB_SaveRecord(->[STOCK_MOVEMENTS:40])
											//VALIDATE TRANSACTION
											Transact_End(True:C214)
											STK_EndTransaction(STK_l_TransactionID; True:C214)
											
											STK_bo_inTransaction:=False:C215
											
											If (Size of array:C274($_al_ForceRecalc)>0)
												For ($_l_Index; 1; Size of array:C274($_al_ForceRecalc))
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ForceRecalc{$_l_Index})
													While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0)))
														DelayTicks(2)
													End while 
													
													STK_UpdateCalledOffQuantity
													DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
												End for 
											End if 
										Else 
											OK:=0
											//CANCEL TRANSACTION
											Transact_End(False:C215)
											STK_EndTransaction(STK_l_TransactionID; False:C215)
											
											
										End if 
										If (OK=1)
											
										Else 
											
											Gen_Alert("No Unallocations have been carried out"; "OK")
										End if 
										
										READ ONLY:C145([STOCK_MOVEMENTS:40])
										READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
										READ ONLY:C145([CURRENT_STOCK:62])
										READ ONLY:C145([STOCK_LEVELS:58])
										UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
										UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
										UNLOAD RECORD:C212([CURRENT_STOCK:62])
										UNLOAD RECORD:C212([STOCK_LEVELS:58])
									End if 
								Else 
									Gen_Alert("This prroduct has not had stock setup completed. Please complete this before unallocation  of stock")
								End if 
							End if 
						End if 
					Else 
						Gen_Alert("The selectied records may not have stock un-allocated from them.")
					End if 
					
				Else 
					Gen_Alert("Stock Type "+vStatus+", as defined for the Unallocation Movement,"+" is not itself defined as 'Included in Order Items allocated total'"; "Cancel")
				End if 
				
			Else 
				Gen_Alert("No Movement Type has been defined for Unallocation"; "Cancel")
			End if 
		End if 
	Else 
		Gen_Alert("You do not have access to Unallocate Stock"; "Cancel")
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("STK_unallocateinprocess"; $_t_oldMethodName)
