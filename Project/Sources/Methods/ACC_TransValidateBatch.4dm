//%attributes = {}

If (False:C215)
	//Project Method Name:      ACC_TransValidateBatch
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
	//C_UNKNOWN(<>TransactionDisableValidation)
	//C_UNKNOWN($2)
	//C_UNKNOWN($3)
	ARRAY LONGINT:C221($_al_BatchItemBatchNo; 0)
	ARRAY LONGINT:C221($_al_BatchItemcredTransID; 0)
	ARRAY LONGINT:C221($_al_BatchItemDebTransID; 0)
	ARRAY LONGINT:C221($_al_BatchItemIDs; 0)
	ARRAY LONGINT:C221($_al_BatchRefersCredit; 0)
	ARRAY LONGINT:C221($_al_BatchRefersDebit; 0)
	ARRAY REAL:C219($_ar_BatchItemAmount; 0)
	ARRAY REAL:C219($_ar_BatchItemTax; 0)
	ARRAY REAL:C219($_ar_BatchItemTotal; 0)
	ARRAY TEXT:C222($_at_BatchDebACC; 0)
	ARRAY TEXT:C222($_at_BatchItemAnalCode; 0)
	ARRAY TEXT:C222($_at_BatchItemcredACC; 0)
	ARRAY TEXT:C222($_at_BatchItemcredIO; 0)
	ARRAY TEXT:C222($_at_BatchItemCurrCode; 0)
	ARRAY TEXT:C222($_at_BatchItemDebIO; 0)
	ARRAY TEXT:C222($_at_BatchItemLayerCode; 0)
	C_BOOLEAN:C305(<>TransactionDisableValidation; $_bo_BatchFilter; $_bo_BatchItemFound; $_bo_Delays; $_bo_isCredit; $_bo_isDebit; $_bo_OK; $_bo_Savit; $_bo_Trace; $_bo_TransactionBatchItemFound; $3)
	C_BOOLEAN:C305($4; $6; ACC_bo_Delays; ACC_Bo_DoSaves; <>SYS_bo_QuitCalled; $_bo_BatchFilter; $_bo_BatchItemFound; $_bo_Delays; $_bo_isCredit; $_bo_isDebit; $_bo_OK)
	C_BOOLEAN:C305($_bo_Savit; $_bo_Trace; $_bo_TransactionBatchItemFound; $0; $4; $6; ACC_bo_Delays; ACC_Bo_DoSaves)
	C_LONGINT:C283($_l_BatchItemPosition; $_l_BatchNo; $_l_BatchPosition; $_l_CreditID; $_l_CreditTransID; $_l_DebitID; $_l_DebitTransID; $_l_Delay; $_l_Element; $_l_Index; $_l_OtherSideID)
	C_LONGINT:C283($_l_Process; $_l_RecordsinBatchItems; $_l_Repeats; $_l_Retries; $_l_TransactionID; $1; $2; DS_l_BATCHITEMRef; $_l_BatchItemID; $_l_BatchItemPosition; $_l_BatchNo)
	C_LONGINT:C283($_l_BatchPosition; $_l_CreditID; $_l_CreditTransID; $_l_DebitID; $_l_DebitTransID; $_l_Delay; $_l_Element; $_l_Index; $_l_InputTransactionID; $_l_OtherSideID; $_l_Process)
	C_LONGINT:C283($_l_RecordsinBatchItems; $_l_Repeats; $_l_Retries; $_l_TransactionID; $1; DS_l_BATCHITEMRef)
	C_POINTER:C301($5)
	C_REAL:C285($_r_CreditTotal; $_r_CreditVat; $_r_DebitAmount; $_r_DebitTotal; $_r_DebitVatAmount; $_r_CreditAmount; $_r_CreditTotal; $_r_CreditVat; $_r_DebitAmount; $_r_DebitTotal; $_r_DebitVatAmount)
	C_TEXT:C284($_t_Machine; $_t_Message; $_t_oldMethodName; $_t_ProcessName; $_t_User; ACC_t_CreditIO; ACC_t_DebitIO; <>ACC_T_BatchTimeReport; $_t_Machine; $_t_Message; $_t_oldMethodName)
	C_TEXT:C284($_t_ProcessName; $_t_User; ACC_t_CreditIO; ACC_t_DebitIO)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_TransValidateBatch")

<>ACC_T_BatchTimeReport:=""
$_t_oldMethodName:=ERR_MethodTracker("ACC_TransValidateBatch")


$_bo_Trace:=False:C215
$0:=False:C215

If (Count parameters:C259>=3)
	$0:=False:C215
End if 
If (Count parameters:C259>=4)
	$_bo_BatchFilter:=$4
Else 
	$_bo_BatchFilter:=False:C215
End if 

READ ONLY:C145([TRANSACTIONS:29])
READ WRITE:C146([TRANSACTION_BATCHES:30])
If (Count parameters:C259>=2)
	$_l_InputTransactionID:=$1
	If (Count parameters:C259>=6)
		$_bo_Delays:=$6
	Else 
		$_bo_Delays:=ACC_bo_Delays
		//This is there to stop process services hogging the cpu
	End if 
	//$Mil:=ACC_BatchTimingTest
	$_t_Message:=""
	If ($_l_InputTransactionID>0)
		$_l_Retries:=0
		Repeat 
			//IDLE
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_InputTransactionID)
			Case of 
				: (Records in selection:C76([TRANSACTIONS:29])=0)
					DelayTicks(30*60)
					$_t_Message:=$_t_Message+" Record Not found waited 30 seconds"
				: (Records in selection:C76([TRANSACTIONS:29])>1)
					READ WRITE:C146([TRANSACTIONS:29])
					FIRST RECORD:C50([TRANSACTIONS:29])
					LOAD RECORD:C52([TRANSACTIONS:29])
					[TRANSACTIONS:29]Transaction_ID:31:=0
					DB_SaveRecord(->[TRANSACTIONS:29])
					AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
					UNLOAD RECORD:C212([TRANSACTIONS:29])
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_InputTransactionID)
					$_t_Message:=$_t_Message+" More than one record with ID"+String:C10($_l_InputTransactionID)
					
					
			End case 
			$_l_Retries:=$_l_Retries+1
			
			If ($_bo_Delays)
				
				DelayTicks(2*(1+$_l_Retries))
			End if 
			
		Until (Records in selection:C76([TRANSACTIONS:29])=1) | ($_l_Retries>100) | (<>SYS_bo_QuitCalled)
		$_t_Message:=$_t_Message+" Retried loading record "+String:C10($_l_Retries)+"Times"
		//$Mil:=ACC_BatchTimingTest ($mil;$_t_Message)
		If ($_l_Retries<100) & (Not:C34(<>SYS_bo_QuitCalled))
			$_bo_OK:=False:C215
			$_l_Repeats:=0
			$_l_Delay:=1
			//$Mil:=ACC_BatchTimingTest ($mil)
			$_t_Message:=""
			Repeat 
				$_l_Repeats:=$_l_Repeats+1
				$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 1)
				If (Not:C34($_bo_OK))
					IDLE:C311
					$_t_Message:=$_t_Message+"Record Locked"
					If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
						//only increase every 10 tries
						$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
					End if 
					DelayTicks(2*$_l_Delay)
				End if 
			Until ($_bo_OK=True:C214)
			$_t_Message:=$_t_Message+"retried "+String:C10($_l_Repeats)+" Times"
			//$Mil:=ACC_BatchTimingTest ($mil;$_t_Message)
			
			$_l_OtherSideID:=[TRANSACTIONS:29]Transaction_OtherSideID:32
			If (Records in selection:C76([TRANSACTIONS:29])=1)
				If ($2>0)
					QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=$2)
					//$Mil:=ACC_BatchTimingTest ($mil;"Searching for Trans in record")
					$_l_BatchNo:=$2
				Else 
					QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=[TRANSACTIONS:29]Batch_Number:7)
					//$Mil:=ACC_BatchTimingTest ($mil;"Searching for Trans in record")
					$_l_BatchNo:=[TRANSACTIONS:29]Batch_Number:7
				End if 
				
				
				
				$_bo_OK:=False:C215
				$_l_Repeats:=0
				$_l_Delay:=1
				
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[TRANSACTION_BATCHES:30]; 1)
					If (Not:C34($_bo_OK))
						If ($_l_Process=0)
							LOCKED BY:C353([TRANSACTION_BATCHES:30]; $_l_Process; $_t_User; $_t_Machine; $_t_ProcessName)
						End if 
						IDLE:C311
						If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
							//only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(180*$_l_Delay)
					End if   //NG- i have changed the delay here as this does seem to frequently take more than 10 seconds and the hit on the server cpu at 2 ticks seems to slow everything down
				Until ($_bo_OK=True:C214)
				//$_l_t:=0
				
				If (Records in selection:C76([TRANSACTION_BATCHES:30])=1)
					QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
					
					ARRAY LONGINT:C221($_al_BatchRefersDebit; 0)
					ARRAY LONGINT:C221($_al_BatchRefersCredit; 0)
					ARRAY LONGINT:C221($_al_BatchItemIDs; 0)
					ARRAY TEXT:C222($_at_BatchDebACC; 0)
					ARRAY TEXT:C222($_at_BatchItemDebIO; 0)
					ARRAY TEXT:C222($_at_BatchItemcredACC; 0)
					ARRAY TEXT:C222($_at_BatchItemcredIO; 0)
					ARRAY REAL:C219($_ar_BatchItemAmount; 0)
					ARRAY REAL:C219($_ar_BatchItemTax; 0)
					ARRAY REAL:C219($_ar_BatchItemTotal; 0)
					ARRAY LONGINT:C221($_al_BatchItemDebTransID; 0)
					ARRAY LONGINT:C221($_al_BatchItemcredTransID; 0)
					ARRAY TEXT:C222($_at_BatchItemAnalCode; 0)
					ARRAY TEXT:C222($_at_BatchItemLayerCode; 0)
					ARRAY TEXT:C222($_at_BatchItemCurrCode; 0)
					$_l_RecordsinBatchItems:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])
					ARRAY LONGINT:C221($_al_BatchRefersDebit; $_l_RecordsinBatchItems)
					ARRAY LONGINT:C221($_al_BatchRefersCredit; $_l_RecordsinBatchItems)
					ARRAY LONGINT:C221($_al_BatchItemIDs; $_l_RecordsinBatchItems)
					ARRAY TEXT:C222($_at_BatchDebACC; $_l_RecordsinBatchItems)
					ARRAY TEXT:C222($_at_BatchItemDebIO; $_l_RecordsinBatchItems)
					ARRAY TEXT:C222($_at_BatchItemcredACC; $_l_RecordsinBatchItems)
					ARRAY TEXT:C222($_at_BatchItemcredIO; $_l_RecordsinBatchItems)
					ARRAY REAL:C219($_ar_BatchItemAmount; $_l_RecordsinBatchItems)
					ARRAY REAL:C219($_ar_BatchItemTax; $_l_RecordsinBatchItems)
					ARRAY REAL:C219($_ar_BatchItemTotal; $_l_RecordsinBatchItems)
					ARRAY LONGINT:C221($_al_BatchItemDebTransID; $_l_RecordsinBatchItems)
					ARRAY LONGINT:C221($_al_BatchItemcredTransID; $_l_RecordsinBatchItems)
					ARRAY LONGINT:C221($_al_BatchItemBatchNo; $_l_RecordsinBatchItems)
					ARRAY TEXT:C222($_at_BatchItemAnalCode; $_l_RecordsinBatchItems)
					ARRAY TEXT:C222($_at_BatchItemLayerCode; $_l_RecordsinBatchItems)
					ARRAY TEXT:C222($_at_BatchItemCurrCode; $_l_RecordsinBatchItems)
					$_l_Element:=0
					FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
					//$Mil:=ACC_BatchTimingTest ($mil)
					$_bo_Savit:=False:C215
					For ($_l_Index; 1; $_l_RecordsinBatchItems)
						$_l_Element:=$_l_Element+1
						$_al_BatchItemIDs{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
						$_at_BatchDebACC{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
						$_at_BatchItemDebIO{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
						$_at_BatchItemcredACC{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
						$_at_BatchItemcredIO{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
						$_ar_BatchItemAmount{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
						$_ar_BatchItemTax{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
						$_ar_BatchItemTotal{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]Total:9
						$_al_BatchItemDebTransID{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27
						$_al_BatchItemcredTransID{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26
						$_al_BatchItemBatchNo{$_l_Element}:=[TRANSACTION_BATCHES:30]Batch_Number:10
						$_at_BatchItemAnalCode{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
						$_at_BatchItemLayerCode{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
						$_at_BatchItemCurrCode{$_l_Element}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
						If ($_bo_Delays)
							
							DelayTicks(2)
						End if 
						
						$_l_CreditTransID:=[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26
						$_l_DebitTransID:=[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27
						If ($_l_CreditTransID>0)
							$_l_BatchPosition:=Find in array:C230($_al_BatchRefersCredit; $_l_CreditTransID)
							If ($_l_BatchPosition>0)
								[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=0
								$_bo_Savit:=True:C214
							Else 
								$_l_BatchPosition:=Find in array:C230($_al_BatchRefersCredit; 0)
								$_al_BatchRefersCredit{$_l_BatchPosition}:=$_l_CreditTransID
							End if 
						End if 
						If ($_l_DebitTransID>0)
							$_l_BatchPosition:=Find in array:C230($_al_BatchRefersDebit; $_l_DebitTransID)
							If ($_l_BatchPosition>0)
								[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
								$_bo_Savit:=True:C214
							Else 
								$_l_BatchPosition:=Find in array:C230($_al_BatchRefersDebit; 0)
								$_al_BatchRefersDebit{$_l_BatchPosition}:=$_l_DebitTransID
							End if 
						End if 
						NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
					End for 
					//$Mil:=ACC_BatchTimingTest ($mil;"Loading Batch Items into an array")
					If ($_bo_Savit)
						DB_SaveRecord(->[TRANSACTION_BATCHES:30])
						//$Mil:=ACC_BatchTimingTest ($mil;"Saving Trans in record")
						If ($_bo_Delays)
							DelayTicks(2)
						End if 
					End if 
					$_bo_Savit:=False:C215
					$_l_BatchItemID:=[TRANSACTIONS:29]BatchItem_X_ID:30
					If ($_l_BatchItemID>0)
						//$Mil:=ACC_BatchTimingTest ($mil)
						$_l_BatchItemPosition:=Find in array:C230($_al_BatchItemIDs; $_l_BatchItemID)
						QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTIONS:29]Batch_Number:7)
						If ($_l_BatchItemPosition>0)
							QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=$_l_BatchItemID)
						Else 
							REDUCE SELECTION:C351([TRANSACTION_BATCH_ITEMS:155]; 0)
						End if 
						//$Mil:=ACC_BatchTimingTest ($mil;"Query for Trans in Subrecord batch item ID"+String($_l_BatchItemID))
						If ($_bo_Delays)
							DelayTicks(2)
						End if 
						If ($_l_BatchItemPosition<0)
							READ WRITE:C146([TRANSACTIONS:29])
							LOAD RECORD:C52([TRANSACTIONS:29])
							[TRANSACTIONS:29]BatchItem_X_ID:30:=0
							//$Mil:=ACC_BatchTimingTest ($mil)
							While (Semaphore:C143("TRANSACTIONUPDATE"))
								DelayTicks(2)
							End while 
							//$Mil:=ACC_BatchTimingTest ($mil;"Waited for Transaction Update Semaphore(clearing invalid batch item ref")
							<>TransactionDisableValidation:=True:C214
							SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
							DB_SaveRecord(->[TRANSACTIONS:29])
							//$Mil:=ACC_BatchTimingTest ($mil;"Saving Transaction after clearing invalid batch item ref")
							AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
							UNLOAD RECORD:C212([TRANSACTIONS:29])
							READ ONLY:C145([TRANSACTIONS:29])
							LOAD RECORD:C52([TRANSACTIONS:29])
							<>TransactionDisableValidation:=False:C215
							SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
							CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
							ACC_bo_Delays:=True:C214
							
							//$Mil:=ACC_BatchTimingTest ($mil)
							If ([TRANSACTIONS:29]BatchItem_X_ID:30=0)
								ACC_TransValidateBatch([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTIONS:29]Batch_Number:7)
							End if 
							//$Mil:=ACC_BatchTimingTest ($mil;"Validating batch after clearing invalid batch item reff")
							
							ACC_bo_Delays:=False:C215
							If ($_bo_Delays)
								DelayTicks(2)
							End if 
							
						Else 
							//ACC_t_DebitIO:=ACC_BatchItemCheckIO ([TRANS IN_TRANS SUB]Debit Acc;[TRANS IN_TRANS SUB]Debit IO;"D")
							//$Mil:=ACC_BatchTimingTest ($mil)
							
							ACC_t_DebitIO:=ACC_BatchItemCheckIO($_at_BatchDebACC{$_l_BatchItemPosition}; $_at_BatchItemDebIO{$_l_BatchItemPosition}; "D")
							//$Mil:=ACC_BatchTimingTest ($mil;"CheckingBatch Item IO Debit Side")
							
							//ACC_t_CreditIO:=ACC_BatchItemCheckIO ([TRANS IN_TRANS SUB]Credit Acc;[TRANS IN_TRANS SUB]Credit IO;"C")
							ACC_t_CreditIO:=ACC_BatchItemCheckIO($_at_BatchItemcredACC{$_l_BatchItemPosition}; $_at_BatchItemcredIO{$_l_BatchItemPosition}; "C")
							//$Mil:=ACC_BatchTimingTest ($mil;"CheckingBatch Item IO Credit Side")
							ACC_BatchItemoverrideIO(->ACC_t_DebitIO; ->ACC_t_CreditIO)
							//$Mil:=ACC_BatchTimingTest ($mil;"Overriding Batch item IO")
							Case of 
								: ((ACC_t_DebitIO#"N") & (ACC_t_CreditIO="N"))
									$_r_DebitAmount:=Gen_Round($_ar_BatchItemAmount{$_l_BatchItemPosition}; 2; 2)
									$_r_DebitVatAmount:=Gen_Round($_ar_BatchItemTax{$_l_BatchItemPosition}; 2; 2)
									$_r_DebitTotal:=Gen_Round($_ar_BatchItemTotal{$_l_BatchItemPosition}; 2; 2)
									$_r_CreditAmount:=Gen_Round((0-($_ar_BatchItemTotal{$_l_BatchItemPosition})); 2; 2)
									$_r_CreditVat:=0
									$_r_CreditTotal:=$_r_CreditAmount
								: ((ACC_t_DebitIO="N") & (ACC_t_CreditIO#"N"))
									$_r_CreditAmount:=Gen_Round((0-($_ar_BatchItemAmount{$_l_BatchItemPosition})); 2; 2)
									$_r_CreditVat:=Gen_Round((0-($_ar_BatchItemTax{$_l_BatchItemPosition})); 2; 2)
									$_r_CreditTotal:=Gen_Round((0-($_ar_BatchItemTotal{$_l_BatchItemPosition})); 2; 2)
									$_r_DebitAmount:=Gen_Round(($_ar_BatchItemTotal{$_l_BatchItemPosition}); 2; 2)
									$_r_DebitVatAmount:=0
									$_r_DebitTotal:=$_r_DebitAmount
								Else 
									$_r_CreditAmount:=Gen_Round((0-($_ar_BatchItemAmount{$_l_BatchItemPosition})); 2; 2)
									$_r_CreditVat:=Gen_Round((0-($_ar_BatchItemTax{$_l_BatchItemPosition})); 2; 2)
									$_r_CreditTotal:=Gen_Round((0-($_ar_BatchItemTotal{$_l_BatchItemPosition})); 2; 2)
									$_r_DebitAmount:=Gen_Round($_ar_BatchItemAmount{$_l_BatchItemPosition}; 2; 2)
									$_r_DebitVatAmount:=Gen_Round($_ar_BatchItemTax{$_l_BatchItemPosition}; 2; 2)
									$_r_DebitTotal:=Gen_Round(($_ar_BatchItemTotal{$_l_BatchItemPosition}); 2; 2)
							End case 
							//$Mil:=ACC_BatchTimingTest ($mil;"Calculating batch item amounts")
							$_bo_isCredit:=False:C215
							$_bo_isDebit:=False:C215
							If (($_at_BatchItemcredACC{$_l_BatchItemPosition}=[TRANSACTIONS:29]Account_Code:3) & ($_at_BatchDebACC{$_l_BatchItemPosition}=[TRANSACTIONS:29]Account_Code:3))
								$_bo_isDebit:=([TRANSACTIONS:29]Account_Code:3=$_at_BatchDebACC{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Amount:6=$_r_DebitAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_DebitVatAmount)
								$_bo_isCredit:=([TRANSACTIONS:29]Account_Code:3=$_at_BatchItemcredACC{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Amount:6=$_r_CreditAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_CreditVat)
								If ($_al_BatchItemDebTransID{$_l_BatchItemPosition}=$_l_InputTransactionID)
									$_bo_isDebit:=True:C214
								End if 
								If ($_al_BatchItemcredTransID{$_l_BatchItemPosition}=$_l_InputTransactionID)
									$_bo_isCredit:=True:C214
								End if 
							End if 
							//$Mil:=ACC_BatchTimingTest ($mil;"Testing Is debit or credit")
							$_bo_TransactionBatchItemFound:=True:C214
							Case of 
								: (($_at_BatchItemcredACC{$_l_BatchItemPosition}=[TRANSACTIONS:29]Account_Code:3) & ($_at_BatchDebACC{$_l_BatchItemPosition}#[TRANSACTIONS:29]Account_Code:3)) | ($_bo_isCredit)
									$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=$_al_BatchItemBatchNo{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Account_Code:3=$_at_BatchItemcredACC{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Analysis_Code:2=$_at_BatchItemAnalCode{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Layer_Code:23=$_at_BatchItemLayerCode{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Currency_Code:22=$_at_BatchItemCurrCode{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Amount:6=$_r_CreditAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_CreditVat)
									If ($_bo_OK)
										ACC_Bo_DoSaves:=$_bo_Savit
										If ($_al_BatchItemDebTransID{$_l_BatchItemPosition}#$_l_OtherSideID)
											If ($_bo_Trace)
												//TRACE
											End if 
										End if 
										//$Mil:=ACC_BatchTimingTest ($mil)
										$_l_DebitID:=ACC_CheckDebitSide($_l_InputTransactionID; $_l_OtherSideID; $_r_DebitAmount; $_r_DebitVatAmount; True:C214; False:C215; ->ACC_Bo_DoSaves)
										//$Mil:=ACC_BatchTimingTest ($mil;"Checking Debit Side")
										ACC_bo_Delays:=False:C215
										If ($_bo_Delays)
											DelayTicks(2)
										End if 
										$_bo_Savit:=ACC_Bo_DoSaves
									Else 
										ACC_Bo_DoSaves:=$_bo_Savit
										//$Mil:=ACC_BatchTimingTest ($mil)
										ACC_ModifyTransaction([TRANSACTIONS:29]Transaction_ID:31; $_l_BatchItemID; "C"; $_at_BatchItemcredACC{$_l_BatchItemPosition}; $_at_BatchItemAnalCode{$_l_BatchItemPosition}; $_at_BatchItemLayerCode{$_l_BatchItemPosition}; $_at_BatchItemCurrCode{$_l_BatchItemPosition}; $_r_CreditAmount; $_r_CreditVat; False:C215; ->ACC_Bo_DoSaves)
										//$Mil:=ACC_BatchTimingTest ($mil;"Modifying transaction")
										If ($_bo_Delays)
											DelayTicks(2)
										End if 
										$_bo_Savit:=ACC_Bo_DoSaves
										$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=$_al_BatchItemBatchNo{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Account_Code:3=$_at_BatchItemcredACC{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Analysis_Code:2=$_at_BatchItemAnalCode{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Layer_Code:23=$_at_BatchItemLayerCode{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Currency_Code:22=$_at_BatchItemCurrCode{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Amount:6=$_r_CreditAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_CreditVat)
										If (Not:C34($_bo_OK))
											//$Mil:=ACC_BatchTimingTest ($mil)
											$_bo_OK:=ACC_TransMatchBatch(True:C214; $_r_CreditAmount; $_r_CreditVat; False:C215)
											//$Mil:=ACC_BatchTimingTest ($mil;"Matching cedit side because bacth item is not correct")
											If ($_bo_Delays)
												DelayTicks(2)
											End if 
											
											If (Not:C34($_bo_OK))
												
												QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=$_l_BatchItemID)
												[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=0
												DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
												
												READ WRITE:C146([TRANSACTIONS:29])
												LOAD RECORD:C52([TRANSACTIONS:29])
												//$Mil:=ACC_BatchTimingTest ($mil)
												ACC_ClearBatchItemID
												//$Mil:=ACC_BatchTimingTest ($mil;"Clearing batch item because item did not match")
												UNLOAD RECORD:C212([TRANSACTIONS:29])
												READ ONLY:C145([TRANSACTIONS:29])
												LOAD RECORD:C52([TRANSACTIONS:29])
												$_bo_TransactionBatchItemFound:=False:C215
												$_bo_Savit:=True:C214
											End if 
											
										Else 
											ACC_Bo_DoSaves:=$_bo_Savit
											If ($_al_BatchItemDebTransID{$_l_BatchItemPosition}#$_l_OtherSideID)
												If ($_bo_Trace)
													
												End if 
											End if 
											//$Mil:=ACC_BatchTimingTest
											$_l_DebitID:=ACC_CheckDebitSide($_l_InputTransactionID; $_l_OtherSideID; $_r_DebitAmount; $_r_DebitVatAmount; True:C214; False:C215; ->ACC_Bo_DoSaves)
											//$Mil:=ACC_BatchTimingTest ($mil;"Checking Debit side")
											If ($_bo_Delays)
												DelayTicks(2)
											End if 
											$_bo_Savit:=ACC_Bo_DoSaves
										End if 
									End if 
								: (($_at_BatchItemcredACC{$_l_BatchItemPosition}#[TRANSACTIONS:29]Account_Code:3) & ($_at_BatchDebACC{$_l_BatchItemPosition}=[TRANSACTIONS:29]Account_Code:3)) | ($_bo_isDebit)
									$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=$_al_BatchItemBatchNo{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Account_Code:3=$_at_BatchDebACC{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Analysis_Code:2=$_at_BatchItemAnalCode{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Layer_Code:23=$_at_BatchItemLayerCode{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Currency_Code:22=$_at_BatchItemCurrCode{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Amount:6=$_r_DebitAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_DebitVatAmount)
									If ($_bo_OK)
										ACC_Bo_DoSaves:=$_bo_Savit
										If ($_al_BatchItemcredTransID{$_l_BatchItemPosition}#$_l_OtherSideID)
											If ($_bo_Trace)
												
											End if 
										End if 
										//$Mil:=ACC_BatchTimingTest
										$_l_CreditID:=ACC_CheckCreditSide($_l_InputTransactionID; $_l_OtherSideID; $_r_CreditAmount; $_r_CreditVat; True:C214; False:C215; ->ACC_Bo_DoSaves)
										//$Mil:=ACC_BatchTimingTest ($mil;"Checking Debit side")
										If ($_bo_Delays)
											DelayTicks(2)
										End if 
										$_bo_Savit:=ACC_Bo_DoSaves
									Else 
										ACC_Bo_DoSaves:=$_bo_Savit
										//$Mil:=ACC_BatchTimingTest
										ACC_ModifyTransaction([TRANSACTIONS:29]Transaction_ID:31; $_l_BatchItemID; "D"; $_at_BatchDebACC{$_l_BatchItemPosition}; $_at_BatchItemAnalCode{$_l_BatchItemPosition}; $_at_BatchItemLayerCode{$_l_BatchItemPosition}; $_at_BatchItemCurrCode{$_l_BatchItemPosition}; $_r_DebitAmount; $_r_DebitVatAmount; False:C215; ->ACC_Bo_DoSaves)
										//$Mil:=ACC_BatchTimingTest ($mil;"Modifying transaction because batchi item it not correct")
										If ($_bo_Delays)
											DelayTicks(2)
										End if 
										$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=$_al_BatchItemBatchNo{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Account_Code:3=$_at_BatchDebACC{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Analysis_Code:2=$_at_BatchItemAnalCode{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Layer_Code:23=$_at_BatchItemLayerCode{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Currency_Code:22=$_at_BatchItemCurrCode{$_l_BatchItemPosition}) & ([TRANSACTIONS:29]Amount:6=$_r_DebitAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_DebitVatAmount)
										If (Not:C34($_bo_OK))
											//$Mil:=ACC_BatchTimingTest
											$_bo_OK:=ACC_TransMatchBatch(False:C215; $_r_DebitAmount; $_r_DebitVatAmount; False:C215)
											//$Mil:=ACC_BatchTimingTest ($mil;"Matching debit side")
											If ($_bo_Delays)
												DelayTicks(2)
											End if 
											If (Not:C34($_bo_OK))
												//$Mil:=ACC_BatchTimingTest
												
												QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=$_l_BatchItemID)
												
												READ WRITE:C146([TRANSACTIONS:29])
												LOAD RECORD:C52([TRANSACTIONS:29])
												
												ACC_ClearBatchItemID
												
												UNLOAD RECORD:C212([TRANSACTIONS:29])
												READ ONLY:C145([TRANSACTIONS:29])
												LOAD RECORD:C52([TRANSACTIONS:29])
												[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
												DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
												$_bo_TransactionBatchItemFound:=False:C215
												$_bo_Savit:=True:C214
												If ($_bo_Delays)
													DelayTicks(2)
												End if 
												
											End if 
											
										Else 
											ACC_Bo_DoSaves:=$_bo_Savit
											If ($_al_BatchItemcredTransID{$_l_BatchItemPosition}#$_l_OtherSideID)
												If ($_bo_Trace)
													
												End if 
											End if 
											//$Mil:=ACC_BatchTimingTest
											$_l_CreditID:=ACC_CheckCreditSide($_l_InputTransactionID; $_l_OtherSideID; $_r_CreditAmount; $_r_CreditVat; True:C214)
											//$Mil:=ACC_BatchTimingTest ($mil;"Checking credit side")
											If ($_bo_Delays)
												DelayTicks(2)
											End if 
											
											$_bo_Savit:=ACC_Bo_DoSaves
										End if 
									End if 
							End case 
							If ($_bo_TransactionBatchItemFound=False:C215)
								If ($_bo_Savit)
									//$Mil:=ACC_BatchTimingTest
									DB_SaveRecord(->[TRANSACTION_BATCHES:30])
									//$Mil:=ACC_BatchTimingTest ($mil;"Saving trans in record after changes")
								End if 
								If ($_bo_Delays)
									DelayTicks(2)
								End if 
								
								$_bo_Savit:=False:C215
								ACC_bo_Delays:=True:C214
								//$Mil:=ACC_BatchTimingTest
								If ([TRANSACTIONS:29]BatchItem_X_ID:30=0)
									ACC_TransValidateBatch($_l_InputTransactionID; $_l_BatchNo)
								End if 
								//$Mil:=ACC_BatchTimingTest ($mil;"Validating batch because no batch item related")
								ACC_bo_Delays:=False:C215
								If ($_bo_Delays)
									DelayTicks(2)
								End if 
								
							End if 
						End if 
					Else 
						READ WRITE:C146([TRANSACTION_BATCHES:30])
						LOAD RECORD:C52([TRANSACTION_BATCHES:30])
						$_l_TransactionID:=$_l_InputTransactionID
						$_bo_TransactionBatchItemFound:=False:C215
						//$Mil:=ACC_BatchTimingTest
						
						QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]CreditTransID:26=$_l_TransactionID)
						//$Mil:=ACC_BatchTimingTest ($mil;"Finding trans in record for transaction ID"+String($_l_TransactionID))
						
						If ($_bo_Delays)
							DelayTicks(2)
						End if 
						If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])=1)
							$_bo_TransactionBatchItemFound:=True:C214
							If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
								[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
								DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
								$_bo_Savit:=True:C214
							End if 
							
							ACC_t_DebitIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; [TRANSACTION_BATCH_ITEMS:155]Debit_IO:15; "D")
							
							ACC_t_CreditIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Credit_IO:16; "C")
							ACC_BatchItemoverrideIO(->ACC_t_DebitIO; ->ACC_t_CreditIO)
							Case of 
								: ((ACC_t_DebitIO#"N") & ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16="N"))
									$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
									$_r_DebitVatAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
									$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
									$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
									$_r_CreditVat:=0
									$_r_CreditTotal:=$_r_CreditAmount
								: ((ACC_t_DebitIO="N") & (ACC_t_CreditIO#"N"))
									$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
									$_r_CreditVat:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
									$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
									$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
									$_r_DebitVatAmount:=0
									$_r_DebitTotal:=$_r_DebitAmount
								Else 
									$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
									$_r_CreditVat:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
									$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
									$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
									$_r_DebitVatAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
									$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
							End case 
							//$Mil:=ACC_BatchTimingTest ($mil;"Calculiting transaction devit and credit amounts")
							$_bo_OK:=([TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2) & ([TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20) & ([TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19) & ([TRANSACTIONS:29]Amount:6=$_r_CreditAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_CreditVat)
							$_l_OtherSideID:=0
							If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27>0)
								$_l_OtherSideID:=[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27
							Else 
								If ([TRANSACTIONS:29]Transaction_OtherSideID:32>0)
									$_l_OtherSideID:=[TRANSACTIONS:29]Transaction_OtherSideID:32
								End if 
							End if 
							
							If ($_bo_OK)
								ACC_Bo_DoSaves:=$_bo_Savit
								If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27#$_l_OtherSideID)
									If ($_bo_Trace)
										
									End if 
								End if 
								//$Mil:=ACC_BatchTimingTest
								$_l_DebitID:=ACC_CheckDebitSide($_l_InputTransactionID; $_l_OtherSideID; $_r_DebitAmount; $_r_DebitVatAmount; True:C214; False:C215; ->ACC_Bo_DoSaves)
								//$Mil:=ACC_BatchTimingTest ($mil;"Checking debit side 558")
								If ($_bo_Delays)
									DelayTicks(2)
								End if 
								
								$_bo_Savit:=ACC_Bo_DoSaves
							Else 
								ACC_Bo_DoSaves:=$_bo_Savit
								//$Mil:=ACC_BatchTimingTest
								ACC_ModifyTransaction([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; "C"; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $_r_CreditAmount; $_r_CreditVat; False:C215; ->ACC_Bo_DoSaves)
								//$Mil:=ACC_BatchTimingTest ($mil;"Modify transaction")
								If ($_bo_Delays)
									DelayTicks(2)
								End if 
								$_bo_Savit:=ACC_Bo_DoSaves
								$_bo_OK:=([TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2) & ([TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20) & ([TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19) & ([TRANSACTIONS:29]Amount:6=$_r_CreditAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_CreditVat)
								If (Not:C34($_bo_OK))
									//$Mil:=ACC_BatchTimingTest
									$_bo_OK:=ACC_TransMatchBatch(True:C214; $_r_CreditAmount; $_r_CreditVat; False:C215)
									//$Mil:=ACC_BatchTimingTest ($mil;"match batch 575")
									If ($_bo_Delays)
										DelayTicks(2)
									End if 
									
									If (Not:C34($_bo_OK))
										READ WRITE:C146([TRANSACTIONS:29])
										LOAD RECORD:C52([TRANSACTIONS:29])
										//$Mil:=ACC_BatchTimingTest
										ACC_ClearBatchItemID
										//$Mil:=ACC_BatchTimingTest ($mil;"clear batch item id 587")
										UNLOAD RECORD:C212([TRANSACTIONS:29])
										READ ONLY:C145([TRANSACTIONS:29])
										LOAD RECORD:C52([TRANSACTIONS:29])
										[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=0
										$_bo_TransactionBatchItemFound:=False:C215
										$_bo_Savit:=True:C214
									End if 
									
								Else 
									ACC_Bo_DoSaves:=$_bo_Savit
									If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27#$_l_OtherSideID)
										If ($_bo_Trace)
											
										End if 
									End if 
									//$Mil:=ACC_BatchTimingTest
									
									$_l_DebitID:=ACC_CheckDebitSide($_l_InputTransactionID; $_l_OtherSideID; $_r_DebitAmount; $_r_DebitVatAmount; True:C214; False:C215; ->ACC_Bo_DoSaves)
									//$Mil:=ACC_BatchTimingTest ($mil;"check debit side 606")
									
									If ($_bo_Delays)
										DelayTicks(2)
									End if 
									
									$_bo_Savit:=ACC_Bo_DoSaves
								End if 
							End if 
							
						Else 
							If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26>0)
								READ WRITE:C146([TRANSACTIONS:29])
								LOAD RECORD:C52([TRANSACTIONS:29])
								//$Mil:=ACC_BatchTimingTest
								
								ACC_ClearBatchItemID
								//$Mil:=ACC_BatchTimingTest ($mil;"clear batch item id 623")
								
								UNLOAD RECORD:C212([TRANSACTIONS:29])
								READ ONLY:C145([TRANSACTIONS:29])
								LOAD RECORD:C52([TRANSACTIONS:29])
								[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=0
								DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
								
								$_bo_TransactionBatchItemFound:=False:C215
								$_bo_Savit:=True:C214
							End if 
							
						End if 
						If (Not:C34($_bo_TransactionBatchItemFound))
							QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]DebitTransID:27=$_l_TransactionID)
							If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])=1)
								$_bo_TransactionBatchItemFound:=True:C214
								If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
									[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
									DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
									$_bo_Savit:=True:C214
								End if 
								//$Mil:=ACC_BatchTimingTest
								ACC_t_DebitIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; [TRANSACTION_BATCH_ITEMS:155]Debit_IO:15; "D")
								//$Mil:=ACC_BatchTimingTest ($mil;"Checking batch item debit IO 649")
								ACC_t_CreditIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Credit_IO:16; "C")
								//$Mil:=ACC_BatchTimingTest ($mil;"Checking batch item  credit  IO 650")
								ACC_BatchItemoverrideIO(->ACC_t_DebitIO; ->ACC_t_CreditIO)
								//$Mil:=ACC_BatchTimingTest ($mil;"overriding batch IO 652")
								Case of 
									: ((ACC_t_DebitIO#"N") & (ACC_t_CreditIO="N"))
										$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
										$_r_DebitVatAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
										$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
										$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
										$_r_CreditVat:=0
										$_r_CreditTotal:=$_r_CreditAmount
									: ((ACC_t_DebitIO="N") & (ACC_t_CreditIO#"N"))
										$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
										$_r_CreditVat:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
										$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
										$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
										$_r_DebitVatAmount:=0
										$_r_DebitTotal:=$_r_DebitAmount
									Else 
										$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
										$_r_CreditVat:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
										$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
										$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
										$_r_DebitVatAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
										$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
								End case 
								//$Mil:=ACC_BatchTimingTest ($mil;"Calculating batch item total 676")
								$_bo_OK:=([TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2) & ([TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20) & ([TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19) & ([TRANSACTIONS:29]Amount:6=$_r_DebitAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_DebitVatAmount)
								$_l_OtherSideID:=0
								If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26>0)
									$_l_OtherSideID:=[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26
								Else 
									If ([TRANSACTIONS:29]Transaction_OtherSideID:32>0)
										$_l_OtherSideID:=[TRANSACTIONS:29]Transaction_OtherSideID:32
									End if 
								End if 
								If ($_bo_OK)
									ACC_Bo_DoSaves:=$_bo_Savit
									If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26#$_l_OtherSideID)
										If ($_bo_Trace)
											
										End if 
									End if 
									//$Mil:=ACC_BatchTimingTest
									$_l_CreditID:=ACC_CheckCreditSide($_l_InputTransactionID; $_l_OtherSideID; $_r_CreditAmount; $_r_CreditVat; True:C214; False:C215; ->ACC_Bo_DoSaves)
									//$Mil:=ACC_BatchTimingTest ($mil;"check credit side e695")
									If ($_bo_Delays)
										DelayTicks(2)
									End if 
									
									$_bo_Savit:=ACC_Bo_DoSaves
								Else 
									ACC_Bo_DoSaves:=$_bo_Savit
									//$Mil:=ACC_BatchTimingTest
									ACC_ModifyTransaction([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; "D"; [TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $_r_DebitAmount; $_r_DebitVatAmount; False:C215; ->ACC_Bo_DoSaves)
									//$Mil:=ACC_BatchTimingTest ($mil;"modifiying transaction 704")
									If ($_bo_Delays)
										DelayTicks(2)
									End if 
									$_bo_Savit:=ACC_Bo_DoSaves
									$_bo_OK:=([TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2) & ([TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20) & ([TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19) & ([TRANSACTIONS:29]Amount:6=$_r_DebitAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_DebitVatAmount)
									If (Not:C34($_bo_OK))
										//$Mil:=ACC_BatchTimingTest
										
										$_bo_OK:=ACC_TransMatchBatch(False:C215; $_r_DebitAmount; $_r_DebitVatAmount; False:C215)
										//$Mil:=ACC_BatchTimingTest ($mil;"Match batch")
										If ($_bo_Delays)
											DelayTicks(2)
										End if 
										
										If (Not:C34($_bo_OK))
											READ WRITE:C146([TRANSACTIONS:29])
											LOAD RECORD:C52([TRANSACTIONS:29])
											//$Mil:=ACC_BatchTimingTest
											ACC_ClearBatchItemID
											//$Mil:=ACC_BatchTimingTest ($mil;"clearing batch item id 725")
											UNLOAD RECORD:C212([TRANSACTIONS:29])
											READ ONLY:C145([TRANSACTIONS:29])
											LOAD RECORD:C52([TRANSACTIONS:29])
											[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
											DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
											
											$_bo_Savit:=True:C214
											
											$_bo_TransactionBatchItemFound:=False:C215
										End if 
										
									Else 
										ACC_Bo_DoSaves:=$_bo_Savit
										If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26#$_l_OtherSideID)
											If ($_bo_Trace)
												
											End if 
										End if 
										//$Mil:=ACC_BatchTimingTest
										$_l_CreditID:=ACC_CheckCreditSide($_l_InputTransactionID; $_l_OtherSideID; $_r_CreditAmount; $_r_CreditVat; True:C214; False:C215; ->ACC_Bo_DoSaves)
										//$Mil:=ACC_BatchTimingTest ($mil;"checking credit side")
										If ($_bo_Delays)
											DelayTicks(2)
										End if 
										
										$_bo_Savit:=ACC_Bo_DoSaves
									End if 
								End if 
							Else 
								If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27>0)
									READ WRITE:C146([TRANSACTIONS:29])
									LOAD RECORD:C52([TRANSACTIONS:29])
									//$Mil:=ACC_BatchTimingTest
									ACC_ClearBatchItemID
									//$Mil:=ACC_BatchTimingTest ($mil;"Clear batch item id 748")
									UNLOAD RECORD:C212([TRANSACTIONS:29])
									READ ONLY:C145([TRANSACTIONS:29])
									LOAD RECORD:C52([TRANSACTIONS:29])
									[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
									DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
									
									$_bo_TransactionBatchItemFound:=False:C215
									$_bo_Savit:=True:C214
								End if 
							End if 
							
							
						End if 
						If (Not:C34($_bo_TransactionBatchItemFound))
							QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTIONS:29]Batch_Number:7)
							
							
							FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
							$_bo_BatchItemFound:=False:C215
							For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
								If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
									[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
									DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
									$_bo_Savit:=True:C214
								End if 
								//$Mil:=ACC_BatchTimingTest
								
								ACC_t_DebitIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; [TRANSACTION_BATCH_ITEMS:155]Debit_IO:15; "D")
								//$Mil:=ACC_BatchTimingTest ($mil;"checking batch item IO 788")
								
								ACC_t_CreditIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Credit_IO:16; "C")
								//$Mil:=ACC_BatchTimingTest ($mil;"checking batch item IO 791")
								
								ACC_BatchItemoverrideIO(->ACC_t_DebitIO; ->ACC_t_CreditIO)
								//$Mil:=ACC_BatchTimingTest ($mil;"over ride batch item IO 797")
								
								Case of 
									: ((ACC_t_DebitIO#"N") & (ACC_t_CreditIO="N"))
										$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
										$_r_DebitVatAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
										$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
										$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
										$_r_CreditVat:=0
										$_r_CreditTotal:=$_r_CreditAmount
									: ((ACC_t_DebitIO="N") & (ACC_t_CreditIO#"N"))
										$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
										$_r_CreditVat:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
										$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
										$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
										$_r_DebitVatAmount:=0
										$_r_DebitTotal:=$_r_DebitAmount
									Else 
										$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
										$_r_CreditVat:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
										$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
										$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
										$_r_DebitVatAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
										$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
								End case 
								//$Mil:=ACC_BatchTimingTest ($mil;"calculating batch item totals")
								
								$_bo_isDebit:=False:C215
								$_bo_isCredit:=False:C215
								If (([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12=[TRANSACTIONS:29]Account_Code:3) & ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3=[TRANSACTIONS:29]Account_Code:3))
									$_bo_isDebit:=([TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3) & ([TRANSACTIONS:29]Amount:6=$_r_DebitAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_DebitVatAmount)
									$_bo_isCredit:=([TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12) & ([TRANSACTIONS:29]Amount:6=$_r_CreditAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_CreditVat)
								End if 
								Case of 
									: (([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12=[TRANSACTIONS:29]Account_Code:3) & ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#[TRANSACTIONS:29]Account_Code:3)) | ($_bo_isCredit)
										If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26=0) | ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26=[TRANSACTIONS:29]Transaction_ID:31)  //if it has another transaction ID in it cannot be the one
											$_bo_OK:=([TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2) & ([TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20) & ([TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19) & ([TRANSACTIONS:29]Amount:6=$_r_CreditAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_CreditVat)
											If ($_bo_OK)
												$_bo_BatchItemFound:=True:C214
												$_l_Index:=-1
												$_l_OtherSideID:=[TRANSACTIONS:29]Transaction_OtherSideID:32
												ACC_Bo_DoSaves:=$_bo_Savit
												If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27#$_l_OtherSideID)
													If ($_bo_Trace)
														
													End if 
												End if 
												//$Mil:=ACC_BatchTimingTest
												
												$_l_DebitID:=ACC_CheckDebitSide($_l_InputTransactionID; $_l_OtherSideID; $_r_DebitAmount; $_r_DebitVatAmount; True:C214; False:C215; ->ACC_Bo_DoSaves)
												//$Mil:=ACC_BatchTimingTest ($mil;"checking debit side 843")
												
												If ($_bo_Delays)
													DelayTicks(2)
												End if 
												$_bo_Savit:=ACC_Bo_DoSaves
											End if 
										End if 
									: (([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#[TRANSACTIONS:29]Account_Code:3) & ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3=[TRANSACTIONS:29]Account_Code:3)) | ($_bo_isDebit)
										If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27=0) | ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27=[TRANSACTIONS:29]Transaction_ID:31)  //if it has another transaction ID in it cannot be the one
											$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10) & ([TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3) & ([TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2) & ([TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20) & ([TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19) & ([TRANSACTIONS:29]Amount:6=$_r_DebitAmount) & ([TRANSACTIONS:29]Tax_Amount:16=$_r_DebitVatAmount)
											If ($_bo_OK)
												$_bo_BatchItemFound:=True:C214
												$_l_OtherSideID:=[TRANSACTIONS:29]Transaction_OtherSideID:32
												ACC_Bo_DoSaves:=$_bo_Savit
												If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26#$_l_OtherSideID)
													If ($_bo_Trace)
														
													End if 
												End if 
												//$Mil:=ACC_BatchTimingTest
												
												$_l_CreditID:=ACC_CheckCreditSide($_l_InputTransactionID; $_l_OtherSideID; $_r_CreditAmount; $_r_CreditVat; True:C214; False:C215; ->ACC_Bo_DoSaves)
												//$Mil:=ACC_BatchTimingTest ($mil;"checking credit side 868")
												
												If ($_bo_Delays)
													DelayTicks(2)
												End if 
												$_bo_Savit:=ACC_Bo_DoSaves
											End if 
										End if 
								End case 
								NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
								If ($_bo_BatchItemFound)
									$_l_Index:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])
								End if 
							End for 
							If (Not:C34($_bo_BatchItemFound))
								If ($_bo_Savit)
									//$Mil:=ACC_BatchTimingTest
									
									DB_SaveRecord(->[TRANSACTION_BATCHES:30])
									//$Mil:=ACC_BatchTimingTest ($mil;"savging trans in record")
									
								End if 
								
								If ($_bo_BatchFilter)
									$_l_BatchPosition:=Find in array:C230($5->; [TRANSACTION_BATCHES:30]Batch_Number:10)
									If ($_l_BatchPosition<0)
										ACC_TransValidateALL([TRANSACTION_BATCHES:30]Batch_Number:10)
										If ($_bo_Delays)
											DelayTicks(2)
										End if 
										
									End if 
								Else 
									ACC_TransValidateALL([TRANSACTION_BATCHES:30]Batch_Number:10)
									If ($_bo_Delays)
										DelayTicks(2)
									End if 
									
								End if 
								
								If (Count parameters:C259>=3)
									If ($3)
										$0:=True:C214
									End if 
								End if 
								
							Else 
								If ($_bo_Savit)
									DB_SaveRecord(->[TRANSACTION_BATCHES:30])
								End if 
								
								UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
							End if 
						End if 
					End if 
				Else 
					ACC_BATCHREPORTERROR($_l_BatchNo; 0; 0; 0; -1)
				End if 
				UNLOAD RECORD:C212([TRANSACTIONS:29])
			Else 
				ACC_BATCHREPORTERROR(-$_l_InputTransactionID; 0; 0; 0; -1)
			End if 
		End if 
	Else 
		ACC_BATCHREPORTERROR(-$_l_InputTransactionID; 0; 0; 0; -1)
	End if 
End if 
ERR_MethodTrackerReturn("ACC_TransValidateBatch"; $_t_oldMethodName)
