If (False:C215)
	//object Method Name: Object Name:      [STOCK_MOVEMENTS].Movements_in.oListBoxMovementitems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/08/2012 21:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(STK_ab_Selected;0)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	ARRAY DATE:C224($_ad_SelectedMovementDates; 0)
	//ARRAY DATE(STK_ad_DeliveryDates;0)
	//ARRAY DATE(STK_ad_DisplayDates;0)
	ARRAY LONGINT:C221($_al_ApplyToIDS; 0)
	ARRAY LONGINT:C221($_al_SelectedMovementIDS; 0)
	ARRAY LONGINT:C221($_al_StockItemIDS; 0)
	//ARRAY LONGINT(STK_al_LineIndex;0)
	//ARRAY LONGINT(STK_al_LineItemIDS;0)
	//ARRAY LONGINT(STK_al_LineItemIndexID;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	ARRAY REAL:C219($_ar_ApplyToQuantities; 0)
	ARRAY REAL:C219($_ar_SelectedMovementQuantities; 0)
	//ARRAY REAL(STK_ar_aisplayQuantities;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_SelectedMovementDelRef; 0)
	ARRAY TEXT:C222($_at_StockDeliverReferences; 0)
	//ARRAY TEXT(SM_at_ModeStockMov;0)
	//ARRAY TEXT(STK_at_DeliveryReferences;0)
	//ARRAY TEXT(STK_at_DisplayReferences;0)
	C_BOOLEAN:C305(STK_bo_ConsolidatedView)
	C_DATE:C307($_d_ExpectedDeliveryDate; $_d_DisplayDateOLD; $_d_ExpectedDeliveryDate)
	C_LONGINT:C283($_l_Column; $_l_ColumnNumber; $_l_CurrentSortColumn; $_l_DeliveryReference2; $_l_DeliveryReferenceColumn; $_l_DeliveryReferenceRow; $_l_event; $_l_ExpectedDateColumn; $_l_FieldNumber; $_l_Index; $_l_LineReference)
	C_LONGINT:C283($_l_Row; $_l_SelectedIndex; $_l_SelectedItemsIndex; $_l_StockItemID; $_l_TableNumber; $_l_ApplyToIndex; $_l_Column; $_l_ColumnNumber; $_l_CurrentSortColumn; $_l_DeliveryReference2; $_l_DeliveryReferenceColumn)
	C_LONGINT:C283($_l_DeliveryReferenceRow; $_l_event; $_l_ExpectedDateColumn; $_l_FieldNumber; $_l_Index; $_l_LineReference; $_l_ReferenceNameRow; $_l_Row; $_l_SelectedIndex; $_l_SelectedItemsIndex; $_l_StockItemID)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301($_ptr_ArrayofArrayPointers; $_Ptr_DeliveryReference; $_Ptr_ExpectedDeliveryDate; $_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_DeliveryReference; $_Ptr_ExpectedDeliveryDate)
	C_REAL:C285($_r_DisplayQuantity; $_r_Remainder; $_r_Selected; $_r_BreakOffQuantity; $_r_DisplayQuantity; $_r_Remainder; $_r_Selected)
	C_TEXT:C284($_t_DeliveryReference; $_t_DisplayReference; $_t_DisplayReferenceOLD; $_t_oldMethodName; $_t_VariableName; STK_t_ApplyMessage; STK_t_ReviewExpectedQuantities; <>SYS_t_LastSavedTableName; $_t_DeliveryReference; $_t_DisplayReference; $_t_DisplayReferenceOLD)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; STK_t_ApplyMessage; STK_t_ReviewExpectedQuantities)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS]Movements_in.oListBoxMovementitems"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->STK_LB_StockItems; ""; $_t_VariableName)
		LBi_AreaScript(->STK_aptr_ItemPreferences; 0; [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems"; $_l_CurrentSortColumn)
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		LISTBOX GET CELL POSITION:C971(STK_LB_StockItems; $_l_ColumnNumber; $_l_Row)
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		LISTBOX GET ARRAYS:C832(STK_LB_StockItems; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		If (STK_bo_ConsolidatedView)
			LISTBOX GET CELL POSITION:C971(STK_LB_StockItems; $_l_Column; $_l_Row)
			//if we are in consolidated view we are changing the ARRAY and this might be SEVERAL stock items
			ARRAY LONGINT:C221($_al_StockItemIDS; 0)
			$_l_LineReference:=STK_al_LineIndex{$_l_Row}
			For ($_l_Index; 1; Size of array:C274(STK_al_LineItemIndexID))
				If (STK_al_LineItemIndexID{$_l_Index}=$_l_LineReference)
					//The record is displayed on this line
					APPEND TO ARRAY:C911($_al_StockItemIDS; STK_al_LineItemIDS{$_l_Index})
				End if 
			End for 
			$_ptr_ArrayFieldPointers:=STK_aptr_ItemPreferences{2}
			
			$_l_DeliveryReferenceColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43)
			$_l_ExpectedDateColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44)
			If ($_l_DeliveryReferenceColumn>0) | ($_l_ExpectedDateColumn>0)
				Case of 
					: ($_l_DeliveryReferenceColumn=$_l_ColumnNumber)
						$_Ptr_DeliveryReference:=$_aptr_ColumnVariables{$_l_ColumnNumber}
						$_Ptr_ExpectedDeliveryDate:=$_aptr_ColumnVariables{$_l_ExpectedDateColumn}
						If ($_Ptr_DeliveryReference->{$_l_Row}#"")
							$_l_DeliveryReferenceRow:=Find in array:C230(STK_at_DeliveryReferences; $_Ptr_DeliveryReference->{$_l_Row})
							ARRAY LONGINT:C221($_al_ApplyToIDS; 0)
							ARRAY REAL:C219($_ar_ApplyToQuantities; 0)
							If (Size of array:C274($_al_StockItemIDS)>1)  //There more than one line
								QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS)
								DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43; $_at_StockDeliverReferences)
								If (Size of array:C274($_at_StockDeliverReferences)>1)
									//User needs to say which records to apply the new reference to.
									SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SelectedMovementIDS; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_SelectedMovementQuantities; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43; $_at_SelectedMovementDelRef; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44; $_ad_SelectedMovementDates)
									ARRAY REAL:C219(STK_ar_aisplayQuantities; 0)
									ARRAY TEXT:C222(STK_at_DisplayReferences; 0)
									ARRAY DATE:C224(STK_ad_DisplayDates; 0)
									For ($_l_SelectedItemsIndex; 1; Size of array:C274($_al_SelectedMovementIDS))
										$_l_DeliveryReferenceColumn:=Find in array:C230(STK_ar_aisplayQuantities; $_at_SelectedMovementDelRef{$_l_SelectedItemsIndex})
										If ($_l_DeliveryReferenceColumn<0)
											APPEND TO ARRAY:C911(STK_ar_aisplayQuantities; $_ar_SelectedMovementQuantities{$_l_SelectedItemsIndex})
											APPEND TO ARRAY:C911(STK_at_DisplayReferences; $_at_SelectedMovementDelRef{$_l_SelectedItemsIndex})
											APPEND TO ARRAY:C911(STK_ad_DisplayDates; $_ad_SelectedMovementDates{$_l_SelectedItemsIndex})
										Else 
											STK_ar_aisplayQuantities{$_l_DeliveryReferenceColumn}:=STK_ar_aisplayQuantities{$_l_DeliveryReferenceColumn}+$_ar_SelectedMovementQuantities{$_l_SelectedItemsIndex}
										End if 
										
									End for 
									//here display a window to allow the user to select which ones to appy the new reference to. note that i am not getting complicated and allowing them to change the quantities on theat window
									//if they were to be able to change the quantity we would then have to split off quantities and would they retain the existing reference or would they have no refernce.
									STK_t_ApplyMessage:="Select the Delivery references you would like changed to "+$_Ptr_DeliveryReference->{$_l_Row}
									Open window:C153((Screen width:C187/2)-100; (Screen height:C188/2)-200; (Screen width:C187/2)+100; (Screen height:C188/2)+200; 4)
									
									DIALOG:C40([STOCK_MOVEMENTS:40]; "STK_ConSolSelectRecords")
									CLOSE WINDOW:C154
									ARRAY LONGINT:C221($_al_ApplyToIDS; 0)
									For ($_l_SelectedIndex; 1; Size of array:C274(STK_ab_Selected))
										If (STK_ab_Selected{$_l_SelectedIndex})
											$_t_DisplayReference:=STK_at_DisplayReferences{$_l_SelectedIndex}
											$_r_DisplayQuantity:=STK_ar_aisplayQuantities{$_l_SelectedIndex}
											$_r_Selected:=0
											For ($_l_DeliveryReference2; 1; Size of array:C274($_at_SelectedMovementDelRef))
												If (($_ar_SelectedMovementQuantities{$_l_DeliveryReference2}+$_ar_SelectedMovementQuantities)<=$_r_DisplayQuantity)
													APPEND TO ARRAY:C911($_al_ApplyToIDS; $_al_SelectedMovementIDS{$_l_DeliveryReference2})
													APPEND TO ARRAY:C911($_ar_ApplyToQuantities; $_ar_SelectedMovementQuantities{$_l_DeliveryReference2})
													$_ar_SelectedMovementQuantities:=$_ar_SelectedMovementQuantities+$_ar_SelectedMovementQuantities{$_l_DeliveryReference2}
												Else 
													$_r_Remainder:=$_r_DisplayQuantity-$_ar_SelectedMovementQuantities
													If ($_r_Remainder>0)
														APPEND TO ARRAY:C911($_al_ApplyToIDS; $_al_SelectedMovementIDS{$_l_DeliveryReference2})
														APPEND TO ARRAY:C911($_ar_ApplyToQuantities; $_r_Remainder)
														$_ar_SelectedMovementQuantities:=$_ar_SelectedMovementQuantities+$_r_Remainder
														$_l_DeliveryReference2:=Size of array:C274($_at_SelectedMovementDelRef)
													End if 
												End if 
											End for 
										End if 
									End for 
									
									
									
								Else 
									//all have the same reference no need to ask
									SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_ApplyToIDS; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_ApplyToQuantities)
									
								End if 
								$_l_StockItemID:=0
							Else 
								If (Size of array:C274($_al_StockItemIDS)>0)
									QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS)
									APPEND TO ARRAY:C911($_al_ApplyToIDS; $_al_StockItemIDS{1})
									APPEND TO ARRAY:C911($_ar_ApplyToQuantities; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									//$_l_StockItemID:=[STOCK ITEMS]x_ID
								End if 
							End if 
							$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
							
							// we now should have at least one line to apply the reference to..
							If (Size of array:C274($_al_ApplyToIDS)>0)
								$_d_ExpectedDeliveryDate:=!00-00-00!
								If ($_l_DeliveryReferenceRow<0)
									Gen_Confirm("Add new Delivery Reference?"; "Yes"; "No")
									If (OK=1)
										
										If ($_l_ExpectedDateColumn>0)
											$_t_DisplayReference:=$_Ptr_DeliveryReference->{$_l_Row}
											$_d_ExpectedDeliveryDate:=Gen_RequestDate("What is the expected Date for this delivery"; Is date:K8:7; Current date:C33+2)
											If ($_d_ExpectedDeliveryDate#!00-00-00!)
												For ($_l_ApplyToIndex; 1; Size of array:C274($_al_ApplyToIDS))
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ApplyToIDS{$_l_ApplyToIndex})
													$_t_DisplayReferenceOLD:=[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43
													$_d_DisplayDateOLD:=[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44
													[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=$_d_ExpectedDeliveryDate
													[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=$_Ptr_DeliveryReference->{$_l_Row}
													AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
													<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
													DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
													//SELECTION TO ARRAY([STOCK ITEMS]x_ID;STK_al_LineItemIDS;[STOCK ITEMS]Item Number;STK_al_LineSalesOrderItem;[STOCK ITEMS]Purchase_Order_Code;STK_at_LinePurchaseOrder;[STOCK ITEMS]Company To;STK_at_CompaniesTo;[STOCK ITEMS]CalledOffQuantity;STK_ar_CalledOffQTY;[STOCK ITEMS]Component Qty;STK_ar_ComponentQTY;[STOCK ITEMS]Cost Price;STK_ar_CostPrice)
													$_l_LineReference:=Find in array:C230(STK_al_LineItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													If ($_l_LineReference>0)  // it should be
													End if 
													
													If ($_ar_ApplyToQuantities{$_l_ApplyToIndex}<=[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
														$_r_BreakOffQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_ar_ApplyToQuantities{$_l_ApplyToIndex}
														[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_ApplyToQuantities{$_l_ApplyToIndex}
														[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
														AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
														<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
														DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
														STK_ItemDuplicate
														[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=$_d_DisplayDateOLD
														[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=$_t_DisplayReferenceOLD
														STK_SetCreatedStockItem(0; ($_r_BreakOffQuantity))
														APPEND TO ARRAY:C911(STK_al_LineItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
														APPEND TO ARRAY:C911(STK_al_LineItemIndexID; STK_al_LineItemIndexID{$_l_DeliveryReferenceColumn})
														APPEND TO ARRAY:C911($_al_StockItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													End if 
												End for 
												QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS)
												DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43; $_at_StockDeliverReferences)
												
												$_t_DeliveryReference:=$_Ptr_DeliveryReference->{$_l_Row}
												If (Size of array:C274($_at_StockDeliverReferences)=1)
													$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=String:C10($_d_ExpectedDeliveryDate; Internal date short:K1:7)
													RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_ExpectedDateColumn}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
													$_Ptr_DeliveryReference->{$_l_Row}:=$_t_DeliveryReference
												Else 
													$_Ptr_ExpectedDeliveryDate->{$_l_Row}:="Multiple"
													RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_ExpectedDateColumn}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
													$_Ptr_DeliveryReference->{$_l_Row}:="Multiple"
												End if 
												
											End if 
										End if 
										$_l_ReferenceNameRow:=Find in array:C230(STK_at_DeliveryReferences; $_t_DeliveryReference)
										If ($_l_ReferenceNameRow<0)
											APPEND TO ARRAY:C911(STK_at_DeliveryReferences; $_t_DeliveryReference)
											APPEND TO ARRAY:C911(STK_ad_DeliveryDates; $_d_ExpectedDeliveryDate)
										End if 
										CLEAR PASTEBOARD:C402
										SET TEXT TO PASTEBOARD:C523($_t_DeliveryReference)
										Gen_Alert("The delivery reference has been copied to the clipboard so you can past it on other rows. Review the expected quantities if part delivery is expected")
										If (Size of array:C274(STK_at_DeliveryReferences)>0)
											OBJECT SET VISIBLE:C603(STK_t_ReviewExpectedQuantities; True:C214)
											OBJECT SET VISIBLE:C603(STK_at_DeliveryReferences; True:C214)
										End if 
									Else 
										$_Ptr_DeliveryReference->{$_l_Row}:=""
									End if 
								Else 
									If ($_l_ExpectedDateColumn>0)
										For ($_l_ApplyToIndex; 1; Size of array:C274($_al_ApplyToIDS))
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ApplyToIDS{$_l_ApplyToIndex})
											$_t_DisplayReferenceOLD:=[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43
											$_d_DisplayDateOLD:=[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44
											[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=STK_ad_DeliveryDates{$_l_DeliveryReferenceRow}
											[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=$_Ptr_DeliveryReference->{$_l_Row}
											AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
											<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
											//SELECTION TO ARRAY([STOCK ITEMS]x_ID;STK_al_LineItemIDS;[STOCK ITEMS]Item Number;STK_al_LineSalesOrderItem;[STOCK ITEMS]Purchase_Order_Code;STK_at_LinePurchaseOrder;[STOCK ITEMS]Company To;STK_at_CompaniesTo;[STOCK ITEMS]CalledOffQuantity;STK_ar_CalledOffQTY;[STOCK ITEMS]Component Qty;STK_ar_ComponentQTY;[STOCK ITEMS]Cost Price;STK_ar_CostPrice)
											$_l_LineReference:=Find in array:C230(STK_al_LineItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											If ($_l_LineReference>0)  // it should be
											End if 
											
											If ($_ar_ApplyToQuantities{$_l_ApplyToIndex}<=[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
												$_r_BreakOffQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_ar_ApplyToQuantities{$_l_ApplyToIndex}
												[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_ApplyToQuantities{$_l_ApplyToIndex}
												AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
												<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
												DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
												STK_ItemDuplicate
												STK_SetCreatedStockItem(0; ($_r_BreakOffQuantity))
												[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=$_d_DisplayDateOLD
												[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=$_t_DisplayReferenceOLD
												[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
												AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
												<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
												DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
												APPEND TO ARRAY:C911(STK_al_LineItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												APPEND TO ARRAY:C911(STK_al_LineItemIndexID; STK_al_LineItemIndexID{$_l_DeliveryReferenceColumn})
												APPEND TO ARRAY:C911($_al_StockItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												
												
											End if 
										End for 
										QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS)
										DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43; $_at_StockDeliverReferences)
										
										//here have to check if the refernce number should be replaced with Multiple
										
										$_t_DeliveryReference:=$_Ptr_DeliveryReference->{$_l_Row}
										If (Size of array:C274($_at_StockDeliverReferences)=1)
											$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=String:C10(STK_ad_DeliveryDates{$_l_DeliveryReferenceRow}; Internal date short:K1:7)  //note thata in tis context the date is displayed in a string
											$_Ptr_DeliveryReference->{$_l_Row}:=$_t_DeliveryReference
										Else 
											$_Ptr_ExpectedDeliveryDate->{$_l_Row}:="Multiple"  //note thata in tis context the date is displayed in a string
											$_Ptr_DeliveryReference->{$_l_Row}:="Multiple"
										End if 
										RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_ExpectedDateColumn}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										//LBi_AreaScript (->STK_aptr_ItemPreferences;0;[STOCK MOVEMENTS]Movement Code;->SM_at_ModeStockMov;$_l_Row;$_t_VariableName;"STK_Lbi_MovItems")
										$_Ptr_DeliveryReference->{$_l_Row}:=$_t_DeliveryReference
									End if 
								End if 
							End if 
						End if 
					: ($_l_ExpectedDateColumn=$_l_ColumnNumber)  //Entering a DATE...
						$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
						
						$_Ptr_DeliveryReference:=$_aptr_ColumnVariables{$_l_DeliveryReferenceColumn}
						$_Ptr_ExpectedDeliveryDate:=$_aptr_ColumnVariables{$_l_ExpectedDateColumn}
						If ($_Ptr_DeliveryReference->{$_l_Row}#"")
							$_l_DeliveryReferenceRow:=Find in array:C230(STK_at_DeliveryReferences; $_Ptr_DeliveryReference->{$_l_Row})
							$_d_ExpectedDeliveryDate:=$_Ptr_ExpectedDeliveryDate->{$_l_Row}
							If ($_l_DeliveryReferenceColumn<0)
								Gen_Confirm("Add new Delivery Reference?"; "Yes"; "No")
								If (OK=1)
									$_t_DeliveryReference:=Gen_Request("What is the Delivery Reference "; "")
									If ($_t_DeliveryReference#"")
										$_d_ExpectedDeliveryDate:=$_Ptr_ExpectedDeliveryDate->{$_l_Row}
										$_Ptr_DeliveryReference->{$_l_Row}:=$_t_DeliveryReference
										RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_DeliveryReferenceColumn}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										LBi_AreaScript(->STK_aptr_ItemPreferences; 0; [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems")
										$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=$_d_ExpectedDeliveryDate
									Else 
										$_d_ExpectedDeliveryDate:=!00-00-00!
										$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=$_d_ExpectedDeliveryDate
									End if 
									If ($_d_ExpectedDeliveryDate#!00-00-00!)
										$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=$_d_ExpectedDeliveryDate
									End if 
									If ($_t_DeliveryReference#"")
										$_l_ReferenceNameRow:=Find in array:C230(STK_at_DeliveryReferences; $_Ptr_DeliveryReference->{$_l_Row})
										If ($_l_ReferenceNameRow<0)
											APPEND TO ARRAY:C911(STK_at_DeliveryReferences; $_Ptr_DeliveryReference->{$_l_Row})
											APPEND TO ARRAY:C911(STK_ad_DeliveryDates; $_d_ExpectedDeliveryDate)
										End if 
										CLEAR PASTEBOARD:C402
										SET TEXT TO PASTEBOARD:C523($_Ptr_DeliveryReference->{$_l_Row})
										Gen_Alert("The delivery reference has been copied to the clipboard so you can past it on other rows. Review the expected quantities if part delivery is expected")
										If (Size of array:C274(STK_at_DeliveryReferences)>0)
											OBJECT SET VISIBLE:C603(STK_t_ReviewExpectedQuantities; True:C214)
											OBJECT SET VISIBLE:C603(STK_at_DeliveryReferences; True:C214)
										End if 
									End if 
								Else 
									$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=!00-00-00!
									
									
								End if 
							Else 
								
								If ($_d_ExpectedDeliveryDate#STK_ad_DeliveryDates{$_l_DeliveryReferenceRow})
									Gen_Confirm("Do you wish to change the expected delivery date of delivery reference "+STK_at_DeliveryReferences{$_l_DeliveryReferenceRow}+" from "+String:C10(STK_ad_DeliveryDates{$_l_DeliveryReferenceRow})+" to "+String:C10($_d_ExpectedDeliveryDate); "No"; "Yes")
									If (OK=1)
										$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=STK_ad_DeliveryDates{$_l_DeliveryReferenceRow}
									Else 
										If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
											AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										End if 
										//here find all the items with that dellivery reference and change them to this date and update STK_ad_DeliveryDates{$_l_DeliveryReferenceRow}
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=STK_at_DeliveryReferences{$_l_DeliveryReferenceRow})
										APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=$_d_ExpectedDeliveryDate)
										STK_ad_DeliveryDates{$_l_DeliveryReferenceRow}:=$_d_ExpectedDeliveryDate
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
										STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
										
									End if 
								Else 
									If ($_l_DeliveryReferenceColumn>0)
										$_d_ExpectedDeliveryDate:=$_Ptr_ExpectedDeliveryDate->{$_l_Row}
										$_Ptr_DeliveryReference:=$_aptr_ColumnVariables{$_l_DeliveryReferenceColumn}
										RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_DeliveryReferenceColumn}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										$_Ptr_DeliveryReference->{$_l_Row}:=STK_at_DeliveryReferences{$_l_DeliveryReferenceRow}
										LBi_AreaScript(->STK_aptr_ItemPreferences; 0; [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems")
										$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=$_d_ExpectedDeliveryDate
									End if 
								End if 
								
							End if 
						Else 
							
						End if 
				End case 
			Else 
				//whatever field we have just changed we need to verify if
			End if 
		Else 
			
			//TRACE
			
			$_ptr_ArrayFieldPointers:=STK_aptr_ItemPreferences{2}
			
			$_l_DeliveryReferenceColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43)
			$_l_ExpectedDateColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44)
			If ($_l_DeliveryReferenceColumn>0) | ($_l_ExpectedDateColumn>0)
				Case of 
					: ($_l_DeliveryReferenceColumn=$_l_ColumnNumber)
						$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
						
						$_Ptr_DeliveryReference:=$_aptr_ColumnVariables{$_l_ColumnNumber}
						$_Ptr_ExpectedDeliveryDate:=$_aptr_ColumnVariables{$_l_ExpectedDateColumn}
						If ($_Ptr_DeliveryReference->{$_l_Row}#"")
							$_l_DeliveryReferenceRow:=Find in array:C230(STK_at_DeliveryReferences; $_Ptr_DeliveryReference->{$_l_Row})
							$_d_ExpectedDeliveryDate:=!00-00-00!
							If ($_l_DeliveryReferenceRow<0)
								Gen_Confirm("Add new Delivery Reference?"; "Yes"; "No")
								If (OK=1)
									
									If ($_l_ExpectedDateColumn>0)
										$_d_ExpectedDeliveryDate:=Gen_RequestDate("What is the expected Date for this delivery"; Is date:K8:7; Current date:C33+2)
										If ($_d_ExpectedDeliveryDate#!00-00-00!)
											$_t_DeliveryReference:=$_Ptr_DeliveryReference->{$_l_Row}
											$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=$_d_ExpectedDeliveryDate
											RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_ExpectedDateColumn}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											LBi_AreaScript(->STK_aptr_ItemPreferences; 0; [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems")
											$_Ptr_DeliveryReference->{$_l_Row}:=$_t_DeliveryReference
											
										End if 
									End if 
									$_l_ReferenceNameRow:=Find in array:C230(STK_at_DeliveryReferences; $_Ptr_DeliveryReference->{$_l_Row})
									If ($_l_ReferenceNameRow<0)
										APPEND TO ARRAY:C911(STK_at_DeliveryReferences; $_Ptr_DeliveryReference->{$_l_Row})
										APPEND TO ARRAY:C911(STK_ad_DeliveryDates; $_d_ExpectedDeliveryDate)
									End if 
									CLEAR PASTEBOARD:C402
									SET TEXT TO PASTEBOARD:C523($_Ptr_DeliveryReference->{$_l_Row})
									Gen_Alert("The delivery reference has been copied to the clipboard so you can past it on other rows. Review the expected quantities if part delivery is expected")
									If (Size of array:C274(STK_at_DeliveryReferences)>0)
										OBJECT SET VISIBLE:C603(STK_t_ReviewExpectedQuantities; True:C214)
										OBJECT SET VISIBLE:C603(STK_at_DeliveryReferences; True:C214)
									End if 
								Else 
									$_Ptr_DeliveryReference->{$_l_Row}:=""
								End if 
							Else 
								If ($_l_ExpectedDateColumn>0)
									
									$_t_DeliveryReference:=$_Ptr_DeliveryReference->{$_l_Row}
									$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=STK_ad_DeliveryDates{$_l_DeliveryReferenceRow}
									RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_ExpectedDateColumn}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
									
									LBi_AreaScript(->STK_aptr_ItemPreferences; 0; [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems")
									$_Ptr_DeliveryReference->{$_l_Row}:=$_t_DeliveryReference
								End if 
							End if 
							$_t_DeliveryReference:=$_Ptr_DeliveryReference->{$_l_Row}
							
							RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_DeliveryReferenceColumn}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							LBi_AreaScript(->STK_aptr_ItemPreferences; 0; [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems")
							
						Else 
							LBi_AreaScript(->STK_aptr_ItemPreferences; 0; [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems")
							
						End if 
					: ($_l_ExpectedDateColumn=$_l_ColumnNumber)  //Entering a DATE...
						$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
						
						$_Ptr_DeliveryReference:=$_aptr_ColumnVariables{$_l_DeliveryReferenceColumn}
						$_Ptr_ExpectedDeliveryDate:=$_aptr_ColumnVariables{$_l_ExpectedDateColumn}
						If ($_Ptr_DeliveryReference->{$_l_Row}#"")
							$_l_DeliveryReferenceRow:=Find in array:C230(STK_at_DeliveryReferences; $_Ptr_DeliveryReference->{$_l_Row})
							$_d_ExpectedDeliveryDate:=$_Ptr_ExpectedDeliveryDate->{$_l_Row}
							If ($_l_DeliveryReferenceColumn<0)
								Gen_Confirm("Add new Delivery Reference?"; "Yes"; "No")
								If (OK=1)
									$_t_DeliveryReference:=Gen_Request("What is the Delivery Reference "; "")
									If ($_t_DeliveryReference#"")
										$_d_ExpectedDeliveryDate:=$_Ptr_ExpectedDeliveryDate->{$_l_Row}
										$_Ptr_DeliveryReference->{$_l_Row}:=$_t_DeliveryReference
										RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_DeliveryReferenceColumn}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										LBi_AreaScript(->STK_aptr_ItemPreferences; 0; [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems")
										$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=$_d_ExpectedDeliveryDate
									Else 
										$_d_ExpectedDeliveryDate:=!00-00-00!
										$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=$_d_ExpectedDeliveryDate
									End if 
									If ($_d_ExpectedDeliveryDate#!00-00-00!)
										$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=$_d_ExpectedDeliveryDate
									End if 
									If ($_t_DeliveryReference#"")
										$_l_ReferenceNameRow:=Find in array:C230(STK_at_DeliveryReferences; $_Ptr_DeliveryReference->{$_l_Row})
										If ($_l_ReferenceNameRow<0)
											APPEND TO ARRAY:C911(STK_at_DeliveryReferences; $_Ptr_DeliveryReference->{$_l_Row})
											APPEND TO ARRAY:C911(STK_ad_DeliveryDates; $_d_ExpectedDeliveryDate)
										End if 
										CLEAR PASTEBOARD:C402
										SET TEXT TO PASTEBOARD:C523($_Ptr_DeliveryReference->{$_l_Row})
										Gen_Alert("The delivery reference has been copied to the clipboard so you can past it on other rows. Review the expected quantities if part delivery is expected")
										If (Size of array:C274(STK_at_DeliveryReferences)>0)
											OBJECT SET VISIBLE:C603(STK_t_ReviewExpectedQuantities; True:C214)
											OBJECT SET VISIBLE:C603(STK_at_DeliveryReferences; True:C214)
										End if 
									End if 
								Else 
									$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=!00-00-00!
									
									
								End if 
							Else 
								
								If ($_d_ExpectedDeliveryDate#STK_ad_DeliveryDates{$_l_DeliveryReferenceRow})
									Gen_Confirm("Do you wish to change the expected delivery date of delivery reference "+STK_at_DeliveryReferences{$_l_DeliveryReferenceRow}+" from "+String:C10(STK_ad_DeliveryDates{$_l_DeliveryReferenceRow})+" to "+String:C10($_d_ExpectedDeliveryDate); "No"; "Yes")
									If (OK=1)
										$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=STK_ad_DeliveryDates{$_l_DeliveryReferenceRow}
									Else 
										If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
											AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										End if 
										//here find all the items with that dellivery reference and change them to this date and update STK_ad_DeliveryDates{$_l_DeliveryReferenceRow}
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=STK_at_DeliveryReferences{$_l_DeliveryReferenceRow})
										APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=$_d_ExpectedDeliveryDate)
										STK_ad_DeliveryDates{$_l_DeliveryReferenceRow}:=$_d_ExpectedDeliveryDate
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
										STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
										
									End if 
								Else 
									If ($_l_DeliveryReferenceColumn>0)
										$_d_ExpectedDeliveryDate:=$_Ptr_ExpectedDeliveryDate->{$_l_Row}
										$_Ptr_DeliveryReference:=$_aptr_ColumnVariables{$_l_DeliveryReferenceColumn}
										RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_DeliveryReferenceColumn}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										$_Ptr_DeliveryReference->{$_l_Row}:=STK_at_DeliveryReferences{$_l_DeliveryReferenceRow}
										LBi_AreaScript(->STK_aptr_ItemPreferences; 0; [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems")
										$_Ptr_ExpectedDeliveryDate->{$_l_Row}:=$_d_ExpectedDeliveryDate
									End if 
								End if 
								
							End if 
						Else 
							LBi_AreaScript(->STK_aptr_ItemPreferences; 0; [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems")
						End if 
					Else 
						LBi_AreaScript(->STK_aptr_ItemPreferences; 0; [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems")
				End case 
			Else 
				LBi_AreaScript(->STK_aptr_ItemPreferences; 0; [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems")
			End if 
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ:Movements_In,STK_LB_StockItems"; $_t_oldMethodName)
