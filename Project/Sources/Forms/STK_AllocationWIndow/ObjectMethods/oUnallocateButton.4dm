If (False:C215)
	//object Name: Object Name:      STK_AllocationWIndow.oUnallocateButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/10/2013 08:31
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_lb_Allocate;0)
	//ARRAY LONGINT(ORDI_al_AllocItemNumbers;0)
	//ARRAY REAL(ORDI_ar_AllocResidualStockQty;0)
	ARRAY TEXT:C222($_at_AllocationTypes; 0)
	//ARRAY TEXT(ORDI_at_AllocProductCodes;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Retries; $_l_Row; $_l_SalesOINumber; STK_l_AutoUnallocateProc; STK_l_OrderItemNumber; STL_l_CurrentFIlter)
	C_REAL:C285($_r_Sum; STK_R_AllocatedQuantity; STK_R_QuantityRequired)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ STK_AllocationWIndow.oUnallocateButton"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		If (STL_l_CurrentFIlter=1)
			//un-allocate from the current order item
			STK_unallocateinprocess(STK_l_OrderItemNumber; STK_R_AllocatedQuantity)
		Else 
			LISTBOX GET CELL POSITION:C971(STK_lb_Allocate; $_l_Column; $_l_Row)
			If ($_l_Row>0)
				If (STK_R_QuantityRequired>0)
					$_l_SalesOINumber:=ORDI_al_AllocItemNumbers{$_l_Row}
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes)
					QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; ORDI_at_AllocProductCodes)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_SalesOINumber)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationTypes)
					$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
					
					Case of 
						: ($_r_Sum>STK_R_QuantityRequired)
							Gen_Confirm("Unallocate "+String:C10(STK_R_QuantityRequired)+" , or all "+String:C10($_r_Sum); String:C10(STK_R_QuantityRequired); "All")
							If (OK=1)
								//unallocate the required quantity
								$_r_Sum:=STK_R_QuantityRequired
							End if 
							//unallocate all
							
							STK_l_AutoUnallocateProc:=New process:C317("STK_UnallocateinProcess"; 256000; "Unallocate Stock"; $_l_SalesOINumber; $_r_Sum)
							$_l_Retries:=0
							While (Process state:C330(STK_l_AutoUnallocateProc)>=0) & (Process_Name(STK_l_AutoUnallocateProc)="Unallocate Stock")
								
								$_l_Retries:=$_l_Retries+1
								DelayTicks((1*$_l_Retries)*60)
								
							End while 
							ORDI_ar_AllocResidualStockQty{$_l_Row}:=ORDI_ar_AllocResidualStockQty{$_l_Row}-$_r_Sum
							
							Gen_Alert("Exit this screen to Allocate stock to an order")
							
						: ($_r_Sum=STK_R_QuantityRequired)
							Gen_Confirm("Unallocate "+String:C10(STK_R_QuantityRequired); "Yes"; "No")
							If (OK=1)
								//unallocate the required quantity
								$_r_Sum:=STK_R_QuantityRequired
								STK_l_AutoUnallocateProc:=New process:C317("STK_UnallocateinProcess"; 256000; "Unallocate Stock"; $_l_SalesOINumber; $_r_Sum)
								$_l_Retries:=0
								While (Process state:C330(STK_l_AutoUnallocateProc)>=0) & (Process_Name(STK_l_AutoUnallocateProc)="Unallocate Stock")
									$_l_Retries:=$_l_Retries+1
									DelayTicks((1*$_l_Retries)*60)
								End while 
								
								ORDI_ar_AllocResidualStockQty{$_l_Row}:=ORDI_ar_AllocResidualStockQty{$_l_Row}-$_r_Sum
								Gen_Alert("Exit this screen to Allocate stock to an order"; "OK")
							End if 
							OK:=1
							
							
						Else 
							Gen_Confirm("This will not be sufficient to allow allocation to the current order do you wish to unallocated this quantitiy of "+String:C10($_r_Sum); "No"; "Yes")
							If (OK=0)
								OK:=1
								STK_l_AutoUnallocateProc:=New process:C317("STK_UnallocateinProcess"; 256000; "Unallocate Stock"; $_l_SalesOINumber; $_r_Sum)
								$_l_Retries:=0
								While (Process state:C330(STK_l_AutoUnallocateProc)>=0) & (Process_Name(STK_l_AutoUnallocateProc)="Unallocate Stock")
									$_l_Retries:=$_l_Retries+1
									DelayTicks((1*$_l_Retries)*60)
								End while 
								ORDI_ar_AllocResidualStockQty{$_l_Row}:=ORDI_ar_AllocResidualStockQty{$_l_Row}-$_r_Sum
								Gen_Alert("Exit this screen to Allocate stock to an order"; "OK")
							End if 
							
							
					End case 
					
					
					
				End if 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ STK_AllocationWIndow.oUnallocateButton"; $_t_oldMethodName)
