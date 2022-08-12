//%attributes = {}
If (False:C215)
	//Project Method Name:      StartTransaction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_AuditLogging; $_bo_OK)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; STK_l_TransactionID; TransactionID; TransactionLevel)
	C_TEXT:C284($_t_oldMethodName; $_t_processName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StartTransaction")
// StartTransaction
// added 13/5/02 pb
// starts a new transaction only if not already in one
DelayIfIndexing
$_bo_OK:=Semaphore:C143("NoINDEXING")  //so indexing wont start automatically during a transaction
//(Cleared in end transaction)

//



If (<>SYS_bo_AuditLogging)
	PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime)
	
	//If (Not(In transaction))
	STK_l_TransactionID:=AA_GetNextIDinMethod(->STK_l_TransactionID)
	UNLOAD RECORD:C212([IDENTIFIERS:16])
	
	START TRANSACTION:C239
	
Else 
	//TransactionLevel:=TransactionLevel+1`25/0702 pb/bsw donot need it at the moment
	
	STK_l_TransactionID:=AA_GetNextIDinMethod(->STK_l_TransactionID)
	UNLOAD RECORD:C212([IDENTIFIERS:16])
	
	
	START TRANSACTION:C239
	
End if 
ERR_MethodTrackerReturn("StartTransaction"; $_t_oldMethodName)