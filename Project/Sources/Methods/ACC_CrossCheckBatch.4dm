//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_CrossCheckBatch
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
	ARRAY LONGINT:C221($_al_BatchRefersCredit; 0)
	ARRAY LONGINT:C221($_al_BatchRefersDebit; 0)
	C_BOOLEAN:C305($_bo_SaveIt)
	C_LONGINT:C283($_l_BatchDebitRow; $_l_Index; DS_l_BATCHITEMRef)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_CrossCheckBatch")
ARRAY LONGINT:C221($_al_BatchRefersDebit; 0)
ARRAY LONGINT:C221($_al_BatchRefersCredit; 0)
ARRAY LONGINT:C221($_al_BatchRefersDebit; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
ARRAY LONGINT:C221($_al_BatchRefersCredit; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
$_bo_SaveIt:=False:C215
For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
	If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26>0)
		$_l_BatchDebitRow:=Find in array:C230($_al_BatchRefersCredit; [TRANSACTION_BATCH_ITEMS:155]CreditTransID:26)
		If ($_l_BatchDebitRow>0)
			If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
				[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
			End if 
			[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=0
			DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			$_bo_SaveIt:=True:C214
		Else 
			$_l_BatchDebitRow:=Find in array:C230($_al_BatchRefersCredit; 0)
			$_al_BatchRefersCredit{$_l_BatchDebitRow}:=[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26
		End if 
	End if 
	If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27>0)
		$_l_BatchDebitRow:=Find in array:C230($_al_BatchRefersDebit; [TRANSACTION_BATCH_ITEMS:155]DebitTransID:27)
		If ($_l_BatchDebitRow>0)
			If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
				[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
			End if 
			[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
			DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			$_bo_SaveIt:=True:C214
		Else 
			$_l_BatchDebitRow:=Find in array:C230($_al_BatchRefersDebit; 0)
			$_al_BatchRefersDebit{$_l_BatchDebitRow}:=[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27
		End if 
	End if 
	NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
End for 
If ($_bo_SaveIt)
	DB_SaveRecord(->[TRANSACTION_BATCHES:30])
End if 
ERR_MethodTrackerReturn("ACC_CrossCheckBatch"; $_t_oldMethodName)
