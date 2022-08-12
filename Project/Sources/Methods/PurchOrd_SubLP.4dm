//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_SubLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 15:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_SubLP")
//Purchases Items Sub
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Product_Code:1))
				PurchOrd_SubPC
				
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Product_Name:2))
				[PURCHASE_ORDERS_ITEMS:169]Product_Name:2:=Uppers2([PURCHASE_ORDERS_ITEMS:169]Product_Name:2)
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Price_Code:9))
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
				
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Discount:10))
				[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=Gen_Round(([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11*((100-[PURCHASE_ORDERS_ITEMS:169]Discount:10)/100)); 2; 1)
				PurchOrd_SubCal
				
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Quantity:3))
				If ([PURCHASE_ORDERS_ITEMS:169]Product_Code:1#"")
					If ([PRICE_GROUPS:18]Price_Code:1#"")
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
									PriceT_SearchQt
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
											//                  [PURCHASE ORDERS_ITEMS]Price Code:=""
											[PURCHASE_ORDERS_ITEMS:169]Discount:10:=0
											[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
					PurchOrd_SubCal
				End if 
				
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Cost_Price:4))
				If ([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11=0)
					[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11:=[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4
				End if 
				PurchOrd_SubCal
				PurchOrd_ItemCP
				
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11))
				If ([PURCHASE_ORDERS_ITEMS:169]Cost_Price:4=0)
					[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11
				End if 
				PurchOrd_ItemPr
				PurchOrd_SubCal
				
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5))
				[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=Gen_Round(([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5/[PURCHASE_ORDERS_ITEMS:169]Quantity:3); 2; 1)
				PurchOrd_SubCal
				PurchOrd_ItemCP
				
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Item_Number:6))
				Check_MinorNC(->[PURCHASE_ORDERS_ITEMS:169]Item_Number:6; ""; ->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Item_Number:27; ->[ORDER_ITEMS:25]Product_Code:2; "Order Item")
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Tax_Code:7))
				Check_MinorNC(->[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"))
				If ([PURCHASE_ORDERS_ITEMS:169]Tax_Code:7="")
					PurchOrd_Tax
				End if 
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8))
				Check_MinorNC(->[PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8; ""; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; ->[PURCHASE_INVOICES:37]Company_Code:2; "Purchase Invoice")
				DB_bo_RecordModified:=True:C214
				
		End case 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		If (([PURCHASE_ORDERS_ITEMS:169]Product_Name:2="") & ([PURCHASE_ORDERS_ITEMS:169]Product_Code:1#""))
			RELATE ONE:C42([PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
			[PURCHASE_ORDERS_ITEMS:169]Product_Name:2:=[PRODUCTS:9]Product_Name:2
		End if 
		If ([PURCHASE_ORDERS_ITEMS:169]Quantity:3=0)
			[PURCHASE_ORDERS_ITEMS:169]Quantity:3:=1
		End if 
		If ([PURCHASE_ORDERS_ITEMS:169]Tax_Code:7="")
			PurchOrd_Tax
		End if 
End case 
ERR_MethodTrackerReturn("PurchOrd_SubLP"; $_t_oldMethodName)