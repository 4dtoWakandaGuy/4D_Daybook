If (False:C215)
	//object Name: Object Name:      STK_AllocationWIndow.oAllocateandexitButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/12/2012 19:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_lb_Allocate;0)
	ARRAY LONGINT:C221($_al_SelectedRowNumbers; 0)
	//ARRAY LONGINT(ORDI_al_AllocItemNumbers;0)
	//ARRAY LONGINT(ORDI_al_AllocStockRecordIDS;0)
	//ARRAY LONGINT(STK_al_CSIDtoallocate;0)
	//ARRAY LONGINT(STK_al_LineIndex;0)
	//ARRAY LONGINT(STK_al_SRIDtoallocate;0)
	//ARRAY REAL(ORDI_ar_AllocResidualStockQty;0)
	//ARRAY REAL(ORDI_ar_AllocResStockQtyMAS;0)
	ARRAY TEXT:C222($_at_PurchaseTypeCodes; 0)
	//ARRAY TEXT(ORDI_at_AllocProductCodes;0)
	//ARRAY TEXT(STK_at_FilterTypes;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Continue; $_bo_Exit; $_bo_NoCommit; STK_bo_AllocatedFromPO; STK_bo_DoAllocate; STK_bo_DoooAllocate; STK_bo_SplitRemainder)
	C_LONGINT:C283($_l_AllocateIndex; $_l_AllocStockIndex; $_l_Column; $_l_DefaultsIndex; $_l_event; $_l_ItemNumber; $_l_LineReference; $_l_MoreIndex; $_l_RecordsinSelection; $_l_Retries; $_l_Row)
	C_LONGINT:C283($_l_RowNumber; $_l_SelectedIndex; $_L_StockRow; STK_l_OrderItemNumber; xCancel; xnext; xOK)
	C_REAL:C285($_r_Remainder; $_r_Remaining; $_r_Sum; $_r_SumNUMBER; $_r_ToKeepFree; STK_R_QuantityRequired)
	C_TEXT:C284($_t_oldMethodName; $_t_productCode; $_t_RequestSUM; STK_t_DefAllocationStockType; STK_t_OrderCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ STK_AllocationWIndow.oAllocateandexitButton"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (STK_at_FilterTypes{STK_at_FilterTypes}="Free Stock")
			LISTBOX GET CELL POSITION:C971(STK_lb_Allocate; $_l_Column; $_l_Row)
			ARRAY LONGINT:C221(STK_al_SRIDtoallocate; 0)
			If ($_l_Row>0)
				ARRAY LONGINT:C221(STK_al_SRIDtoallocate; 0)
				ARRAY LONGINT:C221($_al_SelectedRowNumbers; 0)
				LB_GetSelect(->STK_lb_Allocate; ->$_al_SelectedRowNumbers)
				$_bo_Exit:=False:C215
				For ($_l_DefaultsIndex; 1; 2)  //run through the selected twic-first only use the default-clear the row number so we dont do it a second time
					For ($_l_SelectedIndex; 1; Size of array:C274($_al_SelectedRowNumbers))
						$_l_RowNumber:=$_al_SelectedRowNumbers{$_l_SelectedIndex}
						If ($_l_DefaultsIndex=1)
							//If (STK_at_DisStockTypes{$_l_RowNumber}=STK_t_DefAllocationStockType)
							$_bo_Continue:=True:C214
							//Else
							//$_bo_Continue:=False
							//End if
						Else 
							//second pass
							$_bo_Continue:=True:C214
						End if 
						If (ORDI_al_AllocItemNumbers{$_l_SelectedIndex}=0)  //absolute prevention...
							
							If ($_bo_Continue)  // the following line will change to itterate the array of products..
								Case of 
									: (STK_R_QuantityRequired>0)
										//we dont need to know this..
										$_l_LineReference:=STK_al_LineIndex{$_l_SelectedIndex}
										For ($_l_AllocStockIndex; 1; Size of array:C274(ORDI_al_AllocStockRecordIDS{$_l_LineReference}))
											$_L_StockRow:=Find in array:C230(STK_al_SRIDtoallocate; ORDI_al_AllocStockRecordIDS{$_l_LineReference}{$_l_AllocStockIndex})
											If ($_L_StockRow<0)
												APPEND TO ARRAY:C911(STK_al_SRIDtoallocate; ORDI_al_AllocStockRecordIDS{$_l_LineReference}{$_l_AllocStockIndex})
											End if 
										End for 
										
										//there are enought to allocate-make sure you adjust quantity required after allocating
										ARRAY LONGINT:C221(STK_al_CSIDtoallocate; 0)
										//ARRAY REAL(STK_ar_CSQTYtoAllocate;0)
										//ARRAY LONGINT(STK_al_OIallocateTo;0)
										If (ORDI_ar_AllocResidualStockQty{$_l_SelectedIndex}>0)
											If (STK_R_QuantityRequired-ORDI_ar_AllocResidualStockQty{$_l_SelectedIndex}>STK_R_QuantityRequired)
												STK_R_QuantityRequired:=0
											Else 
												STK_R_QuantityRequired:=STK_R_QuantityRequired-ORDI_ar_AllocResidualStockQty{$_l_SelectedIndex}
											End if 
											ORDI_ar_AllocResidualStockQty{$_l_SelectedIndex}:=0
											ORDI_ar_AllocResStockQtyMAS{$_l_SelectedIndex}:=0
										End if 
								End case 
								If (STK_R_QuantityRequired<=0)
									$_bo_Exit:=True:C214
									$_l_DefaultsIndex:=99999
								Else 
									$_r_Remaining:=0
									For ($_l_MoreIndex; 1; Size of array:C274(ORDI_ar_AllocResidualStockQty))
										$_r_Remaining:=$_r_Remaining+ORDI_ar_AllocResidualStockQty{$_l_MoreIndex}
									End for 
									If ($_r_Remaining>0)
										$_l_DefaultsIndex:=2
										Gen_Confirm("You have not allocated sufficient stock. . Do you wish to remain in this screen to allocate additional stock?"; "Yes"; "No")
										If (OK=0)
											$_bo_Exit:=True:C214
										Else 
											$_bo_Exit:=False:C215
										End if 
										OK:=1
									Else 
										$_l_DefaultsIndex:=2
										xCancel:=0
										xnext:=0
										xOK:=0
										//Gen_Alert ("Additional Stock needs to be allocated. However thiere is no additional free stock";"Continue")
										Gen_Confirm3("Additional stock needs to be allocated. There is no additional free stock"; "Continue"; "Stop"; "Split Order Item")
										
										Case of 
											: (xcancel=1)  //stop
												$_bo_Exit:=False:C215
											: (xok=1)  //continue
												$_bo_Exit:=True:C214
											: (xNext=1)  //split
												$_bo_Exit:=True:C214
												STK_bo_SplitRemainder:=True:C214
										End case 
									End if 
									
									
								End if 
							End if 
						End if 
					End for 
				End for 
				If ($_bo_Exit)
					STK_bo_DoAllocate:=True:C214
					CANCEL:C270
				End if 
			End if 
		Else 
			//allocate from on order
			If (STK_R_QuantityRequired>0)
				LISTBOX GET CELL POSITION:C971(STK_lb_Allocate; $_l_Column; $_l_Row)
				If ($_l_Row>0)
					//Gen_Confirm ("Are you sure you want to reserve on order stock for this order?";"Yes";"No")
					If (OK=1)
						READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
						
						$_l_ItemNumber:=ORDI_al_AllocItemNumbers{$_l_Row}
						$_t_productCode:=ORDI_at_AllocProductCodes{$_l_Row}
						While (Semaphore:C143("LOCKSTOCK"+$_t_productCode))
							DelayTicks(2)
						End while 
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
						SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PurchaseTypeCodes)
						
						//```
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_l_ItemNumber; *)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)  // not already allocated to order items
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_PurchaseTypeCodes)
						$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
						If ($_r_Sum>STK_R_QuantityRequired)
							$_r_Sum:=STK_R_QuantityRequired
						End if 
						$_t_RequestSUM:=Gen_Request("Confirm you would like to reserve  "+String:C10($_r_Sum)+" for this order item"; String:C10($_r_Sum))
						If ($_t_RequestSUM#"")
							$_r_SumNUMBER:=Num:C11($_t_RequestSUM)
							If ($_r_SumNUMBER<$_r_Sum)  //make sure they did not try to reserver extra
								$_r_Sum:=$_r_SumNUMBER
							End if 
							If ($_r_Sum>0)
								$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
								COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$temp")
								
								For ($_l_AllocateIndex; 1; $_l_RecordsinSelection)
									If (STK_R_QuantityRequired>0)
										USE NAMED SELECTION:C332("$temp")
										GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_AllocateIndex)
										
										If (Not:C34(Locked:C147([STOCK_MOVEMENT_ITEMS:27])))
											
											$_r_ToKeepFree:=0
											If ($_r_Sum>0)
												//so if the quantity=1000 we have received 700 and we want 400 $_r_Sum=300
												//f we simple say is quantity > $_r_Sum then the answer is yes and we would keep 1000-300
												//but to make sure the already called off quantity is always retained then i have added this
												//the residual quantity is less than the original quantity..ie we have called some off(Received cancelled etc)
												//we must keep the called off quantity so in the above example 300 if that remainder is greater than the quantity we require we must ALSO keep that quantity
												
												If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
													//The $_r_Sum is no greater than the residual.
													//we have to keep the called off quantityIf ([STOCK ITEMS]XResidualStockQuantity<$_r_Sum)
													//if some have been received have to k
													$_r_ToKeepFree:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
													$_r_Remainder:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_ToKeepFree
													If ($_r_Remainder>$_r_Sum)
														$_r_ToKeepFree:=$_r_ToKeepFree+($_r_Remainder-$_r_Sum)
													End if 
												Else 
													If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>$_r_Sum)
														//if some have been received have to k
														$_r_ToKeepFree:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_Sum
													End if 
												End if 
												ORDI_ar_AllocResidualStockQty{$_l_Row}:=ORDI_ar_AllocResidualStockQty{$_l_Row}-$_r_Sum
												If ($_r_ToKeepFree>0)
													//START TRANSACTION
													StartTransaction
													$_bo_NoCommit:=False:C215
													//Gen_Alert ("Stock item ("+String([STOCK ITEMS]x_ID)+") current quantity is "+String([STOCK ITEMS]Quantity)+"Should retain "+String($_r_ToKeepFree)+" and create an item with "+String($_r_Sum))
													
													STK_ItemDuplicate
													[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
													[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=STK_t_OrderCode
													STK_SetCreatedStockItem(0; $_r_Sum; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; 0; STK_l_OrderItemNumber)
													STK_R_QuantityRequired:=STK_R_QuantityRequired-$_r_Sum
													$_r_Sum:=$_r_Sum-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
													DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
													//Gen_Alert ("Item ("+String([STOCK ITEMS]x_ID)+" ) has been created related to the order tiem")
													
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
													//TRACE
													[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
													[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
													
													DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
													// December 2014 this is a place we should validate the called off quantity on that item because we changed the quantity of the item.
													STK_bo_AllocatedFromPO:=True:C214
													If (Not:C34($_bo_NoCommit))
														//VALIDATE TRANSACTION
														Transact_End(True:C214)
													Else 
														//CANCEL TRANSACTION
														Transact_End(False:C215)
													End if 
													
												Else 
													//did the called off quantity change?
													
													[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
													[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=STK_l_OrderItemNumber
													[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=STK_l_OrderItemNumber
													[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=STK_t_OrderCode
													STK_R_QuantityRequired:=STK_R_QuantityRequired-$_r_Sum
													$_r_Sum:=$_r_Sum-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
													STK_bo_AllocatedFromPO:=True:C214
													DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
													
												End if 
												
											End if 
										Else 
											ALERT:C41("Sorry-The stock item is locked this allocation cannot be might at this moment")
										End if 
									End if 
									
									
								End for 
								If (STK_R_QuantityRequired=0)
									CANCEL:C270
									STK_bo_DoooAllocate:=True:C214
								Else 
									$_r_Remaining:=0
									For ($_l_MoreIndex; 1; Size of array:C274(ORDI_ar_AllocResidualStockQty))
										$_r_Remaining:=$_r_Remaining+ORDI_ar_AllocResidualStockQty{$_l_MoreIndex}
									End for 
									If ($_r_Remaining=0)
										CANCEL:C270
										STK_bo_DoooAllocate:=True:C214
									End if 
								End if 
								
							End if 
						End if 
						CLEAR SEMAPHORE:C144("LOCKSTOCK"+$_t_productCode)
						
					End if 
					
					
				End if 
				
			End if 
			
		End if 
		
	Else 
		If (STK_t_DefAllocationStockType#"")
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ STK_AllocationWIndow.oAllocateandexitButton"; $_t_oldMethodName)
