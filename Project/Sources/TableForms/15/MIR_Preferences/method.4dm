If (False:C215)
	//Table Form Method Name: [USER]MIR_Preferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(MIR_bOK)
	//C_UNKNOWN(MIR_ckLaunchProcess)
	//ARRAY TEXT(MIR_at_Authentication;0)
	//ARRAY TEXT(MIR_at_BackupHr;0)
	//ARRAY TEXT(MIR_at_BackupMin;0)
	//ARRAY TEXT(MIR_at_BackupTimeHr;0)
	//ARRAY TEXT(MIR_at_BackupTimeMin;0)
	//ARRAY TEXT(Mir_at_Hr;0)
	//ARRAY TEXT(MIR_at_Min;0)
	//ARRAY TEXT(MIR_at_TimeHr;0)
	//ARRAY TEXT(MIR_at_TimeMin;0)
	//ARRAY TEXT(MIR_at_TransactionMin;0)
	//ARRAY TEXT(MIR_at_TransactionSec;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>MIR_l_TransactionRetries; $_l_ApplicationType; $_l_FormEvent; $_l_ProcessID; MIR_bOK; MIR_ckLaunchProcess; <>MIR_l_MinimumDiskFreeSpace; <>MIR_l_TransactionRetries; $_l_ApplicationType; $_l_FormEvent; $_l_ProcessID)
	C_LONGINT:C283(MIR_l_ProcessID)
	C_TEXT:C284(<>MIR_t_AuthenticationRequired; <>MIR_t_AuthenticationUserName; <>MIR_t_BackupScheduleMode; <>MIR_t_DatabaseName; <>MIR_t_ErrorEMailAccount; <>MIR_t_LastLogNumber; <>MIR_t_NextBackupIntervalMode; <>MIR_t_NextTimeIntervalMode; <>MIR_t_ScheduleMode; <>MIR_t_ServerIPAddress; <>MIR_t_SMTPServer)
	C_TEXT:C284($_t_oldMethodName; $_t_SettingsFullPath; $_t_TimeIncrement; MIR_t_Message; <>MIR_t_AuthenticationPassword; <>MIR_t_AuthenticationRequired; <>MIR_t_AuthenticationUserName; <>MIR_t_BackupScheduleMode; <>MIR_t_DatabaseName; <>MIR_t_ErrorEMailAccount; <>MIR_t_LastLogNumber)
	C_TEXT:C284(<>MIR_t_NextBackupIntervalMode; <>MIR_t_NextTimeIntervalMode; <>MIR_t_ScheduleMode; <>MIR_t_ServerIPAddress; <>MIR_t_ServerType; <>MIR_t_SMTPServer; $_t_oldMethodName; $_t_SettingsFullPath; $_t_TimeIncrement; MIR_t_Message)
	C_TIME:C306(<>MIR_ti_BackupTimeInterval; <>MIR_ti_Time; <>MIR_ti_TimeInterval; <>MIR_ti_TransactionDelay; <>MIR_ti_BackupTime; <>MIR_ti_BackupTimeInterval; <>MIR_ti_Time; <>MIR_ti_TimeInterval; <>MIR_ti_TransactionDelay)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].MIR_Preferences"; Form event code:C388)



// Declare local variables

// Declare default
$_t_SettingsFullPath:=MIR_MirrorPath("Mirror")

$_l_FormEvent:=Form event code:C388
$_l_ApplicationType:=Application type:C494


Case of 
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(MIR_at_Authentication; 2)
		MIR_at_Authentication{1}:="No"
		MIR_at_Authentication{2}:="Yes"
		
		Case of 
			: ($_l_ApplicationType=4D Remote mode:K5:5)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_ServerType; <>MIR_t_ServerType)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_DatabaseName; <>MIR_t_DatabaseName)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_ServerIPAddress; <>MIR_t_ServerIPAddress)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_ScheduleMode; <>MIR_t_ScheduleMode)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_ti_Time; <>MIR_ti_Time)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_ti_TimeInterval; <>MIR_ti_TimeInterval)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_NextTimeIntervalMode; <>MIR_t_NextTimeIntervalMode)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_BackupScheduleMode; <>MIR_t_BackupScheduleMode)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_ti_BackupTime; <>MIR_ti_BackupTime)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_ti_BackupTimeInterval; <>MIR_ti_BackupTimeInterval)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_NextBackupIntervalMode; <>MIR_t_NextBackupIntervalMode)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_ti_TransactionDelay; <>MIR_ti_TransactionDelay)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_l_TransactionRetries; <>MIR_l_TransactionRetries)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_LastLogNumber; <>MIR_t_LastLogNumber)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_SMTPServer; <>MIR_t_SMTPServer)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_ErrorEMailAccount; <>MIR_t_ErrorEMailAccount)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_AuthenticationRequired; <>MIR_t_AuthenticationRequired)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_AuthenticationUserName; <>MIR_t_AuthenticationUserName)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_t_AuthenticationPassword; <>MIR_t_AuthenticationPassword)
				GET PROCESS VARIABLE:C371(MIR_l_ProcessID; <>MIR_l_MinimumDiskFreeSpace; <>MIR_l_MinimumDiskFreeSpace)
				
			: ($_l_ApplicationType=4D Local mode:K5:1)
				MIR_MirrorPreferences("Load")
				
			Else 
				CANCEL:C270
		End case 
		
		MIR_at_Authentication:=Find in array:C230(MIR_at_Authentication; <>MIR_t_AuthenticationRequired)
		If (MIR_at_Authentication=2)  // authentication required
			OBJECT SET ENTERABLE:C238(<>MIR_t_AuthenticationUserName; True:C214)
			OBJECT SET ENTERABLE:C238(<>MIR_t_AuthenticationPassword; True:C214)
		Else 
			OBJECT SET ENTERABLE:C238(<>MIR_t_AuthenticationUserName; False:C215)
			OBJECT SET ENTERABLE:C238(<>MIR_t_AuthenticationPassword; False:C215)
		End if 
		
		$_t_TimeIncrement:=Substring:C12(String:C10(<>MIR_ti_Time; HH MM:K7:2); 1; 2)
		MIR_at_TimeHr:=Find in array:C230(MIR_at_TimeHr; $_t_TimeIncrement)
		$_t_TimeIncrement:=Substring:C12(String:C10(<>MIR_ti_Time; HH MM:K7:2); 4; 2)
		MIR_at_TimeMin:=Find in array:C230(MIR_at_TimeMin; $_t_TimeIncrement)
		$_t_TimeIncrement:=Substring:C12(String:C10(<>MIR_ti_TimeInterval; HH MM:K7:2); 1; 2)
		Mir_at_Hr:=Find in array:C230(MIR_at_Hr; $_t_TimeIncrement)
		$_t_TimeIncrement:=Substring:C12(String:C10(<>MIR_ti_TimeInterval; HH MM:K7:2); 4; 2)
		MIR_at_Min:=Find in array:C230(MIR_at_Min; $_t_TimeIncrement)
		MIR_at_Mode:=Find in array:C230(MIR_at_Mode; <>MIR_t_ScheduleMode)
		
		$_t_TimeIncrement:=Substring:C12(String:C10(<>MIR_ti_BackupTime; HH MM:K7:2); 1; 2)
		MIR_at_BackupTimeHr:=Find in array:C230(MIR_at_BackupTimeHr; $_t_TimeIncrement)
		$_t_TimeIncrement:=Substring:C12(String:C10(<>MIR_ti_BackupTime; HH MM:K7:2); 4; 2)
		MIR_at_BackupTimeMin:=Find in array:C230(MIR_at_BackupTimeMin; $_t_TimeIncrement)
		$_t_TimeIncrement:=Substring:C12(String:C10(<>MIR_ti_BackupTimeInterval; HH MM:K7:2); 1; 2)
		MIR_at_BackupHr:=Find in array:C230(MIR_at_BackupHr; $_t_TimeIncrement)
		$_t_TimeIncrement:=Substring:C12(String:C10(<>MIR_ti_BackupTimeInterval; HH MM:K7:2); 4; 2)
		MIR_at_BackupMin:=Find in array:C230(MIR_at_BackupMin; $_t_TimeIncrement)
		MIR_at_BackupMode:=Find in array:C230(MIR_at_BackupMode; <>MIR_t_BackupScheduleMode)
		
		$_t_TimeIncrement:=Substring:C12(String:C10(<>MIR_ti_TransactionDelay; HH MM:K7:2); 4; 2)
		MIR_at_TransactionMin:=Find in array:C230(MIR_at_TransactionMin; $_t_TimeIncrement)
		$_t_TimeIncrement:=Substring:C12(String:C10(<>MIR_ti_TransactionDelay; HH MM SS:K7:1); 7; 2)
		MIR_at_TransactionSec:=Find in array:C230(MIR_at_TransactionSec; $_t_TimeIncrement)
		
		MIR_TEXT2ARRAY(<>MIR_t_ServerIPAddress; ->MIR_at_Servers; ",")
		MIR_MirrorPreferences("SetModePopup")
		MIR_MirrorPreferences("SetBackupModePopup")
		
		
		MIR_ckLaunchProcess:=0
		OBJECT SET VISIBLE:C603(MIR_ckLaunchProcess; False:C215)
		OBJECT SET VISIBLE:C603(*; "oMirrorStatus"; True:C214)
		Case of 
			: (Application type:C494#4D Remote mode:K5:5)
				MIR_t_Message:="Mirroring Can Not Run in Single User"
				
			: (<>MIR_t_ServerType="Mirror")
				MIR_t_Message:="This server is acting as the Mirrored Server"
				
			: (MIR_l_ProcessID=-1)  // There is no Mirroring process running on the Server
				OBJECT SET VISIBLE:C603(MIR_ckLaunchProcess; True:C214)
				OBJECT SET VISIBLE:C603(*; "oMirrorStatus"; False:C215)
				MIR_t_Message:=""
			Else 
				MIR_t_Message:="Mirroring Process is Running on the Server"
		End case 
		
		
	: ($_l_FormEvent=On Unload:K2:2)
		ARRAY TEXT:C222(MIR_at_Authentication; 0)
		
		If (MIR_bOK=1)
			MIR_MirrorPreferences("SetNextTimeInterval")
			MIR_MirrorPreferences("SetNextBackupInterval")
			
			Case of 
				: ($_l_ApplicationType=4D Remote mode:K5:5)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_t_DatabaseName; <>MIR_t_DatabaseName)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_t_ServerIPAddress; <>MIR_t_ServerIPAddress)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_t_ScheduleMode; <>MIR_t_ScheduleMode)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_ti_Time; <>MIR_ti_Time)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_ti_TimeInterval; <>MIR_ti_TimeInterval)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_t_NextTimeIntervalMode; <>MIR_t_NextTimeIntervalMode)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_t_BackupScheduleMode; <>MIR_t_BackupScheduleMode)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_ti_BackupTime; <>MIR_ti_BackupTime)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_ti_BackupTimeInterval; <>MIR_ti_BackupTimeInterval)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_t_NextBackupIntervalMode; <>MIR_t_NextBackupIntervalMode)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_ti_TransactionDelay; <>MIR_ti_TransactionDelay)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_l_TransactionRetries; <>MIR_l_TransactionRetries)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_t_SMTPServer; <>MIR_t_SMTPServer)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_t_ErrorEMailAccount; <>MIR_t_ErrorEMailAccount)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_t_AuthenticationRequired; <>MIR_t_AuthenticationRequired)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_t_AuthenticationUserName; <>MIR_t_AuthenticationUserName)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_t_AuthenticationPassword; <>MIR_t_AuthenticationPassword)
					SET PROCESS VARIABLE:C370(MIR_l_ProcessID; <>MIR_l_MinimumDiskFreeSpace; <>MIR_l_MinimumDiskFreeSpace)
					If (MIR_ckLaunchProcess=1)
						$_l_ProcessID:=Execute on server:C373("MIR_MirrorPreferences"; 256000; "$UpdateMirrorPreferences"; "Save&LaunchFromClient")
					Else 
						$_l_ProcessID:=Execute on server:C373("MIR_MirrorPreferences"; 256000; "$UpdateMirrorPreferences"; "SaveFromClient")
					End if 
					
				: ($_l_ApplicationType=4D Local mode:K5:1)
					MIR_MirrorPreferences("Save")
			End case 
			
		End if 
		
End case 

//End of form method
ERR_MethodTrackerReturn("FM [USER].MIR_Preferences"; $_t_oldMethodName)
