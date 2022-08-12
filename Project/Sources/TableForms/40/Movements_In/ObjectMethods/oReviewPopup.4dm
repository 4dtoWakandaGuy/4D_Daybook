If (False:C215)
	//object Method Name: Object Name:      [STOCK_MOVEMENTS].Movements_in.oReviewPopup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2012 20:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(STK_ad_DeliveryDates;0)
	//ARRAY LONGINT(STK_al_ItemIDS;0)
	//ARRAY REAL(STK_ar_QuantityBefore;0)
	//ARRAY REAL(STK_ar_QuantityExpected;0)
	ARRAY TEXT:C222($_at_DeliveryProductCodes; 0)
	ARRAY TEXT:C222($_at_DeliveryProductNames; 0)
	//ARRAY TEXT(STK_at_DeliveryReferences;0)
	//ARRAY TEXT(STK_at_DeviveryProductCode;0)
	//ARRAY TEXT(STK_at_DeviveryProductName;0)
	C_BOOLEAN:C305(STK_bo_ISO; STK_bo_ReviewCancel; STK_bo_ReviewSave)
	C_DATE:C307(Stk_D_DeliveryDate)
	C_LONGINT:C283($_l_Index; $_l_POItemID; $_l_ProductCodeRow; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; iOK)
	C_REAL:C285($_r_MovedQuantityThisItem; $_r_PurchaseOrderQuantity; $_r_Quantity; $_r_QuantityRemaining; $_r_StockQuantity; $_r_TotalStock)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_oldMethodName; Stk_t_DeliveryReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS].Movements_in.oReviewPopup"; Form event code:C388)
If (STK_at_DeliveryReferences>0)
	If (STK_at_DeliveryReferences{STK_at_DeliveryReferences}#"")
		If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
			DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
			AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		End if 
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=STK_at_DeliveryReferences{STK_at_DeliveryReferences})
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)  //Once copied from cant be adjusted
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
			
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; STK_at_DeviveryProductCode; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; STK_ar_QuantityExpected; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; STK_al_ItemIDS; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40; STK_ar_QuantityBefore)
			QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; STK_at_DeviveryProductCode)
			SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_DeliveryProductCodes; [PRODUCTS:9]Product_Name:2; $_at_DeliveryProductNames)
			ARRAY TEXT:C222(STK_at_DeviveryProductName; 0)
			ARRAY TEXT:C222(STK_at_DeviveryProductName; Size of array:C274(STK_at_DeviveryProductCode))
			For ($_l_Index; 1; Size of array:C274(STK_at_DeviveryProductCode))
				$_l_ProductCodeRow:=Find in array:C230($_at_DeliveryProductCodes; STK_at_DeviveryProductCode{$_l_Index})
				If ($_l_ProductCodeRow>0)
					STK_at_DeviveryProductName{$_l_Index}:=$_at_DeliveryProductNames{$_l_ProductCodeRow}
				End if 
			End for 
			Stk_t_DeliveryReference:=STK_at_DeliveryReferences{STK_at_DeliveryReferences}
			Stk_D_DeliveryDate:=STK_ad_DeliveryDates{STK_at_DeliveryReferences}
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			
			Open window:C153($_l_WindowLeft; $_l_windowTop; $_l_WindowLeft+330; $_l_windowTop+400; 1999)
			STK_bo_ReviewSave:=False:C215
			STK_bo_ReviewCancel:=False:C215
			STK_bo_ISO:=False:C215
			DIALOG:C40("STK_ReviewExpectedDelivery")
			CLOSE WINDOW:C154
			If (STK_bo_ReviewSave)
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				
				For ($_l_Index; 1; Size of array:C274(STK_ar_QuantityExpected))
					If (STK_ar_QuantityBefore{$_l_Index}#STK_ar_QuantityExpected{$_l_Index})
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_al_ItemIDS{$_l_Index})
						Case of 
							: (STK_ar_QuantityExpected{$_l_Index}=0)
								[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=""
								[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=!00-00-00!
							: (STK_ar_QuantityExpected{$_l_Index}>STK_ar_QuantityBefore{$_l_Index})
								If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21#0)
									QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]POitemID:16=[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
									$_r_PurchaseOrderQuantity:=[PURCHASE_ORDERS_ITEMS:169]Quantity:3
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=[PURCHASE_ORDERS_ITEMS:169]POitemID:16)
									$_r_StockQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_al_ItemIDS{$_l_Index})
									$_r_MovedQuantityThisItem:=[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40
									$_r_TotalStock:=($_r_StockQuantity-$_r_MovedQuantityThisItem)+STK_ar_QuantityExpected{$_l_Index}
									If ($_r_TotalStock>$_r_PurchaseOrderQuantity)
										Gen_Confirm("The Purchase order item for this is for a quantity of "+String:C10($_r_PurchaseOrderQuantity)+" do you wish to change the purchase ordered Quantity to "+String:C10($_r_TotalStock)+"?"; "Yes"; "No")
										If (OK=1)
											READ WRITE:C146([PURCHASE_ORDERS:57])
											READ WRITE:C146([PURCHASE_ORDERS_ITEMS:169])
											QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]POitemID:16=[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
											If ([PURCHASE_ORDERS_ITEMS:169]Item_Number:6=0)
												//so here we increased the PO quantity so we can increase the stock item quantity
												[PURCHASE_ORDERS_ITEMS:169]Quantity:3:=$_r_TotalStock
												PurchOrd_SubCal
												<>SYS_t_LastSavedTableName:="PURCHASE_ORDERS_ITEMS"
												SAVE RECORD:C53([PURCHASE_ORDERS_ITEMS:169])
												QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
												QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
												[PURCHASE_ORDERS:57]Total_Cost:4:=Gen_Round(Sum:C1([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5); 2; 2)
												<>SYS_t_LastSavedTableName:="PURCHASE_ORDERS"
												SAVE RECORD:C53([PURCHASE_ORDERS:57])
												UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
												UNLOAD RECORD:C212([PURCHASE_ORDERS_ITEMS:169])
												[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=STK_ar_QuantityExpected{$_l_Index}
												[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
												[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
												[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=Stk_D_DeliveryDate
												[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=Stk_t_DeliveryReference
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
												<>SYS_t_LastSavedTableName:="PURCHASE_ORDERS_ITEMS"
												SAVE RECORD:C53([PURCHASE_ORDERS_ITEMS:169])
												QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
												QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
												[PURCHASE_ORDERS:57]Total_Cost:4:=Gen_Round(Sum:C1([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5); 2; 2)
												<>SYS_t_LastSavedTableName:="PURCHASE_ORDERS"
												SAVE RECORD:C53([PURCHASE_ORDERS:57])
												UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
												STK_ItemDuplicate
												[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
												[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
												[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=""
												[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
												[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=""
												[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=0
												[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=""
												[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=""
												[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=""
												[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
												[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=Stk_D_DeliveryDate
												[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=Stk_t_DeliveryReference
												STK_SetCreatedStockItem(0; ($_r_TotalStock-$_r_Quantity); 0)
											End if 
										Else 
											//quantity exceeds po quantity.... but create new stock item not linke to po item
											STK_ItemDuplicate
											[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21:=0
											[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20:=""
											[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
											[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
											[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=""
											[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=0
											[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=""
											[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=""
											[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=""
											[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=0
											[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=Stk_D_DeliveryDate
											[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=Stk_t_DeliveryReference
											STK_SetCreatedStockItem(0; (STK_ar_QuantityExpected{$_l_Index}-STK_ar_QuantityBefore{$_l_Index}); 0)
											
										End if 
									Else 
										//Quantity does not exceed the po quantity
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=STK_ar_QuantityExpected{$_l_Index}
										[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
										AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										
									End if 
								Else 
									//therer is no po item number
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=STK_ar_QuantityExpected{$_l_Index}
									[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
									AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									
									
								End if 
							: (STK_ar_QuantityExpected{$_l_Index}<STK_ar_QuantityBefore{$_l_Index})
								//test to make sure this updates the copied from stock item iD correctly
								//This is simpler as we wont need to adjust where it copied from from etc or adjust the po item BUT we WILL split the item
								$_r_QuantityRemaining:=STK_ar_QuantityBefore{$_l_Index}-STK_ar_QuantityExpected{$_l_Index}
								[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=STK_ar_QuantityExpected{$_l_Index}
								[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=STK_ar_QuantityExpected{$_l_Index}
								[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
								AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
								STK_ItemDuplicate
								STK_SetCreatedStockItem(0; $_r_QuantityRemaining; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								
								
								
								
								
						End case 
					End if 
				End for 
				//Here reload the stock items
				STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)  //New Call NG May 2004
				
			End if 
			If (STK_bo_ISO)
				//Exist the Stock item and enter an ISO-or whatever is the receipt movement type
				iOK:=1
				POST OUTSIDE CALL:C329(Current process:C322)
				STK_ReceiveFromOnOrder(STK_at_DeliveryReferences{STK_at_DeliveryReferences})
				
			End if 
			
			
			
		Else 
			Gen_Alert("There are no remaining items on this reference that can be adjusted")
			
		End if 
	End if 
	STK_at_DeliveryReferences:=0
	
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENTS].Movements_in.oReviewPopup"; $_t_oldMethodName)
