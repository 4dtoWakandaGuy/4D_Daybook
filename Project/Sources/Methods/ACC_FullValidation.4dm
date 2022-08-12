//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_FullValidation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/12/2010 09:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; <>TransactionDisableValidation; $_bo_CheckedAll; $_bo_NoCheck; $_bo_OK; $_bo_Repeating; ACC_bo_ReportPrefsLoaded)
	C_LONGINT:C283($_l_applicationType; $_l_CBConstantCheck; $_l_CountUsers; $_l_Delay; $_l_Index; $_l_Process; $_l_Repeats; $_l_Retries; $1; ACC_l_CBConstantCheck; ACC_l_LastTransactionID)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(ACC_ti_cTImeEnd; Acc_ti_cTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_FullValidation")
If (False:C215)
	
	DelayIfIndexing
	
	
	Case of 
		: (Count parameters:C259=0)
			ALL RECORDS:C47([TRANSACTIONS:29])
			$_bo_Repeating:=False:C215
		: (Count parameters:C259=1)
			$_bo_Repeating:=($1=1)
			If ($_bo_Repeating)
				If (Not:C34(ACC_bo_ReportPrefsLoaded))
					ACC_ReportingPrefs
				End if 
			End if 
			ALL RECORDS:C47([TRANSACTIONS:29])
		: (Count parameters:C259=2)
			$_bo_Repeating:=False:C215
			
	End case 
	If (ACC_l_LastTransactionID=0)
		ACC_l_LastTransactionID:=1
	End if 
	If (Application type:C494<=4)
		Open window:C153(40; 40; 200; 100; -1984)
	End if 
	CREATE EMPTY SET:C140([TRANSACTION_BATCHES:30]; "CheckedAll")
	
	Repeat 
		IDLE:C311
		CREATE SET:C116([TRANSACTIONS:29]; "ALL")
		For ($_l_Index; ACC_l_LastTransactionID; Records in selection:C76([TRANSACTIONS:29]))
			READ WRITE:C146([TRANSACTIONS:29])
			USE SET:C118("ALL")
			GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_Index)
			If (Application type:C494<=4)
				ERASE WINDOW:C160
				MESSAGE:C88("Validating Transaction "+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([TRANSACTIONS:29])))
			End if 
			$_bo_OK:=False:C215
			$_l_Repeats:=0
			$_l_Delay:=1
			Repeat 
				$_l_Repeats:=$_l_Repeats+1
				$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 1)
				If (Not:C34($_bo_OK))
					If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
						//only increase every 10 tries
						$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
					End if 
					DelayTicks(2*$_l_Delay)
				End if 
			Until ($_bo_OK=True:C214)
			
			
			If ([TRANSACTIONS:29]Transaction_ID:31=0)
				[TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextIDinMethod(->[TRANSACTIONS:29]Transaction_ID:31)
				$_l_Retries:=0
				While (Semaphore:C143("TRANSACTIONUPDATE"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks($_l_Retries*2)
				End while 
				<>TransactionDisableValidation:=True:C214
				SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
				DB_SaveRecord(->[TRANSACTIONS:29])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
				<>TransactionDisableValidation:=False:C215
				SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
				CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
			End if 
			QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=[TRANSACTIONS:29]Batch_Number:7)
			$_bo_NoCheck:=False:C215
			If (Records in selection:C76([TRANSACTION_BATCHES:30])=1)
				If (Is in set:C273("CheckedAll"))
					$_bo_NoCheck:=True:C214
				End if 
			End if 
			If (Not:C34($_bo_NoCheck))
				$_bo_CheckedAll:=ACC_TransValidateBatch([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTIONS:29]Batch_Number:7; True:C214)
				If ($_bo_CheckedAll)
					USE SET:C118("ALL")
					GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_Index)
					QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=[TRANSACTIONS:29]Batch_Number:7)
					ADD TO SET:C119([TRANSACTION_BATCHES:30]; "CheckedAll")
				End if 
			End if 
			$_l_applicationType:=Application type:C494
			If (Application type:C494=4D Remote mode:K5:5)
				
				$_l_CountUsers:=Count users:C342-1
			Else 
				$_l_CountUsers:=Count users:C342
			End if 
			If ($_l_CountUsers>1) & ((Count parameters:C259=0) | ($_bo_Repeating))
				DelayTicks(60*(2*(Count users:C342-1)))
			End if 
			ACC_l_LastTransactionID:=ACC_l_LastTransactionID+1
			
			If ($_bo_Repeating)
				//if we are in a repeating loop
				//we check if we are still in the window for checking the transactions
				//if we are not then we stop
				ACC_UpdateReportingPrefs
				
				Case of 
					: (ACC_l_CBConstantCheck=0)
						$_l_Index:=Records in table:C83([TRANSACTIONS:29])
					: (Acc_ti_cTimeStart>ACC_ti_cTImeEnd)
						//i.e. start in 'evening' end in morning
						If (Current time:C178(*)<Acc_ti_cTimeStart) & (Current time:C178(*)>ACC_ti_cTImeEnd)
							
							Repeat 
								DelayTicks(60*10)
							Until (Current time:C178(*)>Acc_ti_cTimeStart) | (<>SYS_bo_QuitCalled)
						End if 
						
						
					: (Acc_ti_cTimeStart<ACC_ti_cTImeEnd)
						//i.e. start in morning end in evening
						If (Current time:C178(*)<Acc_ti_cTimeStart) | (Current time:C178(*)>ACC_ti_cTImeEnd)
							Repeat 
								DelayTicks(60*10)
							Until (Current time:C178(*)>Acc_ti_cTimeStart) | (<>SYS_bo_QuitCalled)
						End if 
						
				End case 
			End if 
			
		End for 
		If (Application type:C494<=4)
			CLOSE WINDOW:C154
		End if 
		
		If (<>SYS_bo_QuitCalled)
			//update the preference so we start where we left off
			ACC_UpdateReportingPrefs
			$_l_Index:=Records in selection:C76([TRANSACTIONS:29])
			$_bo_Repeating:=False:C215
		End if 
		
		If (Not:C34(<>SYS_bo_QuitCalled))
			ACC_l_LastTransactionID:=1
			ACC_UpdateReportingPrefs
			ACC_ReportingPrefs
			If ($_bo_Repeating)
				$_bo_Repeating:=(ACC_l_CBConstantCheck=1)
			End if 
			ALL RECORDS:C47([TRANSACTIONS:29])
		End if 
		
	Until (($_bo_Repeating=False:C215) | (Process aborted:C672) | (<>SYS_bo_QuitCalled))
	
Else 
	
	If (Count parameters:C259>0)
		$_l_CBConstantCheck:=$1
		$_l_Process:=Execute on server:C373("ACC_FullValidation_p"; 256000; "Validating Transactions"; $_l_CBConstantCheck; *)
	Else 
		//NG March 2004
		//when called in this way it is to run a local one time hit
		
		$_l_Process:=New process:C317("ACC_FullValidation_p"; 256000; "Validating Transactions"; *)
	End if 
	
End if 
ERR_MethodTrackerReturn("ACC_FullValidation"; $_t_oldMethodName)
