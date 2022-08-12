//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceT_InLPProd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/03/2010 13:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_CurrencyCode; $_t_oldMethodName; vProduct; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_InLPProd")
If (vProduct#"")
	If ([PRODUCTS:9]Default_Price_Currency_ID:45=0) | ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
		
		vText:="Retail: "+String:C10([PRODUCTS:9]Sales_Price:9; "|Accounts")+"    Standard: "+String:C10([PRODUCTS:9]Standard_Price:16; "|Accounts")
		QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
		$_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
		vText:="Retail: "+$_t_CurrencyCode+String:C10([PRODUCTS:9]Sales_Price:9; "|Accounts")+"    Standard: "+$_t_CurrencyCode+String:C10([PRODUCTS:9]Standard_Price:16; "|Accounts")
	End if 
End if 
ERR_MethodTrackerReturn("PriceT_InLPProd"; $_t_oldMethodName)