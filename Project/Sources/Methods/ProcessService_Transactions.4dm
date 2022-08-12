//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_Transactions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_Batches;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; <>TransactionDisableValidation; $_bo_BatchChecked; $_bo_Boolean4; $_bo_Exists; $_bo_Noautoupdate; $_bo_OK; $_bo_Valid; $0)
	C_DATE:C307($_d_Date; ACC_D_EDate)
	C_LONGINT:C283($_l_BatchNo; $_l_BatchRow; $_l_Delay; $_l_DelayExpand; $_l_Long1; $_l_Long2; $_l_Long3; $_l_offset; $_l_ProcessTohandleRecordNumber; $_l_RecordNumber; $_l_Repeats)
	C_LONGINT:C283($_l_TableNumber)
	C_REAL:C285($_r_Amount; $_r_Balance; $_r_TaxAmount)
	C_TEXT:C284(<>ACC_T_BatchTimeReport; $_l_Type; $_t_AccountIdent; $_t_oldMethodName; ACC_t_AccountCode; ACC_t_AnalysisCode; ACC_t_CurrencyCode; ACC_t_LayerCode; ACC_t_PeriodCode)
	C_TIME:C306($_ti_Time; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_Transactions")
$0:=False:C215
REDUCE SELECTION:C351([PERIODS:33]; 0)
READ ONLY:C145([PERIODS:33])
Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Validate Transaction")
		$_l_DelayExpand:=1
		While (Semaphore:C143("TRANSACTIONUPDATE"))
			DelayTicks($_l_DelayExpand)
			$_l_DelayExpand:=$_l_DelayExpand*2
			If ($_l_DelayExpand>1000)
				$_l_DelayExpand:=1
			End if 
			IDLE:C311
		End while 
		<>TransactionDisableValidation:=True:C214
		SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
		//$T:=Milliseconds
		ACC_ReportingPrefs
		//$T:=(Milliseconds-$T)/1000
		$_l_RecordNumber:=Record number:C243([PROCESSES_TO_HANDLE:115])
		$_l_TableNumber:=[PROCESSES_TO_HANDLE:115]TableNumber:1
		
		$_d_Date:=[PROCESSES_TO_HANDLE:115]DateCreated:4
		$_l_Type:=[PROCESSES_TO_HANDLE:115]ServiceType:6
		$_l_ProcessTohandleRecordNumber:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
		$_l_Long1:=[PROCESSES_TO_HANDLE:115]Data1Longint:8
		$_l_Long2:=[PROCESSES_TO_HANDLE:115]Data2Longint:9
		$_l_Long3:=[PROCESSES_TO_HANDLE:115]Data3Longint:10
		$_bo_Boolean4:=[PROCESSES_TO_HANDLE:115]Data4Boolean:11
		
		If (Count parameters:C259>=1)
			$_ti_Time:=$1
		Else 
			$_ti_Time:=Current time:C178(*)
		End if 
		
		If (Undefined:C82(ACC_al_Batches)) | (Size of array:C274(ACC_al_Batches)>10000)
			ARRAY LONGINT:C221(ACC_al_Batches; 0)
		End if 
		$_bo_BatchChecked:=False:C215
		//$T:=Milliseconds
		$_bo_BatchChecked:=ACC_TransValidateBatch([PROCESSES_TO_HANDLE:115]RecordNumber:7; [PROCESSES_TO_HANDLE:115]Data1Longint:8; True:C214; True:C214; ->ACC_al_Batches)
		
		If ($_bo_BatchChecked)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
			$_l_BatchNo:=[TRANSACTIONS:29]Batch_Number:7
			$_l_BatchRow:=Find in array:C230(ACC_al_Batches; $_l_BatchNo)
			If ($_l_BatchRow<0)
				INSERT IN ARRAY:C227(ACC_al_Batches; Size of array:C274(ACC_al_Batches)+1; 1)
				ACC_al_Batches{Size of array:C274(ACC_al_Batches)}:=$_l_BatchNo
			End if 
			UNLOAD RECORD:C212([TRANSACTIONS:29])
		End if 
		
		GOTO RECORD:C242([PROCESSES_TO_HANDLE:115]; $_l_RecordNumber)
		<>TransactionDisableValidation:=False:C215
		SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
		
		CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
		$0:=True:C214
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Update account")
		$_l_RecordNumber:=Record number:C243([PROCESSES_TO_HANDLE:115])
		$_l_TableNumber:=[PROCESSES_TO_HANDLE:115]TableNumber:1
		
		$_d_Date:=[PROCESSES_TO_HANDLE:115]DateCreated:4
		$_l_Type:=[PROCESSES_TO_HANDLE:115]ServiceType:6
		$_l_ProcessTohandleRecordNumber:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
		$_l_Long1:=[PROCESSES_TO_HANDLE:115]Data1Longint:8
		$_l_Long2:=[PROCESSES_TO_HANDLE:115]Data2Longint:9
		$_l_Long3:=[PROCESSES_TO_HANDLE:115]Data3Longint:10
		$_bo_Boolean4:=[PROCESSES_TO_HANDLE:115]Data4Boolean:11
		
		If (Count parameters:C259>=1)
			$_ti_Time:=$1
		Else 
			$_ti_Time:=Current time:C178(*)
		End if 
		
		
		ACC_ReportingPrefs
		$_t_AccountIdent:=BLOB to text:C555([PROCESSES_TO_HANDLE:115]Data5Blob:12; 3; $_l_offset)
		
		ACC_ReverseUnique($_t_AccountIdent; ->ACC_t_AccountCode; ->ACC_t_AnalysisCode; ->ACC_t_PeriodCode; ->ACC_t_LayerCode; ->ACC_t_CurrencyCode)
		
		While (Semaphore:C143("UPDATEBALANCE"+ACC_t_AccountCode))
			DelayTicks(2)
		End while 
		
		READ WRITE:C146([ACCOUNT_BALANCES:34])
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8=$_t_AccountIdent)
		$_bo_Exists:=True:C214
		If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
			$_bo_Exists:=False:C215
			If ([PROCESSES_TO_HANDLE:115]Data1Longint:8>=0)
				//not trying to remove a value so create the record as long is it aint duff
				
				CREATE RECORD:C68([ACCOUNT_BALANCES:34])
				ACC_ReverseUnique($_t_AccountIdent; ->[ACCOUNT_BALANCES:34]Account_Code:2; ->[ACCOUNT_BALANCES:34]Analysis_Code:1; ->[ACCOUNT_BALANCES:34]Period_Code:4; ->[ACCOUNT_BALANCES:34]Layer_Code:5; ->[ACCOUNT_BALANCES:34]Currency_Code:6)
				
				If ([ACCOUNT_BALANCES:34]Account_Code:2#"") & ([ACCOUNT_BALANCES:34]Period_Code:4#"")
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=[ACCOUNT_BALANCES:34]Account_Code:2)
					$_bo_Valid:=(Records in selection:C76([ACCOUNTS:32])>0)
					If ([ACCOUNT_BALANCES:34]Analysis_Code:1#"")
						QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=[ACCOUNT_BALANCES:34]Analysis_Code:1)
						$_bo_Valid:=$_bo_Valid & (Records in selection:C76([ANALYSES:36])>0)
					End if 
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[ACCOUNT_BALANCES:34]Period_Code:4)
					$_bo_Valid:=$_bo_Valid & (Records in selection:C76([PERIODS:33])>0)
					If ([ACCOUNT_BALANCES:34]Layer_Code:5#"")
						QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=[ACCOUNT_BALANCES:34]Layer_Code:5)
						$_bo_Valid:=$_bo_Valid & (Records in selection:C76([LAYERS:76])>0)
					End if 
					If ([ACCOUNT_BALANCES:34]Currency_Code:6#"")
						QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=[ACCOUNT_BALANCES:34]Currency_Code:6)
						$_bo_Valid:=$_bo_Valid & (Records in selection:C76([CURRENCIES:71])>0)
					End if 
					$_l_RecordNumber:=Record number:C243([PROCESSES_TO_HANDLE:115])
					If ($_bo_Valid)
						DB_SaveRecord(->[ACCOUNT_BALANCES:34])
						AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
					End if 
				End if 
				UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
				READ ONLY:C145([ACCOUNT_BALANCES:34])
				
				GOTO RECORD:C242([PROCESSES_TO_HANDLE:115]; $_l_RecordNumber)
				//now update the balance
				$_bo_Exists:=True:C214
			End if 
		Else 
			//Load record
			$_l_Repeats:=0
			$_l_Delay:=1
			Repeat 
				$_l_Repeats:=$_l_Repeats+1
				
				$_bo_OK:=Check_Locked(->[ACCOUNT_BALANCES:34]; 1)
				If (Not:C34($_bo_OK))
					CLEAR SEMAPHORE:C144("UPDATEBALANCE"+ACC_t_AccountCode)
					If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
						//only increase every 10 tries
						$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
					End if 
					DelayTicks(10*$_l_Delay)
					
				End if 
				
				
			Until ($_bo_OK) | (<>SYS_bo_QuitCalled)
			While (Semaphore:C143("UPDATEBALANCE"+ACC_t_AccountCode))
				DelayTicks(2)
			End while 
			
			
		End if 
		If ($_bo_Exists)
			READ ONLY:C145([TRANSACTIONS:29])
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
			
			$_bo_Noautoupdate:=False:C215
			If (ACC_D_EDate#!00-00-00!)
				If ([TRANSACTIONS:29]Trans_Date:5<ACC_D_EDate)
					//this will be the start date of the period
					$_bo_Noautoupdate:=True:C214
				End if 
			End if 
			//add /Subtract the amount(s) on to it
			$_r_Amount:=[TRANSACTIONS:29]Amount:6
			$_r_TaxAmount:=[TRANSACTIONS:29]Tax_Amount:16
			If (Not:C34($_bo_Noautoupdate))
				Case of 
					: ([PROCESSES_TO_HANDLE:115]Data1Longint:8=-1)
						//transaction was modified, it was taken off this account
						Case of 
							: ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerVatInputACC) | (DB_GetLedgerCashvatACC#"")
								[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3-[TRANSACTIONS:29]Tax_Amount:16); 2)
							Else 
								If ((DB_GetLedgerCashvatACC#"") & ([TRANSACTIONS:29]IO:18="@C"))
									[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3-[TRANSACTIONS:29]Total:17); 2)
								Else 
									[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3-[TRANSACTIONS:29]Amount:6); 2)
								End if 
								
						End case 
						
					: ([PROCESSES_TO_HANDLE:115]Data1Longint:8=1)
						//transaction was modified add it to this account
						Case of 
							: ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerVatInputACC) | (DB_GetLedgerCashvatACC#"")
								[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3+[TRANSACTIONS:29]Tax_Amount:16); 2)
							Else 
								If ((DB_GetLedgerCashvatACC#"") & ([TRANSACTIONS:29]IO:18="@C"))
									[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3+[TRANSACTIONS:29]Total:17); 2)
								Else 
									[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3+[TRANSACTIONS:29]Amount:6); 2)
								End if 
								
						End case 
						
						
					: ([PROCESSES_TO_HANDLE:115]Data1Longint:8=2)
						//just call to check the account balance
						$_l_RecordNumber:=Record number:C243([PROCESSES_TO_HANDLE:115])
						$_r_Balance:=ACC_CheckBalance([ACCOUNT_BALANCES:34]x_ID:7)
						GOTO RECORD:C242([PROCESSES_TO_HANDLE:115]; $_l_RecordNumber)
				End case 
			Else 
				//warn only?
				$_l_RecordNumber:=Record number:C243([PROCESSES_TO_HANDLE:115])
				$_r_Balance:=ACC_CheckBalance([ACCOUNT_BALANCES:34]x_ID:7)
				GOTO RECORD:C242([PROCESSES_TO_HANDLE:115]; $_l_RecordNumber)
			End if 
			
			UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
			CLEAR SEMAPHORE:C144("UPDATEBALANCE"+ACC_t_AccountCode)
			READ ONLY:C145([ACCOUNT_BALANCES:34])
			UNLOAD RECORD:C212([TRANSACTIONS:29])
			UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
			
			$0:=True:C214
			
		End if 
		CLEAR SEMAPHORE:C144("UPDATEBALANCE"+ACC_t_AccountCode)
End case 
UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
UNLOAD RECORD:C212([TRANSACTIONS:29])
UNLOAD RECORD:C212([ACCOUNTS:32])
UNLOAD RECORD:C212([PERIODS:33])
UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
ERR_MethodTrackerReturn("ProcessService_Transactions"; $_t_oldMethodName)
