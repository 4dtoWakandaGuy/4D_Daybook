//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ProdSupp InLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: ProdSupp InLPX`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vMod2)
	C_POINTER:C301($1)
	C_REAL:C285($_r_SalesPrice)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CurrencyCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProdSupp InLPX")
//ProdSupp InLPX
Case of 
	: ($1=(->[PRODUCTS_SUPPLIERS:148]Company_Code:1))
		Check_Company(->[PRODUCTS_SUPPLIERS:148]Company_Code:1; ->[CONTACTS:1]Contact_Code:2; ->[PRODUCTS:9])
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
			
			If ([COMPANIES:2]Default_Currency:59#"")
				[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9:=[COMPANIES:2]Default_Currency:59
			End if 
		End if 
		
		Products_InMod
	: ($1=(->[PRODUCTS_SUPPLIERS:148]Cost_Price:2)) | ($1=(->[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9))
		If ($1=(->[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9))
			Check_MinorNC(->[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
		End if 
		
		If ([PRODUCTS:9]Sales_Price:9=0)
			[PRODUCTS_SUPPLIERS:148]Margin:3:=0
		Else 
			If ([PRODUCTS:9]Default_Price_Currency_ID:45=0) | ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
				
				If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
					//      [PRODUCTS_SUPPLIERS]Margin:=Round(((([PRODUCTS]Sales Price-
					//[PRODUCTS_SUPPLIERS]Cost Price)/[PRODUCTS]Sales Price)*100);2)
					[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2)
				Else 
					$_t_CurrencyCode:=<>SYS_t_BaseCurrency
					If ([PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9="")
						[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9:=$_t_CurrencyCode
					End if 
					If ([PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9=$_t_CurrencyCode)
						[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2)  // 17/02/04 pb
						
					Else 
						$_r_SalesPrice:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; $_t_CurrencyCode; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; Current date:C33(*))
						[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(($_r_SalesPrice-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); $_r_SalesPrice)*100); 2)  // 17/02/04 pb
						
					End if 
				End if 
			Else 
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
				$_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
				If ([PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9="")
					[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9:=$_t_CurrencyCode
				End if 
				If ([PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9=$_t_CurrencyCode)
					[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2)  // 17/02/04 pb
					
				Else 
					$_r_SalesPrice:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; $_t_CurrencyCode; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; Current date:C33(*))
					[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(($_r_SalesPrice-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); $_r_SalesPrice)*100); 2)  // 17/02/04 pb
					
				End if 
				
				
			End if 
		End if 
		Products_InMod
		vMod2:=True:C214
	: ($1=(->[PRODUCTS_SUPPLIERS:148]Standard_Cost:5))
		Products_InMod
		vMod2:=True:C214
	: ($1=(->[PRODUCTS_SUPPLIERS:148]Margin:3))
		[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=Round:C94(([PRODUCTS:9]Sales_Price:9*((100-[PRODUCTS_SUPPLIERS:148]Margin:3)/100)); 2)
		Products_InMod
		vMod2:=True:C214
	: ($1=(->[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4))
		[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4:=Uppercase:C13([PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4)
		Products_InMod
End case 
ERR_MethodTrackerReturn("ProdSupp InLPX"; $_t_oldMethodName)
