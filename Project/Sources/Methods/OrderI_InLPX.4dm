//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_InLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/03/2010 13:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al SupplierPreferred; 0)
	ARRAY REAL:C219($_ar_SupplierCost; 0)
	ARRAY REAL:C219($_ar_SupplierStdCost; 0)
	ARRAY TEXT:C222($_at_SupplierCode; 0)
	ARRAY TEXT:C222($_at_SupplierCostCurrency; 0)
	C_BOOLEAN:C305(<>MargCP; $_bo_OK; DB_bo_RecordModified; ORD_bo_ItemsModified; ORD_bo_OrderModified; ORD_bo_ProductIsFound; ORD_bo_UseCatalogues)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Continue; $_l_CurrentRecord; $_l_RecordsCount; $_l_SuppliersIndex; $_l_SuppliersRecordsCount; $_l_TableNumber; P_Message)
	C_POINTER:C301($1; $2)
	C_REAL:C285(ORD_r_SubSelection; vTot)
	C_TEXT:C284(<>ProdCode; <>SYS_t_BaseCurrency; $_t_CurrencyCode; $_t_MatchData; $_t_oldMethodName; $_t_SalesCurrency; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PROD_t_FunctionName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_InLPX")

//Modified NG to put ORD_bo_ItemsModified in Orders_InLPM
//OrderI_InLPX
//NG march 2004, the following is to handle the context from order lines
If (Count parameters:C259>=2)
	$_l_TableNumber:=Table:C252($2)
Else 
	$_l_TableNumber:=Table:C252(->[ORDERS:24])
End if 

Case of 
	: ($1=(->[ORDER_ITEMS:25]Order_Code:1))
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Order_Code:1; ->[ORDER_ITEMS:25]Item_Locked:16)
			If ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
				//this is coming from the contract so we can offer a selection of lines here
				
			End if 
			
		End if 
		
		If (OK=1)
			If ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				[ORDERS:24]Export:24:=Export_Stamp3([ORDERS:24]Export:24)
				
			End if 
			DB_bo_RecordModified:=True:C214
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Product_Code:2))
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Product_Code:2; ->[ORDER_ITEMS:25]Item_Locked:16)
			
			If (OK=1)
				Case of 
					: ($_l_TableNumber=Table:C252(->[ORDERS:24])) | ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
						
						If ((Old:C35([ORDER_ITEMS:25]Product_Code:2)#"") & ([ORDER_ITEMS:25]Allocated:28>0))
							Gen_Alert("You cannot modify the Product of an Allocated Order Item"; "Cancel")
							
							[ORDER_ITEMS:25]Product_Code:2:=Old:C35([ORDER_ITEMS:25]Product_Code:2)
						Else 
							If (False:C215)  //(ORD_bo_UseCatalogues) | (Current user="Designer") &
								$_t_MatchData:="OrdProdItems"
								//AL_SetDrgDst (eALOrdII;1;$_t_MatchData)
								//AL_SetDrgOpts(eALOrdII;0;30;1;1)  `
								//  AL_UpdateArrays (eALOrdII;-2)
								LBI_SetDRGPair(1; ->ORD_r_SubSelection; $_t_MatchData)
								
								Check_Product_Order(->[ORDER_ITEMS:25]Product_Code:2; "Product"; [ORDER_ITEMS:25]Item_Number:27; True:C214; [ORDER_ITEMS:25]Price_Code:36; [ORDERS:24]Company_Code:1)
							Else 
								PROD_t_FunctionName:="Enter Products from sales orders"
								ORD_bo_ProductIsFound:=False:C215
								Check_Product(->[ORDER_ITEMS:25]Product_Code:2; "Product"; ->ORD_bo_ProductIsFound; ""; [ORDERS:24]Currency_Code:32)
								If (ORD_bo_ProductIsFound)  //| (True)
									$_l_Continue:=OI_SelectSpecialProduct
									Case of 
										: ($_l_Continue=1)
											PROD_t_FunctionName:=""
											OrderI_SubLPPC
											If ([ORDER_ITEMS:25]Supplier_Code:20#"") & ([ORDER_ITEMS:25]Product_Code:2#"")
												$_bo_OK:=OrderI_SubLPSup
												If (Not:C34($_bo_OK))
													[ORDER_ITEMS:25]Supplier_Code:20:=""
												End if 
											End if 
											DB_bo_RecordModified:=True:C214
										: ($_l_Continue=2)
											DB_bo_RecordModified:=True:C214
										Else 
											ORD_bo_ProductIsFound:=False:C215
											[ORDER_ITEMS:25]Product_Code:2:=""
									End case 
								End if 
							End if 
						End if 
					: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
						//this is coming from contracts, here find unassigned order items for this product
						//not going this route
						Check_Sec(->[ORDER_ITEMS:25]Product_Code:2; ->[ORDER_ITEMS:25]Item_Locked:16)
						If (OK=1)
							Check_Product(->[ORDER_ITEMS:25]Product_Code:2; "Product")
							
							Contracts_CompR
							If (Records in selection:C76([PRODUCTS:9])>0)
								$_t_SalesCurrency:=""
								
								If ([PRODUCTS:9]Default_Price_Currency_ID:45=0) | ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
									
									[ORDER_ITEMS:25]Sales_Price:4:=[PRODUCTS:9]Sales_Price:9
								Else 
									If ([CURRENCIES:71]X_ID:3#[PRODUCTS:9]Default_Price_Currency_ID:45)
										If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
											QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
											$_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
										Else 
											$_t_CurrencyCode:=<>SYS_t_BaseCurrency
										End if 
									Else 
										If ([PRODUCTS:9]Default_Price_Currency_ID:45=0)
											$_t_CurrencyCode:=<>SYS_t_BaseCurrency
										Else 
											$_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
										End if 
									End if 
									$_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
									
									If ([ORDERS:24]Currency_Code:32#"")
										$_t_SalesCurrency:=[ORDERS:24]Currency_Code:32
									Else 
										$_t_SalesCurrency:=<>SYS_t_BaseCurrency
									End if 
									If ($_t_SalesCurrency=$_t_CurrencyCode)
										[ORDER_ITEMS:25]Sales_Price:4:=[PRODUCTS:9]Sales_Price:9
									Else 
										[ORDER_ITEMS:25]Sales_Price:4:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; $_t_CurrencyCode; $_t_SalesCurrency; Current date:C33(*))
										
									End if 
									
								End if 
								QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
								ORDER BY:C49([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10; >)
								If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>1)
									$_l_RecordsCount:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])
									$_l_CurrentRecord:=1
									Repeat 
										If ($_l_CurrentRecord<$_l_RecordsCount)
											If ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10=0)
												NEXT RECORD:C51([PRODUCTS_SUPPLIERS:148])
												$_l_CurrentRecord:=$_l_CurrentRecord+1
											End if 
										End if 
									Until ($_l_CurrentRecord=$_l_RecordsCount) | ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10>0)
									If ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10=0)
										ORDER BY:C49([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Cost_Price:2; >)
									End if 
								End if 
								
								ARRAY TEXT:C222($_at_SupplierCostCurrency; 0)
								ARRAY REAL:C219($_ar_SupplierCost; 0)
								ARRAY REAL:C219($_ar_SupplierStdCost; 0)
								ARRAY LONGINT:C221($_al SupplierPreferred; 0)
								ARRAY TEXT:C222($_at_SupplierCode; 0)
								$_l_SuppliersRecordsCount:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])+1
								If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0)
									For ($_l_SuppliersIndex; 1; Records in selection:C76([PRODUCTS_SUPPLIERS:148]))
										APPEND TO ARRAY:C911($_ar_SupplierCost; [PRODUCTS_SUPPLIERS:148]Cost_Price:2)
										APPEND TO ARRAY:C911($_ar_SupplierStdCost; [PRODUCTS_SUPPLIERS:148]Standard_Cost:5)
										If ([PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9="")
											APPEND TO ARRAY:C911($_at_SupplierCostCurrency; <>SYS_t_BaseCurrency)
										Else 
											APPEND TO ARRAY:C911($_at_SupplierCostCurrency; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9)
										End if 
										If ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10>0)
											APPEND TO ARRAY:C911($_al SupplierPreferred; [PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10)
										Else 
											APPEND TO ARRAY:C911($_al SupplierPreferred; $_l_SuppliersRecordsCount)
											$_l_SuppliersRecordsCount:=$_l_SuppliersRecordsCount+1
										End if 
										APPEND TO ARRAY:C911($_at_SupplierCode; [PRODUCTS_SUPPLIERS:148]Company_Code:1)
										
										NEXT RECORD:C51([PRODUCTS_SUPPLIERS:148])
									End for 
									SORT ARRAY:C229($_al SupplierPreferred; $_at_SupplierCode; $_at_SupplierCostCurrency; $_ar_SupplierCost)
									If ($_t_SalesCurrency="")
										If ([ORDER_ITEMS:25]Order_Code:1#"")
											If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
												
												QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
											End if 
											If ([ORDERS:24]Currency_Code:32#"")
												$_t_SalesCurrency:=<>SYS_t_BaseCurrency
											End if 
										Else 
											$_t_SalesCurrency:=<>SYS_t_BaseCurrency
										End if 
									End if 
									If ($_at_SupplierCostCurrency{1}#$_t_SalesCurrency)
										//HAVE TO CONVERT THE COST PRICE
										[ORDER_ITEMS:25]Supplier_Code:20:=$_at_SupplierCode{1}
										[ORDER_ITEMS:25]Cost_Price:5:=Cat_ConvertValue($_ar_SupplierCost{1}; $_at_SupplierCostCurrency{1}; $_t_SalesCurrency; Current date:C33(*))
										[ORDER_ITEMS:25]Standard_Cost:41:=Cat_ConvertValue($_ar_SupplierStdCost{1}; $_at_SupplierCostCurrency{1}; $_t_SalesCurrency; Current date:C33(*))
									Else 
										[ORDER_ITEMS:25]Cost_Price:5:=$_ar_SupplierCost{1}
										[ORDER_ITEMS:25]Standard_Cost:41:=$_ar_SupplierStdCost{1}
										[ORDER_ITEMS:25]Supplier_Code:20:=$_at_SupplierCode{1}
									End if 
									
									Calc_Item
									ContrI_PrGr
								End if 
								
								Calc_Item
								
								ContrI_PrGr
								Orders_InLPTot
							End if 
						End if 
						<>ProdCode:=[PRODUCTS:9]Product_Code:1
						
				End case 
			End if 
			
			If (DB_t_CurrentFormUsage="job@")  //27/03/07 -kmw
				P_Message:=111  //27/03/07 -kmw
				POST OUTSIDE CALL:C329(Current process:C322)  //27/03/07 -kmw
			End if   //27/03/07 -kmw
			
		Else 
			//importing order items
			//product is pre-checked
			If ([ORDER_ITEMS:25]Product_Code:2#"")
				OrderI_SubLPPC
			End if 
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Product_Name:13))  // Not enterable under contracts
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Product_Name:13; ->[ORDER_ITEMS:25]Item_Locked:16)
		End if 
		If (OK=1)
			[ORDER_ITEMS:25]Product_Name:13:=Uppers2([ORDER_ITEMS:25]Product_Name:13)
			DB_bo_RecordModified:=True:C214
			If ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))  //Added NG May 2004
				
				
				If ((Character code:C91(Substring:C12([ORDER_ITEMS:25]Product_Name:13; Length:C16([ORDER_ITEMS:25]Product_Name:13); 1))=64) & ([ORDER_ITEMS:25]Product_Code:2=""))
					MESSAGES OFF:C175
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Name:2=[ORDER_ITEMS:25]Product_Name:13)
					MESSAGES ON:C181
					
					If (Records in selection:C76([PRODUCTS:9])>0)
						OrderI_ProdName
						ContrI_PrGr
						Contracts_CompR
					End if 
				Else 
					[ORDER_ITEMS:25]Product_Name:13:=Uppers2([ORDER_ITEMS:25]Product_Name:13)
				End if 
				
				
			End if 
			
		End if 
		
		
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Description:44))  //not enterable under contract
		DB_bo_RecordModified:=True:C214
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Print_Description:45))  //not enterable under contract
		DB_bo_RecordModified:=True:C214
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Sort_Order:26))  //not enterable under contract
		//OrderI_SortCalc
		//ORD_bo_ItemsModified:=True
	: ($1=(->[ORDER_ITEMS:25]Price_Code:36))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Price_Code:36; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
		End if 
		If (OK=1)
			If (DB_t_CurrentFormUsage#"None")
				Check_MinorNC(->[ORDER_ITEMS:25]Price_Code:36; ""; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2; "Price Group")
				If ([PRICE_GROUPS:18]Price_Code:1#"")
					If ([PRICE_GROUPS:18]Cost_Prices:4)
						Gen_Alert("That Price Group is used for Purchase Orders' Cost Prices"+" rather than Sales Orders' Sales Prices"; "Try again")
						//[PURCHASE ORDERS_ITEMS]Price Code:=""
					Else 
						PriceT_Check
					End if 
				Else 
					PriceT_Check
				End if 
			End if 
			DB_bo_RecordModified:=True:C214
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Discount:37))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Discount:37; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
		End if 
		If (OK=1)
			[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Retail_Price:38*((100-[ORDER_ITEMS:25]Discount:37)/100)); 2; 1)
			Calc_Item
			Orders_InLPTot
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Quantity:3))  //not enterable under contract
		If (Not:C34($_l_TableNumber=Table:C252(->[CONTRACTS:17])))
			OrderI_SubLPQty
			ORD_bo_ItemsModified:=True:C214
		Else 
			[ORDER_ITEMS:25]Quantity:3:=Int:C8([ORDER_ITEMS:25]Quantity:3)
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Price_Per:50))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Price_Per:50; ->[ORDER_ITEMS:25]Item_Locked:16)
		End if 
		If (OK=1)
			Calc_Item
			Orders_InLPTot
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Tax_Code:12))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Tax_Code:12; ->[ORDER_ITEMS:25]Item_Locked:16)
		End if 
		
		If (OK=1)
			If (DB_t_CurrentFormUsage#"None")
				Check_MinorNC(->[ORDER_ITEMS:25]Tax_Code:12; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"))
			End if 
			If ([ORDER_ITEMS:25]Tax_Code:12="")
				RELATE ONE:C42([ORDERS:24]Company_Code:1)
				If ([COMPANIES:2]Default_TAX:41="")
					[ORDER_ITEMS:25]Tax_Code:12:=DB_GetLedgerDefaultSalesTax
				Else 
					[ORDER_ITEMS:25]Tax_Code:12:=[COMPANIES:2]Default_TAX:41
				End if 
			End if 
			Calc_Item
			Orders_InLPTot
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Sales_Price:4))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Sales_Price:4; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
		End if 
		If (OK=1)
			If ([ORDER_ITEMS:25]Retail_Price:38=0)
				[ORDER_ITEMS:25]Retail_Price:38:=[ORDER_ITEMS:25]Sales_Price:4
			End if 
			Calc_Item
			Orders_InLPTot
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Retail_Price:38))  //not enterable under contract
		
		OrderI_SubLPRet
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Cost_Price:5))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Cost_Price:5; ->[ORDER_ITEMS:25]Item_Locked:16)
		End if 
		If (OK=1)
			If ([ORDER_ITEMS:25]Purchase_Order_Number:18="BUNDLE@") & (DB_t_CurrentFormUsage#"None")
				Gen_Alert("You cannot edit the Cost Price of Bundles - edit them at the 'Next Level'"; "Cancel")
				[ORDER_ITEMS:25]Cost_Price:5:=Old:C35([ORDER_ITEMS:25]Cost_Price:5)
			Else 
				Calc_Item
				OrderI_SubCost
				Orders_InLPTot
			End if 
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Cost_Amount:15))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Cost_Amount:15; ->[ORDER_ITEMS:25]Item_Locked:16)
		End if 
		If (OK=1)
			If ([ORDER_ITEMS:25]Purchase_Order_Number:18="BUNDLE@") & (DB_t_CurrentFormUsage#"None")
				Gen_Alert("You cannot edit the Cost Amount of Bundles - edit them at the 'Next Level'"; "Cancel")
				[ORDER_ITEMS:25]Cost_Amount:15:=Old:C35([ORDER_ITEMS:25]Cost_Amount:15)
			Else 
				[ORDER_ITEMS:25]Cost_Price:5:=Gen_Round(([ORDER_ITEMS:25]Cost_Amount:15/([ORDER_ITEMS:25]Quantity:3/[ORDER_ITEMS:25]Price_Per:50)); 2; 2)
				Calc_Item
				OrderI_SubCost
				Orders_InLPTot
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Margin:6))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Margin:6; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
		End if 
		If (OK=1)
			If (<>MargCP)
				[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Cost_Price:5+([ORDER_ITEMS:25]Cost_Price:5*([ORDER_ITEMS:25]Margin:6/100))); 2; 1)
			Else 
				Case of 
					: ([ORDER_ITEMS:25]Margin:6=-100)
						If ([ORDER_ITEMS:25]Cost_Price:5=0)  // You cannot calculate a sales price on something you paid nothing for
							Gen_Alert("A sales price cannot be calculated for this")
							[ORDER_ITEMS:25]Margin:6:=0
						Else 
							[ORDER_ITEMS:25]Sales_Price:4:=0
						End if 
					: ([ORDER_ITEMS:25]Margin:6=100)
						If ([ORDER_ITEMS:25]Cost_Price:5>0)
							Gen_Alert("This is a mathematical impossibility!")
							[ORDER_ITEMS:25]Margin:6:=0
						Else 
							Gen_Alert("A sales price cannot be calculated for this")
						End if 
					: ([ORDER_ITEMS:25]Margin:6>100) | ([ORDER_ITEMS:25]Margin:6<-100)  //You simply cannot have a margin greater than 100%(i have put the -100 in here because that we would be
						Gen_Alert("This is a mathematical impossibility!")
						[ORDER_ITEMS:25]Margin:6:=0
					Else 
						[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Cost_Price:5/(1-([ORDER_ITEMS:25]Margin:6/100))); 2; 1)
				End case 
			End if 
			Calc_Item
			Orders_InLPTot
			//  OrderI_SubCost
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Sales_Amount:7))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Sales_Amount:7; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
		End if 
		If (OK=1)
			Calc_ItemVAT
			[ORDER_ITEMS:25]Total_Amount:9:=Gen_Round(([ORDER_ITEMS:25]Sales_Amount:7+[ORDER_ITEMS:25]TAX_Amount:8); 2; 2)
			If ([ORDER_ITEMS:25]Quantity:3=0)
				[ORDER_ITEMS:25]Sales_Price:4:=0
			Else 
				[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Sales_Amount:7/([ORDER_ITEMS:25]Quantity:3/[ORDER_ITEMS:25]Price_Per:50)); 2; 1)
			End if 
			If ([ORDER_ITEMS:25]Retail_Price:38=0)
				[ORDER_ITEMS:25]Discount:37:=0
			Else 
				[ORDER_ITEMS:25]Discount:37:=Gen_Round(((100-(([ORDER_ITEMS:25]Sales_Price:4/[ORDER_ITEMS:25]Retail_Price:38)*100))); 1; 3)
			End if 
			vTot:=1
			Orders_InLPM
			Orders_InLPTot
			
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]TAX_Amount:8))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]TAX_Amount:8; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
		End if 
		If (OK=1)
			[ORDER_ITEMS:25]Total_Amount:9:=Gen_Round(([ORDER_ITEMS:25]Sales_Amount:7+[ORDER_ITEMS:25]TAX_Amount:8); 2; 2)
			vTot:=1
			Orders_InLPM
			Orders_InLPTot
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Total_Amount:9))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Total_Amount:9; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
		End if 
		
		If (OK=1)
			If ([TAX_CODES:35]Use_Areas:4)
				[ORDER_ITEMS:25]Sales_Amount:7:=Gen_Round((([ORDER_ITEMS:25]Total_Amount:9/(100+[ORDERS:24]Tax_Rate:34))*100); 2; 2)
			Else 
				[ORDER_ITEMS:25]Sales_Amount:7:=Gen_Round((([ORDER_ITEMS:25]Total_Amount:9/(100+[TAX_CODES:35]Tax_Rate:3))*100); 2; 2)
			End if 
			[ORDER_ITEMS:25]TAX_Amount:8:=Gen_Round(([ORDER_ITEMS:25]Total_Amount:9-[ORDER_ITEMS:25]Sales_Amount:7); 2; 5)
			If ([ORDER_ITEMS:25]Quantity:3=0)
				[ORDER_ITEMS:25]Sales_Price:4:=0
			Else 
				[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Sales_Amount:7/([ORDER_ITEMS:25]Quantity:3/[ORDER_ITEMS:25]Price_Per:50)); 2; 1)
			End if 
			If ([ORDER_ITEMS:25]Sales_Price:4=0)
				[ORDER_ITEMS:25]Margin:6:=0
			Else 
				[ORDER_ITEMS:25]Margin:6:=Gen_Round((100-([ORDER_ITEMS:25]Cost_Price:5/[ORDER_ITEMS:25]Sales_Price:4*100)); 2; 4)
			End if 
			vTot:=1
			Orders_InLPM
			Orders_InLPTot
		End if 
		
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Delivery_Date:11))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Delivery_Date:11)
		End if 
		If (OK=1)
			If (Not:C34($_l_TableNumber=Table:C252(->[CONTRACTS:17])))
				
				Orders_InLPM
			End if 
			
		End if 
		ORD_bo_ItemsModified:=True:C214
		
	: ($1=(->[ORDER_ITEMS:25]Serial_Number:24))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Serial_Number:24)
		End if 
		If (OK=1)
			If ((DB_GetModuleSettingByNUM(Module_SerialNos)<2) | (DB_GetModuleSettingByNUM(Module_SerialNos)=3)) & (DB_t_CurrentFormUsage#"None")
				Gen_Alert("You cannot modify the Serial No field"; "Cancel")
				[ORDER_ITEMS:25]Serial_Number:24:=Old:C35([ORDER_ITEMS:25]Serial_Number:24)
			Else 
				RemoveLeadTr(Uppercase:C13([ORDER_ITEMS:25]Serial_Number:24); ->[ORDER_ITEMS:25]Serial_Number:24)
				Orders_InLPM
			End if 
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Person:14))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Person:14)
		End if 
		
		If (OK=1)
			If (DB_t_CurrentFormUsage#"None")
				Check_MinorNC(->[ORDER_ITEMS:25]Person:14; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
			End if 
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Supplier_Code:20))  //not enterable under contract
		//************************************************** added 22/10/08 -kmw ****************************************************
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Supplier_Code:20; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
		End if 
		//******************************************************************************************************************************
		If (OK=1)  //added 22/10/08 -kmw
			$_bo_OK:=OrderI_SubLPSup
			If (Not:C34($_bo_OK))
				[ORDER_ITEMS:25]Supplier_Code:20:=""
			End if 
		End if   //added 22/10/08 -kmw
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Purchase_Order_Number:18))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Purchase_Order_Number:18)
		End if 
		If (OK=1)
			RemoveLeadTr(Uppercase:C13([ORDER_ITEMS:25]Purchase_Order_Number:18); ->[ORDER_ITEMS:25]Purchase_Order_Number:18)
			If ([ORDER_ITEMS:25]Purchase_Order_Date:19=!00-00-00!)
				[ORDER_ITEMS:25]Purchase_Order_Date:19:=<>DB_d_CurrentDate
			End if 
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Purchase_Order_Date:19))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Purchase_Order_Date:19)
		End if 
		If (OK=1)
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Received_Date:21))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Received_Date:21)
		End if 
		
		If (OK=1)
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Invoice_Number:17))
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Invoice_Number:17; ->[ORDER_ITEMS:25]Item_Locked:16)
		End if 
		If (OK=1)
			RemoveLeadTr(Uppercase:C13([ORDER_ITEMS:25]Invoice_Number:17); ->[ORDER_ITEMS:25]Invoice_Number:17)
			RELATE ONE:C42([ORDER_ITEMS:25]Invoice_Number:17)
			If (Records in selection:C76([INVOICES:39])>0)
				If (DB_t_CurrentFormUsage#"None")
					Gen_Alert("You cannot add items to existing Invoices"; "Cancel")
				End if 
				[ORDER_ITEMS:25]Invoice_Number:17:=""
			End if 
			Orders_InLPM
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Invoice_Date:25))
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Invoice_Date:25; ->[ORDER_ITEMS:25]Item_Locked:16)
		End if 
		If (OK=1)
			Orders_InLPM
		End if 
	: ($1=(->[ORDER_ITEMS:25]Contract_Code:29))
		If (DB_t_CurrentFormUsage#"None")
			Check_Minor(->[ORDER_ITEMS:25]Contract_Code:29; "Contract"; ->[CONTRACTS:17]; ->[CONTRACTS:17]Contract_Code:3; ->[CONTRACTS:17]Company_Code:1; "Contracts_In")
		End if 
		If (DB_t_CurrentFormUsage="NAT")
			
		Else 
			
		End if 
		OrderI_SubRel
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Job_Code:34))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Job_Code:34)
		End if 
		If (OK=1)
			If (DB_t_CurrentFormUsage#"None")
				Check_MinorNC(->[ORDER_ITEMS:25]Job_Code:34; ""; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2; "Job")
			End if 
			If ([JOBS:26]Job_Code:1#"")
				If (DB_t_CurrentFormUsage#"None")
					JobsTC_JobCheck(->[ORDER_ITEMS:25]Job_Code:34; False:C215)
				End if 
				If (([JOBS:26]Job_Code:1#"") & ([JOBS:26]Stage_Code:18#""))
					[ORDER_ITEMS:25]Job_Stage:35:=[JOBS:26]Stage_Code:18
				End if 
			End if 
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Job_Stage:35))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Job_Stage:35)
		End if 
		
		If (OK=1)
			Case of 
				: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
					[ORDER_ITEMS:25]Job_Stage:35:=Uppercase:C13([ORDER_ITEMS:25]Job_Stage:35)
				Else 
					If ([ORDER_ITEMS:25]Job_Code:34="")
						//Then maybe we are not creating jobs just putting job stages onto the order items
						
						If (DB_t_CurrentFormUsage#"None")
							//Gen_Alert ("Please first complete the Job Code")
						End if 
						QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=[ORDER_ITEMS:25]Job_Stage:35+"@"; *)
						QUERY:C277([STAGES:45];  | ; [STAGES:45]Stage_Name:2=[ORDER_ITEMS:25]Job_Stage:35+"@")
						If (Records in selection:C76([STAGES:45])>1)
							Check_List(->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2; "Job Stage")
						End if 
						[ORDER_ITEMS:25]Job_Stage:35:=[STAGES:45]Stage_Code:1
					Else 
						If (Modified record:C314([JOB_STAGES:47]))
							DB_SaveRecord(->[JOB_STAGES:47])
						End if 
						CUT NAMED SELECTION:C334([JOB_STAGES:47]; "$JS")
						QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[ORDER_ITEMS:25]Job_Code:34; *)
						QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=[ORDER_ITEMS:25]Job_Stage:35)
						If (Records in selection:C76([JOB_STAGES:47])>1)
							If (DB_t_CurrentFormUsage#"None")
								Check_List(->[JOB_STAGES:47]Stage_Code:2; ->[JOB_STAGES:47]Stage_Name:3; "Job Stage")
							End if 
							//Check_MinorNC (»[ORDER ITEMS]Job Stage;"";»[STAGES]
							//;»[STAGES]Stage Code;»[STAGES]Stage Name;"Stage")
						End if 
						[ORDER_ITEMS:25]Job_Stage:35:=[JOB_STAGES:47]Stage_Code:2
						QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[ORDER_ITEMS:25]Job_Code:34; *)
						QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=[ORDER_ITEMS:25]Job_Stage:35)
						If (([ORDER_ITEMS:25]Job_Stage:35#"") & ([ORDER_ITEMS:25]Job_Code:34#"") & (DB_t_CurrentFormUsage#"JobTC"))
							If (Records in selection:C76([JOB_STAGES:47])=0)
								If (DB_t_CurrentFormUsage#"None")
									Gen_Alert("That Job Stage has not been defined for the Job"; "Try again")
								End if 
								[ORDER_ITEMS:25]Job_Stage:35:=Old:C35([ORDER_ITEMS:25]Job_Stage:35)
								REJECT:C38([ORDER_ITEMS:25]Job_Stage:35)
							Else 
								If (([JOB_STAGES:47]Invoice_Number:10#"") & ([JOB_STAGES:47]Invoice_Number:10#"N")) & (DB_t_CurrentFormUsage#"None")
									If ([JOBS:26]Use_WIP:47)
										
										Gen_Confirm("That Job Stage has already been Invoiced.  "+"Any WIP will be Written Off.  Are you sure?"; "Try again"; "Yes")
										
									Else 
										Gen_Confirm("Are you sure that you want to allocate this Item to"+" a Job Stage that has already been Invoiced?"; "Try again"; "Yes")
									End if 
									If (OK=1)
										[ORDER_ITEMS:25]Job_Stage:35:=Old:C35([ORDER_ITEMS:25]Job_Stage:35)
										REJECT:C38([ORDER_ITEMS:25]Job_Stage:35)
									End if 
								End if 
							End if 
						End if 
						If ([ORDER_ITEMS:25]Job_Stage:35="")
							[ORDER_ITEMS:25]State:46:="A"
						End if 
						USE NAMED SELECTION:C332("$JS")
					End if 
			End case 
			
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]State:46))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]State:46)
		End if 
		If (OK=1)
			If (([ORDER_ITEMS:25]Job_Stage:35="") & ([ORDER_ITEMS:25]State:46#"A"))
				If (DB_t_CurrentFormUsage#"None")
					Gen_Alert("The State can only be A - Actual unless a Job Stage is allocated"; "OK")
				End if 
				[ORDER_ITEMS:25]State:46:="A"
			Else 
				If ((DB_GetModuleSettingByNUM(1)=5) & ([ORDER_ITEMS:25]State:46#"A"))
					If (DB_t_CurrentFormUsage#"None")
						Gen_Alert("The State can only be A - Actual in Daybook Silver"; "OK")
					End if 
					[ORDER_ITEMS:25]State:46:="A"
				Else 
					If (([ORDER_ITEMS:25]State:46#"A") & ([ORDER_ITEMS:25]State:46#"B"))
						If (DB_t_CurrentFormUsage#"None")
							Gen_Alert("The State must be A - Actual or B - Budget"; "OK")
						End if 
						[ORDER_ITEMS:25]State:46:="A"
					Else 
						RemoveLeadTr(Uppercase:C13([ORDER_ITEMS:25]State:46); ->[ORDER_ITEMS:25]State:46)
					End if 
				End if 
			End if 
			vTot:=1
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Supply_by_Date:31))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Supply_by_Date:31)
		End if 
		If (OK=1)
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Received_Date:21))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Received_Date:21)
		End if 
		
		If (OK=1)
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Supplier_Invoice_Number:22))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Supplier_Invoice_Number:22)
		End if 
		If (OK=1)
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Supplier_Reference:33))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Supplier_Reference:33)
		End if 
		
		If (OK=1)
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Supplier_Delivery_Number:23))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Supplier_Delivery_Number:23)
		End if 
		
		If (OK=1)
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Level_Up_Item_Number:48))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Level_Up_Item_Number:48)
		End if 
		
		If (OK=1)
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Component_Level:47))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Component_Level:47)
		End if 
		
		If (OK=1)
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Finance_Method:32))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Finance_Method:32)
		End if 
		If (OK=1)
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
	: ($1=(->[ORDER_ITEMS:25]Required_Date:10))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Required_Date:10)
		End if 
		
		If (OK=1)
			Orders_InLPM
		End if 
		ORD_bo_ItemsModified:=True:C214
End case 
If (True:C214)
	Macro_AccTypePt($1)
End if 
ERR_MethodTrackerReturn("OrderI_InLPX"; $_t_oldMethodName)