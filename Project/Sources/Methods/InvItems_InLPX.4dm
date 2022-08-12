//%attributes = {}
If (False:C215)
	//Project Method Name:      InvItems_InLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/03/2010 13:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_ProdUpdateAccess; <>PersAnOver; $_bo_Continue; DB_bo_RecordModified; INV_bo_ProductFound)
	C_POINTER:C301($1)
	C_REAL:C285(vTot)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CurrencyCode; $_t_oldMethodName; $_t_ProductCurrencyCode; $_t_SalesCurrency)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("InvItems_InLPX")
//Project Method InvItems_InLPX 2/3/2(ID 12281-9048)

//InvItems_InLPX
Case of 
	: ($1=(->[INVOICES_ITEMS:161]Product_Code:1))
		Check_SecInv(->[INVOICES_ITEMS:161]Product_Code:1; 1)
		If (OK=1)
			INV_bo_ProductFound:=False:C215
			Check_Product(->[INVOICES_ITEMS:161]Product_Code:1; "Product"; ->INV_bo_ProductFound)
			If (INV_bo_ProductFound)
				If (([INVOICES_ITEMS:161]Tax_Code:6=DB_GetLedgerDefaultSalesTax) & ([PRODUCTS:9]Default_Tax:23#""))
					[INVOICES_ITEMS:161]Tax_Code:6:=[PRODUCTS:9]Default_Tax:23
				End if 
				
				If ([PRODUCTS:9]Product_Name:2#"")
					[INVOICES_ITEMS:161]Product_Name:2:=[PRODUCTS:9]Product_Name:2
				End if 
				If ([PRODUCTS:9]Description:6#"")
					[INVOICES_ITEMS:161]Description:13:=[PRODUCTS:9]Description:6
				End if 
				If (([PRODUCTS:9]Price_Per:40>0) & (DB_GetModuleSettingByNUM(1)#5))
					[INVOICES_ITEMS:161]Price_Per:16:=[PRODUCTS:9]Price_Per:40
				End if 
				If ([INVOICES_ITEMS:161]Quantity:3=0)
					[INVOICES_ITEMS:161]Quantity:3:=1
					Inv_ItemCalAm
				End if 
				If ([PRODUCTS:9]Sales_Price:9>0)
					$_t_SalesCurrency:=[INVOICES:39]Currency_Code:27
					If ($_t_SalesCurrency="")
						$_t_SalesCurrency:=<>SYS_t_BaseCurrency
					End if 
					If ([PRODUCTS:9]Default_Price_Currency_ID:45=0) | ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
						
						[INVOICES_ITEMS:161]Sales_Price:4:=[PRODUCTS:9]Sales_Price:9
					Else 
						QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
						$_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
						If ($_t_CurrencyCode=$_t_SalesCurrency)
							[INVOICES_ITEMS:161]Sales_Price:4:=[PRODUCTS:9]Sales_Price:9
						Else 
							[INVOICES_ITEMS:161]Sales_Price:4:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; $_t_CurrencyCode; $_t_SalesCurrency; Current date:C33(*))
						End if 
					End if 
					//[INVOICES_ITEMS]Sales Price:=[PRODUCTS]Sales Price
					
					Inv_ItemCalAm
				End if 
				If ([PRODUCTS:9]Sales_Account:7#"")
					If ((([TRANSACTION_TYPES:31]C_Range_F:11="") & ([TRANSACTION_TYPES:31]C_Range_T:12="")) | ([TRANSACTION_TYPES:31]C_Enforce:14=False:C215) | (([PRODUCTS:9]Sales_Account:7>=[TRANSACTION_TYPES:31]C_Range_F:11) & ([PRODUCTS:9]Sales_Account:7<=[TRANSACTION_TYPES:31]C_Range_T:12)))
						RELATE ONE:C42([PRODUCTS:9]Sales_Account:7)
						If (Records in selection:C76([ACCOUNTS:32])>0)
							[INVOICES_ITEMS:161]Sales_Account:9:=[PRODUCTS:9]Sales_Account:7
						End if 
					End if 
				End if 
				If ([INVOICES:39]Analysis_Code:17#"")
					[INVOICES_ITEMS:161]Analysis_Code:10:=[INVOICES:39]Analysis_Code:17
				Else 
					If (([PRODUCTS:9]Analysis_Code:18#"") & (<>PersAnOver=False:C215))
						RELATE ONE:C42([PRODUCTS:9]Analysis_Code:18)
						If (Records in selection:C76([ANALYSES:36])>0)
							[INVOICES_ITEMS:161]Analysis_Code:10:=[PRODUCTS:9]Analysis_Code:18
						End if 
					End if 
				End if 
				If (([INVOICES:39]Currency_Code:27#<>SYS_t_BaseCurrency) & ([INVOICES:39]Currency_Code:27#"") & ([PRODUCTS:9]Product_Code:1#""))
					PriceT_SearchCu([INVOICES:39]Currency_Code:27)
					If (Records in selection:C76([PRICE_TABLE:28])>0)
						[INVOICES_ITEMS:161]Sales_Price:4:=[PRICE_TABLE:28]Price_Discount:3
						Inv_ItemCalAm
					Else 
						CurrItem_Convert(->[INVOICES:39]Currency_Code:27; ->[INVOICES_ITEMS:161]Sales_Price:4; ->[INVOICES:39])
						Inv_ItemCalAm
					End if 
				End if 
			End if 
			Inv_ItemCalc
		End if 
		
	: ($1=(->[INVOICES_ITEMS:161]Product_Name:2))
		Check_SecInv(->[INVOICES_ITEMS:161]Product_Name:2)
		DB_bo_RecordModified:=True:C214
	: ($1=(->[INVOICES_ITEMS:161]Description:13))
		DB_bo_RecordModified:=True:C214
	: ($1=(->[INVOICES_ITEMS:161]Print_Description:14))
		DB_bo_RecordModified:=True:C214
	: ($1=(->[INVOICES_ITEMS:161]Quantity:3))
		Check_SecInv(->[INVOICES_ITEMS:161]Quantity:3; 1)
		If (OK=1)
			// [INVOICES_ITEMS]Quantity:=Abs([INVOICES_ITEMS]Quantity)
			Inv_ItemCalAm
			Inv_ItemCalc
		End if 
	: ($1=(->[INVOICES_ITEMS:161]Price_Per:16))
		Check_SecInv(->[INVOICES_ITEMS:161]Price_Per:16; 1)
		If (OK=1)
			Inv_ItemCalAm
			Inv_ItemCalc
		End if 
		
	: ($1=(->[INVOICES_ITEMS:161]Sales_Price:4))
		Check_SecInv(->[INVOICES_ITEMS:161]Sales_Price:4; 1)
		If (OK=1)
			If ((DB_GetModuleSettingByNUM(Module_Products)#3) & (<>PER_bo_ProdUpdateAccess))
				RELATE ONE:C42([INVOICES_ITEMS:161]Product_Code:1)
				If ([PRODUCTS:9]Price_Updates:25)
					//NG the additional new options only apply to the supplier not the price
					If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
						QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
						$_t_ProductCurrencyCode:=[CURRENCIES:71]Currency_Code:1
					Else 
						$_t_ProductCurrencyCode:=[INVOICES:39]Currency_Code:27
					End if 
					If (([INVOICES_ITEMS:161]Product_Code:1#"") & ([INVOICES_ITEMS:161]Sales_Price:4#[PRODUCTS:9]Sales_Price:9))
						Gen_Confirm("Do you want to update the Product's Sales Price?"; "Yes"; "No")
						If (OK=1)
							READ WRITE:C146([PRODUCTS:9])
							LOAD RECORD:C52([PRODUCTS:9])
							[PRODUCTS:9]Sales_Price:9:=[INVOICES_ITEMS:161]Sales_Price:4
							DB_SaveRecord(->[PRODUCTS:9])
							AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
							UNLOAD RECORD:C212([PRODUCTS:9])
							READ ONLY:C145([PRODUCTS:9])
							LOAD RECORD:C52([PRODUCTS:9])
						End if 
					End if 
				End if 
			End if 
			Inv_ItemCalAm
			Inv_ItemCalc
		End if 
		
	: ($1=(->[INVOICES_ITEMS:161]Amount:5))
		Check_SecInv(->[INVOICES_ITEMS:161]Amount:5; 1)
		If (OK=1)
			[INVOICES_ITEMS:161]Sales_Price:4:=Gen_Round(([INVOICES_ITEMS:161]Amount:5/([INVOICES_ITEMS:161]Quantity:3/[INVOICES_ITEMS:161]Price_Per:16)); 2; 1)
			Inv_ItemCalc
		End if 
		
	: ($1=(->[INVOICES_ITEMS:161]Tax_Code:6))
		Check_SecInv(->[INVOICES_ITEMS:161]Tax_Code:6)
		If (OK=1)
			Check_MinorNC(->[INVOICES_ITEMS:161]Tax_Code:6; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"))
			If ([INVOICES_ITEMS:161]Tax_Code:6#"")
				If (([INVOICES:39]UK_EC:21="E") & ([INVOICES:39]TAX_Registration_Number:20#""))
					Gen_Alert("The VAT Code should be Z for EC Sales to VAT-Registered Customers"; "")
					[INVOICES_ITEMS:161]Tax_Code:6:="Z"
				End if 
			Else 
				If ([COMPANIES:2]Default_TAX:41="")
					[INVOICES_ITEMS:161]Tax_Code:6:=DB_GetLedgerDefaultSalesTax
				Else 
					[INVOICES_ITEMS:161]Tax_Code:6:=[COMPANIES:2]Default_TAX:41
				End if 
			End if 
			Inv_ItemCalc
		End if 
	: ($1=(->[INVOICES_ITEMS:161]Tax_Amount:7))
		Check_SecInv(->[INVOICES_ITEMS:161]Tax_Amount:7)
		If (OK=1)
			[INVOICES_ITEMS:161]Total_Amount:8:=Round:C94(([INVOICES_ITEMS:161]Amount:5+[INVOICES_ITEMS:161]Tax_Amount:7); 2)
			vTot:=1
			DB_bo_RecordModified:=True:C214
		End if 
	: ($1=(->[INVOICES_ITEMS:161]Total_Amount:8))
		Check_SecInv(->[INVOICES_ITEMS:161]Total_Amount:8; 1)
		If (OK=1)
			[INVOICES_ITEMS:161]Total_Amount:8:=Gen_Round([INVOICES_ITEMS:161]Total_Amount:8; 2; 2)
			RELATE ONE:C42([INVOICES_ITEMS:161]Tax_Code:6)
			If ([TAX_CODES:35]Use_Areas:4)
				[INVOICES_ITEMS:161]Amount:5:=Gen_Round((([INVOICES_ITEMS:161]Total_Amount:8/(100+[INVOICES:39]Tax_Rate:28))*100); 2; 2)
			Else 
				[INVOICES_ITEMS:161]Amount:5:=Gen_Round((([INVOICES_ITEMS:161]Total_Amount:8/(100+[TAX_CODES:35]Tax_Rate:3))*100); 2; 2)
			End if 
			[INVOICES_ITEMS:161]Tax_Amount:7:=Gen_Round(([INVOICES_ITEMS:161]Total_Amount:8-[INVOICES_ITEMS:161]Amount:5); 2; 5)
			[INVOICES_ITEMS:161]Sales_Price:4:=Gen_Round(([INVOICES_ITEMS:161]Amount:5/([INVOICES_ITEMS:161]Quantity:3/[INVOICES_ITEMS:161]Price_Per:16)); 2; 1)
			vTot:=1
			DB_bo_RecordModified:=True:C214
		End if 
	: ($1=(->[INVOICES_ITEMS:161]Sales_Account:9))
		Check_SecInv(->[INVOICES_ITEMS:161]Sales_Account:9)
		If (OK=1)
			Check_MinorNC(->[INVOICES_ITEMS:161]Sales_Account:9; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3)
			If ([INVOICES_ITEMS:161]Sales_Account:9#"")
				$_bo_Continue:=Trans_SubLPLayerCode(->[INVOICES_ITEMS:161]Sales_Account:9; ->[INVOICES:39]Layer_Code:38; 1)
			End if 
			If ([INVOICES_ITEMS:161]Sales_Account:9#"")
				$_bo_Continue:=Check_AnalAcc(->[INVOICES_ITEMS:161]Sales_Account:9; ->[INVOICES_ITEMS:161]Analysis_Code:10; 1)
			End if 
			If (([INVOICES_ITEMS:161]Sales_Account:9#"") & (([TRANSACTION_TYPES:31]C_Range_F:11#"") | ([TRANSACTION_TYPES:31]C_Range_T:12#"")))
				If (([INVOICES_ITEMS:161]Sales_Account:9<[TRANSACTION_TYPES:31]C_Range_F:11) | ([INVOICES_ITEMS:161]Sales_Account:9>[TRANSACTION_TYPES:31]C_Range_T:12))
					If ([TRANSACTION_TYPES:31]C_Enforce:14)
						Gen_Alert("This Account does not fall within an Invoice's required range of Sales"+" Accounts."; "Try again")
						[INVOICES_ITEMS:161]Sales_Account:9:=[TRANSACTION_TYPES:31]Credit_Account:5
						REJECT:C38([INVOICES_ITEMS:161]Sales_Account:9)
					Else 
						Gen_Confirm("This Account does not fall within an Invoice's advised range of Sales"+" Accounts."; "Allow"; "Try again")
						If (OK=0)
							[INVOICES_ITEMS:161]Sales_Account:9:=[TRANSACTION_TYPES:31]Credit_Account:5
							REJECT:C38([INVOICES_ITEMS:161]Sales_Account:9)
						End if 
					End if 
				End if 
			End if 
			If ([INVOICES_ITEMS:161]Sales_Account:9="")
				[INVOICES_ITEMS:161]Sales_Account:9:=[TRANSACTION_TYPES:31]Credit_Account:5
			End if 
			DB_bo_RecordModified:=True:C214
		End if 
	: ($1=(->[INVOICES_ITEMS:161]Analysis_Code:10))
		Check_SecInv(->[INVOICES_ITEMS:161]Analysis_Code:10)
		If (OK=1)
			Check_Analysis(->[INVOICES_ITEMS:161]Analysis_Code:10; "Analysis"; ->[INVOICES_ITEMS:161]Sales_Account:9; ->[INVOICES:39]Debtors_Account:15)
			DB_bo_RecordModified:=True:C214
		End if 
End case 
ERR_MethodTrackerReturn("InvItems_InLPX"; $_t_oldMethodName)