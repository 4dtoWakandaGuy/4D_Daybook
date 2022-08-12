//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_LoadTransToArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 11:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ACC_ad_FinancialYearFrom;0)
	//ARRAY DATE(ACC_AD_FinancialYearTo;0)
	ARRAY LONGINT:C221($_al_PeriodIDS; 0)
	//ARRAY REAL(ACC_ar_BalAccountDetailsAmount;0)
	//ARRAY REAL(ACC_ar_BalConvertedACCPrfTotals;0)
	//ARRAY REAL(ACC_ar_BalConvertedAccTotals;0)
	//ARRAY REAL(ACC_ar_BalConvertedAmounts;0)
	//ARRAY REAL(ACC_ar_BalConvertedProfitAmount;0)
	//ARRAY REAL(ACC_ar_BalCurrencyTotalAmounts;0)
	//ARRAY REAL(ACC_ar_BalOuptutAccountBalance;0)
	//ARRAY REAL(ACC_ar_OutputACCprofBalance;0)
	ARRAY TEXT:C222($_at_CurrencyRatesChecked; 0)
	//ARRAY TEXT(ACC_at_BalAccountCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyCodesRange;0)
	//ARRAY TEXT(ACC_at_BalCurrencyDetailsCode;0)
	//ARRAY TEXT(ACC_at_BalCurrencyTotalsCC;0)
	//ARRAY TEXT(ACC_at_BalPeriodCodes;0)
	C_DATE:C307($_d_FinanceYearEndDate; $_d_FromDate; $_d_SIgnificantDate)
	C_LONGINT:C283($_l_ConvertPeriodID; $_l_CVPeriodID; $_l_Element; $_l_FindPeriodIndex; $_l_FromDatePosition; $_l_Index; $_l_PeriodsIndex; $_l_PreviousYearEndPeriodID; $_l_ReportToPeriodID; $1; $CUR_l_CurrencyPeriod)
	C_LONGINT:C283(CUR_l_CurrencyPeriod)
	C_POINTER:C301($3)
	C_REAL:C285($_r_Balance; $_r_CurrentRate; $_r_NetOutput; $_r_TBalance)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_PreviousYearEndPeriodCode; $_t_TestYearStart; $_t_YearStartPeriodCode; $2; $4; $5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_LoadTransToArrays")
//ACC_LoadTransToarrays
ARRAY TEXT:C222($_at_CurrencyRatesChecked; Records in table:C83([CURRENCIES:71]))
QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$5)
$_d_FromDate:=[PERIODS:33]From_Date:3
$_l_ReportToPeriodID:=[PERIODS:33]x_ID:10
$_l_ConvertPeriodID:=[PERIODS:33]x_ID:10
$_t_YearStartPeriodCode:=ACC_GetYearStart($_d_FromDate)
$_l_ConvertPeriodID:=[PERIODS:33]x_ID:10

//anything before that period
If (True:C214)
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1<$_t_YearStartPeriodCode)
	ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
	$_t_PreviousYearEndPeriodCode:=[PERIODS:33]Period_Code:1
	$_l_PreviousYearEndPeriodID:=[PERIODS:33]x_ID:10
	//$ConvertPeriodCode:=[PERIODS]Period Code
	//$_l_ConvertPeriodID:=[PERIODS]x_ID
End if 
QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_at_BalPeriodCodes{$1})
CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
$_l_CVPeriodID:=[PERIODS:33]x_ID:10
If (Count parameters:C259>=2)
	$_l_Element:=$1
	INSERT IN ARRAY:C227(ACC_ar_BalAccountDetailsAmount{$_l_Element}; Size of array:C274(ACC_ar_BalAccountDetailsAmount{$_l_Element})+1; Records in selection:C76([TRANSACTIONS:29]))
	INSERT IN ARRAY:C227(ACC_at_BalCurrencyDetailsCode{$_l_Element}; Size of array:C274(ACC_at_BalCurrencyDetailsCode{$_l_Element})+1; Records in selection:C76([TRANSACTIONS:29]))
	INSERT IN ARRAY:C227(ACC_ar_BalConvertedAmounts{$_l_Element}; Size of array:C274(ACC_ar_BalConvertedAmounts{$_l_Element})+1; Records in selection:C76([TRANSACTIONS:29]))
	//additional line added here
	INSERT IN ARRAY:C227(ACC_ar_BalConvertedProfitAmount{$_l_Element}; Size of array:C274(ACC_ar_BalConvertedProfitAmount{$_l_Element})+1; Records in selection:C76([TRANSACTIONS:29]))
	
	$_l_Element:=0
	$_r_NetOutput:=-1
	If (Sum:C1($3->)=0)
		$_r_NetOutput:=0
	End if 
	
	For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
		$_l_Element:=$_l_Element+1
		If (Count parameters:C259=3)
			ACC_ar_BalAccountDetailsAmount{$1}{$_l_Element}:=Gen_Round((($3->)); 2; 2)
		Else 
			If ($4="-")
				ACC_ar_BalAccountDetailsAmount{$1}{$_l_Element}:=Gen_Round(((-$3->)); 2; 2)
			Else 
				ACC_ar_BalAccountDetailsAmount{$1}{$_l_Element}:=Gen_Round((($3->)); 2; 2)
				
			End if 
			
		End if 
		If (ACC_at_BalAccountCodes{$1}="003")
			//TRACE
		End if 
		
		If (ACC_at_BalCurrencyCodes{$1}#"")
			ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element}:=ACC_at_BalCurrencyCodes{$1}
		Else 
			ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element}:=<>SYS_t_BaseCurrency
		End if 
		If (ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element}#$2)
			//the amount needs to be converted
			$_r_TBalance:=0
			If ([ACCOUNTS:32]Account_Code:2#ACC_at_BalAccountCodes{$1})
				QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_at_BalAccountCodes{$1})
			End if 
			$_l_FromDatePosition:=Find in array:C230($_at_CurrencyRatesChecked; ACC_at_BalCurrencyCodes{$1})
			If ($_l_FromDatePosition<0)
				$_l_FromDatePosition:=Find in array:C230($_at_CurrencyRatesChecked; "")
				$_at_CurrencyRatesChecked{$_l_FromDatePosition}:=ACC_at_BalCurrencyCodes{$1}
				CUR_CheckRate(ACC_at_BalCurrencyCodes{$1}; $2)
			End if 
			
			If ([ACCOUNTS:32]Multicurrency_Valuation:10#1)
				
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element}; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
				If (Records in selection:C76([CURRENCY_RATES:72])=0)
					//no rate for the period `try back wards
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1<=ACC_at_BalPeriodCodes{$1})
					ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; <)
					SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS)
					For ($_l_PeriodsIndex; 1; Size of array:C274($_al_PeriodIDS))
						$CUR_l_CurrencyPeriod:=$_al_PeriodIDS{$_l_PeriodsIndex}
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element}; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
						If (Records in selection:C76([CURRENCY_RATES:72])>0)
							$_l_PeriodsIndex:=Size of array:C274($_al_PeriodIDS)+1
						End if 
					End for 
					If (Records in selection:C76([CURRENCY_RATES:72])=0)
						//still nothing!!
						QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1>=ACC_at_BalPeriodCodes{$1})
						ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
						SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS)
						For ($_l_PeriodsIndex; 1; Size of array:C274($_al_PeriodIDS))
							$CUR_l_CurrencyPeriod:=$_al_PeriodIDS{$_l_PeriodsIndex}
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element}; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
							If (Records in selection:C76([CURRENCY_RATES:72])>0)
								$_l_PeriodsIndex:=Size of array:C274($_al_PeriodIDS)+1
							End if 
						End for 
					End if 
				End if 
				
			Else 
				//the current rate
				If (Count parameters:C259<5)
					$_d_SIgnificantDate:=Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*)))
					CUR_l_CurrencyPeriod:=Check_Period($_d_SIgnificantDate)
					//now find the rate for this period
					
				Else 
					//NOT THE CURRENT RATE-contextual current rate!!
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$5)
					If ($_t_YearStartPeriodCode>[TRANSACTIONS:29]Period_Code:12)
						QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[TRANSACTIONS:29]Period_Code:12)
						$_t_TestYearStart:=ACC_GetYearStart([PERIODS:33]From_Date:3)
						If ($_t_TestYearStart="")
							Gen_Alert("Sorry you must set this up to continue")
							Repeat 
								$_t_TestYearStart:=ACC_GetYearStart([PERIODS:33]From_Date:3)
							Until ($_t_TestYearStart#"")
						End if 
						ACC_LoadFinancialYears(True:C214)
						$_d_FinanceYearEndDate:=!00-00-00!
						$_l_FromDatePosition:=Find in array:C230(ACC_ad_FinancialYearFrom; [PERIODS:33]From_Date:3)
						For ($_l_FindPeriodIndex; $_l_FromDatePosition; Size of array:C274(ACC_ad_FinancialYearFrom))
							If (ACC_ad_FinancialYearFrom{$_l_FindPeriodIndex}<=[PERIODS:33]From_Date:3) & (ACC_AD_FinancialYearTo{$_l_FindPeriodIndex}>=[PERIODS:33]From_Date:3)
								$_d_FinanceYearEndDate:=ACC_AD_FinancialYearTo{$_l_FindPeriodIndex}
								$_l_FindPeriodIndex:=Size of array:C274(ACC_ad_FinancialYearFrom)
							End if 
							
						End for 
						QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$_d_FinanceYearEndDate; *)
						QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=$_d_FinanceYearEndDate)
					End if 
					
					CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
					$_d_SIgnificantDate:=[PERIODS:33]To_Date:4
				End if 
				
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element}; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
				QUERY SELECTION:C341([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4<=$_d_SIgnificantDate)
				If (Records in selection:C76([CURRENCY_RATES:72])=0)
					//no rate for the period `try back wards
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$_d_SIgnificantDate)
					ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; <)
					SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS)
					For ($_l_PeriodsIndex; 1; Size of array:C274($_al_PeriodIDS))
						$CUR_l_CurrencyPeriod:=$_al_PeriodIDS{$_l_PeriodsIndex}
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element}; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
						If (Records in selection:C76([CURRENCY_RATES:72])>0)
							$_l_PeriodsIndex:=Size of array:C274($_al_PeriodIDS)+1
						End if 
					End for 
					If (Records in selection:C76([CURRENCY_RATES:72])=0)
						//still nothing!!
						QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=$_d_SIgnificantDate)
						ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
						SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS)
						For ($_l_PeriodsIndex; 1; Size of array:C274($_al_PeriodIDS))
							$CUR_l_CurrencyPeriod:=$_al_PeriodIDS{$_l_PeriodsIndex}
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element}; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
							If (Records in selection:C76([CURRENCY_RATES:72])>0)
								$_l_PeriodsIndex:=Size of array:C274($_al_PeriodIDS)+1
							End if 
						End for 
					End if 
				End if 
				
			End if 
			
			ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
			//the first record will be the correct one
			$_r_CurrentRate:=[CURRENCY_RATES:72]Rate:3
			If (Records in selection:C76([CURRENCY_RATES:72])>0)
				ACC_ar_BalConvertedAmounts{$1}{$_l_Element}:=Gen_Round((((ACC_ar_BalAccountDetailsAmount{$1}{$_l_Element})*$_r_CurrentRate)); 2; 2)
				//[CURRENCY RATES]Date
				//transaction date
				
				ACC_ar_BalConvertedProfitAmount{$1}{$_l_Element}:=ACC_ConvertForProfit($5; ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element}; $2; ACC_at_BalPeriodCodes{$1}; ACC_ar_BalAccountDetailsAmount{$1}{$_l_Element}; ACC_ar_BalConvertedAmounts{$1}{$_l_Element}; ACC_at_BalAccountCodes{$1}; $_l_PreviousYearEndPeriodID; $_t_YearStartPeriodCode; $_d_FromDate; [TRANSACTIONS:29]Trans_Date:5)
				
				
			End if 
			
			
		Else 
			ACC_ar_BalConvertedAmounts{$1}{$_l_Element}:=ACC_ar_BalAccountDetailsAmount{$1}{$_l_Element}
			ACC_ar_BalConvertedProfitAmount{$1}{$_l_Element}:=ACC_ar_BalAccountDetailsAmount{$1}{$_l_Element}
		End if 
		$_l_FromDatePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element})
		If ($_l_FromDatePosition<0)
			INSERT IN ARRAY:C227(ACC_at_BalCurrencyCodesRange; Size of array:C274(ACC_at_BalCurrencyCodesRange)+1; 1)
			ACC_at_BalCurrencyCodesRange{Size of array:C274(ACC_at_BalCurrencyCodesRange)}:=ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element}
			If (Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$1})<Size of array:C274(ACC_at_BalCurrencyCodesRange))
				
				INSERT IN ARRAY:C227(ACC_ar_BalCurrencyTotalAmounts{$1}; Size of array:C274(ACC_ar_BalCurrencyTotalAmounts{$1})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
				INSERT IN ARRAY:C227(ACC_at_BalCurrencyTotalsCC{$1}; Size of array:C274(ACC_at_BalCurrencyTotalsCC{$1})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
				INSERT IN ARRAY:C227(ACC_ar_BalConvertedAccTotals{$1}; Size of array:C274(ACC_ar_BalConvertedAccTotals{$1})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
				INSERT IN ARRAY:C227(ACC_ar_BalConvertedACCPrfTotals{$1}; Size of array:C274(ACC_ar_BalConvertedACCPrfTotals{$1})+1; Size of array:C274(ACC_at_BalCurrencyCodesRange))
			End if 
			$_l_FromDatePosition:=Find in array:C230(ACC_at_BalCurrencyCodesRange; ACC_at_BalCurrencyDetailsCode{$1}{$_l_Element})
		End if 
		ACC_ar_BalCurrencyTotalAmounts{$1}{$_l_FromDatePosition}:=ACC_ar_BalCurrencyTotalAmounts{$1}{$_l_FromDatePosition}+ACC_ar_BalAccountDetailsAmount{$1}{$_l_Element}
		ACC_ar_BalConvertedAccTotals{$1}{$_l_FromDatePosition}:=ACC_ar_BalConvertedAccTotals{$1}{$_l_FromDatePosition}+ACC_ar_BalConvertedAmounts{$1}{$_l_Element}
		ACC_ar_BalConvertedACCPrfTotals{$1}{$_l_FromDatePosition}:=ACC_ar_BalConvertedACCPrfTotals{$1}{$_l_FromDatePosition}+ACC_ar_BalConvertedProfitAmount{$1}{$_l_Element}
		If (ACC_at_BalAccountCodes{$1}#DB_GetLedgerProfitACC) & (ACC_at_BalAccountCodes{$1}#DB_GetLedgerBroughtforwardACC)
			ACC_ar_BalOuptutAccountBalance{$1}:=ACC_ar_BalOuptutAccountBalance{$1}+ACC_ar_BalConvertedAmounts{$1}{$_l_Element}
			ACC_ar_OutputACCprofBalance{$1}:=ACC_ar_OutputACCprofBalance{$1}+ACC_ar_BalConvertedProfitAmount{$1}{$_l_Element}
			If (False:C215)
				ACC_ar_BalOuptutAccountBalance{$1}:=ACC_ar_BalOuptutAccountBalance{$1}+ACC_ar_BalConvertedAccTotals{$1}{$_l_FromDatePosition}
			End if 
			
		End if 
		NEXT RECORD:C51([TRANSACTIONS:29])
	End for 
	If ($_r_NetOutput=0)
		ACC_ar_BalOuptutAccountBalance{$1}:=0
	End if 
	
End if 
ERR_MethodTrackerReturn("ACC_LoadTransToArrays"; $_t_oldMethodName)
