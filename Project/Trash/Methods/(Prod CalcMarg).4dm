//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Prod CalcMarg
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: Prod CalcMarg`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($_r_SalesPrice)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CostCurrency; $_t_CurrencyCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod CalcMarg")
QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)

FIRST RECORD:C50([PRODUCTS_SUPPLIERS:148])
While (Not:C34(End selection:C36([PRODUCTS_SUPPLIERS:148])))
	If ([PRODUCTS:9]Default_Price_Currency_ID:45=0) | ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
		
		
		$_t_CurrencyCode:=<>SYS_t_BaseCurrency
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
			[PRODUCTS_SUPPLIERS:148]Margin:3:=Round:C94((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2)  //
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
			$_t_CostCurrency:=$_t_CurrencyCode
		Else 
			$_t_CostCurrency:=[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9
		End if 
		If ($_t_CostCurrency=$_t_CurrencyCode)
			[PRODUCTS_SUPPLIERS:148]Margin:3:=Round:C94((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2)
		Else 
			$_r_SalesPrice:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; $_t_CurrencyCode; $_t_CostCurrency; Current date:C33(*))
			[PRODUCTS_SUPPLIERS:148]Margin:3:=Round:C94((DivideBy(($_r_SalesPrice-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); $_r_SalesPrice)*100); 2)  // 17/02/04 pb
		End if 
	End if 
	DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
	NEXT RECORD:C51([PRODUCTS_SUPPLIERS:148])
End while 
ERR_MethodTrackerReturn("Prod CalcMarg"; $_t_oldMethodName)
