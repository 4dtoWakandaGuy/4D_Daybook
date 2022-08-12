If (False:C215)
	//object Method Name: Object Name:      ACC_ReconcileSelectTransactions.OEnterTransaction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/02/2013 15:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ABR_abo_UNSelected;0)
	//ARRAY INTEGER(ABR_ad_unResolvedDate;0)
	//ARRAY LONGINT(ABR_al_unResolvedBatch;0)
	//ARRAY LONGINT(ABR_al_UNTransactionID;0)
	//ARRAY REAL(ABR_ar_AlreadyReconciledAmount;0)
	//ARRAY REAL(ABR_ar_TransactionBalance;0)
	//ARRAY REAL(ABR_ar_TRYUNReconcilledAmt;0)
	//ARRAY REAL(ABR_ar_unResolvedTRAmount;0)
	//ARRAY TEXT(ABR_at_unCurrencyCode;0)
	//ARRAY TEXT(ABR_at_unResolvedAccountCOde;0)
	//ARRAY TEXT(ABR_at_UnResolvedCheque;0)
	//ARRAY TEXT(ABR_at_unResolvedDescription;0)
	//ARRAY TEXT(ABR_at_unResolvedPeriod;0)
	C_BOOLEAN:C305(<>OneEntry; $_bo_inRecord; $_bo_inRecordListing; $_bo_OneEntry; $_bo_RecordsinNewProcess; DB_bo_InRecord; DB_bo_InRecordListing; DB_bo_RecordsinNewProcess)
	C_LONGINT:C283($_l_BatchNumber; $_l_CurrentDisplayedForm; $_l_Index; $_l_TableNumber; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_FromBankAcc; $_t_oldMethodName; $_t_ToBankAcc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ReconcileSelectTransactions.OEnterTransaction"; Form event code:C388)
//ZTrans OnScreen
$_bo_inRecordListing:=DB_bo_InRecordListing
$_bo_inRecord:=DB_bo_InRecord
$_bo_RecordsinNewProcess:=DB_bo_RecordsinNewProcess
$_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedForm
$_bo_OneEntry:=<>OneEntry
//```

<>OneEntry:=True:C214
DB_l_CurrentDisplayedForm:=Table:C252(->[TRANSACTION_BATCHES:30])
DB_bo_RecordsinNewProcess:=False:C215
$_l_TableNumber:=Table:C252(->[TRANSACTION_BATCHES:30])
REDUCE SELECTION:C351([TRANSACTION_BATCHES:30]; 0)
DB_MenuNewRecord("TRANS IN")
If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
	$_l_BatchNumber:=[TRANSACTION_BATCHES:30]Batch_Number:10
	QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=$_l_BatchNumber)
	$_t_FromBankAcc:=DB_GetSalesLedgerBankFrom
	$_t_ToBankAcc:=DB_GetSalesLedgerBankTo
	For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
		If ([TRANSACTIONS:29]Account_Code:3>=$_t_FromBankAcc) & ([TRANSACTIONS:29]Account_Code:3<=$_t_ToBankAcc)
			
			APPEND TO ARRAY:C911(ABR_at_unResolvedAccountCOde; [TRANSACTIONS:29]Account_Code:3)
			APPEND TO ARRAY:C911(ABR_al_unResolvedBatch; [TRANSACTIONS:29]Batch_Number:7)
			APPEND TO ARRAY:C911(ABR_at_UnResolvedCheque; [TRANSACTIONS:29]Cheque_Number:13)
			APPEND TO ARRAY:C911(ABR_at_unCurrencyCode; [TRANSACTIONS:29]Currency_Code:22)
			APPEND TO ARRAY:C911(ABR_ad_unResolvedDate; [TRANSACTIONS:29]Entry_Date:11)
			APPEND TO ARRAY:C911(ABR_at_unResolvedPeriod; [TRANSACTIONS:29]Period_Code:12)
			APPEND TO ARRAY:C911(ABR_ar_unResolvedTRAmount; [TRANSACTIONS:29]Total:17)
			APPEND TO ARRAY:C911(ABR_at_unResolvedDescription; [TRANSACTIONS:29]Description:8)
			APPEND TO ARRAY:C911(ABR_al_UNTransactionID; [TRANSACTIONS:29]Transaction_ID:31)
			APPEND TO ARRAY:C911(ABR_ar_AlreadyReconciledAmount; [TRANSACTIONS:29]ReconcilledAmount:34)
			APPEND TO ARRAY:C911(ABR_ar_TRYUNReconcilledAmt; 0)
			APPEND TO ARRAY:C911(ABR_ar_TransactionBalance; (ABR_ar_unResolvedTRAmount{$_l_Index}-ABR_ar_AlreadyReconciledAmount{$_l_Index}))
			APPEND TO ARRAY:C911(ABR_abo_UNSelected; False:C215)
		End if 
		NEXT RECORD:C51([TRANSACTIONS:29])
	End for 
End if 
DB_bo_InRecordListing:=$_bo_inRecordListing
DB_bo_InRecord:=$_bo_inRecord
DB_bo_RecordsinNewProcess:=$_bo_RecordsinNewProcess
DB_l_CurrentDisplayedForm:=$_l_CurrentDisplayedForm
<>OneEntry:=$_bo_OneEntry
ERR_MethodTrackerReturn("OBJ ACC_ReconcileSelectTransactions.OEnterTransaction"; $_t_oldMethodName)
