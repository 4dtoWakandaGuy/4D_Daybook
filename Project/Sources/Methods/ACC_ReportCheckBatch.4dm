//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ReportCheckBatch
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
	ARRAY LONGINT:C221($_al_DebitsChecked; 0)
	ARRAY LONGINT:C221($_al_NoTransaction; 0)
	ARRAY LONGINT:C221($_al_Transawaitsbalance; 0)
	ARRAY LONGINT:C221($_al_TransawaitsbalanceDEB; 0)
	ARRAY LONGINT:C221($_al_TransCreditReturnID; 0)
	ARRAY LONGINT:C221($_al_TransDebitReturnID; 0)
	ARRAY REAL:C219($_ar_TransCreditAwaiting; 0)
	ARRAY REAL:C219($_ar_TransCreditTotalAwaiting; 0)
	ARRAY REAL:C219($_ar_TransCreditVatAwaiting; 0)
	ARRAY REAL:C219($_ar_TransDebitAwaiting; 0)
	ARRAY REAL:C219($_ar_TransDebitTotalAwaiting; 0)
	ARRAY REAL:C219($_ar_TransDebitVatAwaiting; 0)
	ARRAY TEXT:C222($_at_TransCreditReturnAct; 0)
	ARRAY TEXT:C222($_at_TransDebitReturnAct; 0)
	C_BOOLEAN:C305(<>TransactionDisableValidation; $_bo_CreditReturn; $_bo_CrossCheck; $_bo_DebitReturn; $_bo_isBLYT; $_bo_OK; $_bo_Save; ACC_Bo_DoSaves)
	C_LONGINT:C283($_l_CreditSideTransactionID; $_l_CreditTransactionID; $_l_DebitSideTransactionID; $_l_DebitTransactionID; $_l_Delay; $_l_Index; $_l_Index2; $_l_NoTransPosition; $_l_Profacc; $_l_RecordNumber; $_l_Repeats)
	C_LONGINT:C283($_l_TranbatchItemID; $_l_TransactionIDPosition; $1; $2; DS_l_BATCHITEMRef)
	C_REAL:C285($_r_CreditAmount; $_r_CreditGrandawaiting; $_r_CreditGrandTotal; $_r_CreditTotal; $_r_CreditVAT; $_r_DebitAmount; $_r_DebitGrandawaiting; $_r_DebitGrandTotal; $_r_DebitGrandTotAwaiting; $_r_DebitGrandVatAwaiting; $_r_DebitTotal)
	C_REAL:C285($_r_DebitVAT; $_r_OtherCredits; $_r_ReturnAmount; $_r_TotalValue; $_r_TransGrandTotAwaiting; $_r_TransGrandVatAwaiting; $0; $3)
	C_TEXT:C284($_t_oldMethodName; ACC_t_CreditIO; ACC_t_DebitIO)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_ReportCheckBatch")

$0:=0
If ($2=0)
	$_l_RecordNumber:=Record number:C243([TRANSACTIONS:29])
	ACC_TransValidateALL([TRANSACTIONS:29]Batch_Number:7; True:C214)
	//True;[TRANSACTIONS]BatchItem_X_ID)
	GOTO RECORD:C242([TRANSACTIONS:29]; $_l_RecordNumber)
	$_l_Repeats:=0
	$_l_Delay:=1
	$_bo_OK:=False:C215
	Repeat 
		$_l_Repeats:=$_l_Repeats+1
		$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 1)
		If (Not:C34($_bo_OK))
			
			If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
				//only increase every 10 tries
				$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
			End if 
			DelayTicks(2*$_l_Delay)
		End if 
		
	Until ($_bo_OK=True:C214)
	
	$_l_TranbatchItemID:=[TRANSACTIONS:29]BatchItem_X_ID:30
Else 
	$_l_TranbatchItemID:=$2
End if 
If (False:C215)
	READ WRITE:C146([TRANSACTION_BATCHES:30])
	If ($1#[TRANSACTION_BATCHES:30]Batch_Number:10)
		QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=$1)
	End if 
	$_l_Repeats:=0
	$_l_Delay:=1
	Repeat 
		$_l_Repeats:=$_l_Repeats+1
		$_bo_OK:=Check_Locked(->[TRANSACTION_BATCHES:30]; 1)
		If (Not:C34($_bo_OK))
			IDLE:C311
			If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
				//only increase every 10 tries
				$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
			End if 
			DelayTicks(2*$_l_Delay)
		End if 
		
	Until ($_bo_OK=True:C214)
	
	READ WRITE:C146([TRANSACTIONS:29])
	ARRAY LONGINT:C221($_al_Transawaitsbalance; 0)
	ARRAY REAL:C219($_ar_TransCreditAwaiting; 0)
	ARRAY REAL:C219($_ar_TransCreditVatAwaiting; 0)
	ARRAY REAL:C219($_ar_TransCreditTotalAwaiting; 0)
	ARRAY LONGINT:C221($_al_TransawaitsbalanceDEB; 0)
	ARRAY LONGINT:C221($_al_TransCreditReturnID; 0)
	ARRAY TEXT:C222($_at_TransCreditReturnAct; 0)
	ARRAY REAL:C219($_ar_TransDebitAwaiting; 0)
	ARRAY REAL:C219($_ar_TransDebitVatAwaiting; 0)
	ARRAY REAL:C219($_ar_TransDebitTotalAwaiting; 0)
	ARRAY LONGINT:C221($_al_DebitsChecked; 0)
	
	ARRAY LONGINT:C221($_al_NoTransaction; 0)
	ARRAY LONGINT:C221($_al_TransDebitReturnID; 0)
	ARRAY TEXT:C222($_at_TransDebitReturnAct; 0)
	If (Records in selection:C76([TRANSACTION_BATCHES:30])=1)
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
		
		$_r_TotalValue:=0
		$_bo_isBLYT:=False:C215
		For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
			Case of 
				: ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
					$_r_TotalValue:=$_r_TotalValue+[TRANSACTION_BATCH_ITEMS:155]Total:9
					$_bo_isBLYT:=([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1="PLYT")
				: ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")
					$_r_TotalValue:=$_r_TotalValue-[TRANSACTION_BATCH_ITEMS:155]Total:9
					$_bo_isBLYT:=([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1="PLYT")
			End case 
			NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
		End for 
		If ($_r_TotalValue#0) & (Not:C34($_bo_isBLYT))
			ACC_BATCHREPORTERROR($1; 0; 0; 0; 2; $_r_TotalValue)
		End if 
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
		
		QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
		FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
		CREATE EMPTY SET:C140([TRANSACTIONS:29]; "USED")
		$_bo_Save:=False:C215
		For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
			If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)  //A
				
				[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
				DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
				$_bo_Save:=True:C214
			End if   //A
			$_l_CreditTransactionID:=0
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
			If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")  //C
				REDUCE SELECTION:C351([TRANSACTIONS:29]; 0)
				$_bo_CrossCheck:=False:C215
				If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26>0)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Transaction_ID:31=[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26)
				Else 
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=$_r_CreditAmount)
					$_bo_OK:=ACC_TransMatchBatch(True:C214; $_r_CreditAmount; $_r_CreditVAT; True:C214)
				End if 
				If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27>0) & (Records in selection:C76([TRANSACTIONS:29])=0)  //E
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27)
					If ([TRANSACTIONS:29]Transaction_OtherSideID:32>0)  //F
						$_l_CreditSideTransactionID:=[TRANSACTIONS:29]Transaction_OtherSideID:32
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_CreditSideTransactionID)
					Else 
						REDUCE SELECTION:C351([TRANSACTIONS:29]; 0)
					End if   //F
				End if   //E
				If (Records in selection:C76([TRANSACTIONS:29])=0)  //G
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=$_r_CreditAmount; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Amount:16=$_r_CreditVAT)
				End if   //G
				If (Records in selection:C76([TRANSACTIONS:29])>1)
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30=0; *)
					QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Amount:6=$_r_CreditAmount)
					$_bo_OK:=ACC_TransMatchBatch(True:C214; $_r_CreditAmount; $_r_CreditVAT; True:C214)
				End if 
				If (Records in selection:C76([TRANSACTIONS:29])>0)  //I
					CREATE SET:C116([TRANSACTIONS:29]; "Matching")
					DIFFERENCE:C122("Matching"; "USED"; "Matching")
					USE SET:C118("Matching")
					If (Records in selection:C76([TRANSACTIONS:29])>0)  //J
						If (Records in selection:C76([TRANSACTIONS:29])=1)
							If ([TRANSACTIONS:29]BatchItem_X_ID:30#[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25) & ([TRANSACTIONS:29]BatchItem_X_ID:30#0)
								ACC_ClearBatchItemID
							End if 
						End if 
						FIRST RECORD:C50([TRANSACTIONS:29])
						For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))  //K
							If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25) | ([TRANSACTIONS:29]BatchItem_X_ID:30=0)
								$_bo_OK:=ACC_TransMatchBatch(True:C214; $_r_CreditAmount; $_r_CreditVAT)
								If ($_bo_OK)
									REDUCE SELECTION:C351([TRANSACTIONS:29]; 1)
									ADD TO SET:C119([TRANSACTIONS:29]; "USED")
									$_l_Index:=Records in selection:C76([TRANSACTIONS:29])
									If ([TRANSACTIONS:29]BatchItem_X_ID:30#[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)  //N
										
										While (Semaphore:C143("TRANSACTIONUPDATE"))
											UNLOAD RECORD:C212([TRANSACTIONS:29])
											DelayTicks
										End while 
										
										LOAD RECORD:C52([TRANSACTIONS:29])
										[TRANSACTIONS:29]BatchItem_X_ID:30:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
										$_l_TranbatchItemID:=[TRANSACTIONS:29]BatchItem_X_ID:30
										<>TransactionDisableValidation:=True:C214
										SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
										DB_SaveRecord(->[TRANSACTIONS:29])
										AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
										
										<>TransactionDisableValidation:=False:C215
										SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
										CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
									End if   //N
									$_l_CreditTransactionID:=[TRANSACTIONS:29]Transaction_ID:31
									If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26#[TRANSACTIONS:29]Transaction_ID:31)  //P
										$_bo_Save:=True:C214
										[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=[TRANSACTIONS:29]Transaction_ID:31
									End if   //P
									If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")  //Q
										ACC_Bo_DoSaves:=$_bo_Save
										$_l_DebitTransactionID:=ACC_CheckDebitSide($_l_CreditTransactionID; [TRANSACTION_BATCH_ITEMS:155]DebitTransID:27; $_r_DebitAmount; $_r_DebitVAT; False:C215; False:C215; ->ACC_Bo_DoSaves)
										$_bo_Save:=ACC_Bo_DoSaves
										
										If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27>0)  //R
											QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31#[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27; *)
											QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Transaction_ID:31#$_l_CreditTransactionID; *)
											QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
											If (Records in selection:C76([TRANSACTIONS:29])>0)  //S
												While (Semaphore:C143("TRANSACTIONUPDATE"))
													UNLOAD RECORD:C212([TRANSACTIONS:29])
													DelayTicks
												End while 
												LOAD RECORD:C52([TRANSACTIONS:29])
												<>TransactionDisableValidation:=True:C214
												SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
												If (Not:C34(In transaction:C397))
													DB_lockFile(->[TRANSACTIONS:29])
													APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30:=0)
													
													AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
												Else 
													FIRST RECORD:C50([TRANSACTIONS:29])
													For ($_l_Index2; 1; Records in selection:C76([TRANSACTIONS:29]))
														[TRANSACTIONS:29]BatchItem_X_ID:30:=0
														DB_SaveRecord(->[TRANSACTIONS:29])
														AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
														
														AA_CheckFileUnlocked(->[TRANSACTIONS:29]BatchItem_X_ID:30)
														NEXT RECORD:C51([TRANSACTIONS:29])
													End for 
												End if 
												<>TransactionDisableValidation:=False:C215
												SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
												
												CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
											End if   //S
											ACC_TransDoubleCheck([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27; $_l_CreditTransactionID)
										End if   //R
										If ($_l_DebitTransactionID>0)  //T
											ACC_PutOtherSide($_l_CreditTransactionID; $_l_DebitTransactionID)
											INSERT IN ARRAY:C227($_al_DebitsChecked; Size of array:C274($_al_DebitsChecked)+1; 1)
											$_al_DebitsChecked{Size of array:C274($_al_DebitsChecked)}:=$_l_DebitTransactionID
										End if   //T
									Else   //Q
										//this is a single sided entry there should be a multi entry  debit somewhere
										INSERT IN ARRAY:C227($_al_Transawaitsbalance; Size of array:C274($_al_Transawaitsbalance)+1; 1)
										INSERT IN ARRAY:C227($_ar_TransCreditAwaiting; Size of array:C274($_ar_TransCreditAwaiting)+1; 1)
										INSERT IN ARRAY:C227($_ar_TransCreditVatAwaiting; Size of array:C274($_ar_TransCreditVatAwaiting)+1; 1)
										INSERT IN ARRAY:C227($_ar_TransCreditTotalAwaiting; Size of array:C274($_ar_TransCreditTotalAwaiting)+1; 1)
										INSERT IN ARRAY:C227($_al_TransCreditReturnID; Size of array:C274($_al_TransCreditReturnID)+1; 1)
										INSERT IN ARRAY:C227($_at_TransCreditReturnAct; Size of array:C274($_at_TransCreditReturnAct)+1; 1)
										$_al_Transawaitsbalance{Size of array:C274($_al_Transawaitsbalance)}:=$_l_CreditTransactionID
										$_ar_TransCreditAwaiting{Size of array:C274($_ar_TransCreditAwaiting)}:=$_r_CreditAmount
										$_ar_TransCreditVatAwaiting{Size of array:C274($_ar_TransCreditVatAwaiting)}:=$_r_CreditVAT
										$_ar_TransCreditTotalAwaiting{Size of array:C274($_ar_TransCreditTotalAwaiting)}:=$_r_CreditTotal
										$_at_TransCreditReturnAct{Size of array:C274($_at_TransCreditReturnAct)}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
										If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=$_l_TranbatchItemID)  //U
											$_al_TransCreditReturnID{Size of array:C274($_al_TransCreditReturnID)}:=$_l_TranbatchItemID
										End if   // U
									End if   //Q
									
								End if   //m
							End if   //L
							NEXT RECORD:C51([TRANSACTIONS:29])
						End for   //K
					Else   //K
						If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26#0)  //V
							[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=0
							QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
							
						End if   //V
						INSERT IN ARRAY:C227($_al_NoTransaction; Size of array:C274($_al_NoTransaction)+1; 1)
						$_al_NoTransaction{Size of array:C274($_al_NoTransaction)}:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
					End if   //K
				Else   //I
					INSERT IN ARRAY:C227($_al_NoTransaction; Size of array:C274($_al_NoTransaction)+1; 1)
					$_al_NoTransaction{Size of array:C274($_al_NoTransaction)}:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
				End if   //I
			End if   //C
			NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
		End for 
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
			$_l_CreditTransactionID:=0
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
			If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
				REDUCE SELECTION:C351([TRANSACTIONS:29]; 0)
				If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27>0)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Transaction_ID:31=[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27)
				Else 
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=$_r_DebitAmount)
					$_bo_OK:=ACC_TransMatchBatch(False:C215; $_r_DebitAmount; $_r_DebitVAT; True:C214)
				End if 
				If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26>0) & (Records in selection:C76([TRANSACTIONS:29])=0)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26)
					If ([TRANSACTIONS:29]Transaction_OtherSideID:32>0)
						$_l_DebitSideTransactionID:=[TRANSACTIONS:29]Transaction_OtherSideID:32
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_DebitSideTransactionID)
					Else 
						REDUCE SELECTION:C351([TRANSACTIONS:29]; 0)
					End if 
				End if 
				If (Records in selection:C76([TRANSACTIONS:29])=0)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=$_r_DebitAmount; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Amount:16=$_r_DebitVAT)
				End if 
				If (Records in selection:C76([TRANSACTIONS:29])>1)
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30=0; *)
					QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Amount:6=$_r_DebitAmount)
					$_bo_OK:=ACC_TransMatchBatch(False:C215; $_r_DebitAmount; $_r_DebitVAT; True:C214)
				End if 
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					CREATE SET:C116([TRANSACTIONS:29]; "Matching")
					DIFFERENCE:C122("Matching"; "USED"; "Matching")
					USE SET:C118("Matching")
					If (Records in selection:C76([TRANSACTIONS:29])>0)
						If (Records in selection:C76([TRANSACTIONS:29])=1)
							If ([TRANSACTIONS:29]BatchItem_X_ID:30#[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25) & ([TRANSACTIONS:29]BatchItem_X_ID:30#0)
								ACC_ClearBatchItemID
							End if 
						End if 
						FIRST RECORD:C50([TRANSACTIONS:29])
						For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
							If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25) | ([TRANSACTIONS:29]BatchItem_X_ID:30=0)
								$_bo_OK:=ACC_TransMatchBatch(False:C215; $_r_DebitAmount; $_r_DebitVAT)
								If ($_bo_OK)
									$_l_TransactionIDPosition:=Find in array:C230($_al_DebitsChecked; [TRANSACTIONS:29]Transaction_ID:31)
									ADD TO SET:C119([TRANSACTIONS:29]; "USED")
									$_l_Index:=Records in selection:C76([TRANSACTIONS:29])
									If ($_l_TransactionIDPosition<0)  //it has not been checked yet
										If ([TRANSACTIONS:29]BatchItem_X_ID:30#[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
											While (Semaphore:C143("TRANSACTIONUPDATE"))
												UNLOAD RECORD:C212([TRANSACTIONS:29])
												DelayTicks
											End while 
											
											LOAD RECORD:C52([TRANSACTIONS:29])
											[TRANSACTIONS:29]BatchItem_X_ID:30:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
											$_l_TranbatchItemID:=[TRANSACTIONS:29]BatchItem_X_ID:30
											<>TransactionDisableValidation:=True:C214
											SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
											
											DB_SaveRecord(->[TRANSACTIONS:29])
											AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
											
											<>TransactionDisableValidation:=False:C215
											CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
											SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
											
										End if 
										$_l_DebitTransactionID:=[TRANSACTIONS:29]Transaction_ID:31
										If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27#[TRANSACTIONS:29]Transaction_ID:31)
											[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=[TRANSACTIONS:29]Transaction_ID:31
											If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
												[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
											End if 
											DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
											
										End if 
										If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
											ACC_Bo_DoSaves:=$_bo_Save
											$_l_CreditTransactionID:=ACC_CheckCreditSide($_l_DebitTransactionID; [TRANSACTION_BATCH_ITEMS:155]CreditTransID:26; $_r_CreditAmount; $_r_CreditVAT; False:C215; False:C215; ->ACC_Bo_DoSaves)
											ACC_Bo_DoSaves:=$_bo_Save
											If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26>0)
												QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31#[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26; *)
												QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Transaction_ID:31#$_l_DebitTransactionID; *)
												QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
												If (Records in selection:C76([TRANSACTIONS:29])>0)
													While (Semaphore:C143("TRANSACTIONUPDATE"))
														UNLOAD RECORD:C212([TRANSACTIONS:29])
														DelayTicks
													End while 
													LOAD RECORD:C52([TRANSACTIONS:29])
													<>TransactionDisableValidation:=True:C214
													SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
													If (Not:C34(In transaction:C397))
														DB_lockFile(->[TRANSACTIONS:29])
														APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30:=0)
														
														AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
													Else 
														FIRST RECORD:C50([TRANSACTIONS:29])
														For ($_l_Index2; 1; Records in selection:C76([TRANSACTIONS:29]))
															[TRANSACTIONS:29]BatchItem_X_ID:30:=0
															DB_SaveRecord(->[TRANSACTIONS:29])
															AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
															
															AA_CheckFileUnlocked(->[TRANSACTIONS:29]BatchItem_X_ID:30)
															NEXT RECORD:C51([TRANSACTIONS:29])
														End for 
													End if 
													
													<>TransactionDisableValidation:=False:C215
													SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
													
													CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
												End if 
												ACC_TransDoubleCheck([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26; $_l_DebitTransactionID)
											End if 
											If ($_l_CreditTransactionID>0)
												ACC_PutOtherSide($_l_DebitTransactionID; $_l_CreditTransactionID)
											End if 
										Else 
											INSERT IN ARRAY:C227($_al_TransawaitsbalanceDEB; Size of array:C274($_al_TransawaitsbalanceDEB)+1; 1)
											INSERT IN ARRAY:C227($_ar_TransDebitAwaiting; Size of array:C274($_ar_TransDebitAwaiting)+1; 1)
											INSERT IN ARRAY:C227($_ar_TransDebitVatAwaiting; Size of array:C274($_ar_TransDebitVatAwaiting)+1; 1)
											INSERT IN ARRAY:C227($_ar_TransDebitTotalAwaiting; Size of array:C274($_ar_TransDebitTotalAwaiting)+1; 1)
											INSERT IN ARRAY:C227($_al_TransDebitReturnID; Size of array:C274($_al_TransDebitReturnID)+1; 1)
											INSERT IN ARRAY:C227($_at_TransDebitReturnAct; Size of array:C274($_at_TransDebitReturnAct)+1; 1)
											$_al_TransawaitsbalanceDEB{Size of array:C274($_al_TransawaitsbalanceDEB)}:=$_l_DebitTransactionID
											$_ar_TransDebitAwaiting{Size of array:C274($_ar_TransDebitAwaiting)}:=$_r_DebitAmount
											$_ar_TransDebitVatAwaiting{Size of array:C274($_ar_TransDebitVatAwaiting)}:=$_r_DebitVAT
											$_ar_TransDebitTotalAwaiting{Size of array:C274($_ar_TransDebitTotalAwaiting)}:=$_r_DebitTotal
											$_at_TransDebitReturnAct{Size of array:C274($_at_TransDebitReturnAct)}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
											If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=$_l_TranbatchItemID)
												$_al_TransDebitReturnID{Size of array:C274($_al_TransDebitReturnID)}:=$_l_TranbatchItemID
											End if 
										End if 
									End if 
								End if 
							End if 
							NEXT RECORD:C51([TRANSACTIONS:29])
						End for 
					Else 
						$_l_NoTransPosition:=Find in array:C230($_al_NoTransaction; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
						If ($_l_NoTransPosition<0)  //may have found on credit side
							If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27#0)
								[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
								If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
									[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
								End if 
								DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
							End if 
							INSERT IN ARRAY:C227($_al_NoTransaction; Size of array:C274($_al_NoTransaction)+1; 1)
							$_al_NoTransaction{Size of array:C274($_al_NoTransaction)}:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
						End if 
					End if 
				Else 
					$_l_NoTransPosition:=Find in array:C230($_al_NoTransaction; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
					If ($_l_NoTransPosition<0)
						If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27#0)
							[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
							DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
						End if 
						INSERT IN ARRAY:C227($_al_NoTransaction; Size of array:C274($_al_NoTransaction)+1; 1)
						$_al_NoTransaction{Size of array:C274($_al_NoTransaction)}:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
					End if 
				End if 
			End if 
			NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
		End for 
		If ($_bo_Save)
			DB_SaveRecord(->[TRANSACTION_BATCHES:30])
		End if 
		
		
		
		If (Size of array:C274($_al_Transawaitsbalance)>0)
			$_r_CreditGrandawaiting:=0
			$_r_TransGrandVatAwaiting:=0
			$_r_TransGrandTotAwaiting:=0
			$_r_CreditGrandTotal:=0
			$_bo_DebitReturn:=False:C215
			$_r_OtherCredits:=0
			$_bo_CreditReturn:=False:C215
			
			For ($_l_Index; 1; Size of array:C274($_al_Transawaitsbalance))
				$_r_CreditGrandawaiting:=$_r_CreditGrandawaiting+$_ar_TransCreditAwaiting{$_l_Index}
				$_r_TransGrandVatAwaiting:=$_r_TransGrandVatAwaiting+$_ar_TransCreditVatAwaiting{$_l_Index}
				$_r_TransGrandTotAwaiting:=$_r_TransGrandTotAwaiting+$_ar_TransCreditTotalAwaiting{$_l_Index}
				If ($_al_TransCreditReturnID{$_l_Index}=$_l_TranbatchItemID)
					$_r_ReturnAmount:=$_ar_TransCreditTotalAwaiting{$_l_Index}
					$_bo_DebitReturn:=True:C214
				Else 
					$_r_OtherCredits:=$_r_OtherCredits+$_ar_TransCreditTotalAwaiting{$_l_Index}
				End if 
			End for 
			$_r_DebitGrandawaiting:=0
			$_r_DebitGrandVatAwaiting:=0
			$_r_DebitGrandTotAwaiting:=0
			$_r_DebitGrandTotal:=0
			For ($_l_Index; 1; Size of array:C274($_ar_TransDebitAwaiting))
				$_r_DebitGrandawaiting:=$_r_DebitGrandawaiting+$_ar_TransDebitAwaiting{$_l_Index}
				$_r_DebitGrandVatAwaiting:=$_r_DebitGrandVatAwaiting+$_ar_TransDebitVatAwaiting{$_l_Index}
				$_r_DebitGrandTotAwaiting:=$_r_DebitGrandTotAwaiting+$_ar_TransDebitTotalAwaiting{$_l_Index}
				If ($_al_TransDebitReturnID{$_l_Index}=$_l_TranbatchItemID)
					$_r_ReturnAmount:=$_ar_TransDebitTotalAwaiting{$_l_Index}
					$_bo_CreditReturn:=True:C214
				Else 
					If ($_bo_DebitReturn)
						$_l_Profacc:=Find in array:C230($_at_TransDebitReturnAct; DB_GetLedgerProfitACC)
						If ($_l_Profacc>0)
							If ($_at_TransDebitReturnAct{$_l_Index}#DB_GetLedgerProfitACC)
								$_r_ReturnAmount:=$_r_ReturnAmount+$_ar_TransDebitTotalAwaiting{$_l_Index}
							End if 
						End if 
					End if 
				End if 
				
			End for 
			//now take off the return amount any that are the
			If ($_bo_CreditReturn=True:C214)
				For ($_l_Index; 1; Size of array:C274($_al_Transawaitsbalance))
					$_l_Profacc:=Find in array:C230($_at_TransDebitReturnAct; DB_GetLedgerProfitACC)
					If ($_l_Profacc>0)
						If ($_at_TransDebitReturnAct{$_l_Index}#DB_GetLedgerProfitACC)
							$_r_ReturnAmount:=$_r_ReturnAmount+$_ar_TransCreditTotalAwaiting{$_l_Index}
						End if 
					Else 
						$_l_Index:=Size of array:C274($_al_Transawaitsbalance)
					End if 
					
				End for 
				
			End if 
			If (($_r_DebitGrandTotAwaiting+$_r_TransGrandTotAwaiting)=0)
				$0:=$_r_ReturnAmount
			Else 
				
			End if 
			
		End if 
		
		
		
		
		
		
	End if 
End if 
ERR_MethodTrackerReturn("ACC_ReportCheckBatch"; $_t_oldMethodName)
