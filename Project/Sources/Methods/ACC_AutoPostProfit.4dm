//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_AutoPostProfit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 11:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ACC_ad_FinancialYearFrom;0)
	//ARRAY DATE(ACC_AD_FinancialYearTo;0)
	ARRAY LONGINT:C221($_al_BatchCodes; 0)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	ARRAY TEXT:C222($_at_BFPeriodCodes; 0)
	ARRAY TEXT:C222($_at_ProfitAccounts; 0)
	ARRAY TEXT:C222($_at_ProfitPostingAccounts; 0)
	C_BOOLEAN:C305(<>ACC_bo_LiveProfit; $_bo_CalcforBFifPreviousYear; $_bo_Continue; $_bo_OK; $_bo_PostActiveProfit; $_bo_PostPL; $_bo_PostPLBFWD; $5; ACC_bo_Bfwd)
	C_DATE:C307(<>ACC_D_DateActiveFrom; $_d_BatchDate; $_d_CurrentDate; $_d_CurrentYearEnd; $_d_CurrentYearStart; $_d_PeriodtoDate; $_d_YearEnd; $_d_YearStart)
	C_LONGINT:C283($_l_AddMode; $_l_CheckBatches; $_l_CheckItems; $_l_Index; $_l_TransPostResult; $_l_yes; DS_l_BATCHITEMRef; Vadd)
	C_REAL:C285($_r_AccountBalance; $_r_ALLBFProfitSum; $_r_AllProfitSum; $_r_AlreadyPosted; $_r_AlreadyPostedAllANAL; $_r_BFProfitSum; $_r_DifferenceToPost; $_r_FromPLYTD; $_r_ProfitOtherAnal; $_r_ProfitSum; $_r_ProfitSumALLANAL)
	C_REAL:C285($_r_SumofBatch; $_r_YTDProfitSumPosted; $0)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>SYS_t_LastSavedTableName; $_t_AnalysisCode; $_t_CurrencyCode; $_t_CurrentFormUsage; $_t_LayerCode; $_t_oldMethodName; $_t_PeriodCode; $1; $2; $3)
	C_TEXT:C284($4; DB_t_CurrentFormUsage2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_AUTOPOSTPROFIT")
//This method can be used with a 'live profit' option...note that if the live prof

//This method is called from the TRIGGER of the ACCOUNT BALANCES TABLE
<>ACC_D_DateActiveFrom:=!1990-01-01!

//If (◊ACC_bo_Liveprofit)  `LIVE PROFIT IS ON FOR THIS SYSTEM
If (Count parameters:C259>=1)
	$_t_AnalysisCode:=$1
Else 
	$_t_AnalysisCode:=[ACCOUNT_BALANCES:34]Analysis_Code:1
End if 
If (Count parameters:C259>=2)
	$_t_PeriodCode:=$2
Else 
	$_t_PeriodCode:=[ACCOUNT_BALANCES:34]Period_Code:4
End if 
If (Count parameters:C259>=3)
	$_t_LayerCode:=$3
Else 
	$_t_LayerCode:=[ACCOUNT_BALANCES:34]Layer_Code:5
End if 
If (Count parameters:C259>=4)
	$_t_CurrencyCode:=$4
Else 
	$_t_CurrencyCode:=[ACCOUNT_BALANCES:34]Currency_Code:6
End if 
If (Count parameters:C259>=5)
	$_bo_CalcforBFifPreviousYear:=$5
Else 
	$_bo_CalcforBFifPreviousYear:=True:C214
End if 
//check the current P&L on this account

$_bo_PostActiveProfit:=False:C215

$0:=0
QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=$_t_AnalysisCode)
If (Records in selection:C76([ANALYSES:36])=0)
	$_t_AnalysisCode:=""
End if 
If (Records in selection:C76([ANALYSES:36])>0) | ($_t_AnalysisCode="")
	QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=$_t_LayerCode)
	If (Records in selection:C76([LAYERS:76])=0)
		$_t_LayerCode:=""
	End if 
	If (Records in selection:C76([LAYERS:76])>0) | ($_t_LayerCode="")
		$_bo_Continue:=False:C215
		If ($_t_CurrencyCode="") | ($_t_CurrencyCode=<>SYS_t_BaseCurrency)
			$_bo_Continue:=True:C214
		Else 
			QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=$_t_CurrencyCode)
			If (Records in selection:C76([CURRENCIES:71])=0)
				$_t_CurrencyCode:=""
			End if 
			If (Records in selection:C76([CURRENCIES:71])>0)
				$_bo_Continue:=True:C214
			End if 
		End if 
		If ($_bo_Continue)
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="B"; *)
			QUERY:C277([ACCOUNTS:32];  & ; [ACCOUNTS:32]Account_Code:2=DB_GetLedgerProfitACC)
			//QUERY([ACCOUNTS]; & ;[ACCOUNTS]Account_Code#DB_GetLedgerBroughtforwardACC )
			SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; $_at_ProfitPostingAccounts)
			CREATE EMPTY SET:C140([ACCOUNT_BALANCES:34]; "$Balances")
			For ($_l_Index; 1; Size of array:C274($_at_ProfitPostingAccounts))
				//QUERY([ACCOUNT_BALANCES];[ACCOUNT_BALANCES]Account_Code=$_at_ProfitPostingAccounts{$_l_Index};*)
				QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=$_t_PeriodCode; *)
				QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1=$_t_AnalysisCode; *)
				QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Layer_Code:5=$_t_LayerCode; *)
				If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
					QUERY:C277([ACCOUNT_BALANCES:34])
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_CurrencyCode; *)
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
				Else 
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_CurrencyCode)
				End if 
				//Now that should be one balance but just in case
				If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
					CREATE SET:C116([ACCOUNT_BALANCES:34]; "$Acc")
					UNION:C120("$Balances"; "$Acc"; "$Balances")
					CLEAR SET:C117("$Acc")
				End if 
				
			End for 
			
			//here calculate if the year is open
			$_d_CurrentDate:=Current date:C33(*)
			ACC_LoadFinancialYears(True:C214)
			For ($_l_Index; Size of array:C274(ACC_AD_FinancialYearTo); 1; -1)
				If (ACC_ad_FinancialYearFrom{$_l_Index}<$_d_CurrentDate) & (ACC_AD_FinancialYearTo{$_l_Index}>=$_d_CurrentDate)
					$_d_CurrentYearStart:=ACC_ad_FinancialYearFrom{$_l_Index}
					$_d_CurrentYearEnd:=ACC_AD_FinancialYearTo{$_l_Index}
					//$_l_Index:=1
				Else 
					If (ACC_AD_FinancialYearTo{$_l_Index}>=$_d_CurrentDate) & (ACC_ad_FinancialYearFrom{$_l_Index}>$_d_CurrentDate)
						$_l_Index:=Size of array:C274(ACC_AD_FinancialYearTo)
					End if 
				End if 
			End for 
			
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
			$_d_PeriodtoDate:=[PERIODS:33]To_Date:4
			$_d_BatchDate:=[PERIODS:33]From_Date:3
			If ([PERIODS:33]From_Date:3>=<>ACC_D_DateActiveFrom)
				$_bo_PostActiveProfit:=True:C214
			End if 
			If ($_d_PeriodtoDate<$_d_CurrentYearStart)
				For ($_l_Index; 1; Size of array:C274(ACC_AD_FinancialYearTo))
					If (ACC_ad_FinancialYearFrom{$_l_Index}<$_d_PeriodtoDate) & (ACC_AD_FinancialYearTo{$_l_Index}>=$_d_PeriodtoDate)
						$_d_YearStart:=ACC_ad_FinancialYearFrom{$_l_Index}
						$_d_YearEnd:=ACC_AD_FinancialYearTo{$_l_Index}
						//$_l_Index:=Size of array(ACC_AD_FinancialYearTo)
					Else 
						If (ACC_AD_FinancialYearTo{$_l_Index}>=$_d_PeriodtoDate) & (ACC_ad_FinancialYearFrom{$_l_Index}>$_d_PeriodtoDate)
							$_l_Index:=Size of array:C274(ACC_AD_FinancialYearTo)
						End if 
					End if 
				End for 
				//QUERY([PERIODS];[PERIODS]From_Date>=$_d_YearStart;*)//by not having this line it makes sure we find all open periods before the year end of the period that we are posting to
				//if there is any period open then we are posting the P&L YTD-only if all periods up to this date at closed are we posting The BFWD.
				//note that because of this we will make harder to re-open a period that has been closed IF all the periods in that financial year are closed
				QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<=$_d_YearEnd; *)
				QUERY SELECTION:C341([PERIODS:33];  & ; [PERIODS:33]NL_Closed:5=False:C215; *)
				QUERY SELECTION:C341([PERIODS:33];  & ; [PERIODS:33]SL_Closed:7=False:C215; *)
				QUERY SELECTION:C341([PERIODS:33];  & ; [PERIODS:33]PL_Closed:8=False:C215)
				//note that i have taken into account a scenario where for example 2002 is all closed but a period is open in a previous year
				If (Records in selection:C76([PERIODS:33])=0)
					$_bo_PostPL:=False:C215
					$_bo_PostPLBFWD:=True:C214
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=$_d_YearStart; *)
					QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4<=$_d_YearEnd)
					SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_BFPeriodCodes)
				Else 
					//note that we could have closed a year and then re-opened it so this could happen. This would mean we are posting extra amounts to the P&L YTD
					//when the year is closed again the DIFFERENCE would get posted to the P&LBFWD
					$_bo_PostPL:=True:C214
					$_bo_PostPLBFWD:=False:C215
					$_bo_CalcforBFifPreviousYear:=False:C215
				End if 
			Else 
				//here we are in the current year-even if all the periods were closed-which would be odd
				//we still only post to the
				
				
				
				$_bo_PostPL:=True:C214
				$_bo_PostPLBFWD:=False:C215
			End if 
			Case of 
				: ($_bo_PostPL) | (($_bo_CalcforBFifPreviousYear=False:C215) & ($_bo_PostPLBFWD=False:C215))
					//TRACE
					If (Records in set:C195("$Balances")=0)
						CREATE RECORD:C68([ACCOUNT_BALANCES:34])
						[ACCOUNT_BALANCES:34]Account_Code:2:=DB_GetLedgerProfitACC
						[ACCOUNT_BALANCES:34]Analysis_Code:1:=$_t_AnalysisCode
						//[ACCOUNT_BALANCES]Balance
						[ACCOUNT_BALANCES:34]Currency_Code:6:=$_t_CurrencyCode
						[ACCOUNT_BALANCES:34]Layer_Code:5:=$_t_LayerCode
						//[ACCOUNT_BALANCES]NoBalanceCheck
						[ACCOUNT_BALANCES:34]Period_Code:4:=$_t_PeriodCode
						[ACCOUNT_BALANCES:34]Unique_StringIdent:8:=ACC_Buildunique([ACCOUNT_BALANCES:34]Account_Code:2; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
						[ACCOUNT_BALANCES:34]x_ID:7:=AA_GetNextID(->[ACCOUNT_BALANCES:34]x_ID:7)
						DB_SaveRecord(->[ACCOUNT_BALANCES:34])
					End if 
					
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="P")
					SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; $_at_ProfitAccounts)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerBroughtforwardACC; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerProfitACC; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=$_t_PeriodCode; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=$_t_AnalysisCode; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=$_t_LayerCode; *)
					If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
						QUERY:C277([TRANSACTIONS:29])
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
					Else 
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
					End if 
					QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Account_Code:3; $_at_ProfitAccounts)
					$_r_ProfitSum:=Sum:C1([TRANSACTIONS:29]Amount:6)
					$0:=Round:C94($_r_ProfitSum; 3)
					QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Period_Code:11=$_t_PeriodCode; *)
					QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_t_AnalysisCode; *)
					If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
						QUERY:C277([TRANSACTION_BATCH_ITEMS:155])
						
						QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19=$_t_CurrencyCode; *)
						QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155];  | ; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
					Else 
						QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
					End if 
					QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20=$_t_LayerCode; *)
					QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1="PLYT")
					QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")
					If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
						If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>1)
							CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$Temp")
							SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchCodes)
							QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchCodes)
							QUERY SELECTION:C341([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]X_ActiveProfitPostingType:2=0)
							SELECTION TO ARRAY:C260([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchCodes)
							QUERY WITH ARRAY:C644([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchCodes)
							CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$Temp2")
							INTERSECTION:C121("$Temp"; "$Temp2"; "$Temp")
							USE SET:C118("$Temp")
							
						Else 
							QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; *)
							If ([TRANSACTION_BATCHES:30]X_ActiveProfitPostingType:2>0)
								REDUCE SELECTION:C351([TRANSACTION_BATCH_ITEMS:155]; 0)
							End if 
						End if 
					End if 
					//this is the NOT posted automatically amount-it should really be ZERO
					$_r_AlreadyPosted:=Round:C94(Sum:C1([TRANSACTION_BATCH_ITEMS:155]Amount:6); 3)
					//What we need to cope with here is postings for all analysis/currencies
					If ($_bo_PostActiveProfit)
						//TRACE
						If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])=0)
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerBroughtforwardACC; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerProfitACC; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=$_t_PeriodCode; *)
							//QUERY([TRANSACTIONS]; & ;[TRANSACTIONS]Analysis_Code=$_t_AnalysisCode;*)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=$_t_LayerCode; *)
							If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
								QUERY:C277([TRANSACTIONS:29])
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode; *)
								QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
							Else 
								QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
							End if 
							QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Account_Code:3; $_at_ProfitAccounts)
							$_r_ProfitSumALLANAL:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 3)
							$_r_ProfitOtherAnal:=$_r_ProfitSumALLANAL-$_r_ProfitSum
							QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Period_Code:11=$_t_PeriodCode; *)
							QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_t_AnalysisCode; *)
							If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155])
								QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19=$_t_CurrencyCode; *)
								QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155];  | ; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
							Else 
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
							End if 
							QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20=$_t_LayerCode; *)
							QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1="PLYT")
							If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
								If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>1)
									CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$Temp")
									SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchCodes)
									QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchCodes)
									QUERY SELECTION:C341([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]X_ActiveProfitPostingType:2=0)
									SELECTION TO ARRAY:C260([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchCodes)
									QUERY WITH ARRAY:C644([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchCodes)
									CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$Temp2")
									INTERSECTION:C121("$Temp"; "$Temp2"; "$Temp")
									USE SET:C118("$Temp")
									
								Else 
									QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; *)
									If ([TRANSACTION_BATCHES:30]X_ActiveProfitPostingType:2>0)
										REDUCE SELECTION:C351([TRANSACTION_BATCH_ITEMS:155]; 0)
									End if 
								End if 
							End if 
							$_r_AlreadyPostedAllANAL:=Round:C94(Sum:C1([TRANSACTION_BATCH_ITEMS:155]Amount:6); 3)
							//we can only assume the amount is posted for the current analysis if the whole amount is posted else it could be any amount for the current analysis
							If ((Round:C94($_r_AlreadyPostedAllANAL; 2))=(Round:C94($_r_ProfitSumALLANAL; 2)))
								
								$_r_AlreadyPosted:=$_r_AlreadyPostedAllANAL-$_r_ProfitOtherAnal
							End if 
							
						End if 
						If ((Round:C94($_r_ProfitSum; 2))-(Round:C94($_r_AlreadyPosted; 2))#0)
							READ WRITE:C146([TRANSACTION_BATCH_ITEMS:155])
							READ WRITE:C146([TRANSACTION_BATCHES:30])
							READ WRITE:C146([TRANSACTIONS:29])
							QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]X_ActiveProfitPostingType:2=1; *)
							QUERY:C277([TRANSACTION_BATCHES:30];  & ; [TRANSACTION_BATCHES:30]Batch_Date:1=$_d_BatchDate)  // note that the batch date is the first date of the period
							If (Records in selection:C76([TRANSACTION_BATCHES:30])=0)
								CREATE RECORD:C68([TRANSACTION_BATCHES:30])
								BatchNo
								[TRANSACTION_BATCHES:30]Batch_Date:1:=$_d_BatchDate
								[TRANSACTION_BATCHES:30]Entry_Date:6:=$_d_BatchDate
								[TRANSACTION_BATCHES:30]Description:12:="Posting of "+$_t_PeriodCode+Term_NLWT(" P/L to BS")
								
								CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
								[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:="PLYT"
								[TRANSACTION_BATCH_ITEMS:155]Description:10:=Term_NLWT("P/L YTD posting")
								[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=DB_GetLedgerProfitACC
								[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=""
								[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="N"
								[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="N"
								[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
								[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$_t_PeriodCode
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=Current date:C33
								[TRANSACTION_BATCH_ITEMS:155]Amount:6:=($_r_ProfitSum-$_r_AlreadyPosted)
								[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:="N"
								[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
								[TRANSACTION_BATCH_ITEMS:155]Total:9:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
								[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=Uppercase:C13($_t_CurrencyCode)
								[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=Uppercase:C13($_t_LayerCode)
								[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=Uppercase:C13($_t_AnalysisCode)
								[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
								If ([TRANSACTION_BATCH_ITEMS:155]ID:30=0)
									[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
								End if 
								//TRACE
								
								DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
								
							Else 
								//There can only be one
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
								[TRANSACTION_BATCH_ITEMS:155]Amount:6:=($_r_ProfitSum-$_r_AlreadyPosted)
								<>SYS_t_LastSavedTableName:="TRANSACTION_BATCH_ITEMS"
								SAVE RECORD:C53([TRANSACTION_BATCH_ITEMS:155])
								
							End if 
							[TRANSACTION_BATCHES:30]Batch_Amount:3:=($_r_ProfitSum-$_r_AlreadyPosted)
							[TRANSACTION_BATCHES:30]Batch_Total:5:=($_r_ProfitSum-$_r_AlreadyPosted)
							<>SYS_t_LastSavedTableName:="TRANSACTION_BATCHES"
							SAVE RECORD:C53([TRANSACTION_BATCHES:30])
							
							//`Here post or alter the  the transactions
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10)
							If (Records in selection:C76([TRANSACTIONS:29])=0)
								$_l_AddMode:=Vadd
								$_t_CurrentFormUsage:=DB_t_CurrentFormUsage2
								vAdd:=0
								DB_t_CurrentFormUsage2:="NBat"
								$_l_TransPostResult:=TransactionBatch_Post
								$_l_yes:=1
								Vadd:=$_l_AddMode
								DB_t_CurrentFormUsage2:=$_t_CurrentFormUsage
								
								
								
							Else 
								
							End if 
							
						End if 
						
					End if 
				: ($_bo_PostPLBFWD=True:C214)
					//note that the BFWD
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="P")
					SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; $_at_ProfitAccounts)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerBroughtforwardACC; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerProfitACC; *)
					//`QUERY([TRANSACTIONS]; & ;[TRANSACTIONS]Period_Code=$_t_PeriodCode;*)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=$_t_AnalysisCode; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=$_t_LayerCode; *)
					If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
						QUERY:C277([TRANSACTIONS:29])
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
					Else 
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
					End if 
					QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Period_Code:12; $_at_BFPeriodCodes)
					QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Account_Code:3; $_at_ProfitAccounts)
					$_r_ProfitSum:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 3)  //this is the amount that would have been posted to the P&L
					//this has probably been offset by a posting to the P&L BFWD but that could be a 'rolled up' posting of several analysis
					
					$0:=Round:C94($_r_ProfitSum; 3)
					ACC_bo_Bfwd:=True:C214
					//COPY ARRAY($_at_BFPeriodCodes;ACC_at_BFPeriodCodes)
					//now find if there are balances posted for the profitacc-they need to be zero'd-as per posting the bfwd
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerProfitACC; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1=$_t_AnalysisCode; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Layer_Code:5=$_t_LayerCode; *)
					If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
						QUERY:C277([ACCOUNT_BALANCES:34])
						QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_CurrencyCode; *)
						QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
					Else 
						QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_CurrencyCode)
					End if 
					QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Period_Code:4; $_at_BFPeriodCodes)
					If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
						$_r_AccountBalance:=Round:C94(Sum:C1([ACCOUNT_BALANCES:34]Balance:3); 3)
						If ($_r_AccountBalance#0)
							//this is zerod by posting an inverse transaction to the profit acc
							
						End if 
					End if 
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetLedgerBroughtforwardACC; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=$_t_AnalysisCode; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=$_t_LayerCode; *)
					If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
						QUERY:C277([TRANSACTIONS:29])
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
					Else 
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
					End if 
					QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Period_Code:12; $_at_BFPeriodCodes)
					$_r_BFProfitSum:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 3)
					//what we should check  here is that these are actually BFWD postings and not something else
					COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "$BFWDTransactions")
					DISTINCT VALUES:C339([TRANSACTIONS:29]Batch_Number:7; $_al_BatchNumbers)
					//TRACE
					$_r_FromPLYTD:=0
					For ($_l_CheckBatches; 1; Size of array:C274($_al_BatchNumbers))
						USE NAMED SELECTION:C332("$BFWDTransactions")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=$_al_BatchNumbers{$_l_CheckBatches})
						$_r_SumofBatch:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 3)
						QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=$_al_BatchNumbers{$_l_CheckBatches})
						
						
						For ($_l_CheckItems; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
							If ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_t_AnalysisCode) & ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20=$_t_LayerCode)
								If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
									$_bo_OK:=([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19=$_t_CurrencyCode) | ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
								Else 
									$_bo_OK:=([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19=$_t_CurrencyCode)
								End if 
								If ($_bo_OK)
									Case of 
										: ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3=DB_GetLedgerProfitACC) & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12=DB_GetLedgerBroughtforwardACC)
											$_r_FromPLYTD:=$_r_FromPLYTD-[TRANSACTION_BATCH_ITEMS:155]Amount:6
										: ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12=DB_GetLedgerProfitACC) & ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3=DB_GetLedgerBroughtforwardACC)
											$_r_FromPLYTD:=$_r_FromPLYTD+[TRANSACTION_BATCH_ITEMS:155]Amount:6
									End case 
								End if 
							End if 
							
							NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
							
						End for 
					End for 
					If ($_r_FromPLYTD#$_r_BFProfitSum)  //typically this would be on a new set of accounts(opening balances)
						$_r_BFProfitSum:=$_r_FromPLYTD
						//this means the posted BFWD amount includes manual postings
						//TRACE
					End if 
					
					$_r_DifferenceToPost:=0
					If ($_r_BFProfitSum#0)
						If ($_r_BFProfitSum#$_r_ProfitSum)
							//the amount posted might appear wrong but this could be because its a rolled up amount that has been posted
							//note that the auto system will always post seperate amounts.
							//it can only be posted for one currency..
							
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerBroughtforwardACC; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerProfitACC; *)
							//`QUERY([TRANSACTIONS]; & ;[TRANSACTIONS]Period_Code=$_t_PeriodCode;*)
							//QUERY([TRANSACTIONS]; & ;[TRANSACTIONS]Analysis_Code="";*)  //note this here-must be for ALL analysis
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=$_t_LayerCode; *)
							
							If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
								QUERY:C277([TRANSACTIONS:29])
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode; *)
								QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
							Else 
								QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
							End if 
							QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Period_Code:12; $_at_BFPeriodCodes)
							QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Account_Code:3; $_at_ProfitAccounts)
							$_r_AllProfitSum:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 3)
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetLedgerBroughtforwardACC; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=$_t_LayerCode; *)
							If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
								QUERY:C277([TRANSACTIONS:29])
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode; *)
								QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
							Else 
								QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
							End if 
							QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Period_Code:12; $_at_BFPeriodCodes)
							$_r_ALLBFProfitSum:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 3)  //this is a posted amount for all analysis
							If ($_r_ALLBFProfitSum#0)
								
								//what we should check  here is that these are actually BFWD postings and not something else
								COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "$BFWDTransactions")
								DISTINCT VALUES:C339([TRANSACTIONS:29]Batch_Number:7; $_al_BatchNumbers)
								//TRACE
								$_r_FromPLYTD:=0
								For ($_l_CheckBatches; 1; Size of array:C274($_al_BatchNumbers))
									USE NAMED SELECTION:C332("$BFWDTransactions")
									QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=$_al_BatchNumbers{$_l_CheckBatches})
									$_r_SumofBatch:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 3)
									QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=$_al_BatchNumbers{$_l_CheckBatches})
									
									
									For ($_l_CheckItems; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
										If (([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2="") | ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_t_AnalysisCode)) & ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20=$_t_LayerCode)
											If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
												$_bo_OK:=([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19=$_t_CurrencyCode) | ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
											Else 
												$_bo_OK:=([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19=$_t_CurrencyCode)
											End if 
											If ($_bo_OK)
												Case of 
													: ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3=DB_GetLedgerProfitACC) & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12=DB_GetLedgerBroughtforwardACC)
														$_r_FromPLYTD:=$_r_FromPLYTD-[TRANSACTION_BATCH_ITEMS:155]Amount:6
													: ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12=DB_GetLedgerProfitACC) & ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3=DB_GetLedgerBroughtforwardACC)
														$_r_FromPLYTD:=$_r_FromPLYTD+[TRANSACTION_BATCH_ITEMS:155]Amount:6
												End case 
											End if 
										End if 
										
										NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
										
									End for 
								End for 
								If ($_r_FromPLYTD#$_r_ALLBFProfitSum)  //typically this would be on a new set of accounts(opening balances)
									$_r_ALLBFProfitSum:=$_r_FromPLYTD
									//this means the posted BFWD amount includes manual postings
									//TRACE
								End if 
								If ($_r_ALLBFProfitSum#$_r_AllProfitSum)
									//this means that the although there is a rolled up posting there is an additional amount to post
									//TRACE
									$_r_DifferenceToPost:=$_r_ALLBFProfitSum-$_r_ProfitSum  //because we are only posting this analysis
								End if 
								
							Else 
								//no rolled up is posted
								$_r_DifferenceToPost:=$_r_BFProfitSum-$_r_ProfitSum
								//TRACE
							End if 
							
							
							
						End if 
					Else 
						//there is no BFWD POSTING
						//TRACE
						$_r_DifferenceToPost:=$_r_ProfitSum
					End if 
					If ($_r_DifferenceToPost#0)
						//the problem i have here is that in the CAase of RR opening year the amount posted to the BFWD is greater then the amount
						// posted to the YTD. There is an adhoc journal posting to the YTD whic makes it Zero(or actually 0.01)
						//that ad-hoc journal makes this look wrong.
						//that ad-hoc posting is to 26001 this is manual profit posting amount-the YTD and BFWD figures match(witch is what matters)
						//but the amount of profit posted does not match the sum of transactions to other accounts
						//we must ignore this so here we check the 26002(YTD) transaction for the period in question and if they match the profit posting then that is ok there is no difference
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetLedgerProfitACC; *)
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=$_t_AnalysisCode; *)
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=$_t_LayerCode; *)
						If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
							QUERY:C277([TRANSACTIONS:29])
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode; *)
							QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
						Else 
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
						End if 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Period_Code:12; $_at_BFPeriodCodes)
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1#"PLYC")  //this is a hard coded value
						$_r_YTDProfitSumPosted:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 3)
						
						If ($_r_YTDProfitSumPosted#$_r_ProfitSum)
							//here we post the difference.
							$_r_DifferenceToPost:=$_r_YTDProfitSumPosted-$_r_ProfitSum
							
							//TRACE
						End if 
					End if 
					
					
			End case 
			
			
			CLEAR SEMAPHORE:C144("UPDATEBALANCE"+DB_GetLedgerProfitACC)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("ACC_AUTOPOSTPROFIT"; $_t_oldMethodName)