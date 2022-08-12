//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_Update2
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
	C_LONGINT:C283($_l_TransPostStatus)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_Update2")
READ WRITE:C146([TRANSACTIONS:29])
READ WRITE:C146([TRANSACTION_BATCHES:30])
READ WRITE:C146([ACCOUNT_BALANCES:34])
FIRST RECORD:C50([TRANSACTION_BATCHES:30])
$_l_TransPostStatus:=0
//START TRANSACTION
StartTransaction
While (Not:C34(End selection:C36([TRANSACTION_BATCHES:30]))) & ($_l_TransPostStatus>=0)
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
	APPLY TO SELECTION:C70([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=Periods_ConvCal([TRANSACTION_BATCH_ITEMS:155]Period_Code:11))
	DB_t_CurrentFormUsage:="TransUp"
	
	$_l_TransPostStatus:=TransactionBatch_Post
	NEXT RECORD:C51([TRANSACTION_BATCHES:30])
End while 
If ($_l_TransPostStatus>=0)
	//VALIDATE TRANSACTION(true)
	Transact_End(True:C214)
	
Else 
	//CANCEL TRANSACTION
	Transact_End(False:C215)
	Gen_Alert("The updating of the transactions was cancelled")
End if 
ERR_MethodTrackerReturn("Trans_Update2"; $_t_oldMethodName)
