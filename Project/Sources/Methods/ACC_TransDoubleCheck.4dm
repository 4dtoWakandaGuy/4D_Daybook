//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_TransDoubleCheck
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
	C_LONGINT:C283($_l_Index; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_TransDoubleCheck")
QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31#$1; *)
QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Transaction_OtherSideID:32=$2)
If (Records in selection:C76([TRANSACTIONS:29])>0)
	While (Semaphore:C143("TRANSACTIONUPDATE"))
		DelayTicks
	End while 
	<>TransactionDisableValidation:=True:C214
	SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[TRANSACTIONS:29])
		APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_OtherSideID:32:=0)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
	Else 
		
		FIRST RECORD:C50([TRANSACTIONS:29])
		For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
			[TRANSACTIONS:29]Transaction_OtherSideID:32:=0
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

QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31#$2; *)
QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Transaction_OtherSideID:32=$1)
If (Records in selection:C76([TRANSACTIONS:29])>0)
	While (Semaphore:C143("TRANSACTIONUPDATE"))
		DelayTicks
	End while 
	
	<>TransactionDisableValidation:=True:C214
	SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[TRANSACTIONS:29])
		APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_OtherSideID:32:=0)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
	Else 
		
		FIRST RECORD:C50([TRANSACTIONS:29])
		For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
			[TRANSACTIONS:29]Transaction_OtherSideID:32:=0
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
ERR_MethodTrackerReturn("ACC_TransDoubleCheck"; $_t_oldMethodName)
