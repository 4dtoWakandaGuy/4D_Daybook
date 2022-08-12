//%attributes = {}

If (False:C215)
	//Database Method Name:      ACC_GetReconciledBalances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(VBALANCE)
	ARRAY BOOLEAN:C223($_abo_Reconcilled; 0)
	ARRAY DATE:C224($_ad_ConvertDate; 0)
	ARRAY DATE:C224($_ad_PeriodRateDateFrom; 0; 0)
	ARRAY DATE:C224($_ad_PeriodRateDateTo; 0; 0)
	ARRAY DATE:C224($_ad_TransactionsDate; 0)
	ARRAY DATE:C224($_ad_TransDate; 0)
	ARRAY LONGINT:C221($_al_accMultiCurValuation; 0)
	ARRAY LONGINT:C221($_al_RecordsCount; 0)
	ARRAY LONGINT:C221($_al_TransactionID; 0)
	ARRAY REAL:C219($_ar_accountRecTotal; 0)
	ARRAY REAL:C219($_ar_accountTotal; 0)
	ARRAY REAL:C219($_ar_accountUnrecTotal; 0)
	ARRAY REAL:C219($_ar_ActAmount; 0)
	ARRAY REAL:C219($_ar_actTaxAmount; 0)
	ARRAY REAL:C219($_ar_ConvertRate; 0)
	ARRAY REAL:C219($_ar_PeriodConvertRate; 0; 0)
	ARRAY REAL:C219($_ar_PeriodRates; 0)
	ARRAY REAL:C219($_ar_ReturnReconciledBalance; 0)
	ARRAY REAL:C219($_ar_ReturnTotalBalance; 0)
	ARRAY REAL:C219($_ar_ReturnUnreconciledBalance; 0)
	ARRAY REAL:C219($_ar_TaxAmount; 0)
	ARRAY REAL:C219($_ar_TransactionAmount; 0)
	ARRAY TEXT:C222($_at_AccountCodeRange; 0)
	ARRAY TEXT:C222($_at_AccountIDENT; 0)
	ARRAY TEXT:C222($_at_AccountNameRange; 0)
	ARRAY TEXT:C222($_at_AccountsLists; 0)
	ARRAY TEXT:C222($_at_ActAccountCodes; 0)
	ARRAY TEXT:C222($_at_ActAnalysisCode; 0)
	ARRAY TEXT:C222($_at_actCurrencyCodes; 0)
	ARRAY TEXT:C222($_at_actLayerCode; 0)
	ARRAY TEXT:C222($_at_ActPeriodCodes; 0)
	ARRAY TEXT:C222($_at_ACtSort; 0)
	ARRAY TEXT:C222($_at_aCurrencyRatesChecked; 0)
	ARRAY TEXT:C222($_at_analysesRange; 0)
	ARRAY TEXT:C222($_at_CurrencyCodes; 0)
	ARRAY TEXT:C222($_at_CurrencyToConvert; 0)
	ARRAY TEXT:C222($_at_layersRange; 0)
	ARRAY TEXT:C222($_at_PeriodCUrrency; 0)
	ARRAY TEXT:C222($_at_ReturnAccountCode; 0)
	ARRAY TEXT:C222($_at_ReturnCurrencyCode; 0)
	ARRAY TEXT:C222($_at_ThisaccountCurrencyCodes; 0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_CalcLast; $_bo_RoState; $_bo_Variants; $_bo_CalcLast; $_bo_RoState; $_bo_Variants)
	C_DATE:C307($_d_EarliestDate; $_d_firstDayofMomth; $_d_LastToDate; $_d_LatestDate; $_d_PeriodFromDate; $_d_TransactionDate; $_d_EarliestDate; $_d_firstDayofMomth; $_d_LastToDate; $_d_LatestDate; $_d_PeriodFromDate)
	C_DATE:C307($_d_TransactionDate)
	C_LONGINT:C283($_l_accRef; $_l_AccTotalRef; $_l_BuildBalances; $_l_BuildOUtput; $_l_CarryOn; $_l_CheckByAccount; $_l_CheckByCurrency; $_l_CheckVariance; $_l_CurRateReference; $_l_CurrentRow; $_l_Dayof)
	C_LONGINT:C283($_l_Element; $_l_Empty; $_l_FilltoDate; $_l_FILLTOTAL; $_l_FindBlank; $_l_FindBlank2; $_l_FindVariant; $_l_index; $_l_Index4; $_l_LastEndsAt; $_l_NextLastEndssat)
	C_LONGINT:C283($_l_NextLastStartsat; $_l_PeriodID; $_l_PeriodRate; $_l_PeriodRateCurrent; $_l_PreviousPeriodRate; $_l_Ref; $_l_Sizeofarray; $_l_VariantNumber; $_l_VariantNumber2; $_l_accRef; $_l_AccTotalRef)
	C_LONGINT:C283($_l_BuildBalances; $_l_BuildOUtput; $_l_CarryOn; $_l_CheckByAccount; $_l_CheckByCurrency; $_l_CheckVariance; $_l_CurRateReference; $_l_CurrentRow; $_l_Dayof; $_l_Element; $_l_Empty)
	C_LONGINT:C283($_l_FilltoDate; $_l_FILLTOTAL; $_l_FindBlank; $_l_FindBlank2; $_l_FindVariant; $_l_index; $_l_Index4; $_l_LastEndsAt; $_l_NextLastEndssat; $_l_NextLastStartsat; $_l_PeriodID)
	C_LONGINT:C283($_l_PeriodRate; $_l_PeriodRateCurrent; $_l_PreviousPeriodRate; $_l_Ref; $_l_Sizeofarray; $_l_VariantNumber; $_l_VariantNumber2)
	C_POINTER:C301($_ptr_AccountBalances; $_ptr_AccountCodes; $_ptr_CurrencyCodes; $_ptr_Reconciled; $_ptr_Unreconciled; $1; $2; $3; $4; $5; $_ptr_AccountBalances)
	C_POINTER:C301($_ptr_AccountCodes; $_ptr_CurrencyCodes; $_ptr_Reconciled; $_ptr_Unreconciled; $1; $2; $3; $4; $5)
	C_REAL:C285($_r_Balance; $_r_ConvertedBalance; $_r_Rate; $_r_RecoAddTotal; $_r_Reconciled; $_r_ReconcilledBalance; $_r_ThisAmount; $_r_TotalBalance; $_r_UnRecoAddTotal; $_r_unReconciled; VBALANCE)
	C_REAL:C285($_r_accountBalance; $_r_Balance; $_r_ConvertedBalance; $_r_Rate; $_r_RecoAddTotal; $_r_Reconciled; $_r_ReconcilledBalance; $_r_ThisAmount; $_r_TotalBalance; $_r_UnRecoAddTotal; $_r_unReconciled)
	C_REAL:C285($_r_UnReconcilledBalance)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AccountsTitle; $_t_Currency; $_t_LastAccountIdent; $_t_oldMethodName; $_t_OutputCurrency; $_t_PreviousPeriodCode; $_t_RecoAddTotal; $_t_UnRecoAddTotal; ACC_t_OutputCurrency; <>SYS_t_BaseCurrency)
	C_TEXT:C284($_t_accountIDent; $_t_AccountsTitle; $_t_Currency; $_t_LastAccountIdent; $_t_oldMethodName; $_t_OutputCurrency; $_t_PreviousPeriodCode)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_GetReconciledBalances")
If (Count parameters:C259>=5)
	$_ptr_AccountCodes:=$1
	$_ptr_CurrencyCodes:=$2
	$_ptr_AccountBalances:=$3
	$_ptr_Reconciled:=$4
	$_ptr_Unreconciled:=$5
	
	
Else 
	//for some testing
	
	If (DB_GetSalesLedgerBankFrom#"")
		If (DB_GetSalesLedgerBankTo#"")
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3>=DB_GetSalesLedgerBankFrom; *)
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankFrom; *)
		End if 
		If (DB_GetSalesLedgerBankTo#"")
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3<=DB_GetSalesLedgerBankTo)
		Else 
			QUERY:C277([TRANSACTIONS:29])
			
		End if 
	Else 
		QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankTo)
	End if 
End if 
//TRACE

COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "$CurrentSelection")
DISTINCT VALUES:C339([TRANSACTIONS:29]Account_Code:3; $_at_AccountCodeRange)
DISTINCT VALUES:C339([TRANSACTIONS:29]Currency_Code:22; $_at_CurrencyCodes)

If (Size of array:C274($_at_CurrencyCodes)=1)
	$_t_Currency:=$_at_CurrencyCodes{1}
Else 
	$_t_Currency:=<>SYS_t_BaseCurrency
End if 

ARRAY TEXT:C222($_at_aCurrencyRatesChecked; 0)
ARRAY TEXT:C222($_at_aCurrencyRatesChecked; Size of array:C274($_at_CurrencyCodes))
DISTINCT VALUES:C339([TRANSACTIONS:29]Analysis_Code:2; $_at_analysesRange)
DISTINCT VALUES:C339([TRANSACTIONS:29]Layer_Code:23; $_at_layersRange)
QUERY WITH ARRAY:C644([ACCOUNTS:32]Account_Code:2; $_at_AccountCodeRange)
Case of 
	: (Records in selection:C76([ACCOUNTS:32])=1)
		SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; $_at_AccountCodeRange; [ACCOUNTS:32]Account_Name:3; $_at_AccountNameRange; [ACCOUNTS:32]Multicurrency_Valuation:10; $_al_accMultiCurValuation)
		
		$_t_AccountsTitle:="Bank Reconciliation: "+[ACCOUNTS:32]Account_Name:3
	: (Records in selection:C76([ACCOUNTS:32])>1)
		SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; $_at_AccountCodeRange; [ACCOUNTS:32]Account_Name:3; $_at_AccountNameRange; [ACCOUNTS:32]Multicurrency_Valuation:10; $_al_accMultiCurValuation)
		SORT ARRAY:C229($_at_AccountCodeRange; $_at_AccountNameRange)
		$_t_AccountsTitle:="Bank Reconciliation: "+$_at_AccountNameRange{1}+" - "+$_at_AccountNameRange{Size of array:C274($_at_AccountNameRange)}
	Else 
		
		//SELECTION TO ARRAY([ACCOUNTS]Account_Code;$_at_AccountCodeRange;[ACCOUNTS]Account_Name;$_at_AccountNameRange;[ACCOUNTS]Multicurrency_Valuation;$_al_accMultiCurValuation)
		//SORT ARRAY($_at_AccountCodeRange;$_at_AccountNameRange)
		$_t_AccountsTitle:=""
		
End case 
$_r_UnReconcilledBalance:=0
$_r_TotalBalance:=0
ARRAY TEXT:C222($_at_ReturnAccountCode; 0)
ARRAY TEXT:C222($_at_ReturnCurrencyCode; 0)
ARRAY REAL:C219($_ar_ReturnTotalBalance; 0)
ARRAY REAL:C219($_ar_ReturnReconciledBalance; 0)
ARRAY REAL:C219($_ar_ReturnUnreconciledBalance; 0)

For ($_l_CheckByAccount; 1; Size of array:C274($_at_AccountCodeRange))
	If ($_at_AccountCodeRange{$_l_CheckByAccount}="")
		//TRACE
	End if 
	ARRAY TEXT:C222($_at_ThisaccountCurrencyCodes; 0)
	USE NAMED SELECTION:C332("$CurrentSelection")
	
	QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=$_at_AccountCodeRange{$_l_CheckByAccount})
	QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Layer_Code:23; $_at_layersRange)
	QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Currency_Code:22; $_at_CurrencyCodes)
	QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Analysis_Code:2; $_at_analysesRange)
	
	
	CREATE SET:C116([TRANSACTIONS:29]; "$set1")
	DISTINCT VALUES:C339([TRANSACTIONS:29]Currency_Code:22; $_at_ThisaccountCurrencyCodes)
	$_l_FindBlank:=Find in array:C230($_at_ThisaccountCurrencyCodes; "")
	If ($_l_FindBlank>0)
		$_l_FindBlank2:=Find in array:C230($_at_ThisaccountCurrencyCodes; <>SYS_t_BaseCurrency)
		If ($_l_FindBlank2>0)
			DELETE FROM ARRAY:C228($_at_ThisaccountCurrencyCodes; $_l_FindBlank)
		Else 
			$_at_ThisaccountCurrencyCodes{$_l_FindBlank}:=<>SYS_t_BaseCurrency
		End if 
	End if 
	If (Size of array:C274($_at_ThisaccountCurrencyCodes)=1)
		//all transactions on this account are in the same currency
		APPEND TO ARRAY:C911($_at_ReturnAccountCode; $_at_AccountCodeRange{$_l_CheckByAccount})
		//A//PPEND TO ARRAY($_at_ReturnCurrencyCode;$_at_ThisaccountCurrencyCodes{1})
		
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=True:C214)
		$_r_Reconciled:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 2)
		USE SET:C118("$Set1")
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
		$_r_unReconciled:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 2)
		APPEND TO ARRAY:C911($_ar_ReturnReconciledBalance; $_r_Reconciled)
		APPEND TO ARRAY:C911($_ar_ReturnUnreconciledBalance; $_r_unReconciled)
		APPEND TO ARRAY:C911($_ar_ReturnTotalBalance; ($_r_Reconciled+$_r_unReconciled))
		APPEND TO ARRAY:C911($_at_ReturnCurrencyCode; $_at_ThisaccountCurrencyCodes{1})
		$_t_OutputCurrency:=$_at_ThisaccountCurrencyCodes{1}
		//TRACE
		If (True:C214)
			QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=$_at_AccountCodeRange{$_l_CheckByAccount})
			//QUERY SELECTION WITH ARRAY([ACCOUNT_BALANCES]Currency_Code;$_at_CurrencyCodes)
			//QUERY SELECTION WITH ARRAY([ACCOUNT_BALANCES]Analysis_Code;$_at_analysesRange)
			//QUERY SELECTION WITH ARRAY([ACCOUNT_BALANCES]Layer_Code;$_at_layersRange)
			
			CREATE SET:C116([ACCOUNT_BALANCES:34]; "$Temp2")
			QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6#$_t_OutputCurrency; *)
			QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6#"")
			If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
				USE SET:C118("$Temp2")
				VBALANCE:=0
				Calc_BalArr
				$_r_accountBalance:=VBALANCE
			Else 
				USE SET:C118("$Temp2")
				QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_OutputCurrency; *)
				QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
				VBALANCE:=0
				Calc_BalArr
				$_r_accountBalance:=VBALANCE
				USE SET:C118("$Temp2")
				QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6#$_t_OutputCurrency; *)
				QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6#"")
				DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; $_at_CurrencyToConvert)
				$_r_Balance:=CUR_CalcBalConv(->$_at_CurrencyToConvert; $_t_OutputCurrency)
				$_r_accountBalance:=$_r_accountBalance+$_r_Balance
			End if 
			//$_r_accountBalance
			//$_ar_ReturnReconciledBalance{Size of array($_ar_ReturnReconciledBalance)}:=Round($_r_accountBalance-$_ar_ReturnReconciledBalance{Size of array($_ar_ReturnReconciledBalance)};2)
			//$_ar_ReturnTotalBalance{Size of array($_ar_ReturnTotalBalance)}:=Round($_r_accountBalance-$_ar_ReturnreconciledBalance{Size of array($_ar_ReturnreconciledBalance)};2)
		End if 
		
		$_ar_ReturnTotalBalance{Size of array:C274($_ar_ReturnTotalBalance)}:=Round:C94($_r_accountBalance-$_ar_ReturnUnreconciledBalance{Size of array:C274($_ar_ReturnUnreconciledBalance)}; 2)
		
		
		
		
	Else 
		//multiple currencies
		// /
		
		$_t_OutputCurrency:=$_at_ThisaccountCurrencyCodes{1}
		
		// /
		ARRAY LONGINT:C221($_al_RecordsCount; 0)
		ARRAY LONGINT:C221($_al_RecordsCount; Size of array:C274($_at_ThisaccountCurrencyCodes))
		For ($_l_CheckByCurrency; 1; Size of array:C274($_at_ThisaccountCurrencyCodes))
			USE SET:C118("$Set1")
			If ($_at_ThisaccountCurrencyCodes{$_l_CheckByCurrency}=<>SYS_t_BaseCurrency)
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_at_ThisaccountCurrencyCodes{$_l_CheckByCurrency}; *)
				QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
			Else 
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_at_ThisaccountCurrencyCodes{$_l_CheckByCurrency}; *)
				QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22#"")
				
				
			End if 
			$_al_RecordsCount{$_l_CheckByCurrency}:=Records in selection:C76([TRANSACTIONS:29])
		End for 
		SORT ARRAY:C229($_al_RecordsCount; $_at_ThisaccountCurrencyCodes; <)
		$_t_OutputCurrency:=$_at_ThisaccountCurrencyCodes{1}  //this is the most used currency on this account.
		// /
		
		
		
		
		// /
		$_r_ReconcilledBalance:=0
		$_r_TotalBalance:=0
		USE SET:C118("$Set1")
		
		// /
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_OutputCurrency)
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=True:C214)
		$_r_Reconciled:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 2)
		USE SET:C118("$Set1")
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_OutputCurrency)
		
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
		$_r_unReconciled:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 2)
		APPEND TO ARRAY:C911($_at_ReturnAccountCode; $_at_AccountCodeRange{$_l_CheckByAccount})
		APPEND TO ARRAY:C911($_ar_ReturnReconciledBalance; $_r_Reconciled)
		//TRACE
		APPEND TO ARRAY:C911($_ar_ReturnUnreconciledBalance; $_r_unReconciled)
		APPEND TO ARRAY:C911($_ar_ReturnTotalBalance; ($_r_Reconciled+$_r_unReconciled))
		APPEND TO ARRAY:C911($_at_ReturnCurrencyCode; $_t_OutputCurrency)
		
		USE SET:C118("$Set1")
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22#$_t_OutputCurrency)
		
		SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; $_at_ActAccountCodes; [TRANSACTIONS:29]Currency_Code:22; $_at_actCurrencyCodes; [TRANSACTIONS:29]Period_Code:12; $_at_ActPeriodCodes; [TRANSACTIONS:29]Amount:6; $_ar_ActAmount; [TRANSACTIONS:29]Analysis_Code:2; $_at_ActAnalysisCode; [TRANSACTIONS:29]Layer_Code:23; $_at_actLayerCode; [TRANSACTIONS:29]Tax_Amount:16; $_ar_actTaxAmount; [TRANSACTIONS:29]Trans_Date:5; $_ad_TransactionsDate; [TRANSACTIONS:29]Reconciled:14; $_abo_Reconcilled; [TRANSACTIONS:29]Unique_StringIdent:28; $_at_ACtSort; [TRANSACTIONS:29]Transaction_ID:31; $_al_TransactionID)
		// //
		$_l_Empty:=Find in array:C230($_at_actCurrencyCodes; "")
		If ($_l_Empty>0)
			Repeat 
				$_at_actCurrencyCodes{$_l_Empty}:=<>SYS_t_BaseCurrency
				$_bo_RoState:=Read only state:C362([TRANSACTIONS:29])
				$_l_Empty:=Find in array:C230($_at_actCurrencyCodes; "")
			Until ($_l_Empty<0)
		End if 
		$_l_Empty:=Find in array:C230($_at_ACtSort; "")
		If ($_l_Empty>0)
			Repeat 
				$_at_ACtSort{$_l_Empty}:=ACC_Buildunique($_at_ActAccountCodes{$_l_Empty}; $_at_ActAnalysisCode{$_l_Empty}; $_at_ActPeriodCodes{$_l_Empty}; $_at_actLayerCode{$_l_Empty}; $_at_actCurrencyCodes{$_l_Empty})
				$_bo_RoState:=Read only state:C362([TRANSACTIONS:29])
				READ WRITE:C146([TRANSACTIONS:29])
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_al_TransactionID{$_l_Empty})
				[TRANSACTIONS:29]Unique_StringIdent:28:=$_at_ACtSort{$_l_Empty}
				SAVE RECORD:C53([TRANSACTIONS:29])
				UNLOAD RECORD:C212([TRANSACTIONS:29])
				If ($_bo_RoState)
					READ ONLY:C145([TRANSACTIONS:29])
				End if 
				
				$_l_Empty:=Find in array:C230($_at_ACtSort; "")
				
			Until ($_l_Empty<0)
		End if 
		
		SORT ARRAY:C229($_at_ACtSort; $_ad_TransactionsDate; $_at_ActAccountCodes; $_at_actCurrencyCodes; $_at_ActPeriodCodes; $_ar_ActAmount; $_at_ActAnalysisCode; $_at_actLayerCode; $_ar_actTaxAmount; $_abo_Reconcilled)
		// //
		//ACC_ConvertValues ($_t_Currency;->$_at_actCurrencyCodes;->$_at_ActAccountCodes;->$_ar_ActAmount
		ARRAY TEXT:C222($_at_PeriodCUrrency; 0)
		ARRAY DATE:C224($_ad_PeriodRateDateFrom; 0; 0)
		ARRAY DATE:C224($_ad_PeriodRateDateTo; 0; 0)
		ARRAY REAL:C219($_ar_PeriodConvertRate; 0; 0)
		ARRAY TEXT:C222($_at_AccountIDENT; 0)
		ARRAY REAL:C219($_ar_accountTotal; 0)
		ARRAY REAL:C219($_ar_accountRecTotal; 0)
		ARRAY REAL:C219($_ar_accountUnrecTotal; 0)
		
		
		For ($_l_BuildBalances; 1; Size of array:C274($_at_actCurrencyCodes))
			If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
				
				//TRACE
			End if 
			$_l_AccTotalRef:=Find in array:C230($_at_AccountIDENT; $_at_ACtSort{$_l_BuildBalances})
			If ($_l_AccTotalRef<0)
				APPEND TO ARRAY:C911($_at_AccountIDENT; $_at_ACtSort{$_l_BuildBalances})
				APPEND TO ARRAY:C911($_ar_accountTotal; 0)
				APPEND TO ARRAY:C911($_ar_accountRecTotal; 0)
				APPEND TO ARRAY:C911($_ar_accountUnrecTotal; 0)
				$_l_AccTotalRef:=Size of array:C274($_ar_accountUnrecTotal)
			End if 
			If ($_t_LastAccountIdent=$_t_accountIDent)
				$_bo_CalcLast:=False:C215
				$_l_LastEndsAt:=$_l_BuildBalances
			Else 
				$_bo_CalcLast:=True:C214
				$_l_NextLastStartsat:=$_l_BuildBalances
				$_l_NextLastEndssat:=$_l_BuildBalances
			End if 
			If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_t_OutputCurrency)
				Case of 
					: ($_at_ActAccountCodes{$_l_BuildBalances}=DB_GetLedgerVatInputACC)
						$_r_TotalBalance:=$_r_TotalBalance+$_ar_actTaxAmount{$_l_BuildBalances}
						$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_ar_actTaxAmount{$_l_BuildBalances}
						If ($_abo_Reconcilled{$_l_BuildBalances})
							$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+$_ar_actTaxAmount{$_l_BuildBalances}
						Else 
							$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+$_ar_actTaxAmount{$_l_BuildBalances}
						End if 
						
					Else 
						$_r_TotalBalance:=$_r_TotalBalance+($_ar_ActAmount{$_l_BuildBalances})
						$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_ar_ActAmount{$_l_BuildBalances}
						If ($_abo_Reconcilled{$_l_BuildBalances})
							$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+$_ar_ActAmount{$_l_BuildBalances}
						Else 
							$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+$_ar_ActAmount{$_l_BuildBalances}
						End if 
						
				End case 
				
				
			Else 
				Case of 
					: ($_at_ActAccountCodes{$_l_BuildBalances}=DB_GetLedgerVatInputACC)
						$_r_ThisAmount:=$_ar_actTaxAmount{$_l_BuildBalances}
					Else 
						$_r_ThisAmount:=($_ar_ActAmount{$_l_BuildBalances})
				End case 
				If ($_r_ThisAmount#0)
					If ($_at_ActPeriodCodes{$_l_BuildBalances}="1997/12") & ($_at_actCurrencyCodes{$_l_BuildBalances}="£") & ($_t_OutputCurrency="$")
						//TRACE
					End if 
					
					$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; $_at_actCurrencyCodes{$_l_BuildBalances})
					If ($_l_CurRateReference<0)
						$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; "")
						If ($_l_CurRateReference>0)
							$_at_aCurrencyRatesChecked{$_l_CurRateReference}:=$_at_actCurrencyCodes{$_l_BuildBalances}
						Else 
							APPEND TO ARRAY:C911($_at_aCurrencyRatesChecked; $_at_actCurrencyCodes{$_l_BuildBalances})
						End if 
						CUR_CheckRate($_at_actCurrencyCodes{$_l_BuildBalances}; $_t_OutputCurrency)
					End if 
					$_l_accRef:=Find in array:C230($_at_AccountCodeRange; $_at_ActAccountCodes{$_l_BuildBalances})
					If ($_al_accMultiCurValuation{$_l_accRef}#1)
						$_l_PeriodRate:=Find in array:C230($_at_PeriodCUrrency; $_at_ActPeriodCodes{$_l_BuildBalances}+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_OutputCurrency)
						If ($_l_PeriodRate<0)
							QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
							$_l_PeriodID:=[PERIODS:33]x_ID:10
							$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
							//now find the rate for this period
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_OutputCurrency; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_PeriodID)
							If (Records in selection:C76([CURRENCY_RATES:72])=0)
								//ACC_getCurrencyRate($_at_actCurrencyCodes{$_l_BuildBalances};$_t_OutputCurrency;$_l_PeriodID)
								
							End if 
							$_d_LastToDate:=!00-00-00!
							//For ($_l_addRates;1;Records in selection([CURRENCY_RATES]))
							
							APPEND TO ARRAY:C911($_at_PeriodCUrrency; $_at_ActPeriodCodes{$_l_BuildBalances}+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_OutputCurrency)
							INSERT IN ARRAY:C227($_ar_PeriodRates; Size of array:C274($_ar_PeriodRates)+1; 1)
							INSERT IN ARRAY:C227($_ad_PeriodRateDateFrom; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
							INSERT IN ARRAY:C227($_ad_PeriodRateDateTo; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
							INSERT IN ARRAY:C227($_ar_PeriodConvertRate; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
							If (Records in selection:C76([CURRENCY_RATES:72])>0)
								SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)})
								SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Rate:3; $_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)})
								For ($_l_FilltoDate; 1; Size of array:C274($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)}))
									If ($_l_FilltoDate<(Size of array:C274($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)})))
										APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; ($_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)}{$_l_FilltoDate+1})-1)
									Else 
										APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; !00-00-00!)  //we dont know what date this goes to
									End if 
								End for 
							Else 
								APPEND TO ARRAY:C911($_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)}; !00-00-00!)
								APPEND TO ARRAY:C911($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)}; 0)
								APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; !00-00-00!)
							End if 
							$_l_CurrentRow:=Size of array:C274($_ad_PeriodRateDateTo)
							
							QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<$_d_PeriodFromDate)
							If (Records in selection:C76([PERIODS:33])>0)
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
								$_t_PreviousPeriodCode:=[PERIODS:33]Period_Code:1
								$_l_PreviousPeriodRate:=Find in array:C230($_at_PeriodCUrrency; $_t_PreviousPeriodCode+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_OutputCurrency)
								
								If ($_l_PreviousPeriodRate>0)
									If (Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})>0) & (Size of array:C274($_ad_PeriodRateDateFrom{$_l_PreviousPeriodRate})>0)
										//we have the previous period.. the last array element probably has no to date on the currency conversion
										If ($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate}{Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})}=!00-00-00!)
											$_ad_PeriodRateDateTo{$_l_PreviousPeriodRate}{Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})}:=(($_ad_PeriodRateDateFrom{$_l_CurrentRow}{1})-1)
										End if 
									End if 
								End if 
							End if 
							$_l_PeriodRate:=Size of array:C274($_at_PeriodCUrrency)
							
						End if 
						Case of 
							: (Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})>1)  //multiple rates // (Records in selection([CURRENCY_RATES])>1) Size of array
								//SELECTION TO ARRAY([CURRENCY_RATES]Date;$_ad_ConvertDate;[CURRENCY_RATES]Rate;$_ar_ConvertRate)
								$_r_Rate:=$_ar_PeriodConvertRate{$_l_PeriodRate}{1}  //$_ar_ConvertRate{1}
								$_bo_Variants:=False:C215
								For ($_l_CheckVariance; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
									If ($_ar_PeriodConvertRate{$_l_PeriodRate}{$_l_CheckVariance}#$_r_Rate)
										$_bo_Variants:=True:C214
										$_l_CheckVariance:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
									End if 
								End for 
								If ($_bo_Variants)
									$_l_VariantNumber:=0
									//ACC_GetTransactions ($_at_AcbAccountCodes{$_l_BuildBalances};$_at_PeriodCodes{$_l_BuildBalances};$_at_AccCurrencyCodes{$_l_BuildBalances};$_at_acbAnalysisCode{$_l_BuildBalances};$_at_acbLayerCode{$_l_BuildBalances})
									ARRAY DATE:C224($_ad_TransDate; 1)
									ARRAY REAL:C219($_ar_TransactionAmount; 1)
									ARRAY REAL:C219($_ar_TaxAmount; 1)
									For ($_l_FindVariant; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
										If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_FindVariant}<=$_ad_TransactionsDate{$_l_BuildBalances})
											If ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}>=$_ad_TransactionsDate{$_l_BuildBalances}) | ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}=!00-00-00!)
												$_l_VariantNumber:=$_l_FindVariant
												$_l_FindVariant:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
											End if 
										End if 
									End for 
									If ($_l_FindVariant<0)
										//TRACE
									End if 
									If ($_l_VariantNumber>Size of array:C274($_ar_PeriodConvertRate))
										//TRACE
									End if 
									$_ad_TransDate{1}:=$_ad_TransactionsDate{$_l_BuildBalances}
									$_ar_TransactionAmount{1}:=$_ar_ActAmount{$_l_BuildBalances}
									$_ar_TaxAmount{1}:=$_ar_actTaxAmount{$_l_BuildBalances}
									//we gather additional amounts for the same conversion
									For ($_l_CarryOn; $_l_BuildBalances+1; Size of array:C274($_at_actCurrencyCodes))
										If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
											
											//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
											For ($_l_FindVariant; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
												If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_FindVariant}<=$_ad_TransactionsDate{$_l_CarryOn})
													If ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}>=$_ad_TransactionsDate{$_l_CarryOn}) | ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}=!00-00-00!)
														$_l_VariantNumber2:=$_l_FindVariant
														$_l_FindVariant:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
													End if 
												End if 
											End for 
											If ($_l_VariantNumber#$_l_VariantNumber2)
												$_l_BuildBalances:=$_l_CarryOn-1  //different rate
												If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
													
													//TRACE
												End if 
												$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
											Else 
												$_ar_TransactionAmount{1}:=$_ar_TransactionAmount{1}+$_ar_ActAmount{$_l_CarryOn}
												$_ar_TaxAmount{1}:=$_ar_TaxAmount{1}+$_ar_actTaxAmount{$_l_CarryOn}
												
											End if 
											
											//
										Else 
											$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
											If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
												
												//TRACE
											End if 
											$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
											
										End if 
										
									End for 
									//SELECTION TO ARRAY([TRANSACTIONS]Trans_Date;$_ad_TransDate;[TRANSACTIONS]Amount;$_ar_TransactionAmount;[TRANSACTIONS]Tax_Amount;$_ar_TaxAmount)
									$_r_Balance:=0
									If (Size of array:C274($_ad_TransDate)>0)
										
										For ($_l_index; 1; Size of array:C274($_ad_TransDate))
											$_d_TransactionDate:=$_ad_TransDate{$_l_index}
											$_l_Element:=0
											For ($_l_Index4; 1; Size of array:C274($_ad_PeriodRateDateFrom{$_l_PeriodRate}))
												If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_Index4}<=$_d_TransactionDate)
													$_l_Element:=$_l_Index4
												End if 
											End for 
											If ($_l_Element>0)
												$_r_Rate:=$_ar_PeriodConvertRate{$_l_PeriodRate}{$_l_Element}
											Else 
												If (Size of array:C274($_ad_PeriodRateDateTo{$_l_PeriodRate})>0)
													$_r_Rate:=$_ar_PeriodConvertRate{$_l_PeriodRate}{1}
												Else 
													$_r_Rate:=1
													//something is way wrong  if we end up here!!!
													//TRACE
												End if 
											End if 
											If ($_at_ActAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
												$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
												
											Else 
												$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
											End if 
											$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
											
										End for 
										$_r_TotalBalance:=$_r_TotalBalance+($_r_Balance)
										$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ConvertedBalance)
										If ($_abo_Reconcilled{$_l_BuildBalances})
											$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ConvertedBalance)
										Else 
											$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ConvertedBalance)
										End if 
										
									Else 
										//no transactions
										//$_r_TotalBalance:=0
									End if 
								Else 
									//although there are multiple rate record the rate is the same on them
									For ($_l_CarryOn; $_l_BuildBalances+1; Size of array:C274($_at_actCurrencyCodes))
										If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
											
											//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
											For ($_l_FindVariant; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
												If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_FindVariant}<=$_ad_TransactionsDate{$_l_CarryOn})
													If ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}>=$_ad_TransactionsDate{$_l_CarryOn}) | ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}=!00-00-00!)
														$_l_VariantNumber2:=$_l_FindVariant
														$_l_FindVariant:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
													End if 
												End if 
											End for 
											If ($_l_VariantNumber#$_l_VariantNumber2)
												$_l_BuildBalances:=$_l_CarryOn-1  //different rate
												If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
													
													//TRACE
												End if 
												$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
											Else 
												Case of 
													: ($_at_ActAccountCodes{$_l_CarryOn}=DB_GetLedgerVatInputACC)
														$_r_ThisAmount:=$_r_ThisAmount+$_ar_actTaxAmount{$_l_CarryOn}
													Else 
														$_r_ThisAmount:=$_r_ThisAmount+($_ar_ActAmount{$_l_CarryOn})
												End case 
											End if 
											
											//
										Else 
											$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
											If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
												
												//TRACE
											End if 
											$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
											
										End if 
										
									End for 
									
									$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
									$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+(($_r_ThisAmount*$_r_Rate))
									If ($_abo_Reconcilled{$_l_BuildBalances})
										$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+(($_r_ThisAmount*$_r_Rate))
									Else 
										$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+(($_r_ThisAmount*$_r_Rate))
									End if 
									
								End if 
								
							: (Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})=1)
								$_r_Rate:=$_ar_PeriodConvertRate{$_l_PeriodRate}{1}
								For ($_l_CarryOn; $_l_BuildBalances+1; Size of array:C274($_at_actCurrencyCodes))
									If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
										
										//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
										For ($_l_FindVariant; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
											If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_FindVariant}<=$_ad_TransactionsDate{$_l_CarryOn})
												If ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}>=$_ad_TransactionsDate{$_l_CarryOn}) | ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}=!00-00-00!)
													$_l_VariantNumber2:=$_l_FindVariant
													$_l_FindVariant:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
												End if 
											End if 
										End for 
										If ($_l_VariantNumber#$_l_VariantNumber2)
											$_l_BuildBalances:=$_l_CarryOn-1  //different rate
											If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
												
												//TRACE
											End if 
											$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
										Else 
											Case of 
												: ($_at_ActAccountCodes{$_l_CarryOn}=DB_GetLedgerVatInputACC)
													$_r_ThisAmount:=$_r_ThisAmount+$_ar_actTaxAmount{$_l_CarryOn}
												Else 
													$_r_ThisAmount:=$_r_ThisAmount+($_ar_ActAmount{$_l_CarryOn})
											End case 
										End if 
										
										//
									Else 
										$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
										If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
											
											//TRACE
										End if 
										$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
										
									End if 
									
								End for 
								
								
								$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
								$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+(($_r_ThisAmount*$_r_Rate))
								If ($_abo_Reconcilled{$_l_BuildBalances})
									$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+(($_r_ThisAmount*$_r_Rate))
								Else 
									$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+(($_r_ThisAmount*$_r_Rate))
								End if 
								
							Else 
								//no rates!!!!!!
								//    TRACE
								//use the last rate before that
								
								// /
								$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; $_at_actCurrencyCodes{$_l_BuildBalances})
								If ($_l_CurRateReference<0)
									$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; "")
									If ($_l_CurRateReference>0)
										$_at_aCurrencyRatesChecked{$_l_CurRateReference}:=$_at_actCurrencyCodes{$_l_BuildBalances}
									Else 
										APPEND TO ARRAY:C911($_at_aCurrencyRatesChecked; $_at_actCurrencyCodes{$_l_BuildBalances})
									End if 
									CUR_CheckRate($_at_actCurrencyCodes{$_l_BuildBalances}; $_t_OutputCurrency)
								End if 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
								$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
								QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
								//$_l_PeriodID:=[PERIODS]x_ID
								//$_d_PeriodFromDate:=[PERIODS]From_Date
								//now find the rate for this period
								REDUCE SELECTION:C351([CURRENCY_RATES:72]; 0)
								For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
									$_l_PeriodID:=[PERIODS:33]x_ID:10
									//now find the rate for this period
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_OutputCurrency; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_PeriodID)
									If (Records in selection:C76([CURRENCY_RATES:72])>0)
										$_l_index:=Records in selection:C76([PERIODS:33])+1
										$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
									End if 
									NEXT RECORD:C51([PERIODS:33])
								End for 
								$_d_LastToDate:=!00-00-00!
								//For ($_l_addRates;1;Records in selection([CURRENCY_RATES]))
								QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=$_l_PeriodID)
								
								$_l_PeriodRate:=Find in array:C230($_at_PeriodCUrrency; [PERIODS:33]Period_Code:1+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_OutputCurrency)
								//$_l_PreviousPeriodRate:=Find in array($_at_PeriodCUrrency;$_t_PreviousPeriodCode+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_OutputCurrency)
								
								If ($_l_PeriodRate<0)
									APPEND TO ARRAY:C911($_at_PeriodCUrrency; [PERIODS:33]Period_Code:1+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_OutputCurrency)
									INSERT IN ARRAY:C227($_ar_PeriodRates; Size of array:C274($_ar_PeriodRates)+1; 1)
									INSERT IN ARRAY:C227($_ad_PeriodRateDateFrom; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
									INSERT IN ARRAY:C227($_ad_PeriodRateDateTo; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
									INSERT IN ARRAY:C227($_ar_PeriodConvertRate; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
									If (Records in selection:C76([CURRENCY_RATES:72])>0)
										SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)})
										SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Rate:3; $_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)})
										For ($_l_FilltoDate; 1; Size of array:C274($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)}))
											If ($_l_FilltoDate<(Size of array:C274($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)})))
												APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; ($_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)}{$_l_FilltoDate+1})-1)
											Else 
												APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; !00-00-00!)  //we dont know what date this goes to
											End if 
										End for 
									Else 
										APPEND TO ARRAY:C911($_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)}; !00-00-00!)
										APPEND TO ARRAY:C911($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)}; 0)
										APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; !00-00-00!)
									End if 
									$_l_CurrentRow:=Size of array:C274($_ad_PeriodRateDateTo)
									If (Size of array:C274($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)})>0)
										//TRACE
										QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<$_d_PeriodFromDate)
										If (Records in selection:C76([PERIODS:33])>0)
											ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
											$_t_PreviousPeriodCode:=[PERIODS:33]Period_Code:1
											$_l_PreviousPeriodRate:=Find in array:C230($_at_PeriodCUrrency; $_t_PreviousPeriodCode+":"+$_t_OutputCurrency)
											If ($_l_PreviousPeriodRate>0)
												If (Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})>0) & (Size of array:C274($_ad_PeriodRateDateFrom{$_l_CurrentRow})>0)
													//we have the previous period.. the last array element probably has no to date on the currency conversion
													If ($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate}{Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})}=!00-00-00!)
														$_ad_PeriodRateDateTo{$_l_PreviousPeriodRate}{Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})}:=(($_ad_PeriodRateDateFrom{$_l_CurrentRow}{1})-1)
													End if 
												End if 
											End if 
										End if 
										
										$_l_CurrentRow:=Size of array:C274($_at_PeriodCUrrency)
										//and apply the last rate here to the current period because the period we have just added is a future period
										//TRACE
										If (False:C215)
											
											$_l_PeriodRateCurrent:=Find in array:C230($_at_PeriodCUrrency; $_at_ActPeriodCodes{$_l_BuildBalances}+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_OutputCurrency)
											If ($_l_PeriodRateCurrent>0)  //we have the current period
												If (Size of array:C274($_ad_PeriodRateDateFrom{$_l_PeriodRateCurrent})>0) & (Size of array:C274($_ad_PeriodRateDateto{$_l_CurrentRow})>0)
													
													$_l_Sizeofarray:=Size of array:C274($_ad_PeriodRateDateTo{$_l_CurrentRow})
													QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33)
													
													APPEND TO ARRAY:C911($_ad_PeriodRateDateFrom{$_l_PeriodRateCurrent}; ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_Sizeofarray}+1))
													APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{$_l_PeriodRateCurrent}; !00-00-00!)
													APPEND TO ARRAY:C911($_ar_PeriodConvertRate{$_l_PeriodRateCurrent}; $_ar_PeriodConvertRate{$_l_PeriodRate}{$_l_Sizeofarray})
												End if 
											End if 
											
											
											
										End if 
									End if 
								End if 
								
								// /
								
								Case of 
									: (Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})>1)
										
										$_r_Rate:=$_ar_PeriodConvertRate{$_l_PeriodRate}{1}  //$_ar_ConvertRate{1}
										$_bo_Variants:=False:C215
										For ($_l_CheckVariance; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
											If ($_ar_PeriodConvertRate{$_l_PeriodRate}{$_l_CheckVariance}#$_r_Rate)
												$_bo_Variants:=True:C214
												$_l_CheckVariance:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
											End if 
										End for 
										If ($_bo_Variants)
											$_l_VariantNumber:=0
											//ACC_GetTransactions ($_at_AcbAccountCodes{$_l_BuildBalances};$_at_PeriodCodes{$_l_BuildBalances};$_at_AccCurrencyCodes{$_l_BuildBalances};$_at_acbAnalysisCode{$_l_BuildBalances};$_at_acbLayerCode{$_l_BuildBalances})
											ARRAY DATE:C224($_ad_TransDate; 1)
											ARRAY REAL:C219($_ar_TransactionAmount; 1)
											ARRAY REAL:C219($_ar_TaxAmount; 1)
											For ($_l_FindVariant; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
												If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_FindVariant}<=$_ad_TransactionsDate{$_l_BuildBalances})
													If ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}>=$_ad_TransactionsDate{$_l_BuildBalances}) | ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}=!00-00-00!)
														$_l_VariantNumber:=$_l_FindVariant
														$_l_FindVariant:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
													End if 
												End if 
											End for 
											If ($_l_FindVariant<0)
												//
											End if 
											If ($_l_VariantNumber>Size of array:C274($_ar_PeriodConvertRate))
												//TRACE
											End if 
											$_ad_TransDate{1}:=$_ad_TransactionsDate{$_l_BuildBalances}
											$_ar_TransactionAmount{1}:=$_ar_ActAmount{$_l_BuildBalances}
											$_ar_TaxAmount{1}:=$_ar_actTaxAmount{$_l_BuildBalances}
											//we gather additional amounts for the same conversion
											For ($_l_CarryOn; $_l_BuildBalances+1; Size of array:C274($_at_actCurrencyCodes))
												If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
													
													//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
													For ($_l_FindVariant; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
														If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_FindVariant}<=$_ad_TransactionsDate{$_l_CarryOn})
															If ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}>=$_ad_TransactionsDate{$_l_CarryOn}) | ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}=!00-00-00!)
																$_l_VariantNumber2:=$_l_FindVariant
																$_l_FindVariant:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
															End if 
														End if 
													End for 
													If ($_l_VariantNumber#$_l_VariantNumber2)
														$_l_BuildBalances:=$_l_CarryOn-1  //different rate
														If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
															
															//TRACE
														End if 
														$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
													Else 
														$_ar_TransactionAmount{1}:=$_ar_TransactionAmount{1}+$_ar_ActAmount{$_l_CarryOn}
														$_ar_TaxAmount{1}:=$_ar_TaxAmount{1}+$_ar_actTaxAmount{$_l_CarryOn}
													End if 
													
													//
												Else 
													$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
													If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
														
														//TRACE
													End if 
													$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
													
												End if 
												
											End for 
											//SELECTION TO ARRAY([TRANSACTIONS]Trans_Date;$_ad_TransDate;[TRANSACTIONS]Amount;$_ar_TransactionAmount;[TRANSACTIONS]Tax_Amount;$_ar_TaxAmount)
											$_r_Balance:=0
											If (Size of array:C274($_ad_TransDate)>0)
												
												For ($_l_index; 1; Size of array:C274($_ad_TransDate))
													$_d_TransactionDate:=$_ad_TransDate{$_l_index}
													$_l_Element:=0
													If (False:C215)
														For ($_l_Index4; 1; Size of array:C274($_ad_ConvertDate))
															If ($_ad_ConvertDate{$_l_Index4}<=$_d_TransactionDate)
																$_l_Element:=$_l_Index4
															End if 
														End for 
													End if 
													// /TRACE
													For ($_l_Index4; 1; Size of array:C274($_ad_PeriodRateDateFrom{$_l_PeriodRate}))
														If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_Index4}<=$_d_TransactionDate)
															$_l_Element:=$_l_Index4
														End if 
													End for 
													If ($_l_Element>0)
														$_r_Rate:=$_ar_PeriodConvertRate{$_l_PeriodRate}{$_l_Element}
														//$_ar_PeriodConvertRate  //$_l_index:=Size of array($_ad_TransDate)
													Else 
														If (Size of array:C274($_ad_PeriodRateDateTo{$_l_PeriodRate})>0)
															$_r_Rate:=$_ar_PeriodConvertRate{$_l_PeriodRate}{1}
															//$_l_index:=Size of array($_ad_TransDate)
														Else 
															$_r_Rate:=1
															//something is way wrong  if we end up here!!!
															//TRACE
														End if 
													End if 
													If (False:C215)
														If ($_l_Element>0)
															$_r_Rate:=$_ar_ConvertRate{$_l_Element}
														Else 
															If (Size of array:C274($_ad_ConvertDate)>0)
																$_r_Rate:=$_ar_ConvertRate{1}
															Else 
																$_r_Rate:=1
																//something is way wrong  if we end up here!!!
																//TRACE
															End if 
														End if 
													End if 
													If ($_at_ActAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
														$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
													Else 
														$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
													End if 
													$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
													
												End for 
												$_r_TotalBalance:=$_r_TotalBalance+($_r_Balance)
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_Balance)
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_Balance)
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_Balance)
												End if 
												
											Else 
												//no transactions
												//$_r_TotalBalance:=0
											End if 
										Else 
											//although there are multiple rate record the rate is the same on them
											For ($_l_CarryOn; $_l_BuildBalances+1; Size of array:C274($_at_actCurrencyCodes))
												If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
													
													//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
													For ($_l_FindVariant; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
														If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_FindVariant}<=$_ad_TransactionsDate{$_l_CarryOn})
															If ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}>=$_ad_TransactionsDate{$_l_CarryOn}) | ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}=!00-00-00!)
																$_l_VariantNumber2:=$_l_FindVariant
																$_l_FindVariant:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
															End if 
														End if 
													End for 
													If ($_l_VariantNumber#$_l_VariantNumber2)
														$_l_BuildBalances:=$_l_CarryOn-1  //different rate
														If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
															
															//TRACE
														End if 
														$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
													Else 
														Case of 
															: ($_at_ActAccountCodes{$_l_CarryOn}=DB_GetLedgerVatInputACC)
																$_r_ThisAmount:=$_r_ThisAmount+$_ar_actTaxAmount{$_l_CarryOn}
															Else 
																$_r_ThisAmount:=$_r_ThisAmount+($_ar_ActAmount{$_l_CarryOn})
														End case 
													End if 
													
													//
												Else 
													$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
													If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
														
														//TRACE
													End if 
													$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
													
												End if 
												
											End for 
											
											$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
											$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+(($_r_ThisAmount*$_r_Rate))
											If ($_abo_Reconcilled{$_l_BuildBalances})
												$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
											Else 
												$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
											End if 
											
										End if 
										
										
									: (Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})=1)
										For ($_l_CarryOn; $_l_BuildBalances+1; Size of array:C274($_at_actCurrencyCodes))
											If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
												
												//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
												For ($_l_FindVariant; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
													If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_FindVariant}<=$_ad_TransactionsDate{$_l_CarryOn})
														If ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}>=$_ad_TransactionsDate{$_l_CarryOn}) | ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}=!00-00-00!)
															$_l_VariantNumber2:=$_l_FindVariant
															$_l_FindVariant:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
														End if 
													End if 
												End for 
												If ($_l_VariantNumber#$_l_VariantNumber2)
													$_l_BuildBalances:=$_l_CarryOn-1  //different rate
													If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
														
														//TRACE
													End if 
													$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
												Else 
													Case of 
														: ($_at_ActAccountCodes{$_l_CarryOn}=DB_GetLedgerVatInputACC)
															$_r_ThisAmount:=$_r_ThisAmount+$_ar_actTaxAmount{$_l_CarryOn}
														Else 
															$_r_ThisAmount:=$_r_ThisAmount+($_ar_ActAmount{$_l_CarryOn})
													End case 
												End if 
												
												//
											Else 
												$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
												If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
													
													//TRACE
												End if 
												$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
												
												
											End if 
											
										End for 
										
										
										$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
										$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+(($_r_ThisAmount*$_r_Rate))
										If ($_abo_Reconcilled{$_l_BuildBalances})
											$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										Else 
											$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										End if 
										
										
										
									Else 
										//no rates!!!!!!
										//    TRACE
										//use the last rate before that
										$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; $_at_actCurrencyCodes{$_l_BuildBalances})
										If ($_l_CurRateReference<0)
											$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; "")
											If ($_l_CurRateReference>0)
												$_at_aCurrencyRatesChecked{$_l_CurRateReference}:=$_at_actCurrencyCodes{$_l_BuildBalances}
											Else 
												APPEND TO ARRAY:C911($_at_aCurrencyRatesChecked; $_at_actCurrencyCodes{$_l_BuildBalances})
											End if 
											CUR_CheckRate($_at_actCurrencyCodes{$_l_BuildBalances}; $_t_OutputCurrency)
										End if 
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
										$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
										QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
										ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
										For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
											$_l_PeriodID:=[PERIODS:33]x_ID:10
											//now find the rate for this period
											QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_OutputCurrency; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_PeriodID)
											If (Records in selection:C76([CURRENCY_RATES:72])>0)
												$_l_index:=Records in selection:C76([PERIODS:33])+1
												$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
											End if 
											NEXT RECORD:C51([PERIODS:33])
										End for 
										$_d_LastToDate:=!00-00-00!
										//For ($_l_addRates;1;Records in selection([CURRENCY_RATES]))
										QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=$_l_PeriodID)
										
										$_l_PeriodRate:=Find in array:C230($_at_PeriodCUrrency; [PERIODS:33]Period_Code:1+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_OutputCurrency)
										//$_l_PreviousPeriodRate:=Find in array($_at_PeriodCUrrency;$_t_PreviousPeriodCode+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_OutputCurrency)
										
										If ($_l_PeriodRate<0)
											APPEND TO ARRAY:C911($_at_PeriodCUrrency; [PERIODS:33]Period_Code:1+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_OutputCurrency)
											INSERT IN ARRAY:C227($_ar_PeriodRates; Size of array:C274($_ar_PeriodRates)+1; 1)
											INSERT IN ARRAY:C227($_ad_PeriodRateDateFrom; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
											INSERT IN ARRAY:C227($_ad_PeriodRateDateTo; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
											INSERT IN ARRAY:C227($_ar_PeriodConvertRate; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
											If (Records in selection:C76([CURRENCY_RATES:72])>0)
												SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)})
												SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Rate:3; $_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)})
												For ($_l_FilltoDate; 1; Size of array:C274($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)}))
													If ($_l_FilltoDate<(Size of array:C274($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)})))
														APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; ($_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)}{$_l_FilltoDate+1})-1)
													Else 
														APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; !00-00-00!)  //we dont know what date this goes to
													End if 
												End for 
											Else 
												APPEND TO ARRAY:C911($_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)}; !00-00-00!)
												APPEND TO ARRAY:C911($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)}; 0)
												APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; !00-00-00!)
											End if 
											$_l_CurrentRow:=Size of array:C274($_ad_PeriodRateDateTo)
											If (Size of array:C274($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)})>0)
												//TRACE
												QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<$_d_PeriodFromDate)
												If (Records in selection:C76([PERIODS:33])>0)
													ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
													$_t_PreviousPeriodCode:=[PERIODS:33]Period_Code:1
													$_l_PreviousPeriodRate:=Find in array:C230($_at_PeriodCUrrency; $_t_PreviousPeriodCode+":"+$_t_OutputCurrency)
													If ($_l_PreviousPeriodRate>0)
														If (Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})>0) & (Size of array:C274($_ad_PeriodRateDateFrom{$_l_CurrentRow})>0)
															//we have the previous period.. the last array element probably has no to date on the currency conversion
															If ($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate}{Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})}=!00-00-00!)
																$_ad_PeriodRateDateTo{$_l_PreviousPeriodRate}{Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})}:=(($_ad_PeriodRateDateFrom{$_l_CurrentRow}{1})-1)
																
															End if 
														End if 
													End if 
												End if 
												
												$_l_PeriodRate:=Size of array:C274($_at_PeriodCUrrency)
												//and apply the last rate here to the current period
												$_l_PeriodRateCurrent:=Find in array:C230($_at_PeriodCUrrency; $_at_ActPeriodCodes{$_l_BuildBalances}+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_OutputCurrency)
												If ($_l_PeriodRateCurrent>0)
													$_l_Sizeofarray:=Size of array:C274($_ad_PeriodRateDateTo{$_l_PeriodRate})
													APPEND TO ARRAY:C911($_ad_PeriodRateDateFrom{$_l_PeriodRateCurrent}; $_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_Sizeofarray}+1)
													APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{$_l_PeriodRateCurrent}; !00-00-00!)
													APPEND TO ARRAY:C911($_ar_PeriodConvertRate{$_l_PeriodRateCurrent}; $_ar_PeriodConvertRate{$_l_PeriodRate}{$_l_Sizeofarray})
													
													
													
													
												End if 
											End if 
										End if 
										
										// /
										
										Case of 
											: (Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})>1)
												
												$_r_Rate:=$_ar_PeriodConvertRate{$_l_PeriodRate}{1}  //$_ar_ConvertRate{1}
												$_bo_Variants:=False:C215
												For ($_l_CheckVariance; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
													If ($_ar_PeriodConvertRate{$_l_PeriodRate}{$_l_CheckVariance}#$_r_Rate)
														$_bo_Variants:=True:C214
														$_l_CheckVariance:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
													End if 
												End for 
												If ($_bo_Variants)
													$_l_VariantNumber:=0
													//ACC_GetTransactions ($_at_AcbAccountCodes{$_l_BuildBalances};$_at_PeriodCodes{$_l_BuildBalances};$_at_AccCurrencyCodes{$_l_BuildBalances};$_at_acbAnalysisCode{$_l_BuildBalances};$_at_acbLayerCode{$_l_BuildBalances})
													ARRAY DATE:C224($_ad_TransDate; 1)
													ARRAY REAL:C219($_ar_TransactionAmount; 1)
													ARRAY REAL:C219($_ar_TaxAmount; 1)
													For ($_l_FindVariant; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
														If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_FindVariant}<=$_ad_TransactionsDate{$_l_BuildBalances})
															If ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}>=$_ad_TransactionsDate{$_l_BuildBalances}) | ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}=!00-00-00!)
																$_l_VariantNumber:=$_l_FindVariant
																$_l_FindVariant:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
															End if 
														End if 
													End for 
													If ($_l_FindVariant<0)
														//TRACE
													End if 
													If ($_l_VariantNumber>Size of array:C274($_ar_PeriodConvertRate))
														//TRACE
													End if 
													$_ad_TransDate{1}:=$_ad_TransactionsDate{$_l_BuildBalances}
													$_ar_TransactionAmount{1}:=$_ar_ActAmount{$_l_BuildBalances}
													$_ar_TaxAmount{1}:=$_ar_actTaxAmount{$_l_BuildBalances}
													//we gather additional amounts for the same conversion
													For ($_l_CarryOn; $_l_BuildBalances+1; Size of array:C274($_at_actCurrencyCodes))
														If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
															
															//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
															For ($_l_FindVariant; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
																If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_FindVariant}<=$_ad_TransactionsDate{$_l_CarryOn})
																	If ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}>=$_ad_TransactionsDate{$_l_CarryOn}) | ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}=!00-00-00!)
																		$_l_VariantNumber2:=$_l_FindVariant
																		$_l_FindVariant:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
																	End if 
																End if 
															End for 
															If ($_l_VariantNumber#$_l_VariantNumber2)
																$_l_BuildBalances:=$_l_CarryOn-1  //different rate
																If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
																	
																	//TRACE
																End if 
																$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
															Else 
																$_ar_TransactionAmount{1}:=$_ar_TransactionAmount{1}+$_ar_ActAmount{$_l_CarryOn}
																$_ar_TaxAmount{1}:=$_ar_TaxAmount{1}+$_ar_actTaxAmount{$_l_CarryOn}
															End if 
															
															//
														Else 
															
															$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
															If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
																
																//TRACE
															End if 
															$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
															
														End if 
														
													End for 
													//SELECTION TO ARRAY([TRANSACTIONS]Trans_Date;$_ad_TransDate;[TRANSACTIONS]Amount;$_ar_TransactionAmount;[TRANSACTIONS]Tax_Amount;$_ar_TaxAmount)
													$_r_Balance:=0
													If (Size of array:C274($_ad_TransDate)>0)
														
														For ($_l_index; 1; Size of array:C274($_ad_TransDate))
															$_d_TransactionDate:=$_ad_TransDate{$_l_index}
															$_l_Element:=0
															//TRACE
															For ($_l_Index4; 1; Size of array:C274($_ad_PeriodRateDateFrom{$_l_PeriodRate}))
																If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_Index4}<=$_d_TransactionDate)
																	$_l_Element:=$_l_Index4
																End if 
															End for 
															If ($_l_Element>0)
																$_r_Rate:=$_ar_PeriodConvertRate{$_l_PeriodRate}{$_l_Element}
															Else 
																If (Size of array:C274($_ad_PeriodRateDateTo{$_l_PeriodRate})>0)
																	$_r_Rate:=$_ar_PeriodConvertRate{$_l_PeriodRate}{1}
																Else 
																	$_r_Rate:=1
																	//something is way wrong  if we end up here!!!
																	//TRACE
																End if 
															End if 
															
															If (False:C215)
																For ($_l_Index4; 1; Size of array:C274($_ad_ConvertDate))
																	If ($_ad_ConvertDate{$_l_Index4}<=$_d_TransactionDate)
																		$_l_Element:=$_l_Index4
																	End if 
																End for 
																If ($_l_Element>0)
																	$_r_Rate:=$_ar_ConvertRate{$_l_Element}
																Else 
																	If (Size of array:C274($_ad_ConvertDate)>0)
																		$_r_Rate:=$_ar_ConvertRate{1}
																	Else 
																		$_r_Rate:=1
																		//something is way wrong  if we end up here!!!
																		//TRACE
																	End if 
																End if 
															End if 
															If ($_at_ActAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
																$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
															Else 
																$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
															End if 
															$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
															
														End for 
														$_r_TotalBalance:=$_r_TotalBalance+($_r_Balance)
														$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_Balance)
														If ($_abo_Reconcilled{$_l_BuildBalances})
															$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_Balance)
														Else 
															$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_Balance)
														End if 
														
													Else 
														//no transactions
														//$_r_TotalBalance:=0
													End if 
												Else 
													//although there are multiple rate record the rate is the same on them
													For ($_l_CarryOn; $_l_BuildBalances+1; Size of array:C274($_at_actCurrencyCodes))
														If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
															
															//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
															For ($_l_FindVariant; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
																If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_FindVariant}<=$_ad_TransactionsDate{$_l_CarryOn})
																	If ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}>=$_ad_TransactionsDate{$_l_CarryOn}) | ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}=!00-00-00!)
																		$_l_VariantNumber2:=$_l_FindVariant
																		$_l_FindVariant:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
																	End if 
																End if 
															End for 
															If ($_l_VariantNumber#$_l_VariantNumber2)
																$_l_BuildBalances:=$_l_CarryOn-1  //different rate
																If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
																	
																	//TRACE
																End if 
																$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
															Else 
																Case of 
																	: ($_at_ActAccountCodes{$_l_CarryOn}=DB_GetLedgerVatInputACC)
																		$_r_ThisAmount:=$_r_ThisAmount+$_ar_actTaxAmount{$_l_CarryOn}
																	Else 
																		$_r_ThisAmount:=$_r_ThisAmount+($_ar_ActAmount{$_l_CarryOn})
																End case 
															End if 
															
															//
														Else 
															$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
															If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
																
																//TRACE
															End if 
															$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
															
															
														End if 
														
													End for 
													
													$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
													$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
													If ($_abo_Reconcilled{$_l_BuildBalances})
														$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
													Else 
														$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
													End if 
													
												End if 
												
												
											: (Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})=1)
												For ($_l_CarryOn; $_l_BuildBalances; Size of array:C274($_at_actCurrencyCodes))
													If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
														
														//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
														For ($_l_FindVariant; 1; Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate}))
															If ($_ad_PeriodRateDateFrom{$_l_PeriodRate}{$_l_FindVariant}<=$_ad_TransactionsDate{$_l_CarryOn})
																If ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}>=$_ad_TransactionsDate{$_l_CarryOn}) | ($_ad_PeriodRateDateTo{$_l_PeriodRate}{$_l_FindVariant}=!00-00-00!)
																	$_l_VariantNumber2:=$_l_FindVariant
																	$_l_FindVariant:=Size of array:C274($_ar_PeriodConvertRate{$_l_PeriodRate})
																End if 
															End if 
														End for 
														If ($_l_VariantNumber#$_l_VariantNumber2)
															$_l_BuildBalances:=$_l_CarryOn-1  //different rate
															If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
																
																//TRACE
															End if 
															$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
														Else 
															Case of 
																: ($_at_ActAccountCodes{$_l_CarryOn}=DB_GetLedgerVatInputACC)
																	$_r_ThisAmount:=$_r_ThisAmount+$_ar_actTaxAmount{$_l_CarryOn}
																Else 
																	$_r_ThisAmount:=$_r_ThisAmount+($_ar_ActAmount{$_l_CarryOn})
															End case 
														End if 
														
														//
													Else 
														$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
														If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
															
															//TRACE
														End if 
														$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
														
														
													End if 
													
												End for 
												
												
												$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												End if 
												
												
												
											Else 
												//TRACE
												$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*1))
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												End if 
												
										End case 
								End case 
								
						End case 
						
						
					Else 
						//value at current rate
						$_l_PeriodID:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
						//now find the rate for this period
						If ($_l_PeriodID=0)
							ALL RECORDS:C47([PERIODS:33])
							ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
							FIRST RECORD:C50([PERIODS:33])
							$_d_EarliestDate:=[PERIODS:33]From_Date:3
							$_d_LatestDate:=Current date:C33(*)
							Repeat 
								IDLE:C311
								$_l_Dayof:=Day of:C23($_d_LatestDate)
								$_d_firstDayofMomth:=$_d_LatestDate-($_l_Dayof-1)  //Gets FIrst day of month
								$_d_LatestDate:=$_d_firstDayofMomth-1  //gets last day of previous month
								$_l_PeriodID:=Check_Period(Date_FromNums(1; Month of:C24($_d_LatestDate); Year of:C25($_d_LatestDate)))
							Until ($_l_PeriodID>0) | ($_d_LatestDate<$_d_EarliestDate)
						End if 
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_OutputCurrency; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_PeriodID)
						
						Case of 
							: (Records in selection:C76([CURRENCY_RATES:72])>1)
								ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
								FIRST RECORD:C50([CURRENCY_RATES:72])
								$_r_Rate:=[CURRENCY_RATES:72]Rate:3
								// /
								For ($_l_CarryOn; $_l_BuildBalances; Size of array:C274($_at_actCurrencyCodes))
									If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
										
										//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
										
										
										Case of 
											: ($_at_ActAccountCodes{$_l_CarryOn}=DB_GetLedgerVatInputACC)
												$_r_ThisAmount:=$_r_ThisAmount+$_ar_actTaxAmount{$_l_CarryOn}
											Else 
												$_r_ThisAmount:=$_r_ThisAmount+($_ar_ActAmount{$_l_CarryOn})
										End case 
										
										//
									Else 
										$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
										If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
											
											//TRACE
										End if 
										$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
										
										
									End if 
									
								End for 
								
								// /
								$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*$_r_Rate)
								$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								If ($_abo_Reconcilled{$_l_BuildBalances})
									$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								Else 
									$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								End if 
								
							: (Records in selection:C76([CURRENCY_RATES:72])=1)
								$_r_Rate:=[CURRENCY_RATES:72]Rate:3
								For ($_l_CarryOn; $_l_BuildBalances; Size of array:C274($_at_actCurrencyCodes))
									If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
										
										//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
										
										
										Case of 
											: ($_at_ActAccountCodes{$_l_CarryOn}=DB_GetLedgerVatInputACC)
												$_r_ThisAmount:=$_r_ThisAmount+$_ar_actTaxAmount{$_l_CarryOn}
											Else 
												$_r_ThisAmount:=$_r_ThisAmount+($_ar_ActAmount{$_l_CarryOn})
										End case 
										
										//
									Else 
										$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
										If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
											
											//TRACE
										End if 
										$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
										
										
									End if 
									
								End for 
								
								
								
								
								$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*$_r_Rate)
								$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								If ($_abo_Reconcilled{$_l_BuildBalances})
									$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								Else 
									$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								End if 
								
							Else 
								$_l_PeriodID:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
								$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
								QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
								For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
									$_l_PeriodID:=[PERIODS:33]x_ID:10
									
									
									//now find the rate for this period
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_OutputCurrency; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_PeriodID)
									If (Records in selection:C76([CURRENCY_RATES:72])>0)
										$_l_index:=Records in selection:C76([PERIODS:33])+1
									End if 
									NEXT RECORD:C51([PERIODS:33])
								End for 
								Case of 
									: (Records in selection:C76([CURRENCY_RATES:72])>1)
										ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
										FIRST RECORD:C50([CURRENCY_RATES:72])
										$_r_Rate:=[CURRENCY_RATES:72]Rate:3
										For ($_l_CarryOn; $_l_BuildBalances; Size of array:C274($_at_actCurrencyCodes))
											If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
												
												//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
												
												
												Case of 
													: ($_at_ActAccountCodes{$_l_CarryOn}=DB_GetLedgerVatInputACC)
														$_r_ThisAmount:=$_r_ThisAmount+$_ar_actTaxAmount{$_l_CarryOn}
													Else 
														$_r_ThisAmount:=$_r_ThisAmount+($_ar_ActAmount{$_l_CarryOn})
												End case 
												
												//
											Else 
												$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
												If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
													
													//TRACE
												End if 
												$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
												
												
											End if 
											
										End for 
										
										$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*$_r_Rate)
										$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										If ($_abo_Reconcilled{$_l_BuildBalances})
											$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										Else 
											$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										End if 
										
									: (Records in selection:C76([CURRENCY_RATES:72])=1)
										$_r_Rate:=[CURRENCY_RATES:72]Rate:3
										For ($_l_CarryOn; $_l_BuildBalances; Size of array:C274($_at_actCurrencyCodes))
											If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
												
												//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
												
												
												Case of 
													: ($_at_ActAccountCodes{$_l_CarryOn}=DB_GetLedgerVatInputACC)
														$_r_ThisAmount:=$_r_ThisAmount+$_ar_actTaxAmount{$_l_CarryOn}
													Else 
														$_r_ThisAmount:=$_r_ThisAmount+($_ar_ActAmount{$_l_CarryOn})
												End case 
												
												//
											Else 
												$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
												If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
													
													//TRACE
												End if 
												$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
												
												
											End if 
											
										End for 
										
										$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*$_r_Rate)
										$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										If ($_abo_Reconcilled{$_l_BuildBalances})
											$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										Else 
											$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										End if 
										
									Else 
										$_l_PeriodID:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
										$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
										QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
										ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
										For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
											$_l_PeriodID:=[PERIODS:33]x_ID:10
											
											
											//now find the rate for this period
											QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_OutputCurrency; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_PeriodID)
											If (Records in selection:C76([CURRENCY_RATES:72])>0)
												$_l_index:=Records in selection:C76([PERIODS:33])+1
											End if 
											NEXT RECORD:C51([PERIODS:33])
										End for 
										Case of 
											: (Records in selection:C76([CURRENCY_RATES:72])>1)
												ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
												FIRST RECORD:C50([CURRENCY_RATES:72])
												$_r_Rate:=[CURRENCY_RATES:72]Rate:3
												For ($_l_CarryOn; $_l_BuildBalances; Size of array:C274($_at_actCurrencyCodes))
													If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
														
														//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
														
														
														Case of 
															: ($_at_ActAccountCodes{$_l_CarryOn}=DB_GetLedgerVatInputACC)
																$_r_ThisAmount:=$_r_ThisAmount+$_ar_actTaxAmount{$_l_CarryOn}
															Else 
																$_r_ThisAmount:=$_r_ThisAmount+($_ar_ActAmount{$_l_CarryOn})
														End case 
														
														//
													Else 
														$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
														If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
															
															//TRACE
														End if 
														$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
														
														
													End if 
													
												End for 
												
												$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												End if 
												
											: (Records in selection:C76([CURRENCY_RATES:72])=1)
												$_r_Rate:=[CURRENCY_RATES:72]Rate:3
												For ($_l_CarryOn; $_l_BuildBalances; Size of array:C274($_at_actCurrencyCodes))
													If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_at_actCurrencyCodes{$_l_CarryOn}) & ($_at_ActAccountCodes{$_l_BuildBalances}=$_at_ActAccountCodes{$_l_CarryOn}) & ($_at_ActPeriodCodes{$_l_BuildBalances}=$_at_ActPeriodCodes{$_l_CarryOn}) & ($_at_ActAnalysisCode{$_l_BuildBalances}=$_at_ActAnalysisCode{$_l_CarryOn}) & ($_at_actLayerCode{$_l_BuildBalances}=$_at_actLayerCode{$_l_CarryOn})
														
														//SELECTION TO ARRAY(;;;;;;[TRANSACTIONS]Amount;$_ar_ActAmount;[TRANSACTIONS]Analysis_Code;;;;[TRANSACTIONS]Tax_Amount;$_ar_actTaxAmount;[TRANSACTIONS]Trans_Date;$_ad_TransactionsDate)
														
														
														Case of 
															: ($_at_ActAccountCodes{$_l_CarryOn}=DB_GetLedgerVatInputACC)
																$_r_ThisAmount:=$_r_ThisAmount+$_ar_actTaxAmount{$_l_CarryOn}
															Else 
																$_r_ThisAmount:=$_r_ThisAmount+($_ar_ActAmount{$_l_CarryOn})
														End case 
														
														//
													Else 
														$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
														If ($_l_BuildBalances=30) & ($_l_CheckByAccount=8)
															
															//TRACE
														End if 
														$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
														
														
													End if 
													
												End for 
												
												$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*$_r_Rate)
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												End if 
												
											Else 
												//TRACE
												$_r_Rate:=1
												$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*1)
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												End if 
												
												
										End case 
										
										
								End case 
								
						End case 
						
						
						
					End if 
					
					
				End if 
			End if 
		End for 
		$_r_ReconcilledBalance:=$_r_TotalBalance
		If (True:C214)
			//TRACE
			$_r_UnRecoAddTotal:=0
			$_r_RecoAddTotal:=0
			For ($_l_FILLTOTAL; 1; Size of array:C274($_ar_accountRecTotal))
				$_r_UnRecoAddTotal:=$_r_UnRecoAddTotal+$_ar_accountUnrecTotal{$_l_FILLTOTAL}
				$_r_RecoAddTotal:=$_r_UnRecoAddTotal+$_ar_accountRecTotal{$_l_FILLTOTAL}
				//$_ar_ReturnReconciledBalance{Size of array($_ar_ReturnReconciledBalance)}:=Round($_ar_ReturnReconciledBalance{Size of array($_ar_ReturnReconciledBalance)}+$_ar_accountRecTotal{$_l_FILLTOTAL};2)
				
			End for 
		End if 
		$_ar_ReturnUnreconciledBalance{Size of array:C274($_ar_ReturnUnreconciledBalance)}:=Round:C94($_ar_ReturnUnreconciledBalance{Size of array:C274($_ar_ReturnUnreconciledBalance)}+$_r_UnRecoAddTotal; 2)
		//TRACE
		If (True:C214)
			QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=$_at_AccountCodeRange{$_l_CheckByAccount})
			//QUERY SELECTION WITH ARRAY([ACCOUNT_BALANCES]Currency_Code;$_at_CurrencyCodes)
			//QUERY SELECTION WITH ARRAY([ACCOUNT_BALANCES]Analysis_Code;$_at_analysesRange)
			//QUERY SELECTION WITH ARRAY([ACCOUNT_BALANCES]Layer_Code;$_at_layersRange)
			
			CREATE SET:C116([ACCOUNT_BALANCES:34]; "$Temp2")
			QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6#$_t_OutputCurrency; *)
			QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6#"")
			If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
				USE SET:C118("$Temp2")
				VBALANCE:=0
				Calc_BalArr
				$_r_accountBalance:=VBALANCE
			Else 
				USE SET:C118("$Temp2")
				QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_OutputCurrency; *)
				QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
				VBALANCE:=0
				Calc_BalArr
				$_r_accountBalance:=VBALANCE
				USE SET:C118("$Temp2")
				QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6#$_t_OutputCurrency; *)
				QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6#"")
				DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; $_at_CurrencyToConvert)
				$_r_Balance:=CUR_CalcBalConv(->$_at_CurrencyToConvert; $_t_OutputCurrency)
				$_r_accountBalance:=$_r_accountBalance+$_r_Balance
			End if 
			//$_r_accountBalance
			//$_ar_ReturnReconciledBalance{Size of array($_ar_ReturnReconciledBalance)}:=Round($_r_accountBalance-$_ar_ReturnReconciledBalance{Size of array($_ar_ReturnReconciledBalance)};2)
			//$_ar_ReturnTotalBalance{Size of array($_ar_ReturnTotalBalance)}:=Round($_r_accountBalance-$_ar_ReturnreconciledBalance{Size of array($_ar_ReturnreconciledBalance)};2)
		End if 
		
		$_ar_ReturnTotalBalance{Size of array:C274($_ar_ReturnTotalBalance)}:=Round:C94($_r_accountBalance-$_ar_ReturnUnreconciledBalance{Size of array:C274($_ar_ReturnUnreconciledBalance)}; 2)
		//$_ar_ReturnUnreconciledBalance{Size of array($_ar_ReturnUnreconciledBalance)}:=Round($_ar_ReturnTotalBalance{Size of array($_ar_ReturnTotalBalance)}-$_ar_ReturnReconciledBalance{Size of array($_ar_ReturnReconciledBalance)};2)
		
		
		
	End if 
	
	
	
End for 
ARRAY TEXT:C222($_at_AccountsLists; 0)
ARRAY TEXT:C222($_at_AccountsLists; Size of array:C274($_ar_ReturnReconciledBalance))
For ($_l_BuildOUtput; Size of array:C274($_ar_ReturnReconciledBalance); 1; -1)
	$_l_Ref:=Find in array:C230($_at_ReturnCurrencyCode; $_at_ReturnCurrencyCode{$_l_BuildOUtput})
	If ($_l_Ref<$_l_BuildOUtput)
		If ($_at_AccountsLists{$_l_Ref}="")
			$_at_AccountsLists{$_l_Ref}:=$_at_ReturnAccountCode{$_l_BuildOUtput}
		Else 
			$_at_AccountsLists{$_l_Ref}:=$_at_ReturnAccountCode{$_l_BuildOUtput}+", "+$_at_AccountsLists{$_l_Ref}
		End if 
		$_ar_ReturnReconciledBalance{$_l_Ref}:=$_ar_ReturnReconciledBalance{$_l_Ref}+$_ar_ReturnReconciledBalance{$_l_BuildOUtput}
		$_ar_ReturnUnreconciledBalance{$_l_Ref}:=$_ar_ReturnUnreconciledBalance{$_l_Ref}+$_ar_ReturnUnreconciledBalance{$_l_BuildOUtput}
		$_ar_ReturnTotalBalance{$_l_Ref}:=$_ar_ReturnTotalBalance{$_l_Ref}+$_ar_ReturnTotalBalance{$_l_BuildOUtput}
		DELETE FROM ARRAY:C228($_at_AccountsLists; $_l_BuildOUtput)
		DELETE FROM ARRAY:C228($_at_ReturnAccountCode; $_l_BuildOUtput)
		DELETE FROM ARRAY:C228($_at_ReturnCurrencyCode; $_l_BuildOUtput)
		DELETE FROM ARRAY:C228($_ar_ReturnTotalBalance; $_l_BuildOUtput)
		DELETE FROM ARRAY:C228($_ar_ReturnReconciledBalance; $_l_BuildOUtput)
		DELETE FROM ARRAY:C228($_ar_ReturnUnreconciledBalance; $_l_BuildOUtput)
	Else 
		If ($_at_AccountsLists{$_l_BuildOUtput}="")
			$_at_AccountsLists{$_l_BuildOUtput}:=$_at_ReturnAccountCode{$_l_BuildOUtput}
		Else 
			$_at_AccountsLists{$_l_BuildOUtput}:=$_at_ReturnAccountCode{$_l_BuildOUtput}+", "+$_at_AccountsLists{$_l_BuildOUtput}
		End if 
	End if 
	
End for 

COPY ARRAY:C226($_at_AccountsLists; $_at_ReturnAccountCode)
If (Count parameters:C259>=5)
	COPY ARRAY:C226($_at_ReturnAccountCode; $_ptr_AccountCodes->)
	COPY ARRAY:C226($_at_ReturnCurrencyCode; $_ptr_CurrencyCodes->)
	COPY ARRAY:C226($_ar_ReturnTotalBalance; $_ptr_AccountBalances->)
	COPY ARRAY:C226($_ar_ReturnReconciledBalance; $_ptr_Reconciled->)
	COPY ARRAY:C226($_ar_ReturnUnreconciledBalance; $_ptr_Unreconciled->)
End if 
USE NAMED SELECTION:C332("$CurrentSelection")
ERR_MethodTrackerReturn("ACC_GetReconciledBalances"; $_t_oldMethodName)
