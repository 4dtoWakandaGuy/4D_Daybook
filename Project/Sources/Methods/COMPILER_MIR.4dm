//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45
	//Method Name: COMPILER_MIR
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("COMPILER_MIR")

C_BOOLEAN:C305(<>MIR_bo_Quit)
C_LONGINT:C283(<>MIR_l_CurrentDiskFreeSpace)
C_LONGINT:C283(<>MIR_l_MinimumDiskFreeSpace)
C_LONGINT:C283(<>MIR_l_MainProcess)
C_LONGINT:C283(<>MIR_l_TransactionRetries)
C_TEXT:C284(<>MIR_t_AuthenticationPassword)
C_TEXT:C284(<>MIR_t_AuthenticationRequired)
C_TEXT:C284(<>MIR_t_AuthenticationUserName)
C_TEXT:C284(<>MIR_t_DatabaseName)
C_TEXT:C284(<>MIR_t_ErrorEMailAccount)
C_TEXT:C284(<>MIR_t_LastLogNumber)
C_TEXT:C284(<>MIR_t_ServerIPAddress)
C_TEXT:C284(<>MIR_t_ServerType)
C_TEXT:C284(<>MIR_t_MTPServer)
C_TEXT:C284(<>MIR_t_ScheduleMode)
C_TEXT:C284(<>MIR_t_BackupScheduleMode)
C_TEXT:C284(<>MIR_t_NextBackupIntervalMode)
C_TEXT:C284(<>MIR_t_NextTimeIntervalMode)
C_TIME:C306(<>MIR_ti_Time)
C_TIME:C306(<>MIR_ti_TimeInterval)
C_TIME:C306(<>MIR_ti_BackupTime)
C_TIME:C306(<>MIR_ti_BackupTimeInterval)
C_TIME:C306(<>MIR_ti_TransactionDelay)

ARRAY BOOLEAN:C223(MIR_lb_Servers; 0)
ARRAY TEXT:C222(MIR_at_Hr; 0)
ARRAY TEXT:C222(MIR_at_Min; 0)
ARRAY TEXT:C222(MIR_at_Mode; 0)
ARRAY TEXT:C222(MIR_at_Authentication; 0)
ARRAY TEXT:C222(MIR_at_TimeHr; 0)
ARRAY TEXT:C222(MIR_at_TimeMin; 0)
ARRAY TEXT:C222(MIR_at_BackupMode; 0)
ARRAY TEXT:C222(MIR_at_BackupTimeHr; 0)
ARRAY TEXT:C222(MIR_at_BackupTimeMin; 0)
ARRAY TEXT:C222(MIR_at_BackupHr; 0)
ARRAY TEXT:C222(MIR_at_BackupMin; 0)
ARRAY TEXT:C222(MIR_at_TransactionMin; 0)
ARRAY TEXT:C222(MIR_at_TransactionSec; 0)
ARRAY TEXT:C222(MIR_at_Servers; 0)
ARRAY TEXT:C222(MIR_at_Tab; 0)

C_BLOB:C604(MIR_Bl_SOAP_oBLOB)
C_LONGINT:C283(MIR_bCancel)
C_LONGINT:C283(MIR_bOK)
C_LONGINT:C283(MIR_bAddMirror)
C_LONGINT:C283(MIR_bDeleteMirror)
C_LONGINT:C283(MIR_LProcessID)
C_LONGINT:C283(MIR_ckLaunchProcess)
C_LONGINT:C283(MIR_l_SOAP_LErrorNumber)
C_LONGINT:C283(MIR_l_SOAP_LResult)
C_LONGINT:C283(MIR_Header)
C_TEXT:C284(MIR_t_Message)
C_TEXT:C284(MIR_t_SOAP_tErrorMessage)
C_TEXT:C284(MIR_t_SOAP_tAction)
C_TEXT:C284(MIR_t_SOAP_tDatabaseName)
C_TEXT:C284(MIR_t_SOAP_tLogFile)
C_TEXT:C284(MIR_t_LastBackupTime)
C_TEXT:C284(MIR_t_ThisServerIPAddress)

If (False:C215)
	
	C_TEXT:C284(MIR_SetFolderPath; $1)
	
	C_TEXT:C284(MIR_GetFolderpathName; $0)
	C_TEXT:C284(MIR_GetFolderpathName; $1)
	
	C_TEXT:C284(MIR_MirrorPreferences; $1)
	
	C_LONGINT:C283(MIR_Proxy_SOAP_HandleLogEvents; $0)
	C_TEXT:C284(MIR_Proxy_SOAP_HandleLogEvents; $1)
	C_TEXT:C284(MIR_Proxy_SOAP_HandleLogEvents; $2)
	C_TEXT:C284(MIR_Proxy_SOAP_HandleLogEvents; $3)
	C_POINTER:C301(MIR_Proxy_SOAP_HandleLogEvents; $4)
	C_TEXT:C284(MIR_Proxy_SOAP_HandleLogEvents; $5)
	
	C_LONGINT:C283(MIR_SendLogFile; $0)
	
	C_TEXT:C284(MIR_MirrorPath; $0)
	C_TEXT:C284(MIR_MirrorPath; $1)
	
	C_TEXT:C284(MIR_GetDateTimeStamp; $0)
	C_DATE:C307(MIR_GetDateTimeStamp; $1)
	C_TIME:C306(MIR_GetDateTimeStamp; $2)
	
	
	C_LONGINT:C283(MIR_SOAP_ErrorHandling; $1)
	
	C_TEXT:C284(MIR_TEXT2ARRAY; $1)
	C_POINTER:C301(MIR_TEXT2ARRAY; $2)
	C_TEXT:C284(MIR_TEXT2ARRAY; $3)
	
	C_LONGINT:C283(MIR_SOAP_HandleLogEvents; $0)
	C_TEXT:C284(MIR_SOAP_HandleLogEvents; $1)
	C_TEXT:C284(MIR_SOAP_HandleLogEvents; $2)
	C_TEXT:C284(MIR_SOAP_HandleLogEvents; $3)
	C_TEXT:C284(MIR_SOAP_HandleLogEvents; $4)
	
	C_TEXT:C284(MIR_BackUpPreferences; $1)
	C_POINTER:C301(MIR_BackUpPreferences; $2)
	C_POINTER:C301(MIR_BackUpPreferences; $3)
	C_POINTER:C301(MIR_BackUpPreferences; $4)
	C_POINTER:C301(MIR_BackUpPreferences; $5)
	
	C_TEXT:C284(MIR_MultipleMirrorsXML; $1)
	C_TEXT:C284(MIR_MultipleMirrorsXML; $2)
	C_POINTER:C301(MIR_MultipleMirrorsXML; $3)
	
	C_BOOLEAN:C305(MIR_onWebAuthentication; $0)
	
	C_LONGINT:C283(MIR_OnServerOpenConnect; $0)
	
	C_LONGINT:C283(MIR_onBackupStartup; $0)
End if 

//End of method

ERR_MethodTrackerReturn("COMPILER_MIR"; $_t_oldMethodName)