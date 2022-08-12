//%attributes = {}
If (False:C215)
	//Project Method Name:      Year Close
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 12:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Index; $_l_TransPostStatus; DS_l_BATCHITEMRef; vAdd)
	C_REAL:C285($_r_Sum)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>YrPerF; <>YrPerT; $_t_oldMethodName; ACC_t_PeriodFrom; ACC_t_PeriodTo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Year Close")
//Year close
Start_Process
If ((DB_GetModuleSettingByNUM(Module_NominalLedger)=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)=4))
	
	Gen_Confirm("Only run this Utility when all required postings have been made to the previous"+" year"; ""; "")
	If (OK=1)
		Gen_Confirm("Have you run the Profit & Loss for all periods & allowed posting of the Profit?"; "Yes"; "No")
		If (OK=1)
			ACC_t_PeriodFrom:=Gen_Request("First Period for the new year:")
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodFrom)
			If ((OK=1) & (Records in selection:C76([PERIODS:33])=1))
				ACC_t_PeriodTo:=Gen_Request("Last Period for the new year:")
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodTo)
				If ((OK=1) & (Records in selection:C76([PERIODS:33])=1))
					READ ONLY:C145([ACCOUNT_BALANCES:34])
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerProfitACC; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4>=<>YrPerF; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4<=<>YrPerT)
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Layer_Code:5=DB_GetLedgerActualLayer; *)
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Layer_Code:5="")
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=<>SYS_t_BaseCurrency; *)
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
					$_r_Sum:=Round:C94((0-Sum:C1([ACCOUNT_BALANCES:34]Balance:3)); 2)
					Gen_Confirm("Total Profit/Loss for the year is "+String:C10($_r_Sum)+".  Go ahead?"; "Yes"; "No")
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
								For ($_l_Index; 1; Records in selection:C76([PERIODS:33]))
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
							[TRANSACTION_BATCHES:30]Description:12:="Year close transfer of P&L YTD to P&L B'FWD"
							
							CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
							[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
							
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:="PLYC"
							[TRANSACTION_BATCH_ITEMS:155]Description:10:="P&L Year End posting"
							[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=DB_GetLedgerProfitACC
							[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=DB_GetLedgerBroughtforwardACC
							[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=<>YrPerT
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=<>DB_d_CurrentDate
							[TRANSACTION_BATCH_ITEMS:155]Amount:6:=$_r_Sum
							[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:="N"
							[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="N"
							[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="N"
							[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
							[TRANSACTION_BATCH_ITEMS:155]Total:9:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
							[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
							[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
							[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
							If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
								[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
							End if 
							DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
							
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
								Gen_Alert("Year close aborted"; "")
								OK:=0
							End if 
							If ($_l_TransPostStatus>=0)
								Transact_End
							Else 
								Transact_End(False:C215)
							End if 
							
						Else 
							Gen_Alert("Year close aborted"; "")
						End if 
					Else 
						Gen_Alert("Year close aborted"; "")
					End if 
				Else 
					Gen_Alert("Year close aborted: please first set up relevant Periods"; "")
				End if 
			Else 
				Gen_Alert("Year close aborted: please first set up relevant Periods"; "")
			End if 
		Else 
			Gen_Alert("Year close aborted"; "")
		End if 
	Else 
		Gen_Alert("Year close aborted"; "")
	End if 
Else 
	Gen_Alert("You do not have access to the General Ledger"; "")
End if 
UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
UNLOAD RECORD:C212([TRANSACTIONS:29])
UNLOAD RECORD:C212([PERIODS:33])
UNLOAD RECORD:C212([ACCOUNTS:32])
READ ONLY:C145([USER:15])
READ ONLY:C145([TRANSACTION_BATCHES:30])
READ ONLY:C145([PERIODS:33])
Process_End
ERR_MethodTrackerReturn("Year Close"; $_t_oldMethodName)
