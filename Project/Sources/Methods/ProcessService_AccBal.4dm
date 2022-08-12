//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_AccBal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   28/12/2010 16:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>noBalanceCheck; <>SYS_bo_QuitCalled; $0)
	C_REAL:C285($_r_Balance)
	C_TEXT:C284($_t_oldMethodName; $_t_SemaphoreID)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_AccBal")
Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Check Balance")
		ACC_ReportingPrefs
		
		<>noBalanceCheck:=True:C214
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]x_ID:7=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		//While (Locked(->[ACC BALANCES])
		
		$_t_SemaphoreID:=[ACCOUNT_BALANCES:34]Account_Code:2
		While ((Semaphore:C143("UPDATEBALANCE"+$_t_SemaphoreID)) & (Not:C34(<>SYS_bo_QuitCalled)))
			DelayTicks(2)
		End while 
		$_r_Balance:=ACC_CheckBalance([PROCESSES_TO_HANDLE:115]RecordNumber:7)
		<>noBalanceCheck:=False:C215
		CLEAR SEMAPHORE:C144("UPDATEBALANCE"+$_t_SemaphoreID)
		
		$0:=True:C214
	Else 
		$0:=True:C214
		
End case 
UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
UNLOAD RECORD:C212([TRANSACTIONS:29])
UNLOAD RECORD:C212([ACCOUNTS:32])
UNLOAD RECORD:C212([PERIODS:33])
UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
ERR_MethodTrackerReturn("ProcessService_AccBal"; $_t_oldMethodName)
