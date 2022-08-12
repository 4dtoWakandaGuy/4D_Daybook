//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ProfitCalculatorNEW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 11:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_abo_BalProfitCalculated;0)
	//ARRAY REAL(ACC_ar_BalAccountDetailsAmount;0)
	//ARRAY REAL(ACC_ar_BalConvertedACCPrfTotals;0)
	//ARRAY REAL(ACC_ar_BalConvertedAccTotals;0)
	//ARRAY REAL(ACC_ar_BalConvertedAmounts;0)
	//ARRAY REAL(ACC_ar_BalCurrencyTotalAmounts;0)
	//ARRAY REAL(ACC_ar_BalOuptutAccountBalance;0)
	//ARRAY REAL(ACC_ar_NotPLBalance;0)
	//ARRAY REAL(ACC_ar_OutputACCprofBalance;0)
	//ARRAY REAL(ACC_ar_BalConvertedProfitAmount;0)
	ARRAY TEXT:C222($_at_ProfitAccounts; 0)
	//ARRAY TEXT(ACC_at_BalAccountCodes;0)
	//ARRAY TEXT(ACC_at_BalAccountIdentity;0)
	//ARRAY TEXT(ACC_at_BalAccountPLString;0)
	//ARRAY TEXT(ACC_at_BalAnalysisCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyDetailsCode;0)
	//ARRAY TEXT(ACC_at_BalCurrencyTotalsCC;0)
	//ARRAY TEXT(ACC_at_BalLayerCodes;0)
	//ARRAY TEXT(ACC_at_BalPeriodCodes;0)
	C_BOOLEAN:C305($_bo_ProfitsPosted)
	C_DATE:C307($_d_YearDateFrom)
	C_LONGINT:C283($_l_AccountBalanceRow; $_l_AccountCodeRow; $_l_AnalysisRow; $_l_CurrencyRow; $_l_Index; $_l_InsertRowPoint; $_l_PeriodCodeRow; $_l_PhantomAccountRow; $_l_ProfitsCounted; $_l_ProfitType; $_l_ProfNotCalcedRow)
	C_LONGINT:C283($_l_SearchFromRow)
	C_REAL:C285($_r_AdjustedTotal; $_r_Difference; $_r_ProfitTotal; $_r_ProfitTotalAdjusted; $_r_Total)
	C_TEXT:C284($_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $_t_PeriodCode; $_t_PhantomProfitString; $_t_ProfitUniqueString; $_t_YearPeriodFrom; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_ProfitCalculatorNEW")
//ACC_PROFITCALCULATOR
If (Count parameters:C259>=1)
	$_t_YearPeriodFrom:=$1
	READ ONLY:C145([PERIODS:33])
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_YearPeriodFrom)
	$_d_YearDateFrom:=[PERIODS:33]From_Date:3
	UNLOAD RECORD:C212([PERIODS:33])
	
	ARRAY TEXT:C222($_at_ProfitAccounts; 0)
	QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="P")
	SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; $_at_ProfitAccounts)
	$_bo_ProfitsPosted:=False:C215
	$_r_Difference:=0
	$_l_SearchFromRow:=1
	
	Repeat 
		
		ERASE WINDOW:C160
		MESSAGE:C88("Checking Profits and Losses")
		$_l_AccountCodeRow:=Find in array:C230(ACC_at_BalAccountCodes; DB_GetLedgerProfitACC; $_l_SearchFromRow)
		$_l_SearchFromRow:=$_l_AccountCodeRow+1
		If ($_l_AccountCodeRow>0)
			MESSAGE:C88(Char:C90(13)+"Checking Period "+ACC_at_BalPeriodCodes{$_l_AccountCodeRow}+"  "+ACC_at_BalAnalysisCodes{$_l_AccountCodeRow})
			$_t_AnalysisCode:=ACC_at_BalAnalysisCodes{$_l_AccountCodeRow}
			$_t_PeriodCode:=ACC_at_BalPeriodCodes{$_l_AccountCodeRow}
			$_l_ProfitsCounted:=0
			$_r_ProfitTotal:=0
			$_r_ProfitTotalAdjusted:=0
			$_t_LayerCode:=ACC_at_BalLayerCodes{$_l_AccountCodeRow}
			$_t_CurrencyCode:=ACC_at_BalCurrencyCodes{$_l_AccountCodeRow}
			$_r_Total:=0
			$_r_AdjustedTotal:=0
			$_l_PeriodCodeRow:=Find in array:C230(ACC_at_BalPeriodCodes; $_t_PeriodCode)
			If ($_l_PeriodCodeRow>0)
				For ($_l_Index; $_l_PeriodCodeRow; Size of array:C274(ACC_at_BalAccountIdentity))
					
					
					$_l_AnalysisRow:=Find in array:C230(ACC_at_BalAnalysisCodes; $_t_AnalysisCode; $_l_Index)
					If ($_l_AnalysisRow>0)
						$_l_Index:=$_l_AnalysisRow
						
						$_l_CurrencyRow:=Find in array:C230(ACC_at_BalCurrencyCodes; $_t_CurrencyCode; $_l_Index)
						If ($_l_CurrencyRow>0)
							$_l_Index:=$_l_CurrencyRow
							
							$_l_ProfNotCalcedRow:=Find in array:C230(ACC_abo_BalProfitCalculated; False:C215; $_l_Index)
							If ($_l_ProfNotCalcedRow>0)
								$_l_Index:=$_l_ProfNotCalcedRow
								
							Else 
								$_l_Index:=Size of array:C274(ACC_at_BalAccountIdentity)
							End if 
						Else 
							$_l_Index:=Size of array:C274(ACC_at_BalAccountIdentity)
						End if 
					Else 
						$_l_Index:=Size of array:C274(ACC_at_BalAccountIdentity)
					End if 
					
					
					
					If (ACC_at_BalPeriodCodes{$_l_Index}=$_t_PeriodCode)
						
						If (ACC_at_BalAccountCodes{$_l_AccountCodeRow}#ACC_at_BalAccountCodes{$_l_Index}) & (DB_GetLedgerBroughtforwardACC#ACC_at_BalAccountCodes{$_l_Index})
							If (ACC_at_BalAnalysisCodes{$_l_Index}=$_t_AnalysisCode) & (ACC_at_BalLayerCodes{$_l_Index}=$_t_LayerCode) & (ACC_at_BalCurrencyCodes{$_l_Index}=$_t_CurrencyCode) & (ACC_abo_BalProfitCalculated{$_l_Index}=False:C215)
								$_l_AccountBalanceRow:=Find in array:C230($_at_ProfitAccounts; ACC_at_BalAccountCodes{$_l_Index})
								If ($_l_AccountBalanceRow<0)
									ACC_abo_BalProfitCalculated{$_l_Index}:=True:C214
									$_r_ProfitTotal:=$_r_ProfitTotal+ACC_ar_BalOuptutAccountBalance{$_l_Index}
									If ($_l_Index>Size of array:C274(ACC_ar_OutputACCprofBalance))
										ARRAY REAL:C219(ACC_ar_OutputACCprofBalance; $_l_Index)
									End if 
									$_r_ProfitTotalAdjusted:=$_r_ProfitTotalAdjusted+ACC_ar_OutputACCprofBalance{$_l_Index}
									$_r_Total:=$_r_Total+ACC_ar_BalOuptutAccountBalance{$_l_Index}
									$_r_AdjustedTotal:=$_r_AdjustedTotal+ACC_ar_OutputACCprofBalance{$_l_Index}
									$_l_ProfitsCounted:=$_l_ProfitsCounted+1
								Else 
									$_l_ProfitsCounted:=$_l_ProfitsCounted+1
								End if 
							End if 
						End if 
					Else 
						$_l_Index:=Size of array:C274(ACC_at_BalAccountIdentity)
					End if 
				End for 
				If ($_r_Total=0) & ($_l_ProfitsCounted>0)
					$_r_Total:=$_r_ProfitTotal
					$_r_AdjustedTotal:=$_r_ProfitTotalAdjusted
				End if 
				
				If ($_l_ProfitsCounted=0)
					For ($_l_Index; $_l_PeriodCodeRow; Size of array:C274(ACC_at_BalAccountIdentity))
						
						
						$_l_AccountCodeRow:=Find in array:C230(ACC_at_BalAnalysisCodes; $_t_AnalysisCode; $_l_Index)
						If ($_l_AccountCodeRow>0)
							$_l_Index:=$_l_AccountCodeRow
							
							$_l_AccountCodeRow:=Find in array:C230(ACC_at_BalCurrencyCodes; $_t_CurrencyCode; $_l_Index)
							If ($_l_AccountCodeRow>0)
								$_l_Index:=$_l_AccountCodeRow
								
								$_l_AccountCodeRow:=Find in array:C230(ACC_abo_BalProfitCalculated; False:C215; $_l_Index)
								If ($_l_AccountCodeRow>0)
									$_l_Index:=$_l_AccountCodeRow
									
								Else 
									$_l_Index:=Size of array:C274(ACC_at_BalAccountIdentity)
								End if 
							Else 
								$_l_Index:=Size of array:C274(ACC_at_BalAccountIdentity)
							End if 
							
						Else 
							$_l_Index:=Size of array:C274(ACC_at_BalAccountIdentity)
						End if 
						
						If (ACC_at_BalPeriodCodes{$_l_Index}=$_t_PeriodCode)
							If (ACC_at_BalAccountCodes{$_l_AccountCodeRow}#ACC_at_BalAccountCodes{$_l_Index}) & (DB_GetLedgerBroughtforwardACC#ACC_at_BalAccountCodes{$_l_Index})
								If (ACC_at_BalAnalysisCodes{$_l_Index}=$_t_AnalysisCode) & (ACC_at_BalLayerCodes{$_l_Index}=$_t_LayerCode) & (ACC_at_BalCurrencyCodes{$_l_Index}=$_t_CurrencyCode) & (ACC_abo_BalProfitCalculated{$_l_Index}=False:C215)
									ACC_abo_BalProfitCalculated{$_l_Index}:=True:C214
									$_r_Total:=$_r_Total+ACC_ar_BalOuptutAccountBalance{$_l_Index}
									If ($_l_Index>Size of array:C274(ACC_ar_OutputACCprofBalance))
										ARRAY REAL:C219(ACC_ar_OutputACCprofBalance; $_l_Index)
									End if 
									$_r_AdjustedTotal:=$_r_AdjustedTotal+ACC_ar_OutputACCprofBalance{$_l_Index}
									$_l_ProfitsCounted:=$_l_ProfitsCounted+1
								End if 
							End if 
						Else 
							
						End if 
					End for 
				End if 
				If ($_l_ProfitsCounted>0)
					$_bo_ProfitsPosted:=True:C214
				End if 
				If (ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}#0)
					If (ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}#(-$_r_Total))
					End if 
				End if 
				If ($_r_Total#$_r_AdjustedTotal)
					//this is an account from a previous year, converted to sterling, although the acc
					//account is converted at the current rate
					//the PROFIT should be at the 'historical rate' at the end of the last end of year
					//the DIFFERENCE will go on the PLYT for this year
					// if it is not from a previous year the balance sheet accounts will not match the profit sheet accounts.
					//the amount will need to show as follows
					//ON The TB-show and additonal line of the PLYT adjustment(because the profit figure is not displayed)
					//On the Profit report(P&L) ensure the REAL profit is displayed(ie the sum of profit.
					$_r_Difference:=$_r_Difference+($_r_Total-$_r_AdjustedTotal)
					
					
					//note difference is ALREADY INVERTED
					ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}:=Round:C94((-$_r_Total); 2)
					If (True:C214)
						$_r_Total:=$_r_AdjustedTotal
					End if 
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_at_BalPeriodCodes{$_l_AccountCodeRow})
					If ($_d_YearDateFrom<=[PERIODS:33]From_Date:3)
						$_l_ProfitType:=2  //Current year=P&L
					Else 
						$_l_ProfitType:=1  // Previous Years BFWD
					End if 
					If ($_l_ProfitType=1)
						$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_AccountCodeRow}; ACC_at_BalPeriodCodes{$_l_AccountCodeRow}; ACC_at_BalLayerCodes{$_l_AccountCodeRow}; ACC_at_BalCurrencyCodes{$_l_AccountCodeRow})
					Else 
						$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerProfitACC; ACC_at_BalAnalysisCodes{$_l_AccountCodeRow}; ACC_at_BalPeriodCodes{$_l_AccountCodeRow}; ACC_at_BalLayerCodes{$_l_AccountCodeRow}; ACC_at_BalCurrencyCodes{$_l_AccountCodeRow})
					End if 
					
					$_l_AccountBalanceRow:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
					
					If ($_l_AccountBalanceRow<0)
						//create the phantom
						If ($_l_ProfitType=1)
							$_t_ProfitUniqueString:=ACC_Buildunique(DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_AccountCodeRow}; ACC_at_BalPeriodCodes{$_l_AccountCodeRow}; ACC_at_BalLayerCodes{$_l_AccountCodeRow}; ACC_at_BalCurrencyCodes{$_l_AccountCodeRow})
						Else 
							$_t_ProfitUniqueString:=ACC_Buildunique(DB_GetLedgerProfitACC; ACC_at_BalAnalysisCodes{$_l_AccountCodeRow}; ACC_at_BalPeriodCodes{$_l_AccountCodeRow}; ACC_at_BalLayerCodes{$_l_AccountCodeRow}; ACC_at_BalCurrencyCodes{$_l_AccountCodeRow})
							
						End if 
						$_l_PhantomAccountRow:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_ProfitUniqueString)
						If ($_l_PhantomAccountRow>0)
							
						Else 
							
						End if   //if its not we are in real trouble!!!!
						If ($_l_PhantomAccountRow>0)
							$_l_InsertRowPoint:=$_l_PhantomAccountRow+1
							If ($_l_PhantomAccountRow<$_l_AccountCodeRow)
								$_l_AccountCodeRow:=$_l_AccountCodeRow+1
								$_l_SearchFromRow:=$_l_SearchFromRow+1
							End if 
							// /////////
							INSERT IN ARRAY:C227(ACC_at_BalAccountIdentity; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_at_BalAccountCodes; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_at_BalAnalysisCodes; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_at_BalPeriodCodes; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_at_BalLayerCodes; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_at_BalCurrencyCodes; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_at_BalAccountPLString; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_ar_BalAccountDetailsAmount; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_at_BalCurrencyDetailsCode; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_ar_BalConvertedAmounts; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_ar_BalConvertedProfitAmount; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_ar_BalCurrencyTotalAmounts; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_at_BalCurrencyTotalsCC; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_ar_BalConvertedAccTotals; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_ar_BalConvertedACCPrfTotals; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_ar_BalOuptutAccountBalance; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_ar_OutputACCprofBalance; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_abo_BalProfitCalculated; $_l_InsertRowPoint; 1)
							INSERT IN ARRAY:C227(ACC_ar_NotPLBalance; $_l_InsertRowPoint; 1)
							ACC_at_BalAccountIdentity{$_l_InsertRowPoint}:=$_t_PhantomProfitString
							If ($_l_ProfitType=1)
								ACC_at_BalAccountCodes{$_l_InsertRowPoint}:="-"+DB_GetLedgerBroughtforwardACC
							Else 
								ACC_at_BalAccountCodes{$_l_InsertRowPoint}:="-"+DB_GetLedgerProfitACC
							End if 
							
							ACC_at_BalAnalysisCodes{$_l_InsertRowPoint}:=ACC_at_BalAnalysisCodes{$_l_AccountCodeRow}
							ACC_at_BalPeriodCodes{$_l_InsertRowPoint}:=ACC_at_BalPeriodCodes{$_l_AccountCodeRow}
							ACC_at_BalLayerCodes{$_l_InsertRowPoint}:=ACC_at_BalLayerCodes{$_l_AccountCodeRow}
							ACC_at_BalCurrencyCodes{$_l_InsertRowPoint}:=ACC_at_BalCurrencyCodes{$_l_AccountCodeRow}
							ACC_at_BalAccountPLString{$_l_InsertRowPoint}:=$_t_PhantomProfitString
							$_l_AccountBalanceRow:=$_l_InsertRowPoint
							//`.........
						End if 
					End if 
					If ($_l_AccountBalanceRow>0)  //it should be!!!
						ACC_ar_BalOuptutAccountBalance{$_l_AccountBalanceRow}:=ACC_ar_BalOuptutAccountBalance{$_l_AccountBalanceRow}+Round:C94((-$_r_Difference); 2)
						$_r_Difference:=0
					End if 
				Else 
					ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}:=Round:C94((-$_r_Total); 2)
				End if 
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_at_BalPeriodCodes{$_l_AccountCodeRow})
				If ($_d_YearDateFrom<=[PERIODS:33]From_Date:3)
					$_l_ProfitType:=2  //Current year=P&L
				Else 
					$_l_ProfitType:=1  // Previous Years BFWD
				End if 
				If ($_l_ProfitType=1)
					$_t_ProfitUniqueString:=ACC_Buildunique(DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_AccountCodeRow}; ACC_at_BalPeriodCodes{$_l_AccountCodeRow}; ACC_at_BalLayerCodes{$_l_AccountCodeRow}; ACC_at_BalCurrencyCodes{$_l_AccountCodeRow})
					
				Else 
					$_t_ProfitUniqueString:=ACC_Buildunique(DB_GetLedgerProfitACC; ACC_at_BalAnalysisCodes{$_l_AccountCodeRow}; ACC_at_BalPeriodCodes{$_l_AccountCodeRow}; ACC_at_BalLayerCodes{$_l_AccountCodeRow}; ACC_at_BalCurrencyCodes{$_l_AccountCodeRow})
					
				End if 
				$_l_PhantomAccountRow:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_ProfitUniqueString)
				If ($_l_PhantomAccountRow>0)
					If (ACC_at_BalPeriodCodes{$_l_PhantomAccountRow}<$_t_YearPeriodFrom)
						$_r_Total:=$_r_Total+(ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow})
						ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}:=Round:C94((-$_r_Total); 2)
						If (ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}#0)
							Case of 
								: (ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}<0)
									If (ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}#ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow})
										ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}:=ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}+ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}
									End if 
									ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}:=0
								: (ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}>0)
									If (ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow})#(ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow})
										ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}:=ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}+ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}
									End if 
									ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}:=0
								Else 
									If ($_l_ProfitsCounted>0)
										$_bo_ProfitsPosted:=True:C214
									End if 
									If ($_l_ProfitsCounted=0) & (ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}#0)
										If ($_bo_ProfitsPosted=True:C214)
											ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}:=ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}
										End if 
									End if 
							End case 
							
							
						Else 
							If (ACC_at_BalPeriodCodes{$_l_AccountCodeRow}<$_t_YearPeriodFrom)
								If (ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}<0)
									ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}:=ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}
									ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}:=0
								Else 
									ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}:=ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}
									ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}:=0
								End if 
							End if 
						End if 
						//``
					Else 
						//current year
						//$_l_PhantomAccountRow is the
						$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerProfitACC; ACC_at_BalAnalysisCodes{$_l_AccountCodeRow}; ACC_at_BalPeriodCodes{$_l_AccountCodeRow}; ACC_at_BalLayerCodes{$_l_AccountCodeRow}; ACC_at_BalCurrencyCodes{$_l_AccountCodeRow})
						$_l_PhantomAccountRow:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
						If ($_l_PhantomAccountRow>0)
							$_r_Total:=$_r_Total+(ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow})
							ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}:=Round:C94((-$_r_Total); 2)
						End if 
						If (ACC_ar_NotPLBalance{$_l_AccountCodeRow}#0)
							ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}:=ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}-(ACC_ar_NotPLBalance{$_l_AccountCodeRow})
						End if 
					End if 
					
					
					
				End if 
			End if 
		End if 
		
		
	Until ($_l_AccountCodeRow<0)
End if 
ERR_MethodTrackerReturn("ACC_ProfitCalculatorNEW"; $_t_oldMethodName)