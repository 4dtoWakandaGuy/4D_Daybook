//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_TransValidateALL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 12:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CreditsChecked; 0)
	ARRAY LONGINT:C221($_al_DebitsChecked; 0)
	//ARRAY LONGINT(ACC_al_NoTransaction;0)
	//ARRAY LONGINT(ACC_al_TransAwaitsBalance;0)
	//ARRAY LONGINT(ACC_al_TransAwaitsBalanceDebit;0)
	//ARRAY REAL(ACC_ar_TransCreditAwaiting;0)
	//ARRAY REAL(ACC_ar_TransCreditTotalAwaiting;0)
	//ARRAY REAL(ACC_ar_TransCreditVatAwaiting;0)
	//ARRAY REAL(ACC_ar_TransDebitAwaiting;0)
	//ARRAY REAL(ACC_ar_TransDebitTotalAwaiting;0)
	//ARRAY REAL(ACC_ar_TransDebitVatAwaiting;0)
	C_BOOLEAN:C305(<>TransactionDisableValidation; $_bo_CrossCheck; $_bo_FIxes; $_bo_ItemDeleted; $_bo_OK; $_bo_PLYT; $_bo_Save; $2; ACC_Bo_DoSaves)
	C_LONGINT:C283($_l_CreditID; $_l_CreditSide; $_l_DebitID; $_l_DebitSide; $_l_Index; $_l_Index2; $_l_NoTransactionRow; $_l_Status; $_l_TransactionsIndex; $1; DS_l_BATCHITEMRef)
	C_REAL:C285($_r_CreditAmount; $_r_CreditGrandAwaiting; $_r_CreditGrandTotal; $_r_CreditTotal; $_r_CreditVAT; $_r_DebitAmount; $_r_DebitGrandawaiting; $_r_DebitGrandTotal; $_r_DebitGrandTOTAwaiting; $_r_DebitGrandVatAwaiting; $_r_DebitTotal)
	C_REAL:C285($_r_DebitVAT; $_r_miiliseconds2; $_r_Milliseconds; $_r_Milliseconds3; $_r_Milliseconds4; $_r_Sum; $_r_TransGrandTOTAwaiting; $_r_TransGrandVatAwaiting; $_r_Value)
	C_TEXT:C284(<>ACC_T_BatchTimeReport; $_t_oldMethodName; ACC_t_CreditIO; ACC_t_DebitIO)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_TRANSVALIDATEALL")
$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds)
ACC_TransvalldateSubCalls
$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Subcalls")

ARRAY LONGINT:C221($_al_DebitsChecked; 0)
ARRAY LONGINT:C221($_al_CreditsChecked; 0)
If ($1#[TRANSACTION_BATCHES:30]Batch_Number:10)
	QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=$1)
End if 
$_r_Milliseconds:=ACC_BatchTimingTest
ACC_CrossCheckBatch
$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Cross checkbatch")

Repeat 
	$_bo_OK:=Check_Locked(->[TRANSACTION_BATCHES:30]; 1)
	If (Not:C34($_bo_OK))
		DelayTicks
	End if 
Until ($_bo_OK=True:C214)
$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Trans in was locked")

READ WRITE:C146([TRANSACTIONS:29])
If (Records in selection:C76([TRANSACTION_BATCHES:30])=1)
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
	
	
	$_r_Value:=0
	$_bo_PLYT:=False:C215
	$_r_Milliseconds:=ACC_BatchTimingTest
	For ($_l_Index2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
		Case of 
			: ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
				$_r_Value:=$_r_Value+[TRANSACTION_BATCH_ITEMS:155]Total:9
				$_bo_PLYT:=([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1="PLYT")
			: ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")
				$_r_Value:=$_r_Value-[TRANSACTION_BATCH_ITEMS:155]Total:9
				$_bo_PLYT:=([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1="PLYT")
			: ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
		End case 
		NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
	End for 
	$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Testing if PLYT posting")
	If ($_r_Value#0) & (Not:C34($_bo_PLYT))
		ACC_BATCHREPORTERROR($1; 0; 0; 0; 2; $_r_Value)
	End if 
	$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Reporting imbalanced Trans in")
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
	
	QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
	FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
	CREATE EMPTY SET:C140([TRANSACTIONS:29]; "USED")
	$_bo_Save:=False:C215
	$_r_miiliseconds2:=ACC_BatchTimingTest
	
	For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
		$_r_Milliseconds3:=ACC_BatchTimingTest
		$_r_Milliseconds:=ACC_BatchTimingTest
		
		If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
			[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
			DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			$_bo_Save:=True:C214
		End if 
		$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Setting Batch item ID")
		
		$_l_CreditID:=0
		ACC_t_DebitIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; [TRANSACTION_BATCH_ITEMS:155]Debit_IO:15; "D")
		$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Checkeing batch debit IO(Acc_TransValidateALL)")
		
		ACC_t_CreditIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Credit_IO:16; "C")
		$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Checkeing batch creditit IO(Acc_TransValidateALL)")
		
		ACC_BatchItemoverrideIO(->ACC_t_DebitIO; ->ACC_t_CreditIO)
		$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Overriding Batch  IO(Acc_TransValidateALL)")
		
		Case of 
			: ((ACC_t_DebitIO#"N") & (ACC_t_CreditIO="N"))
				$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
				$_r_DebitVAT:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
				$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
				$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
				$_r_CreditVAT:=0
				$_r_CreditTotal:=$_r_CreditAmount
			: ((ACC_t_DebitIO="N") & (ACC_t_CreditIO#"N"))
				$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
				$_r_CreditVAT:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
				$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
				$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
				$_r_DebitVAT:=0
				$_r_DebitTotal:=$_r_DebitAmount
			Else 
				$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
				$_r_CreditVAT:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
				$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
				$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
				$_r_DebitVAT:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
				$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
		End case 
		$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Calculating batch item value(Acc_TransValidateALL)")
		
		If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
			REDUCE SELECTION:C351([TRANSACTIONS:29]; 0)
			$_bo_CrossCheck:=False:C215
			If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26>0)
				// QUERY([TRANSACTIONS];[TRANSACTIONS]Batch No=[TRANS IN]Batch No;*)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26)
			Else 
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=$_r_CreditAmount)
				$_r_Milliseconds:=ACC_BatchTimingTest
				
				$_bo_OK:=ACC_TransMatchBatch(True:C214; $_r_CreditAmount; $_r_CreditVAT; True:C214)
				$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Matching Batch(ACC_TransValidateAll) 117")
				
			End if 
			If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27>0) & (Records in selection:C76([TRANSACTIONS:29])=0)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27)
				If ([TRANSACTIONS:29]Transaction_OtherSideID:32>0)
					$_l_CreditSide:=[TRANSACTIONS:29]Transaction_OtherSideID:32
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_CreditSide)
				Else 
					REDUCE SELECTION:C351([TRANSACTIONS:29]; 0)
				End if 
			End if 
			If (Records in selection:C76([TRANSACTIONS:29])=0)
				$_r_Milliseconds:=ACC_BatchTimingTest
				ACC_TransvalldateSubCalls(1; [TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $_r_CreditAmount; $_r_CreditVAT)
				$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Validate Sub Calls(ACC_Trans validateALL 132")
			End if 
			If (Records in selection:C76([TRANSACTIONS:29])>1)
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30=0; *)
				QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Amount:6=$_r_CreditAmount)
				$_r_Milliseconds:=ACC_BatchTimingTest
				$_bo_OK:=ACC_TransMatchBatch(True:C214; $_r_CreditAmount; $_r_CreditVAT; True:C214)
				$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Matching Batch(ACC_TransValidateAll)")
			End if 
			If (Records in selection:C76([TRANSACTIONS:29])>0)
				CREATE SET:C116([TRANSACTIONS:29]; "Matching")
				DIFFERENCE:C122("Matching"; "USED"; "Matching")
				USE SET:C118("Matching")
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					If (Records in selection:C76([TRANSACTIONS:29])=1)
						If (([TRANSACTIONS:29]BatchItem_X_ID:30#[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25) & ([TRANSACTIONS:29]BatchItem_X_ID:30#0)) | ([TRANSACTIONS:29]Batch_Number:7#[TRANSACTION_BATCHES:30]Batch_Number:10)
							$_r_Milliseconds:=ACC_BatchTimingTest
							ACC_ClearBatchItemID
							$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "clear batch item ID(ACC_TransValidateAll)")
						End if 
					End if 
					FIRST RECORD:C50([TRANSACTIONS:29])
					For ($_l_TransactionsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
						$_r_Milliseconds4:=ACC_BatchTimingTest
						If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25) | ([TRANSACTIONS:29]BatchItem_X_ID:30=0)
							
							
							$_r_Milliseconds:=ACC_BatchTimingTest
							$_bo_OK:=ACC_TransMatchBatch(True:C214; $_r_CreditAmount; $_r_CreditVAT)
							$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Matching Batch(ACC_TransValidateAll) 159")
							If ($_bo_OK)
								REDUCE SELECTION:C351([TRANSACTIONS:29]; 1)
								ADD TO SET:C119([TRANSACTIONS:29]; "USED")
								$_l_TransactionsIndex:=Records in selection:C76([TRANSACTIONS:29])
								If ([TRANSACTIONS:29]BatchItem_X_ID:30#[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
									While (Semaphore:C143("TRANSACTIONUPDATE"))
										UNLOAD RECORD:C212([TRANSACTIONS:29])
										DelayTicks
									End while 
									LOAD RECORD:C52([TRANSACTIONS:29])
									[TRANSACTIONS:29]BatchItem_X_ID:30:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
									
									<>TransactionDisableValidation:=True:C214
									SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
									$_r_Milliseconds:=ACC_BatchTimingTest
									DB_SaveRecord(->[TRANSACTIONS:29])
									$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "saving transaction(ACC_TransValidateAll)")
									AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
									$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "check file unlocked(ACC_TransValidateAll)")
									<>TransactionDisableValidation:=False:C215
									SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
									CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
								End if 
								$_l_CreditID:=[TRANSACTIONS:29]Transaction_ID:31
								If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26#[TRANSACTIONS:29]Transaction_ID:31)
									If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
										[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
									End if 
									[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=[TRANSACTIONS:29]Transaction_ID:31
									DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
									
									$_bo_Save:=True:C214
								End if 
								If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
									ACC_Bo_DoSaves:=$_bo_Save
									$_r_Milliseconds:=ACC_BatchTimingTest
									$_l_DebitID:=ACC_CheckDebitSide($_l_CreditID; [TRANSACTION_BATCH_ITEMS:155]DebitTransID:27; $_r_DebitAmount; $_r_DebitVAT; False:C215; False:C215; ->ACC_Bo_DoSaves)
									$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Checking trans debit side(ACC_TransValidateAll) 191")
									$_bo_Save:=ACC_Bo_DoSaves
									If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27>0)
										QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31#[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27; *)
										QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Transaction_ID:31#$_l_CreditID; *)
										QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
										$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Query for transaction(ACC_TransValidateAll) 197")
										If (Records in selection:C76([TRANSACTIONS:29])>0)
											While (Semaphore:C143("TRANSACTIONUPDATE"))
												DelayTicks
											End while 
											$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Waiting Transaction update semaphore(ACC_TransValidateAll) 202")
											LOAD RECORD:C52([TRANSACTIONS:29])
											<>TransactionDisableValidation:=True:C214
											SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
											DB_lockFile(->[TRANSACTIONS:29])
											APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30:=0)
											AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
											$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Clearing Bath item ids(ACC_TransValidateAll) 209")
											
											<>TransactionDisableValidation:=False:C215
											SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
											CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
										End if 
										$_r_Milliseconds:=ACC_BatchTimingTest
										ACC_TransDoubleCheck([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27; $_l_CreditID)
										$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Transaction double check(ACC_TransValidateAll) 217")
										
									End if 
									If ($_l_DebitID>0)
										$_r_Milliseconds:=ACC_BatchTimingTest
										ACC_PutOtherSide($_l_CreditID; $_l_DebitID)
										$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Put other sidek(ACC_TransValidateAll) 223")
										INSERT IN ARRAY:C227($_al_DebitsChecked; Size of array:C274($_al_DebitsChecked)+1; 1)
										$_al_DebitsChecked{Size of array:C274($_al_DebitsChecked)}:=$_l_DebitID
									End if 
								Else 
									$_r_Milliseconds:=ACC_BatchTimingTest
									ACC_TransvalldateSubCalls(2)
									$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "validate subcalls(ACC_TransValidateAll) 230")
									ACC_al_TransAwaitsBalance{Size of array:C274(ACC_al_TransAwaitsBalance)}:=$_l_CreditID
									ACC_ar_TransCreditAwaiting{Size of array:C274(ACC_ar_TransCreditAwaiting)}:=$_r_CreditAmount
									ACC_ar_TransCreditVatAwaiting{Size of array:C274(ACC_ar_TransCreditVatAwaiting)}:=$_r_CreditVAT
									ACC_ar_TransCreditTotalAwaiting{Size of array:C274(ACC_ar_TransCreditTotalAwaiting)}:=$_r_CreditTotal
								End if 
							End if 
						End if 
						NEXT RECORD:C51([TRANSACTIONS:29])
						$_r_Milliseconds4:=ACC_BatchTimingTest($_r_Milliseconds4; "Checking one  transaction (ACC_TransValidateAll) 240")
					End for 
				Else 
					If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26#0)
						If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
							[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
						End if 
						[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=0
						DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
						$_bo_Save:=True:C214
					End if 
					INSERT IN ARRAY:C227(ACC_al_NoTransaction; Size of array:C274(ACC_al_NoTransaction)+1; 1)
					ACC_al_NoTransaction{Size of array:C274(ACC_al_NoTransaction)}:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
				End if 
			Else 
				
				INSERT IN ARRAY:C227(ACC_al_NoTransaction; Size of array:C274(ACC_al_NoTransaction)+1; 1)
				ACC_al_NoTransaction{Size of array:C274(ACC_al_NoTransaction)}:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
			End if 
		End if 
		NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
		$_r_Milliseconds3:=ACC_BatchTimingTest($_r_Milliseconds3; "Checking one creditt trans in item (ACC_TransValidateAll) 260")
	End for 
	$_r_Milliseconds:=ACC_BatchTimingTest($_r_miiliseconds2; "checking trans in Credit items (ACC_TransValidateAll) 262")
	If ($_bo_Save)
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])
	End if 
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
	
	QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
	FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
	$_bo_Save:=False:C215
	
	For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
		
		If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
			[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
			DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			
			$_bo_Save:=True:C214
		End if 
		$_l_CreditID:=0
		ACC_t_DebitIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; [TRANSACTION_BATCH_ITEMS:155]Debit_IO:15; "D")
		ACC_t_CreditIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Credit_IO:16; "C")
		ACC_BatchItemoverrideIO(->ACC_t_DebitIO; ->ACC_t_CreditIO)
		
		Case of 
			: ((ACC_t_DebitIO#"N") & (ACC_t_CreditIO="N"))
				$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
				$_r_DebitVAT:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
				$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
				$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
				$_r_CreditVAT:=0
				$_r_CreditTotal:=$_r_CreditAmount
			: ((ACC_t_DebitIO="N") & (ACC_t_CreditIO#"N"))
				$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
				$_r_CreditVAT:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
				$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
				$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
				$_r_DebitVAT:=0
				$_r_DebitTotal:=$_r_DebitAmount
			Else 
				$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
				$_r_CreditVAT:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
				$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
				$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
				$_r_DebitVAT:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
				$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
		End case 
		$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Calculating Batch item amounts (ACC_TransValidateAll) 315")
		
		If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
			REDUCE SELECTION:C351([TRANSACTIONS:29]; 0)
			If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27>0)
				//  QUERY([TRANSACTIONS];[TRANSACTIONS]Batch No=[TRANS IN]Batch No;*)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27)
				$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Finding batch transaction (ACC_TransValidateAll) 322")
				
			Else 
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=$_r_DebitAmount)
				$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "searching for transaction (ACC_TransValidateAll) 328")
				
				$_bo_OK:=ACC_TransMatchBatch(False:C215; $_r_DebitAmount; $_r_DebitVAT; True:C214)
				$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Matching batch (ACC_TransValidateAll) 331")
				
			End if 
			If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26>0) & (Records in selection:C76([TRANSACTIONS:29])=0)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26)
				$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Searching for transation (ACC_TransValidateAll) 336")
				
				If ([TRANSACTIONS:29]Transaction_OtherSideID:32>0)
					$_l_DebitSide:=[TRANSACTIONS:29]Transaction_OtherSideID:32
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_DebitSide)
				Else 
					REDUCE SELECTION:C351([TRANSACTIONS:29]; 0)
				End if 
			End if 
			If (Records in selection:C76([TRANSACTIONS:29])=0)
				$_r_Milliseconds:=ACC_BatchTimingTest
				
				ACC_TransvalldateSubCalls(1; [TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $_r_DebitAmount; $_r_DebitVAT)
				$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Validate sub calls (ACC_TransValidateAll) 349")
				
			End if 
			If (Records in selection:C76([TRANSACTIONS:29])>1)
				$_r_Milliseconds:=ACC_BatchTimingTest
				
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30=0; *)
				QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Amount:6=$_r_DebitAmount)
				$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Searching for transation (ACC_TransValidateAll) 358")
				
				$_bo_OK:=ACC_TransMatchBatch(False:C215; $_r_DebitAmount; $_r_DebitVAT; True:C214)
				$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Match batch (ACC_TransValidateAll) 361")
				
			End if 
			If (Records in selection:C76([TRANSACTIONS:29])>0)
				CREATE SET:C116([TRANSACTIONS:29]; "Matching")
				DIFFERENCE:C122("Matching"; "USED"; "Matching")
				USE SET:C118("Matching")
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					If (Records in selection:C76([TRANSACTIONS:29])=1)
						If (([TRANSACTIONS:29]BatchItem_X_ID:30#[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25) & ([TRANSACTIONS:29]BatchItem_X_ID:30#0)) | ([TRANSACTIONS:29]Batch_Number:7#[TRANSACTION_BATCHES:30]Batch_Number:10)
							$_r_Milliseconds:=ACC_BatchTimingTest
							ACC_ClearBatchItemID
							$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "clear batch item id (ACC_TransValidateAll) 373")
							
						End if 
					End if 
					FIRST RECORD:C50([TRANSACTIONS:29])
					For ($_l_TransactionsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
						$_r_Milliseconds4:=ACC_BatchTimingTest
						
						If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25) | ([TRANSACTIONS:29]BatchItem_X_ID:30=0)
							$_r_Milliseconds:=ACC_BatchTimingTest
							
							$_bo_OK:=ACC_TransMatchBatch(False:C215; $_r_DebitAmount; $_r_DebitVAT)
							$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "match batch (ACC_TransValidateAll) 385")
							
							If ($_bo_OK)
								$_l_NoTransactionRow:=Find in array:C230($_al_DebitsChecked; [TRANSACTIONS:29]Transaction_ID:31)
								ADD TO SET:C119([TRANSACTIONS:29]; "USED")
								$_l_TransactionsIndex:=Records in selection:C76([TRANSACTIONS:29])
								If ($_l_NoTransactionRow<0)
									If ([TRANSACTIONS:29]BatchItem_X_ID:30#[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
										$_r_Milliseconds:=ACC_BatchTimingTest
										
										While (Semaphore:C143("TRANSACTIONUPDATE"))
											UNLOAD RECORD:C212([TRANSACTIONS:29])
											DelayTicks
										End while 
										$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "waiting for transaction update semaphore (ACC_TransValidateAll) 398")
										
										LOAD RECORD:C52([TRANSACTIONS:29])
										[TRANSACTIONS:29]BatchItem_X_ID:30:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
										
										<>TransactionDisableValidation:=True:C214
										SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
										DB_SaveRecord(->[TRANSACTIONS:29])
										$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Saving transaction (ACC_TransValidateAll) 407")
										
										AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
										$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "check file unlocked (ACC_TransValidateAll) 410")
										
										<>TransactionDisableValidation:=False:C215
										CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
										SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
									End if 
									$_l_DebitID:=[TRANSACTIONS:29]Transaction_ID:31
									If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27#[TRANSACTIONS:29]Transaction_ID:31)
										If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
											[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
										End if 
										[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=[TRANSACTIONS:29]Transaction_ID:31
										DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
										$_bo_Save:=True:C214
									End if 
									If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
										ACC_Bo_DoSaves:=$_bo_Save
										$_r_Milliseconds:=ACC_BatchTimingTest
										
										$_l_CreditID:=ACC_CheckCreditSide($_l_DebitID; [TRANSACTION_BATCH_ITEMS:155]CreditTransID:26; $_r_CreditAmount; $_r_CreditVAT; False:C215; False:C215; ->ACC_Bo_DoSaves)
										$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Checking Credit side (ACC_TransValidateAll) 426")
										
										ACC_Bo_DoSaves:=$_bo_Save
										If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26>0)
											$_r_Milliseconds:=ACC_BatchTimingTest
											
											QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31#[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26; *)
											QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Transaction_ID:31#$_l_DebitID; *)
											QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
											$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Searching for batch item (ACC_TransValidateAll) 435")
											
											If (Records in selection:C76([TRANSACTIONS:29])>0)
												While (Semaphore:C143("TRANSACTIONUPDATE"))
													DelayTicks
												End while 
												$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "waiting for transaction update semaphore (ACC_TransValidateAll) 442")
												
												LOAD RECORD:C52([TRANSACTIONS:29])
												<>TransactionDisableValidation:=True:C214
												SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
												DB_lockFile(->[TRANSACTIONS:29])
												APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30:=0)
												AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
												$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Updating batch item ids (ACC_TransValidateAll) 449")
												
												<>TransactionDisableValidation:=False:C215
												SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
												CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
											End if 
											$_r_Milliseconds:=ACC_BatchTimingTest
											
											ACC_TransDoubleCheck([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26; $_l_DebitID)
											$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Double check (ACC_TransValidateAll) 458")
											
										End if 
										If ($_l_CreditID>0)
											$_r_Milliseconds:=ACC_BatchTimingTest
											ACC_PutOtherSide($_l_DebitID; $_l_CreditID)
											$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "Put other side (ACC_TransValidateAll) 464")
										End if 
									Else 
										$_r_Milliseconds:=ACC_BatchTimingTest
										ACC_TransvalldateSubCalls(3)
										$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "validate subcalls (ACC_TransValidateAll) 469")
										ACC_al_TransAwaitsBalanceDebit{Size of array:C274(ACC_al_TransAwaitsBalanceDebit)}:=$_l_DebitID
										ACC_ar_TransDebitAwaiting{Size of array:C274(ACC_ar_TransDebitAwaiting)}:=$_r_DebitAmount
										ACC_ar_TransDebitVatAwaiting{Size of array:C274(ACC_ar_TransDebitVatAwaiting)}:=$_r_DebitVAT
										ACC_ar_TransDebitTotalAwaiting{Size of array:C274(ACC_ar_TransDebitTotalAwaiting)}:=$_r_DebitTotal
									End if 
								End if 
							End if 
						End if 
						NEXT RECORD:C51([TRANSACTIONS:29])
						$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds4; "Checking one transaction (ACC_TransValidateAll) 479")
					End for 
				Else 
					$_l_NoTransactionRow:=Find in array:C230(ACC_al_NoTransaction; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
					If ($_l_NoTransactionRow<0)
						If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27#0)
							If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
								[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
							End if 
							[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
							DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
							$_bo_Save:=True:C214
						End if 
						INSERT IN ARRAY:C227(ACC_al_NoTransaction; Size of array:C274(ACC_al_NoTransaction)+1; 1)
						ACC_al_NoTransaction{Size of array:C274(ACC_al_NoTransaction)}:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
					End if 
				End if 
			Else 
				$_l_NoTransactionRow:=Find in array:C230(ACC_al_NoTransaction; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
				If ($_l_NoTransactionRow<0)
					If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27#0)
						If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
							[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
						End if 
						[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
						DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
						$_bo_Save:=True:C214
					End if 
					INSERT IN ARRAY:C227(ACC_al_NoTransaction; Size of array:C274(ACC_al_NoTransaction)+1; 1)
					ACC_al_NoTransaction{Size of array:C274(ACC_al_NoTransaction)}:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
				End if 
			End if 
		End if 
		NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
		$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds3; "checking in one trans in credit item (ACC_TransValidateAll) 505")
		
	End for 
	$_r_Milliseconds:=ACC_BatchTimingTest($_r_miiliseconds2; "checking all batch credit items (ACC_TransValidateAll) 508")
	
	If ($_bo_Save)
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])
	End if 
	$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "saving trans in record (ACC_TransValidateAll) 513")
	
	QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10)
	$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "sFinding transaction (ACC_TransValidateAll) 516")
	
	CREATE SET:C116([TRANSACTIONS:29]; "matchBatch")
	DIFFERENCE:C122("MatchBatch"; "USED"; "MatchBatch")
	USE SET:C118("MatchBatch")
	If (Records in selection:C76([TRANSACTIONS:29])>0)
		If (Size of array:C274(ACC_al_NoTransaction)=0)
			READ WRITE:C146([TRANSACTIONS:29])
			USE SET:C118("MatchBatch")
			FIRST RECORD:C50([TRANSACTIONS:29])
			If (Records in selection:C76([TRANSACTIONS:29])>0)
				For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
					Repeat 
						$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 1)
						If (Not:C34($_bo_OK))
							DelayTicks
						End if 
					Until ($_bo_OK=True:C214)
					If ([TRANSACTIONS:29]Transaction_ID:31=0)
						While (Semaphore:C143("TRANSACTIONUPDATE"))
							DelayTicks
						End while 
						<>TransactionDisableValidation:=True:C214
						SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
						DB_SaveRecord(->[TRANSACTIONS:29])
						AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
						<>TransactionDisableValidation:=False:C215
						SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
						CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
					End if 
					ACC_BATCHREPORTERROR(-([TRANSACTIONS:29]Transaction_ID:31); 0; 0; 0; -3)
					NEXT RECORD:C51([TRANSACTIONS:29])
				End for 
				$_r_Sum:=Sum:C1([TRANSACTIONS:29]Total:17)
				If ($_r_Sum#0)
					ACC_BATCHREPORTERROR(0; 0; 0; 0; -6; $_r_Sum)
				End if 
			End if 
		Else 
			QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
			
			
			FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
			CREATE EMPTY SET:C140([TRANSACTIONS:29]; "USED")
			$_bo_FIxes:=False:C215
			$_bo_Save:=False:C215
			For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
				$_l_NoTransactionRow:=Find in array:C230(ACC_al_NoTransaction; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
				If ($_l_NoTransactionRow>0)
					$_bo_ItemDeleted:=False:C215
					ACC_t_DebitIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; [TRANSACTION_BATCH_ITEMS:155]Debit_IO:15; "D")
					ACC_t_CreditIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Credit_IO:16; "C")
					ACC_BatchItemoverrideIO(->ACC_t_DebitIO; ->ACC_t_CreditIO)
					Case of 
						: ((ACC_t_DebitIO#"N") & (ACC_t_CreditIO="N"))
							$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
							$_r_DebitVAT:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
							$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
							$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
							$_r_CreditVAT:=0
							$_r_CreditTotal:=$_r_CreditAmount
						: ((ACC_t_DebitIO="N") & (ACC_t_CreditIO#"N"))
							$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
							$_r_CreditVAT:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
							$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
							$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
							$_r_DebitVAT:=0
							$_r_DebitTotal:=$_r_DebitAmount
						Else 
							$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
							$_r_CreditVAT:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
							$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
							$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
							$_r_DebitVAT:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
							$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
					End case 
					If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"") & ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26=0)
						USE SET:C118("MatchBatch")
						ACC_BatchFindTransaction([TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $_r_CreditAmount; $_r_CreditVAT; (Records in set:C195("MatchBatch")>0))
						If (Records in selection:C76([TRANSACTIONS:29])>0)
							CREATE SET:C116([TRANSACTIONS:29]; "Match")
							INTERSECTION:C121("Match"; "MatchBatch"; "Match")
							USE SET:C118("Match")
							CLEAR SET:C117("Match")
							If (Records in selection:C76([TRANSACTIONS:29])>0)
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30=0; *)
								QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
								If (Records in selection:C76([TRANSACTIONS:29])>0)
									If (Records in selection:C76([TRANSACTIONS:29])>1)
										REDUCE SELECTION:C351([TRANSACTIONS:29]; 1)
									End if 
									If ([TRANSACTIONS:29]Transaction_ID:31=0)
										[TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextIDinMethod(->[TRANSACTIONS:29]Transaction_ID:31)
									End if 
									ACC_SetTransactionBatchItem([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
									$_bo_FIxes:=True:C214
									ADD TO SET:C119([TRANSACTIONS:29]; "USED")
									DELETE FROM ARRAY:C228(ACC_al_NoTransaction; $_l_NoTransactionRow)
									$_bo_ItemDeleted:=True:C214
									ACC_Bo_DoSaves:=$_bo_Save
									ACC_ModifyTransaction([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; "C"; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $_r_CreditAmount; $_r_CreditVAT; False:C215; ->ACC_Bo_DoSaves)
									$_bo_Save:=ACC_Bo_DoSaves
									[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=[TRANSACTIONS:29]Transaction_ID:31
									If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
										[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
									End if 
									DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
									
								End if 
								
							Else 
								ACC_BATCHREPORTERROR([TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; 0; 0; -2)
							End if 
						Else 
							ACC_BATCHREPORTERROR([TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; 0; 0; -2)
						End if 
					End if 
					If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27=0)
						USE SET:C118("MatchBatch")
						ACC_BatchFindTransaction([TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $_r_DebitAmount; $_r_DebitVAT; (Records in set:C195("MatchBatch")>0))
						If (Records in selection:C76([TRANSACTIONS:29])>0)
							CREATE SET:C116([TRANSACTIONS:29]; "Match")
							INTERSECTION:C121("Match"; "MatchBatch"; "Match")
							USE SET:C118("Match")
							CLEAR SET:C117("Match")
							If (Records in selection:C76([TRANSACTIONS:29])>0)
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30=0; *)
								QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
								If (Records in selection:C76([TRANSACTIONS:29])>0)
									If (Records in selection:C76([TRANSACTIONS:29])>1)
										REDUCE SELECTION:C351([TRANSACTIONS:29]; 1)
									End if 
									If ([TRANSACTIONS:29]Transaction_ID:31=0)
										[TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextIDinMethod(->[TRANSACTIONS:29]Transaction_ID:31)
										
									End if 
									ACC_SetTransactionBatchItem([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
									$_bo_FIxes:=True:C214
									ADD TO SET:C119([TRANSACTIONS:29]; "USED")
									If (Not:C34($_bo_ItemDeleted))
										DELETE FROM ARRAY:C228(ACC_al_NoTransaction; $_l_NoTransactionRow)
									End if 
									ACC_Bo_DoSaves:=$_bo_Save
									ACC_ModifyTransaction([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; "D"; [TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $_r_DebitAmount; $_r_DebitVAT; False:C215; ->ACC_Bo_DoSaves)
									$_bo_Save:=ACC_Bo_DoSaves
									[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=[TRANSACTIONS:29]Transaction_ID:31
									If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
										[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
									End if 
									DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
								End if 
								
							Else 
								ACC_BATCHREPORTERROR([TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; 0; 0; -2)
							End if 
						Else 
							ACC_BATCHREPORTERROR([TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; 0; 0; -2)
						End if 
					End if 
				End if 
				NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
			End for 
			If ($_bo_Save)
				DB_SaveRecord(->[TRANSACTION_BATCHES:30])
			End if 
			
			If ($_bo_FIxes)
				If (Count parameters:C259<2)
					ACC_TransValidateALL($1; True:C214)
				Else 
					If ($2)
						ACC_TransValidateALL($1; False:C215)
					Else 
						//GIVE UP
					End if 
				End if 
				READ WRITE:C146([TRANSACTIONS:29])
				DIFFERENCE:C122("MatchBatch"; "USED"; "MatchBatch")
				USE SET:C118("MatchBatch")
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					FIRST RECORD:C50([TRANSACTIONS:29])
					For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
						Repeat 
							$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 1)
							If (Not:C34($_bo_OK))
								DelayTicks
							End if 
						Until ($_bo_OK=True:C214)
						If ([TRANSACTIONS:29]Transaction_ID:31=0)
							While (Semaphore:C143("TRANSACTIONUPDATE"))
								DelayTicks
							End while 
							<>TransactionDisableValidation:=True:C214
							SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
							DB_SaveRecord(->[TRANSACTIONS:29])
							AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
							<>TransactionDisableValidation:=False:C215
							SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
							CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
						End if 
						ACC_BATCHREPORTERROR(-([TRANSACTIONS:29]Transaction_ID:31); 0; 0; 0; -3)
						NEXT RECORD:C51([TRANSACTIONS:29])
					End for 
					$_r_Sum:=Sum:C1([TRANSACTIONS:29]Total:17)
					ACC_BATCHREPORTERROR(0; 0; 0; 0; -6; $_r_Sum)
					If (Size of array:C274(ACC_al_NoTransaction)>0)
						QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
						
						For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
							$_l_NoTransactionRow:=Find in array:C230(ACC_al_NoTransaction; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
							If ($_l_NoTransactionRow>0)
								ACC_BATCHREPORTERROR([TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; 0; 0; -4)
							End if 
							NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
						End for 
					End if 
				End if 
			End if 
		End if 
	Else 
		If (Size of array:C274(ACC_al_NoTransaction)>0)
			QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
			
			For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
				$_l_NoTransactionRow:=Find in array:C230(ACC_al_NoTransaction; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
				If ($_l_NoTransactionRow>0)
					ACC_BATCHREPORTERROR([TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; 0; 0; -4)
				End if 
				NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
			End for 
		End if 
	End if 
	If (Size of array:C274(ACC_al_TransAwaitsBalance)>0)
		$_r_CreditGrandAwaiting:=0
		$_r_TransGrandVatAwaiting:=0
		$_r_TransGrandTOTAwaiting:=0
		$_r_CreditGrandTotal:=0
		For ($_l_Index; 1; Size of array:C274(ACC_al_TransAwaitsBalance))
			$_r_CreditGrandAwaiting:=$_r_CreditGrandAwaiting+ACC_ar_TransCreditAwaiting{$_l_Index}
			$_r_TransGrandVatAwaiting:=$_r_TransGrandVatAwaiting+ACC_ar_TransCreditVatAwaiting{$_l_Index}
			$_r_TransGrandTOTAwaiting:=$_r_TransGrandTOTAwaiting+ACC_ar_TransCreditTotalAwaiting{$_l_Index}
		End for 
		$_r_DebitGrandawaiting:=0
		$_r_DebitGrandVatAwaiting:=0
		$_r_DebitGrandTOTAwaiting:=0
		$_r_DebitGrandTotal:=0
		For ($_l_Index; 1; Size of array:C274(ACC_ar_TransDebitAwaiting))
			$_r_DebitGrandawaiting:=$_r_DebitGrandawaiting+ACC_ar_TransDebitAwaiting{$_l_Index}
			$_r_DebitGrandVatAwaiting:=$_r_DebitGrandVatAwaiting+ACC_ar_TransDebitVatAwaiting{$_l_Index}
			$_r_DebitGrandTOTAwaiting:=$_r_DebitGrandTOTAwaiting+ACC_ar_TransDebitTotalAwaiting{$_l_Index}
		End for 
		If (($_r_DebitGrandTOTAwaiting+$_r_TransGrandTOTAwaiting)#0)
			ACC_BATCHREPORTERROR($1; 0; 0; 0; -2)
		End if 
	End if 
End if 
If (Count parameters:C259<2)
	If ([TRANSACTION_BATCHES:30]X_ValidationStatus:17=0)
		$_r_Milliseconds:=ACC_BatchTimingTest
		
		$_l_Status:=ACC_TRANSACTIONMATCHPAIRS
		$_r_Milliseconds:=ACC_BatchTimingTest($_r_Milliseconds; "match transaction pairs (ACC_TransValidateAll) 785")
		
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])
	End if 
	
End if 
ERR_MethodTrackerReturn("ACC_TRANSVALIDATEALL"; $_t_oldMethodName)
