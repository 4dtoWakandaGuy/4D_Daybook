//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceT_CheckCur
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  24/07/2010 09:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_ProductCurrency)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_CheckCur")
//PriceT_Check Currency
If (([ORDERS:24]Currency_Code:32#<>SYS_t_BaseCurrency) & ([ORDERS:24]Currency_Code:32#""))
	If (([PRODUCTS:9]Product_Code:1#""))
		PriceT_SearchCu([ORDERS:24]Currency_Code:32)
		If (Records in selection:C76([PRICE_TABLE:28])>0)
			[ORDER_ITEMS:25]Price_Code:36:=[PRICE_TABLE:28]Price_Code:2
			[ORDER_ITEMS:25]Retail_Price:38:=[PRICE_TABLE:28]Price_Discount:3
			[ORDER_ITEMS:25]Sales_Price:4:=[PRICE_TABLE:28]Price_Discount:3
			Calc_Item
		Else 
			//NG Only ask this if the price CAME from the product AND if the product price currency is not the same!
			If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
				If ([CURRENCIES:71]X_ID:3#[PRODUCTS:9]Default_Price_Currency_ID:45)
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
				End if 
				$_t_ProductCurrency:=[CURRENCIES:71]Currency_Code:1
			Else 
				$_t_ProductCurrency:=<>SYS_t_BaseCurrency
			End if 
			//TRACE
			If ([PRODUCTS:9]Sales_Price:9#0) & ([ORDERS:24]Currency_Code:32#$_t_ProductCurrency)
				If ([PRODUCTS:9]Sales_Price:9=[ORDER_ITEMS:25]Retail_Price:38)  //the price is not converted
					
					CurrItem_Convert(->[ORDERS:24]Currency_Code:32; ->[ORDER_ITEMS:25]Retail_Price:38; ->[ORDER_ITEMS:25])
					[ORDER_ITEMS:25]Sales_Price:4:=[ORDER_ITEMS:25]Retail_Price:38
					CurrItem_Conv2(->[ORDER_ITEMS:25]Standard_Price:39)
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))>1)
						PriceT_CheckCo
					End if 
				Else 
					[ORDER_ITEMS:25]Sales_Price:4:=[ORDER_ITEMS:25]Retail_Price:38
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))>1)
						PriceT_CheckCo
					End if 
				End if 
				Calc_Item
			Else 
				[ORDER_ITEMS:25]Sales_Price:4:=[ORDER_ITEMS:25]Retail_Price:38
				If ((DB_GetModuleSettingByNUM(Module_PriceTable))>1)
					PriceT_CheckCo
				End if 
			End if 
			Calc_Item
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PriceT_CheckCur"; $_t_oldMethodName)
