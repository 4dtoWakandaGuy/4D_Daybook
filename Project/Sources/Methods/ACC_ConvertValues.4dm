//%attributes = {}

If (False:C215)
	//Database Method Name:      ACC_ConvertValues
	//------------------ Method Notes ------------------
	//Pass this pointers to arrays of values. These could point to account balances or transactions.
	//if it is to transactions then pass the tax amount as well as the amount. if it is to transaction then the find transactions wont happen-its a single transaction.
	//------------------ Revision Control ----------------
	//Date Created:  12/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_CurConvertDate; 0)
	ARRAY DATE:C224($_ad_TransDate; 0)
	ARRAY LONGINT:C221($_al_accMultiCurValuation; 0)
	ARRAY REAL:C219($_ar_CurConvertRate; 0)
	ARRAY REAL:C219($_ar_TaxAmount; 0)
	ARRAY REAL:C219($_ar_TransactionAmount; 0)
	ARRAY TEXT:C222($_at_AcbAccountCodes; 0)
	ARRAY TEXT:C222($_at_acbAnalysisCode; 0)
	ARRAY TEXT:C222($_at_acbLayerCode; 0)
	ARRAY TEXT:C222($_at_AccountCodeRange; 0)
	ARRAY TEXT:C222($_at_aCurrencyRatesChecked; 0)
	ARRAY TEXT:C222($_at_CurrencyCodes; 0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	C_BOOLEAN:C305($_bo_IsTrans; $_bo_IsTranstions; $_bo_Variants)
	C_DATE:C307($_d_EarliestDate; $_d_firstDayofMomth; $_d_LatestDate; $_d_PeriodFromDate; $_d_TransactionDate)
	C_LONGINT:C283($_l_accRef; $_l_BuildBalances; $_l_CheckVariance; $_l_CurRateReference; $_l_CUrrencyPeriod; $_l_Dayof; $_l_Element; $_l_index; $_l_Index2)
	C_POINTER:C301($_ptr__AccountCodes; $_ptr_AccountCodes; $_ptr_Amounts; $_Ptr_CUrrencyCOdes; $_ptr_TaxAmount; $2; $3; $4; $5)
	C_REAL:C285($_r_Balance; $_r_ConvertedBalance; $_r_Rate; $_r_TotalBalance)
	C_TEXT:C284($_t_Currency; $_t_oldMethodName; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_ConvertValues")
$_t_Currency:=$1  //this is the output currency code

$_Ptr_CUrrencyCOdes:=$2
$_ptr_AccountCodes:=$3
$_ptr_Amounts:=$4
//$_ar__actTaxAmount:=$99
$_ptr_TaxAmount:=$5
$_bo_IsTranstions:=(Count parameters:C259>99)
ARRAY TEXT:C222($_at_aCurrencyRatesChecked; Size of array:C274($_at_CurrencyCodes))

For ($_l_BuildBalances; 1; Size of array:C274($_Ptr_CUrrencyCOdes->))
	
	If ($_Ptr_CUrrencyCOdes->{$_l_BuildBalances}=$_t_Currency)
		//$_r_TotalBalance:=$_r_TotalBalance+($_ptr_Amounts->{$_l_BuildBalances})
		Case of 
			: ($_ptr_AccountCodes->{$_l_BuildBalances}=DB_GetLedgerVatInputACC) & ($_bo_IsTranstions)
				$_r_TotalBalance:=$_r_TotalBalance+$_ptr_TaxAmount->{$_l_BuildBalances}
			Else 
				$_r_TotalBalance:=$_r_TotalBalance+($_ptr_Amounts->{$_l_BuildBalances})
		End case 
	Else 
		If ($_ptr_Amounts->{$_l_BuildBalances}=0)
			$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; $_Ptr_CUrrencyCOdes->{$_l_BuildBalances})
			If ($_l_CurRateReference<0)
				$_l_CurRateReference:=Find in array:C230($_at_aCurrencyRatesChecked; "")
				$_at_aCurrencyRatesChecked{$_l_CurRateReference}:=$_Ptr_CUrrencyCOdes->{$_l_BuildBalances}
				CUR_CheckRate($_Ptr_CUrrencyCOdes->{$_l_BuildBalances}; $_t_Currency)
			End if 
			
			$_l_accRef:=Find in array:C230($_at_AccountCodeRange; $_at_AcbAccountCodes{$_l_BuildBalances})
			If ($_al_accMultiCurValuation{$_l_accRef}#1)
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_BuildBalances})
				$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
				//now find the rate for this period
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_Ptr_CUrrencyCOdes->{$_l_BuildBalances}; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
				
				Case of 
					: (Records in selection:C76([CURRENCY_RATES:72])>1)
						SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurConvertDate; [CURRENCY_RATES:72]Rate:3; $_ar_CurConvertRate)
						$_r_Rate:=$_ar_CurConvertRate{1}
						$_bo_Variants:=False:C215
						For ($_l_CheckVariance; 1; Size of array:C274($_ar_CurConvertRate))
							If ($_ar_CurConvertRate{$_l_CheckVariance}#$_r_Rate)
								$_bo_Variants:=True:C214
							End if 
						End for 
						If ($_bo_Variants)
							ACC_GetTransactions($_at_AcbAccountCodes{$_l_BuildBalances}; $_at_PeriodCodes{$_l_BuildBalances}; $_Ptr_CUrrencyCOdes->{$_l_BuildBalances}; $_at_acbAnalysisCode{$_l_BuildBalances}; $_at_acbLayerCode{$_l_BuildBalances})
							
							SELECTION TO ARRAY:C260([TRANSACTIONS:29]Trans_Date:5; $_ad_TransDate; [TRANSACTIONS:29]Amount:6; $_ar_TransactionAmount; [TRANSACTIONS:29]Tax_Amount:16; $_ar_TaxAmount)
							$_r_Balance:=0
							If (Size of array:C274($_ad_TransDate)>0)
								//FIRST RECORD([TRANSACTIONS])
								For ($_l_index; 1; Size of array:C274($_ad_TransDate))
									$_d_TransactionDate:=$_ad_TransDate{$_l_index}
									$_l_Element:=0
									For ($_l_Index2; 1; Size of array:C274($_ad_CurConvertDate))
										If ($_ad_CurConvertDate{$_l_Index2}<=$_d_TransactionDate)
											$_l_Element:=$_l_Index2
										End if 
									End for 
									If ($_l_Element>0)
										$_r_Rate:=$_ar_CurConvertRate{$_l_Element}
									Else 
										If (Size of array:C274($_ad_CurConvertDate)>0)
											$_r_Rate:=$_ar_CurConvertRate{1}
										Else 
											$_r_Rate:=1
											//something is way wrong  if we end up here!!!
											//TRACE
										End if 
									End if 
									If ($_at_AcbAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
										$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
									Else 
										$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
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
							$_r_TotalBalance:=$_r_TotalBalance+(($_ptr_Amounts->{$_l_BuildBalances}*$_r_Rate))
						End if 
						
					: (Records in selection:C76([CURRENCY_RATES:72])=1)
						$_r_Rate:=[CURRENCY_RATES:72]Rate:3
						$_r_TotalBalance:=$_r_TotalBalance+(($_ptr_Amounts->{$_l_BuildBalances}*$_r_Rate))
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
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_Ptr_CUrrencyCOdes->{$_l_BuildBalances}; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CUrrencyPeriod)
							If (Records in selection:C76([CURRENCY_RATES:72])>0)
								$_l_index:=Records in selection:C76([PERIODS:33])+1
							End if 
							NEXT RECORD:C51([PERIODS:33])
						End for 
						Case of 
							: (Records in selection:C76([CURRENCY_RATES:72])>1)
								SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurConvertDate; [CURRENCY_RATES:72]Rate:3; $_ar_CurConvertRate)
								$_r_Rate:=$_ar_CurConvertRate{1}
								$_bo_Variants:=False:C215
								For ($_l_CheckVariance; 1; Size of array:C274($_ar_CurConvertRate))
									If ($_ar_CurConvertRate{$_l_CheckVariance}#$_r_Rate)
										$_bo_Variants:=True:C214
									End if 
								End for 
								If ($_bo_Variants)
									
									ACC_GetTransactions($_at_AcbAccountCodes{$_l_BuildBalances}; $_at_PeriodCodes{$_l_BuildBalances}; $_Ptr_CUrrencyCOdes->{$_l_BuildBalances}; $_at_acbAnalysisCode{$_l_BuildBalances}; $_at_acbLayerCode{$_l_BuildBalances})
									
									SELECTION TO ARRAY:C260([TRANSACTIONS:29]Trans_Date:5; $_ad_TransDate; [TRANSACTIONS:29]Amount:6; $_ar_TransactionAmount; [TRANSACTIONS:29]Tax_Amount:16; $_ar_TaxAmount)
									$_r_Balance:=0
									If (Size of array:C274($_ad_TransDate)>0)
										//FIRST RECORD([TRANSACTIONS])
										For ($_l_index; 1; Size of array:C274($_ad_TransDate))
											$_d_TransactionDate:=$_ad_TransDate{$_l_index}
											$_l_Element:=0
											For ($_l_Index2; 1; Size of array:C274($_ad_CurConvertDate))
												If ($_ad_CurConvertDate{$_l_Index2}<=$_d_TransactionDate)
													$_l_Element:=$_l_Index2
												End if 
											End for 
											If ($_l_Element>0)
												$_r_Rate:=$_ar_CurConvertRate{$_l_Element}
											Else 
												If (Size of array:C274($_ad_CurConvertDate)>0)
													$_r_Rate:=$_ar_CurConvertRate{1}
												Else 
													$_r_Rate:=1
													//something is way wrong  if we end up here!!!
													//TRACE
												End if 
											End if 
											If ($_at_AcbAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
												$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
											Else 
												$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
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
									$_r_TotalBalance:=$_r_TotalBalance+(($_ptr_Amounts->{$_l_BuildBalances}*$_r_Rate))
								End if 
								
							: (Records in selection:C76([CURRENCY_RATES:72])=1)
								$_r_Rate:=[CURRENCY_RATES:72]Rate:3
								$_r_TotalBalance:=$_r_TotalBalance+(($_ptr_Amounts->{$_l_BuildBalances}*$_r_Rate))
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
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_Ptr_CUrrencyCOdes->{$_l_BuildBalances}; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
									QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CurrencyPeriod)
									If (Records in selection:C76([CURRENCY_RATES:72])>0)
										$_l_index:=Records in selection:C76([PERIODS:33])+1
									End if 
									NEXT RECORD:C51([PERIODS:33])
								End for 
								Case of 
									: (Records in selection:C76([CURRENCY_RATES:72])>1)
										SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurConvertDate; [CURRENCY_RATES:72]Rate:3; $_ar_CurConvertRate)
										$_r_Rate:=$_ar_CurConvertRate{1}
										$_bo_Variants:=False:C215
										For ($_l_CheckVariance; 1; Size of array:C274($_ar_CurConvertRate))
											If ($_ar_CurConvertRate{$_l_CheckVariance}#$_r_Rate)
												$_bo_Variants:=True:C214
											End if 
										End for 
										If ($_bo_Variants)
											// ACC_GetTransactions (HELLO)
											ACC_GetTransactions($_at_AcbAccountCodes{$_l_BuildBalances}; $_at_PeriodCodes{$_l_BuildBalances}; $_Ptr_CUrrencyCOdes->{$_l_BuildBalances}; $_at_acbAnalysisCode{$_l_BuildBalances}; $_at_acbLayerCode{$_l_BuildBalances})
											
											SELECTION TO ARRAY:C260([TRANSACTIONS:29]Trans_Date:5; $_ad_TransDate; [TRANSACTIONS:29]Amount:6; $_ar_TransactionAmount; [TRANSACTIONS:29]Tax_Amount:16; $_ar_TaxAmount)
											$_r_Balance:=0
											
											$_r_Balance:=0
											If (Size of array:C274($_ad_TransDate)>0)
												//FIRST RECORD([TRANSACTIONS])
												For ($_l_index; 1; Size of array:C274($_ad_TransDate))
													$_d_TransactionDate:=$_ad_TransDate{$_l_index}
													$_l_Element:=0
													For ($_l_Index2; 1; Size of array:C274($_ad_CurConvertDate))
														If ($_ad_CurConvertDate{$_l_Index2}<=$_d_TransactionDate)
															$_l_Element:=$_l_Index2
														End if 
													End for 
													If ($_l_Element>0)
														$_r_Rate:=$_ar_CurConvertRate{$_l_Element}
													Else 
														If (Size of array:C274($_ad_CurConvertDate)>0)
															$_r_Rate:=$_ar_CurConvertRate{1}
														Else 
															$_r_Rate:=1
															//something is way wrong  if we end up here!!!
															//TRACE
														End if 
													End if 
													If ($_at_AcbAccountCodes{$_l_BuildBalances}#DB_GetLedgerVatInputACC)
														$_r_ConvertedBalance:=($_ar_TransactionAmount{$_l_index}*$_r_Rate)
													Else 
														$_r_ConvertedBalance:=($_ar_TaxAmount{$_l_index}*$_r_Rate)
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
											$_r_TotalBalance:=$_r_TotalBalance+(($_ptr_Amounts->{$_l_BuildBalances}*$_r_Rate))
										End if 
									: (Records in selection:C76([CURRENCY_RATES:72])=1)
										$_r_Rate:=[CURRENCY_RATES:72]Rate:3
										$_r_TotalBalance:=$_r_TotalBalance+(($_ptr_Amounts->{$_l_BuildBalances}*$_r_Rate))
									Else 
										//TRACE
										$_r_TotalBalance:=$_r_TotalBalance+(($_ptr_Amounts->{$_l_BuildBalances}*1))
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
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_Ptr_CUrrencyCOdes->{$_l_BuildBalances}; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_Currency; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CurrencyPeriod)
				Case of 
					: (Records in selection:C76([CURRENCY_RATES:72])>1)
						ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
						FIRST RECORD:C50([CURRENCY_RATES:72])
						$_r_Rate:=[CURRENCY_RATES:72]Rate:3
						$_r_TotalBalance:=$_r_TotalBalance+(($_ptr_Amounts->{$_l_BuildBalances}*$_r_Rate))
					: (Records in selection:C76([CURRENCY_RATES:72])=1)
						$_r_Rate:=[CURRENCY_RATES:72]Rate:3
						$_r_TotalBalance:=$_r_TotalBalance+(($_ptr_Amounts->{$_l_BuildBalances}*$_r_Rate))
					Else 
						$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
						QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_BuildBalances})
						$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
						QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
						ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
						For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
							$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
							
							
							//now find the rate for this period
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_Ptr_CUrrencyCOdes->{$_l_BuildBalances}; *)
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
								$_r_TotalBalance:=$_r_TotalBalance+(($_ptr_Amounts->{$_l_BuildBalances}*$_r_Rate))
							: (Records in selection:C76([CURRENCY_RATES:72])=1)
								$_r_Rate:=[CURRENCY_RATES:72]Rate:3
								$_r_TotalBalance:=$_r_TotalBalance+(($_ptr_Amounts->{$_l_BuildBalances}*$_r_Rate))
							Else 
								$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_BuildBalances})
								$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
								QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
								For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
									$_l_CUrrencyPeriod:=[PERIODS:33]x_ID:10
									
									
									//now find the rate for this period
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_Ptr_CUrrencyCOdes->{$_l_BuildBalances}; *)
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
										$_r_TotalBalance:=$_r_TotalBalance+(($_ptr_Amounts->{$_l_BuildBalances}*$_r_Rate))
									: (Records in selection:C76([CURRENCY_RATES:72])=1)
										$_r_Rate:=[CURRENCY_RATES:72]Rate:3
										$_r_TotalBalance:=$_r_TotalBalance+($_ptr_Amounts->{$_l_BuildBalances}*$_r_Rate)
									Else 
										//TRACE
										$_r_TotalBalance:=$_r_TotalBalance+($_ptr_Amounts->{$_l_BuildBalances}*1)
										
								End case 
								
								
						End case 
						
				End case 
				
				
				
			End if 
			
			
		End if 
	End if 
End for 
ERR_MethodTrackerReturn("ACC_ConvertValues"; $_t_oldMethodName)