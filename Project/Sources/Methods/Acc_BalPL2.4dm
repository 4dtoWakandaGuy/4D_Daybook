//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalPL2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/01/2010 17:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_NotLocked)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_AddMode; $_l_CanClosePeriod; $_l_PeriodID; $_l_TransPostResult; $1; DS_l_BATCHITEMRef; MOD_l_CurrentModuleAccess; r1; Vadd)
	C_REAL:C285(vAmount; vPNTot; vTot)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>YrPerT; $_t_FormDisplayed; $_t_oldMethodName; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vAnalCodeT; vPeriod)
	C_TEXT:C284(vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalPL2")
//Post vPNTot to the YTD Profit Account

OK:=1
$_l_CanClosePeriod:=0
If (MOD_l_CurrentModuleAccess#3)
	If (vPeriod<=<>YrPerT)
		If (ACC_t_CurrencyCode#"")
			If (r1=0)
				If ((ACC_t_AnalysisCodeFrom#"") | (DB_GetLedgerRequireAnalysis=False:C215))
					If (ACC_t_AnalysisCodeFrom=vAnalCodeT)
						If (OK=1)
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1="PLYT"; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=vPeriod)
							If (vText=DB_GetLedgerActualLayer)
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=""; *)
								QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Layer_Code:23=vText)
							Else 
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=vText)
							End if 
							If (ACC_t_CurrencyCode=<>SYS_t_BaseCurrency)
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=""; *)
								QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22=ACC_t_CurrencyCode)
							Else 
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=ACC_t_CurrencyCode)
							End if 
							CREATE SET:C116([TRANSACTIONS:29]; "Master")
							If (ACC_t_AnalysisCodeFrom#"")
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2="")
								If (Records in selection:C76([TRANSACTIONS:29])>0)
									Gen_Alert("NB: Profit/Loss cannot be posted for the specified Analysis because "+"it has already been posted across all Analyses"; "")
									OK:=0
								End if 
								If (OK=1)
									USE SET:C118("Master")
									QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=ACC_t_AnalysisCodeFrom)
								End if 
							Else 
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2#"")
								If (Records in selection:C76([TRANSACTIONS:29])>0)
									Gen_Alert(Term_NLWT("NB: Profit/Loss has already been posted for one or more specified Analyses.")+" The difference can now be posted, but no further single-"+"Analysis postings will then be allowed for this Period."; "")
									//   OK:=0
								End if 
								USE SET:C118("Master")
							End if 
							CLOSE WINDOW:C154
							
							If (OK=1)
								vTot:=Round:C94((Sum:C1([TRANSACTIONS:29]Amount:6)); 2)  //vtot is the
								If (vTot#vPNTot)
									If (vPeriod<<>YrPerF)
										Gen_Confirm("Do you want to post the "+vPeriod+Term_NLWT(" Profit/Loss to the BS B'FWD Account?"); "Yes"; "No")
									Else 
										Gen_Confirm("Do you want to post the "+vPeriod+Term_NLWT(" Profit/Loss to the BS YTD Account?"); "Yes"; "No")
									End if 
									If (OK=1)
										Are_You_Sure
										If (OK=1)
											
											vPeriod:=Uppercase:C13(vPeriod)
											//                     START TRANSACTION
											StartTransaction  // 13/05/02 pb
											
											READ WRITE:C146([ACCOUNT_BALANCES:34])
											CREATE RECORD:C68([TRANSACTION_BATCHES:30])
											BatchNo
											[TRANSACTION_BATCHES:30]Batch_Date:1:=<>DB_d_CurrentDate
											[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
											If (Records in selection:C76([TRANSACTIONS:29])>0)
												vAmount:=Round:C94((vPNTot-vTot); 2)
											Else 
												vAmount:=vPNTot
											End if 
											[TRANSACTION_BATCHES:30]Batch_Amount:3:=vAmount
											[TRANSACTION_BATCHES:30]Batch_Total:5:=vAmount
											[TRANSACTION_BATCHES:30]Description:12:="Posting of "+vPeriod+Term_NLWT(" P/L to BS")
											CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
											[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
											[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
											
											[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:="PLYT"
											If (vPeriod<<>YrPerF)
												[TRANSACTION_BATCH_ITEMS:155]Description:10:=Term_NLWT("P/L B'FWD posting")
												[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=DB_GetLedgerBroughtforwardACC
												//  [TRANS IN_TRANS SUB]Credit Acc:=◊ProfAdj
												[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=""
											Else 
												[TRANSACTION_BATCH_ITEMS:155]Description:10:=Term_NLWT("P/L YTD posting")
												[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=DB_GetLedgerProfitACC
												[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=""
											End if 
											[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="N"
											[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="N"
											[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
											[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=vPeriod
											[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=<>DB_d_CurrentDate
											[TRANSACTION_BATCH_ITEMS:155]Amount:6:=vAmount
											[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:="N"
											[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
											[TRANSACTION_BATCH_ITEMS:155]Total:9:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
											[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=Uppercase:C13(ACC_t_CurrencyCode)
											[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=Uppercase:C13(vText)
											[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=Uppercase:C13(ACC_t_AnalysisCodeFrom)
											If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
												[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
											End if 
											DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
											DB_SaveRecord(->[TRANSACTION_BATCHES:30])
											
											ACC_BalPL2Per
											$_l_AddMode:=Vadd
											$_t_FormDisplayed:=DB_t_CurrentFormUsage2
											vAdd:=0
											DB_t_CurrentFormUsage2:="NBat"
											If (OK=1)
												$_l_TransPostResult:=TransactionBatch_Post
											End if 
											$_l_CanClosePeriod:=1
											Vadd:=$_l_AddMode
											DB_t_CurrentFormUsage2:=$_t_FormDisplayed
											If ($_l_TransPostResult>=0)
												Transact_End
											Else 
												Gen_Alert("Posting the profit has been cancelled")
												Transact_End(False:C215)
											End if 
										End if 
									End if 
								Else 
									Gen_Alert(Term_NLWT("NB: Profit/Loss has already been fully posted for this Period"); "")
									If (Records in selection:C76([TRANSACTIONS:29])>0)
										$_l_CanClosePeriod:=1
									End if 
									QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=vPeriod)
									If ([PERIODS:33]Profit_Posted:9=False:C215)
										ACC_BalPL2Per
									End if 
								End if 
							End if 
						End if 
					Else 
						Gen_Alert(Term_NLWT("NB: Profit/Loss cannot be posted unless either all Analyses or a single Analysi"+"s is specified"); "")
					End if 
				Else 
					Gen_Alert(Term_NLWT("The Profit/Loss can only be posted for one specified Analysis"); "OK")
				End if 
			Else 
				Gen_Alert(Term_NLWT("NB: Profit/Loss cannot be posted for converted Currencies ")+" - each must must be posted individually"; "")
			End if 
		Else 
			Gen_Alert(Term_NLWT("NB: Profit/Loss cannot be posted unless a single Currency is specified"); "")
		End if 
	Else 
		Gen_Alert(Term_NLWT("NB: Profit/Loss cannot be posted for a Period beyond your current year end"); "")
	End if 
Else 
	Gen_Alert(Term_NLWT("NB: Profit/Loss cannot be posted unless you have full access to the ")+"General Ledger"; "")
End if 

//Close the period
If (($_l_CanClosePeriod=1) & (MOD_l_CurrentModuleAccess#3))
	If (([PERIODS:33]From_Date:3<=<>DB_d_CurrentDate) & ([PERIODS:33]NL_Closed:5=False:C215))
		Gen_Confirm("Do you want to Close this Period & Open the next?"; "Yes"; "No")
		If (OK=1)
			Are_You_Sure
			If (OK=1)
				READ WRITE:C146([PERIODS:33])
				$_bo_NotLocked:=Check_Locked(->[PERIODS:33]; 2)
				If ($_bo_NotLocked)
					[PERIODS:33]NL_Closed:5:=True:C214
					[PERIODS:33]SL_Closed:7:=True:C214
					[PERIODS:33]PL_Closed:8:=True:C214
					DB_SaveRecord(->[PERIODS:33])
					AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
					vDate:=[PERIODS:33]To_Date:4+1
					$_l_PeriodID:=Check_Period
					If ([PERIODS:33]Period_Code:1#"")
						$_bo_NotLocked:=Check_Locked(->[PERIODS:33]; 2)
						If ($_bo_NotLocked)
							[PERIODS:33]NL_Closed:5:=False:C215
							[PERIODS:33]SL_Closed:7:=False:C215
							[PERIODS:33]PL_Closed:8:=False:C215
							DB_SaveRecord(->[PERIODS:33])
							AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
						Else 
							Gen_Alert("Opening Aborted - the Period was in use."; "Cancel")
						End if 
					End if 
				Else 
					Gen_Alert("Closure Aborted - the Period was in use."; "Cancel")
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Acc_BalPL2"; $_t_oldMethodName)
