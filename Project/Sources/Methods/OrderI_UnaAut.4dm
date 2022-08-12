//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_UnaAut
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2012 15:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AbleToUnallocateInvoiced; 0)
	ARRAY LONGINT:C221($_al_ForceRecalcMovementItemIDS; 0)
	ARRAY LONGINT:C221($_al_IDsToUnallocate; 0)
	ARRAY LONGINT:C221($_al_OINumbersReturn; 0)
	ARRAY LONGINT:C221($_al_OnOrderIDStoFreeUp; 0)
	ARRAY LONGINT:C221($_al_SalesOrderItems; 0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	ARRAY TEXT:C222($_at_AllocationAddToType; 0)
	ARRAY TEXT:C222($_at_AllocationTypes; 0)
	ARRAY TEXT:C222($_at_POAllocationTypes; 0)
	ARRAY TEXT:C222($_at_POPlusType; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_PUrchOrderMovementTypes; 0)
	ARRAY TEXT:C222($_at_ReceiptAddtoType; 0)
	ARRAY TEXT:C222($_at_ReceiptMovementTypes; 0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_AllocatedFromMO; $_bo_Edits; $_bo_IsAnalysed; $_bo_OK; $_bo_Reselect; $_bo_UnallocatedFromOnOrder; ORD_bo_IsRevision)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_StockItemsHeaderDateWAS)
	C_LONGINT:C283($_l_AddToCurrentStockID; $_l_FieldNumber; $_l_MovementItemNumber; $_l_OrderItemTableRow; $_l_ProductCodeRow; $_l_RecordsIndex; $_l_RecordsInSelectionMI; $_l_RecordsinSelectionOrderItems; $_l_TableNumber; $_l_UnallocateIndex; vAB)
	C_LONGINT:C283(vALLevels)
	C_POINTER:C301($_ptr_ListBoxSetup; $_ptr_NamedSetVar)
	C_REAL:C285($_r_CalledOffQuantity; $_r_Cost; $_r_ToUnallocateOnOrder; $_r_ToUnAllocatFREE)
	C_TEXT:C284($_t_AddToStockType; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_Location; $_t_NamedSet; $_t_oldMethodName; $_t_OrderCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(vProdCode; vStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_UnaAut")


If (Not:C34(ORD_bo_IsRevision))
	If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
		
		Menu_Record("OrderI_UnaAut"; "Unallocate - Auto")
		//$RevertSetting:=ORD_SetSelectable (1)
		If ((DB_t_CurrentFormUsage#"NA@") & ((DB_GetModuleSettingByNUM(Module_StockControl)=2) | (DB_GetModuleSettingByNUM(Module_StockControl)=4)))  //((DB_t_CurrentFormUsage#"NaNFixer ") | (◊SalesAlloc=True))
			
			
			If (Gen_PPChkStSing(->[ORDERS:24]State:15; 4))
				//if was asked the user here whether to move
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
				If ((Records in selection:C76([MOVEMENT_TYPES:60])>0) & ([MOVEMENT_TYPES:60]Stock_Plus:3#""))
					vStatus:=[MOVEMENT_TYPES:60]Stock_Plus:3
					QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=vStatus)
					If ([STOCK_TYPES:59]Allocated:6)
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
						//``````
						$_l_OrderItemTableRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
						$_bo_Reselect:=False:C215
						COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
						If ($_l_OrderItemTableRow>0)
							$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemTableRow}
							
							If (DB_t_CurrentFormUsage#"None") & (Not:C34(Undefined:C82(ORD_al_SubAreaTables)))
								$_ptr_NamedSetVar:=$_ptr_ListBoxSetup->{20}
								$_t_NamedSet:=$_ptr_NamedSetVar->
								If (Records in set:C195($_t_NamedSet)>0)
									USE SET:C118($_t_NamedSet)
									CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
									$_bo_Reselect:=True:C214
								End if 
							Else 
								$_bo_Reselect:=False:C215
							End if 
						Else 
							$_bo_Reselect:=False:C215
						End if 
						//ORD_ISetSortOrder
						If ($_bo_Reselect)
							HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
						End if   //````````
						
						vProdCode:=[ORDER_ITEMS:25]Product_Code:2
						If (vALLevels>0)
							//NG added this line here-because want to reset the seleciton at the end
							$_l_RecordsinSelectionOrderItems:=Records in selection:C76([ORDER_ITEMS:25])
							//Gen_Confirm ("This Function will Unallocate from "+String($_l_RecordsinSelectionOrderItems)+" Order Item"+("s"*Num($_l_RecordsinSelectionOrderItems>1));"Continue";"Cancel")
							// Else
							// Gen_Alert ("Please first select Item(s) to Unallocate";"Cancel")
							// OK:=0
							// End if
						Else 
							Gen_Confirm("Do you want to Unallocate from just the current Order Item ("+vProdCode+") or all Order Items?"; "Current"; "All")
							If (OK=1)
								ONE RECORD SELECT:C189([ORDER_ITEMS:25])
							Else 
								OK:=1
							End if 
						End if 
						If (OK=1)
							$_l_RecordsinSelectionOrderItems:=Records in selection:C76([ORDER_ITEMS:25])
							If ($_l_RecordsinSelectionOrderItems>0)
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]UseForStockReceipt:33=True:C214)
								SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ReceiptMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_ReceiptAddtoType)
								
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
								SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_AllocationAddToType)
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
								SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_POAllocationTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_POPlusType)
								SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_SalesOrderItems)
								QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SalesOrderItems)
								COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Allocated")
								$_l_RecordsInSelectionMI:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
								ARRAY TEXT:C222($_at_ProductCodes; 0)
								ARRAY LONGINT:C221($_al_AbleToUnallocateInvoiced; 0)
								USE NAMED SELECTION:C332("$Allocated")
								QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationTypes)
								$_bo_AllocatedFromMO:=True:C214
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
									USE NAMED SELECTION:C332("$Allocated")
									QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ReceiptMovementTypes)
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
										$_bo_AllocatedFromMO:=False:C215
									Else 
										USE NAMED SELECTION:C332("$Allocated")
										QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_POAllocationTypes)
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_AbleToUnallocateInvoiced)
									End if 
								Else 
									$_bo_AllocatedFromMO:=False:C215
									
								End if 
								
								QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_AllocationAddToType)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
								SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_OINumbersReturn)
								QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OINumbersReturn)
								CREATE SET:C116([ORDER_ITEMS:25]; "$SET1")
								QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SalesOrderItems)
								QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_POAllocationTypes)
								QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_POPlusType)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
								SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_OINumbersReturn)
								QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OINumbersReturn)
								CREATE SET:C116([ORDER_ITEMS:25]; "$SET2")
								UNION:C120("$SET1"; "$SET2"; "$SET1")
								USE SET:C118("$SET1")
								$_bo_AllocatedFromMO:=False:C215
								If ($_bo_AllocatedFromMO=False:C215)
									//QUERY SELECTION([ORDER_ITEMS];[ORDER_ITEMS]Item_Locked=False)
								Else 
									//if the order items are allocated from on order-they have not been received from the supplier so it is odd that they have been invoiced
									//this may mean that the user wants to unallocate the O stock..they can then credit the invoice and create a new order for the stock if the customer wants it
									//to allocate P stock to an invoiced order item would be a whole new ball game needing to unlock the invoiced order item
									QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Locked:16=True:C214)
									If (Records in selection:C76([ORDER_ITEMS:25])>0)
										//Gen_Confirm ("Remove ordered allocation from invoiced order items?"+Char(13)+"Note that you will not be able to re-allocate any stock to this order item because it is locked!";"No";"Yes")
										If (OK=0)
											USE SET:C118("$SET1")
										Else 
											REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
										End if 
										OK:=1
									Else 
										OK:=1
										USE SET:C118("$SET1")
									End if 
								End if 
								If (Records in selection:C76([ORDER_ITEMS:25])>0)
									$_bo_OK:=True:C214
									If (Records in selection:C76([ORDER_ITEMS:25])<$_l_RecordsinSelectionOrderItems)
										$_l_RecordsInSelectionMI:=Records in selection:C76([ORDER_ITEMS:25])
										Gen_Confirm("You selected "+String:C10($_l_RecordsinSelectionOrderItems)+" However only "+String:C10($_l_RecordsInSelectionMI)+" can have stock unalloacted. Are you sure you want to Unallocate?"; "Yes"; "No")
										$_bo_OK:=(OK=1)
									Else 
										If ($_l_RecordsinSelectionOrderItems>1)
											Gen_Confirm("Are you sure you want to Unallocate from "+String:C10($_l_RecordsinSelectionOrderItems)+" Order Items?"; "Yes"; "No")
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
												//READ WRITE([STOCK ITEMS])
												//READ WRITE([CURRENT STOCK])
												//READ WRITE([STOCK_LEVELS])
												ARRAY LONGINT:C221($_al_ForceRecalcMovementItemIDS; 0)
												//START TRANSACTION
												StartTransaction
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
												$_bo_UnallocatedFromOnOrder:=False:C215
												While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (OK=1))
													If (Not:C34([ORDER_ITEMS:25]Item_Locked:16)) | (Find in array:C230($_al_AbleToUnallocateInvoiced; [ORDER_ITEMS:25]Item_Number:27)>0)
														
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27; *)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
														QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationTypes)
														$_r_ToUnAllocatFREE:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
														SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_IDsToUnallocate)
														FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
														QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
														SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PUrchOrderMovementTypes)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27; *)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
														QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_PUrchOrderMovementTypes)
														$_r_ToUnallocateOnOrder:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
														SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_OnOrderIDStoFreeUp)
														FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
														If (Size of array:C274($_al_IDsToUnallocate)>0)
															For ($_l_UnallocateIndex; 1; Size of array:C274($_al_IDsToUnallocate))
																If ($_r_ToUnAllocatFREE>0)
																	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_IDsToUnallocate{$_l_UnallocateIndex})
																	STK_ItemDuplicate
																	APPEND TO ARRAY:C911($_al_ForceRecalcMovementItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																	If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
																		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
																	End if 
																	
																	$_r_CalledOffQuantity:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
																	$_t_AddToStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
																	$_l_AddToCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
																	$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
																	$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
																	$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
																	$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
																	$_l_MovementItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8  //This will only be filled in if its allocated-we will move the allocation from the on order item to the instock item.
																	
																	$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
																	[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
																	
																	[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=""  //[ORDERS]Company Code
																	[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""  // [ORDER ITEMS]Order Code
																	[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
																	[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_AddToCurrentStockID
																	[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																	If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>=$_r_ToUnAllocatFREE)
																		[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_ToUnAllocatFREE
																	Else 
																		[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
																	End if 
																	STK_SetCreatedStockItem(-1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; 0; 0)
																	[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
																	[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
																	[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=[ORDER_ITEMS:25]Item_Number:27
																	
																	$_r_ToUnAllocatFREE:=$_r_ToUnAllocatFREE-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																	$_d_StockItemsHeaderDateWAS:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
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
																		If ($_d_StockItemsHeaderDateWAS=!00-00-00!)
																			$_d_StockItemsHeaderDateWAS:=Current date:C33(*)
																		End if 
																		If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#0)
																			[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=Cat_ConvertValue([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENTS:40]Currency_Code:10; $_d_StockItemsHeaderDateWAS)
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
																End if 
															End for 
															
														End if 
														If (Size of array:C274($_al_OnOrderIDStoFreeUp)>0)
															READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
															For ($_l_UnallocateIndex; 1; Size of array:C274($_al_OnOrderIDStoFreeUp))
																QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_OnOrderIDStoFreeUp{$_l_UnallocateIndex})
																[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
																[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
																//TRACE
																//Test this adjusts the correct current stock records as we have taken off hte item number!!!
																DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
																UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
																$_bo_UnallocatedFromOnOrder:=True:C214
															End for 
															READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
															
														End if 
														
														
														
														OrderI_Una2
														DB_SaveRecord(->[ORDER_ITEMS:25])
														
													Else 
														Gen_Alert("Invoiced items may not be un-allocated")
													End if 
													NEXT RECORD:C51([ORDER_ITEMS:25])
												End while 
												READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
												[STOCK_MOVEMENTS:40]Total_Cost:8:=Round:C94(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
												
												If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
													DB_SaveRecord(->[STOCK_MOVEMENTS:40])
													
												Else 
													If ($_bo_UnallocatedFromOnOrder)
														OK:=1
													Else 
														OK:=0
													End if 
												End if 
												If (OK=1)
													Transact_End
													//QUERY([STOCK ITEMS];[STOCK ITEMS]Movement Code=[STOCK MOVEMENTS]Movement Code)
													//QUERY SELECTION([STOCK ITEMS];[STOCK ITEMS]X_CopiedFromID>0)
													//STK_MenuUpdate ("Stock items";[STOCK ITEMS]Product Code;True)
													
												Else 
													Transact_End
													Gen_Alert("No Unallocations have been carried out"; "OK")
													FIRST RECORD:C50([ORDER_ITEMS:25])
													[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
													DB_SaveRecord(->[ORDER_ITEMS:25])
													
													
												End if 
												If (Size of array:C274($_al_ForceRecalcMovementItemIDS)>0)
													If (False:C215)  //THis should not be needed
														//For ($i;1;Size of array($_al_ForceRecalcMovementItemIDS))
														//QUERY([STOCK_MOVEMENT_ITEMS];[STOCK_MOVEMENT_ITEMS]x_ID=$_al_ForceRecalcMovementItemIDS{$i})
														//STK_UpdateCalledOffQuantity
														//DB_SaveRecord (->[STOCK_MOVEMENT_ITEMS];False)
														//End for
													End if 
												End if 
												
												READ ONLY:C145([STOCK_MOVEMENTS:40])
												READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
												READ ONLY:C145([CURRENT_STOCK:62])
												READ ONLY:C145([STOCK_LEVELS:58])
												UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
												UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
												UNLOAD RECORD:C212([CURRENT_STOCK:62])
												UNLOAD RECORD:C212([STOCK_LEVELS:58])
											Else 
												
											End if 
										Else 
											Gen_Alert("This product has not had stock setup completed. Please complete this before unallocation  of stock")
										End if 
									End if 
									
									//OK:=1
									
									Orders_InLPOI(vAB)
									USE NAMED SELECTION:C332("$Temp")
									USE NAMED SELECTION:C332("$Allocated")
									$_l_RecordsInSelectionMI:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
									ARRAY TEXT:C222($_at_ProductCodes; 0)
									
									For ($_l_RecordsIndex; 1; $_l_RecordsInSelectionMI)
										USE NAMED SELECTION:C332("$Allocated")
										GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_RecordsIndex)
										$_l_ProductCodeRow:=Find in array:C230($_at_ProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
										If ($_l_ProductCodeRow<0)
											APPEND TO ARRAY:C911($_at_ProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
											//STK_MenuUpdate ("Stock items";[STOCK ITEMS]Product Code;True)
										End if 
									End for 
									Orders_InLPß("S1")
									
									//````````
									
									
									
									
								Else 
									Gen_Alert("The selected records may not have stock un-allocated from them.")
								End if 
							Else 
								Gen_Alert("You have not selected any items to unallocate!")
								
							End if 
						End if 
						USE NAMED SELECTION:C332("$Temp")
						If ($_bo_Reselect)
							HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
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
		
		//$RevertSetting:=ORD_SetSelectable ($RevertSetting)
	Else 
		Gen_Alert("This function can only be used when viewing order items")
		
	End if 
	
Else 
	Gen_Alert("This Function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("OrderI_UnaAut"; $_t_oldMethodName)
