//%attributes = {}

If (False:C215)
	//Project Method Name:      ACC_TransMatchBatch
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
	C_BOOLEAN:C305($_bo_Fix; $_bo_OK; $0; $1; $4)
	C_REAL:C285($2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_TransMatchBatch")

//Acc_transMatchBatch
$_t_oldMethodName:=ERR_MethodTracker("ACC_TransMatchBatch")
$_bo_OK:=False:C215
If (Records in selection:C76([TRANSACTIONS:29])>0)
	If (Count parameters:C259>=4)
		$_bo_Fix:=$4
	Else 
		$_bo_Fix:=False:C215
	End if 
	If ($1)
		$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10) & ([TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12) & ([TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2) & ([TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20) & ([TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19) & ([TRANSACTIONS:29]Amount:6=$2) & ([TRANSACTIONS:29]Tax_Amount:16=$3)
		If (Not:C34($_bo_OK))
			If ([TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28=1) & ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
				//We are ignoring a mismatch becasuse we tried to save a change to the record and the settings did not allow it
				$_bo_OK:=True:C214
			End if 
			If (Not:C34($_bo_OK))
				If ($_bo_Fix)
					ACC_ClearBatchItemID
					UNLOAD RECORD:C212([TRANSACTIONS:29])
				Else 
					If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26>0)
						ACC_BatchFindTransaction([TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $2; $3; True:C214)
						If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26=[TRANSACTIONS:29]Transaction_ID:31)
							$_bo_OK:=(Records in selection:C76([TRANSACTIONS:29])=1)
						End if 
						
					End if 
					
				End if 
			End if 
		End if 
	Else 
		$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10) & ([TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3) & ([TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2) & ([TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20) & ([TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19) & ([TRANSACTIONS:29]Amount:6=$2) & ([TRANSACTIONS:29]Tax_Amount:16=$3)
		If (Not:C34($_bo_OK))
			If ([TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29=1) & ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
				//We are ignoring a mismatch becasuse we tried to save a change to the record and the settings did not allow it
				$_bo_OK:=True:C214
			End if 
			If (Not:C34($_bo_OK))
				If ($_bo_Fix)
					ACC_ClearBatchItemID
					UNLOAD RECORD:C212([TRANSACTIONS:29])
				Else 
					If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27>0)
						ACC_BatchFindTransaction([TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $2; $3; True:C214)
						$_bo_OK:=(Records in selection:C76([TRANSACTIONS:29])=1)
						If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27=[TRANSACTIONS:29]Transaction_ID:31)
							$_bo_OK:=(Records in selection:C76([TRANSACTIONS:29])=1)
						End if 
					End if 
					
				End if 
			End if 
		End if 
	End if 
Else 
	$_bo_OK:=False:C215
End if 

$0:=$_bo_OK
ERR_MethodTrackerReturn("ACC_TransMatchBatch"; $_t_oldMethodName)
