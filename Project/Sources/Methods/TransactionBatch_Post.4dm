//%attributes = {}
If (False:C215)
	//Project Method Name:      TransactionBatch_Post
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2009 17:04`Method: TransactionBatch_Post
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_TransInSubUpdate; 0)
	ARRAY DATE:C224($_ad_TransInSubDate; 0)
	ARRAY LONGINT:C221($_al_IgnoreMismatchedCredits; 0)
	ARRAY LONGINT:C221($_al_IgnoreMismatchedDebit; 0)
	ARRAY LONGINT:C221($_al_TransinSubBatchnos; 0)
	ARRAY LONGINT:C221($_al_TransInSubCreditTransID; 0)
	ARRAY LONGINT:C221($_al_TransInSubDebitTransID; 0)
	ARRAY LONGINT:C221($_al_TransinSubIDs; 0)
	ARRAY LONGINT:C221($_al_TransinSubItemID; 0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY REAL:C219($_ar_TransinSubAmounts; 0)
	ARRAY REAL:C219($_ar_TransinSubSecondAmounts; 0)
	ARRAY REAL:C219($_ar_TransinSubTaxAmounts; 0)
	ARRAY REAL:C219($_ar_TransinSubTotals; 0)
	//ARRAY REAL(TRANS_ar_PostEuroAmount;0)
	//ARRAY REAL(TRNS_ar_Postamount;0)
	ARRAY TEXT:C222($_at_TransinSubAnalysis; 0)
	ARRAY TEXT:C222($_at_TransinSubChequeNumbers; 0)
	ARRAY TEXT:C222($_at_TransinSubCompanyCodes; 0)
	ARRAY TEXT:C222($_at_TransinSubCreditAccounts; 0)
	ARRAY TEXT:C222($_at_TransInSubCreditIO; 0)
	ARRAY TEXT:C222($_at_TransinSubCurrencyCodes; 0)
	ARRAY TEXT:C222($_at_TransinSubDebitAccounts; 0)
	ARRAY TEXT:C222($_at_TransInSubDebitIO; 0)
	ARRAY TEXT:C222($_at_TransinSubDescriptions; 0)
	ARRAY TEXT:C222($_at_TransinSubInvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_TransinSuJob_blb_JobCodes; 0)
	ARRAY TEXT:C222($_at_TransInSubLayerCode; 0)
	ARRAY TEXT:C222($_at_TransinSubPeriodCodes; 0)
	ARRAY TEXT:C222($_at_TransinSubPICodes; 0)
	ARRAY TEXT:C222($_at_TransinSubPOCodes; 0)
	ARRAY TEXT:C222($_at_TransinSubTaxCodes; 0)
	ARRAY TEXT:C222($_at_TransinSubUKEC; 0)
	ARRAY TEXT:C222($_at_TransinTransCodes; 0)
	//ARRAY TEXT(TRNS_at_AccountIdentity;0)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; $_bo_Continue; $_bo_noPost; $_bo_notLocked; $_bo_Phantom; vHideMessages; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; $IND)
	C_LONGINT:C283($_l_Count; $_l_PostIndex; $_l_PostIndex2; $_l_Process; $_l_SizeofAccountArray; $_l_SizeofArray; $_l_TransPostStatus; $_l_UpdatePInvoiceProcess; $_l_UpdateRow; $_l_UpdateSalesInvoiceProcess; $_l_WindowRow)
	C_LONGINT:C283($0; $1; Vadd; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_AccBalance; $_r_AccBalance2; $_r_CreditAmount; $_r_CreditTotal; $_r_CreditVAT; $_r_DebitAmount; $_r_DebitTotal; $_r_DebitVAT; $_r_PostAmount; $_r_TestAmount)
	C_TEXT:C284(<>PER_t_CurrentUserName; $_t_CreditIO; $_t_DebitIO; $_t_oldMethodName; $_t_TestString; $_t_UniqueIdentity; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; Vtext)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransactionBatch_Post")
//Project Method TransactionBatch_Post 26/3/2(ID-760-16518)

//TransactionBatch_Post

$0:=0
If (OK=1)
	<>SYS_bo_CurrentWindowModal:=True:C214
	If ((DB_GetLedgerViaBatch) & (DB_t_CurrentFormUsage2#"NBat"))
		TransB_InCalc
		If (Count parameters:C259=0)
			TransactionBatch_PostCh
		End if 
		If (OK=1)
			If (DB_t_CurrentFormUsage2#"NWin")
				Open_AnyTypeWindow(200; 340; 5; "General Ledger Posting")
			End if 
			If (vHideMessages=False:C215)  //added 12/03/07 -kmw
				MESSAGE:C88(Char:C90(13)+"   Processing Transactions Batch No "+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+" ... "+Char:C90(13))
				MESSAGE:C88(Char:C90(13)+"   Batched")
			End if   //added 12/03/07 -kmw
			If (Macintosh command down:C546) | (Windows Alt down:C563)
				Gen_Alert(Char:C90(13)+"   Processing Transactions Batch No "+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+" ... "+Char:C90(13)+"Batched")
			End if 
			[TRANSACTION_BATCHES:30]State:15:=1
			DB_SaveRecord(->[TRANSACTION_BATCHES:30])
			$_l_TransPostStatus:=1
			If (DB_t_CurrentFormUsage2#"NWin")
				CLOSE WINDOW:C154
				If (WIN_bo_TrackerInited)
					$_l_WindowRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowRow}
					End if 
				End if 
			End if 
		Else 
			$0:=-1
		End if 
	Else 
		If (Count parameters:C259=0)
			TransB_InCalc
			TransactionBatch_PostCh
		End if 
		If (OK=1)
			If (DB_t_CurrentFormUsage2#"NWin") & (Application type:C494#4D Server:K5:6)
				Open_AnyTypeWindow(200; 340; 5; "General Ledger Posting")
			Else 
				vHideMessages:=True:C214
			End if 
			If (vHideMessages=False:C215)  //added 12/03/07 -kmw
				MESSAGE:C88(Char:C90(13)+"   Processing Transactions Batch No "+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+" ... "+Char:C90(13))
			End if   //added 12/03/07 -kmw
			
			READ WRITE:C146([TRANSACTIONS:29])
			READ WRITE:C146([ACCOUNT_BALANCES:34])
			QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
			
			
			FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
			OK:=1
			$_bo_Phantom:=False:C215
			ARRAY TEXT:C222(TRNS_at_AccountIdentity; 0)
			ARRAY REAL:C219(TRNS_ar_Postamount; 0)
			ARRAY REAL:C219(TRANS_ar_PostEuroAmount; 0)
			
			//ARRAY STRING(80;SRSerial;0)
			//ARRAY REAL(SRAmount;0)
			$_l_Count:=0
			If (Macintosh command down:C546) | (Windows Alt down:C563)
				//  ALERT(Char(13)+"   Processing Transactions Batch No "+String([TRANS IN]Batch N
				Gen_Alert(Char:C90(13)+"   Processing Transactions Batch No "+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+" ... "+Char:C90(13))
			End if 
			
			ARRAY REAL:C219($_ar_TransinSubAmounts; 0)
			ARRAY TEXT:C222($_at_TransinSubAnalysis; 0)
			ARRAY LONGINT:C221($_al_TransinSubItemID; 0)
			ARRAY TEXT:C222($_at_TransinSubChequeNumbers; 0)
			ARRAY TEXT:C222($_at_TransinSubCompanyCodes; 0)
			ARRAY TEXT:C222($_at_TransinSubCreditAccounts; 0)
			ARRAY TEXT:C222($_at_TransInSubCreditIO; 0)
			ARRAY LONGINT:C221($_al_TransInSubCreditTransID; 0)
			ARRAY TEXT:C222($_at_TransinSubCurrencyCodes; 0)
			ARRAY TEXT:C222($_at_TransinSubDebitAccounts; 0)
			ARRAY TEXT:C222($_at_TransInSubDebitIO; 0)
			ARRAY LONGINT:C221($_al_TransInSubDebitTransID; 0)
			ARRAY TEXT:C222($_at_TransinSubDescriptions; 0)
			ARRAY LONGINT:C221($_al_TransinSubIDs; 0)
			
			ARRAY TEXT:C222($_at_TransinSubInvoiceNumbers; 0)
			ARRAY TEXT:C222($_at_TransinSuJob_blb_JobCodes; 0)
			ARRAY TEXT:C222($_at_TransInSubLayerCode; 0)
			ARRAY LONGINT:C221($_al_TransinSubBatchnos; 0)
			ARRAY TEXT:C222($_at_TransinSubPeriodCodes; 0)
			ARRAY TEXT:C222($_at_TransinSubPICodes; 0)
			ARRAY TEXT:C222($_at_TransinSubPOCodes; 0)
			ARRAY REAL:C219($_ar_TransinSubSecondAmounts; 0)
			ARRAY REAL:C219($_ar_TransinSubTaxAmounts; 0)
			ARRAY TEXT:C222($_at_TransinSubTaxCodes; 0)
			ARRAY REAL:C219($_ar_TransinSubTotals; 0)
			ARRAY TEXT:C222($_at_TransinTransCodes; 0)
			ARRAY DATE:C224($_ad_TransInSubDate; 0)
			ARRAY TEXT:C222($_at_TransinSubUKEC; 0)
			ARRAY LONGINT:C221($_al_IgnoreMismatchedCredits; 0)
			ARRAY LONGINT:C221($_al_IgnoreMismatchedDebit; 0)
			
			SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29; $_al_IgnoreMismatchedDebit; [TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28; $_al_IgnoreMismatchedCredits; [TRANSACTION_BATCH_ITEMS:155]UK_EC:18; $_at_TransinSubUKEC; [TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; $_ad_TransInSubDate; [TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1; $_at_TransinTransCodes; [TRANSACTION_BATCH_ITEMS:155]Total:9; $_ar_TransinSubTotals; [TRANSACTION_BATCH_ITEMS:155]Tax_Code:7; $_at_TransinSubTaxCodes; [TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; $_ar_TransinSubTaxAmounts; [TRANSACTION_BATCH_ITEMS:155]Second_Amount:21; $_ar_TransinSubSecondAmounts; [TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22; $_at_TransinSubPOCodes; [TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17; $_at_TransinSubPICodes; [TRANSACTION_BATCH_ITEMS:155]Period_Code:11; $_at_TransinSubPeriodCodes; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_TransinSubBatchnos; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; $_at_TransInSubLayerCode; [TRANSACTION_BATCH_ITEMS:155]Job_Code:23; $_at_TransinSuJob_blb_JobCodes; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4; $_at_TransinSubInvoiceNumbers; [TRANSACTION_BATCH_ITEMS:155]ID:30; $_al_TransinSubIDs; [TRANSACTION_BATCH_ITEMS:155]Description:10; $_at_TransinSubDescriptions; [TRANSACTION_BATCH_ITEMS:155]DebitTransID:27; $_al_TransInSubDebitTransID; [TRANSACTION_BATCH_ITEMS:155]Debit_IO:15; $_at_TransInSubDebitIO; [TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; $_at_TransinSubDebitAccounts; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $_at_TransinSubCurrencyCodes; [TRANSACTION_BATCH_ITEMS:155]CreditTransID:26; $_al_TransInSubCreditTransID; [TRANSACTION_BATCH_ITEMS:155]Credit_IO:16; $_at_TransInSubCreditIO; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; $_at_TransinSubCreditAccounts; [TRANSACTION_BATCH_ITEMS:155]Company_Code:13; $_at_TransinSubCompanyCodes; [TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14; $_at_TransinSubChequeNumbers; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; $_al_TransinSubItemID; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; $_at_TransinSubAnalysis; [TRANSACTION_BATCH_ITEMS:155]Amount:6; $_ar_TransinSubAmounts)
			
			ARRAY BOOLEAN:C223($_abo_TransInSubUpdate; 0)
			$_l_SizeofArray:=Size of array:C274($_al_IgnoreMismatchedDebit)
			ARRAY BOOLEAN:C223($_abo_TransInSubUpdate; $_l_SizeofArray)
			$_bo_Continue:=True:C214
			$_bo_noPost:=False:C215
			For ($_l_PostIndex; 1; Size of array:C274($_al_IgnoreMismatchedDebit))
				If ($_bo_Continue)
					If ($_ar_TransinSubTotals{$_l_PostIndex}#0) | ($_ar_TransinSubTaxAmounts{$_l_PostIndex}#0) | (DB_LedgerAllowZeroInvoices)
						If ($_at_TransinTransCodes{$_l_PostIndex}#[TRANSACTION_TYPES:31]Transaction_Type_Code:1)
							QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$_at_TransinTransCodes{$_l_PostIndex})
						End if 
						If ($_at_TransInSubDebitIO{$_l_PostIndex}="")
							If ($_at_TransinSubDebitAccounts{$_l_PostIndex}#[ACCOUNTS:32]Account_Code:2)
								QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$_at_TransinSubDebitAccounts{$_l_PostIndex})
							End if 
							$_at_TransInSubDebitIO{$_l_PostIndex}:=[ACCOUNTS:32]IO:5
							$_abo_TransInSubUpdate{$_l_PostIndex}:=True:C214
							If ($_at_TransInSubCreditIO{$_l_PostIndex}="")
								$_at_TransInSubCreditIO{$_l_PostIndex}:="N"
							End if 
						End if 
						If ($_at_TransInSubCreditIO{$_l_PostIndex}="")
							If ($_at_TransinSubCreditAccounts{$_l_PostIndex}#[ACCOUNTS:32]Account_Code:2)
								QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$_at_TransinSubCreditAccounts{$_l_PostIndex})
							End if 
							$_at_TransInSubCreditIO{$_l_PostIndex}:=[ACCOUNTS:32]IO:5
							$_abo_TransInSubUpdate{$_l_PostIndex}:=True:C214
							If ($_at_TransInSubCreditIO{$_l_PostIndex}="")
								$_at_TransInSubCreditIO{$_l_PostIndex}:="N"
							End if 
						End if 
						If ($_at_TransInSubLayerCode{$_l_PostIndex}="")
							If ([TRANSACTION_TYPES:31]Layer_Code:16#"")
								$_at_TransInSubLayerCode{$_l_PostIndex}:=[TRANSACTION_TYPES:31]Layer_Code:16
							Else 
								$_at_TransInSubLayerCode{$_l_PostIndex}:=DB_GetLedgerActualLayer
							End if 
							If ($_at_TransInSubLayerCode{$_l_PostIndex}#"")
								$_abo_TransInSubUpdate{$_l_PostIndex}:=True:C214
							End if 
						End if 
						If ([TRANSACTION_TYPES:31]Phantom_Transaction:18#"")
							$_bo_Phantom:=True:C214
						End if 
						Case of 
							: (($_at_TransInSubDebitIO{$_l_PostIndex}#"N") & ($_at_TransInSubCreditIO{$_l_PostIndex}="N"))
								$_r_DebitAmount:=Gen_Round($_ar_TransinSubAmounts{$_l_PostIndex}; 2; 2)
								$_r_DebitVAT:=Gen_Round($_ar_TransinSubTaxAmounts{$_l_PostIndex}; 2; 2)
								$_r_DebitTotal:=Gen_Round($_ar_TransinSubTotals{$_l_PostIndex}; 2; 2)
								$_t_DebitIO:=$_at_TransInSubDebitIO{$_l_PostIndex}
								$_r_CreditAmount:=Gen_Round((0-$_ar_TransinSubTotals{$_l_PostIndex}); 2; 2)
								$_r_CreditVAT:=0
								$_r_CreditTotal:=$_r_CreditAmount
								$_t_CreditIO:=$_at_TransInSubCreditIO{$_l_PostIndex}
							: (($_at_TransInSubDebitIO{$_l_PostIndex}="N") & ($_at_TransInSubCreditIO{$_l_PostIndex}#"N"))
								$_r_CreditAmount:=Gen_Round((0-$_ar_TransinSubAmounts{$_l_PostIndex}); 2; 2)
								$_r_CreditVAT:=Gen_Round((0-$_ar_TransinSubTaxAmounts{$_l_PostIndex}); 2; 2)
								$_r_CreditTotal:=Gen_Round((0-$_ar_TransinSubTotals{$_l_PostIndex}); 2; 2)
								$_t_CreditIO:=$_at_TransInSubCreditIO{$_l_PostIndex}
								$_r_DebitAmount:=Gen_Round($_ar_TransinSubTotals{$_l_PostIndex}; 2; 2)
								$_r_DebitVAT:=0
								$_r_DebitTotal:=$_r_DebitAmount
								$_t_DebitIO:=$_at_TransInSubDebitIO{$_l_PostIndex}
							Else 
								$_r_CreditAmount:=Gen_Round((0-$_ar_TransinSubAmounts{$_l_PostIndex}); 2; 2)
								$_r_CreditVAT:=Gen_Round((0-$_ar_TransinSubTaxAmounts{$_l_PostIndex}); 2; 2)
								$_r_CreditTotal:=Gen_Round((0-$_ar_TransinSubTotals{$_l_PostIndex}); 2; 2)
								$_t_CreditIO:=$_at_TransInSubCreditIO{$_l_PostIndex}
								$_r_DebitAmount:=Gen_Round($_ar_TransinSubAmounts{$_l_PostIndex}; 2; 2)
								$_r_DebitVAT:=Gen_Round($_ar_TransinSubTaxAmounts{$_l_PostIndex}; 2; 2)
								$_r_DebitTotal:=Gen_Round($_ar_TransinSubTotals{$_l_PostIndex}; 2; 2)
								$_t_DebitIO:=$_at_TransInSubDebitIO{$_l_PostIndex}
						End case 
						$_r_TestAmount:=$_r_DebitAmount+$_r_DebitVAT+$_r_CreditAmount+$_r_CreditVAT
						If ($_r_TestAmount#0)
							If (Application type:C494#4D Server:K5:6)
								If (Not:C34(User in group:C338(Current user:C182; "Designer")))
									Gen_Alert("Posting Anomaly: Batch "+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+Char:C90(13)+"Item "+String:C10($_l_Count)+Char:C90(13)+"Difference "+String:C10($_t_TestString))
									$_bo_noPost:=True:C214
								End if 
							Else 
								//return the alert to the client here and dont post
								$_bo_noPost:=True:C214
							End if 
							
						End if 
						//Debit
						If (Not:C34($_bo_noPost))
							If (($_at_TransinSubDebitAccounts{$_l_PostIndex}#"") & (OK=1))
								Vtext:=""
								$_t_UniqueIdentity:=$_at_TransinSubCreditAccounts{$_l_PostIndex}+"  "+String:C10($_r_CreditAmount)+Char:C90(13)+"VAT  "+String:C10($_r_CreditVAT)
								$_al_TransInSubDebitTransID{$_l_PostIndex}:=Post_Amount($_at_TransinSubDebitAccounts{$_l_PostIndex}; $_r_DebitAmount; $_r_DebitVAT; $_r_DebitTotal; $_t_DebitIO; $_at_TransinTransCodes{$_l_PostIndex}; $_at_TransinSubAnalysis{$_l_PostIndex}; $_at_TransinSubPeriodCodes{$_l_PostIndex}; $_at_TransinSubInvoiceNumbers{$_l_PostIndex}; $_ad_TransInSubDate{$_l_PostIndex}; [TRANSACTION_BATCHES:30]Entry_Date:6; $_at_TransinSubDescriptions{$_l_PostIndex}; $_at_TransinSubCompanyCodes{$_l_PostIndex}; $_at_TransinSubChequeNumbers{$_l_PostIndex}; $_at_TransinSubInvoiceNumbers{$_l_PostIndex}; $_at_TransinSubTaxCodes{$_l_PostIndex}; $_at_TransinSubUKEC{$_l_PostIndex}; $_at_TransinSubCurrencyCodes{$_l_PostIndex}; $_at_TransInSubLayerCode{$_l_PostIndex}; [TRANSACTION_BATCHES:30]Batch_Number:10; $_at_TransinSubPOCodes{$_l_PostIndex}; $_at_TransinSuJob_blb_JobCodes{$_l_PostIndex}; $_t_UniqueIdentity)
								$_abo_TransInSubUpdate{$_l_PostIndex}:=True:C214
								If (OK=1) & ($_al_TransInSubDebitTransID{$_l_PostIndex}#0)
									Post_BalArr
								Else 
									$_bo_noPost:=True:C214
								End if 
							Else 
								
							End if 
							
							//credit
							If ($_bo_noPost=False:C215)
								If (($_at_TransinSubCreditAccounts{$_l_PostIndex}#"") & (OK=1))
									
									Vtext:=""
									$_t_UniqueIdentity:=$_at_TransinSubDebitAccounts{$_l_PostIndex}+"  "+String:C10($_r_DebitAmount)+Char:C90(13)+"VAT  "+String:C10($_r_DebitVAT)
									$_al_TransInSubCreditTransID{$_l_PostIndex}:=Post_Amount($_at_TransinSubCreditAccounts{$_l_PostIndex}; $_r_CreditAmount; $_r_CreditVAT; $_r_CreditTotal; $_t_CreditIO; $_at_TransinTransCodes{$_l_PostIndex}; $_at_TransinSubAnalysis{$_l_PostIndex}; $_at_TransinSubPeriodCodes{$_l_PostIndex}; $_at_TransinSubInvoiceNumbers{$_l_PostIndex}; $_ad_TransInSubDate{$_l_PostIndex}; [TRANSACTION_BATCHES:30]Entry_Date:6; $_at_TransinSubDescriptions{$_l_PostIndex}; $_at_TransinSubCompanyCodes{$_l_PostIndex}; $_at_TransinSubChequeNumbers{$_l_PostIndex}; $_at_TransinSubInvoiceNumbers{$_l_PostIndex}; $_at_TransinSubTaxCodes{$_l_PostIndex}; $_at_TransinSubUKEC{$_l_PostIndex}; $_at_TransinSubCurrencyCodes{$_l_PostIndex}; $_at_TransInSubLayerCode{$_l_PostIndex}; [TRANSACTION_BATCHES:30]Batch_Number:10; $_at_TransinSubPOCodes{$_l_PostIndex}; $_at_TransinSuJob_blb_JobCodes{$_l_PostIndex}; $_t_UniqueIdentity)
									$_abo_TransInSubUpdate{$_l_PostIndex}:=True:C214
									If (OK=1) & ($_al_TransInSubCreditTransID{$_l_PostIndex}#0)
										Post_BalArr
									Else 
										$_bo_noPost:=True:C214
									End if 
								Else 
									
								End if 
								If ($_bo_noPost=False:C215)
									
									If ($_at_TransinSubInvoiceNumbers{$_l_PostIndex}#"")
										If ([INVOICES:39]Invoice_Number:1=$_at_TransinSubInvoiceNumbers{$_l_PostIndex})
											//We have the record loaded here so stay on process
											TransB_PostUpdateSalesInvoice(Vadd; $_at_TransinSubInvoiceNumbers{$_l_PostIndex}; $_at_TransinTransCodes{$_l_PostIndex}; $_at_TransinSubCompanyCodes{$_l_PostIndex}; $_at_TransinSubDebitAccounts{$_l_PostIndex}; [TRANSACTION_TYPES:31]Transaction_Type_Code:1; $_ar_TransinSubTotals{$_l_PostIndex}; $_ad_TransInSubDate{$_l_PostIndex}; $_at_TransinSubPeriodCodes{$_l_PostIndex}; $_at_TransinSubCreditAccounts{$_l_PostIndex}; $_at_TransinSubChequeNumbers{$_l_PostIndex}; $_at_TransinSubAnalysis{$_l_PostIndex}; $_at_TransinSubCurrencyCodes{$_l_PostIndex}; $_at_TransInSubLayerCode{$_l_PostIndex}; $_at_TransinSubDescriptions{$_l_PostIndex})
											
											
										Else 
											$_l_UpdateSalesInvoiceProcess:=New process:C317("TransB_PostUpdateSalesInvoice"; 256000; "Update Invoice Allocation"; vadd; $_at_TransinSubInvoiceNumbers{$_l_PostIndex}; $_at_TransinTransCodes{$_l_PostIndex}; $_at_TransinSubCompanyCodes{$_l_PostIndex}; $_at_TransinSubDebitAccounts{$_l_PostIndex}; [TRANSACTION_TYPES:31]Transaction_Type_Code:1; $_ar_TransinSubTotals{$_l_PostIndex}; $_ad_TransInSubDate{$_l_PostIndex}; $_at_TransinSubPeriodCodes{$_l_PostIndex}; $_at_TransinSubCreditAccounts{$_l_PostIndex}; $_at_TransinSubChequeNumbers{$_l_PostIndex}; $_at_TransinSubAnalysis{$_l_PostIndex}; $_at_TransinSubCurrencyCodes{$_l_PostIndex}; $_at_TransInSubLayerCode{$_l_PostIndex}; $_at_TransinSubDescriptions{$_l_PostIndex})
											//we dont need to wait for it to post.
											
										End if 
										
									End if 
									If ($_at_TransinSubPICodes{$_l_PostIndex}#"")
										If ([PURCHASE_INVOICES:37]Purchase_Invoice_Number:4=$_at_TransinSubPICodes{$_l_PostIndex})
											TransB_postUpdatePurchInvoice(Vadd; $_at_TransinSubPICodes{$_l_PostIndex}; $_at_TransinTransCodes{$_l_PostIndex}; $_at_TransinSubCompanyCodes{$_l_PostIndex}; [TRANSACTION_TYPES:31]Transaction_Type_Code:1; $_at_TransinSubDescriptions{$_l_PostIndex}; $_at_TransinSubCreditAccounts{$_l_PostIndex}; $_ar_TransinSubTotals{$_l_PostIndex}; $_ad_TransInSubDate{$_l_PostIndex}; $_at_TransinSubPeriodCodes{$_l_PostIndex}; $_at_TransinSubDebitAccounts{$_l_PostIndex}; $_at_TransinSubChequeNumbers{$_l_PostIndex}; $_at_TransinSubAnalysis{$_l_PostIndex}; $_at_TransinSubCurrencyCodes{$_l_PostIndex}; $_at_TransInSubLayerCode{$_l_PostIndex})
										Else 
											$_l_UpdatePInvoiceProcess:=New process:C317("TransB_postUpdatePurchInvoice"; 256000; "Update PinvoiceAllocation"; Vadd; $_at_TransinSubPICodes{$_l_PostIndex}; $_at_TransinTransCodes{$_l_PostIndex}; $_at_TransinSubCompanyCodes{$_l_PostIndex}; [TRANSACTION_TYPES:31]Transaction_Type_Code:1; $_at_TransinSubDescriptions{$_l_PostIndex}; $_at_TransinSubCreditAccounts{$_l_PostIndex}; $_ar_TransinSubTotals{$_l_PostIndex}; $_ad_TransInSubDate{$_l_PostIndex}; $_at_TransinSubPeriodCodes{$_l_PostIndex}; $_at_TransinSubDebitAccounts{$_l_PostIndex}; $_at_TransinSubChequeNumbers{$_l_PostIndex}; $_at_TransinSubAnalysis{$_l_PostIndex}; $_at_TransinSubCurrencyCodes{$_l_PostIndex}; $_at_TransInSubLayerCode{$_l_PostIndex})
											
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
				If ($_bo_noPost)
					$_l_PostIndex:=Size of array:C274($_al_IgnoreMismatchedDebit)
					
				End if 
			End for 
			If (Not:C34($_bo_noPost))
				
				
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
				//Here update the records as required
				$_l_UpdateRow:=Find in array:C230($_abo_TransInSubUpdate; True:C214)
				If ($_l_UpdateRow>0)
					ARRAY TO SELECTION:C261($_al_TransInSubCreditTransID; [TRANSACTION_BATCH_ITEMS:155]CreditTransID:26; $_al_TransInSubDebitTransID; [TRANSACTION_BATCH_ITEMS:155]DebitTransID:27; $_at_TransInSubLayerCode; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; $_at_TransInSubCreditIO; [TRANSACTION_BATCH_ITEMS:155]Credit_IO:16; $_at_TransInSubDebitIO; [TRANSACTION_BATCH_ITEMS:155]Debit_IO:15)
				End if 
				
				$_bo_noPost:=False:C215
				If (OK=1)
					
					$_l_SizeofAccountArray:=Size of array:C274(TRNS_at_AccountIdentity)
					$_bo_noPost:=False:C215
					If ($_l_SizeofAccountArray>0)
						
						If (vHideMessages=False:C215)  //added 20/03/07 -kmw
							MESSAGE:C88(Char:C90(13)+"      Posting Balances")
						End if 
						
						
						$_bo_noPost:=False:C215
					End if 
					
					If ($_bo_noPost=False:C215)
						If (OK=1)
							$0:=1
							[TRANSACTION_BATCHES:30]Printed:11:=False:C215
							[TRANSACTION_BATCHES:30]State:15:=2
							[TRANSACTION_BATCHES:30]Posted_Date:16:=<>DB_d_CurrentDate
							DB_SaveRecord(->[TRANSACTION_BATCHES:30])
						Else 
							$0:=-1
						End if 
					Else 
						$0:=-1
					End if 
				Else 
					$0:=-1
				End if 
				If (DB_t_CurrentFormUsage2#"NWin")
					CLOSE WINDOW:C154
					If (WIN_bo_TrackerInited)
						$_l_WindowRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
						If ($_l_WindowRow>0)
							WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowRow}
						End if 
					End if 
				End if 
				If ((OK=1) & ($_bo_Phantom) & (DB_t_CurrentFormUsage#"TransUp")) & (Not:C34($_bo_noPost))
					TransactionBatch_PostPH
				End if 
			Else 
				$0:=-1
			End if 
			UNLOAD RECORD:C212([TRANSACTIONS:29])
			READ ONLY:C145([TRANSACTIONS:29])
			READ ONLY:C145([ACCOUNT_BALANCES:34])
		Else 
			$0:=-1
			
		End if 
	End if 
	<>SYS_bo_CurrentWindowModal:=False:C215
End if 
ERR_MethodTrackerReturn("TransactionBatch_Post"; $_t_oldMethodName)
