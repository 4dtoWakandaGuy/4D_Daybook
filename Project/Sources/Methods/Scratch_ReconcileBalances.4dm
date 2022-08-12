//%attributes = {}

If (False:C215)
	//Database Method Name:      Scratch_ReconcileBalances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  11/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(False0)
	ARRAY BOOLEAN:C223($_abo_Reconcilled; 0)
	ARRAY DATE:C224($_ad_ConvertDate; 0)
	ARRAY DATE:C224($_ad_PeriodRateDateFrom; 0; 0)
	ARRAY DATE:C224($_ad_PeriodRateDateTo; 0; 0)
	ARRAY DATE:C224($_ad_TransactionsDate; 0)
	ARRAY DATE:C224($_ad_TransDate; 0)
	ARRAY LONGINT:C221($_al_accMultiCurValuation; 0)
	ARRAY REAL:C219($_ar_AccBalance; 0)
	ARRAY REAL:C219($_ar_accountRecTotal; 0)
	ARRAY REAL:C219($_ar_accountTotal; 0)
	ARRAY REAL:C219($_ar_accountUnrecTotal; 0)
	ARRAY REAL:C219($_ar_ActAmount; 0)
	ARRAY REAL:C219($_ar_actTaxAmount; 0)
	ARRAY REAL:C219($_ar_ConvertRate; 0)
	ARRAY REAL:C219($_ar_PeriodConvertRate; 0; 0)
	ARRAY REAL:C219($_ar_PeriodRates; 0)
	ARRAY REAL:C219($_ar_TaxAmount; 0)
	ARRAY REAL:C219($_ar_TransactionAmount; 0)
	ARRAY TEXT:C222($_at_AcbAccountCodes; 0)
	ARRAY TEXT:C222($_at_acbAnalysisCode; 0)
	ARRAY TEXT:C222($_at_acbLayerCode; 0)
	ARRAY TEXT:C222($_at_AccCurrencyCodes; 0)
	ARRAY TEXT:C222($_at_AccountCodeRange; 0)
	ARRAY TEXT:C222($_at_AccountIDENT; 0)
	ARRAY TEXT:C222($_at_AccountNameRange; 0)
	ARRAY TEXT:C222($_at_ActAccountCodes; 0)
	ARRAY TEXT:C222($_at_ActAnalysisCode; 0)
	ARRAY TEXT:C222($_at_actCurrencyCode; 0)
	ARRAY TEXT:C222($_at_actCurrencyCodes; 0)
	ARRAY TEXT:C222($_at_actLayerCode; 0)
	ARRAY TEXT:C222($_at_ActPeriodCodes; 0)
	ARRAY TEXT:C222($_at_ACtSort; 0)
	ARRAY TEXT:C222($_at_aCurrencyRatesChecked; 0)
	ARRAY TEXT:C222($_at_analysesRange; 0)
	ARRAY TEXT:C222($_at_CurrencyCodes; 0)
	ARRAY TEXT:C222($_at_layersRange; 0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	ARRAY TEXT:C222($_at_PeriodCUrrency; 0)
	C_BOOLEAN:C305($_bo_CalcLast; $_bo_Variants)
	C_DATE:C307($_d_EarliestDate; $_d_firstDayofMomth; $_d_LastToDate; $_d_LatestDate; $_d_PeriodFromDate; $_d_PeriodToDate; $_d_TransactionDate)
	C_LONGINT:C283($_l_accRef; $_l_AccTotalRef; $_l_BuildBalances; $_l_CarryOn; $_l_CheckVariance; $_l_CurRateReference; $_l_CUrrencyPeriod; $_l_Dayof; $_l_Element; $_l_Empty; $_l_ExportSUms)
	C_LONGINT:C283($_l_FilltoDate; $_l_FindVariant; $_l_index; $_l_Index2; $_l_LastEndsAt; $_l_NextLastEndssat; $_l_NextLastStartsat; $_l_PeriodRate; $_l_PeriodRateCurrent; $_l_PreviousPeriodRate; $_l_Sizeofarray)
	C_LONGINT:C283($_l_VariantNumber; $_l_VariantNumber2; DB_l_CurrentDisplayedForm; vNo; vTr)
	C_REAL:C285($_r_AccountBalance; $_r_Balance; $_r_ConvertedBalance; $_r_Rate; $_r_ReconcilledBalance; $_r_ThisAmount; $_r_TotalBalance; $_r_UnReconcilledBalance; vBalance; vSubtotal; vTotal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AccountsTitle; $_t_Currency; $_t_LastAccountCOde; $_t_LastAccountIdent; $_t_oldMethodName; $_t_PreviousPeriodCode; $_t_UniqueID; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; WIN_t_CurrentOutputform)
	C_TIME:C306($_ti_DocReport)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Scratch_ReconcileBalances")
//TRACE
If (False0
	$_ti_DocReport:=Create document:C266(""; "TEXT")
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
	//QUERY SELECTION([TRANSACTIONS];[TRANSACTIONS]Reconciled=False)
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
	
	If (Records in selection:C76([ACCOUNTS:32])=1)
		SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; $_at_AccountCodeRange; [ACCOUNTS:32]Account_Name:3; $_at_AccountNameRange; [ACCOUNTS:32]Multicurrency_Valuation:10; $_al_accMultiCurValuation)
		
		$_t_AccountsTitle:="Bank Reconciliation: "+[ACCOUNTS:32]Account_Name:3
	Else 
		SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; $_at_AccountCodeRange; [ACCOUNTS:32]Account_Name:3; $_at_AccountNameRange; [ACCOUNTS:32]Multicurrency_Valuation:10; $_al_accMultiCurValuation)
		SORT ARRAY:C229($_at_AccountCodeRange; $_at_AccountNameRange)
		$_t_AccountsTitle:="Bank Reconciliation: "+$_at_AccountNameRange{1}+" - "+$_at_AccountNameRange{Size of array:C274($_at_AccountNameRange)}
	End if 
	
	
	$_r_UnReconcilledBalance:=0
	$_r_TotalBalance:=0
	SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; $_at_ActAccountCodes; [TRANSACTIONS:29]Currency_Code:22; $_at_actCurrencyCodes; [TRANSACTIONS:29]Period_Code:12; $_at_ActPeriodCodes; [TRANSACTIONS:29]Amount:6; $_ar_ActAmount; [TRANSACTIONS:29]Analysis_Code:2; $_at_ActAnalysisCode; [TRANSACTIONS:29]Layer_Code:23; $_at_actLayerCode; [TRANSACTIONS:29]Tax_Amount:16; $_ar_actTaxAmount; [TRANSACTIONS:29]Trans_Date:5; $_ad_TransactionsDate; [TRANSACTIONS:29]Reconciled:14; $_abo_Reconcilled; [TRANSACTIONS:29]Unique_StringIdent:28; $_at_ACtSort)
	// //
	
	SORT ARRAY:C229($_at_ACtSort; $_ad_TransactionsDate; $_at_ActAccountCodes; $_at_actCurrencyCodes; $_at_ActPeriodCodes; $_ar_ActAmount; $_at_ActAnalysisCode; $_at_actLayerCode; $_ar_actTaxAmount; $_abo_Reconcilled)
	
	//For ($_l_BuildBalances;1;Size of array($_at_actCurrencyCodes))
	If (False:C215)
		SEND PACKET:C103($_ti_DocReport; "Unreconcilled Transactions"+Char:C90(13))
		SEND PACKET:C103($_ti_DocReport; "Account code"+Char:C90(9)+"Date"+Char:C90(9)+"Currency Code"+Char:C90(9)+"Amount"+Char:C90(9)+"Conversion Rate"+Char:C90(9)+"Converted Amount"+Char:C90(13))
		
		//ACC_ConvertValues ($_t_Currency;->$_at_actCurrencyCodes;->$_at_ActAccountCodes;->$_ar_ActAmount
		$_t_LastAccountIdent:=""
		
		For ($_l_BuildBalances; 1; Size of array:C274($_at_actCurrencyCodes))
			SEND PACKET:C103($_ti_DocReport; $_at_ActAccountCodes{$_l_BuildBalances}+Char:C90(9))
			$_t_UniqueID:=ACC_Buildunique($_at_ActAccountCodes{$_l_BuildBalances}; $_at_ActAnalysisCode{$_l_BuildBalances}; $_at_ActPeriodCodes{$_l_BuildBalances}; $_at_actLayerCode{$_l_BuildBalances}; $_at_actCurrencyCodes{$_l_BuildBalances})
			$_l_AccTotalRef:=Find in array:C230($_at_AccountIDENT; $_t_UniqueID)
			If ($_l_AccTotalRef<0)
				APPEND TO ARRAY:C911($_at_AccountIDENT; $_t_UniqueID)
				APPEND TO ARRAY:C911($_ar_accountTotal; 0)
				APPEND TO ARRAY:C911($_ar_accountRecTotal; 0)
				APPEND TO ARRAY:C911($_ar_accountUnrecTotal; 0)
				$_l_AccTotalRef:=Size of array:C274($_ar_accountUnrecTotal)
			End if 
			If ($_t_LastAccountIdent=$_t_UniqueID)
				$_bo_CalcLast:=False:C215
				$_l_LastEndsAt:=$_l_BuildBalances
			Else 
				$_bo_CalcLast:=True:C214
				$_l_NextLastStartsat:=$_l_BuildBalances
				$_l_NextLastEndssat:=$_l_BuildBalances
			End if 
			If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_t_Currency)
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
				SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_ActAmount{$_l_BuildBalances})+Char:C90(9)+Char:C90(9)+String:C10($_ar_ActAmount{$_l_BuildBalances})+Char:C90(13))
			Else 
				Case of 
					: ($_at_ActAccountCodes{$_l_BuildBalances}=DB_GetLedgerVatInputACC)
						$_r_ThisAmount:=$_ar_actTaxAmount{$_l_BuildBalances}
					Else 
						$_r_ThisAmount:=($_ar_ActAmount{$_l_BuildBalances})
				End case 
				If ($_r_ThisAmount#0)
					$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; $_at_actCurrencyCodes{$_l_BuildBalances})
					If ($_l_CurRateReference<0)
						$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; "")
						$_at_aCurrencyRatesChecked{$_l_CurRateReference}:=$_at_actCurrencyCodes{$_l_BuildBalances}
						CUR_CheckRate($_at_actCurrencyCodes{$_l_BuildBalances}; $_t_Currency)
					End if 
					
					$_l_accRef:=Find in array:C230($_at_AccountCodeRange; $_at_ActAccountCodes{$_l_BuildBalances})
					If ($_al_accMultiCurValuation{$_l_accRef}#1)
						QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
						$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
						//now find the rate for this period
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
						
						Case of 
							: (Records in selection:C76([CURRENCY_RATES:72])>1)
								SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_ConvertDate; [CURRENCY_RATES:72]Rate:3; $_ar_ConvertRate)
								$_r_Rate:=$_ar_ConvertRate{1}
								$_bo_Variants:=False:C215
								For ($_l_CheckVariance; 1; Size of array:C274($_ar_ConvertRate))
									If ($_ar_ConvertRate{$_l_CheckVariance}#$_r_Rate)
										$_bo_Variants:=True:C214
									End if 
								End for 
								If ($_bo_Variants)
									//ACC_GetTransactions ($_at_AcbAccountCodes{$_l_BuildBalances};$_at_PeriodCodes{$_l_BuildBalances};$_at_AccCurrencyCodes{$_l_BuildBalances};$_at_acbAnalysisCode{$_l_BuildBalances};$_at_acbLayerCode{$_l_BuildBalances})
									ARRAY DATE:C224($_ad_TransDate; 1)
									ARRAY REAL:C219($_ar_TransactionAmount; 1)
									ARRAY REAL:C219($_ar_TaxAmount; 1)
									$_ad_TransDate{1}:=$_ad_TransactionsDate{$_l_BuildBalances}
									$_ar_TransactionAmount{1}:=$_ar_ActAmount{$_l_BuildBalances}
									$_ar_TaxAmount{1}:=$_ar_actTaxAmount{$_l_BuildBalances}
									//SELECTION TO ARRAY([TRANSACTIONS]Trans_Date;$_ad_TransDate;[TRANSACTIONS]Amount;$_ar_TransactionAmount;[TRANSACTIONS]Tax_Amount;$_ar_TaxAmount)
									$_r_Balance:=0
									If (Size of array:C274($_ad_TransDate)>0)
										
										For ($_l_index; 1; Size of array:C274($_ad_TransDate))
											$_d_TransactionDate:=$_ad_TransDate{$_l_index}
											$_l_Element:=0
											For ($_l_Index2; 1; Size of array:C274($_ad_ConvertDate))
												If ($_ad_ConvertDate{$_l_Index2}<=$_d_TransactionDate)
													$_l_Element:=$_l_Index2
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
											If ($_at_ActAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
												$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
												End if 
											Else 
												$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
												End if 
												
											End if 
											
											$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
											SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10($_r_Balance)+Char:C90(13))
											
										End for 
										$_r_TotalBalance:=$_r_TotalBalance+($_r_Balance)
									Else 
										//no transactions
										//$_r_TotalBalance:=0
									End if 
								Else 
									//although there are multiple rate record the rate is the same on them
									$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
									$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
									If ($_abo_Reconcilled{$_l_BuildBalances})
										$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
									Else 
										$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
									End if 
									SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
									
									
								End if 
								
							: (Records in selection:C76([CURRENCY_RATES:72])=1)
								$_r_Rate:=[CURRENCY_RATES:72]Rate:3
								$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
								$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								If ($_abo_Reconcilled{$_l_BuildBalances})
									$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								Else 
									$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								End if 
								SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
								
							Else 
								//no rates!!!!!!
								//    TRACE
								//use the last rate before that
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
								$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
								QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
								For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
									$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
									//now find the rate for this period
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
									If (Records in selection:C76([CURRENCY_RATES:72])>0)
										$_l_index:=Records in selection:C76([PERIODS:33])+1
									End if 
									NEXT RECORD:C51([PERIODS:33])
								End for 
								Case of 
									: (Records in selection:C76([CURRENCY_RATES:72])>1)
										SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_ConvertDate; [CURRENCY_RATES:72]Rate:3; $_ar_ConvertRate)
										$_r_Rate:=$_ar_ConvertRate{1}
										$_bo_Variants:=False:C215
										For ($_l_CheckVariance; 1; Size of array:C274($_ar_ConvertRate))
											If ($_ar_ConvertRate{$_l_CheckVariance}#$_r_Rate)
												$_bo_Variants:=True:C214
											End if 
										End for 
										If ($_bo_Variants)
											
											//ACC_GetTransactions ($_at_AcbAccountCodes{$_l_BuildBalances};$_at_PeriodCodes{$_l_BuildBalances};$_at_AccCurrencyCodes{$_l_BuildBalances};$_at_acbAnalysisCode{$_l_BuildBalances};$_at_acbLayerCode{$_l_BuildBalances})
											ARRAY DATE:C224($_ad_TransDate; 1)
											ARRAY REAL:C219($_ar_TransactionAmount; 1)
											ARRAY REAL:C219($_ar_TaxAmount; 1)
											$_ad_TransDate{1}:=$_ad_TransactionsDate{$_l_BuildBalances}
											$_ar_TransactionAmount{1}:=$_ar_ActAmount{$_l_BuildBalances}
											$_ar_TaxAmount{1}:=$_ar_actTaxAmount{$_l_BuildBalances}
											
											//SELECTION TO ARRAY([TRANSACTIONS]Trans_Date;$_ad_TransDate;[TRANSACTIONS]Amount;$_ar_TransactionAmount;[TRANSACTIONS]Tax_Amount;$_ar_TaxAmount)
											$_r_Balance:=0
											If (Size of array:C274($_ad_TransDate)>0)
												//FIRST RECORD([TRANSACTIONS])
												For ($_l_index; 1; Size of array:C274($_ad_TransDate))
													$_d_TransactionDate:=$_ad_TransDate{$_l_index}
													$_l_Element:=0
													For ($_l_Index2; 1; Size of array:C274($_ad_ConvertDate))
														If ($_ad_ConvertDate{$_l_Index2}<=$_d_TransactionDate)
															$_l_Element:=$_l_Index2
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
													If ($_at_ActAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
														$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
														$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
														If ($_abo_Reconcilled{$_l_BuildBalances})
															$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
														Else 
															$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
														End if 
														
													Else 
														$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
														$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
														If ($_abo_Reconcilled{$_l_BuildBalances})
															$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
														Else 
															$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
														End if 
														
													End if 
													
													$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
													//NEXT RECORD([TRANSACTIONS])
												End for 
												$_r_TotalBalance:=$_r_TotalBalance+($_r_Balance)
												SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10($_r_TotalBalance)+Char:C90(13))
												
											Else 
												//no transactions
												//  $_r_TotalBalance:=0
											End if 
											
										Else 
											$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
											$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
											If ($_abo_Reconcilled{$_l_BuildBalances})
												$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
											Else 
												$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
											End if 
											SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
											
										End if 
										
									: (Records in selection:C76([CURRENCY_RATES:72])=1)
										$_r_Rate:=[CURRENCY_RATES:72]Rate:3
										$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*$_r_Rate)
										$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										If ($_abo_Reconcilled{$_l_BuildBalances})
											$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										Else 
											$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										End if 
										
										SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
										
									Else 
										//no rates!!!!!!
										//    TRACE
										//use the last rate before that
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
										$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
										QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
										ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
										For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
											$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
											//now find the rate for this period
											QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
											
											If (Records in selection:C76([CURRENCY_RATES:72])>0)
												$_l_index:=Records in selection:C76([PERIODS:33])+1
											End if 
											NEXT RECORD:C51([PERIODS:33])
										End for 
										Case of 
											: (Records in selection:C76([CURRENCY_RATES:72])>1)
												SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_ConvertDate; [CURRENCY_RATES:72]Rate:3; $_ar_ConvertRate)
												$_r_Rate:=$_ar_ConvertRate{1}
												$_bo_Variants:=False:C215
												For ($_l_CheckVariance; 1; Size of array:C274($_ar_ConvertRate))
													If ($_ar_ConvertRate{$_l_CheckVariance}#$_r_Rate)
														$_bo_Variants:=True:C214
													End if 
												End for 
												If ($_bo_Variants)
													// ACC_GetTransactions (HELLO)
													//ACC_GetTransactions ($_at_AcbAccountCodes{$_l_BuildBalances};$_at_PeriodCodes{$_l_BuildBalances};$_at_AccCurrencyCodes{$_l_BuildBalances};$_at_acbAnalysisCode{$_l_BuildBalances};$_at_acbLayerCode{$_l_BuildBalances})
													
													//SELECTION TO ARRAY([TRANSACTIONS]Trans_Date;$_ad_TransDate;[TRANSACTIONS]Amount;$_ar_TransactionAmount;[TRANSACTIONS]Tax_Amount;$_ar_TaxAmount)
													
													
													ARRAY DATE:C224($_ad_TransDate; 1)
													ARRAY REAL:C219($_ar_TransactionAmount; 1)
													ARRAY REAL:C219($_ar_TaxAmount; 1)
													$_ad_TransDate{1}:=$_ad_TransactionsDate{$_l_BuildBalances}
													$_ar_TransactionAmount{1}:=$_ar_ActAmount{$_l_BuildBalances}
													$_ar_TaxAmount{1}:=$_ar_actTaxAmount{$_l_BuildBalances}
													
													//SELECTION TO ARRAY([TRANSACTIONS]Trans_Date;$_ad_TransDate;[TRANSACTIONS]Amount;$_ar_TransactionAmount;[TRANSACTIONS]Tax_Amount;$_ar_TaxAmount)
													$_r_Balance:=0
													If (Size of array:C274($_ad_TransDate)>0)
														//FIRST RECORD([TRANSACTIONS])
														For ($_l_index; 1; Size of array:C274($_ad_TransDate))
															$_d_TransactionDate:=$_ad_TransDate{$_l_index}
															$_l_Element:=0
															For ($_l_Index2; 1; Size of array:C274($_ad_ConvertDate))
																If ($_ad_ConvertDate{$_l_Index2}<=$_d_TransactionDate)
																	$_l_Element:=$_l_Index2
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
															If ($_at_ActAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
																$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
																$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
																If ($_abo_Reconcilled{$_l_BuildBalances})
																	$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
																Else 
																	$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
																End if 
															Else 
																$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
																$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
																If ($_abo_Reconcilled{$_l_BuildBalances})
																	$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
																Else 
																	$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
																End if 
															End if 
															
															$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
															//NEXT RECORD([TRANSACTIONS])
														End for 
														$_r_TotalBalance:=$_r_TotalBalance+($_r_Balance)
														SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10($_r_TotalBalance)+Char:C90(13))
														
													Else 
														//no transactions
														//  $_r_TotalBalance:=0
													End if 
													
												Else 
													$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
													If ($_at_ActAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
														$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
														$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
														If ($_abo_Reconcilled{$_l_BuildBalances})
															$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
														Else 
															$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
														End if 
														
													Else 
														$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
														$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
														If ($_abo_Reconcilled{$_l_BuildBalances})
															$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
														Else 
															$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+$_r_ConvertedBalance
														End if 
														
													End if 
													SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
													
												End if 
											: (Records in selection:C76([CURRENCY_RATES:72])=1)
												$_r_Rate:=[CURRENCY_RATES:72]Rate:3
												$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												End if 
												SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
												
											Else 
												
												$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*1))
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*1)
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*1)
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*1)
												End if 
												SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10(1)+Char:C90(9)+String:C10(($_r_ThisAmount*1))+Char:C90(9)+"No Conversion Rate"+Char:C90(13))
												
										End case 
								End case 
								
						End case 
						
						
					Else 
						//value at current rate
						$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
						//now find the rate for this period
						If ($_l_CurrencyPeriod=0)
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
								$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24($_d_LatestDate); Year of:C25($_d_LatestDate)))
							Until ($_l_CurrencyPeriod>0) | ($_d_LatestDate<$_d_EarliestDate)
						End if 
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
						
						Case of 
							: (Records in selection:C76([CURRENCY_RATES:72])>1)
								ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
								FIRST RECORD:C50([CURRENCY_RATES:72])
								$_r_Rate:=[CURRENCY_RATES:72]Rate:3
								$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*$_r_Rate)
								$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								If ($_abo_Reconcilled{$_l_BuildBalances})
									$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								Else 
									$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								End if 
								
								SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
								
							: (Records in selection:C76([CURRENCY_RATES:72])=1)
								$_r_Rate:=[CURRENCY_RATES:72]Rate:3
								$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*$_r_Rate)
								$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								If ($_abo_Reconcilled{$_l_BuildBalances})
									$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								Else 
									$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
								End if 
								
								SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
								
							Else 
								$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
								$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
								QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
								For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
									$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
									
									
									//now find the rate for this period
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
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
										$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*$_r_Rate)
										$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										If ($_abo_Reconcilled{$_l_BuildBalances})
											$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										Else 
											$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										End if 
										
										SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
										
									: (Records in selection:C76([CURRENCY_RATES:72])=1)
										$_r_Rate:=[CURRENCY_RATES:72]Rate:3
										$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*$_r_Rate)
										$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										If ($_abo_Reconcilled{$_l_BuildBalances})
											$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										Else 
											$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
										End if 
										SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
										
									Else 
										$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
										$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
										QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
										ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
										For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
											$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
											
											
											//now find the rate for this period
											QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
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
												$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*$_r_Rate))
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												End if 
												SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
												
											: (Records in selection:C76([CURRENCY_RATES:72])=1)
												$_r_Rate:=[CURRENCY_RATES:72]Rate:3
												$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*$_r_Rate)
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												End if 
												SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
												
											Else 
												//TRACE
												$_r_TotalBalance:=$_r_TotalBalance+($_r_ThisAmount*1)
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*1)
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*1)
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*1)
												End if 
												SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10(1)+Char:C90(9)+String:C10(($_r_ThisAmount*1))+Char:C90(9)+"No Conversion Rate"+Char:C90(13))
												
												
												
										End case 
										
										
								End case 
								
						End case 
						
						
						
					End if 
					
					
				End if 
			End if 
		End for 
		$_r_UnReconcilledBalance:=$_r_TotalBalance
		SEND PACKET:C103($_ti_DocReport; "Account Details"+Char:C90(9)+"Total Value of transactions"+Char:C90(9)+"Reconciled Amount"+Char:C90(9)+"Unreconciled amount"+Char:C90(13))
		
		For ($_l_ExportSUms; 1; Size of array:C274($_at_AccountIDENT))
			SEND PACKET:C103($_ti_DocReport; $_at_AccountIDENT{$_l_ExportSUms}+Char:C90(9)+String:C10($_ar_accountTotal{$_l_ExportSUms})+Char:C90(9)+String:C10($_ar_accountRecTotal{$_l_ExportSUms})+Char:C90(9)+String:C10($_ar_accountUnrecTotal{$_l_ExportSUms})+Char:C90(13))
		End for 
	End if 
	
	ARRAY TEXT:C222($_at_AccountIDENT; 0)
	ARRAY REAL:C219($_ar_accountTotal; 0)
	ARRAY REAL:C219($_ar_accountRecTotal; 0)
	ARRAY REAL:C219($_ar_accountUnrecTotal; 0)
	
	
	QUERY WITH ARRAY:C644([ACCOUNT_BALANCES:34]Account_Code:2; $_at_AccountCodeRange)
	QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Analysis_Code:1; $_at_analysesRange)
	QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Layer_Code:5; $_at_layersRange)
	QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Currency_Code:6; $_at_CurrencyCodes)
	//We want the balances of these accounts// previously the old system assumed these balances were all in the same currency and thats not true
	$_r_AccountBalance:=0
	$_r_TotalBalance:=0
	
	SELECTION TO ARRAY:C260([ACCOUNT_BALANCES:34]Account_Code:2; $_at_AcbAccountCodes; [ACCOUNT_BALANCES:34]Currency_Code:6; $_at_AccCurrencyCodes; [ACCOUNT_BALANCES:34]Period_Code:4; $_at_PeriodCodes; [ACCOUNT_BALANCES:34]Balance:3; $_ar_AccBalance; [ACCOUNT_BALANCES:34]Analysis_Code:1; $_at_acbAnalysisCode; [ACCOUNT_BALANCES:34]Layer_Code:5; $_at_acbLayerCode)
	//ACC_ConvertValues ($_t_Currency;->$_at_AccCurrencyCodes;->$_at_AcbAccountCodes;->$_ar_AccBalance
	//we now need to get the value of reconcilled transactions.....
	//TRACE
	If (False:C215)
		QUERY WITH ARRAY:C644([TRANSACTIONS:29]Account_Code:3; $_at_AccountCodeRange)
		QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Currency_Code:22; $_at_CurrencyCodes)
		QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Analysis_Code:2; $_at_analysesRange)
		QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Layer_Code:23; $_at_layersRange)
		//QUERY SELECTION([TRANSACTIONS];[TRANSACTIONS]Reconciled=True)
		$_r_ReconcilledBalance:=0
		$_r_TotalBalance:=0
		SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; $_at_ActAccountCodes; [TRANSACTIONS:29]Currency_Code:22; $_at_actCurrencyCodes; [TRANSACTIONS:29]Period_Code:12; $_at_ActPeriodCodes; [TRANSACTIONS:29]Amount:6; $_ar_ActAmount; [TRANSACTIONS:29]Analysis_Code:2; $_at_ActAnalysisCode; [TRANSACTIONS:29]Layer_Code:23; $_at_actLayerCode; [TRANSACTIONS:29]Tax_Amount:16; $_ar_actTaxAmount; [TRANSACTIONS:29]Trans_Date:5; $_ad_TransactionsDate; [TRANSACTIONS:29]Reconciled:14; $_abo_Reconcilled; [TRANSACTIONS:29]Unique_StringIdent:28; $_at_ACtSort)
		// //
		$_l_Empty:=Find in array:C230($_at_ACtSort; "")
		If ($_l_Empty>0)
			Repeat 
				$_at_ACtSort{$_l_Empty}:=ACC_Buildunique($_at_ActAccountCodes{$_l_Empty}; $_at_ActAnalysisCode{$_l_Empty}; $_at_ActPeriodCodes{$_l_Empty}; $_at_actLayerCode{$_l_Empty}; $_at_actCurrencyCodes{$_l_Empty})
				$_l_Empty:=Find in array:C230($_at_ACtSort; "")
			Until ($_l_Empty<0)
		End if 
		
		SORT ARRAY:C229($_at_ACtSort; $_ad_TransactionsDate; $_at_ActAccountCodes; $_at_actCurrencyCodes; $_at_ActPeriodCodes; $_ar_ActAmount; $_at_ActAnalysisCode; $_at_actLayerCode; $_ar_actTaxAmount; $_abo_Reconcilled)
		// //
		//ACC_ConvertValues ($_t_Currency;->$_at_actCurrencyCodes;->$_at_ActAccountCodes;->$_ar_ActAmount
		SEND PACKET:C103($_ti_DocReport; "All Transaction Transactions"+Char:C90(13))
		SEND PACKET:C103($_ti_DocReport; "Account Code"+Char:C90(9)+"Date"+Char:C90(9)+"Currency Code"+Char:C90(9)+"Amount"+Char:C90(9)+"Conversion Rate"+Char:C90(9)+"Converted Amount"+Char:C90(13))
		ARRAY TEXT:C222($_at_PeriodCUrrency; 0)
		ARRAY DATE:C224($_ad_PeriodRateDateFrom; 0; 0)
		ARRAY DATE:C224($_ad_PeriodRateDateTo; 0; 0)
		ARRAY REAL:C219($_ar_PeriodConvertRate; 0; 0)
		//TRACE
		For ($_l_BuildBalances; 1; Size of array:C274($_at_actCurrencyCodes))
			If ($_l_BuildBalances=4335)
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
			If ($_t_LastAccountIdent=$_t_UniqueID)
				$_bo_CalcLast:=False:C215
				$_l_LastEndsAt:=$_l_BuildBalances
			Else 
				$_bo_CalcLast:=True:C214
				$_l_NextLastStartsat:=$_l_BuildBalances
				$_l_NextLastEndssat:=$_l_BuildBalances
			End if 
			
			SEND PACKET:C103($_ti_DocReport; $_at_ActAccountCodes{$_l_BuildBalances}+Char:C90(9))
			If ($_at_actCurrencyCodes{$_l_BuildBalances}=$_t_Currency)
				Case of 
					: ($_at_ActAccountCodes{$_l_BuildBalances}=DB_GetLedgerVatInputACC)
						$_r_TotalBalance:=$_r_TotalBalance+$_ar_actTaxAmount{$_l_BuildBalances}
						$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_ar_actTaxAmount{$_l_BuildBalances}
						If ($_abo_Reconcilled{$_l_BuildBalances})
							$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+$_ar_actTaxAmount{$_l_BuildBalances}
						Else 
							$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+$_ar_actTaxAmount{$_l_BuildBalances}
						End if 
						
						SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_ActAmount{$_l_BuildBalances})+Char:C90(9)+Char:C90(9)+String:C10($_ar_ActAmount{$_l_BuildBalances})+Char:C90(13))
						
					Else 
						$_r_TotalBalance:=$_r_TotalBalance+($_ar_ActAmount{$_l_BuildBalances})
						$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_ar_ActAmount{$_l_BuildBalances}
						If ($_abo_Reconcilled{$_l_BuildBalances})
							$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+$_ar_ActAmount{$_l_BuildBalances}
						Else 
							$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+$_ar_ActAmount{$_l_BuildBalances}
						End if 
						SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_ActAmount{$_l_BuildBalances})+Char:C90(9)+Char:C90(9)+String:C10($_ar_ActAmount{$_l_BuildBalances})+Char:C90(13))
						
				End case 
				
				
			Else 
				Case of 
					: ($_at_ActAccountCodes{$_l_BuildBalances}=DB_GetLedgerVatInputACC)
						$_r_ThisAmount:=$_ar_actTaxAmount{$_l_BuildBalances}
					Else 
						$_r_ThisAmount:=($_ar_ActAmount{$_l_BuildBalances})
				End case 
				If ($_r_ThisAmount#0)
					$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; $_at_actCurrencyCodes{$_l_BuildBalances})
					If ($_l_CurRateReference<0)
						$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; "")
						$_at_aCurrencyRatesChecked{$_l_CurRateReference}:=$_at_actCurrencyCodes{$_l_BuildBalances}
						CUR_CheckRate($_at_actCurrencyCodes{$_l_BuildBalances}; $_t_Currency)
					End if 
					$_l_accRef:=Find in array:C230($_at_AccountCodeRange; $_at_ActAccountCodes{$_l_BuildBalances})
					If ($_al_accMultiCurValuation{$_l_accRef}#1)
						$_l_PeriodRate:=Find in array:C230($_at_PeriodCUrrency; $_at_ActPeriodCodes{$_l_BuildBalances}+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_Currency)
						If ($_l_PeriodRate<0)
							QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
							$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
							$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
							//now find the rate for this period
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
							$_d_LastToDate:=!00-00-00!
							//For ($_l_addRates;1;Records in selection([CURRENCY_RATES]))
							
							APPEND TO ARRAY:C911($_at_PeriodCUrrency; $_at_ActPeriodCodes{$_l_BuildBalances}+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_Currency)
							INSERT IN ARRAY:C227($_ar_PeriodRates; Size of array:C274($_ar_PeriodRates)+1; 1)
							INSERT IN ARRAY:C227($_ad_PeriodRateDateFrom; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
							INSERT IN ARRAY:C227($_ad_PeriodRateDateTo; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
							INSERT IN ARRAY:C227($_ar_PeriodConvertRate; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
							SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)})
							SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Rate:3; $_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)})
							For ($_l_FilltoDate; 1; Size of array:C274($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)}))
								If ($_l_FilltoDate<(Size of array:C274($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)})))
									APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; ($_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)}{$_l_FilltoDate+1})-1)
								Else 
									APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; !00-00-00!)  //we dont know what date this goes to
								End if 
							End for 
							QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<$_d_PeriodFromDate)
							If (Records in selection:C76([PERIODS:33])>0)
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
								$_t_PreviousPeriodCode:=[PERIODS:33]Period_Code:1
								$_l_PreviousPeriodRate:=Find in array:C230($_at_PeriodCUrrency; $_t_PreviousPeriodCode+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_Currency)
								
								If ($_l_PreviousPeriodRate>0)
									//we have the previous period.. the last array element probably has no to date on the currency conversion
									If ($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate}{Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})}=!00-00-00!)
										$_ad_PeriodRateDateTo{$_l_PreviousPeriodRate}{Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})}:=(($_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)}{1})-1)
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
												$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
											Else 
												$_ar_TransactionAmount{1}:=$_ar_TransactionAmount{1}+$_ar_ActAmount{$_l_CarryOn}
												$_ar_TaxAmount{1}:=$_ar_TaxAmount{1}+$_ar_actTaxAmount{$_l_CarryOn}
												
											End if 
											
											//
										Else 
											$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
											$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
											
										End if 
										
									End for 
									//SELECTION TO ARRAY([TRANSACTIONS]Trans_Date;$_ad_TransDate;[TRANSACTIONS]Amount;$_ar_TransactionAmount;[TRANSACTIONS]Tax_Amount;$_ar_TaxAmount)
									$_r_Balance:=0
									If (Size of array:C274($_ad_TransDate)>0)
										
										For ($_l_index; 1; Size of array:C274($_ad_TransDate))
											$_d_TransactionDate:=$_ad_TransDate{$_l_index}
											$_l_Element:=0
											For ($_l_Index2; 1; Size of array:C274($_ad_ConvertDate))
												If ($_ad_ConvertDate{$_l_Index2}<=$_d_TransactionDate)
													$_l_Element:=$_l_Index2
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
										
										SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10($_r_Balance)+Char:C90(13))
										
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
									
									SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
									
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
								SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
								
							Else 
								//no rates!!!!!!
								//    TRACE
								//use the last rate before that
								
								// /
								
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
								$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
								QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
								//$_l_CUrrencyPeriod:=[PERIODS]x_ID
								//$_d_PeriodFromDate:=[PERIODS]From_Date
								//now find the rate for this period
								REDUCE SELECTION:C351([CURRENCY_RATES:72]; 0)
								For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
									$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
									//now find the rate for this period
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
									If (Records in selection:C76([CURRENCY_RATES:72])>0)
										$_l_index:=Records in selection:C76([PERIODS:33])+1
										$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
									End if 
									NEXT RECORD:C51([PERIODS:33])
								End for 
								$_d_LastToDate:=!00-00-00!
								//For ($_l_addRates;1;Records in selection([CURRENCY_RATES]))
								QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=$_l_CUrrencyPeriod)
								
								$_l_PeriodRate:=Find in array:C230($_at_PeriodCUrrency; [PERIODS:33]Period_Code:1+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_Currency)
								//$_l_PreviousPeriodRate:=Find in array($_at_PeriodCUrrency;$_t_PreviousPeriodCode+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_Currency)
								
								If ($_l_PeriodRate<0)
									APPEND TO ARRAY:C911($_at_PeriodCUrrency; [PERIODS:33]Period_Code:1+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_Currency)
									INSERT IN ARRAY:C227($_ar_PeriodRates; Size of array:C274($_ar_PeriodRates)+1; 1)
									INSERT IN ARRAY:C227($_ad_PeriodRateDateFrom; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
									INSERT IN ARRAY:C227($_ad_PeriodRateDateTo; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
									INSERT IN ARRAY:C227($_ar_PeriodConvertRate; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
									SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)})
									SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Rate:3; $_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)})
									For ($_l_FilltoDate; 1; Size of array:C274($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)}))
										If ($_l_FilltoDate<(Size of array:C274($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)})))
											APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; ($_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)}{$_l_FilltoDate+1})-1)
										Else 
											APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; !00-00-00!)  //we dont know what date this goes to
										End if 
									End for 
									If (Size of array:C274($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)})>0)
										//TRACE
										QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<$_d_PeriodFromDate)
										If (Records in selection:C76([PERIODS:33])>0)
											ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
											$_t_PreviousPeriodCode:=[PERIODS:33]Period_Code:1
											$_l_PreviousPeriodRate:=Find in array:C230($_at_PeriodCUrrency; $_t_PreviousPeriodCode+":"+$_t_Currency)
											If ($_l_PreviousPeriodRate>0)
												//we have the previous period.. the last array element probably has no to date on the currency conversion
												If ($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate}{Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})}=!00-00-00!)
													$_ad_PeriodRateDateTo{$_l_PreviousPeriodRate}{Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})}:=(($_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)}{1})-1)
												End if 
											End if 
										End if 
										
										$_l_PeriodRate:=Size of array:C274($_at_PeriodCUrrency)
										//and apply the last rate here to the current period
										$_l_PeriodRateCurrent:=Find in array:C230($_at_PeriodCUrrency; $_at_ActPeriodCodes{$_l_BuildBalances}+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_Currency)
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
														$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
													Else 
														$_ar_TransactionAmount{1}:=$_ar_TransactionAmount{1}+$_ar_ActAmount{$_l_CarryOn}
														$_ar_TaxAmount{1}:=$_ar_TaxAmount{1}+$_ar_actTaxAmount{$_l_CarryOn}
													End if 
													
													//
												Else 
													$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
													$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
													
												End if 
												
											End for 
											//SELECTION TO ARRAY([TRANSACTIONS]Trans_Date;$_ad_TransDate;[TRANSACTIONS]Amount;$_ar_TransactionAmount;[TRANSACTIONS]Tax_Amount;$_ar_TaxAmount)
											$_r_Balance:=0
											If (Size of array:C274($_ad_TransDate)>0)
												
												For ($_l_index; 1; Size of array:C274($_ad_TransDate))
													$_d_TransactionDate:=$_ad_TransDate{$_l_index}
													$_l_Element:=0
													For ($_l_Index2; 1; Size of array:C274($_ad_ConvertDate))
														If ($_ad_ConvertDate{$_l_Index2}<=$_d_TransactionDate)
															$_l_Element:=$_l_Index2
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
												SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10($_r_Balance)+Char:C90(13))
												
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
											SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
											
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
										SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
										
										
										
									Else 
										//no rates!!!!!!
										//    TRACE
										//use the last rate before that
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
										$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
										QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
										ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
										For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
											$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
											//now find the rate for this period
											QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
											If (Records in selection:C76([CURRENCY_RATES:72])>0)
												$_l_index:=Records in selection:C76([PERIODS:33])+1
												$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
											End if 
											NEXT RECORD:C51([PERIODS:33])
										End for 
										$_d_LastToDate:=!00-00-00!
										//For ($_l_addRates;1;Records in selection([CURRENCY_RATES]))
										QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=$_l_CUrrencyPeriod)
										
										$_l_PeriodRate:=Find in array:C230($_at_PeriodCUrrency; [PERIODS:33]Period_Code:1+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_Currency)
										//$_l_PreviousPeriodRate:=Find in array($_at_PeriodCUrrency;$_t_PreviousPeriodCode+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_Currency)
										
										If ($_l_PeriodRate<0)
											APPEND TO ARRAY:C911($_at_PeriodCUrrency; [PERIODS:33]Period_Code:1+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_Currency)
											INSERT IN ARRAY:C227($_ar_PeriodRates; Size of array:C274($_ar_PeriodRates)+1; 1)
											INSERT IN ARRAY:C227($_ad_PeriodRateDateFrom; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
											INSERT IN ARRAY:C227($_ad_PeriodRateDateTo; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
											INSERT IN ARRAY:C227($_ar_PeriodConvertRate; Size of array:C274($_ad_PeriodRateDateFrom)+1; 1)
											SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)})
											SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Rate:3; $_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)})
											For ($_l_FilltoDate; 1; Size of array:C274($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)}))
												If ($_l_FilltoDate<(Size of array:C274($_ar_PeriodConvertRate{Size of array:C274($_ar_PeriodConvertRate)})))
													APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; ($_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)}{$_l_FilltoDate+1})-1)
												Else 
													APPEND TO ARRAY:C911($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)}; !00-00-00!)  //we dont know what date this goes to
												End if 
											End for 
											If (Size of array:C274($_ad_PeriodRateDateTo{Size of array:C274($_ad_PeriodRateDateTo)})>0)
												//TRACE
												QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<$_d_PeriodFromDate)
												If (Records in selection:C76([PERIODS:33])>0)
													ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
													$_t_PreviousPeriodCode:=[PERIODS:33]Period_Code:1
													$_l_PreviousPeriodRate:=Find in array:C230($_at_PeriodCUrrency; $_t_PreviousPeriodCode+":"+$_t_Currency)
													If ($_l_PreviousPeriodRate>0)
														//we have the previous period.. the last array element probably has no to date on the currency conversion
														If ($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate}{Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})}=!00-00-00!)
															$_ad_PeriodRateDateTo{$_l_PreviousPeriodRate}{Size of array:C274($_ad_PeriodRateDateTo{$_l_PreviousPeriodRate})}:=(($_ad_PeriodRateDateFrom{Size of array:C274($_ad_PeriodRateDateFrom)}{1})-1)
														End if 
													End if 
												End if 
												
												$_l_PeriodRate:=Size of array:C274($_at_PeriodCUrrency)
												//and apply the last rate here to the current period
												$_l_PeriodRateCurrent:=Find in array:C230($_at_PeriodCUrrency; $_at_ActPeriodCodes{$_l_BuildBalances}+":"+$_at_actCurrencyCodes{$_l_BuildBalances}+":"+$_t_Currency)
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
																$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
															Else 
																$_ar_TransactionAmount{1}:=$_ar_TransactionAmount{1}+$_ar_ActAmount{$_l_CarryOn}
																$_ar_TaxAmount{1}:=$_ar_TaxAmount{1}+$_ar_actTaxAmount{$_l_CarryOn}
															End if 
															
															//
														Else 
															$_l_BuildBalances:=$_l_CarryOn-1  //different currency/anal/layer/account
															$_l_CarryOn:=Size of array:C274($_at_actCurrencyCodes)
															
														End if 
														
													End for 
													//SELECTION TO ARRAY([TRANSACTIONS]Trans_Date;$_ad_TransDate;[TRANSACTIONS]Amount;$_ar_TransactionAmount;[TRANSACTIONS]Tax_Amount;$_ar_TaxAmount)
													$_r_Balance:=0
													If (Size of array:C274($_ad_TransDate)>0)
														
														For ($_l_index; 1; Size of array:C274($_ad_TransDate))
															$_d_TransactionDate:=$_ad_TransDate{$_l_index}
															$_l_Element:=0
															For ($_l_Index2; 1; Size of array:C274($_ad_ConvertDate))
																If ($_ad_ConvertDate{$_l_Index2}<=$_d_TransactionDate)
																	$_l_Element:=$_l_Index2
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
														SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10($_r_Balance)+Char:C90(13))
														
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
													SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
													
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
												
												SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
												
												
												
											Else 
												//TRACE
												$_r_TotalBalance:=$_r_TotalBalance+(($_r_ThisAmount*1))
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												If ($_abo_Reconcilled{$_l_BuildBalances})
													$_ar_accountRecTotal{$_l_AccTotalRef}:=$_ar_accountRecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												Else 
													$_ar_accountUnrecTotal{$_l_AccTotalRef}:=$_ar_accountUnrecTotal{$_l_AccTotalRef}+($_r_ThisAmount*$_r_Rate)
												End if 
												
												SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10(1)+Char:C90(9)+String:C10(($_r_ThisAmount*1))+Char:C90(9)+"No Conversion Rate"+Char:C90(13))
												
										End case 
								End case 
								
						End case 
						
						
					Else 
						//value at current rate
						$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
						//now find the rate for this period
						If ($_l_CurrencyPeriod=0)
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
								$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24($_d_LatestDate); Year of:C25($_d_LatestDate)))
							Until ($_l_CurrencyPeriod>0) | ($_d_LatestDate<$_d_EarliestDate)
						End if 
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
						
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
								
								SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
								
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
								SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
								
							Else 
								$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
								$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
								QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
								For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
									$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
									
									
									//now find the rate for this period
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
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
										SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
										
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
										SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
										
									Else 
										$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_ActPeriodCodes{$_l_BuildBalances})
										$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
										QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
										ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
										For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
											$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
											
											
											//now find the rate for this period
											QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_actCurrencyCodes{$_l_BuildBalances}; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
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
												SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
												
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
												
												SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_r_ThisAmount*$_r_Rate))+Char:C90(13))
												
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
												SEND PACKET:C103($_ti_DocReport; String:C10($_ad_TransactionsDate{$_l_BuildBalances})+Char:C90(9)+$_at_actCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_r_ThisAmount)+Char:C90(9)+String:C10(1)+Char:C90(9)+String:C10(($_r_ThisAmount*1))+Char:C90(9)+"No Conversion Rate"+Char:C90(13))
												
												
										End case 
										
										
								End case 
								
						End case 
						
						
						
					End if 
					
					
				End if 
			End if 
		End for 
		$_r_ReconcilledBalance:=$_r_TotalBalance
		SEND PACKET:C103($_ti_DocReport; "Account Details"+Char:C90(9)+"Total Value of transactions"+Char:C90(9)+"Reconciled Amount"+Char:C90(9)+"Unreconciled amount"+Char:C90(13))
		
		For ($_l_ExportSUms; 1; Size of array:C274($_at_AccountIDENT))
			SEND PACKET:C103($_ti_DocReport; $_at_AccountIDENT{$_l_ExportSUms}+Char:C90(9)+String:C10($_ar_accountTotal{$_l_ExportSUms})+Char:C90(9)+String:C10($_ar_accountRecTotal{$_l_ExportSUms})+Char:C90(9)+String:C10($_ar_accountUnrecTotal{$_l_ExportSUms})+Char:C90(13))
		End for 
	End if 
	//TRACE
	If (True:C214)
		//If ($_l_Empty>0)
		//Repeat 
		SORT ARRAY:C229($_at_AcbAccountCodes; $_at_AccCurrencyCodes; $_at_PeriodCodes; $_ar_AccBalance; $_at_acbAnalysisCode; $_at_acbLayerCode)
		
		//$_at_ACtSort{$_l_Empty}:=ACC_Buildunique ($_at_ActAccountCodes{$_l_Empty};$_at_ActAnalysisCode{$_l_Empty};$_at_ActPeriodCodes{$_l_Empty};$_at_actLayerCode{$_l_Empty};$_at_actCurrencyCodes{$_l_Empty})
		//$_l_Empty:=Find in array($_at_ACtSort;"")
		//Until ($_l_Empty<0)
		//End if 
		
		SEND PACKET:C103($_ti_DocReport; "Account Balances"+Char:C90(13))
		SEND PACKET:C103($_ti_DocReport; "Date"+Char:C90(9)+"Account code"+Char:C90(9)+"Currency Code"+Char:C90(9)+"Amount"+Char:C90(9)+"Conversion Rate"+Char:C90(9)+"Converted Amount"+Char:C90(13))
		APPEND TO ARRAY:C911($_at_AccountIDENT; $_t_UniqueID)
		APPEND TO ARRAY:C911($_ar_accountTotal; 0)
		$_t_LastAccountCOde:=""
		$_l_AccTotalRef:=0
		//TRACE
		For ($_l_BuildBalances; 1; Size of array:C274($_at_AccCurrencyCodes))
			If ($_at_AcbAccountCodes{$_l_BuildBalances}#$_t_LastAccountCOde) & ($_l_AccTotalRef>0)
				SEND PACKET:C103($_ti_DocReport; ""+Char:C90(9)+""+Char:C90(9)+""+Char:C90(9)+""+Char:C90(9)+""+Char:C90(9)+""+Char:C90(9)+String:C10($_ar_accountTotal{$_l_AccTotalRef}))
			End if 
			$_t_LastAccountCOde:=$_at_AcbAccountCodes{$_l_BuildBalances}
			$_t_UniqueID:=ACC_Buildunique($_at_AcbAccountCodes{$_l_Empty}; $_at_acbAnalysisCode{$_l_Empty}; $_at_PeriodCodes{$_l_Empty}; $_at_acbLayerCode{$_l_Empty}; $_at_AccCurrencyCodes{$_l_Empty})
			//$_at_ACtSort{$_l_BuildBalances}  ///ACC_Buildunique ($_at_ActAccountCodes{$_l_BuildBalances};$_at_ActAnalysisCode{$_l_BuildBalances};$_at_ActPeriodCodes{$_l_BuildBalances};$_at_actLayerCode{$_l_BuildBalances};$_at_actCurrencyCodes{$_l_BuildBalances})
			
			$_l_AccTotalRef:=Find in array:C230($_at_AccountIDENT; $_t_UniqueID)
			If ($_l_AccTotalRef<0)
				APPEND TO ARRAY:C911($_at_AccountIDENT; $_t_UniqueID)
				APPEND TO ARRAY:C911($_ar_accountTotal; 0)
				APPEND TO ARRAY:C911($_ar_accountRecTotal; 0)
				APPEND TO ARRAY:C911($_ar_accountUnrecTotal; 0)
				$_l_AccTotalRef:=Size of array:C274($_ar_accountUnrecTotal)
			End if 
			If ($_t_LastAccountIdent=$_t_UniqueID)
				$_bo_CalcLast:=False:C215
				$_l_LastEndsAt:=$_l_BuildBalances
			Else 
				$_bo_CalcLast:=True:C214
				$_l_NextLastStartsat:=$_l_BuildBalances
				$_l_NextLastEndssat:=$_l_BuildBalances
			End if 
			
			
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_BuildBalances})
			$_d_PeriodToDate:=[PERIODS:33]To_Date:4
			$_t_UniqueID:=ACC_Buildunique($_at_AcbAccountCodes{$_l_BuildBalances}; $_at_acbAnalysisCode{$_l_BuildBalances}; $_at_PeriodCodes{$_l_BuildBalances}; $_at_acbLayerCode{$_l_BuildBalances}; $_at_AccCurrencyCodes{$_l_BuildBalances})
			
			
			$_l_AccTotalRef:=Find in array:C230($_at_AccountIDENT; $_t_UniqueID)
			If ($_l_AccTotalRef<0)
				APPEND TO ARRAY:C911($_at_AccountIDENT; $_t_UniqueID)
				APPEND TO ARRAY:C911($_ar_accountTotal; 0)
				
				$_l_AccTotalRef:=Size of array:C274($_ar_accountUnrecTotal)
			End if 
			If ($_at_AccCurrencyCodes{$_l_BuildBalances}=$_t_Currency)
				$_r_TotalBalance:=$_r_TotalBalance+($_ar_AccBalance{$_l_BuildBalances})
				$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_ar_AccBalance{$_l_BuildBalances}
				SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+"1"+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(13))
				//SEND PACKET($_ti_DocReport;Date($_d_PeriodToDate)+Char(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char(9)+String($_ar_AccBalance{$_l_BuildBalances})+Char(9)+String($_r_Rate)+Char(9)+String(($_r_ThisAmount*$_r_Rate))+Char(13))
				
			Else 
				If ($_ar_AccBalance{$_l_BuildBalances}#0)
					$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; $_at_AccCurrencyCodes{$_l_BuildBalances})
					If ($_l_CurRateReference<0)
						$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; "")
						$_at_aCurrencyRatesChecked{$_l_CurRateReference}:=$_at_AccCurrencyCodes{$_l_BuildBalances}
						CUR_CheckRate($_at_AccCurrencyCodes{$_l_BuildBalances}; $_t_Currency)
					End if 
					
					$_l_accRef:=Find in array:C230($_at_AccountCodeRange; $_at_AcbAccountCodes{$_l_BuildBalances})
					If ($_al_accMultiCurValuation{$_l_accRef}#1)
						QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_BuildBalances})
						$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
						//now find the rate for this period
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_AccCurrencyCodes{$_l_BuildBalances}; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
						
						Case of 
							: (Records in selection:C76([CURRENCY_RATES:72])>1)
								SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_ConvertDate; [CURRENCY_RATES:72]Rate:3; $_ar_ConvertRate)
								
								$_r_Rate:=$_ar_ConvertRate{1}
								$_bo_Variants:=False:C215
								For ($_l_CheckVariance; 1; Size of array:C274($_ar_ConvertRate))
									If ($_ar_ConvertRate{$_l_CheckVariance}#$_r_Rate)
										$_bo_Variants:=True:C214
									End if 
								End for 
								If ($_bo_Variants)
									ACC_GetTransactions($_at_AcbAccountCodes{$_l_BuildBalances}; $_at_PeriodCodes{$_l_BuildBalances}; $_at_AccCurrencyCodes{$_l_BuildBalances}; $_at_acbAnalysisCode{$_l_BuildBalances}; $_at_acbLayerCode{$_l_BuildBalances})
									
									SELECTION TO ARRAY:C260([TRANSACTIONS:29]Trans_Date:5; $_ad_TransDate; [TRANSACTIONS:29]Amount:6; $_ar_TransactionAmount; [TRANSACTIONS:29]Tax_Amount:16; $_ar_TaxAmount)
									$_r_Balance:=0
									If (Size of array:C274($_ad_TransDate)>0)
										//FIRST RECORD([TRANSACTIONS])
										For ($_l_index; 1; Size of array:C274($_ad_TransDate))
											$_d_TransactionDate:=$_ad_TransDate{$_l_index}
											$_l_Element:=0
											For ($_l_Index2; 1; Size of array:C274($_ad_ConvertDate))
												If ($_ad_ConvertDate{$_l_Index2}<=$_d_TransactionDate)
													$_l_Element:=$_l_Index2
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
											If ($_at_AcbAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
												$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_ar_TransactionAmount{$_l_index}*$_r_Rate
												
												SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ad_TransDate{$_l_index})+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_TransactionAmount{$_l_index})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_ar_TransactionAmount{$_l_index}*$_r_Rate))+Char:C90(13))
												
											Else 
												$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+$_ar_TaxAmount{$_l_index}*$_r_Rate
												
												SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ad_TransDate{$_l_index})+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_TransactionAmount{$_l_index})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_ar_TaxAmount{$_l_index}*$_r_Rate))+Char:C90(13))
												
											End if 
											$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
											//NEXT RECORD([TRANSACTIONS])
										End for 
										$_r_TotalBalance:=$_r_TotalBalance+($_r_Balance)
									Else 
										//no transactions
										//$_r_TotalBalance:=0
									End if 
								Else 
									//although there are multiple rate record the rate is the same on them
									$_r_TotalBalance:=$_r_TotalBalance+(($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate))
									$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
									
									SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10((($_ar_AccBalance{$_l_BuildBalances})*$_r_Rate))+Char:C90(13))
									
								End if 
								
							: (Records in selection:C76([CURRENCY_RATES:72])=1)
								$_r_Rate:=[CURRENCY_RATES:72]Rate:3
								$_r_TotalBalance:=$_r_TotalBalance+(($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate))
								$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
								
								SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10((($_ar_AccBalance{$_l_BuildBalances})*$_r_Rate))+Char:C90(13))
								
							Else 
								//no rates!!!!!!
								//    TRACE
								//use the last rate before that
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_BuildBalances})
								$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
								QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
								For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
									$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
									//now find the rate for this period
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_AccCurrencyCodes{$_l_BuildBalances}; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
									If (Records in selection:C76([CURRENCY_RATES:72])>0)
										$_l_index:=Records in selection:C76([PERIODS:33])+1
									End if 
									NEXT RECORD:C51([PERIODS:33])
								End for 
								Case of 
									: (Records in selection:C76([CURRENCY_RATES:72])>1)
										SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_ConvertDate; [CURRENCY_RATES:72]Rate:3; $_ar_ConvertRate)
										$_r_Rate:=$_ar_ConvertRate{1}
										$_bo_Variants:=False:C215
										For ($_l_CheckVariance; 1; Size of array:C274($_ar_ConvertRate))
											If ($_ar_ConvertRate{$_l_CheckVariance}#$_r_Rate)
												$_bo_Variants:=True:C214
											End if 
										End for 
										If ($_bo_Variants)
											
											ACC_GetTransactions($_at_AcbAccountCodes{$_l_BuildBalances}; $_at_PeriodCodes{$_l_BuildBalances}; $_at_AccCurrencyCodes{$_l_BuildBalances}; $_at_acbAnalysisCode{$_l_BuildBalances}; $_at_acbLayerCode{$_l_BuildBalances})
											
											SELECTION TO ARRAY:C260([TRANSACTIONS:29]Trans_Date:5; $_ad_TransDate; [TRANSACTIONS:29]Amount:6; $_ar_TransactionAmount; [TRANSACTIONS:29]Tax_Amount:16; $_ar_TaxAmount)
											$_r_Balance:=0
											If (Size of array:C274($_ad_TransDate)>0)
												//FIRST RECORD([TRANSACTIONS])
												For ($_l_index; 1; Size of array:C274($_ad_TransDate))
													$_d_TransactionDate:=$_ad_TransDate{$_l_index}
													$_l_Element:=0
													For ($_l_Index2; 1; Size of array:C274($_ad_ConvertDate))
														If ($_ad_ConvertDate{$_l_Index2}<=$_d_TransactionDate)
															$_l_Element:=$_l_Index2
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
													If ($_at_AcbAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
														$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
														$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_TransactionAmount{$_l_BuildBalances}*$_r_Rate)
														
														SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ad_TransDate{$_l_index})+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_TransactionAmount{$_l_index})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_ar_TransactionAmount{$_l_index}*$_r_Rate))+Char:C90(13))
														
													Else 
														$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
														$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_TaxAmount{$_l_BuildBalances}*$_r_Rate)
														
														SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ad_TransDate{$_l_index})+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_TransactionAmount{$_l_index})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_ar_TaxAmount{$_l_index}*$_r_Rate))+Char:C90(13))
														
													End if 
													$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
													//NEXT RECORD([TRANSACTIONS])
												End for 
												$_r_TotalBalance:=$_r_TotalBalance+($_r_Balance)
											Else 
												//no transactions
												//  $_r_TotalBalance:=0
											End if 
											
										Else 
											$_r_TotalBalance:=$_r_TotalBalance+(($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate))
											$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
											
											SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10((($_ar_AccBalance{$_l_BuildBalances})*$_r_Rate))+Char:C90(13))
											
										End if 
										
									: (Records in selection:C76([CURRENCY_RATES:72])=1)
										$_r_Rate:=[CURRENCY_RATES:72]Rate:3
										$_r_TotalBalance:=$_r_TotalBalance+(($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate))
										$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
										
										SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10((($_ar_AccBalance{$_l_BuildBalances})*$_r_Rate))+Char:C90(13))
										
									Else 
										//no rates!!!!!!
										//    TRACE
										//use the last rate before that
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_BuildBalances})
										$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
										QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
										ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
										For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
											$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
											//now find the rate for this period
											QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_AccCurrencyCodes{$_l_BuildBalances}; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CurrencyPeriod)
											If (Records in selection:C76([CURRENCY_RATES:72])>0)
												$_l_index:=Records in selection:C76([PERIODS:33])+1
											End if 
											NEXT RECORD:C51([PERIODS:33])
										End for 
										Case of 
											: (Records in selection:C76([CURRENCY_RATES:72])>1)
												SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_ConvertDate; [CURRENCY_RATES:72]Rate:3; $_ar_ConvertRate)
												$_r_Rate:=$_ar_ConvertRate{1}
												$_bo_Variants:=False:C215
												For ($_l_CheckVariance; 1; Size of array:C274($_ar_ConvertRate))
													If ($_ar_ConvertRate{$_l_CheckVariance}#$_r_Rate)
														$_bo_Variants:=True:C214
													End if 
												End for 
												If ($_bo_Variants)
													// ACC_GetTransactions (HELLO)
													ACC_GetTransactions($_at_AcbAccountCodes{$_l_BuildBalances}; $_at_PeriodCodes{$_l_BuildBalances}; $_at_AccCurrencyCodes{$_l_BuildBalances}; $_at_acbAnalysisCode{$_l_BuildBalances}; $_at_acbLayerCode{$_l_BuildBalances})
													
													SELECTION TO ARRAY:C260([TRANSACTIONS:29]Trans_Date:5; $_ad_TransDate; [TRANSACTIONS:29]Amount:6; $_ar_TransactionAmount; [TRANSACTIONS:29]Tax_Amount:16; $_ar_TaxAmount)
													$_r_Balance:=0
													
													$_r_Balance:=0
													If (Size of array:C274($_ad_TransDate)>0)
														//FIRST RECORD([TRANSACTIONS])
														For ($_l_index; 1; Size of array:C274($_ad_TransDate))
															$_d_TransactionDate:=$_ad_TransDate{$_l_index}
															$_l_Element:=0
															For ($_l_Index2; 1; Size of array:C274($_ad_ConvertDate))
																If ($_ad_ConvertDate{$_l_Index2}<=$_d_TransactionDate)
																	$_l_Element:=$_l_Index2
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
															If ($_at_AcbAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
																$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
																$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_TransactionAmount{$_l_BuildBalances}*$_r_Rate)
																
																SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ad_TransDate{$_l_index})+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_TransactionAmount{$_l_index})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_ar_TransactionAmount{$_l_index}*$_r_Rate))+Char:C90(13))
															Else 
																$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
																$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_TaxAmount{$_l_BuildBalances}*$_r_Rate)
																
																SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ad_TransDate{$_l_index})+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_TransactionAmount{$_l_index})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10(($_ar_TaxAmount{$_l_index}*$_r_Rate))+Char:C90(13))
															End if 
															$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
															//NEXT RECORD([TRANSACTIONS])
														End for 
														$_r_TotalBalance:=$_r_TotalBalance+($_r_Balance)
													Else 
														//no transactions
														//$_r_TotalBalance:=0
													End if 
													
												Else 
													$_r_TotalBalance:=$_r_TotalBalance+(($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate))
													$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
													
													SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10((($_ar_AccBalance{$_l_BuildBalances})*$_r_Rate))+Char:C90(13))
													
												End if 
											: (Records in selection:C76([CURRENCY_RATES:72])=1)
												$_r_Rate:=[CURRENCY_RATES:72]Rate:3
												$_r_TotalBalance:=$_r_TotalBalance+(($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate))
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
												
												SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10((($_ar_AccBalance{$_l_BuildBalances})*$_r_Rate))+Char:C90(13))
												
											Else 
												//TRACE
												$_r_TotalBalance:=$_r_TotalBalance+(($_ar_AccBalance{$_l_BuildBalances}*1))
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*1)
												
												SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+String:C10(1)+Char:C90(9)+String:C10((($_ar_AccBalance{$_l_BuildBalances})*1))+Char:C90(9)+"No Conversion Rate"+Char:C90(13))
												
										End case 
								End case 
								
						End case 
						
						
					Else 
						//value at current rate
						$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
						//now find the rate for this period
						If ($_l_CurrencyPeriod=0)
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
								$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24($_d_LatestDate); Year of:C25($_d_LatestDate)))
							Until ($_l_CurrencyPeriod>0) | ($_d_LatestDate<$_d_EarliestDate)
						End if 
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_AccCurrencyCodes{$_l_BuildBalances}; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CurrencyPeriod)
						Case of 
							: (Records in selection:C76([CURRENCY_RATES:72])>1)
								ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
								FIRST RECORD:C50([CURRENCY_RATES:72])
								$_r_Rate:=[CURRENCY_RATES:72]Rate:3
								$_r_TotalBalance:=$_r_TotalBalance+(($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate))
								$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
								
								SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10((($_ar_AccBalance{$_l_BuildBalances})*$_r_Rate))+Char:C90(13))
								
							: (Records in selection:C76([CURRENCY_RATES:72])=1)
								$_r_Rate:=[CURRENCY_RATES:72]Rate:3
								$_r_TotalBalance:=$_r_TotalBalance+(($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate))
								$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
								
								SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10((($_ar_AccBalance{$_l_BuildBalances})*$_r_Rate))+Char:C90(13))
								
							Else 
								$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_BuildBalances})
								$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
								QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
								For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
									$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
									
									
									//now find the rate for this period
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_AccCurrencyCodes{$_l_BuildBalances}; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
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
										$_r_TotalBalance:=$_r_TotalBalance+(($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate))
										$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
										
									: (Records in selection:C76([CURRENCY_RATES:72])=1)
										$_r_Rate:=[CURRENCY_RATES:72]Rate:3
										$_r_TotalBalance:=$_r_TotalBalance+(($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate))
										$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
										
									Else 
										$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_BuildBalances})
										$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
										QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
										ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
										For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
											$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
											
											
											//now find the rate for this period
											QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_AccCurrencyCodes{$_l_BuildBalances}; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
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
												$_r_TotalBalance:=$_r_TotalBalance+(($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate))
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
												
												SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10((($_ar_AccBalance{$_l_BuildBalances})*$_r_Rate))+Char:C90(13))
												
											: (Records in selection:C76([CURRENCY_RATES:72])=1)
												$_r_Rate:=[CURRENCY_RATES:72]Rate:3
												$_r_TotalBalance:=$_r_TotalBalance+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*$_r_Rate)
												
												SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+String:C10($_r_Rate)+Char:C90(9)+String:C10((($_ar_AccBalance{$_l_BuildBalances})*$_r_Rate))+Char:C90(13))
												
											Else 
												
												$_r_TotalBalance:=$_r_TotalBalance+($_ar_AccBalance{$_l_BuildBalances}*1)
												$_ar_accountTotal{$_l_AccTotalRef}:=$_ar_accountTotal{$_l_AccTotalRef}+($_ar_AccBalance{$_l_BuildBalances}*1)
												
												SEND PACKET:C103($_ti_DocReport; $_at_AcbAccountCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_d_PeriodToDate)+Char:C90(9)+$_at_AccCurrencyCodes{$_l_BuildBalances}+Char:C90(9)+String:C10($_ar_AccBalance{$_l_BuildBalances})+Char:C90(9)+String:C10(1)+Char:C90(9)+String:C10((($_ar_AccBalance{$_l_BuildBalances})*1))+Char:C90(9)+"NO Conversion Rate"+Char:C90(13))
												
										End case 
										
										
								End case 
								
						End case 
						
						
						
					End if 
					
					
				End if 
			End if 
		End for 
		$_r_AccountBalance:=$_r_TotalBalance  //$_r_TotaBalanceistotalbalance of the accounts.
		//SEND PACKET($_ti_DocReport;"Account Details"+Char(9)+"Total Value "+Char(13))
		
		For ($_l_ExportSUms; 1; Size of array:C274($_at_AccountIDENT))
			//SEND PACKET($_ti_DocReport;$_at_AccountIDENT{$_l_ExportSUms}+Char(9)+String($_ar_accountTotal{$_l_ExportSUms})+Char(13))
		End for 
		APPEND TO ARRAY:C911($_at_AccountIDENT; $_t_UniqueID)
		APPEND TO ARRAY:C911($_ar_accountTotal; 0)
		APPEND TO ARRAY:C911($_ar_accountRecTotal; 0)
		APPEND TO ARRAY:C911($_ar_accountUnrecTotal; 0)
		
	End if 
	CLOSE DOCUMENT:C267($_ti_DocReport)
	//TRACE
Else 
	TRACE:C157
	//Open window(
	DB_CreateNewRecord(Current process:C322; False:C215; Table:C252(->[ACC_Bank_Statements:198]); True:C214)
	
End if 
ERR_MethodTrackerReturn("Scratch_ReconcileBalances"; $_t_oldMethodName)
