//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_SendLogFile
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
	C_BOOLEAN:C305(<>MIR_bo_Quit)
	C_LONGINT:C283($_L_Error; $0; MIR_l_SOAP_LErrorNumber; MIR_l_SOAP_LResult)
	C_TEXT:C284(<>MIR_t_BackupScheduleMode; <>MIR_t_DatabaseName; <>MiR_t_LastLogNumber; <>MIR_t_NextBackupIntervalMode; <>MIR_t_ScheduleMode; <>MIR_t_ServerIPAddress; $_t_IntegrateType; $_t_LastLogFile; $_t_oldMethodName; $_t_TimeStamp; MIR_t_SOAP_tErrorMessage)
	C_TIME:C306(<>MIR_ti_BackupTime; <>MIR_ti_TimeInterval; <>MIR_ti_TransactionDelay; $_ti_AbortTime; $_ti_CurrentTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_SendLogFile")


// Declare parameters

// Declare local variables

MIR_l_SOAP_LErrorNumber:=0
MIR_t_SOAP_tErrorMessage:=""
$_t_LastLogFile:=""
$_L_Error:=0
MIR_l_SOAP_LResult:=0

If (Not:C34(<>MIR_bo_Quit))
	$_ti_CurrentTime:=Current time:C178
	Case of 
		: ((MIR_SoapCallEvents(<>MIR_t_DatabaseName; "VerifyPresent"; <>MIR_t_ServerIPAddress)#0) & (MIR_l_SOAP_LResult#1))  // Correct database is not available
			// Also, MirrorSOAP_LResult  contains 1if sucessful connection
			$_L_Error:=-17050
			MIR_t_SOAP_tErrorMessage:="Mirror database is not available. Mirroring at "+String:C10(Current time:C178; HH MM:K7:2)+" on "+String:C10(Current date:C33; System date short:K1:1)+" did not take place."
			
		Else 
			$_ti_AbortTime:=Current time:C178+<>MIR_ti_TransactionDelay
			//Get the error handling
			ON ERR CALL:C155("MIR_OnErrHandler")
			While (Semaphore:C143("MirroringInProgress"))  // This semphore is to hold processes from starting transactions while the new log file is being created
				DelayTicks  // Technicaly this line of code should never happen since all other code should only do  a test semaphore, but it is a safe way to write the code
			End while 
			Repeat 
				If (MIR_l_SOAP_LErrorNumber#0)
					DelayTicks(15)  // If the New log file below was not created wait before trying again.
				End if 
				MIR_l_SOAP_LErrorNumber:=0
				$_t_LastLogFile:=New log file:C926  // Get the full path name of the log file that has just been closed
			Until ((MIR_l_SOAP_LErrorNumber=0) | (Current time:C178>$_ti_AbortTime))
			CLEAR SEMAPHORE:C144("MirroringInProgress")  // Let any Process_Waiting for the semaphore to clear continue once the file is created we don't need to lock eveyone out to send the file to the mirror machines
			ON ERR CALL:C155("")
	End case 
	
	Case of 
		: (MIR_l_SOAP_LErrorNumber=1409) | (MIR_l_SOAP_LErrorNumber=1411)  // Transaction or other critical operation in progress
			$_L_Error:=MIR_l_SOAP_LErrorNumber
			MIR_SOAP_ErrorHandling($_L_Error)
			
		: (Length:C16($_t_LastLogFile)>0)
			Case of 
				: (<>MIR_t_BackupScheduleMode="Use Mirror Machine Scheduler")
					$_t_IntegrateType:="IntegrateLog"
					
				: (<>MIR_t_BackupScheduleMode="via Main Server Time")
					Case of 
						: (<>MIR_t_ScheduleMode="Time Only")
							$_t_IntegrateType:="IntegrateLog&Backup"
						: (<>MIR_t_ScheduleMode="Time & Interval") | (<>MIR_t_ScheduleMode="Interval Only")
							Case of 
								: (String:C10($_ti_CurrentTime; HH MM:K7:2)=String:C10(<>MIR_ti_BackupTime; HH MM:K7:2))
									$_t_IntegrateType:="IntegrateLog&Backup"
								: (($_ti_CurrentTime+<>MIR_ti_TimeInterval)<<>MIR_ti_BackupTime)  // Still time for another backup
									$_t_IntegrateType:="IntegrateLog"
								: ((<>MIR_ti_BackupTime+<>MIR_ti_TimeInterval)<$_ti_CurrentTime)  // Backup already occurred for this date
									$_t_IntegrateType:="IntegrateLog"
								: (($_ti_CurrentTime><>MIR_ti_BackupTime) & ((<>MIR_ti_BackupTime+<>MIR_ti_TimeInterval)<$_ti_CurrentTime))  // This is the time for the backup
									$_t_IntegrateType:="IntegrateLog&Backup"
								Else 
									$_t_IntegrateType:="IntegrateLog"
							End case 
							
					End case 
					
					
				: (<>MIR_t_BackupScheduleMode="via Main Server Interval") | (<>MIR_t_BackupScheduleMode="via Main Server Time & Interval")
					// Find the next scheduled backup time from the last time it actually took place
					$_t_TimeStamp:=MIR_GetDateTimeStamp(Current date:C33; $_ti_CurrentTime)
					If ($_t_TimeStamp><>MIR_t_NextBackupIntervalMode)
						MIR_MirrorPreferences("SetNextBackupInterval")
						$_t_IntegrateType:="IntegrateLog&Backup"
					Else 
						$_t_IntegrateType:="IntegrateLog"
					End if 
					
			End case 
			
			<>MiR_t_LastLogNumber:=$_t_LastLogFile
			MIR_MirrorPreferences("Save")
			
			$_L_Error:=MIR_SOAP_HandleLogEvents(<>MIR_t_DatabaseName; $_t_IntegrateType; <>MIR_t_ServerIPAddress; $_t_LastLogFile)  // Send the log file to the server
			
	End case 
	
End if 

$0:=$_L_Error
//End of method
ERR_MethodTrackerReturn("MIR_SendLogFile"; $_t_oldMethodName)
