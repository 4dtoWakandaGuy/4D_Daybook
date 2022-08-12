//%attributes = {}
If (False:C215)
	//Project Method Name:      PurItems_InLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 16:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PersAnOver; DB_bo_RecordModified; PI_bo_ProductFound)
	C_LONGINT:C283(<>PurchPrice2)
	C_POINTER:C301($1)
	C_REAL:C285(vTot)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>SYS_t_StockOrderCompany; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurItems_InLPX")
//Project Method PurItems_InLPX 2/3/2(ID 10668-8544)

//PurItems_InLPX
//Purchases Items Sub
Case of 
		
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Product_Code:1))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
		If (OK=1)
			PI_bo_ProductFound:=False:C215
			Check_Product(->[PURCHASE_INVOICE_ITEMS:158]Product_Code:1; "Product"; ->PI_bo_ProductFound)
			If (PI_bo_ProductFound)
				[PURCHASE_INVOICE_ITEMS:158]Product_Code:1:=[PRODUCTS:9]Product_Code:1
				RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
				If ([PURCHASE_INVOICE_ITEMS:158]Description:13="")
					[PURCHASE_INVOICE_ITEMS:158]Description:13:=[PRODUCTS:9]Product_Name:2
				End if 
				If (([PRODUCTS:9]Price_Per:40>0) & (DB_GetModuleSettingByNUM(1)#5))
					[PURCHASE_INVOICE_ITEMS:158]Price_Per:10:=[PRODUCTS:9]Price_Per:40
				End if 
				If ([PRODUCTS:9]Product_Code:1#"")
					If (([PURCHASE_INVOICE_ITEMS:158]Tax_Code:5=DB_GetLedgerDefaultPurchaseTax) & ([PRODUCTS:9]Default_Tax:23#"") & ([PRODUCTS:9]Default_Tax:23#DB_GetLedgerDefaultSalesTax))
						[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5:=[PRODUCTS:9]Default_Tax:23
					End if 
					If ([PURCHASE_INVOICES:37]Company_Code:2#<>SYS_t_StockOrderCompany)
						QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
						QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[PURCHASE_INVOICES:37]Company_Code:2)
						If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
							READ WRITE:C146([PRODUCTS:9])
							LOAD RECORD:C52([PRODUCTS:9])
							CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
							[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
							[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
							
							[PRODUCTS_SUPPLIERS:148]Company_Code:1:=[PURCHASE_INVOICES:37]Company_Code:2
							DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
							DB_SaveRecord(->[PRODUCTS:9])
							AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
							UNLOAD RECORD:C212([PRODUCTS:9])
							READ ONLY:C145([PRODUCTS:9])
							LOAD RECORD:C52([PRODUCTS:9])
						End if 
						If ([PURCHASE_INVOICE_ITEMS:158]Cost_Price:3=0)
							[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3:=[PRODUCTS_SUPPLIERS:148]Cost_Price:2
						End if 
					End if 
					If (([PURCHASE_INVOICE_ITEMS:158]Sales_Price:15=0) & (<>PurchPrice2#3))
						Case of 
							: (<>PurchPrice2=0)
								[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15:=[PRODUCTS:9]Sales_Price:9
							: (<>PurchPrice2=1)
								[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15:=[PRODUCTS:9]Standard_Price:16
							: (<>PurchPrice2=2)
								QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
								
								QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[PURCHASE_INVOICES:37]Company_Code:2)
								[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15:=[PRODUCTS_SUPPLIERS:148]Standard_Cost:5
						End case 
					End if 
					PurItems_ProdAc
					If ([PURCHASE_INVOICES:37]Analysis_Code:15#"")
						[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[PURCHASE_INVOICES:37]Analysis_Code:15
					Else 
						If (([PRODUCTS:9]Analysis_Code:18#"") & (<>PersAnOver=False:C215))
							RELATE ONE:C42([PRODUCTS:9]Analysis_Code:18)
							If (Records in selection:C76([ANALYSES:36])>0)
								[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[PRODUCTS:9]Analysis_Code:18
							End if 
						End if 
					End if 
					If (([PURCHASE_INVOICES:37]Currency_Code:23#<>SYS_t_BaseCurrency) & ([PURCHASE_INVOICES:37]Currency_Code:23#"") & ([PRODUCTS:9]Product_Code:1#""))
						CurrItem_Convert(->[PURCHASE_INVOICES:37]Currency_Code:23; ->[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3; ->[PURCHASE_INVOICES:37])
					End if 
				End if 
			End if 
			
			[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4:=Gen_Round(([PURCHASE_INVOICE_ITEMS:158]Quantity:2*[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3); 2; 1)
			Purch_ItemCalc
			vTot:=1
		End if 
		
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Description:13))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Description:13)
		
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Quantity:2))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Quantity:2)
		If (OK=1)
			Purch_ItemCalAm
			Purch_ItemCalc
			vTot:=1
		End if 
		
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Price_Per:10))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Price_Per:10)
		If (OK=1)
			Purch_ItemCalAm
			Purch_ItemCalc
			vTot:=1
		End if 
		
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3)
		If (OK=1)
			Purch_ItemProd
			Purch_ItemCalAm
			Purch_ItemCalc
			vTot:=1
		End if 
		
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4)
		If (OK=1)
			//    [PURCHASES_ITEMS]Cost Price:=Gen_Round (([PURCHASES_ITEMS]Cost Amount/
			//([PURCHASES_ITEMS]Quantity/[PURCHASES_ITEMS]Price Per));2;1)
			[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3:=Gen_Round(DivideBy([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4; DivideBy([PURCHASE_INVOICE_ITEMS:158]Quantity:2; [PURCHASE_INVOICE_ITEMS:158]Price_Per:10)); 2; 1)  // 17/02/04 pb
			Purch_ItemCalc
			vTot:=1
		End if 
		
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7)
		If (OK=1)
			[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7:=Gen_Round([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7; 2; 2)
			RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Tax_Code:5)
			If ([TAX_CODES:35]Use_Areas:4)
				[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4:=Gen_Round((([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7/(100+[PURCHASE_INVOICES:37]Tax_Rate:20))*100); 2; 1)
			Else 
				[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4:=Gen_Round((([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7/(100+[TAX_CODES:35]Tax_Rate:3))*100); 2; 1)
			End if 
			[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6:=Gen_Round(([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7-[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4); 2; 5)
			//   [PURCHASES_ITEMS]Cost Price:=Gen_Round (([PURCHASES_ITEMS]Cost Amount/
			//([PURCHASES_ITEMS]Quantity/[PURCHASES_ITEMS]Price Per));2;1)
			[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3:=Gen_Round(DivideBy([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4; DivideBy([PURCHASE_INVOICE_ITEMS:158]Quantity:2; [PURCHASE_INVOICE_ITEMS:158]Price_Per:10)); 2; 1)  // 17/02/04 pb
			vTot:=1
		End if 
		
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5)
		If (OK=1)
			Check_MinorNC(->[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"))
			If ([PURCHASE_INVOICE_ITEMS:158]Tax_Code:5="")
				Purchases_SubTa
			End if 
			Purch_ItemCalc
			vTot:=1
		End if 
		
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6)
		If (OK=1)
			[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7:=[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4+[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6
			vTot:=1
			DB_bo_RecordModified:=True:C214
		End if 
		
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8)
		If (OK=1)
			Check_MinorNC(->[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3)
			If (([PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8#"") & (([TRANSACTION_TYPES:31]D_Range_F:9#"") | ([TRANSACTION_TYPES:31]D_Range_T:10#"")))
				If (([PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8<[TRANSACTION_TYPES:31]D_Range_F:9) | ([PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8>[TRANSACTION_TYPES:31]D_Range_T:10))
					If ([TRANSACTION_TYPES:31]D_Enforce:13)
						Gen_Alert("This Account does not fall within a Purchase Invoice's required range of Purchas"+"e Accounts."; "Try again")
						[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8:=[TRANSACTION_TYPES:31]Debit_Account:4
						REJECT:C38([PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8)
					Else 
						Gen_Confirm("This Account does not fall within a Purchase Invoice's advised range of Purchase"+" Accounts."; "Allow"; "Try again")
						If (OK=0)
							[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8:=[TRANSACTION_TYPES:31]Debit_Account:4
							REJECT:C38([PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8)
						End if 
					End if 
				End if 
			End if 
			If ([PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8="")
				[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8:=[TRANSACTION_TYPES:31]Debit_Account:4
			End if 
			DB_bo_RecordModified:=True:C214
		End if 
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9)
		If (OK=1)
			Check_Analysis(->[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9; "Analysis"; ->[PURCHASE_INVOICES:37]Creditors_Account:13; ->[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8)
			DB_bo_RecordModified:=True:C214
		End if 
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Our_Order_No:11))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Our_Order_No:11)
		If (OK=1)
			[PURCHASE_INVOICE_ITEMS:158]Our_Order_No:11:=Uppercase:C13([PURCHASE_INVOICE_ITEMS:158]Our_Order_No:11)
			DB_bo_RecordModified:=True:C214
		End if 
	: ($1=(->[PURCHASE_INVOICE_ITEMS:158]Item_Number:12))
		Check_SecPInv(->[PURCHASE_INVOICE_ITEMS:158]Item_Number:12)
		If (OK=1)
			Check_MinorNC(->[PURCHASE_INVOICE_ITEMS:158]Item_Number:12; "Order Item"; ->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Item_Number:27; ->[ORDER_ITEMS:25]Product_Code:2)
			DB_bo_RecordModified:=True:C214
		End if 
End case 
ERR_MethodTrackerReturn("PurItems_InLPX"; $_t_oldMethodName)