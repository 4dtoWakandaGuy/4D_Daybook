//%attributes = {}

If (False:C215)
	//Project Method Name:      ACC_CheckPLentries
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_abo_BalProfitCalculated;0)
	//ARRAY REAL(ACC_ar_BalAccountDetailsAmount;0)
	//ARRAY REAL(ACC_ar_BalConvertedAccTotals;0)
	//ARRAY REAL(ACC_ar_BalConvertedAmounts;0)
	//ARRAY REAL(ACC_ar_BalCurrencyTotalAmounts;0)
	//ARRAY REAL(ACC_ar_BalOuptutAccountBalance;0)
	//ARRAY REAL(ACC_ar_CurrentBalance;0)
	//ARRAY REAL(ACC_ar_NotPLBalance;0)
	//ARRAY REAL(ACC_ar_OutputACCprofBalance;0)
	ARRAY TEXT:C222($_at_BalAccountPLString; 0)
	//ARRAY TEXT(ACC_at_BalAccountCodes;0)
	//ARRAY TEXT(ACC_at_BalAccountIdentity;0)
	//ARRAY TEXT(ACC_at_BalAccountPLString;0)
	//ARRAY TEXT(ACC_at_BalAnalysisCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyDetailsCode;0)
	//ARRAY TEXT(ACC_at_BalCurrencyTotalsCC;0)
	//ARRAY TEXT(ACC_at_BalLayerCodes;0)
	//ARRAY TEXT(ACC_at_BalPeriodCodes;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled)
	C_LONGINT:C283($_l_BalancePeriodRow; $_l_BalancePLPosition; $_l_IdentityPosition; $_l_Index; $_l_InsertRow; $_l_PeriodEnds; $_l_PeriodStarts; $_l_StartAt; $_l_BalanceIndex; $_l_BalancePeriodRow; $_l_BalancePLPosition)
	C_LONGINT:C283($_l_IdentityPosition; $_l_Index; $_l_InsertRow; $_l_PeriodEnds; $_l_PeriodStarts; $_l_StartAt)
	C_TEXT:C284($_t_LastPeriod; $_t_oldMethodName; $_t_YearPeriodFrom; $1; $_t_BFUniqueIdentity; $_t_LastPeriod; $_t_oldMethodName; $_t_YearPeriodFrom; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_CheckPLentries")

//ACC_CHECKPLENTIRES
$_t_oldMethodName:=ERR_MethodTracker("ACC_CheckPLentries")
If (Count parameters:C259>=1)
	$_t_YearPeriodFrom:=$1
Else 
	$_t_YearPeriodFrom:=ACC_GetYearStart(Current date:C33(*))
End if 

$_t_LastPeriod:=""
$_l_Index:=0
ARRAY TEXT:C222($_at_BalAccountPLString; 0)
Repeat 
	//IDLE
	$_l_Index:=$_l_Index+1
	$_l_PeriodStarts:=0
	ERASE WINDOW:C160
	If ($_l_Index<=Size of array:C274(ACC_at_BalAccountPLString))
		MESSAGE:C88(Char:C90(13)+"Checking P&L Postings "+Char:C90(13)+ACC_at_BalAccountPLString{$_l_Index})
		If ($_t_LastPeriod#ACC_at_BalPeriodCodes{$_l_Index})
			ARRAY TEXT:C222($_at_BalAccountPLString; 0)
			$_l_PeriodStarts:=$_l_Index
		Else 
			If ($_l_PeriodStarts=0)
				$_l_PeriodStarts:=$_l_Index
			End if 
		End if 
		$_l_BalancePLPosition:=Find in array:C230($_at_BalAccountPLString; ACC_at_BalAccountPLString{$_l_Index})
		If ($_l_BalancePLPosition<0)
			INSERT IN ARRAY:C227($_at_BalAccountPLString; Size of array:C274($_at_BalAccountPLString)+1; 1)
			$_at_BalAccountPLString{Size of array:C274($_at_BalAccountPLString)}:=ACC_at_BalAccountPLString{$_l_Index}
			If (ACC_at_BalAccountPLString{$_l_Index}#ACC_at_BalAccountIdentity{$_l_Index})
				//this is not the P&L
				$_l_IdentityPosition:=Find in array:C230(ACC_at_BalAccountIdentity; ACC_at_BalAccountPLString{$_l_Index})
				If ($_l_IdentityPosition<0)
					MESSAGE:C88(Char:C90(13)+"P&L Does not Currently exist for "+Char:C90(13)+ACC_at_BalAccountPLString{$_l_Index})
					$_l_InsertRow:=0
					$_t_LastPeriod:=""
					$_l_PeriodEnds:=0
					For ($_l_BalanceIndex; $_l_PeriodStarts; Size of array:C274(ACC_at_BalAccountCodes))
						$_l_BalancePeriodRow:=Find in array:C230(ACC_at_BalPeriodCodes; ACC_at_BalPeriodCodes{$_l_Index}; $_l_BalanceIndex)
						If ($_l_BalancePeriodRow>0)
							$_l_BalanceIndex:=$_l_BalancePeriodRow
						End if 
						Case of 
							: (ACC_at_BalAccountCodes{$_l_BalanceIndex}=DB_GetLedgerProfitACC) & (ACC_at_BalPeriodCodes{$_l_BalanceIndex}=ACC_at_BalPeriodCodes{$_l_Index})
								//insert after $_l_InsertRow
								$_t_LastPeriod:=ACC_at_BalPeriodCodes{$_l_Index}
								$_l_InsertRow:=$_l_BalanceIndex+1
								$_l_BalanceIndex:=Size of array:C274(ACC_at_BalAccountCodes)
							: (ACC_at_BalPeriodCodes{$_l_BalanceIndex}=ACC_at_BalPeriodCodes{$_l_Index})
								$_t_LastPeriod:=ACC_at_BalPeriodCodes{$_l_Index}
							Else 
								If ($_t_LastPeriod#"")
									$_l_PeriodEnds:=$_l_BalanceIndex-1
									$_l_BalanceIndex:=Size of array:C274(ACC_at_BalAccountCodes)
								End if 
						End case 
					End for 
					If ($_l_InsertRow=0)
						$_t_LastPeriod:=""
						If ($_l_PeriodEnds>0)
							$_l_StartAt:=$_l_PeriodEnds
						Else 
							$_l_StartAt:=$_l_PeriodStarts
						End if 
						For ($_l_BalanceIndex; $_l_StartAt; Size of array:C274(ACC_at_BalAccountCodes))
							
							If ($_t_LastPeriod=ACC_at_BalPeriodCodes{$_l_Index}) & (ACC_at_BalPeriodCodes{$_l_BalanceIndex}#ACC_at_BalPeriodCodes{$_l_Index})
								//insert at $_l_InsertRow
								$_l_InsertRow:=$_l_BalanceIndex-1
								$_l_BalanceIndex:=Size of array:C274(ACC_at_BalAccountCodes)
							Else 
								
								If (ACC_at_BalPeriodCodes{$_l_Index}=ACC_at_BalPeriodCodes{$_l_BalanceIndex})
									$_t_LastPeriod:=ACC_at_BalPeriodCodes{$_l_Index}
								End if 
							End if 
						End for 
					End if 
					If ($_l_InsertRow=0)
						$_l_InsertRow:=Size of array:C274(ACC_at_BalAccountIdentity)+1
					End if 
					If ($_l_InsertRow=$_l_Index)
						$_l_InsertRow:=$_l_Index+1
					End if 
					If ($_l_InsertRow<$_l_Index)
						$_l_Index:=$_l_Index+1
					End if 
					INSERT IN ARRAY:C227(ACC_at_BalAccountIdentity; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_at_BalAccountCodes; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_at_BalAnalysisCodes; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_at_BalPeriodCodes; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_at_BalLayerCodes; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_at_BalCurrencyCodes; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_at_BalAccountPLString; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_ar_BalAccountDetailsAmount; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_at_BalCurrencyDetailsCode; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_ar_BalConvertedAmounts; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_ar_BalCurrencyTotalAmounts; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_at_BalCurrencyTotalsCC; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_ar_BalConvertedAccTotals; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_ar_BalOuptutAccountBalance; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_ar_CurrentBalance; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_ar_OutputACCprofBalance; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_abo_BalProfitCalculated; $_l_InsertRow; 1)
					INSERT IN ARRAY:C227(ACC_ar_NotPLBalance; $_l_InsertRow; 1)
					ACC_at_BalAccountIdentity{$_l_InsertRow}:=ACC_Buildunique(DB_GetLedgerProfitACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index})
					ACC_at_BalAccountCodes{$_l_InsertRow}:=DB_GetLedgerProfitACC
					ACC_at_BalAnalysisCodes{$_l_InsertRow}:=ACC_at_BalAnalysisCodes{$_l_Index}
					ACC_at_BalPeriodCodes{$_l_InsertRow}:=ACC_at_BalPeriodCodes{$_l_Index}
					ACC_at_BalLayerCodes{$_l_InsertRow}:=ACC_at_BalLayerCodes{$_l_Index}
					ACC_at_BalCurrencyCodes{$_l_InsertRow}:=ACC_at_BalCurrencyCodes{$_l_Index}
					ACC_at_BalAccountPLString{$_l_InsertRow}:=ACC_Buildunique(DB_GetLedgerProfitACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index})
				End if 
			End if 
			If (ACC_at_BalPeriodCodes{$_l_Index}<$_t_YearPeriodFrom)
				//this is from a period in a previous year
				//need to check the BF was posted
				$_t_BFUniqueIdentity:=ACC_Buildunique(DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index})
				ERASE WINDOW:C160
				MESSAGE:C88(Char:C90(13)+"Check P&L Brought Forward"+Char:C90(13)+$_t_BFUniqueIdentity)
				
				If (ACC_at_BalAccountIdentity{$_l_Index}#$_t_BFUniqueIdentity)
					$_l_IdentityPosition:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_BFUniqueIdentity)
					If ($_l_IdentityPosition<0)
						MESSAGE:C88(Char:C90(13)+"P&L brought forward does not Currently exist for "+Char:C90(13)+$_t_BFUniqueIdentity)
						
						$_l_InsertRow:=0
						$_t_LastPeriod:=""
						$_l_PeriodEnds:=0
						For ($_l_BalanceIndex; $_l_PeriodStarts; Size of array:C274(ACC_at_BalAccountCodes))
							$_l_BalancePeriodRow:=Find in array:C230(ACC_at_BalPeriodCodes; ACC_at_BalPeriodCodes{$_l_Index}; $_l_BalanceIndex)
							If ($_l_BalancePeriodRow>0)
								$_l_BalanceIndex:=$_l_BalancePeriodRow
							End if 
							Case of 
								: (ACC_at_BalAccountCodes{$_l_BalanceIndex}=DB_GetLedgerBroughtforwardACC) & (ACC_at_BalPeriodCodes{$_l_BalanceIndex}=ACC_at_BalPeriodCodes{$_l_Index})
									//insert after $_l_InsertRow
									$_t_LastPeriod:=ACC_at_BalPeriodCodes{$_l_Index}
									$_l_InsertRow:=$_l_BalanceIndex+1
									$_l_BalanceIndex:=Size of array:C274(ACC_at_BalAccountCodes)
								: (ACC_at_BalPeriodCodes{$_l_BalanceIndex}=ACC_at_BalPeriodCodes{$_l_Index})
									$_t_LastPeriod:=ACC_at_BalPeriodCodes{$_l_Index}
								Else 
									If ($_t_LastPeriod#"")
										//we have already passed the period
										$_l_PeriodEnds:=$_l_BalanceIndex-1
										$_l_InsertRow:=$_l_BalanceIndex-1
										$_l_BalanceIndex:=Size of array:C274(ACC_at_BalAccountCodes)
									End if 
							End case 
						End for 
						If ($_l_InsertRow=0)
							$_t_LastPeriod:=""
							If ($_l_PeriodEnds>0)
								$_l_StartAt:=$_l_PeriodEnds
							Else 
								$_l_StartAt:=$_l_PeriodStarts
							End if 
							For ($_l_BalanceIndex; $_l_StartAt; Size of array:C274(ACC_at_BalAccountCodes))
								If ($_t_LastPeriod=ACC_at_BalPeriodCodes{$_l_Index}) & (ACC_at_BalPeriodCodes{$_l_BalanceIndex}#ACC_at_BalPeriodCodes{$_l_Index})
									//insert at $_l_InsertRow
									$_l_InsertRow:=$_l_BalanceIndex-1
									$_l_BalanceIndex:=Size of array:C274(ACC_at_BalAccountCodes)
								Else 
									If (ACC_at_BalPeriodCodes{$_l_Index}=ACC_at_BalPeriodCodes{$_l_BalanceIndex})
										
										$_t_LastPeriod:=ACC_at_BalPeriodCodes{$_l_Index}
									End if 
								End if 
							End for 
						End if 
						If ($_l_InsertRow=0)
							$_l_InsertRow:=Size of array:C274(ACC_at_BalAccountIdentity)+1
						End if 
						If ($_l_InsertRow=$_l_Index)
							$_l_InsertRow:=$_l_Index+1
						End if 
						If ($_l_InsertRow<$_l_Index)
							$_l_Index:=$_l_Index+1
						End if 
						INSERT IN ARRAY:C227(ACC_at_BalAccountIdentity; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_at_BalAccountCodes; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_at_BalAnalysisCodes; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_at_BalPeriodCodes; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_at_BalLayerCodes; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_at_BalCurrencyCodes; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_at_BalAccountPLString; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_ar_BalAccountDetailsAmount; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_at_BalCurrencyDetailsCode; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedAmounts; $_l_InsertRow; 1)
						//``
						INSERT IN ARRAY:C227(ACC_ar_BalCurrencyTotalAmounts; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_at_BalCurrencyTotalsCC; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_ar_BalConvertedAccTotals; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_ar_BalOuptutAccountBalance; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_ar_CurrentBalance; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_abo_BalProfitCalculated; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_ar_NotPLBalance; $_l_InsertRow; 1)
						INSERT IN ARRAY:C227(ACC_ar_OutputACCprofBalance; $_l_InsertRow; 1)
						
						ACC_at_BalAccountIdentity{$_l_InsertRow}:=ACC_Buildunique(DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index})
						ACC_at_BalAccountCodes{$_l_InsertRow}:=DB_GetLedgerBroughtforwardACC
						ACC_at_BalAnalysisCodes{$_l_InsertRow}:=ACC_at_BalAnalysisCodes{$_l_Index}
						ACC_at_BalPeriodCodes{$_l_InsertRow}:=ACC_at_BalPeriodCodes{$_l_Index}
						ACC_at_BalLayerCodes{$_l_InsertRow}:=ACC_at_BalLayerCodes{$_l_Index}
						ACC_at_BalCurrencyCodes{$_l_InsertRow}:=ACC_at_BalCurrencyCodes{$_l_Index}
						ACC_at_BalAccountPLString{$_l_InsertRow}:=ACC_Buildunique(DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index})
						
						
					End if 
				End if 
			End if 
			// End for
		End if 
	End if 
	
Until ((Process aborted:C672) | ($_l_Index=Size of array:C274(ACC_at_BalAccountPLString)) | (<>SYS_bo_QuitCalled))
ERR_MethodTrackerReturn("ACC_CheckPLentries"; $_t_oldMethodName)
