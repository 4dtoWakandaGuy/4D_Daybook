//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPDel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2010 19:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vAdd)
	//C_UNKNOWN(vDelDate)
	//C_UNKNOWN(vDoDateF)
	//C_UNKNOWN(xNext)
	ARRAY DATE:C224($_ad_DeliveryDates; 0)
	ARRAY DATE:C224($_ad_DistinctDates; 0)
	ARRAY DATE:C224($_ad_SalesOrderItemDeliveryDates; 0)
	//ARRAY DATE(STK_ad_aDeliveryDates1;0)
	//ARRAY DATE(STK_at_COnDeliveryDates;0)
	ARRAY LONGINT:C221($_al_AllocatableItems; 0)
	ARRAY LONGINT:C221($_al_AllocatedItems; 0)
	ARRAY LONGINT:C221($_al_DeliveredItems; 0)
	ARRAY LONGINT:C221($_al_ItemNumbers; 0)
	ARRAY LONGINT:C221($_al_MovementSOItemNumbers; 0)
	ARRAY LONGINT:C221($_al_NonAllocatedItems; 0)
	ARRAY LONGINT:C221($_al_PartDeliveredOrderItems; 0)
	ARRAY LONGINT:C221($_al_SalesOrderItems; 0)
	ARRAY LONGINT:C221($_al_UNAllocatedItems; 0)
	ARRAY LONGINT:C221($_al_UNDeliveredItems; 0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(STK_al_aStockItems;0)
	//ARRAY LONGINT(STK_al_CHooseElement;0)
	//ARRAY LONGINT(STK_al_deliveredOrderItems;0)
	//ARRAY LONGINT(STK_al_DeliveryDateChoose;0)
	//ARRAY LONGINT(STK_al_DelOrderitems;0)
	//ARRAY LONGINT(STK_al_UNdeliveredOrderItems;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	ARRAY REAL:C219($_ar_AllocatedQuantities; 0)
	ARRAY REAL:C219($_ar_AllocationQuantities; 0)
	ARRAY REAL:C219($_ar_AllocationsDelivered; 0)
	ARRAY REAL:C219($_ar_DeliveredQuantities; 0)
	ARRAY REAL:C219($_ar_ItemQuantities; 0)
	ARRAY REAL:C219($_ar_NeedsAllocation; 0)
	ARRAY REAL:C219($_ar_QuantityAllocated; 0)
	ARRAY REAL:C219($_ar_ResidualStockQuantity; 0)
	ARRAY REAL:C219($_ar_SalesOrderAllocatedQuantity; 0)
	ARRAY REAL:C219($_ar_SalesOrderDeliveredQuantity; 0)
	ARRAY REAL:C219($_ar_salesOrderQuantities; 0)
	ARRAY REAL:C219($_ar_TotalDelivered; 0)
	ARRAY REAL:C219($_ar_UNAllocatedQuantities; 0)
	ARRAY REAL:C219($_ar_UndeliveredQuantities; 0)
	//ARRAY REAL(STK_ar_deliveredQuanties;0)
	//ARRAY REAL(STK_ar_DeliveryQuantities;0)
	//ARRAY REAL(STK_ar_UNdeliveredQuanties;0)
	ARRAY TEXT:C222($_at_AllocationMovementTypes; 0)
	ARRAY TEXT:C222($_at_DelANDAllocateMovementTypes; 0)
	ARRAY TEXT:C222($_at_DeliveryMovementTypes; 0)
	ARRAY TEXT:C222($_at_DeliveryReferences; 0)
	ARRAY TEXT:C222($_at_IncomingMovementTypes; 0)
	ARRAY TEXT:C222($_at_LocationProductCodes; 0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_SelectReferences; 0)
	ARRAY TEXT:C222($_at_StockMovementTypes; 0)
	ARRAY TEXT:C222($_at_UNAllocationMovementTypes; 0)
	//ARRAY TEXT(STK_at_aallDeliveryReferences;0)
	//ARRAY TEXT(STK_at_AllocationAds;0)
	//ARRAY TEXT(STK_at_allocationMovement;0)
	//ARRAY TEXT(STK_At_ConDeliveryReference;0)
	//ARRAY TEXT(STK_at_CONOrderCodes;0)
	//ARRAY TEXT(STK_at_DeliveryDatesChoose;0)
	//ARRAY TEXT(STK_at_OrderCodes;0)
	//ARRAY TEXT(STK_at_POAds;0)
	//ARRAY TEXT(STK_at_POMovement;0)
	//ARRAY TEXT(STK_at_SelectDeliveries;0)
	//ARRAY TEXT(STK_at_unAllocationAds;0)
	//ARRAY TEXT(STK_at_unallocationMovement;0)
	C_BOOLEAN:C305(<>SYS_bo_OrderItemPartDelivery; $_bo_AddNewDateChoice; $_bo_AddNewDateOption; $_bo_AllocationRequired; $_bo_CheckAllocationIsDone; $_bo_Continue; $_bo_NotUnique; $_bo_Print; $_bo_PrintDateSet; $_bo_Reselect; $_bo_Selected)
	C_BOOLEAN:C305($_bo_UseISO; $2; SR_bo_Validated; STK_bo_AllocTypesKnown; STK_bo_Create; STK_bo_PrintExisting; <>SYS_bo_OrderItemPartDelivery; $_bo_AddNewDateChoice; $_bo_AddNewDateOption; $_bo_AllocationRequired; $_bo_CheckAllocationIsDone)
	C_BOOLEAN:C305($_bo_Continue; $_bo_NotUnique; $_bo_Print; $_bo_PrintDateSet; $_bo_Reselect; $_bo_Selected; $_bo_UseISO; SR_bo_Validated; STK_bo_AllocTypesKnown; STK_bo_Create; STK_bo_PrintExisting)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_DeliveryDateOLD; $_d_NewDeliveryDate; STK_d_DeliveryDate; vDelDate; vDoDateF; <>DB_d_CurrentDate; $_d_DeliveryDateOLD; $_d_NewDeliveryDate; STK_d_DeliveryDate)
	C_LONGINT:C283($_l_AddMode2; $_l_AllocateIndex; $_l_AllocationIndex; $_l_CanAllocate; $_l_CheckAllocationIndex; $_l_CheckPreviousIndex; $_l_ChosenElement; $_l_DelAllocateIndex; $_l_DeliveredOrderItemRow; $_l_DeliveredOrderRow; $_l_DeliverItemRow)
	C_LONGINT:C283($_l_DeliverItemRow2; $_l_DeliverItemsRow; $_l_DeliveryDateRow; $_l_DeliveryReference; $_l_DeliveryRow; $_l_EmptyDeliveryDateRow; $_l_IsAlloc; $_l_IsAllocatedIndex; $_l_ItemNumberRow; $_l_MovementTypeRow; $_l_Option)
	C_LONGINT:C283($_l_OrderItemRow; $_l_OrderItemsIndex; $_l_PartDeliveryIndex; $_l_Printed; $_l_ReprintRow; $_l_TableRow; ORD_l_CB_Delivery; vAdd; xNext; $_l_AddMode2; $_l_AllocateIndex)
	C_LONGINT:C283($_l_AllocationIndex; $_l_CanAllocate; $_l_CheckAllocationIndex; $_l_CheckPreviousIndex; $_l_ChosenElement; $_l_DelAllocateIndex; $_l_DeliveredOrderItemRow; $_l_DeliveredOrderRow; $_l_DeliverItemRow; $_l_DeliverItemRow2; $_l_DeliverItemsRow)
	C_LONGINT:C283($_l_DeliveryDateRow; $_l_DeliveryReference; $_l_DeliveryRow; $_l_EmptyDeliveryDateRow; $_l_IsAllocatedIndex; $_l_ItemNumberRow; $_l_MovementTypeRow; $_l_Option; $_l_OrderItemRow; $_l_OrderItemsIndex; $_l_PartDeliveryIndex)
	C_LONGINT:C283($_l_Printed; $_l_ReprintRow; $_l_TableRow; ORD_l_CB_Delivery)
	C_POINTER:C301($_ptr_HighlightSet; $_ptr_ListBoxSetup; BUT_p_ButtonStringPointer; $_ptr_HighlightSet; $_ptr_ListBoxSetup; BUT_p_ButtonStringPointer)
	C_REAL:C285($_r_Allocated; $_r_AlreadySelected; $_r_Available; $_r_Sum2; $_r_ToAllocate; $_r_Allocated; $_r_AlreadySelected; $_r_Available; $_r_Sum2; $_r_ToAllocate)
	C_TEXT:C284($_t_AllocateResult; $_t_CurrentFormUsage2; $_t_CurrentWindowTitle; $_t_DateString; $_t_DeliveryMovementType; $_t_DocumentName; $_t_HighlightSetName; $_t_MovementType; $_t_oldMethodName; $_t_SelectionType; $1)
	C_TEXT:C284($3; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; STK_T_DeliveryOrder; STK_T_DeliveryReference; STK_T_PrintExisting; $_t_AllocateResult; $_t_CurrentFormUsage2; $_t_CurrentWindowTitle; $_t_DateString; $_t_DeliveryMovementType)
	C_TEXT:C284($_t_DocumentName; $_t_HighlightSetName; $_t_MovementType; $_t_oldMethodName; $_t_SelectionType; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; STK_T_DeliveryOrder; STK_T_DeliveryReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPDel2"; Form event code:C388)
SR_bo_Validated:=False:C215
ORD_DeliveryDatePrefs
$_l_AddMode2:=vAdd
If ((DB_GetModuleSettingByNUM(Module_SalesOrders))<2)
	
	Gen_Alert("You do not have access to Sales Order Processing"; "Cancel")
Else 
	Case of 
			
		: (BUT_p_ButtonStringPointer->="OI@")  //Output Items
			
			If (True:C214)
				Gen_Alert("Currently please print from within a sales order")
				
			Else 
				If (Orders_PPOut1(True:C214))
					If (Gen_PPChkSt(->[ORDERS:24]State:15; 6))
						If (Orders_PPChCo)
							If (Gen_PPCreditChk(->[ORDERS:24]Company_Code:1; ->[CREDIT_STAGES:54]Prevent_Deliver:8; "Delivered"))
								$_bo_PrintDateSet:=False:C215
								If ((DB_t_CurrentFormUsage2="Date") | (DB_t_CurrentFormUsage2="All"))  // section modifed NG 10/12/2002
									
									//user has selected to print by date
									If (Records in set:C195("USER SET")>0)
										USE SET:C118("USER SET")
										$_l_Option:=1
									Else 
										$_l_Option:=0
									End if 
									If ($_l_Option=1) | ($_l_Option=0)  //user selected records
										
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
										SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationMovementTypes)
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
										SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UnAllocationMovementTypes)
										ARRAY DATE:C224($_ad_DeliveryDates; 0)
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
										//Here is there area multiple Types; user must selecti!
										SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_DeliveryMovementTypes)
										SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_ItemNumbers; [ORDER_ITEMS:25]Quantity:3; $_ar_ItemQuantities; [ORDER_ITEMS:25]Allocated:28; $_ar_QuantityAllocated; [ORDER_ITEMS:25]Product_Code:2; $_at_ProductCodes)
										QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_ItemNumbers)
										COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$SOStockItems")
										QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationMovementTypes)
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_AllocatedItems; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_AllocatedQuantities)
										USE NAMED SELECTION:C332("$SOStockItems")
										QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_UnAllocationMovementTypes)
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_UNAllocatedItems; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_UNAllocatedQuantities)
										ARRAY LONGINT:C221($_al_NonAllocatedItems; 0)
										For ($_l_IsAllocatedIndex; 1; Size of array:C274($_al_ItemNumbers))
											If (Find in array:C230($_al_AllocatedItems; $_al_ItemNumbers{$_l_IsAllocatedIndex})<0)
												If ($_ar_QuantityAllocated{$_l_IsAllocatedIndex}<$_ar_ItemQuantities{$_l_IsAllocatedIndex})
													QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_ProductCodes{$_l_IsAllocatedIndex})
													If ([PRODUCTS:9]Maintain_Stock:14) & ((DB_GetModuleSettingByNUM(Module_StockControl))>0)
														
														APPEND TO ARRAY:C911($_al_NonAllocatedItems; $_al_ItemNumbers{$_l_IsAllocatedIndex})
													End if 
												End if 
											Else 
												$_r_Allocated:=0
												For ($_l_AllocationIndex; 1; Size of array:C274($_al_AllocatedItems))
													If ($_al_AllocatedItems{$_l_AllocationIndex}=$_al_ItemNumbers{$_l_IsAllocatedIndex})
														$_r_Allocated:=$_r_Allocated+$_ar_AllocatedQuantities{$_l_AllocationIndex}
													End if 
												End for 
												For ($_l_AllocationIndex; 1; Size of array:C274($_al_UNAllocatedItems))
													If ($_al_UNAllocatedItems{$_l_AllocationIndex}=$_al_ItemNumbers{$_l_IsAllocatedIndex})
														$_r_Allocated:=$_r_Allocated-$_ar_UNAllocatedQuantities{$_l_AllocationIndex}
													End if 
												End for 
												If ($_r_Allocated<$_ar_ItemQuantities{$_l_IsAllocatedIndex})
													APPEND TO ARRAY:C911($_al_NonAllocatedItems; $_al_ItemNumbers{$_l_IsAllocatedIndex})
												End if 
											End if 
											
										End for 
										
										
										USE NAMED SELECTION:C332("$SOStockItems")
										QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_DeliveryMovementTypes)
										If (Size of array:C274($_al_NonAllocatedItems)>0)
											ARRAY TEXT:C222($_at_DelANDAllocateMovementTypes; 0)
											For ($_l_DelAllocateIndex; 1; Size of array:C274($_at_DeliveryMovementTypes))
												If (Find in array:C230($_at_AllocationMovementTypes; $_at_DeliveryMovementTypes{$_l_DelAllocateIndex})>0)
													APPEND TO ARRAY:C911($_at_DelANDAllocateMovementTypes; $_at_DeliveryMovementTypes{$_l_DelAllocateIndex})
												End if 
											End for 
											If (Size of array:C274($_at_DelANDAllocateMovementTypes)=0)
												Gen_Confirm("Some items seleected for delivery have not had stock allocated, would you like to allocate them now?"; "Yes"; "No")
												If (OK=1)
													//allocate stock to those items then re-asses them to make sure stock it allocated
													For ($_l_AllocateIndex; 1; Size of array:C274($_al_NonAllocatedItems))
														QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_NonAllocatedItems{$_l_AllocateIndex})
														If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
															QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
														End if 
														If (Gen_PPChkStSing(->[ORDERS:24]State:15; 4))
															$_t_AllocateResult:=OrderI_AllocAu2
															If ($_t_AllocateResult="None")
																Gen_Confirm("Order Code "+[ORDERS:24]Order_Code:3+" Order Item "+String:C10([ORDER_ITEMS:25]Item_Number:27)+" Product ("+[ORDER_ITEMS:25]Product_Code:2+"), has not had stock allocated, Do you wish to continue with this delivery"; "No"; "Yes")
																If (OK=0)
																	$_bo_Continue:=False:C215
																	$_l_AllocateIndex:=999999
																Else 
																	$_l_ItemNumberRow:=Find in array:C230($_al_ItemNumbers; [ORDER_ITEMS:25]Item_Number:27)
																	If ($_l_ItemNumberRow>0)  //it better be!!!)
																		
																		DELETE FROM ARRAY:C228($_al_ItemNumbers; $_l_ItemNumberRow)
																		DELETE FROM ARRAY:C228($_ar_ItemQuantities; $_l_ItemNumberRow)
																		DELETE FROM ARRAY:C228($_ar_QuantityAllocated; $_l_ItemNumberRow)
																		DELETE FROM ARRAY:C228($_at_ProductCodes; $_l_ItemNumberRow)
																		
																	End if 
																End if 
															Else 
																$_l_ItemNumberRow:=Find in array:C230($_al_ItemNumbers; [ORDER_ITEMS:25]Item_Number:27)
																If ($_l_ItemNumberRow>0)  //it better be!!!)
																	
																	$_ar_QuantityAllocated{$_l_ItemNumberRow}:=[ORDER_ITEMS:25]Allocated:28
																End if 
															End if 
														Else 
															Gen_Confirm("Order Code "+[ORDERS:24]Order_Code:3+" Order Item "+String:C10([ORDER_ITEMS:25]Item_Number:27)+" Product ("+[ORDER_ITEMS:25]Product_Code:2+"), is not ready for stock allocation or delivery , Do you wish to continue with this delivery"; "No"; "Yes")
															If (OK=0)
																$_bo_Continue:=False:C215
																$_l_AllocateIndex:=999999
															Else 
																$_l_ItemNumberRow:=Find in array:C230($_al_ItemNumbers; [ORDER_ITEMS:25]Item_Number:27)
																If ($_l_ItemNumberRow>0)  //it better be!!!)
																	
																	DELETE FROM ARRAY:C228($_al_ItemNumbers; $_l_ItemNumberRow)
																	DELETE FROM ARRAY:C228($_ar_ItemQuantities; $_l_ItemNumberRow)
																	DELETE FROM ARRAY:C228($_ar_QuantityAllocated; $_l_ItemNumberRow)
																	DELETE FROM ARRAY:C228($_at_ProductCodes; $_l_ItemNumberRow)
																	
																End if 
															End if 
														End if 
													End for 
													
												Else 
													Gen_Confirm("Do you wish to create a delivery for the items that have been allocated?"; "No"; "Yes")
													If (OK=1)
														$_bo_Continue:=False:C215
													Else 
														//Take the non allocated Items_Out of the delivery
														For ($_l_AllocateIndex; 1; Size of array:C274($_al_NonAllocatedItems))
															If (OK=0)
																$_bo_Continue:=False:C215
																$_l_AllocateIndex:=999999
															Else 
																$_l_ItemNumberRow:=Find in array:C230($_al_ItemNumbers; $_al_NonAllocatedItems{$_l_AllocateIndex})
																
																If ($_l_ItemNumberRow>0)  //it better be!!!)
																	
																	DELETE FROM ARRAY:C228($_al_ItemNumbers; $_l_ItemNumberRow)
																	DELETE FROM ARRAY:C228($_ar_ItemQuantities; $_l_ItemNumberRow)
																	DELETE FROM ARRAY:C228($_ar_QuantityAllocated; $_l_ItemNumberRow)
																	DELETE FROM ARRAY:C228($_at_ProductCodes; $_l_ItemNumberRow)
																	
																End if 
															End if 
														End for 
													End if 
												End if 
												
											Else 
												//When we deliver we allocate so the delivery is an allocation?-so we need to check there is allocatable stock for these items
												QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]UseForStockReceipt:33=True:C214)
												SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_IncomingMovementTypes)
												ARRAY LONGINT:C221($_al_AllocatableItems; 0)
												ARRAY REAL:C219($_ar_AllocationQuantities; 0)
												ARRAY TEXT:C222($_at_LocationProductCodes; 0)
												For ($_l_CanAllocate; Size of array:C274($_at_ProductCodes); 1; -1)
													$_r_ToAllocate:=$_ar_ItemQuantities{$_l_CanAllocate}-$_ar_QuantityAllocated{$_l_CanAllocate}
													If ($_r_ToAllocate>0)
														$_r_AlreadySelected:=0
														For ($_l_CheckPreviousIndex; 1; Size of array:C274($_at_LocationProductCodes))
															If ($_at_LocationProductCodes{$_l_CheckPreviousIndex}=$_at_ProductCodes{$_l_CanAllocate})
																$_r_AlreadySelected:=$_r_AlreadySelected+$_ar_AllocationQuantities{$_l_CheckPreviousIndex}
															End if 
															
														End for 
														QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_ProductCodes{$_l_CanAllocate})
														If ([PRODUCTS:9]Maintain_Stock:14) & ((DB_GetModuleSettingByNUM(Module_StockControl))>0)
															
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_CanAllocate}; *)
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
															QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
															QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_IncomingMovementTypes)
															//Here we should use the current logged in persons stock location.
															$_r_Available:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
															$_r_Available:=$_r_Available-$_r_AlreadySelected
															If ($_r_Available>0)
																APPEND TO ARRAY:C911($_al_AllocatableItems; $_al_ItemNumbers{$_l_CanAllocate})
																If ($_r_Available<$_r_ToAllocate)
																	APPEND TO ARRAY:C911($_ar_AllocationQuantities; $_r_Available)
																Else 
																	APPEND TO ARRAY:C911($_ar_AllocationQuantities; $_r_ToAllocate)
																End if 
																APPEND TO ARRAY:C911($_at_LocationProductCodes; $_at_ProductCodes{$_l_CanAllocate})
															Else 
																QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_NonAllocatedItems{$_l_CanAllocate})
																If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
																	QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
																End if 
																Gen_Confirm("Order Code "+[ORDERS:24]Order_Code:3+" Order Item "+String:C10([ORDER_ITEMS:25]Item_Number:27)+" Product ("+[ORDER_ITEMS:25]Product_Code:2+"), there is no stock to allocate/delivery do you want to continue with this delivery"; "No"; "Yes")
																If (OK=0)
																	$_bo_Continue:=False:C215
																	$_l_CanAllocate:=999999
																Else 
																	DELETE FROM ARRAY:C228($_al_ItemNumbers; $_l_CanAllocate)
																	DELETE FROM ARRAY:C228($_ar_ItemQuantities; $_l_CanAllocate)
																	DELETE FROM ARRAY:C228($_ar_QuantityAllocated; $_l_CanAllocate)
																	DELETE FROM ARRAY:C228($_at_ProductCodes; $_l_CanAllocate)
																	
																	
																End if 
															End if 
														Else 
															//we can deliver this one we dont maintian stock
															APPEND TO ARRAY:C911($_al_AllocatableItems; $_al_ItemNumbers{$_l_CanAllocate})
															APPEND TO ARRAY:C911($_ar_AllocationQuantities; $_r_ToAllocate)
															APPEND TO ARRAY:C911($_at_LocationProductCodes; $_at_ProductCodes{$_l_CanAllocate})
														End if 
													Else 
														//we can deliver this one its allocated
														APPEND TO ARRAY:C911($_al_AllocatableItems; $_al_ItemNumbers{$_l_CanAllocate})
														APPEND TO ARRAY:C911($_ar_AllocationQuantities; 0)
														APPEND TO ARRAY:C911($_at_LocationProductCodes; $_at_ProductCodes{$_l_CanAllocate})
													End if 
												End for 
												If ($_bo_Continue)
													For ($_l_CheckAllocationIndex; Size of array:C274($_al_AllocatableItems); 1; -1)
													End for 
													
													QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_AllocatableItems)
													SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_ItemNumbers; [ORDER_ITEMS:25]Quantity:3; $_ar_ItemQuantities; [ORDER_ITEMS:25]Allocated:28; $_ar_QuantityAllocated; [ORDER_ITEMS:25]Product_Code:2; $_at_ProductCodes)
													QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_ItemNumbers)
													COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$SOStockItems")
													
													
												End if 
											End if 
											USE NAMED SELECTION:C332("$SOStockItems")
											QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_DeliveryMovementTypes)
											$_bo_Continue:=False:C215
											If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)  //At least some of these lines have been delivered
												
												DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45; $_at_DeliveryReferences)
												
												SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45; STK_at_aallDeliveryReferences; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; STK_ad_aDeliveryDates1; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; STK_al_aStockItems; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; STK_al_DelOrderitems; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; STK_ar_DeliveryQuantities; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3; STK_at_OrderCodes)
												ARRAY LONGINT:C221(STK_al_deliveredOrderItems; 0)
												ARRAY REAL:C219(STK_ar_deliveredQuanties; 0)
												For ($_l_AllocationIndex; 1; Size of array:C274($_al_ItemNumbers))
													$_l_DeliverItemRow:=Find in array:C230(STK_al_DelOrderitems; $_al_ItemNumbers{$_l_AllocationIndex})
													If ($_l_DeliverItemRow>0)
														//This is a delivered Item
														$_l_DeliverItemRow2:=Find in array:C230(STK_al_deliveredOrderItems; $_al_ItemNumbers{$_l_AllocationIndex})
														If ($_l_DeliverItemRow2<0)
															APPEND TO ARRAY:C911(STK_al_deliveredOrderItems; $_al_ItemNumbers{$_l_AllocationIndex})
															APPEND TO ARRAY:C911(STK_ar_deliveredQuanties; STK_ar_DeliveryQuantities{$_l_AllocationIndex})
														Else 
															STK_ar_deliveredQuanties{$_l_DeliverItemRow2}:=STK_ar_deliveredQuanties{$_l_DeliverItemRow}+STK_ar_DeliveryQuantities{$_l_AllocationIndex}
														End if 
													End if 
												End for 
												ARRAY LONGINT:C221(STK_al_UNdeliveredOrderItems; 0)
												ARRAY REAL:C219(STK_ar_UNdeliveredQuanties; 0)
												For ($_l_AllocationIndex; 1; Size of array:C274($_al_ItemNumbers))
													$_l_DeliverItemRow:=Find in array:C230(STK_al_DelOrderitems; $_al_ItemNumbers{$_l_AllocationIndex})
													If ($_l_DeliverItemRow<0)
														APPEND TO ARRAY:C911(STK_al_UNdeliveredOrderItems; $_al_ItemNumbers{$_l_AllocationIndex})
														APPEND TO ARRAY:C911(STK_ar_UNdeliveredQuanties; $_ar_ItemQuantities{$_l_AllocationIndex})
													Else 
														$_l_DeliverItemRow:=Find in array:C230(STK_al_deliveredOrderItems; $_al_ItemNumbers{$_l_AllocationIndex})
														If ($_l_DeliverItemRow>0)  //it should be
															
															If (STK_ar_deliveredQuanties{$_l_DeliverItemRow}<$_ar_ItemQuantities{$_l_AllocationIndex})
																//we have not deliverd the whole order item
																APPEND TO ARRAY:C911(STK_al_UNdeliveredOrderItems; $_al_ItemNumbers{$_l_AllocationIndex})
																APPEND TO ARRAY:C911(STK_ar_UNdeliveredQuanties; $_ar_ItemQuantities{$_l_AllocationIndex}-STK_ar_deliveredQuanties{$_l_DeliverItemRow})
															End if 
														End if 
													End if 
												End for 
												ARRAY TEXT:C222(STK_at_SelectDeliveries; 0)
												ARRAY TEXT:C222(STK_At_ConDeliveryReference; 0)
												ARRAY DATE:C224(STK_at_COnDeliveryDates; 0)
												ARRAY TEXT:C222(STK_at_CONOrderCodes; 0)
												For ($_l_AllocationIndex; 1; Size of array:C274(STK_at_aallDeliveryReferences))
													If (STK_at_aallDeliveryReferences{$_l_AllocationIndex}="")
														//This delivery has no reference so we use the order code
														$_l_DeliveredOrderRow:=Find in array:C230(STK_at_SelectDeliveries; STK_at_OrderCodes{$_l_AllocationIndex}+"("+String:C10(STK_ad_aDeliveryDates1{$_l_AllocationIndex})+")"+" Reprint")
														If ($_l_DeliveredOrderRow<0)
															APPEND TO ARRAY:C911(STK_at_SelectDeliveries; STK_at_OrderCodes{$_l_AllocationIndex}+"("+String:C10(STK_ad_aDeliveryDates1{$_l_AllocationIndex})+")"+" Reprint")
															APPEND TO ARRAY:C911(STK_At_ConDeliveryReference; STK_at_aallDeliveryReferences{$_l_AllocationIndex})
															APPEND TO ARRAY:C911(STK_at_COnDeliveryDates; STK_ad_aDeliveryDates1{$_l_AllocationIndex})
															APPEND TO ARRAY:C911(STK_at_CONOrderCodes; STK_at_OrderCodes{$_l_AllocationIndex})
														End if 
													Else 
														$_l_DeliveredOrderRow:=Find in array:C230(STK_at_SelectDeliveries; STK_at_aallDeliveryReferences{$_l_AllocationIndex}+"("+String:C10(STK_ad_aDeliveryDates1{$_l_AllocationIndex})+")"+" Reprint")
														If ($_l_DeliveredOrderRow<0)
															APPEND TO ARRAY:C911(STK_at_SelectDeliveries; STK_at_aallDeliveryReferences{$_l_AllocationIndex}+"("+String:C10(STK_ad_aDeliveryDates1{$_l_AllocationIndex})+")"+" Reprint")
															APPEND TO ARRAY:C911(STK_At_ConDeliveryReference; STK_at_aallDeliveryReferences{$_l_AllocationIndex})
															APPEND TO ARRAY:C911(STK_at_COnDeliveryDates; STK_ad_aDeliveryDates1{$_l_AllocationIndex})
															APPEND TO ARRAY:C911(STK_at_CONOrderCodes; STK_at_OrderCodes{$_l_AllocationIndex})
														End if 
													End if 
												End for 
												
												If (Size of array:C274(STK_al_UNdeliveredOrderItems)>0)
													APPEND TO ARRAY:C911(STK_at_SelectDeliveries; "-")
													APPEND TO ARRAY:C911(STK_at_SelectDeliveries; "New Delivery for undelivered Items")
												End if 
												ARRAY LONGINT:C221(STK_al_CHooseElement; 0)
												ARRAY LONGINT:C221(STK_al_CHooseElement; Size of array:C274(STK_at_SelectDeliveries))
												For ($_l_AllocationIndex; 1; Size of array:C274(STK_at_SelectDeliveries))
													STK_al_CHooseElement{$_l_AllocationIndex}:=$_l_AllocationIndex
												End for 
												
												$_l_ChosenElement:=GEN_RequestViaPopUp(->STK_at_SelectDeliveries; ->STK_al_CHooseElement; "Select Delivery to Print"; False:C215; ->STK_bo_Create; "Stop"; "Continue")
												If ($_l_ChosenElement>0)
													If ($_l_ChosenElement<=Size of array:C274(STK_at_CONOrderCodes))
														STK_bo_PrintExisting:=True:C214
														STK_T_DeliveryReference:=STK_At_ConDeliveryReference{$_l_ChosenElement}
														STK_T_DeliveryOrder:=STK_at_CONOrderCodes{$_l_ChosenElement}
														STK_d_DeliveryDate:=STK_at_COnDeliveryDates{$_l_ChosenElement}
														$_bo_Continue:=True:C214
													Else 
														
														STK_T_DeliveryReference:=""
														STK_T_DeliveryOrder:=""
														STK_d_DeliveryDate:=!00-00-00!
														$_bo_Continue:=True:C214
														$_d_NewDeliveryDate:=Gen_RequestDate("Set Delivery Date"; Is date:K8:7; Current date:C33; "Continue"; "Stop")
														
														If (OK=1)
															If ($_d_NewDeliveryDate#!00-00-00!)
																$_bo_Continue:=True:C214
																STK_bo_PrintExisting:=False:C215
																STK_T_DeliveryReference:=""
																STK_T_DeliveryOrder:=""
																STK_d_DeliveryDate:=$_d_NewDeliveryDate
															Else 
																Gen_Alert("Delivery not printing has been cancelled-no delivery date entered")
																$_bo_Continue:=False:C215
															End if 
														Else 
															OK:=1
															$_bo_Continue:=False:C215
														End if 
													End if 
												Else 
													$_bo_Continue:=False:C215
												End if 
											Else 
												DISTINCT VALUES:C339([ORDER_ITEMS:25]Delivery_Date:11; $_ad_DeliveryDates)
												$_l_EmptyDeliveryDateRow:=Find in array:C230($_ad_DeliveryDates; !00-00-00!)
												If ($_l_EmptyDeliveryDateRow>0)
													DELETE FROM ARRAY:C228($_ad_DeliveryDates; $_l_EmptyDeliveryDateRow)
													$_bo_AddNewDateOption:=True:C214
												End if 
												Case of 
													: (Size of array:C274($_ad_DeliveryDates)>1)
														ARRAY TEXT:C222(STK_at_DeliveryDatesChoose; 0)
														ARRAY LONGINT:C221(STK_al_DeliveryDateChoose; 0)
														For ($_l_AllocationIndex; 1; Size of array:C274($_ad_DeliveryDates))
															APPEND TO ARRAY:C911(STK_at_DeliveryDatesChoose; String:C10($_ad_DeliveryDates{$_l_AllocationIndex}))
															APPEND TO ARRAY:C911(STK_al_DeliveryDateChoose; $_l_AllocationIndex)
														End for 
														If ($_bo_AddNewDateOption)
															APPEND TO ARRAY:C911(STK_at_DeliveryDatesChoose; "-")
															APPEND TO ARRAY:C911(STK_al_DeliveryDateChoose; 9998)
															APPEND TO ARRAY:C911(STK_at_DeliveryDatesChoose; "Add New Delivery Date")
															APPEND TO ARRAY:C911(STK_al_DeliveryDateChoose; 9999)
														End if 
														$_l_ChosenElement:=GEN_RequestViaPopUp(->STK_at_DeliveryDatesChoose; ->STK_al_DeliveryDateChoose; "Select Delivery Date to Print"; False:C215; ->STK_bo_Create; "Stop"; "Continue")
														
														If ($_l_ChosenElement>0)
															If (STK_at_DeliveryDatesChoose{$_l_ChosenElement}="Add New Delivery Date")
																$_d_NewDeliveryDate:=Gen_RequestDate("Set Delivery Date"; Is date:K8:7; Current date:C33; "Continue"; "Stop")
																
																If (OK=1)
																	If ($_d_NewDeliveryDate#!00-00-00!)
																		$_bo_Continue:=True:C214
																		STK_bo_PrintExisting:=False:C215
																		STK_T_DeliveryReference:=""
																		STK_T_DeliveryOrder:=""
																		STK_d_DeliveryDate:=$_d_NewDeliveryDate
																	Else 
																		Gen_Alert("Delivery not printing has been cancelled-no delivery date entered")
																		$_bo_Continue:=False:C215
																	End if 
																Else 
																	OK:=1
																	$_bo_Continue:=False:C215
																End if 
															Else 
																$_bo_Continue:=True:C214
																STK_bo_PrintExisting:=True:C214
																STK_T_DeliveryReference:=""
																STK_T_DeliveryOrder:=""
																STK_d_DeliveryDate:=Date:C102(STK_at_DeliveryDatesChoose{$_l_ChosenElement})
																
															End if 
														Else 
															$_bo_Continue:=False:C215
														End if 
														
													: (Size of array:C274($_ad_DeliveryDates)=1)
														$_bo_Continue:=True:C214
														STK_bo_PrintExisting:=True:C214
														STK_T_DeliveryReference:=""
														STK_T_DeliveryOrder:=""
														STK_d_DeliveryDate:=$_ad_DeliveryDates{1}
													Else 
														//No Dates
														$_d_NewDeliveryDate:=Gen_RequestDate("Set Delivery Date"; Is date:K8:7; Current date:C33; "Continue"; "Stop")
														
														If (OK=1)
															If ($_d_NewDeliveryDate#!00-00-00!)
																$_bo_Continue:=True:C214
																STK_bo_PrintExisting:=False:C215
																STK_T_DeliveryReference:=""
																STK_T_DeliveryOrder:=""
																STK_d_DeliveryDate:=$_d_NewDeliveryDate
															Else 
																Gen_Alert("Delivery not printing has been cancelled-no delivery date entered")
																$_bo_Continue:=False:C215
															End if 
														Else 
															OK:=1
															$_bo_Continue:=False:C215
														End if 
														
												End case 
											End if 
											If ($_bo_Continue)
												COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$PrintDeliveryNotes")
												If (STK_T_DeliveryOrder#"")
													QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=STK_T_DeliveryOrder)
												End if 
												DISTINCT VALUES:C339([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
												If (Size of array:C274($_at_DeliveryMovementTypes)>1)
												Else 
													$_t_DeliveryMovementType:=$_at_DeliveryMovementTypes{1}
												End if 
												For ($_l_AllocationIndex; 1; Size of array:C274($_at_OrderCodes))
													USE NAMED SELECTION:C332("$PrintDeliveryNotes")
													QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_at_OrderCodes{$_l_AllocationIndex})
													SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_ItemNumbers)
													
													If (STK_bo_PrintExisting)
														Case of 
															: (STK_T_DeliveryReference#"")
																$_bo_Print:=False:C215
																QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_ItemNumbers)
																QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_DeliveryMovementTypes)
																QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45=STK_T_DeliveryReference)
																SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_ItemNumbers)
																QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_ItemNumbers)
																If (Records in selection:C76([ORDER_ITEMS:25])>0)
																	$_bo_Print:=True:C214
																End if 
															: (STK_d_DeliveryDate#!00-00-00!)
																$_bo_Print:=False:C215
																QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_ItemNumbers)
																QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_DeliveryMovementTypes)
																QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26=STK_d_DeliveryDate)
																SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_ItemNumbers)
																QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_ItemNumbers)
																If (Records in selection:C76([ORDER_ITEMS:25])>0)
																	$_bo_Print:=True:C214
																End if 
															Else 
																$_bo_Print:=False:C215
																
														End case 
														
													Else 
														If (STK_d_DeliveryDate#!00-00-00!)
															$_bo_Print:=False:C215
															ARRAY LONGINT:C221($_al_PartDeliveredOrderItems; 0)
															//ARRAY LONGINT(STK_al_deliveredOrderItems;0)
															//ARRAY REAL(STK_ar_deliveredQuanties;0)
															If (Size of array:C274(STK_al_deliveredOrderItems)>0)
																FIRST RECORD:C50([ORDER_ITEMS:25])
																
																For ($_l_PartDeliveryIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
																	$_l_ItemNumberRow:=Find in array:C230(STK_al_deliveredOrderItems; [ORDER_ITEMS:25]Item_Number:27)
																	If ($_l_ItemNumberRow>0)
																		
																		If (STK_ar_deliveredQuanties{$_l_AllocationIndex}<[ORDER_ITEMS:25]Quantity:3)
																			APPEND TO ARRAY:C911($_al_PartDeliveredOrderItems; [ORDER_ITEMS:25]Item_Number:27)
																		End if 
																	End if 
																End for 
															End if 
															QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11=!00-00-00!)
															If (Size of array:C274($_al_PartDeliveredOrderItems)>0)
																CREATE SET:C116([ORDER_ITEMS:25]; "$P1")
																QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_PartDeliveredOrderItems)
																CREATE SET:C116([ORDER_ITEMS:25]; "$P2")
																UNION:C120("$P1"; "$P2"; "$P1")
																USE SET:C118("$P1")
															End if 
															
															If (Records in selection:C76([ORDER_ITEMS:25])>0)
																DB_lockFile(->[ORDER_ITEMS:25])
																APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11:=STK_d_DeliveryDate)
																AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
																$_bo_Print:=True:C214
															End if 
														Else 
															$_bo_Print:=False:C215
														End if 
													End if 
													If ($_bo_Print)
														If (OK=1) & ($_bo_Selected)
															If ([MOVEMENT_TYPES:60]Type_Code:1#$_t_DeliveryMovementType)
																QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_DeliveryMovementType)
															End if 
															
															SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_DeliveryMovementTypes)
															//COPY NAMED SELECTION([ORDER ITEMS];"$PrintSelection")
															//DISTINCT VALUES([ORDER ITEMS]Order Code;$_at_OrderCodes)
															//For ($_bo_Print;1;Size of array($_at_OrderCodes))
															
															//QUERY SELECTION([ORDER ITEMS];[ORDER ITEMS]Order Code=$_at_OrderCodes{$_bo_Print})
															vDoDateF:=STK_d_DeliveryDate
															If (Not:C34(STK_bo_PrintExisting))
																If ((DB_GetModuleSettingByNUM(Module_StockControl))>0)
																	
																	If ([MOVEMENT_TYPES:60]Alloc_Type:10=False:C215)
																		//Allocation is a seperate movement-we have already established we can allocate the stock
																		//For ($_l_AllocateIndex;1;Records in selection([ORDER ITEMS]))
																		//End for
																		
																	End if 
																	
																	OrdDel_StockP(DB_t_CurrentFormUsage2; [ORDERS:24]Company_Code:1; [ORDERS:24]Currency_Code:32; [ORDERS:24]Analysis_Code:33; [ORDERS:24]Layer_Code:47; [MOVEMENT_TYPES:60]Type_Code:1)
																	
																	
																End if 
															End if 
															//Here we create the stock movement if required
															
															Orders_PPDelSrc
															Orders_PPDel3
															If (OK=1)
																If (Transact_SttLck(->[ORDER_ITEMS:25]Item_Number:27))
																	Gen_PPMulti(->[ORDERS:24]; "Delivery_Note"; "Orders_Out"; "Delivery"; "Delivery_Note"; "Orders_PPDelL2"; 0; ->[ORDERS:24]State:15; "Delivery"; [ORDERS:24]Analysis_Code:33)
																	Transact_End  // 13/05/02 pb
																	
																	If (OK=1)
																		Orders_PPDel4
																	End if 
																End if 
															End if 
														End if 
													End if 
												End for 
												
											End if 
											
											
										Else 
											
											$_bo_Selected:=False:C215
										End if 
										
									Else 
										vDelDate:=!00-00-00!
										OK:=1
									End if 
									
								End if 
							End if 
						End if 
					End if 
				End if 
				Orders_PPOut2
			End if 
			
		: (BUT_p_ButtonStringPointer->="OO@")  //Output Orders`section modified NG 10/12/2002
			
			If (True:C214)
				Gen_Alert("Currently please print from within a sales order")
				
			Else 
				$_bo_PrintDateSet:=False:C215
				Gen_PPMultiCS(->[ORDERS:24]; "Orders_Sel")
				If (OK=1)
					If (Gen_PPChkSt(->[ORDERS:24]State:15; 6))
						//`surely we have
						If (DB_t_CurrentFormUsage2="Date")
							$_t_DateString:=String:C10(<>DB_d_CurrentDate)
							vDeldate:=Date:C102(Gen_Request("Delivery Date to print:"; $_t_DateString))
							$_bo_PrintDateSet:=(VdelDate#!00-00-00!)
						Else 
							vDelDate:=!00-00-00!
						End if 
						vDoDateF:=vDelDate
						If (OK=1)
							QUERY SELECTION BY FORMULA:C207([ORDERS:24]; Orders_PPDelS2)
							If (Records in selection:C76([ORDERS:24])>0)
								Gen_PPMulti(->[ORDERS:24]; "Delivery_Note"; "Orders_Out"; "Delivery"; "Delivery_Note"; "Orders_PPDelL2"; 0; ->[ORDERS:24]State:15; "Delivery"; [ORDERS:24]Analysis_Code:33)
								If (OK=1)
									FIRST RECORD:C50([ORDERS:24])
									$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
									While (Not:C34(End selection:C36([ORDERS:24])))
										DB_t_CurrentFormUsage2:=$_t_CurrentFormUsage2
										COPY NAMED SELECTION:C331([ORDERS:24]; "$ORD")
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
										If ($_bo_PrintDateSet)
											QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11=VDelDate)
										End if 
										Orders_PPDelSrc
										Orders_PPDel4
										//    Orders_PPDel5  `is now in DelL2
										USE NAMED SELECTION:C332("$ORD")
										CLEAR NAMED SELECTION:C333("$ORD")
										NEXT RECORD:C51([ORDERS:24])
									End while 
								End if 
							End if 
						End if 
					End if 
				End if 
				Gen_PPMultiUS("Orders_Sel")
			End if 
		: (BUT_p_ButtonStringPointer->="IO@")  //Input Orders`section modified 10/12/2002 NG
			
			$_bo_PrintDateSet:=False:C215
			If (Count parameters:C259>=1)
				$_t_SelectionType:=$1
			Else 
				$_t_SelectionType:=""
			End if 
			If (In_ButtChkMan(->[ORDERS:24]; "1 3"))
				If (Gen_PPChkStSing(->[ORDERS:24]State:15; 6))
					COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$temp")
					
					Orders_InLPA(False:C215)
					DB_SaveRecord(->[ORDERS:24])
					AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
					
					Orders_InLPß("T")
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
					
					
					
					
					If (Gen_PPCreditChk(->[ORDERS:24]Company_Code:1; ->[CREDIT_STAGES:54]Prevent_Deliver:8; "Delivered"))
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
						//Multiples select here
						$_t_MovementType:=[MOVEMENT_TYPES:60]Type_Code:1
						$_bo_Reselect:=False:C215
						
						$_bo_Continue:=True:C214
						STK_bo_PrintExisting:=False:C215
						STK_T_DeliveryReference:=""
						STK_d_DeliveryDate:=!00-00-00!
						$_bo_CheckAllocationIsDone:=False:C215
						If ($_t_SelectionType#"")
							Case of 
								: ($_t_SelectionType="ALL") | ($_t_SelectionType="Alloc")  // all not delivered"-allocated or not(may require allocation
									
									//TRACE
									SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_SalesOrderItems; [ORDER_ITEMS:25]Quantity:3; $_ar_salesOrderQuantities)
									ARRAY REAL:C219($_ar_TotalDelivered; 0)
									ARRAY REAL:C219($_ar_TotalDelivered; Size of array:C274($_al_SalesOrderItems))
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
									SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_DeliveryMovementTypes)
									QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SalesOrderItems)
									QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_DeliveryMovementTypes)
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
										If (False:C215)  //December 2014 this should not be needed
											READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
											APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; STK_UpdateCalledOffQuantity)
										End if 
										//STK_MenuUpdate ("stock items";[STOCK ITEMS]Product Code;True)
									End if 
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>0)  //Just to filter out any reversed devliries
									
									//once delivered even if returned they were delivered and cant be deliverd again.
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
										//at least some have been delivered
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_DeliveredQuantities; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_DeliveredItems)
										For ($_l_AllocationIndex; 1; Size of array:C274($_ar_DeliveredQuantities))
											$_l_ItemNumberRow:=Find in array:C230($_al_SalesOrderItems; $_al_DeliveredItems{$_l_AllocationIndex})
											If ($_l_ItemNumberRow>0)
												//it should be
												$_ar_TotalDelivered{$_l_ItemNumberRow}:=$_ar_TotalDelivered{$_l_ItemNumberRow}+$_ar_DeliveredQuantities{$_l_AllocationIndex}
											End if 
										End for 
										ARRAY LONGINT:C221($_al_UNDeliveredItems; 0)
										ARRAY REAL:C219($_ar_UndeliveredQuantities; 0)
										For ($_l_AllocationIndex; 1; Size of array:C274($_al_SalesOrderItems))
											If ($_ar_TotalDelivered{$_l_AllocationIndex}<$_ar_salesOrderQuantities{$_l_AllocationIndex})
												APPEND TO ARRAY:C911($_al_UNDeliveredItems; $_al_SalesOrderItems{$_l_AllocationIndex})
												APPEND TO ARRAY:C911($_ar_UndeliveredQuantities; $_ar_salesOrderQuantities{$_l_AllocationIndex}-$_ar_TotalDelivered{$_l_AllocationIndex})
											End if 
										End for 
									Else 
										If ($_t_MovementType#"")
											SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_UNDeliveredItems; [ORDER_ITEMS:25]Quantity:3; $_ar_UndeliveredQuantities)
										Else 
											QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Number:49="")
											SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_UNDeliveredItems; [ORDER_ITEMS:25]Quantity:3; $_ar_UndeliveredQuantities)
										End if 
										
									End if 
									If (Size of array:C274($_al_UNDeliveredItems)=0)
										Gen_Alert("All Items have been delivered already!")
										$_bo_Continue:=False:C215
										$_bo_Selected:=False:C215
									Else 
										QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_UNDeliveredItems)
										$_bo_CheckAllocationIsDone:=True:C214
										$_bo_Selected:=True:C214
										$_bo_Continue:=True:C214
										//Here we need to see if these items need allocation. If they do and the delivery movement type is not also allocation then they need to be allocated
									End if 
								: ($_t_SelectionType="Date")  //-select a date(actually selected a delivery reference on that date if mulitple")
									
									SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_SalesOrderItems; [ORDER_ITEMS:25]Quantity:3; $_ar_salesOrderQuantities; [ORDER_ITEMS:25]Delivery_Date:11; $_ad_SalesOrderItemDeliveryDates)
									ARRAY REAL:C219($_ar_TotalDelivered; 0)
									ARRAY REAL:C219($_ar_TotalDelivered; Size of array:C274($_al_SalesOrderItems))
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
									SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_DeliveryMovementTypes)
									QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SalesOrderItems)
									QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_DeliveryMovementTypes)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>0)  //Just to filter out any reversed devliries
									
									//once delivered even if returned they were delivered and cant be deliverd again.
									$_bo_AddNewDateChoice:=True:C214
									ARRAY TEXT:C222($_at_DeliveryReferences; 0)
									ARRAY TEXT:C222($_at_SelectReferences; 0)
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45; $_at_DeliveryReferences; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; $_ad_DistinctDates)
										$_l_EmptyDeliveryDateRow:=Find in array:C230($_ad_SalesOrderItemDeliveryDates; !00-00-00!)
										If ($_l_EmptyDeliveryDateRow>0)
											//At least some items have not been ddelivered
											$_bo_AddNewDateChoice:=True:C214
										End if 
										ARRAY TEXT:C222(STK_at_SelectDeliveries; 0)
										ARRAY TEXT:C222(STK_At_ConDeliveryReference; 0)
										ARRAY DATE:C224(STK_at_COnDeliveryDates; 0)
										
										For ($_l_AllocationIndex; 1; Size of array:C274($_at_DeliveryReferences))
											If ($_at_DeliveryReferences{$_l_AllocationIndex}="")
												//This delivery has no reference so we use the order code
												$_l_ReprintRow:=Find in array:C230(STK_at_SelectDeliveries; String:C10($_ad_DistinctDates{$_l_AllocationIndex})+" Reprint")
												If ($_l_ReprintRow<0)
													APPEND TO ARRAY:C911(STK_at_SelectDeliveries; String:C10($_ad_DistinctDates{$_l_AllocationIndex})+" Reprint")
													APPEND TO ARRAY:C911(STK_At_ConDeliveryReference; "")
													APPEND TO ARRAY:C911(STK_at_COnDeliveryDates; $_ad_DistinctDates{$_l_AllocationIndex})
													
												End if 
											Else 
												$_l_DeliveryDateRow:=Find in array:C230(STK_at_SelectDeliveries; $_at_DeliveryReferences{$_l_AllocationIndex}+"("+String:C10($_ad_DistinctDates{$_l_AllocationIndex})+")"+" Reprint")
												If ($_l_DeliveryDateRow<0)
													APPEND TO ARRAY:C911(STK_at_SelectDeliveries; $_at_DeliveryReferences{$_l_AllocationIndex}+"("+String:C10($_ad_DistinctDates{$_l_AllocationIndex})+")"+" Reprint")
													APPEND TO ARRAY:C911(STK_At_ConDeliveryReference; $_at_DeliveryReferences{$_l_AllocationIndex})
													APPEND TO ARRAY:C911(STK_at_COnDeliveryDates; $_ad_DistinctDates{$_l_AllocationIndex})
													
												End if 
											End if 
										End for 
									Else 
										ARRAY DATE:C224($_ad_DistinctDates; 0)
										For ($_l_AllocationIndex; 1; Size of array:C274($_ad_SalesOrderItemDeliveryDates))
											If ($_ad_SalesOrderItemDeliveryDates{$_l_AllocationIndex}=!00-00-00!)
												//At least some items have not been delivered
												$_bo_AddNewDateChoice:=True:C214
											Else 
												$_l_DeliveryDateRow:=Find in array:C230($_ad_DistinctDates; $_ad_SalesOrderItemDeliveryDates{$_l_AllocationIndex})
												If ($_l_DeliveryDateRow<0)
													APPEND TO ARRAY:C911($_ad_DistinctDates; $_ad_SalesOrderItemDeliveryDates{$_l_AllocationIndex})
												End if 
											End if 
										End for 
										ARRAY TEXT:C222($_at_DeliveryReferences; Size of array:C274($_ad_DistinctDates))
										ARRAY TEXT:C222(STK_at_SelectDeliveries; 0)
										ARRAY TEXT:C222(STK_At_ConDeliveryReference; 0)
										ARRAY DATE:C224(STK_at_COnDeliveryDates; 0)
										
										For ($_l_AllocationIndex; 1; Size of array:C274($_ad_DistinctDates))
											$_l_DeliveryDateRow:=Find in array:C230(STK_at_SelectDeliveries; String:C10($_ad_DistinctDates{$_l_AllocationIndex})+" Reprint")
											If ($_l_DeliveryDateRow<0)
												APPEND TO ARRAY:C911(STK_at_SelectDeliveries; String:C10($_ad_DistinctDates{$_l_AllocationIndex})+" Reprint")
												APPEND TO ARRAY:C911(STK_At_ConDeliveryReference; "")
												APPEND TO ARRAY:C911(STK_at_COnDeliveryDates; $_ad_DistinctDates{$_l_AllocationIndex})
												
											End if 
										End for 
									End if 
									
									If (Size of array:C274(STK_at_SelectDeliveries)>0)  //else is a new delivery
										
										If ($_bo_AddNewDateChoice)
											APPEND TO ARRAY:C911(STK_at_SelectDeliveries; "-")
											APPEND TO ARRAY:C911(STK_at_SelectDeliveries; "New Delivery for undelivered Items")
										End if 
										ARRAY LONGINT:C221(STK_al_CHooseElement; 0)
										ARRAY LONGINT:C221(STK_al_CHooseElement; Size of array:C274(STK_at_SelectDeliveries))
										For ($_l_AllocationIndex; 1; Size of array:C274(STK_at_SelectDeliveries))
											STK_al_CHooseElement{$_l_AllocationIndex}:=$_l_AllocationIndex
										End for 
										$_bo_Selected:=False:C215
										$_l_ChosenElement:=GEN_RequestViaPopUp(->STK_at_SelectDeliveries; ->STK_al_CHooseElement; "Select Delivery to Print"; False:C215; ->STK_bo_Create; "Stop"; "Continue")
										If ($_l_ChosenElement>0)
											If ($_l_ChosenElement<=Size of array:C274(STK_At_ConDeliveryReference))
												STK_bo_PrintExisting:=True:C214
												STK_T_DeliveryReference:=STK_At_ConDeliveryReference{$_l_ChosenElement}
												STK_d_DeliveryDate:=STK_at_COnDeliveryDates{$_l_ChosenElement}
												$_bo_Continue:=True:C214
												OK:=1
											Else 
												STK_T_DeliveryReference:=""
												STK_d_DeliveryDate:=!00-00-00!
												$_bo_Continue:=True:C214
												$_d_NewDeliveryDate:=Gen_RequestDate("Set Delivery Date"; Is date:K8:7; Current date:C33; "Continue"; "Stop")
												
												If (OK=1)
													If ($_d_NewDeliveryDate#!00-00-00!)
														
														$_bo_Continue:=True:C214
														STK_bo_PrintExisting:=False:C215
														STK_T_DeliveryReference:=""
														STK_d_DeliveryDate:=$_d_NewDeliveryDate
													Else 
														Gen_Alert("Delivery not printing has been cancelled-no delivery date entered")
														$_bo_Continue:=False:C215
													End if 
												Else 
													OK:=1
													$_bo_Continue:=False:C215
												End if 
											End if 
											
										Else 
											$_bo_Continue:=False:C215
										End if 
									Else 
										STK_T_DeliveryReference:=""
										STK_d_DeliveryDate:=!00-00-00!
										$_bo_Continue:=True:C214
										$_d_NewDeliveryDate:=Gen_RequestDate("Set Delivery Date"; Is date:K8:7; Current date:C33; "Continue"; "Stop")
										
										If (OK=1)
											If ($_d_NewDeliveryDate#!00-00-00!)
												
												$_bo_Continue:=True:C214
												STK_bo_PrintExisting:=False:C215
												STK_T_DeliveryReference:=""
												STK_d_DeliveryDate:=$_d_NewDeliveryDate
											Else 
												Gen_Alert("Delivery not printing has been cancelled-no delivery date entered")
												$_bo_Continue:=False:C215
											End if 
										Else 
											OK:=1
											$_bo_Continue:=False:C215
										End if 
										
									End if 
									If ($_bo_Continue)
										If (STK_bo_PrintExisting=False:C215)
											//We need to see if the items have been allocated
											QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11=!00-00-00!)
											APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11:=STK_d_DeliveryDate)
											$_bo_CheckAllocationIsDone:=True:C214
											$_bo_Selected:=True:C214
										Else 
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45=STK_T_DeliveryReference)
											COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$OISeleciton")
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_MovementSOItemNumbers)
											QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Item_Number:27; $_al_MovementSOItemNumbers)
											CREATE SET:C116([ORDER_ITEMS:25]; "$set1")
											USE NAMED SELECTION:C332("$OISeleciton")
											QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Number:49=STK_T_DeliveryReference)
											CREATE SET:C116([ORDER_ITEMS:25]; "$set2")
											UNION:C120("$set1"; "$set2"; "$set1")
											USE SET:C118("$set1")
											$_bo_Selected:=True:C214
										End if 
									Else 
										$_bo_Selected:=False:C215
									End if 
								: ($_t_SelectionType="Selected")  //may be reprinting one or more delivery notes and or printing additional
									
									COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
									
									$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
									If ($_l_TableRow>0)
										$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
										$_ptr_HighlightSet:=$_ptr_ListBoxSetup->{20}
										$_t_HighlightSetName:=$_ptr_HighlightSet->
										CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "$Reselection")
										
										$_bo_Reselect:=False:C215
										If ($_t_HighlightSetName#"")
											If (Records in set:C195($_t_HighlightSetName)>0)
												USE SET:C118($_t_HighlightSetName)
												//Copy named selection([ORDER_ITEMS];"$Reselection")
												CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
												$_bo_Reselect:=True:C214
											End if 
										End if 
									End if 
									
									If (Records in selection:C76([ORDER_ITEMS:25])>0)  //modified this bit 10/12/2002 NG
										
										
										CREATE SET:C116([ORDER_ITEMS:25]; "printThese")
										SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_SalesOrderItems; [ORDER_ITEMS:25]Quantity:3; $_ar_salesOrderQuantities)
										ARRAY REAL:C219($_ar_TotalDelivered; 0)
										ARRAY REAL:C219($_ar_TotalDelivered; Size of array:C274($_al_SalesOrderItems))
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
										SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_DeliveryMovementTypes)
										QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SalesOrderItems)
										QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_DeliveryMovementTypes)
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
											
											STK_MenuUpdate("stock items"; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; True:C214)
										End if 
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>0)  //Just to filter out any reversed devliries
										
										//once delivered even if returned they were delivered and cant be deliverd again.
										ARRAY REAL:C219($_ar_DeliveredQuantities; 0)
										ARRAY LONGINT:C221($_al_DeliveredItems; 0)
										ARRAY TEXT:C222($_at_DeliveryReferences; 0)
										ARRAY DATE:C224($_ad_DistinctDates; 0)
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
											//at least some have been delivered
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_DeliveredQuantities; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_DeliveredItems; [STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45; $_at_DeliveryReferences; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; $_ad_DistinctDates)
											For ($_l_AllocationIndex; 1; Size of array:C274($_ar_DeliveredQuantities))
												$_l_DeliverItemsRow:=Find in array:C230($_al_SalesOrderItems; $_al_DeliveredItems{$_l_AllocationIndex})
												If ($_l_DeliverItemsRow>0)
													//it should be
													$_ar_TotalDelivered{$_l_DeliverItemsRow}:=$_ar_TotalDelivered{$_l_DeliverItemsRow}+$_ar_DeliveredQuantities{$_l_AllocationIndex}
												End if 
											End for 
											ARRAY LONGINT:C221($_al_UNDeliveredItems; 0)
											ARRAY REAL:C219($_ar_UndeliveredQuantities; 0)
											For ($_l_AllocationIndex; 1; Size of array:C274($_al_SalesOrderItems))
												If ($_ar_TotalDelivered{$_l_AllocationIndex}<$_ar_salesOrderQuantities{$_l_AllocationIndex})
													APPEND TO ARRAY:C911($_al_UNDeliveredItems; $_al_SalesOrderItems{$_l_AllocationIndex})
													APPEND TO ARRAY:C911($_ar_UndeliveredQuantities; $_ar_salesOrderQuantities{$_l_AllocationIndex}-$_ar_TotalDelivered{$_l_AllocationIndex})
												End if 
											End for 
										Else 
											If (Size of array:C274($_at_DeliveryMovementTypes)>0)
												SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_UNDeliveredItems; [ORDER_ITEMS:25]Quantity:3; $_ar_UndeliveredQuantities)
											Else 
												QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Number:49=0)
												SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_UNDeliveredItems; [ORDER_ITEMS:25]Quantity:3; $_ar_UndeliveredQuantities)
											End if 
											
										End if 
										If (Size of array:C274($_al_UNDeliveredItems)=0)
											//always a reprint then
											If (Size of array:C274($_al_DeliveredItems)>0)
												QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_DeliveredItems)
												$_bo_AddNewDateChoice:=True:C214
												
												ARRAY TEXT:C222(STK_at_SelectDeliveries; 0)
												ARRAY TEXT:C222(STK_At_ConDeliveryReference; 0)
												ARRAY DATE:C224(STK_at_COnDeliveryDates; 0)
												
												For ($_l_AllocationIndex; 1; Size of array:C274($_at_DeliveryReferences))
													If ($_at_DeliveryReferences{$_l_AllocationIndex}="")
														//This delivery has no reference so we use the order code
														$_l_ReprintRow:=Find in array:C230(STK_at_SelectDeliveries; String:C10($_ad_DistinctDates{$_l_AllocationIndex})+" Reprint")
														If ($_l_ReprintRow<0)
															APPEND TO ARRAY:C911(STK_at_SelectDeliveries; String:C10($_ad_DistinctDates{$_l_AllocationIndex})+" Reprint")
															APPEND TO ARRAY:C911(STK_At_ConDeliveryReference; "")
															APPEND TO ARRAY:C911(STK_at_COnDeliveryDates; $_ad_DistinctDates{$_l_AllocationIndex})
															
														End if 
													Else 
														$_l_DeliveryRow:=Find in array:C230(STK_at_SelectDeliveries; $_at_DeliveryReferences{$_l_AllocationIndex}+"("+String:C10($_ad_DistinctDates{$_l_AllocationIndex})+")"+" Reprint")
														If ($_l_DeliveryRow<0)
															APPEND TO ARRAY:C911(STK_at_SelectDeliveries; $_at_DeliveryReferences{$_l_AllocationIndex}+"("+String:C10($_ad_DistinctDates{$_l_AllocationIndex})+")"+" Reprint")
															APPEND TO ARRAY:C911(STK_At_ConDeliveryReference; $_at_DeliveryReferences{$_l_AllocationIndex})
															APPEND TO ARRAY:C911(STK_at_COnDeliveryDates; $_ad_DistinctDates{$_l_AllocationIndex})
															
														End if 
													End if 
												End for 
												ARRAY LONGINT:C221(STK_al_CHooseElement; 0)
												ARRAY LONGINT:C221(STK_al_CHooseElement; Size of array:C274(STK_at_SelectDeliveries))
												For ($_l_AllocationIndex; 1; Size of array:C274(STK_at_SelectDeliveries))
													STK_al_CHooseElement{$_l_AllocationIndex}:=$_l_AllocationIndex
												End for 
												$_bo_Selected:=False:C215
												If (Size of array:C274(STK_at_SelectDeliveries)>1)
													$_l_ChosenElement:=GEN_RequestViaPopUp(->STK_at_SelectDeliveries; ->STK_al_CHooseElement; "Select delivery to reprint"; False:C215; ->STK_bo_Create; "Stop"; "Continue")
												Else 
													$_l_ChosenElement:=1
												End if 
												If ($_l_ChosenElement>0)
													If ($_l_ChosenElement<=Size of array:C274(STK_At_ConDeliveryReference))
														STK_bo_PrintExisting:=True:C214
														STK_T_DeliveryReference:=STK_At_ConDeliveryReference{$_l_ChosenElement}
														STK_d_DeliveryDate:=STK_at_COnDeliveryDates{$_l_ChosenElement}
														$_bo_Continue:=True:C214
														OK:=1
													Else 
														STK_T_DeliveryReference:=""
														STK_d_DeliveryDate:=!00-00-00!
														$_bo_Continue:=True:C214
														$_d_NewDeliveryDate:=Gen_RequestDate("Set Delivery Date"; Is date:K8:7; Current date:C33; "Continue"; "Stop")
														
														If (OK=1)
															If ($_d_NewDeliveryDate#!00-00-00!)
																
																$_bo_Continue:=True:C214
																STK_bo_PrintExisting:=False:C215
																STK_T_DeliveryReference:=""
																STK_d_DeliveryDate:=$_d_NewDeliveryDate
															Else 
																Gen_Alert("Delivery not printing has been cancelled-no delivery date entered")
																$_bo_Continue:=False:C215
															End if 
														Else 
															OK:=1
															$_bo_Continue:=False:C215
														End if 
													End if 
													
												Else 
													$_bo_Continue:=False:C215
												End if 
												If ($_bo_Continue)
													If (STK_T_DeliveryReference="")
														//TRACE
														QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11=STK_d_DeliveryDate)
													Else 
														If (Size of array:C274($_at_DeliveryMovementTypes)>0)
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45=STK_T_DeliveryReference)
														Else 
															QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11=STK_T_DeliveryReference)
															
														End if 
														COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$OISeleciton")
														SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_MovementSOItemNumbers)
														QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Item_Number:27; $_al_MovementSOItemNumbers)
														CREATE SET:C116([ORDER_ITEMS:25]; "$set1")
														USE NAMED SELECTION:C332("$OISeleciton")
														QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Number:49=STK_T_DeliveryReference)
														CREATE SET:C116([ORDER_ITEMS:25]; "$set2")
														UNION:C120("$set1"; "$set2"; "$set1")
														USE SET:C118("$set1")
													End if 
													
													$_bo_Selected:=True:C214
													$_bo_CheckAllocationIsDone:=True:C214
												End if 
											Else 
												$_bo_Selected:=False:C215
												$_bo_Continue:=False:C215
											End if 
											
										Else 
											If (Size of array:C274($_at_DeliveryReferences)>0)
												Gen_Confirm("Reprint a Delivery or select undelivered quantities?"; "Undelivered"; "Reprint")
												If (OK=1)
													//undelivered
													QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_UNDeliveredItems)
													$_bo_CheckAllocationIsDone:=True:C214
												Else 
													If (Size of array:C274($_al_DeliveredItems)>0)
														QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_DeliveredItems)
														$_bo_AddNewDateChoice:=True:C214
														
														ARRAY TEXT:C222(STK_at_SelectDeliveries; 0)
														ARRAY TEXT:C222(STK_At_ConDeliveryReference; 0)
														ARRAY DATE:C224(STK_at_COnDeliveryDates; 0)
														
														For ($_l_AllocationIndex; 1; Size of array:C274($_at_DeliveryReferences))
															If ($_at_DeliveryReferences{$_l_AllocationIndex}="")
																//This delivery has no reference so we use the order code
																$_l_ReprintRow:=Find in array:C230(STK_at_SelectDeliveries; String:C10($_ad_DistinctDates{$_l_AllocationIndex})+" Reprint")
																If ($_l_ReprintRow<0)
																	APPEND TO ARRAY:C911(STK_at_SelectDeliveries; String:C10($_ad_DistinctDates{$_l_AllocationIndex})+" Reprint")
																	APPEND TO ARRAY:C911(STK_At_ConDeliveryReference; "")
																	APPEND TO ARRAY:C911(STK_at_COnDeliveryDates; $_ad_DistinctDates{$_l_AllocationIndex})
																	
																End if 
															Else 
																$_l_DeliveryDateRow:=Find in array:C230(STK_at_SelectDeliveries; $_at_DeliveryReferences{$_l_AllocationIndex}+"("+String:C10($_ad_DistinctDates{$_l_AllocationIndex})+")"+" Reprint")
																If ($_l_DeliveryDateRow<0)
																	APPEND TO ARRAY:C911(STK_at_SelectDeliveries; $_at_DeliveryReferences{$_l_AllocationIndex}+"("+String:C10($_ad_DistinctDates{$_l_AllocationIndex})+")"+" Reprint")
																	APPEND TO ARRAY:C911(STK_At_ConDeliveryReference; $_at_DeliveryReferences{$_l_AllocationIndex})
																	APPEND TO ARRAY:C911(STK_at_COnDeliveryDates; $_ad_DistinctDates{$_l_AllocationIndex})
																	
																End if 
															End if 
														End for 
														ARRAY LONGINT:C221(STK_al_CHooseElement; 0)
														ARRAY LONGINT:C221(STK_al_CHooseElement; Size of array:C274(STK_at_SelectDeliveries))
														For ($_l_AllocationIndex; 1; Size of array:C274(STK_at_SelectDeliveries))
															STK_al_CHooseElement{$_l_AllocationIndex}:=$_l_AllocationIndex
														End for 
														$_bo_Selected:=False:C215
														If (Size of array:C274(STK_at_SelectDeliveries)>1)
															$_l_ChosenElement:=GEN_RequestViaPopUp(->STK_at_SelectDeliveries; ->STK_al_CHooseElement; "Select delivery to reprint"; False:C215; ->STK_bo_Create; "Stop"; "Continue")
														Else 
															$_l_ChosenElement:=1
														End if 
														If ($_l_ChosenElement>0)
															If ($_l_ChosenElement<=Size of array:C274(STK_At_ConDeliveryReference))
																STK_bo_PrintExisting:=True:C214
																STK_T_DeliveryReference:=STK_At_ConDeliveryReference{$_l_ChosenElement}
																STK_d_DeliveryDate:=STK_at_COnDeliveryDates{$_l_ChosenElement}
																$_bo_Continue:=True:C214
																OK:=1
															Else 
																STK_T_DeliveryReference:=""
																STK_d_DeliveryDate:=!00-00-00!
																$_bo_Continue:=True:C214
																$_d_NewDeliveryDate:=Gen_RequestDate("Set Delivery Date"; Is date:K8:7; Current date:C33; "Continue"; "Stop")
																
																If (OK=1)
																	If ($_d_NewDeliveryDate#!00-00-00!)
																		
																		$_bo_Continue:=True:C214
																		STK_bo_PrintExisting:=False:C215
																		STK_T_DeliveryReference:=""
																		STK_d_DeliveryDate:=$_d_NewDeliveryDate
																	Else 
																		Gen_Alert("Delivery not printing has been cancelled-no delivery date entered")
																		$_bo_Continue:=False:C215
																	End if 
																Else 
																	OK:=1
																	$_bo_Continue:=False:C215
																End if 
															End if 
															
														Else 
															$_bo_Continue:=False:C215
														End if 
														If ($_bo_Continue)
															If (Size of array:C274($_at_DeliveryMovementTypes)>0)
																QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45=STK_T_DeliveryReference)
															Else 
																QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11=STK_T_DeliveryReference)
															End if 
															COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$OISeleciton")
															SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_MovementSOItemNumbers)
															QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Item_Number:27; $_al_MovementSOItemNumbers)
															CREATE SET:C116([ORDER_ITEMS:25]; "$set1")
															USE NAMED SELECTION:C332("$OISeleciton")
															QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Number:49=STK_T_DeliveryReference)
															CREATE SET:C116([ORDER_ITEMS:25]; "$set2")
															UNION:C120("$set1"; "$set2"; "$set1")
															USE SET:C118("$set1")
															$_bo_Selected:=True:C214
															$_bo_CheckAllocationIsDone:=False:C215
														End if 
													Else 
														$_bo_Selected:=False:C215
														$_bo_Continue:=False:C215
													End if 
												End if 
												
											Else 
												//cant be a reprint at all
												QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_UNDeliveredItems)
												$_bo_CheckAllocationIsDone:=True:C214
											End if 
											$_bo_Selected:=True:C214
											$_bo_Continue:=True:C214
											//Here we need to see if these items need allocation. If they do and the delivery movement type is not also allocation then they need to be allocated
										End if 
										//here same as selected date-just less to select from-note if reprint will not just reprint this item
									End if 
									//USE NAMED SELECTION("$Temp")
									If ($_t_SelectionType="Selected")
										If ($_t_HighlightSetName#"")
											HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
										End if 
									End if 
								: ($_t_SelectionType="Allocated") | ($_t_SelectionType="Alloc")  //print all allocated and not delivered
									
									
									SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_SalesOrderItems; [ORDER_ITEMS:25]Quantity:3; $_ar_salesOrderQuantities)
									
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
									SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationMovementTypes)
									If (Size of array:C274($_at_AllocationMovementTypes)>0)
										QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SalesOrderItems)
										QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationMovementTypes)
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
											STK_MenuUpdate("stock items"; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; True:C214)
										End if 
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
										//That means they are allocated and not delivered but they COULD be part allocated-so part delivery will happen
										DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_UNDeliveredItems)
										QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_UNDeliveredItems)
										//we could verify this here.
										$_d_NewDeliveryDate:=Gen_RequestDate("Set Delivery Date"; Is date:K8:7; Current date:C33; "Continue"; "Stop")
										
										If (OK=1)
											If ($_d_NewDeliveryDate#!00-00-00!)
												$_bo_Continue:=True:C214
												$_bo_Selected:=True:C214
												STK_bo_PrintExisting:=False:C215
												STK_T_DeliveryReference:=""
												STK_d_DeliveryDate:=$_d_NewDeliveryDate
												
											Else 
												Gen_Alert("Delivery not printing has been cancelled-no delivery date entered")
												$_bo_Continue:=False:C215
												$_bo_Selected:=False:C215
											End if 
										Else 
											OK:=1
											$_bo_Continue:=False:C215
											$_bo_Selected:=False:C215
										End if 
									Else 
										$_bo_Continue:=False:C215
										$_bo_Selected:=False:C215
									End if 
									
							End case 
						Else 
							If (DB_t_CurrentFormUsage2="Date")
								If (Records in set:C195("USER SET")>0)
									USE SET:C118("USER SET")
									$_l_Option:=1
								Else 
									$_l_Option:=0
								End if 
								
								If ($_l_Option=1)  //user selected records
									
									DISTINCT VALUES:C339([ORDER_ITEMS:25]Delivery_Date:11; $_ad_DeliveryDates)
									If (Size of array:C274($_ad_DeliveryDates)>1)
										//not all items selected have same date
										$_d_DeliveryDateOLD:=[ORDER_ITEMS:25]Delivery_Date:11
										If (ORD_l_CB_Delivery=1)  // preference
											
											Gen_Confirm("Modify delivery dates?"; "No"; "Yes")
											If (OK=1)
												$_bo_Selected:=True:C214
											Else 
												$_t_DateString:=String:C10(Current date:C33(*))
												vDeldate:=Date:C102(Gen_Request("Delivery Date to print:"; $_t_DateString))
												If ($_bo_PrintDateSet) & (False:C215)
													DB_lockFile(->[ORDER_ITEMS:25])
													APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11:=VDelDate)
													
													AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
												End if 
												$_bo_Selected:=True:C214
											End if 
										Else 
											//preference is not for user to set the dates this way
											Gen_Alert("Please select records with the same delivery date")
											$_bo_Selected:=False:C215
										End if 
									Else 
										//only one date
										//no need to ask anything unless date is !00.00.00!
										$_bo_Selected:=True:C214
										$_d_DeliveryDateOLD:=$_ad_DeliveryDates{1}
										If ($_ad_DeliveryDates{1}=!00-00-00!)
											If (ORD_l_CB_Delivery=1)  // preference
												
												$_t_DateString:=String:C10(Current date:C33(*))
												vDeldate:=Date:C102(Gen_Request("Delivery Date to print:"; $_t_DateString))
												If ($_bo_PrintDateSet) & (False:C215)
													DB_lockFile(->[ORDER_ITEMS:25])
													APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11:=VDelDate)
													
													AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
												End if 
												$_bo_Selected:=True:C214
											Else 
												Gen_Alert("These items have no delivery date, Please select items with a delivery date!")
												$_bo_Selected:=False:C215
											End if 
											
										End if 
										
									End if 
								Else 
									//user did not highlight records
									
									$_t_DateString:=String:C10(Current date:C33(*))
									vDeldate:=Date:C102(Gen_Request("Delivery Date to print:"; $_t_DateString))
									$_d_DeliveryDateOLD:=vDeldate
									$_bo_PrintDateSet:=(vDeldate#!00-00-00!)
									QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11=vDeldate)
									$_bo_Selected:=True:C214
								End if 
							Else 
								vDelDate:=!00-00-00!
								$_d_DeliveryDateOLD:=vDelDate
								$_bo_PrintDateSet:=False:C215
								$_bo_Selected:=True:C214
								OK:=1
							End if 
							vDoDateF:=vDelDate
						End if 
						
						If (OK=1) & ($_bo_Selected)
							If ($_bo_CheckAllocationIsDone)  // this only happens on a fresh delivery-but the items could have some delivered already. we can only deliver
								
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
								$_bo_Continue:=True:C214
								If ($_t_MovementType#"")
									If ([MOVEMENT_TYPES:60]Alloc_Type:10=False:C215)
										COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$ToPrint")
										If (Not:C34(STK_bo_AllocTypesKnown))
											QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
											SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_POAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_POMovement)
											
											QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
											SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_AllocationAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_allocationMovement)
											
											QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
											SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Minus:4; STK_at_unAllocationAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_unallocationMovement)
											
											STK_bo_AllocTypesKnown:=True:C214
										End if 
										SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_SalesOrderItems; [ORDER_ITEMS:25]Quantity:3; $_ar_salesOrderQuantities)
										
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
										SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationMovementTypes)
										QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24; $_al_SalesOrderItems)
										$_bo_UseISO:=False:C215
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
											QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SalesOrderItems)
											$_bo_UseISO:=True:C214
											
										End if 
										//QUERY SELECTION WITH ARRAY([STOCK ITEMS]xstockMovementType;$_at_AllocationMovementTypes)
										If (Size of array:C274(STK_at_AllocationAds)>1)
											QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; STK_at_AllocationAds)
										Else 
											If (Size of array:C274(STK_at_AllocationAds)>0)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=STK_at_AllocationAds{1})
											End if 
										End if 
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
											//STK_MenuUpdate ("stock items";[STOCK ITEMS]Product Code;True)
										End if 
										DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_StockMovementTypes)
										If (Size of array:C274($_at_StockMovementTypes)>=1)
											If (Not:C34($_bo_UseISO))
												$_l_MovementTypeRow:=Find in array:C230($_at_StockMovementTypes; STK_at_allocationMovement{1})
												If ($_l_MovementTypeRow<0)
													$_t_MovementType:=$_at_StockMovementTypes{1}
												Else 
													$_t_MovementType:=$_at_StockMovementTypes{$_l_MovementTypeRow}
												End if 
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=$_t_MovementType)
											Else 
												QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; STK_at_AllocationAds)
												
											End if 
										End if 
										//This is not counting how many have been allocated AND delivered just allocated and not unallocated
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_AllocatedItems; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_AllocatedQuantities; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_ResidualStockQuantity)
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
										SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UNAllocationMovementTypes)
										QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25; $_al_SalesOrderItems)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
										If (Size of array:C274(STK_at_unallocationMovement)=1)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=STK_at_unallocationMovement{1})
										Else 
											QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; STK_at_unallocationMovement)
										End if 
										If (Size of array:C274(STK_at_unAllocationAds)>1)
											QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; STK_at_unAllocationAds)
										Else 
											If (Size of array:C274(STK_at_unAllocationAds)>0)
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32=STK_at_unAllocationAds{1})
											End if 
										End if 
										$_r_Sum2:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										//This is not counting how many have been allocated AND delivered just allocated and not unallocated
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25; $_al_UNAllocatedItems; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_UNAllocatedQuantities)
										ARRAY REAL:C219($_ar_SalesOrderAllocatedQuantity; 0)
										ARRAY REAL:C219($_ar_SalesOrderDeliveredQuantity; 0)
										ARRAY REAL:C219($_ar_AllocationsDelivered; 0)
										ARRAY REAL:C219($_ar_SalesOrderDeliveredQuantity; Size of array:C274($_al_SalesOrderItems))  //Remember this is the quantity ALREADY delivered
										
										ARRAY REAL:C219($_ar_SalesOrderAllocatedQuantity; Size of array:C274($_al_SalesOrderItems))
										
										For ($_l_AllocationIndex; 1; Size of array:C274($_al_AllocatedItems))
											$_l_OrderItemRow:=Find in array:C230($_al_SalesOrderItems; $_al_AllocatedItems{$_l_AllocationIndex})
											If ($_l_OrderItemRow>0)  // It should be
												
												$_ar_SalesOrderAllocatedQuantity{$_l_OrderItemRow}:=$_ar_SalesOrderAllocatedQuantity{$_l_OrderItemRow}+$_ar_AllocatedQuantities{$_l_AllocationIndex}
											End if 
											
										End for 
										For ($_l_AllocationIndex; 1; Size of array:C274($_al_UNAllocatedItems))
											$_l_OrderItemRow:=Find in array:C230($_al_SalesOrderItems; $_al_UNAllocatedItems{$_l_AllocationIndex})
											If ($_l_OrderItemRow>0)  // It should be
												
												$_ar_SalesOrderAllocatedQuantity{$_l_OrderItemRow}:=$_ar_SalesOrderAllocatedQuantity{$_l_OrderItemRow}-$_ar_UNAllocatedQuantities{$_l_AllocationIndex}
											End if 
										End for 
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
										SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_DeliveryMovementTypes)
										QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SalesOrderItems)
										QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_DeliveryMovementTypes)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>0)  //Just to filter out any reversed devliries
										
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_DeliveredItems; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_DeliveredQuantities)
										ARRAY REAL:C219($_ar_SalesOrderDeliveredQuantity; 0)
										ARRAY REAL:C219($_ar_SalesOrderDeliveredQuantity; Size of array:C274($_al_SalesOrderItems))
										For ($_l_AllocationIndex; 1; Size of array:C274($_al_DeliveredItems))
											$_l_DeliveredOrderItemRow:=Find in array:C230($_al_SalesOrderItems; $_al_DeliveredItems{$_l_AllocationIndex})
											If ($_l_DeliveredOrderItemRow>0)  // It should be
												
												$_ar_SalesOrderDeliveredQuantity{$_l_DeliveredOrderItemRow}:=$_ar_SalesOrderDeliveredQuantity{$_l_DeliveredOrderItemRow}+$_ar_DeliveredQuantities{$_l_AllocationIndex}
											End if 
										End for 
										ARRAY REAL:C219($_ar_NeedsAllocation; 0)
										ARRAY REAL:C219($_ar_NeedsAllocation; Size of array:C274($_al_SalesOrderItems))
										$_bo_AllocationRequired:=False:C215
										For ($_l_AllocationIndex; 1; Size of array:C274($_ar_NeedsAllocation))
											$_ar_NeedsAllocation{$_l_AllocationIndex}:=$_ar_salesOrderQuantities{$_l_AllocationIndex}-$_ar_SalesOrderAllocatedQuantity{$_l_AllocationIndex}
											If ($_ar_NeedsAllocation{$_l_AllocationIndex}>0)
												$_bo_AllocationRequired:=True:C214
											End if 
											
										End for 
										If ($_bo_AllocationRequired)
											Gen_Confirm3("Some items require stock allocated, do you want to deliver only the quantities allocated or allocate additional stock now?"; "Stop"; "Allocate"; "Deliver Allocated")
											Case of 
												: (OK=0)
													//allocate
													For ($_l_AllocationIndex; Size of array:C274($_ar_NeedsAllocation); 1; -1)
														If ($_ar_NeedsAllocation{$_l_AllocationIndex}>0)
															QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_SalesOrderItems{$_l_AllocationIndex})
															$_t_AllocateResult:=OrderI_AllocAu2
															If ([ORDER_ITEMS:25]Allocated:28<[ORDER_ITEMS:25]Quantity:3)
																Case of 
																	: ([ORDER_ITEMS:25]Allocated:28>$_ar_SalesOrderAllocatedQuantity{$_l_AllocationIndex}) & ([ORDER_ITEMS:25]Allocated:28<$_ar_salesOrderQuantities{$_l_AllocationIndex})
																		If (<>SYS_bo_OrderItemPartDelivery)
																			Gen_Confirm(String:C10([ORDER_ITEMS:25]Item_Number:27)+" "+[ORDER_ITEMS:25]Product_Code:2+" Has not been able to allocate stock for the whole quantity. Do you wish to deliver the allocated quantity?"; "No"; "Yes")
																			If (OK=0)
																				$_bo_Continue:=False:C215
																				DELETE FROM ARRAY:C228($_ar_NeedsAllocation; $_l_AllocationIndex)
																				DELETE FROM ARRAY:C228($_ar_SalesOrderDeliveredQuantity; $_l_AllocationIndex)
																				DELETE FROM ARRAY:C228($_ar_SalesOrderAllocatedQuantity; $_l_AllocationIndex)
																				DELETE FROM ARRAY:C228($_al_SalesOrderItems; $_l_AllocationIndex)
																				DELETE FROM ARRAY:C228($_ar_salesOrderQuantities; $_l_AllocationIndex)
																				
																			End if 
																			OK:=1
																		Else 
																			Gen_Alert(String:C10([ORDER_ITEMS:25]Item_Number:27)+" "+[ORDER_ITEMS:25]Product_Code:2+" Has not been able to allocate stock for the whole quantity."; "Continue")
																			DELETE FROM ARRAY:C228($_ar_NeedsAllocation; $_l_AllocationIndex)
																			DELETE FROM ARRAY:C228($_ar_SalesOrderDeliveredQuantity; $_l_AllocationIndex)
																			DELETE FROM ARRAY:C228($_ar_SalesOrderAllocatedQuantity; $_l_AllocationIndex)
																			DELETE FROM ARRAY:C228($_al_SalesOrderItems; $_l_AllocationIndex)
																			DELETE FROM ARRAY:C228($_ar_salesOrderQuantities; $_l_AllocationIndex)
																		End if 
																	: ([ORDER_ITEMS:25]Allocated:28=0)
																		Gen_Alert(String:C10([ORDER_ITEMS:25]Item_Number:27)+" "+[ORDER_ITEMS:25]Product_Code:2+" Has not been able to allocate stock."; "Continue")
																		DELETE FROM ARRAY:C228($_ar_NeedsAllocation; $_l_AllocationIndex)
																		DELETE FROM ARRAY:C228($_ar_SalesOrderDeliveredQuantity; $_l_AllocationIndex)
																		DELETE FROM ARRAY:C228($_ar_SalesOrderAllocatedQuantity; $_l_AllocationIndex)
																		DELETE FROM ARRAY:C228($_al_SalesOrderItems; $_l_AllocationIndex)
																		DELETE FROM ARRAY:C228($_ar_salesOrderQuantities; $_l_AllocationIndex)
																		
																End case 
															End if 
														End if 
													End for 
													QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_SalesOrderItems)
												: (xNext=1)
													//Deliver allocated
													OK:=1
													For ($_l_AllocationIndex; Size of array:C274($_ar_NeedsAllocation); 1; -1)
														QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_SalesOrderItems{$_l_AllocationIndex})
														If ([ORDER_ITEMS:25]Allocated:28=0)
															DELETE FROM ARRAY:C228($_ar_NeedsAllocation; $_l_AllocationIndex)
															DELETE FROM ARRAY:C228($_ar_SalesOrderDeliveredQuantity; $_l_AllocationIndex)
															DELETE FROM ARRAY:C228($_ar_SalesOrderAllocatedQuantity; $_l_AllocationIndex)
															DELETE FROM ARRAY:C228($_al_SalesOrderItems; $_l_AllocationIndex)
															DELETE FROM ARRAY:C228($_ar_salesOrderQuantities; $_l_AllocationIndex)
														End if 
													End for 
													QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_SalesOrderItems)
													$_bo_Continue:=True:C214
												Else 
													//stop
													$_bo_Continue:=False:C215
											End case 
										Else 
											$_bo_Continue:=True:C214
											
										End if 
									End if 
								Else 
									$_bo_Continue:=True:C214
								End if 
							Else 
								$_bo_Continue:=True:C214
							End if 
							If ($_bo_Continue)
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
								If (False:C215)
									If (DB_t_CurrentFormUsage2="Sel")
										If (Records in selection:C76([ORDER_ITEMS:25])>0)
											CREATE SET:C116([ORDER_ITEMS:25]; "printThese")
											QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11=!00-00-00!)
											If (Records in selection:C76([ORDER_ITEMS:25])>0)
												If (ORD_l_CB_Delivery=1)  // preference
													
													$_t_DateString:=String:C10(Current date:C33(*))
													vDeldate:=Date:C102(Gen_Request("Delivery Date to use:"; $_t_DateString))
													$_bo_PrintDateSet:=(VdelDate#!00-00-00!)
													vDoDateF:=vDelDate
												Else 
													vDeldate:=Current date:C33(*)
													$_bo_PrintDateSet:=(VdelDate#!00-00-00!)
													vDoDateF:=vDelDate
												End if 
												If ($_bo_PrintDateSet)  //bsw This was missing here RPC reported this fixed on 18/11/02 11:30 am
													
													If (Not:C34(In transaction:C397))
														DB_lockFile(->[ORDER_ITEMS:25])
														APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11:=VDelDate)
														
														AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
													Else 
														FIRST RECORD:C50([ORDER_ITEMS:25])
														For ($_l_OrderItemsIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
															[ORDER_ITEMS:25]Delivery_Date:11:=VDelDate
															DB_SaveRecord(->[ORDER_ITEMS:25])
															AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
															NEXT RECORD:C51([ORDER_ITEMS:25])
														End for 
													End if 
												End if 
											End if 
											USE SET:C118("PrintThese")
											CLEAR SET:C117("PrintThese")
										End if 
									Else 
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
										QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Delivery_Date:11=vDoDateF)
										If (DB_t_CurrentFormUsage2="Alloc")
											// SEARCH SELECTION([ORDER ITEMS];[ORDER ITEMS]Allocated>0)
											$_bo_PrintDateSet:=True:C214
											
											QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; OrderI_AllocSrc)
										End if 
									End if 
									If ((<>SYS_bo_OrderItemPartDelivery) & (vDoDateF=!00-00-00!))
										QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; Orders_PartSrc("D"))
									End if 
								End if 
								OrderI_Level0
								Orders_InvCalc
								If (Records in selection:C76([ORDER_ITEMS:25])=0)
									Gen_Alert("There are no Items to Deliver"; "Cancel")
								Else 
									If (Not:C34(STK_bo_PrintExisting))
										If ((DB_GetModuleSettingByNUM(Module_StockControl))>0) & ([MOVEMENT_TYPES:60]Type_Code:1#"")
											
											STK_T_DeliveryReference:=OrdDel_StockP(DB_t_CurrentFormUsage2; [ORDERS:24]Company_Code:1; [ORDERS:24]Currency_Code:32; [ORDERS:24]Analysis_Code:33; [ORDERS:24]Layer_Code:47; [MOVEMENT_TYPES:60]Type_Code:1)
											If (STK_T_DeliveryReference#"")
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45=STK_T_DeliveryReference)
												SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_ItemNumbers)
												QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Item_Number:27; $_al_ItemNumbers)
											End if 
										Else 
											$_l_DeliveryReference:=1
											$_bo_NotUnique:=False:C215
											Repeat 
												STK_T_DELIVERYREFERENCE:=[ORDER_ITEMS:25]Order_Code:1+"/"+String:C10($_l_DeliveryReference)
												SET QUERY DESTINATION:C396(Into variable:K19:4; $_bo_NotUnique)
												
												QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Number:49=STK_T_DELIVERYREFERENCE)
												If ($_bo_NotUnique)
													$_l_DeliveryReference:=$_l_DeliveryReference+1
												Else 
													SET QUERY DESTINATION:C396(Into current selection:K19:1)
													
												End if 
											Until ($_bo_NotUnique=False:C215)
											APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Number:49:=STK_T_DELIVERYREFERENCE)
											APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11:=STK_d_DeliveryDate)
											
											
										End if 
									End if 
									
									
									Orders_PPDel3
									If (OK=1) & ((STK_T_DeliveryReference#"") | (STK_d_DeliveryDate#!00-00-00!))
										
										$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
										DB_t_CurrentFormUsage2:="Sel"  //preventing the LP from searching for the items again & from applying PPDel5
										
										Gen_PPSingleCS(->[ORDERS:24])
										$_t_DocumentName:="Delivery note "+[ORDERS:24]Order_Code:3  // 05/04/040 pb
										
										$_t_CurrentWindowTitle:=Get window title:C450
										SET WINDOW TITLE:C213($_t_DocumentName)
										$_l_Printed:=Gen_PPSingle(->[ORDERS:24]; "Delivery_Note"; "Orders_Out"; "Delivery"; "Delivery_Note"; "Orders_PPDelL2"; 0; ->[ORDERS:24]State:15; "Delivery"; [ORDERS:24]Analysis_Code:33; False:C215; $_t_DocumentName)  // 05/04/040 pb
										
										SET WINDOW TITLE:C213($_t_CurrentWindowTitle)
										//TRACE
										If ($_l_Printed=1)
											If (Transact_SttLck(->[ORDER_ITEMS:25]Item_Number:27))
												//Orders_PPDel5 ($_d_DeliveryDateOLD)  `retrieved from Orders_PPDelL2
												//NG JUNE 2004 ADDED PARAMETER TO ABOVE
												//                    Transact EndNF
												Transact_End  // 13/05/02 pb
												
												//Orders_PPDel4
											End if 
										Else 
											
											//not printed-undo the delivery date but not the stock movement
											APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11:=$_d_DeliveryDateOLD)
											
										End if 
										DB_t_CurrentFormUsage2:=$_t_CurrentFormUsage2
										Gen_PPSingleUS
									End if 
								End if 
							End if 
						End if 
					End if 
					Orders_PPEnd
					USE NAMED SELECTION:C332("$Temp")
					If ($_bo_Reselect)
						HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
					End if 
					
				End if 
			End if 
			
	End case 
End if 
vAdd:=$_l_AddMode2
ERR_MethodTrackerReturn("Orders_PPDel2"; $_t_oldMethodName)
