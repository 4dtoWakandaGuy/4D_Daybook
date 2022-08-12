//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_LoadToArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_AccountCodeOutputTotal; 0)
	//ARRAY REAL(ACC_ar_BalConvertedACCPrfTotals;0)
	//ARRAY REAL(ACC_ar_BalConvertedAccTotals;0)
	//ARRAY REAL(ACC_ar_BalCurrencyTotalAmounts;0)
	//ARRAY REAL(ACC_ar_BalOuptutAccountBalance;0)
	//ARRAY REAL(ACC_ar_CurrentBalance;0)
	//ARRAY REAL(ACC_ar_NotPLBalance;0)
	//ARRAY REAL(ACC_ar_OutputACCprofBalance;0)
	ARRAY TEXT:C222($_at_AccountCodesOutputIndex; 0)
	//ARRAY TEXT(ACC_at_BalAccountCodes;0)
	//ARRAY TEXT(ACC_at_BalAccountIdentity;0)
	//ARRAY TEXT(ACC_at_BalAccountPLString;0)
	//ARRAY TEXT(ACC_at_BalAnalysisCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyCodesRange;0)
	//ARRAY TEXT(ACC_at_BalCurrencyTotalsCC;0)
	//ARRAY TEXT(ACC_at_BalLayerCodes;0)
	//ARRAY TEXT(ACC_at_BalPeriodCodes;0)
	C_BOOLEAN:C305($_bo_BalanceCheck; $_bo_Ignore; $_bo_Message; $2; ACC_Bo_CheckBalance)
	C_LONGINT:C283($_l_BalanceCodePosition; $_l_CurrencyCodePosition; $_l_Index; $_l_OtherSide; $_l_TransactionID; $_l_TransactionsIndex)
	C_REAL:C285($_r_Balance; $_r_SubBalance; $_r_Total; $_r_Total2)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>VATCS; $_t_Account; $_t_LastPeriod; $_t_oldMethodName; $_t_Space; $_t_Space2; $_t_Tabs; $_t_Tabs1; $_t_Tabs2; $_t_Tabs3)
	C_TEXT:C284($_t_Tabs4; $_t_Tabs5; $_t_Tabs6; $_t_Tabs7; $_t_Tabs8; $_t_UniqueIdent; $_t_YearPeriodFrom; $_t_YearPeriodTo; $1; $3; $4)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_LoadToArrays")
//ACC_LoadToarrays

Open window:C153(40; 40; 650; 130; -1986)

SET WINDOW TITLE:C213("Reading/Converting Account Balances")
CREATE SET:C116([ACCOUNT_BALANCES:34]; "$toPrint")
ACC_ArrayDeclare
ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Unique_StringIdent:8; >)
If (Count parameters:C259<3)
	$_t_YearPeriodFrom:=ACC_GetYearStart(Current date:C33(*))
Else 
	If ($3#"")
		$_t_YearPeriodFrom:=$3
	Else 
		$_t_YearPeriodFrom:=ACC_GetYearStart(Current date:C33(*))
	End if 
End if 
If (Count parameters:C259>=4)
	$_t_YearPeriodTo:=$4  // this is the final period on the report
	
End if 

ARRAY REAL:C219(ACC_ar_CurrentBalance; 0)
SELECTION TO ARRAY:C260([ACCOUNT_BALANCES:34]Unique_StringIdent:8; ACC_at_BalAccountIdentity; [ACCOUNT_BALANCES:34]Account_Code:2; ACC_at_BalAccountCodes; [ACCOUNT_BALANCES:34]Analysis_Code:1; ACC_at_BalAnalysisCodes; [ACCOUNT_BALANCES:34]Period_Code:4; ACC_at_BalPeriodCodes; [ACCOUNT_BALANCES:34]Layer_Code:5; ACC_at_BalLayerCodes; [ACCOUNT_BALANCES:34]Currency_Code:6; ACC_at_BalCurrencyCodes; [ACCOUNT_BALANCES:34]Balance:3; ACC_ar_CurrentBalance)
FIRST RECORD:C50([ACCOUNT_BALANCES:34])
ARRAY REAL:C219(ACC_ar_NotPLBalance; Size of array:C274(ACC_at_BalAccountIdentity))
For ($_l_Index; 1; Size of array:C274(ACC_at_BalAccountIdentity))
	ERASE WINDOW:C160
	MESSAGE:C88(Char:C90(13)+"Reading Account Balances "+ACC_at_BalAccountIdentity{$_l_Index})
	If (ACC_at_BalCurrencyCodes{$_l_Index}="")
		ACC_at_BalCurrencyCodes{$_l_Index}:=<>SYS_t_BaseCurrency
	End if 
	ACC_at_BalAccountPLString{$_l_Index}:=ACC_Buildunique(DB_GetLedgerProfitACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index})
	If (ACC_at_BalAccountIdentity{$_l_Index}=ACC_at_BalAccountIdentity{$_l_Index-1})
		$_bo_Ignore:=True:C214
		$_l_Index:=$_l_Index-1
	Else 
		$_bo_BalanceCheck:=False:C215
		$_bo_Ignore:=False:C215
	End if 
	If (Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})<Size of array:C274(ACC_at_BalCurrencyCodesRange))
		INSERT IN ARRAY:C227(ACC_ar_BalCurrencyTotalAmounts{$_l_Index}; Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
		INSERT IN ARRAY:C227(ACC_at_BalCurrencyTotalsCC{$_l_Index}; Size of array:C274(ACC_at_BalCurrencyTotalsCC{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
		INSERT IN ARRAY:C227(ACC_ar_BalConvertedAccTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedAccTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
		INSERT IN ARRAY:C227(ACC_ar_BalConvertedACCPrfTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedACCPrfTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
		
	End if 
	$_bo_Message:=False:C215
	Case of 
		: (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerVatInputACC)
			
			If (ACC_at_BalCurrencyCodes{$_l_Index}#$1)
				MESSAGE:C88(Char:C90(13)+"Converting "+ACC_at_BalCurrencyCodes{$_l_Index}+"  VAT Balance")
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdentTAX:29=ACC_Buildunique(""; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index}); *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS"; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerVatInputACC)
				ACC_LoadTransToArrays($_l_Index; $1; ->[TRANSACTIONS:29]Tax_Amount:16; "+"; $_t_YearPeriodTo)
			Else 
				If (ACC_Bo_CheckBalance) | ($_bo_BalanceCheck)
					MESSAGE:C88(Char:C90(13)+"Checking"+"  VAT Balance")
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdentTAX:29=ACC_Buildunique(""; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index}); *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS"; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerVatInputACC)
					$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
				Else 
					$_r_Balance:=ACC_ar_CurrentBalance{$_l_Index}
				End if 
				$_l_BalanceCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				If ($_l_BalanceCodePosition<0)
					INSERT IN ARRAY:C227(ACC_at_BalCurrencyCodesRange; Size of array:C274(ACC_at_BalCurrencyCodesRange)+1; 1)
					ACC_at_BalCurrencyCodesRange{Size of array:C274(ACC_at_BalCurrencyCodesRange)}:=ACC_at_BalCurrencyCodes{$_l_Index}
					If (Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})<Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalCurrencyTotalAmounts{$_l_Index}; Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_at_BalCurrencyTotalsCC{$_l_Index}; Size of array:C274(ACC_at_BalCurrencyTotalsCC{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedAccTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedAccTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedACCPrfTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedACCPrfTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						
					End if 
					$_l_BalanceCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				End if 
				ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_BalanceCodePosition}:=ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_BalanceCodePosition}+$_r_Balance
				ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_BalanceCodePosition}:=ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_BalanceCodePosition}+$_r_Balance
				ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_BalanceCodePosition}:=ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_BalanceCodePosition}+$_r_Balance
				ACC_ar_BalOuptutAccountBalance{$_l_Index}:=ACC_ar_BalOuptutAccountBalance{$_l_Index}+$_r_Balance
				ACC_ar_OutputACCprofBalance{$_l_Index}:=ACC_ar_OutputACCprofBalance{$_l_Index}+$_r_Balance
			End if 
			If (ACC_at_BalCurrencyCodes{$_l_Index}#$1)
				MESSAGE:C88(Char:C90(13)+"Converting "+ACC_at_BalCurrencyCodes{$_l_Index}+"  VAT Balance")
				$_t_UniqueIdent:=ACC_Buildunique(DB_GetLedgerVatInputACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index})
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=$_t_UniqueIdent; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS")
				ACC_LoadTransToArrays($_l_Index; $1; ->[TRANSACTIONS:29]Total:17; "+"; $_t_YearPeriodTo)
			Else 
				If (ACC_Bo_CheckBalance) | ($_bo_BalanceCheck)
					MESSAGE:C88(Char:C90(13)+"Checking"+"  VAT Balance")
					
					$_t_UniqueIdent:=ACC_Buildunique(DB_GetLedgerVatInputACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index})
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=$_t_UniqueIdent; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS")
					$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
				Else 
					$_r_Balance:=0
				End if 
				$_l_CurrencyCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				If ($_l_CurrencyCodePosition<0)
					INSERT IN ARRAY:C227(ACC_at_BalCurrencyCodesRange; Size of array:C274(ACC_at_BalCurrencyCodesRange)+1; 1)
					ACC_at_BalCurrencyCodesRange{Size of array:C274(ACC_at_BalCurrencyCodesRange)}:=ACC_at_BalCurrencyCodes{$_l_Index}
					If (Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})<Size of array:C274(ACC_at_BalCurrencyCodesRange))
						
						INSERT IN ARRAY:C227(ACC_ar_BalCurrencyTotalAmounts{$_l_Index}; Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_at_BalCurrencyTotalsCC{$_l_Index}; Size of array:C274(ACC_at_BalCurrencyTotalsCC{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedAccTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedAccTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedACCPrfTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedACCPrfTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						
					End if 
					$_l_CurrencyCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				End if   //12
				
				ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				
				ACC_ar_BalOuptutAccountBalance{$_l_Index}:=ACC_ar_BalOuptutAccountBalance{$_l_Index}+$_r_Balance
				ACC_ar_OutputACCprofBalance{$_l_Index}:=ACC_ar_OutputACCprofBalance{$_l_Index}+$_r_Balance
				
			End if 
			
		: (ACC_at_BalAccountCodes{$_l_Index}=<>VATCS)
			
			If (ACC_at_BalCurrencyCodes{$_l_Index}#$1)  //14
				
				MESSAGE:C88(Char:C90(13)+"Converting "+ACC_at_BalCurrencyCodes{$_l_Index}+"  VAT Balance")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OC"; *)
				QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IC"; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Unique_StringIdentTAX:29=ACC_Buildunique(""; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index}); *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
				ACC_LoadTransToArrays($_l_Index; $1; ->[TRANSACTIONS:29]Tax_Amount:16; "-"; $_t_YearPeriodTo)
			Else 
				If (ACC_Bo_CheckBalance) | ($_bo_BalanceCheck)  //15
					
					MESSAGE:C88(Char:C90(13)+"Checking"+" VAT Balance")
					
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OC"; *)
					QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IC"; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Unique_StringIdentTAX:29=ACC_Buildunique(""; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index}); *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
					$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
				Else 
					$_r_Balance:=ACC_ar_CurrentBalance{$_l_Index}
				End if 
				$_l_CurrencyCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				If ($_l_CurrencyCodePosition<0)
					INSERT IN ARRAY:C227(ACC_at_BalCurrencyCodesRange; Size of array:C274(ACC_at_BalCurrencyCodesRange)+1; 1)
					ACC_at_BalCurrencyCodesRange{Size of array:C274(ACC_at_BalCurrencyCodesRange)}:=ACC_at_BalCurrencyCodes{$_l_Index}
					If (Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})<Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalCurrencyTotalAmounts{$_l_Index}; Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_at_BalCurrencyTotalsCC{$_l_Index}; Size of array:C274(ACC_at_BalCurrencyTotalsCC{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedAccTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedAccTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedACCPrfTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedACCPrfTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						
					End if 
					$_l_CurrencyCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				End if 
				ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				
				ACC_ar_BalOuptutAccountBalance{$_l_Index}:=ACC_ar_BalOuptutAccountBalance{$_l_Index}+$_r_Balance
				ACC_ar_OutputACCprofBalance{$_l_Index}:=ACC_ar_OutputACCprofBalance{$_l_Index}+$_r_Balance
			End if 
			If (ACC_at_BalCurrencyCodes{$_l_Index}#$1)
				MESSAGE:C88(Char:C90(13)+"Converting "+ACC_at_BalCurrencyCodes{$_l_Index}+"  VAT Balance")
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OS"; *)
				QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IS"; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Unique_StringIdentTAX:29=ACC_Buildunique(""; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index}); *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
				ACC_LoadTransToArrays($_l_Index; $1; ->[TRANSACTIONS:29]Tax_Amount:16; "+"; $_t_YearPeriodTo)
			Else 
				If (ACC_Bo_CheckBalance) | ($_bo_BalanceCheck)  //19
					
					MESSAGE:C88(Char:C90(13)+"Checking"+"  VAT Balance")
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OS"; *)
					QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IS"; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Unique_StringIdentTAX:29=ACC_Buildunique(""; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index}); *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
					$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
				Else 
					$_r_Balance:=0
				End if 
				$_l_CurrencyCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				If ($_l_CurrencyCodePosition<0)
					INSERT IN ARRAY:C227(ACC_at_BalCurrencyCodesRange; Size of array:C274(ACC_at_BalCurrencyCodesRange)+1; 1)
					ACC_at_BalCurrencyCodesRange{Size of array:C274(ACC_at_BalCurrencyCodesRange)}:=ACC_at_BalCurrencyCodes{$_l_Index}
					If (Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})<Size of array:C274(ACC_at_BalCurrencyCodesRange))  //21
						
						INSERT IN ARRAY:C227(ACC_ar_BalCurrencyTotalAmounts{$_l_Index}; Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_at_BalCurrencyTotalsCC{$_l_Index}; Size of array:C274(ACC_at_BalCurrencyTotalsCC{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedAccTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedAccTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedACCPrfTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedACCPrfTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						
					End if 
					$_l_CurrencyCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				End if 
				ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				
				ACC_ar_BalOuptutAccountBalance{$_l_Index}:=ACC_ar_BalOuptutAccountBalance{$_l_Index}+$_r_Balance
				ACC_ar_OutputACCprofBalance{$_l_Index}:=ACC_ar_OutputACCprofBalance{$_l_Index}+$_r_Balance
			End if 
			If (ACC_at_BalCurrencyCodes{$_l_Index}#$1)
				MESSAGE:C88(Char:C90(13)+"Converting "+ACC_at_BalCurrencyCodes{$_l_Index}+"  VAT Balance")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=ACC_Buildunique(DB_GetLedgerCashvatACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index}))
				ACC_LoadTransToArrays($_l_Index; $1; ->[TRANSACTIONS:29]Total:17; "+"; $_t_YearPeriodTo)
			Else 
				If (ACC_Bo_CheckBalance) | ($_bo_BalanceCheck)
					MESSAGE:C88(Char:C90(13)+"Checking"+"  VAT Balance")
					
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=ACC_Buildunique(DB_GetLedgerCashvatACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index}))
					$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
				Else 
					$_r_Balance:=0  //[ACC BALANCES]Balance
					
				End if 
				$_l_CurrencyCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				If ($_l_CurrencyCodePosition<0)
					INSERT IN ARRAY:C227(ACC_at_BalCurrencyCodesRange; Size of array:C274(ACC_at_BalCurrencyCodesRange)+1; 1)
					ACC_at_BalCurrencyCodesRange{Size of array:C274(ACC_at_BalCurrencyCodesRange)}:=ACC_at_BalCurrencyCodes{$_l_Index}
					If (Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})<Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalCurrencyTotalAmounts{$_l_Index}; Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_at_BalCurrencyTotalsCC{$_l_Index}; Size of array:C274(ACC_at_BalCurrencyTotalsCC{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedAccTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedAccTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedACCPrfTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedACCPrfTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						
					End if 
					$_l_CurrencyCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				End if 
				ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				
				ACC_ar_BalOuptutAccountBalance{$_l_Index}:=ACC_ar_BalOuptutAccountBalance{$_l_Index}+$_r_Balance
				ACC_ar_OutputACCprofBalance{$_l_Index}:=ACC_ar_OutputACCprofBalance{$_l_Index}+$_r_Balance
			End if 
			
		Else 
			If (ACC_at_BalCurrencyCodes{$_l_Index}#$1)
				MESSAGE:C88(Char:C90(13)+"Converting "+ACC_at_BalCurrencyCodes{$_l_Index})
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=ACC_at_BalAccountIdentity{$_l_Index})
				If (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC) | (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC)
					Case of 
						: (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC)
							If (ACC_at_BalPeriodCodes{$_l_Index}<$_t_YearPeriodFrom)
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1="PLYC")
								If (Records in selection:C76([TRANSACTIONS:29])=0)  //31
									
									//this has not been posted
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=ACC_at_BalAccountIdentity{$_l_Index})
								End if 
							Else 
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1="PLYT")
							End if 
						: (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC)
							If (ACC_at_BalPeriodCodes{$_l_Index}<$_t_YearPeriodFrom)
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1="PLYC")
								If (Records in selection:C76([TRANSACTIONS:29])=0)
									//this has not been posted
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=ACC_at_BalAccountIdentity{$_l_Index})
								End if 
							End if 
					End case 
				End if 
				ACC_LoadTransToArrays($_l_Index; $1; ->[TRANSACTIONS:29]Amount:6; "+"; $_t_YearPeriodTo)
			Else 
				
				If (ACC_Bo_CheckBalance) | ($_bo_BalanceCheck)
					
					MESSAGE:C88(Char:C90(13)+"Calculating Account Balance from Transactions")
					
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=ACC_at_BalAccountIdentity{$_l_Index})
					If (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC) | (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC)
						Case of 
							: (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC)
								If (ACC_at_BalPeriodCodes{$_l_Index}<$_t_YearPeriodFrom)
									QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1="PLYC")
									If (Records in selection:C76([TRANSACTIONS:29])=0)
										//this has not been posted
										QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=ACC_at_BalAccountIdentity{$_l_Index})
									End if 
								Else 
									QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1="PLYT")
								End if 
							: (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC)
								If (ACC_at_BalPeriodCodes{$_l_Index}<$_t_YearPeriodFrom)
									QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1="PLYC")
									If (Records in selection:C76([TRANSACTIONS:29])=0)
										QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=ACC_at_BalAccountIdentity{$_l_Index})
									End if 
								End if 
								
						End case 
					End if 
					$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Amount:6)); 2; 2)
				Else 
					$_r_Balance:=ACC_ar_CurrentBalance{$_l_Index}
				End if 
				$_l_CurrencyCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				If ($_l_CurrencyCodePosition<0)
					INSERT IN ARRAY:C227(ACC_at_BalCurrencyCodesRange; Size of array:C274(ACC_at_BalCurrencyCodesRange)+1; 1)
					ACC_at_BalCurrencyCodesRange{Size of array:C274(ACC_at_BalCurrencyCodesRange)}:=ACC_at_BalCurrencyCodes{$_l_Index}
					If (Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})<Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalCurrencyTotalAmounts{$_l_Index}; Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_at_BalCurrencyTotalsCC{$_l_Index}; Size of array:C274(ACC_at_BalCurrencyTotalsCC{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedAccTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedAccTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedACCPrfTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedACCPrfTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						
					End if 
					$_l_CurrencyCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				End if 
				ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				
				If (ACC_at_BalAccountCodes{$_l_Index}#DB_GetLedgerProfitACC) & (ACC_at_BalAccountCodes{$_l_Index}#DB_GetLedgerBroughtforwardACC)
					ACC_ar_BalOuptutAccountBalance{$_l_Index}:=ACC_ar_BalOuptutAccountBalance{$_l_Index}+$_r_Balance
					ACC_ar_OutputACCprofBalance{$_l_Index}:=ACC_ar_OutputACCprofBalance{$_l_Index}+$_r_Balance
				End if 
				If (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=ACC_at_BalAccountIdentity{$_l_Index})
					Case of 
						: (Records in selection:C76([TRANSACTIONS:29])=0)
							ACC_ar_BalOuptutAccountBalance{$_l_Index}:=$_r_Balance
							ACC_ar_OutputACCprofBalance{$_l_Index}:=$_r_Balance
						Else   //45
							
							$_r_SubBalance:=0
							ACC_ar_BalOuptutAccountBalance{$_l_Index}:=$_r_Balance
							ACC_ar_OutputACCprofBalance{$_l_Index}:=$_r_Balance
							CREATE SET:C116([TRANSACTIONS:29]; "$tTemp")
							MESSAGE:C88(Char:C90(13)+"Cross Checking Profit Posting")
							For ($_l_TransactionsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
								USE SET:C118("$tTemp")
								GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_TransactionsIndex)
								$_l_TransactionID:=[TRANSACTIONS:29]Transaction_ID:31
								If ([TRANSACTIONS:29]Transaction_OtherSideID:32>0)  //& (False)
									
									$_l_TransactionID:=[TRANSACTIONS:29]Transaction_ID:31
									$_l_OtherSide:=[TRANSACTIONS:29]Transaction_OtherSideID:32
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_OtherSide)
									If ([TRANSACTIONS:29]Account_Code:3=DB_GetLedgerProfitACC)
										QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_TransactionID)
										ACC_ar_BalOuptutAccountBalance{$_l_Index}:=ACC_ar_BalOuptutAccountBalance{$_l_Index}-[TRANSACTIONS:29]Total:17
										ACC_ar_OutputACCprofBalance{$_l_Index}:=ACC_ar_OutputACCprofBalance{$_l_Index}-[TRANSACTIONS:29]Total:17
										
									Else 
										QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_TransactionID)
										ACC_ar_NotPLBalance{$_l_Index}:=ACC_ar_NotPLBalance{$_l_Index}+[TRANSACTIONS:29]Total:17
									End if 
								Else 
									$_r_SubBalance:=$_r_SubBalance+ACC_ReportCheckBatch([TRANSACTIONS:29]Batch_Number:7; [TRANSACTIONS:29]BatchItem_X_ID:30)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_TransactionID)
									$_l_OtherSide:=[TRANSACTIONS:29]Transaction_OtherSideID:32
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_OtherSide)
									If ([TRANSACTIONS:29]Account_Code:3=DB_GetLedgerProfitACC)
										QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_TransactionID)
										ACC_ar_BalOuptutAccountBalance{$_l_Index}:=ACC_ar_BalOuptutAccountBalance{$_l_Index}-[TRANSACTIONS:29]Total:17
										ACC_ar_OutputACCprofBalance{$_l_Index}:=ACC_ar_OutputACCprofBalance{$_l_Index}-[TRANSACTIONS:29]Total:17
									Else 
										QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_TransactionID)
										ACC_ar_NotPLBalance{$_l_Index}:=ACC_ar_NotPLBalance{$_l_Index}+[TRANSACTIONS:29]Total:17
									End if 
								End if 
							End for 
							If ($_r_SubBalance#0)
								ACC_ar_BalOuptutAccountBalance{$_l_Index}:=ACC_ar_BalOuptutAccountBalance{$_l_Index}-$_r_SubBalance
								ACC_ar_OutputACCprofBalance{$_l_Index}:=ACC_ar_OutputACCprofBalance{$_l_Index}-$_r_SubBalance
							End if 
					End case 
					
				End if 
				
			End if 
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="@C")
			If (Records in selection:C76([TRANSACTIONS:29])>0)
				If (ACC_at_BalCurrencyCodes{$_l_Index}#$1)
					
					MESSAGE:C88(Char:C90(13)+"Converting "+ACC_at_BalCurrencyCodes{$_l_Index})
					
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="@C")
					ACC_LoadTransToArrays($_l_Index; $1; ->[TRANSACTIONS:29]Tax_Amount:16; "+"; $_t_YearPeriodTo)
				Else 
					If (ACC_Bo_CheckBalance) | ($_bo_BalanceCheck)
						
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="@C")
						$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
					Else 
						$_r_Balance:=0  //[ACC BALANCES]Balance
						
					End if 
				End if 
				$_l_CurrencyCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				If ($_l_CurrencyCodePosition<0)
					INSERT IN ARRAY:C227(ACC_at_BalCurrencyCodesRange; Size of array:C274(ACC_at_BalCurrencyCodesRange)+1; 1)
					ACC_at_BalCurrencyCodesRange{Size of array:C274(ACC_at_BalCurrencyCodesRange)}:=ACC_at_BalCurrencyCodes{$_l_Index}
					If (Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})<Size of array:C274(ACC_at_BalCurrencyCodesRange))
						
						INSERT IN ARRAY:C227(ACC_ar_BalCurrencyTotalAmounts{$_l_Index}; Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_at_BalCurrencyTotalsCC{$_l_Index}; Size of array:C274(ACC_at_BalCurrencyTotalsCC{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedAccTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedAccTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedACCPrfTotals{$_l_Index}; Size of array:C274(ACC_ar_BalConvertedACCPrfTotals{$_l_Index})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
						
					End if 
					$_l_CurrencyCodePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyCodes{$_l_Index})
				End if 
				ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalCurrencyTotalAmounts{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedAccTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}:=ACC_ar_BalConvertedACCPrfTotals{$_l_Index}{$_l_CurrencyCodePosition}+$_r_Balance
				
				If (ACC_at_BalAccountCodes{$_l_Index}#DB_GetLedgerProfitACC) & (ACC_at_BalAccountCodes{$_l_Index}#DB_GetLedgerBroughtforwardACC)  //56
					
					ACC_ar_BalOuptutAccountBalance{$_l_Index}:=ACC_ar_BalOuptutAccountBalance{$_l_Index}+$_r_Balance
					ACC_ar_OutputACCprofBalance{$_l_Index}:=ACC_ar_OutputACCprofBalance{$_l_Index}+$_r_Balance
				End if 
				If (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=ACC_at_BalAccountIdentity{$_l_Index})
				End if 
				
			End if 
	End case   //5
	
	If ($_bo_Ignore)
		$_l_Index:=$_l_Index+1
		$_bo_BalanceCheck:=False:C215
	End if 
	// NEXT RECORD([ACC BALANCES])
	
End for   //1

MESSAGE:C88(Char:C90(13)+"Account Balances Loaded")
ACC_CheckPLentries($_t_YearPeriodFrom)
ACC_ProfitCalculator($_t_YearPeriodFrom)


$_t_LastPeriod:=""
If (Count parameters:C259>=2)
	If ($2)
		$_t_Tabs1:=Char:C90(9)*6
		$_t_Tabs2:=Char:C90(9)*8  //column for running account total
		
		$_t_Tabs3:=Char:C90(9)*8
		$_t_Tabs4:=Char:C90(9)*10  //column for balance monthly total
		$_t_Tabs5:=Char:C90(9)*(11-6)  //1stcolumn for balance sheet accounts
		$_t_Tabs6:=Char:C90(9)*13  //column for running  balance account total
		$_t_Tabs7:=Char:C90(9)*((14-6))  //1st column for profit accounts
		$_t_Tabs8:=Char:C90(9)*16  //column for running profit account amount
		
		
		
		
		
		ARRAY TEXT:C222($_at_AccountCodesOutputIndex; Size of array:C274(ACC_at_BalAccountIdentity))
		ARRAY REAL:C219($_ar_AccountCodeOutputTotal; Size of array:C274(ACC_at_BalAccountIdentity))
		$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT"; "Save Accounts Data"; True:C214)
		
		$_t_Tabs:=Char:C90(9)*6
		SEND PACKET:C103($_ti_DocumentRef; "Account details"+Char:C90(9)+"Account Code"+Char:C90(9)+"Analysis Code"+Char:C90(9)+"Period Code"+Char:C90(9)+"Layer Code"+Char:C90(9)+"Currency Code"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "BS Account Totals"+Char:C90(9)+"Stored BS account Total £"+Char:C90(9)+"Running account Total"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "Monthly Sum BS  accounts"+Char:C90(9)+"Monthly Sum BS accounts"+Char:C90(9)+"Profit Sheet Account Total"+Char:C90(9)+"Profit account Stored account total"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "Running account total"+Char:C90(9)+"Calculated Profit Amount"+Char:C90(9)+"Stored profit Amount"+Char:C90(9)+"Running account total"+Char:C90(13))
		
		$_r_Total:=0
		$_r_Total2:=0
		
		For ($_l_Index; 1; Size of array:C274(ACC_at_BalAccountIdentity))
			$_l_CurrencyCodePosition:=Find in array:C230($_at_AccountCodesOutputIndex; ACC_at_BalAccountCodes{$_l_Index})
			If ($_l_CurrencyCodePosition<0)
				$_l_CurrencyCodePosition:=Find in array:C230($_at_AccountCodesOutputIndex; "")
				$_at_AccountCodesOutputIndex{$_l_CurrencyCodePosition}:=ACC_at_BalAccountCodes{$_l_Index}
			End if 
			
			$_t_Account:=""
			$_t_Account:=ACC_at_BalAccountIdentity{$_l_Index}+Char:C90(9)+ACC_at_BalAccountCodes{$_l_Index}+Char:C90(9)+ACC_at_BalAnalysisCodes{$_l_Index}
			$_t_Account:=$_t_Account+Char:C90(9)+ACC_at_BalPeriodCodes{$_l_Index}+Char:C90(9)+ACC_at_BalLayerCodes{$_l_Index}+Char:C90(9)+ACC_at_BalCurrencyCodes{$_l_Index}+Char:C90(9)
			ERASE WINDOW:C160
			MESSAGE:C88("Exporting Data"+ACC_at_BalAccountIdentity{$_l_Index})
			If ($_t_LastPeriod#"") & ($_t_LastPeriod#ACC_at_BalPeriodCodes{$_l_Index})
				SEND PACKET:C103($_ti_DocumentRef; "Period Totals"+Char:C90(9)+$_t_Tabs3+String:C10($_r_Total)+Char:C90(9)+String:C10($_r_Total2))
				$_r_Total:=0
				$_r_Total2:=0
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
			End if 
			$_t_LastPeriod:=ACC_at_BalPeriodCodes{$_l_Index}
			QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8=ACC_at_BalAccountIdentity{$_l_Index})
			If (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC) | (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC) | (ACC_at_BalAccountCodes{$_l_Index}=("-"+DB_GetLedgerBroughtforwardACC)) | (ACC_at_BalAccountCodes{$_l_Index}=("-"+DB_GetLedgerProfitACC))
				$_t_Space:=$_t_Tabs7
			Else 
				$_t_Space:=""
			End if 
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_at_BalAccountCodes{$_l_Index})
			If ([ACCOUNTS:32]PB:4="P")
				$_t_Space2:=$_t_Tabs5
			Else 
				$_t_Space2:=""
			End if 
			$_ar_AccountCodeOutputTotal{$_l_CurrencyCodePosition}:=$_ar_AccountCodeOutputTotal{$_l_CurrencyCodePosition}+ACC_ar_BalOuptutAccountBalance{$_l_Index}
			SEND PACKET:C103($_ti_DocumentRef; $_t_Account+$_t_Space+$_t_Space2+String:C10(ACC_ar_BalOuptutAccountBalance{$_l_Index})+Char:C90(9))
			If ($_t_Space2#"") & ($_t_Space="")
				$_r_Total2:=$_r_Total2+ACC_ar_BalOuptutAccountBalance{$_l_Index}
			Else 
				If ($_t_Space="")
					$_r_Total:=$_r_Total+ACC_ar_BalOuptutAccountBalance{$_l_Index}
				End if 
			End if 
			
			SEND PACKET:C103($_ti_DocumentRef; String:C10([ACCOUNT_BALANCES:34]Balance:3)+Char:C90(9)+String:C10($_ar_AccountCodeOutputTotal{$_l_CurrencyCodePosition})+Char:C90(13))
		End for 
		SEND PACKET:C103($_ti_DocumentRef; $_t_Tabs3+String:C10($_r_Total)+Char:C90(9)+String:C10($_r_Total2))
		$_r_Total:=0
		$_r_Total2:=0
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
		
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
End if 
CLOSE WINDOW:C154
ERR_MethodTrackerReturn("ACC_LoadToArrays"; $_t_oldMethodName)
