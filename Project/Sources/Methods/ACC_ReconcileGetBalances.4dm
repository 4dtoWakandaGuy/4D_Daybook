//%attributes = {}

If (False:C215)
	//Database Method Name:      ACC_ReconcileGetBalances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_TRDates; 0)
	ARRAY REAL:C219($_ar_Balance; 0)
	ARRAY REAL:C219($_ar_TRAmounts; 0)
	ARRAY TEXT:C222($_at_aAccountCodes; 0)
	ARRAY TEXT:C222($_at_AccCUrrencyCode; 0)
	ARRAY TEXT:C222($_at_AccountCodeRange; 0)
	ARRAY TEXT:C222($_at_AccountNameRange; 0)
	ARRAY TEXT:C222($_at_analysesRange; 0)
	ARRAY TEXT:C222($_at_CurrencyCodes; 0)
	ARRAY TEXT:C222($_at_layersRange; 0)
	ARRAY TEXT:C222($_at_TRCurrency; 0)
	C_LONGINT:C283($_l_Balance2; $_l_Balance3; $_l_CalcBalance; $_l_CurrentSelectionCount; vNo)
	C_REAL:C285($_r_Balance; $_r_ClosingBalance; $_r_Subtotal; vBalance; vSubtotal; vTotal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AccountsTitle; $_t_BankAccountRangeFrom; $_t_BankAccountRangeTo; $_t_Currency; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_ReconcileGetBalances")

//DB_GetPreference("Bank Accounts";->$_t_BankAccountRangeFrom;->$_t_BankAccountRangeTo)
If (Records in selection:C76([TRANSACTIONS:29])>0)
	DISTINCT VALUES:C339([TRANSACTIONS:29]Account_Code:3; $_at_AccountCodeRange)
	DISTINCT VALUES:C339([TRANSACTIONS:29]Currency_Code:22; $_at_CurrencyCodes)
	If (Size of array:C274($_at_CurrencyCodes)=1)
		$_t_Currency:=$_at_CurrencyCodes{1}
	Else 
		$_t_Currency:=<>SYS_t_BaseCurrency
	End if 
	DISTINCT VALUES:C339([TRANSACTIONS:29]Analysis_Code:2; $_at_analysesRange)
	DISTINCT VALUES:C339([TRANSACTIONS:29]Layer_Code:23; $_at_layersRange)
	
	QUERY WITH ARRAY:C644([ACCOUNTS:32]Account_Code:2; $_at_AccountCodeRange)
	If (Records in selection:C76([ACCOUNTS:32])=1)
		$_t_AccountsTitle:="Bank Reconciliation: "+[ACCOUNTS:32]Account_Name:3
	Else 
		SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; $_at_AccountCodeRange; [ACCOUNTS:32]Account_Name:3; $_at_AccountNameRange)
		SORT ARRAY:C229($_at_AccountCodeRange; $_at_AccountNameRange)
		$_t_AccountsTitle:="Bank Reconciliation: "+$_at_AccountNameRange{1}+" - "+$_at_AccountNameRange{Size of array:C274($_at_AccountNameRange)}
	End if 
	COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "$CurrentSelection")
	$_l_CurrentSelectionCount:=Records in selection:C76([TRANSACTIONS:29])
	
	//QUERY WITH ARRAY([TRANSACTIONS]Account_Code;$_at_AccountCodeRange)
	//QUERY SELECTION WITH ARRAY([TRANSACTIONS]Layer_Code;$_at_layersRange)
	//QUERY SELECTION WITH ARRAY([TRANSACTIONS]Analysis_Code;$_at_analysesRange)
	//QUERY SELECTION WITH ARRAY([TRANSACTIONS]Currency_Code;$_at_CurrencyCodes)
	//QUERY SELECTION([TRANSACTIONS];[TRANSACTIONS]Reconciled=True)
	QUERY WITH ARRAY:C644([TRANSACTIONS:29]Account_Code:3; $_at_AccountCodeRange)
	QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Layer_Code:23; $_at_layersRange)
	QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Analysis_Code:2; $_at_analysesRange)
	QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Currency_Code:22; $_at_CurrencyCodes)
	QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=True:C214)
	$_l_Balance3:=0
	SELECTION TO ARRAY:C260([TRANSACTIONS:29]Amount:6; $_ar_TRAmounts; [TRANSACTIONS:29]Currency_Code:22; $_at_TRCurrency; [TRANSACTIONS:29]Trans_Date:5; $_ad_TRDates)
	For ($_l_CalcBalance; 1; Size of array:C274($_ar_TRAmounts))
		$_l_Balance3:=$_l_Balance3+GEN_CONVERT($_at_TRCurrency{$_l_CalcBalance}; $_ar_TRAmounts{$_l_CalcBalance}; $_ad_TRDates{$_l_CalcBalance}; $_t_Currency)
	End for 
	
	QUERY WITH ARRAY:C644([ACCOUNT_BALANCES:34]Account_Code:2; $_at_AccountCodeRange)
	QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Layer_Code:5; $_at_layersRange)
	QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Analysis_Code:1; $_at_analysesRange)
	QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Currency_Code:6; $_at_CurrencyCodes)
	$_r_Balance:=0
	DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; $_at_AccCUrrencyCode)
	$_r_Balance:=CUR_CalcBalConv(->$_at_AccCUrrencyCode; $_t_Currency)
	//that is the converted value of the balances of these accounts.
	
	
	//vBalance:=Round((Sum([ACCOUNT_BALANCES]Balance));2)
	
	QUERY WITH ARRAY:C644([TRANSACTIONS:29]Account_Code:3; $_at_AccountCodeRange)
	QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Layer_Code:23; $_at_layersRange)
	QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Analysis_Code:2; $_at_analysesRange)
	QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Currency_Code:22; $_at_CurrencyCodes)
	QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
	$_l_Balance2:=0
	SELECTION TO ARRAY:C260([TRANSACTIONS:29]Amount:6; $_ar_TRAmounts; [TRANSACTIONS:29]Currency_Code:22; $_at_TRCurrency; [TRANSACTIONS:29]Trans_Date:5; $_ad_TRDates)
	For ($_l_CalcBalance; 1; Size of array:C274($_ar_TRAmounts))
		$_l_Balance2:=$_l_Balance2+GEN_CONVERT($_at_TRCurrency{$_l_CalcBalance}; $_ar_TRAmounts{$_l_CalcBalance}; $_ad_TRDates{$_l_CalcBalance}; $_t_Currency)
	End for 
	
	
	$_r_ClosingBalance:=Round:C94(($_r_Balance-($_l_Balance2)); 2)
	$_r_Subtotal:=0
	
	USE NAMED SELECTION:C332("$CurrentSelection")
	
	vSubtotal:=0
	vTotal:=vBalance
End if 
ERR_MethodTrackerReturn("ACC_ReconcileGetBalances"; $_t_oldMethodName)