//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_FullValidation_p
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/12/2010 09:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; <>TransactionDisableValidation; $_bo_CheckedAll; $_bo_NoCheck; $_bo_OK; $_bo_Repeating)
	C_DATE:C307($_d_StartDate)
	C_LONGINT:C283($_l_ApplicationType; $_l_CBConstantCheck; $_l_CountUsers; $_l_Days; $_l_DaysToGo; $_l_Delay; $_l_HoursToGo; $_l_Index; $_l_Max; $_l_OneDay; $_l_OneHour)
	C_LONGINT:C283($_l_Repeats; $_l_Retries; $_l_TimeFirstDay; $_l_TimePerRecord; $_l_TimetoDay; $_l_TotalProjectedTime; $_l_TotalTime; $1; ACC_l_CBConstantCheck; ACC_l_CBContinuousCheck; ACC_l_LastTransactionID)
	C_REAL:C285($_l_Index2)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_CurrentTime; $_ti_StartTime; ACC_ti_cTImeEnd; Acc_ti_cTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_FullValidation_p")
DelayIfIndexing


If (Count parameters:C259>0)
	$_l_CBConstantCheck:=$1
Else 
	$_l_CBConstantCheck:=0
End if 


Case of 
	: (Count parameters:C259=0)
		ALL RECORDS:C47([TRANSACTIONS:29])
		$_bo_Repeating:=False:C215
	: (Count parameters:C259=1)
		ACC_ReportingPrefs
		$_bo_Repeating:=($_l_CBConstantCheck=1)
		ALL RECORDS:C47([TRANSACTIONS:29])
	: (Count parameters:C259=2)
		$_bo_Repeating:=False:C215
	Else 
		$_bo_Repeating:=(ACC_l_CBContinuousCheck=1)
End case 
If (ACC_l_LastTransactionID=0)
	ACC_l_LastTransactionID:=1
End if 
If (Application type:C494<=4)
	Open window:C153(40; 40; 200; 100; -1984)
End if 
CREATE EMPTY SET:C140([TRANSACTION_BATCHES:30]; "CheckedAll")

Repeat 
	
	CREATE SET:C116([TRANSACTIONS:29]; "ALL")
	$_ti_StartTime:=Current time:C178(*)
	$_d_StartDate:=Current date:C33(*)
	$_l_OneDay:=?23:59:59?-?00:00:00?
	$_l_OneHour:=?23:59:59?-?22:59:59?
	$_l_Max:=Records in selection:C76([TRANSACTIONS:29])
	For ($_l_Index; ACC_l_LastTransactionID; $_l_Max)
		READ WRITE:C146([TRANSACTIONS:29])
		USE SET:C118("ALL")
		GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_Index)
		If (Application type:C494<=4)
			ERASE WINDOW:C160
			MESSAGE:C88("Validating Transaction "+Char:C90(13)+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([TRANSACTIONS:29])))
			$_ti_CurrentTime:=Current time:C178(*)
			$_l_Index2:=($_l_Index/10)
			
			If ($_l_Index2=Int:C8($_l_Index/10))  // only do every ten records
				
				If (Current date:C33>$_d_StartDate)
					$_l_Days:=Current date:C33(*)-$_d_StartDate
					If ($_l_Days>1)
						$_l_TimeFirstDay:=?23:59:59?-$_ti_StartTime
						$_l_Days:=$_l_Days-1
						If ($_l_Days>0)
							$_l_TimeFirstDay:=$_l_TimeFirstDay+((?23:59:59?-?00:00:00?)*$_l_Days)
						End if 
						$_l_TimetoDay:=$_ti_CurrentTime-?00:00:00?
						$_l_TotalTime:=$_l_TimeFirstDay+$_l_TotalTime
					End if 
					
				Else 
					$_l_TotalTime:=$_ti_CurrentTime-$_ti_StartTime
				End if 
				
				$_l_TimePerRecord:=$_l_TotalTime/$_l_Index
				$_l_TotalProjectedTime:=$_l_TimePerRecord*(Records in selection:C76([TRANSACTIONS:29])-$_l_Index)
				
				If ($_l_TotalProjectedTime>($_l_OneDay))
					//it will take more than one day
					$_l_DaysToGo:=0
					Repeat 
						$_l_DaysToGo:=$_l_DaysToGo+1
						$_l_TotalProjectedTime:=$_l_TotalProjectedTime-($_l_OneDay)
					Until ($_l_TotalProjectedTime<($_l_OneDay)) | (<>SYS_bo_QuitCalled)
					If ($_l_TotalProjectedTime>($_l_OneHour))
						//it will take more than one hour
						$_l_HoursToGo:=0
						Repeat 
							$_l_HoursToGo:=$_l_HoursToGo+1
							$_l_TotalProjectedTime:=$_l_TotalProjectedTime-($_l_OneHour)
						Until ($_l_TotalProjectedTime<($_l_OneHour)) | (<>SYS_bo_QuitCalled)
						
					Else 
						$_l_HoursToGo:=0
					End if 
					
					
					If ($_l_HoursToGo>0)
						MESSAGE:C88("Project completion in "+String:C10($_l_DaysToGo)+" Days "+String:C10($_l_HoursToGo)+" Hours ")
					Else 
						MESSAGE:C88("Project completion in "+String:C10($_l_DaysToGo)+" Days ")
					End if 
					
				Else 
					//less than one day
					If ($_l_TotalProjectedTime>($_l_OneHour))
						//it will take more than one hour
						$_l_HoursToGo:=0
						Repeat 
							$_l_HoursToGo:=$_l_HoursToGo+1
							$_l_TotalProjectedTime:=$_l_TotalProjectedTime-($_l_OneHour)
						Until ($_l_TotalProjectedTime<($_l_OneHour)) | (<>SYS_bo_QuitCalled)
						MESSAGE:C88("Project completion in "+String:C10($_l_HoursToGo)+" Hours")
					Else 
						//less than an hour
						MESSAGE:C88("Project completion in "+String:C10(($_ti_CurrentTime-$_ti_StartTime)/60)+" Minutes")
					End if 
					
				End if 
			End if 
			
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
		Until ($_bo_OK=True:C214) | (<>SYS_bo_QuitCalled)
		
		
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
		$_l_ApplicationType:=Application type:C494
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
						$_l_Retries:=0
						Repeat 
							$_l_Retries:=$_l_Retries+1
							DelayTicks($_l_Retries*2)
						Until (Current time:C178(*)>Acc_ti_cTimeStart) | (<>SYS_bo_QuitCalled)
					End if 
					
					
				: (Acc_ti_cTimeStart<ACC_ti_cTImeEnd)
					//i.e. start in morning end in evening
					If (Current time:C178(*)<Acc_ti_cTimeStart) | (Current time:C178(*)>ACC_ti_cTImeEnd)
						$_l_Retries:=0
						Repeat 
							$_l_Retries:=$_l_Retries+1
							DelayTicks($_l_Retries*2)
						Until (Current time:C178(*)>Acc_ti_cTimeStart) | (<>SYS_bo_QuitCalled)
					End if 
					
			End case 
		End if 
		If (<>SYS_bo_QuitCalled)
			$_l_Index:=$_l_Max
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
		If (Not:C34($_bo_Repeating))
			//NG March 2004 this will ensure that the check box now turns its self off
			// it should not be turned off before this because if the server is restarted it should carry on
			If (Application type:C494#4D Remote mode:K5:5)  // if this is a client this is a non-iterative pass anyway
				ACC_l_CBConstantCheck:=0
			End if 
			
		End if 
		
		ACC_UpdateReportingPrefs
		ACC_ReportingPrefs
		If ($_bo_Repeating)
			$_bo_Repeating:=(ACC_l_CBConstantCheck=1)
		End if 
		ALL RECORDS:C47([TRANSACTIONS:29])
	End if 
	
Until (($_bo_Repeating=False:C215) | (Process aborted:C672) | (<>SYS_bo_QuitCalled))

UnloadAllRecords  //bsw 11/12/03
ERR_MethodTrackerReturn("ACC_FullValidation_p"; $_t_oldMethodName)
