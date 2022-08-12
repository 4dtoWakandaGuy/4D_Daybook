//%attributes = {}

If (False:C215)
	//Database Method Name:      ACC_balanceSetOutputCurrency
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/07/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_CurrencyCodes;0)
	C_BOOLEAN:C305(DB_bo_ShowArrayBased)
	C_LONGINT:C283($_l_CurrentLevel)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_NewCurrency; $_t_oldMethodName; ACC_t_OutputCurrency)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_balanceSetOutputCurrency")
ALL RECORDS:C47([CURRENCIES:71])
SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; STK_at_CurrencyCodes)
$_t_NewCurrency:=Gen_RequestWithList("Select the currency to display these balance in"; <>SYS_t_BaseCurrency; "Continue"; "Stop"; 0; 0; "Currencies"; 0; ""; "STK_at_CurrencyCodes")
If ($_t_NewCurrency#"")
	ACC_t_OutputCurrency:=$_t_NewCurrency
	If (DB_bo_ShowArrayBased)
		$_l_CurrentLevel:=LAY_LOADACCOUNTBALANCESARRAYS
	End if 
End if 
ERR_MethodTrackerReturn("ACC_balanceSetOutputCurrency"; $_t_oldMethodName)