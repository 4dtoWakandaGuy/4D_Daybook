//%attributes = {}
If (False:C215)
	//Project Method Name:      CUR_CalcBalConv
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   02/10/2011 19:46 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_ConvertDate; 0)
	ARRAY REAL:C219($_ar_ConvertRate; 0)
	ARRAY TEXT:C222($_at_CurrencyRatesChecked; 0)
	C_BOOLEAN:C305($_bo_Variants)
	C_DATE:C307($_d_EarliestRateFromDate; $_d_FirstRateFromDate; $_d_LatestPossibleRateFromDate; $_d_PeriodFromDate; $_d_TransactionDate)
	C_LONGINT:C283($_l_AccountBalanceIndex; $_l_CheckVariance; $_l_ConversionIndex; $_l_CurrencyCodeRow; $_l_Dayof; $_l_Element; $_l_TransactionsIndex; $CUR_l_CurrencyPeriod; CUR_l_CurrencyPeriod)
	C_POINTER:C301($1)
	C_REAL:C285($_r_Balance; $_r_BalanceTotal; $_r_ConversionRate; $_r_ConvertedBalance; $_r_Rate; $0)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CUR_CalcBalConv")
//$1 is a pointer to the array of currencies we need to output
//$2 is a string of the OUTPUT currency code
//This routine will  check that the appropriate rates exist
ARRAY TEXT:C222($_at_CurrencyRatesChecked; Size of array:C274($1->))
Case of 
		
	: (Size of array:C274($1->)>1)
		//multiple currency inputs
		ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6)
		FIRST RECORD:C50([ACCOUNT_BALANCES:34])
		//$LastCurrency:=0
		$_r_BalanceTotal:=0
		For ($_l_AccountBalanceIndex; 1; Records in selection:C76([ACCOUNT_BALANCES:34]))
			If ([ACCOUNT_BALANCES:34]Balance:3#0)
				$_l_CurrencyCodeRow:=Find in array:C230($1->; [ACCOUNT_BALANCES:34]Currency_Code:6)
				If ($_l_CurrencyCodeRow>0)
					If ([ACCOUNTS:32]Account_Code:2#[ACCOUNT_BALANCES:34]Account_Code:2)
						QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=[ACCOUNT_BALANCES:34]Account_Code:2)
					End if 
					If ([ACCOUNT_BALANCES:34]Currency_Code:6#$2) & ([ACCOUNT_BALANCES:34]Currency_Code:6#"")
						$_l_CurrencyCodeRow:=Find in array:C230($_at_CurrencyRatesChecked; [ACCOUNT_BALANCES:34]Currency_Code:6)
						If ($_l_CurrencyCodeRow<0)
							$_l_CurrencyCodeRow:=Find in array:C230($_at_CurrencyRatesChecked; "")
							$_at_CurrencyRatesChecked{$_l_CurrencyCodeRow}:=[ACCOUNT_BALANCES:34]Currency_Code:6
							CUR_CheckRate([ACCOUNT_BALANCES:34]Currency_Code:6; $2)
						End if 
						If ([ACCOUNTS:32]Multicurrency_Valuation:10#1)  //value at historic rate
							QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[ACCOUNT_BALANCES:34]Period_Code:4)
							CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
							//now find the rate for this period
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
							
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
										ACC_GetTransactions
										If (Records in selection:C76([TRANSACTIONS:29])>0)
											FIRST RECORD:C50([TRANSACTIONS:29])
											$_r_Balance:=0
											For ($_l_TransactionsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
												$_d_TransactionDate:=[TRANSACTIONS:29]Trans_Date:5
												$_l_Element:=0
												For ($_l_ConversionIndex; 1; Size of array:C274($_ad_ConvertDate))
													If ($_ad_ConvertDate{$_l_ConversionIndex}<=$_d_TransactionDate)
														$_l_Element:=$_l_ConversionIndex
													End if 
												End for 
												If ($_l_Element>0)
													$_r_ConversionRate:=$_ar_ConvertRate{$_l_Element}
												Else 
													If (Size of array:C274($_ad_ConvertDate)>0)
														$_r_ConversionRate:=$_ar_ConvertRate{1}
													Else 
														$_r_ConversionRate:=1
														//something is way wrong  if we end up here!!!
														//TRACE
													End if 
												End if 
												If ([ACCOUNT_BALANCES:34]Account_Code:2#DB_GetLedgerVatInputACC)
													$_r_ConvertedBalance:=([TRANSACTIONS:29]Amount:6*$_r_ConversionRate)
												Else 
													$_r_ConvertedBalance:=([TRANSACTIONS:29]Tax_Amount:16*$_r_ConversionRate)
												End if 
												$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
												NEXT RECORD:C51([TRANSACTIONS:29])
											End for 
											//only round the figures here
											$_r_BalanceTotal:=$_r_BalanceTotal+($_r_Balance)
										Else 
											//no transactions
											//  $_r_BalanceTotal:=0
										End if 
									Else 
										$_r_Rate:=$_r_Rate
										$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
									End if 
								: (Records in selection:C76([CURRENCY_RATES:72])=1)
									$_r_Rate:=[CURRENCY_RATES:72]Rate:3
									$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
								Else 
									//no rates!!!!!!
									//    TRACE
									//use the last rate before that
									QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[ACCOUNT_BALANCES:34]Period_Code:4)
									$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
									QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
									ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
									For ($_l_TransactionsIndex; 1; Records in selection:C76([PERIODS:33]))
										$CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
										//now find the rate for this period
										QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
										QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
										QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
										If (Records in selection:C76([CURRENCY_RATES:72])>0)
											$_l_TransactionsIndex:=Records in selection:C76([PERIODS:33])+1
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
												ACC_GetTransactions
												If (Records in selection:C76([TRANSACTIONS:29])>0)
													FIRST RECORD:C50([TRANSACTIONS:29])
													$_r_Balance:=0
													For ($_l_TransactionsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
														$_d_TransactionDate:=[TRANSACTIONS:29]Trans_Date:5
														$_l_Element:=0
														For ($_l_ConversionIndex; 1; Size of array:C274($_ad_ConvertDate))
															If ($_ad_ConvertDate{$_l_ConversionIndex}<=$_d_TransactionDate)
																$_l_Element:=$_l_ConversionIndex
															End if 
														End for 
														If ($_l_Element>0)
															$_r_ConversionRate:=$_ar_ConvertRate{$_l_Element}
														Else 
															//something is way wrong  if we end up here!!!
															//TRACE
														End if 
														If ([ACCOUNT_BALANCES:34]Account_Code:2#DB_GetLedgerVatInputACC)
															$_r_ConvertedBalance:=([TRANSACTIONS:29]Amount:6*$_r_ConversionRate)
														Else 
															$_r_ConvertedBalance:=([TRANSACTIONS:29]Tax_Amount:16*$_r_ConversionRate)
														End if 
														$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
														NEXT RECORD:C51([TRANSACTIONS:29])
													End for 
													//only round the figures here
													$_r_BalanceTotal:=$_r_BalanceTotal+($_r_Balance)
												Else 
													//no transactions
													//  $_r_BalanceTotal:=0
												End if 
											Else 
												$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
												
											End if 
										: (Records in selection:C76([CURRENCY_RATES:72])=1)
											$_r_Rate:=[CURRENCY_RATES:72]Rate:3
											$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
											
										Else 
											//no rate for that period!
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[ACCOUNT_BALANCES:34]Period_Code:4)
											$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
											QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
											ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
											For ($_l_TransactionsIndex; 1; Records in selection:C76([PERIODS:33]))
												$CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
												//now find the rate for this period
												QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
												QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
												QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
												If (Records in selection:C76([CURRENCY_RATES:72])>0)
													$_l_TransactionsIndex:=Records in selection:C76([PERIODS:33])+1
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
														ACC_GetTransactions
														If (Records in selection:C76([TRANSACTIONS:29])>0)
															FIRST RECORD:C50([TRANSACTIONS:29])
															$_r_Balance:=0
															For ($_l_TransactionsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
																$_d_TransactionDate:=[TRANSACTIONS:29]Trans_Date:5
																$_l_Element:=0
																For ($_l_ConversionIndex; 1; Size of array:C274($_ad_ConvertDate))
																	If ($_ad_ConvertDate{$_l_ConversionIndex}<=$_d_TransactionDate)
																		$_l_Element:=$_l_ConversionIndex
																	End if 
																End for 
																If ($_l_Element>0)
																	$_r_ConversionRate:=$_ar_ConvertRate{$_l_Element}
																Else 
																	//something is way wrong  if we end up here!!!
																	//TRACE
																End if 
																If ([ACCOUNT_BALANCES:34]Account_Code:2#DB_GetLedgerVatInputACC)
																	$_r_ConvertedBalance:=([TRANSACTIONS:29]Amount:6*$_r_ConversionRate)
																Else 
																	$_r_ConvertedBalance:=([TRANSACTIONS:29]Tax_Amount:16*$_r_ConversionRate)
																End if 
																$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
																NEXT RECORD:C51([TRANSACTIONS:29])
															End for 
															//only round the figures here
															$_r_BalanceTotal:=$_r_BalanceTotal+($_r_Balance)
														Else 
															//no transactions
															//  $_r_BalanceTotal:=0
														End if 
													Else 
														$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
														
													End if 
												: (Records in selection:C76([CURRENCY_RATES:72])=1)
													$_r_Rate:=[CURRENCY_RATES:72]Rate:3
													$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
													
												Else 
													//no rate for that period!
													//TRACE
											End case 
											
									End case 
									
							End case 
						Else 
							//value at current rate
							CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
							//now find the rate for this period
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
							Case of 
								: (Records in selection:C76([CURRENCY_RATES:72])>1)
									QUERY SELECTION:C341([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4<=Current date:C33(*))
									ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
									FIRST RECORD:C50([CURRENCY_RATES:72])
									$_r_Rate:=[CURRENCY_RATES:72]Rate:3
									$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
								: (Records in selection:C76([CURRENCY_RATES:72])=1)
									$_r_Rate:=[CURRENCY_RATES:72]Rate:3
									$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
								Else 
									//no rates!!!!!!
									//``
									CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
									QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[ACCOUNT_BALANCES:34]Period_Code:4)
									$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
									QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
									ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
									For ($_l_TransactionsIndex; 1; Records in selection:C76([PERIODS:33]))
										$CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
										
										
										//now find the rate for this period
										QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
										QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
										QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
										If (Records in selection:C76([CURRENCY_RATES:72])>0)
											$_l_TransactionsIndex:=Records in selection:C76([PERIODS:33])+1
										End if 
										NEXT RECORD:C51([PERIODS:33])
									End for 
									
									Case of 
										: (Records in selection:C76([CURRENCY_RATES:72])>1)
											ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
											FIRST RECORD:C50([CURRENCY_RATES:72])
											$_r_Rate:=[CURRENCY_RATES:72]Rate:3
											$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
										: (Records in selection:C76([CURRENCY_RATES:72])=1)
											$_r_Rate:=[CURRENCY_RATES:72]Rate:3
											$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
										Else 
											CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[ACCOUNT_BALANCES:34]Period_Code:4)
											$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
											QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
											ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
											For ($_l_TransactionsIndex; 1; Records in selection:C76([PERIODS:33]))
												$CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
												
												
												//now find the rate for this period
												QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
												QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
												QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
												If (Records in selection:C76([CURRENCY_RATES:72])>0)
													$_l_TransactionsIndex:=Records in selection:C76([PERIODS:33])+1
												End if 
												NEXT RECORD:C51([PERIODS:33])
											End for 
											
											Case of 
												: (Records in selection:C76([CURRENCY_RATES:72])>1)
													ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
													FIRST RECORD:C50([CURRENCY_RATES:72])
													$_r_Rate:=[CURRENCY_RATES:72]Rate:3
													$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
												: (Records in selection:C76([CURRENCY_RATES:72])=1)
													$_r_Rate:=[CURRENCY_RATES:72]Rate:3
													$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
												Else 
											End case 
											
									End case 
									
									
									//``
									//
							End case 
							
							
						End if 
					Else 
						$_r_BalanceTotal:=(($_r_BalanceTotal+[ACCOUNT_BALANCES:34]Balance:3))
					End if 
				End if   //currency not included
			End if 
			NEXT RECORD:C51([ACCOUNT_BALANCES:34])
		End for 
		
	Else 
		//only one currency input
		If (Size of array:C274($1->)>0)
			If ($1->{1}#$2) & ($1->{1}#"")
				FIRST RECORD:C50([ACCOUNT_BALANCES:34])
				$_r_Balance:=0
				For ($_l_AccountBalanceIndex; 1; Records in selection:C76([ACCOUNT_BALANCES:34]))
					If ([ACCOUNT_BALANCES:34]Balance:3#0)
						If ([ACCOUNTS:32]Account_Code:2#[ACCOUNT_BALANCES:34]Account_Code:2)
							QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=[ACCOUNT_BALANCES:34]Account_Code:2)
						End if 
						$_l_CurrencyCodeRow:=Find in array:C230($_at_CurrencyRatesChecked; [ACCOUNT_BALANCES:34]Currency_Code:6)
						If ($_l_CurrencyCodeRow<0)
							$_l_CurrencyCodeRow:=Find in array:C230($_at_CurrencyRatesChecked; "")
							$_at_CurrencyRatesChecked{$_l_CurrencyCodeRow}:=[ACCOUNT_BALANCES:34]Currency_Code:6
							CUR_CheckRate([ACCOUNT_BALANCES:34]Currency_Code:6; $2)
						End if 
						
						If ([ACCOUNTS:32]Multicurrency_Valuation:10#1)  //value at historic rate
							QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[ACCOUNT_BALANCES:34]Period_Code:4)
							CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
							//now find the rate for this period
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
							
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
										ACC_GetTransactions
										
										$_r_Balance:=0
										If (Records in selection:C76([TRANSACTIONS:29])>0)
											FIRST RECORD:C50([TRANSACTIONS:29])
											For ($_l_TransactionsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
												$_d_TransactionDate:=[TRANSACTIONS:29]Trans_Date:5
												$_l_Element:=0
												For ($_l_ConversionIndex; 1; Size of array:C274($_ad_ConvertDate))
													If ($_ad_ConvertDate{$_l_ConversionIndex}<=$_d_TransactionDate)
														$_l_Element:=$_l_ConversionIndex
													End if 
												End for 
												If ($_l_Element>0)
													$_r_ConversionRate:=$_ar_ConvertRate{$_l_Element}
												Else 
													If (Size of array:C274($_ad_ConvertDate)>0)
														$_r_ConversionRate:=$_ar_ConvertRate{1}
													Else 
														$_r_ConversionRate:=1
														//something is way wrong  if we end up here!!!
														//TRACE
													End if 
												End if 
												If ([ACCOUNT_BALANCES:34]Account_Code:2#DB_GetLedgerVatInputACC)
													$_r_ConvertedBalance:=([TRANSACTIONS:29]Amount:6*$_r_ConversionRate)
												Else 
													$_r_ConvertedBalance:=([TRANSACTIONS:29]Tax_Amount:16*$_r_ConversionRate)
												End if 
												$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
												NEXT RECORD:C51([TRANSACTIONS:29])
											End for 
											$_r_BalanceTotal:=$_r_BalanceTotal+($_r_Balance)
										Else 
											//no transactions
											// $_r_BalanceTotal:=0
										End if 
									Else 
										//although there are multiple rate record the rate is the same on them
										$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
									End if 
									
								: (Records in selection:C76([CURRENCY_RATES:72])=1)
									$_r_Rate:=[CURRENCY_RATES:72]Rate:3
									$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
								Else 
									//no rates!!!!!!
									//    TRACE
									//use the last rate before that
									QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[ACCOUNT_BALANCES:34]Period_Code:4)
									$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
									QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
									ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
									For ($_l_TransactionsIndex; 1; Records in selection:C76([PERIODS:33]))
										$CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
										//now find the rate for this period
										QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
										QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
										QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
										If (Records in selection:C76([CURRENCY_RATES:72])>0)
											$_l_TransactionsIndex:=Records in selection:C76([PERIODS:33])+1
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
												ACC_GetTransactions
												$_r_Balance:=0
												If (Records in selection:C76([TRANSACTIONS:29])>0)
													FIRST RECORD:C50([TRANSACTIONS:29])
													For ($_l_TransactionsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
														$_d_TransactionDate:=[TRANSACTIONS:29]Trans_Date:5
														$_l_Element:=0
														For ($_l_ConversionIndex; 1; Size of array:C274($_ad_ConvertDate))
															If ($_ad_ConvertDate{$_l_ConversionIndex}<=$_d_TransactionDate)
																$_l_Element:=$_l_ConversionIndex
															End if 
														End for 
														If ($_l_Element>0)
															$_r_ConversionRate:=$_ar_ConvertRate{$_l_Element}
														Else 
															//something is way wrong  if we end up here!!!
															//TRACE
														End if 
														If ([ACCOUNT_BALANCES:34]Account_Code:2#DB_GetLedgerVatInputACC)
															$_r_ConvertedBalance:=([TRANSACTIONS:29]Amount:6*$_r_ConversionRate)
														Else 
															$_r_ConvertedBalance:=([TRANSACTIONS:29]Tax_Amount:16*$_r_ConversionRate)
														End if 
														$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
														NEXT RECORD:C51([TRANSACTIONS:29])
													End for 
													$_r_BalanceTotal:=$_r_BalanceTotal+($_r_Balance)
												Else 
													//no transactions
													// $_r_BalanceTotal:=0
												End if 
											Else 
												$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
											End if 
											
										: (Records in selection:C76([CURRENCY_RATES:72])=1)
											$_r_Rate:=[CURRENCY_RATES:72]Rate:3
											$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
										Else 
											//no rates!!!!!!
											//    TRACE
											//use the last rate before that
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[ACCOUNT_BALANCES:34]Period_Code:4)
											$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
											QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
											ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
											For ($_l_TransactionsIndex; 1; Records in selection:C76([PERIODS:33]))
												$CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
												//now find the rate for this period
												QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
												QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
												QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
												If (Records in selection:C76([CURRENCY_RATES:72])>0)
													$_l_TransactionsIndex:=Records in selection:C76([PERIODS:33])+1
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
														$_r_Balance:=0
														If (Records in selection:C76([TRANSACTIONS:29])>0)
															FIRST RECORD:C50([TRANSACTIONS:29])
															For ($_l_TransactionsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
																$_d_TransactionDate:=[TRANSACTIONS:29]Trans_Date:5
																$_l_Element:=0
																For ($_l_ConversionIndex; 1; Size of array:C274($_ad_ConvertDate))
																	If ($_ad_ConvertDate{$_l_ConversionIndex}<=$_d_TransactionDate)
																		$_l_Element:=$_l_ConversionIndex
																	End if 
																End for 
																If ($_l_Element>0)
																	$_r_ConversionRate:=$_ar_ConvertRate{$_l_Element}
																Else 
																	//something is way wrong  if we end up here!!!
																	//TRACE
																End if 
																If ([ACCOUNT_BALANCES:34]Account_Code:2#DB_GetLedgerVatInputACC)
																	$_r_ConvertedBalance:=([TRANSACTIONS:29]Amount:6*$_r_ConversionRate)
																Else 
																	$_r_ConvertedBalance:=([TRANSACTIONS:29]Tax_Amount:16*$_r_ConversionRate)
																End if 
																$_r_Balance:=$_r_Balance+$_r_ConvertedBalance
																NEXT RECORD:C51([TRANSACTIONS:29])
															End for 
															$_r_BalanceTotal:=$_r_BalanceTotal+($_r_Balance)
														Else 
															//no transactions
															// $_r_BalanceTotal:=0
														End if 
													Else 
														$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
													End if 
												: (Records in selection:C76([CURRENCY_RATES:72])=1)
													$_r_Rate:=[CURRENCY_RATES:72]Rate:3
													$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
												Else 
													//TRACE
													
											End case 
									End case 
									
							End case 
						Else 
							//value at current rate
							CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
							//now find the rate for this period
							If (CUR_l_CurrencyPeriod=0)
								ALL RECORDS:C47([PERIODS:33])
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
								FIRST RECORD:C50([PERIODS:33])
								$_d_EarliestRateFromDate:=[PERIODS:33]From_Date:3
								$_d_LatestPossibleRateFromDate:=Current date:C33(*)
								Repeat 
									IDLE:C311
									$_l_Dayof:=Day of:C23($_d_LatestPossibleRateFromDate)
									$_d_FirstRateFromDate:=$_d_LatestPossibleRateFromDate-($_l_Dayof-1)
									$_d_LatestPossibleRateFromDate:=$_d_FirstRateFromDate-1
									CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24($_d_LatestPossibleRateFromDate); Year of:C25($_d_LatestPossibleRateFromDate)))
								Until (CUR_l_CurrencyPeriod>0) | ($_d_LatestPossibleRateFromDate<$_d_EarliestRateFromDate)
							End if 
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
							Case of 
								: (Records in selection:C76([CURRENCY_RATES:72])>1)
									ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
									FIRST RECORD:C50([CURRENCY_RATES:72])
									$_r_Rate:=[CURRENCY_RATES:72]Rate:3
									$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
								: (Records in selection:C76([CURRENCY_RATES:72])=1)
									$_r_Rate:=[CURRENCY_RATES:72]Rate:3
									$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
								Else 
									CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
									QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[ACCOUNT_BALANCES:34]Period_Code:4)
									$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
									QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<$_d_PeriodFromDate)
									ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
									For ($_l_TransactionsIndex; 1; Records in selection:C76([PERIODS:33]))
										$CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
										
										
										//now find the rate for this period
										QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
										QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
										QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
										If (Records in selection:C76([CURRENCY_RATES:72])>0)
											$_l_TransactionsIndex:=Records in selection:C76([PERIODS:33])+1
										End if 
										NEXT RECORD:C51([PERIODS:33])
									End for 
									Case of 
										: (Records in selection:C76([CURRENCY_RATES:72])>1)
											ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
											FIRST RECORD:C50([CURRENCY_RATES:72])
											$_r_Rate:=[CURRENCY_RATES:72]Rate:3
											$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
										: (Records in selection:C76([CURRENCY_RATES:72])=1)
											$_r_Rate:=[CURRENCY_RATES:72]Rate:3
											$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
										Else 
											CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[ACCOUNT_BALANCES:34]Period_Code:4)
											$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
											QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>$_d_PeriodFromDate)
											ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
											For ($_l_TransactionsIndex; 1; Records in selection:C76([PERIODS:33]))
												$CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
												
												
												//now find the rate for this period
												QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
												QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
												QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
												If (Records in selection:C76([CURRENCY_RATES:72])>0)
													$_l_TransactionsIndex:=Records in selection:C76([PERIODS:33])+1
												End if 
												NEXT RECORD:C51([PERIODS:33])
											End for 
											Case of 
												: (Records in selection:C76([CURRENCY_RATES:72])>1)
													ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
													FIRST RECORD:C50([CURRENCY_RATES:72])
													$_r_Rate:=[CURRENCY_RATES:72]Rate:3
													$_r_BalanceTotal:=$_r_BalanceTotal+(([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate))
												: (Records in selection:C76([CURRENCY_RATES:72])=1)
													$_r_Rate:=[CURRENCY_RATES:72]Rate:3
													$_r_BalanceTotal:=$_r_BalanceTotal+([ACCOUNT_BALANCES:34]Balance:3*$_r_Rate)
												Else 
													//TRACE
													
											End case 
											
											
									End case 
									
							End case 
							
						End if 
					End if 
					NEXT RECORD:C51([ACCOUNT_BALANCES:34])
					
				End for 
				$_r_BalanceTotal:=Gen_Round($_r_BalanceTotal; 2; 2)
			Else   //the output currency is not converting
				$_r_BalanceTotal:=Sum:C1([ACCOUNT_BALANCES:34]Balance:3)
				$_r_BalanceTotal:=Gen_Round($_r_BalanceTotal; 2; 2)
			End if 
		End if 
		
End case 

$0:=$_r_BalanceTotal
ERR_MethodTrackerReturn("CUR_CalcBalConv"; $_t_oldMethodName)