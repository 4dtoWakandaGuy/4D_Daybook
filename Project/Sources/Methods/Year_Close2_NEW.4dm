//%attributes = {}
If (False:C215)
	//Project Method Name:      Year_Close2_NEW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: Year_Close2_NEW
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ACC_ad_FinancialYearFrom;0)
	//ARRAY DATE(ACC_ad_FinancialYearTo;0)
	//ARRAY REAL(ACC_ar_BalOuptutAccountBalance;0)
	//ARRAY REAL(ACC_ar_PostedProfit;0)
	//ARRAY REAL(ACC_ar_TotalProfit;0)
	ARRAY TEXT:C222($_at_CurrencyCodeRange; 0)
	//ARRAY TEXT(ACC_at_BalAccountCodes;0)
	//ARRAY TEXT(ACC_at_BalAccountIdentity;0)
	//ARRAY TEXT(ACC_at_BalAnalysisCodes;0)
	//ARRAY TEXT(ACC_at_BalLayerCodes;0)
	//ARRAY TEXT(ACC_at_ProfitDetail;0)
	C_BOOLEAN:C305($_bo_EnterFirstYear; $_bo_UnloadRecords)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_BatchItemID; $_l_BatchItemReference; $_l_Index; $_l_Index2; $_l_Index3; $_l_OK; $_l_RecordCount; $_l_SlashPosition; $_l_TransPostStatus; $_l_UniqueIdentityPosition; $_l_Year)
	C_LONGINT:C283($_l_YearNum; DS_l_BATCHITEMRef; GEN_CB1; GEN_CB2; vAdd; vNo)
	C_REAL:C285($_r_Sum)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>YrPerF; <>YrPerT; $_t_Analysis; $_t_Choice1; $_t_Choice2; $_t_Layer; $_t_oldMethodName; $_t_PeriodFrom; $_t_UniqueIdentity; ACC_t_PeriodFrom)
	C_TEXT:C284(ACC_t_PeriodTo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Year_Close2_NEW")  //Year_Close2 - done Transaction by Transaction.
$_bo_UnloadRecords:=(Records in selection:C76([USER:15])=0)
Start_Process
If ((DB_GetModuleSettingByNUM(Module_NominalLedger)=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)=4))
	//DEFAULT TABLE([PERIODS])
	$_t_Choice1:=" All required postings have been made to the previous"+" year"
	$_t_Choice2:="Profit & Loss for all periods has been run & allowed posting of the Profit"
	$_l_OK:=GEN_Choices(2; $_t_Choice1; $_t_Choice2)
	ACC_LoadFinancialYears(True:C214)  //Added NG 2004
	
	
	//Gen_Confirm ("Only run this Utility when all required postings have been made to
	$_l_OK:=GEN_CB1
	If ($_l_OK=1)
		$_l_OK:=GEN_CB2
		//Gen_Confirm ("Have you run the Profit & Loss for all periods & allowed posting o
		//NG August 2004...Modifying this section. WHAT IF the year from has ALREADY been entered into the prefs
		If ($_l_OK=1)
			$_bo_EnterFirstYear:=False:C215
			If (Size of array:C274(ACC_ad_FinancialYearFrom)=0)
				Gen_Alert("For historical purposes please confirm the start period of the financial year you"+" a"+"re closing. This MUST be correct!")
				$_t_PeriodFrom:=Gen_Request("First Period for the OLD year:"; ACC_t_PeriodFrom)
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodFrom)
				If ((OK=1) & (Records in selection:C76([PERIODS:33])=1))
					ARRAY DATE:C224(ACC_ad_FinancialYearFrom; 1)
					ARRAY DATE:C224(ACC_ad_FinancialYearTo; 1)
					ACC_ad_FinancialYearFrom{1}:=[PERIODS:33]From_Date:3
					$_bo_EnterFirstYear:=True:C214
				End if 
				
			Else 
				
				
				
			End if 
			
			$_l_SlashPosition:=Position:C15("/"; <>YrPerF)
			$_l_Year:=Num:C11(Substring:C12(<>YrPerF; 1; $_l_SlashPosition-1))
			If (Length:C16(String:C10($_l_Year))=2)
				ACC_t_PeriodFrom:=Substring:C12(String:C10(Num:C11(Substring:C12(<>YrPerF; 1; 2))+1); 1+Num:C11(<>YrPerF="99@"); 2)+Substring:C12(<>YrPerF; 3; 7)
			Else 
				
				$_l_YearNum:=$_l_Year+1
				ACC_t_PeriodFrom:=String:C10($_l_YearNum)+Substring:C12(<>YrPerF; $_l_SlashPosition; Length:C16(<>YrPerF))
			End if 
			
			ACC_t_PeriodFrom:=Gen_Request("First Period for the new year:"; ACC_t_PeriodFrom)
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodFrom)
			If ((OK=1) & (Records in selection:C76([PERIODS:33])=1))
				If ($_bo_EnterFirstYear)  //Added NG August 2004
					ACC_ad_FinancialYearTo{1}:=[PERIODS:33]From_Date:3-1
				End if 
				$_l_UniqueIdentityPosition:=Find in array:C230(ACC_ad_FinancialYearFrom; [PERIODS:33]From_Date:3)
				If ($_l_UniqueIdentityPosition<0)  // Added NG August 2004
					INSERT IN ARRAY:C227(ACC_ad_FinancialYearTo; Size of array:C274(ACC_ad_FinancialYearTo)+1; 1)
					INSERT IN ARRAY:C227(ACC_ad_FinancialYearFrom; Size of array:C274(ACC_ad_FinancialYearFrom)+1; 1)
					ACC_ad_FinancialYearFrom{Size of array:C274(ACC_ad_FinancialYearFrom)}:=[PERIODS:33]From_Date:3
				End if 
				If ($_l_UniqueIdentityPosition>0)
					QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4=ACC_ad_FinancialYearTo{$_l_UniqueIdentityPosition})
					ACC_t_PeriodTo:=[PERIODS:33]Period_Code:1
				Else 
					$_l_SlashPosition:=Position:C15("/"; <>YrPerT)
					$_l_Year:=Num:C11(Substring:C12(<>YrPerT; 1; $_l_SlashPosition-1))
					If (Length:C16(String:C10($_l_Year))=2)
						ACC_t_PeriodTo:=Substring:C12(String:C10(Num:C11(Substring:C12(<>YrPerT; 1; 2))+1); 1+Num:C11(<>YrPerT="99@"); 2)+Substring:C12(<>YrPerT; 3; 7)
					Else 
						
						$_l_YearNum:=$_l_Year+1
						ACC_t_PeriodTo:=String:C10($_l_YearNum)+Substring:C12(<>YrPerT; $_l_SlashPosition; Length:C16(<>YrPerT))
					End if 
				End if 
				
				
				ACC_t_PeriodTo:=Gen_Request("Last Period for the new year:"; ACC_t_PeriodTo)
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodTo)
				If ((OK=1) & (Records in selection:C76([PERIODS:33])=1))
					//this section should be modified to automatically split the analyses/layers etc-NG August 2004
					//As with TB and BS we will load to arrays...based on the account balances
					//However the currency WILL NOT BE CONVERTED so we will do one posting per currency
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4>=ACC_t_PeriodFrom; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4<=ACC_t_PeriodTo)
					ARRAY TEXT:C222($_at_CurrencyCodeRange; 0)
					DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; $_at_CurrencyCodeRange)
					For ($_l_Index; Size of array:C274($_at_CurrencyCodeRange); 1; -1)
						If ($_at_CurrencyCodeRange{$_l_Index}="")
							$_l_UniqueIdentityPosition:=Find in array:C230($_at_CurrencyCodeRange; <>SYS_t_BaseCurrency)
							If ($_l_UniqueIdentityPosition>0)
								DELETE FROM ARRAY:C228($_at_CurrencyCodeRange; $_l_Index; 1)
							Else 
								$_at_CurrencyCodeRange{$_l_Index}:=<>SYS_t_BaseCurrency
							End if 
						End if 
					End for 
					For ($_l_Index; 1; Size of array:C274($_at_CurrencyCodeRange))
						QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4>=ACC_t_PeriodFrom; *)
						QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4<=ACC_t_PeriodTo; *)
						QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6<=$_at_CurrencyCodeRange{$_l_Index})
						If ($_at_CurrencyCodeRange{$_l_Index}=<>SYS_t_BaseCurrency)
							CREATE SET:C116([ACCOUNT_BALANCES:34]; "WithCurr")
							QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4>=ACC_t_PeriodFrom; *)
							QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4<=ACC_t_PeriodTo; *)
							QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
							CREATE SET:C116([ACCOUNT_BALANCES:34]; "WithoutCurr")
							UNION:C120("WithCurr"; "WithoutCurr"; "WithCurr")
							USE SET:C118("WithCurr")
							CLEAR SET:C117("WithCurr")
							CLEAR SET:C117("WithoutCurr")
						End if 
						ACC_LoadToArrays($_at_CurrencyCodeRange{$_l_Index}; False:C215; ACC_t_PeriodFrom; ACC_t_PeriodTo)
						ARRAY REAL:C219(ACC_ar_TotalProfit; 0)
						ARRAY REAL:C219(ACC_ar_PostedProfit; 0)
						ARRAY TEXT:C222(ACC_at_ProfitDetail; 0)
						For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAccountIdentity))
							$_t_Analysis:=" "*(10-Length:C16(ACC_at_BalAnalysisCodes{$_l_Index2}))+ACC_at_BalAnalysisCodes{$_l_Index2}
							$_t_Layer:=" "*(6-Length:C16(ACC_at_BalLayerCodes{$_l_Index2}))+ACC_at_BalLayerCodes{$_l_Index2}
							$_t_UniqueIdentity:=$_t_Analysis+$_t_Layer
							Case of 
								: (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC) | (ACC_at_BalAccountCodes{$_l_Index}=("-"+DB_GetLedgerBroughtforwardACC))
									$_l_UniqueIdentityPosition:=Find in array:C230(ACC_at_ProfitDetail; $_t_UniqueIdentity)
									If ($_l_UniqueIdentityPosition<0)
										INSERT IN ARRAY:C227(ACC_at_ProfitDetail; Size of array:C274(ACC_at_ProfitDetail)+1; 1)
										ACC_at_ProfitDetail{Size of array:C274(ACC_at_ProfitDetail)}:=$_t_UniqueIdentity
										$_l_UniqueIdentityPosition:=Size of array:C274(ACC_at_ProfitDetail)
									End if 
									
									QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8=ACC_at_BalAccountIdentity{$_l_Index2})
									ACC_ar_PostedProfit{$_l_UniqueIdentityPosition}:=ACC_ar_PostedProfit{$_l_UniqueIdentityPosition}+[ACCOUNT_BALANCES:34]Balance:3
								: (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC) | (ACC_at_BalAccountCodes{$_l_Index}=("-"+DB_GetLedgerProfitACC))
									$_l_UniqueIdentityPosition:=Find in array:C230(ACC_at_ProfitDetail; $_t_UniqueIdentity)
									If ($_l_UniqueIdentityPosition<0)
										INSERT IN ARRAY:C227(ACC_at_ProfitDetail; Size of array:C274(ACC_at_ProfitDetail)+1; 1)
										ACC_at_ProfitDetail{Size of array:C274(ACC_at_ProfitDetail)}:=$_t_UniqueIdentity
										$_l_UniqueIdentityPosition:=Size of array:C274(ACC_at_ProfitDetail)
									End if 
									ACC_ar_TotalProfit{$_l_UniqueIdentityPosition}:=ACC_ar_TotalProfit{$_l_UniqueIdentityPosition}+ACC_ar_BalOuptutAccountBalance{$_l_Index2}
							End case 
							
						End for 
					End for 
					//this will give us all the profit figures to post
					// what we need to do here is check what (if anything) is already posted
					//As with TB and BS we will load to arrays...based on the account balances
					//However the currency WILL NOT BE CONVERTED so we will do one posting per currency
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4>=ACC_t_PeriodFrom; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4<=ACC_t_PeriodTo)
					ARRAY TEXT:C222($_at_CurrencyCodeRange; 0)
					DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; $_at_CurrencyCodeRange)
					For ($_l_Index; Size of array:C274($_at_CurrencyCodeRange); 1; -1)
						If ($_at_CurrencyCodeRange{$_l_Index}="")
							$_l_UniqueIdentityPosition:=Find in array:C230($_at_CurrencyCodeRange; <>SYS_t_BaseCurrency)
							If ($_l_UniqueIdentityPosition>0)
								DELETE FROM ARRAY:C228($_at_CurrencyCodeRange; $_l_Index; 1)
							Else 
								$_at_CurrencyCodeRange{$_l_Index}:=<>SYS_t_BaseCurrency
							End if 
						End if 
					End for 
					For ($_l_Index; 1; Size of array:C274($_at_CurrencyCodeRange))
						QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4>=ACC_t_PeriodFrom; *)
						QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4<=ACC_t_PeriodTo; *)
						QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6<=$_at_CurrencyCodeRange{$_l_Index})
						If ($_at_CurrencyCodeRange{$_l_Index}=<>SYS_t_BaseCurrency)
							CREATE SET:C116([ACCOUNT_BALANCES:34]; "WithCurr")
							QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4>=ACC_t_PeriodFrom; *)
							QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4<=ACC_t_PeriodTo; *)
							QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
							CREATE SET:C116([ACCOUNT_BALANCES:34]; "WithoutCurr")
							UNION:C120("WithCurr"; "WithoutCurr"; "WithCurr")
							USE SET:C118("WithCurr")
							CLEAR SET:C117("WithCurr")
							CLEAR SET:C117("WithoutCurr")
						End if 
						ACC_LoadToArrays($_at_CurrencyCodeRange{$_l_Index}; False:C215; ACC_t_PeriodFrom; ACC_t_PeriodTo)
						ARRAY REAL:C219(ACC_ar_TotalProfit; 0)
						ARRAY REAL:C219(ACC_ar_PostedProfit; 0)
						ARRAY TEXT:C222(ACC_at_ProfitDetail; 0)
						For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAccountIdentity))
							$_t_Analysis:=" "*(10-Length:C16(ACC_at_BalAnalysisCodes{$_l_Index2}))+ACC_at_BalAnalysisCodes{$_l_Index2}
							$_t_Layer:=" "*(6-Length:C16(ACC_at_BalLayerCodes{$_l_Index2}))+ACC_at_BalLayerCodes{$_l_Index2}
							$_t_UniqueIdentity:=$_t_Analysis+$_t_Layer
							Case of 
								: (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC) | (ACC_at_BalAccountCodes{$_l_Index}=("-"+DB_GetLedgerBroughtforwardACC))
									$_l_UniqueIdentityPosition:=Find in array:C230(ACC_at_ProfitDetail; $_t_UniqueIdentity)
									If ($_l_UniqueIdentityPosition<0)
										INSERT IN ARRAY:C227(ACC_at_ProfitDetail; Size of array:C274(ACC_at_ProfitDetail)+1; 1)
										ACC_at_ProfitDetail{Size of array:C274(ACC_at_ProfitDetail)}:=$_t_UniqueIdentity
										$_l_UniqueIdentityPosition:=Size of array:C274(ACC_at_ProfitDetail)
									End if 
									
									QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8=ACC_at_BalAccountIdentity{$_l_Index2})
									ACC_ar_PostedProfit{$_l_UniqueIdentityPosition}:=ACC_ar_PostedProfit{$_l_UniqueIdentityPosition}+[ACCOUNT_BALANCES:34]Balance:3
								: (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC) | (ACC_at_BalAccountCodes{$_l_Index}=("-"+DB_GetLedgerProfitACC))
									$_l_UniqueIdentityPosition:=Find in array:C230(ACC_at_ProfitDetail; $_t_UniqueIdentity)
									If ($_l_UniqueIdentityPosition<0)
										INSERT IN ARRAY:C227(ACC_at_ProfitDetail; Size of array:C274(ACC_at_ProfitDetail)+1; 1)
										ACC_at_ProfitDetail{Size of array:C274(ACC_at_ProfitDetail)}:=$_t_UniqueIdentity
										$_l_UniqueIdentityPosition:=Size of array:C274(ACC_at_ProfitDetail)
									End if 
									ACC_ar_TotalProfit{$_l_UniqueIdentityPosition}:=ACC_ar_TotalProfit{$_l_UniqueIdentityPosition}+ACC_ar_BalOuptutAccountBalance{$_l_Index2}
							End case 
							
						End for 
					End for 
					//this will give us all the profit figures to post
					// what we need to do here is check what (if anything) is already posted
					
					
					
					READ WRITE:C146([TRANSACTIONS:29])
					
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetLedgerProfitACC; *)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12>=<>YrPerF; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12<=<>YrPerT)
					vNo:=Records in selection:C76([TRANSACTIONS:29])
					If (vNo>0)
						$_r_Sum:=Gen_Round((0-Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
						Gen_Confirm("There are "+String:C10(vNo)+" Profit/Loss postings to be transferred, with a total value of "+String:C10($_r_Sum; "|Accounts")+Char:C90(13)+"(not corrected for Currencies). Go ahead?"; "Yes"; "No")
						If (OK=1)
							Are_You_Sure
							If (OK=1)
								//  START TRANSACTION
								StartTransaction  // 13/05/02 pb
								
								READ WRITE:C146([PERIODS:33])
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1>=<>YrPerF; *)
								QUERY:C277([PERIODS:33];  & ; [PERIODS:33]Period_Code:1<=<>YrPerT)
								If (Not:C34(In transaction:C397))
									DB_lockFile(->[PERIODS:33])
									APPLY TO SELECTION:C70([PERIODS:33]; [PERIODS:33]SL_Closed:7:=True:C214)
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
									DB_lockFile(->[PERIODS:33])
									APPLY TO SELECTION:C70([PERIODS:33]; [PERIODS:33]PL_Closed:8:=True:C214)
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
									DB_lockFile(->[PERIODS:33])
									APPLY TO SELECTION:C70([PERIODS:33]; [PERIODS:33]NL_Closed:5:=True:C214)
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
								Else 
									FIRST RECORD:C50([PERIODS:33])
									For ($_l_Index3; 1; Records in selection:C76([PERIODS:33]))
										[PERIODS:33]SL_Closed:7:=True:C214
										[PERIODS:33]PL_Closed:8:=True:C214
										[PERIODS:33]NL_Closed:5:=True:C214
										DB_SaveRecord(->[PERIODS:33])
										AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
										NEXT RECORD:C51([PERIODS:33])
									End for 
								End if 
								
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodFrom)
								[PERIODS:33]NL_Closed:5:=False:C215
								[PERIODS:33]SL_Closed:7:=False:C215
								[PERIODS:33]PL_Closed:8:=False:C215
								DB_SaveRecord(->[PERIODS:33])
								AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
								READ WRITE:C146([TRANSACTION_BATCHES:30])
								CREATE RECORD:C68([TRANSACTION_BATCHES:30])
								BatchNo
								[TRANSACTION_BATCHES:30]Batch_Date:1:=<>DB_d_CurrentDate
								[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
								[TRANSACTION_BATCHES:30]Batch_Amount:3:=$_r_Sum
								[TRANSACTION_BATCHES:30]Batch_Total:5:=$_r_Sum
								[TRANSACTION_BATCHES:30]Description:12:="Year_Close transfer of P&L YTD to P&L B'FWD"
								$_l_RecordCount:=Records in selection:C76([TRANSACTIONS:29])
								$_l_BatchItemReference:=0
								$_l_BatchItemID:=0
								$_l_BatchItemID:=(AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30; -$_l_RecordCount))-$_l_RecordCount
								$_l_BatchItemReference:=(AA_GetNextIDinMethod(->DS_l_BATCHITEMRef; -$_l_RecordCount))-$_l_RecordCount
								
								While (Not:C34(End selection:C36([TRANSACTIONS:29])))
									CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
									If ($_l_BatchItemID>0)
										[TRANSACTION_BATCH_ITEMS:155]ID:30:=$_l_BatchItemID
										$_l_BatchItemID:=$_l_BatchItemID+1
									Else 
										[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
									End if 
									If ($_l_BatchItemReference>0)
										[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=$_l_BatchItemReference
										$_l_BatchItemReference:=$_l_BatchItemReference
									Else 
										[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
									End if 
									
									[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
									
									[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:="PLYC"
									[TRANSACTION_BATCH_ITEMS:155]Description:10:="Year End transfer of Batch "+String:C10([TRANSACTIONS:29]Batch_Number:7)
									[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=DB_GetLedgerProfitACC
									[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=DB_GetLedgerBroughtforwardACC
									[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[TRANSACTIONS:29]Period_Code:12
									[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=<>DB_d_CurrentDate
									[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round((0-[TRANSACTIONS:29]Amount:6); 2; 2)
									[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=Gen_Round((0-[TRANSACTIONS:29]Tax_Amount:16); 2; 2)
									[TRANSACTION_BATCH_ITEMS:155]Total:9:=Gen_Round((0-[TRANSACTIONS:29]Total:17); 2; 2)
									[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:="N"
									[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="N"
									[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="N"
									[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
									[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTIONS:29]Analysis_Code:2
									[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[TRANSACTIONS:29]Currency_Code:22
									[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[TRANSACTIONS:29]Layer_Code:23
									DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
									
									[TRANSACTIONS:29]Reconciled:14:=True:C214
									DB_SaveRecord(->[TRANSACTIONS:29])
									
									AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
									NEXT RECORD:C51([TRANSACTIONS:29])
								End while 
								DB_SaveRecord(->[TRANSACTION_BATCHES:30])
								vAdd:=0
								$_l_TransPostStatus:=TransactionBatch_Post
								
								If (OK=1) & ($_l_TransPostStatus>=0)
									READ WRITE:C146([USER:15])
									ALL RECORDS:C47([USER:15])
									FIRST RECORD:C50([USER:15])
									[USER:15]Year PeriodF:22:=ACC_t_PeriodFrom
									<>YrPerF:=ACC_t_PeriodFrom
									[USER:15]Year PeriodT:23:=ACC_t_PeriodTo
									<>YrPerT:=ACC_t_PeriodTo
									DB_SaveRecord(->[USER:15])
								End if 
								
								If (OK=0) | ($_l_TransPostStatus<0)
									Gen_Alert("Year_Close aborted"; "")
									OK:=0
								End if 
								If ($_l_TransPostStatus>=0)
									Transact_End
								Else 
									Transact_End(False:C215)
									
								End if 
								
							Else 
								Gen_Alert("Year_Close aborted"; "")
							End if 
						Else 
							Gen_Alert("Year_Close aborted"; "")
						End if 
					Else 
						Gen_Alert("Year_Close aborted: no Profit/Loss figures need to be transferred"; "")
					End if 
				Else 
					Gen_Alert("Year_Close aborted: please first set up relevant Periods"; "")
				End if 
			Else 
				Gen_Alert("Year_Close aborted: please first set up relevant Periods"; "")
			End if 
		Else 
			Gen_Alert("Year_Close aborted"; "")
		End if 
	Else 
		Gen_Alert("Year_Close aborted"; "")
	End if 
Else 
	Gen_Alert("You do not have access to the General Ledger"; "")
End if 
If ($_bo_UnloadRecords)
	UNLOAD RECORD:C212([USER:15])
End if 
UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
UNLOAD RECORD:C212([TRANSACTIONS:29])
UNLOAD RECORD:C212([PERIODS:33])
UNLOAD RECORD:C212([ACCOUNTS:32])
READ ONLY:C145([USER:15])
READ ONLY:C145([TRANSACTION_BATCHES:30])
READ ONLY:C145([TRANSACTIONS:29])
READ ONLY:C145([PERIODS:33])
Process_End
ERR_MethodTrackerReturn("Year_Close2_NEW"; $_t_oldMethodName)
