//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_SetTransactionBatchItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TransactionDisableValidation)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_SetTransactionBatchItem")
If (Count parameters:C259>=1)
	[TRANSACTIONS:29]BatchItem_X_ID:30:=$1
	While (Semaphore:C143("TRANSACTIONUPDATE"))
		DelayTicks
	End while 
	<>TransactionDisableValidation:=True:C214
	SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
	DB_SaveRecord(->[TRANSACTIONS:29])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
	<>TransactionDisableValidation:=False:C215
	SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
	
	CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
End if 
ERR_MethodTrackerReturn("ACC_SetTransactionBatchItem"; $_t_oldMethodName)
