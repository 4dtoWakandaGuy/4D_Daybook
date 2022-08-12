//%attributes = {}
If (False:C215)
	//Project Method Name:      PuOItems_InLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: PuOItems_InLPX
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_StockAllocationTypes; 0)
	C_BOOLEAN:C305($_bo_Reselect; DB_bo_RecordModified)
	C_LONGINT:C283($_l_SelectedRecordNumber)
	C_POINTER:C301($1)
	C_REAL:C285($_r_AllocatedQuantity; $_r_MaximumQuantity; $_r_PurchaseQuantity)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PuOItems_InLPX")
//PuOItems_InLPX
//Purchase Orders Items Sub
Case of 
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1))
		PurchOrd_SubPC
		
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Product_Name:2))
		[PURCHASE_ORDERS_ITEMS:169]Product_Name:2:=Uppers2([PURCHASE_ORDERS_ITEMS:169]Product_Name:2)
		DB_bo_RecordModified:=True:C214
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Description:13))
		DB_bo_RecordModified:=True:C214
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Print_Description:14))
		DB_bo_RecordModified:=True:C214
		
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Price_Code:9))
		Check_MinorNC(->[PURCHASE_ORDERS_ITEMS:169]Price_Code:9; ""; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2; "Price Group")
		If ([PRICE_GROUPS:18]Price_Code:1#"")
			If ([PRICE_GROUPS:18]Cost_Prices:4)
				PriceT_CheckP
			Else 
				Gen_Alert("That Price Group is used for Sales Orders' Sales Prices"+" rather than Purchase Orders' Cost Prices"; "Try again")
				[PURCHASE_ORDERS_ITEMS:169]Price_Code:9:=""
			End if 
		End if 
		DB_bo_RecordModified:=True:C214
		
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Discount:10))
		[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=Gen_Round(([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11*((100-[PURCHASE_ORDERS_ITEMS:169]Discount:10)/100)); 2; 1)
		PurchOrd_SubCal
		PurchOrd_ItemCP
		
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Quantity:3))
		If ([PURCHASE_ORDERS_ITEMS:169]Product_Code:1#"")
			If ([PURCHASE_ORDERS_ITEMS:169]Item_Number:6#0)
				$_r_PurchaseQuantity:=[PURCHASE_ORDERS_ITEMS:169]Quantity:3
				$_bo_Reselect:=False:C215
				If ([ORDER_ITEMS:25]Item_Number:27#[PURCHASE_ORDERS_ITEMS:169]Item_Number:6)
					
					If (Records in selection:C76([ORDER_ITEMS:25])>0)
						$_bo_Reselect:=True:C214
						COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Selection")
						$_l_SelectedRecordNumber:=Selected record number:C246([ORDER_ITEMS:25])
					End if 
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=[PURCHASE_ORDERS_ITEMS:169]Item_Number:6)
					
				End if 
				$_r_MaximumQuantity:=[ORDER_ITEMS:25]Quantity:3
				//take into account allocations from stock..
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_StockAllocationTypes)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_StockAllocationTypes)
				$_r_AllocatedQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				//it matters not if they have been delivered they were allocated from stock
				$_r_MaximumQuantity:=$_r_MaximumQuantity-$_r_AllocatedQuantity
				If ($_bo_Reselect)
					USE NAMED SELECTION:C332("$Selection")
					GOTO SELECTED RECORD:C245([ORDER_ITEMS:25]; $_l_SelectedRecordNumber)
				End if 
				
				If ([PURCHASE_ORDERS_ITEMS:169]Quantity:3>$_r_MaximumQuantity)
					Gen_Alert("Sorry this Purchase order item is direcctly for an order item and the maximum quantity is "+String:C10($_r_MaximumQuantity))
					[PURCHASE_ORDERS_ITEMS:169]Quantity:3:=$_r_MaximumQuantity
					
				End if 
			End if 
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>1)
				If ([PURCHASE_ORDERS_ITEMS:169]Price_Code:9#"")
					PriceT_CheckP
				Else 
					QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=[PURCHASE_ORDERS_ITEMS:169]Product_Code:1; *)
					QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_From:9>0)
					If (Records in selection:C76([PRICE_TABLE:28])>0)
						If ([PURCHASE_ORDERS_ITEMS:169]Price_Code:9#"")
							QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[PURCHASE_ORDERS_ITEMS:169]Price_Code:9)
						End if 
						If (Records in selection:C76([PRICE_TABLE:28])>0)
							PriceT_SearchC2([PURCHASE_ORDERS:57]Company_Code:1)
							If (Records in selection:C76([PRICE_TABLE:28])>0)
								SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
								QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_GROUPS:18]Cost_Prices:4=True:C214)
								SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
								If (Records in selection:C76([PRICE_TABLE:28])>0)
									PriceT_SearchQt([PURCHASE_ORDERS_ITEMS:169]Quantity:3)
									PriceT_CheckCo2([PURCHASE_ORDERS:57]Company_Code:1)
									If (Records in selection:C76([PRICE_TABLE:28])>0)
										If ([PRICE_TABLE:28]Price_Code:2#[PRICE_GROUPS:18]Price_Code:1)
											RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
										End if 
										If ([PRICE_GROUPS:18]Automatic:5)
											PurchOrd_SubPTA
											[PURCHASE_ORDERS_ITEMS:169]Price_Code:9:=[PRICE_TABLE:28]Price_Code:2
										End if 
									Else 
										If (([PURCHASE_ORDERS_ITEMS:169]Price_Code:9#"") | ([PURCHASE_ORDERS_ITEMS:169]Discount:10#0))
											[PURCHASE_ORDERS_ITEMS:169]Price_Code:9:=""
											[PURCHASE_ORDERS_ITEMS:169]Discount:10:=0
											[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
		PurchOrd_SubCal
		
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Price_Per:12))
		PurchOrd_SubCal
		
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4))
		If ([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11=0)
			[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11:=[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4
		End if 
		PurchOrd_SubCal
		PurchOrd_ItemCP
		
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11))
		If ([PURCHASE_ORDERS_ITEMS:169]Cost_Price:4=0)
			[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11
		End if 
		PurchOrd_ItemPr
		PurchOrd_SubCal
		
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5))
		[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=Gen_Round(([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5/([PURCHASE_ORDERS_ITEMS:169]Quantity:3/[PURCHASE_ORDERS_ITEMS:169]Price_Per:12)); 2; 1)
		PurchOrd_ItemPr
		PurchOrd_SubCal
		PurchOrd_ItemCP
		
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Item_Number:6))
		Check_MinorNC(->[PURCHASE_ORDERS_ITEMS:169]Item_Number:6; ""; ->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Item_Number:27; ->[ORDER_ITEMS:25]Product_Code:2; "Order Item")
		DB_bo_RecordModified:=True:C214
		
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7))
		Check_MinorNC(->[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"))
		If ([PURCHASE_ORDERS_ITEMS:169]Tax_Code:7="")
			PurchOrd_Tax
		End if 
		DB_bo_RecordModified:=True:C214
		
	: ($1=(->[PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8))
		Check_MinorNC(->[PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8; ""; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; ->[PURCHASE_INVOICES:37]Company_Code:2; "Purchase Invoice")
		DB_bo_RecordModified:=True:C214
		
End case 
ERR_MethodTrackerReturn("PuOItems_InLPX"; $_t_oldMethodName)
