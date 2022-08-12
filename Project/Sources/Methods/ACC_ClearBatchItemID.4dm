//%attributes = {}

If (False:C215)
	//Project Method Name:      ACC_ClearBatchItemID
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
	C_BOOLEAN:C305(<>TransactionDisableValidation)
	C_LONGINT:C283($_l_Retries)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_ClearBatchItemID")

//acc_clearBatchItemID
$_t_oldMethodName:=ERR_MethodTracker("ACC_ClearBatchItemID")
//acc_clearBatchItemID
$_l_Retries:=0
While (Semaphore:C143("TRANSACTIONUPDATE"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 
<>TransactionDisableValidation:=True:C214
[TRANSACTIONS:29]BatchItem_X_ID:30:=0

SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
DB_SaveRecord(->[TRANSACTIONS:29])
AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
<>TransactionDisableValidation:=False:C215
SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)

CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
ERR_MethodTrackerReturn("ACC_ClearBatchItemID"; $_t_oldMethodName)
