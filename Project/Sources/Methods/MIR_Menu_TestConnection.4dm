//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_Menu_TestConnection
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
	C_LONGINT:C283(<>MIR_l_TransactionRetries; $_l_LogEvents; MIR_l_SOAP_LResult; <>MIR_l_MinimumDiskFreeSpace; <>MIR_l_TransactionRetries; $_l_LogEvents; MIR_l_ProcessID; MIR_l_SOAP_LResult)
	C_TEXT:C284(<>MIR_t_AuthenticationRequired; <>MIR_t_AuthenticationUserName; <>MIR_t_BackupScheduleMode; <>MIR_t_DatabaseName; <>MIR_t_ErrorEMailAccount; <>MIR_t_LastLogNumber; <>MIR_t_NextBackupIntervalMode; <>MIR_t_NextTimeIntervalMode; <>MIR_t_ScheduleMode; <>MIR_t_ServerIPAddress; <>MIR_t_SMTPServer)
	C_TEXT:C284($_t_oldMethodName; <>MIR_t_AuthenticationPassword; <>MIR_t_AuthenticationRequired; <>MIR_t_AuthenticationUserName; <>MIR_t_BackupScheduleMode; <>MIR_t_DatabaseName; <>MIR_t_ErrorEMailAccount; <>MIR_t_LastLogNumber; <>MIR_t_NextBackupIntervalMode; <>MIR_t_NextTimeIntervalMode; <>MIR_t_ScheduleMode)
	C_TEXT:C284(<>MIR_t_ServerIPAddress; <>MIR_t_ServerType; <>MIR_t_SMTPServer; $_t_oldMethodName)
	C_TIME:C306(<>MIR_ti_BackupTimeInterval; <>MiR_ti_Time; <>MIR_ti_TimeInterval; <>MIR_ti_TransactionDelay; <>MIR_ti_BackupTime; <>MIR_ti_BackupTimeInterval; <>MiR_ti_Time; <>MIR_ti_TimeInterval; <>MIR_ti_TransactionDelay)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_Menu_TestConnection")

If (Not:C34(Is compiled mode:C492))
	COMPILER_MIR
End if 
MIR_l_ProcessID:=-1

GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_ServerType; <>MIR_t_ServerType)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_DatabaseName; <>MIR_t_DatabaseName)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_ServerIPAddress; <>MIR_t_ServerIPAddress)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_ScheduleMode; <>MIR_t_ScheduleMode)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MiR_ti_Time; <>MIR_ti_Time)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_ti_TimeInterval; <>MIR_ti_TimeInterval)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_NextTimeIntervalMode; <>MIR_t_NextTimeIntervalMode)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_BackupScheduleMode; <>MIR_t_BackupScheduleMode)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_ti_BackupTime; <>MIR_ti_BackupTime)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_ti_BackupTimeInterval; <>MIR_ti_BackupTimeInterval)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_NextBackupIntervalMode; <>MIR_t_NextBackupIntervalMode)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_ti_TransactionDelay; <>MIR_ti_TransactionDelay)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_l_TransactionRetries; <>MiR_l_TransactionRetries)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_LastLogNumber; <>MIR_t_LastLogNumber)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_SMTPServer; <>MIR_t_SMTPServer)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_ErrorEMailAccount; <>MIR_t_ErrorEMailAccount)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_AuthenticationRequired; <>MIR_t_AuthenticationRequired)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_AuthenticationUserName; <>MIR_t_AuthenticationUserName)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_AuthenticationPassword; <>MIR_t_AuthenticationPassword)
GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_l_MinimumDiskFreeSpace; <>MIR_l_MinimumDiskFreeSpace)

$_l_LogEvents:=MIR_SOAP_HandleLogEvents(<>MIR_t_DatabaseName; "VerifyPresent"; <>MIR_t_ServerIPAddress)
Case of 
	: ($_l_LogEvents=0)
		If (MIR_l_SOAP_LResult=1)
			Gen_Alert("Connection established")
		Else 
			Gen_Alert("Connection established but mirror is not available")
		End if 
	: ($_l_LogEvents=-9949)
		Gen_Alert("It seems that the web services on the Mirror was in Demo mode and expired")
		
	Else 
		Gen_Alert("Connection failed")
End case 
ERR_MethodTrackerReturn("MIR_Menu_TestConnection"; $_t_oldMethodName)
