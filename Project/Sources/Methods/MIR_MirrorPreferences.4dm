//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_MirrorPreferences
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
	//ARRAY TEXT(MIR_at_BackupHr;0)
	//ARRAY TEXT(MIR_at_BackupMin;0)
	//ARRAY TEXT(MIR_at_BackupMode;0)
	//ARRAY TEXT(MIR_at_BackupTimeHr;0)
	//ARRAY TEXT(MIR_at_BackupTimeMin;0)
	//ARRAY TEXT(MIR_at_Hr;0)
	//ARRAY TEXT(MIR_at_Min;0)
	//ARRAY TEXT(MIR_at_Mode;0)
	//ARRAY TEXT(MIR_at_TimeHr;0)
	//ARRAY TEXT(MIR_at_TimeMin;0)
	//ARRAY TEXT(MiR_l_BackupTimeHr;0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; $_bo_Abort; $_bo_IntervalValid; $_bo_TImeValid)
	C_DATE:C307($_d_CurrentDate; $_d_Date)
	C_LONGINT:C283(<>MIR_l_CurrentDiskFreeSpace; <>MIR_l_MinimumDiskFreeSpace; <>MIR_l_TransactionRetries; $_l_ProcessID; MIR_l_BackupTimeHour; MIR_l_TimeHour; MIT_l_TimeMin)
	C_TEXT:C284(<>MIR_t_AuthenticationPassword; <>MIR_t_AuthenticationRequired; <>MIR_t_AuthenticationUserName; <>MIR_t_BackupScheduleMode; <>MIR_t_DatabaseName; <>MIR_t_ErrorEMailAccount; <>MIR_T_ErrorEmailAcount; <>MIR_t_LastLogNumber; <>MIR_t_NextBackupIntervalMode; <>MIR_t_NextTimeIntervalMode; <>MIR_t_ScheduleMode)
	C_TEXT:C284(<>MIR_t_ServerIPAddress; <>MIR_t_ServerType; <>MIR_t_SMTPServer; $_t_Action; $_t_CurrentTimeTXT; $_t_MinimumDiskFreeSpace; $_t_MirrorBackupTIme; $_t_MirrorBackupTimeInterval; $_t_MirrorTime; $_t_MirrorTimeInterval; $_t_MirrorTransactionDelay)
	C_TEXT:C284($_t_MirrorTransactionRetries; $_t_oldMethodName; $_t_PreferencesPath; $_t_SettingsFolderPath; $_t_XMLElementReference; $_t_XMLElementValue; $_t_XMLReference; $1)
	C_TIME:C306(<>MIR_ti_BackupTime; <>MIR_ti_BackupTimeInterval; <>MIR_ti_Time; <>MIR_ti_TimeInterval; <>MIR_ti_TransactionDelay; $_ti_MirroringTime; $_ti_TIme)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_MirrorPreferences")
$_t_Action:=$1

// Declare default values
$_bo_Abort:=False:C215
$_t_PreferencesPath:=MIR_MirrorPath("Mirror")
While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 
CLEAR SEMAPHORE:C144("InitEmail")

Case of 
	: ($_t_Action="Create")
		CONFIRM:C162("Choose the type for this server."; "Main DB"; "Mirror")
		If (OK=1)
			<>MIR_t_ServerType:="Main DB"
		Else 
			<>MIR_t_ServerType:="Mirror"
		End if 
		BP_LoadPrefs  //Load the backup prefs for the mail to name
		<>MIR_t_DatabaseName:="None"
		<>MIR_t_ServerIPAddress:="0.0.0.0"
		<>MIR_t_ScheduleMode:="Off"
		$_t_MirrorTime:="00:00:00"
		$_t_MirrorTimeInterval:="00:00:00"
		<>MIR_t_BackupScheduleMode:="Use Mirror Machine Scheduler"
		$_t_MirrorBackupTIme:="00:00:00"
		$_t_MirrorBackupTimeInterval:="00:00:00"
		$_t_MirrorTransactionDelay:="00:05:00"
		<>MIR_t_NextTimeIntervalMode:="00000000000000"
		<>MIR_t_NextBackupIntervalMode:="00000000000000"
		<>MIR_l_TransactionRetries:=0
		<>MIR_t_LastLogNumber:="[0000]"
		<>MIR_t_SMTPServer:=<>MIR_t_DatabaseName
		<>MIR_T_ErrorEmailAcount:=BP_t_BackupAdminEmail
		<>MIR_t_AuthenticationRequired:="No"
		<>MIR_t_AuthenticationUserName:=<>MIR_t_DatabaseName
		<>MIR_t_AuthenticationPassword:=<>MIR_t_DatabaseName
		<>MIR_l_CurrentDiskFreeSpace:=0
		<>MIR_l_MinimumDiskFreeSpace:=0
		
	: (Count parameters:C259#1)
		$_bo_Abort:=True:C214  // Not enough parameters
	Else 
		$_t_MirrorBackupTIme:=String:C10(<>MIR_ti_BackupTime; HH MM SS:K7:1)
		$_t_MirrorBackupTimeInterval:=String:C10(<>MIR_ti_BackupTimeInterval; HH MM SS:K7:1)
		$_t_MirrorTime:=String:C10(<>MIR_ti_Time; HH MM SS:K7:1)
		$_t_MirrorTimeInterval:=String:C10(<>MIR_ti_TimeInterval; HH MM SS:K7:1)
		$_t_MirrorTransactionDelay:=String:C10(<>MIR_ti_TransactionDelay; HH MM SS:K7:1)
End case 

Case of 
	: ($_bo_Abort)
	: ($_t_Action="SetNextTimeInterval")
		Case of 
			: (<>MIR_t_ScheduleMode="Time Only")
				If (Current time:C178(*)><>MIR_ti_Time)
					<>MIR_t_NextTimeIntervalMode:=MIR_GetDateTimeStamp(Add to date:C393(Current date:C33(*); 0; 0; 1); <>MIR_ti_Time)
				Else 
					<>MIR_t_NextTimeIntervalMode:=MIR_GetDateTimeStamp(Current date:C33(*); <>MIR_ti_Time)
				End if 
				
			: (<>MIR_t_ScheduleMode="Time & Interval")
				$_d_CurrentDate:=Current date:C33(*)
				$_ti_MirroringTime:=Current time:C178(*)
				If (<>MIR_t_NextTimeIntervalMode<MIR_GetDateTimeStamp($_d_CurrentDate; $_ti_MirroringTime))  // Something happened and the last scheduled mirroring did not take place
					If (<>MIR_t_NextTimeIntervalMode="00000000000000")
						$_d_Date:=$_d_CurrentDate
						$_ti_TIme:=$_ti_MirroringTime
					Else 
						$_d_Date:=Date:C102(Substring:C12(<>MIR_t_NextTimeIntervalMode; 5; 2)+"/"+Substring:C12(<>MIR_t_NextTimeIntervalMode; 7; 2)+"/"+Substring:C12(<>MIR_t_NextTimeIntervalMode; 1; 4))
						$_ti_TIme:=Time:C179(Substring:C12(<>MIR_t_NextTimeIntervalMode; 9; 2)+":"+Substring:C12(<>MIR_t_NextTimeIntervalMode; 11; 2)+":"+Substring:C12(<>MIR_t_NextTimeIntervalMode; 13; 2))
					End if 
					
					While (MIR_GetDateTimeStamp($_d_Date; $_ti_TIme)<MIR_GetDateTimeStamp($_d_CurrentDate; $_ti_MirroringTime))
						$_ti_TIme:=$_ti_TIme+<>MIR_ti_TimeInterval
						If ($_ti_TIme>=?24:00:00?)  // If the next interval is tomorrow
							$_ti_TIme:=$_ti_TIme-?24:00:00?
							$_d_Date:=Add to date:C393($_d_Date; 0; 0; 1)
						End if 
						
					End while 
					<>MIR_ti_Time:=$_ti_TIme
				Else 
					
					<>MIR_ti_Time:=<>MIR_ti_Time+<>MIR_ti_TimeInterval  // Set the next Time_Interval
					
				End if 
				
				If (<>MIR_ti_Time>=?24:00:00?)  // If the next interval is tomorrow
					<>MIR_ti_Time:=<>MIR_ti_Time-?24:00:00?
				End if 
				
				If ($_ti_MirroringTime<<>MIR_ti_Time)
					<>MIR_t_NextTimeIntervalMode:=MIR_GetDateTimeStamp(Current date:C33(*); <>MIR_ti_Time)
				Else 
					<>MIR_t_NextTimeIntervalMode:=MIR_GetDateTimeStamp(Add to date:C393(Current date:C33(*); 0; 0; 1); <>MIR_ti_Time)
				End if 
				
			Else 
				<>MIR_t_NextTimeIntervalMode:="00000000000000"
		End case 
		
	: ($_t_Action="SetNextBackupInterval")
		Case of 
			: (<>MIR_t_BackupScheduleMode="via Main Server Time")
				If (Current time:C178(*)><>MIR_ti_BackupTime)
					<>MIR_t_NextBackupIntervalMode:=MIR_GetDateTimeStamp(Add to date:C393(Current date:C33(*); 0; 0; 1); <>MIR_ti_BackupTime)
				Else 
					<>MIR_t_NextBackupIntervalMode:=MIR_GetDateTimeStamp(Current date:C33(*); <>MIR_ti_BackupTime)
				End if 
				
			: (<>MIR_t_BackupScheduleMode="via Main Server Time & Interval")
				$_ti_MirroringTime:=Current time:C178(*)
				$_d_CurrentDate:=Current date:C33(*)
				If (<>MIR_t_NextBackupIntervalMode<MIR_GetDateTimeStamp($_d_CurrentDate; $_ti_MirroringTime))  // Something happened and the last scheduled mirroring did not take place
					If (<>MIR_t_NextBackupIntervalMode="00000000000000")
						$_d_Date:=$_d_CurrentDate
						$_ti_TIme:=$_ti_MirroringTime
					Else 
						$_d_Date:=Date:C102(Substring:C12(<>MIR_t_NextBackupIntervalMode; 5; 2)+"/"+Substring:C12(<>MIR_t_NextBackupIntervalMode; 7; 2)+"/"+Substring:C12(<>MIR_t_NextBackupIntervalMode; 1; 4))
						$_ti_TIme:=Time:C179(Substring:C12(<>MIR_t_NextBackupIntervalMode; 9; 2)+":"+Substring:C12(<>MIR_t_NextBackupIntervalMode; 11; 2)+":"+Substring:C12(<>MIR_t_NextBackupIntervalMode; 13; 2))
					End if 
					
					While (MIR_GetDateTimeStamp($_d_Date; $_ti_TIme)<MIR_GetDateTimeStamp($_d_CurrentDate; $_ti_MirroringTime))
						$_ti_TIme:=$_ti_TIme+<>MIR_ti_BackupTimeInterval
						If ($_ti_TIme>=?24:00:00?)  // If the next interval is tomorrow
							$_ti_TIme:=$_ti_TIme-?24:00:00?
							$_d_Date:=Add to date:C393($_d_Date; 0; 0; 1)
						End if 
						
					End while 
					
					<>MIR_ti_BackupTime:=$_ti_TIme
					
				Else 
					
					<>MIR_ti_BackupTime:=<>MIR_ti_BackupTime+<>MIR_ti_BackupTimeInterval  // Set the next Time_Interval
					
				End if 
				
				If (<>MIR_ti_BackupTime>=?24:00:00?)  // If the next interval is tomorrow
					<>MIR_ti_BackupTime:=<>MIR_ti_BackupTime-?24:00:00?
				End if 
				
				If ($_ti_MirroringTime<<>MIR_ti_BackupTime)
					<>MIR_t_NextBackupIntervalMode:=MIR_GetDateTimeStamp(Current date:C33(*); <>MIR_ti_BackupTime)
				Else 
					<>MIR_t_NextBackupIntervalMode:=MIR_GetDateTimeStamp(Add to date:C393(Current date:C33(*); 0; 0; 1); <>MIR_ti_BackupTime)
				End if 
				
			Else 
				$_bo_Abort:=False:C215
				$_d_Date:=Current date:C33(*)
				$_ti_TIme:=Current time:C178(*)
				$_ti_MirroringTime:=$_ti_TIme+<>MIR_ti_BackupTimeInterval
				If ($_ti_MirroringTime>?24:00:00?)  // Check to see if midnight has passed
					$_ti_MirroringTime:=$_ti_MirroringTime-?24:00:00?
					$_t_CurrentTimeTXT:=MIR_GetDateTimeStamp(Add to date:C393($_d_Date; 0; 0; 1); $_ti_MirroringTime)
				Else 
					$_t_CurrentTimeTXT:=MIR_GetDateTimeStamp($_d_Date; $_ti_MirroringTime)
				End if 
				
				
				
				Case of 
					: (<>MIR_t_NextBackupIntervalMode="00000000000000")
						$_d_Date:=Current date:C33(*)
						$_ti_TIme:=Current time:C178(*)
						
					: ($_t_CurrentTimeTXT<<>MIR_t_NextBackupIntervalMode)  // We are changing values and we should keep the existing time already scheduled
						$_bo_Abort:=True:C214
						
					Else 
						$_d_Date:=Date:C102(Substring:C12(<>MIR_t_NextBackupIntervalMode; 5; 2)+"/"+Substring:C12(<>MIR_t_NextBackupIntervalMode; 7; 2)+"/"+Substring:C12(<>MIR_t_NextBackupIntervalMode; 1; 4))
						$_ti_TIme:=Time:C179(Substring:C12(<>MIR_t_NextBackupIntervalMode; 9; 2)+":"+Substring:C12(<>MIR_t_NextBackupIntervalMode; 11; 2)+":"+Substring:C12(<>MIR_t_NextBackupIntervalMode; 13; 2))
				End case 
				
				If (Not:C34($_bo_Abort))
					$_ti_TIme:=$_ti_TIme+<>MIR_ti_BackupTimeInterval
					If ($_ti_TIme>?24:00:00?)  // Check to see if midnight has passed
						$_ti_TIme:=$_ti_TIme-?24:00:00?
						$_d_Date:=Add to date:C393($_d_Date; 0; 0; 1)
					End if 
					
					<>MIR_t_NextBackupIntervalMode:=MIR_GetDateTimeStamp($_d_Date; $_ti_TIme)
					
					If ($_t_CurrentTimeTXT><>MIR_t_NextBackupIntervalMode)  // The next scheduled time has already passed, reset to the current scheduled time
						<>MIR_t_NextBackupIntervalMode:=$_t_CurrentTimeTXT
					End if 
					
				End if 
				
		End case 
		
		
	: ($_t_Action="Load")
		$_t_SettingsFolderPath:=MIR_GetFolderpathName($_t_PreferencesPath)
		If (Test path name:C476($_t_SettingsFolderPath)#0)  // See if the directory exists
			MIR_SetFolderPath($_t_SettingsFolderPath)
		End if 
		
		If (Test path name:C476($_t_PreferencesPath)#1)  // Check to see if a valid file exists
			MIR_MirrorPreferences("Create")  // If not create a preferences file
			
		Else 
			While (Semaphore:C143("$ModMirrorPrefs"))  // Limit acces
				DelayTicks(2)
				
			End while 
			$_t_XMLReference:=DOM Parse XML source:C719($_t_PreferencesPath)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ServerType")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_ServerType)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ServerName")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_DatabaseName)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ServerIPAddress")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_ServerIPAddress)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ScheduleMode")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_ScheduleMode)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_Time")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; $_t_MirrorTime)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_TimeInterval")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; $_t_MirrorTimeInterval)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_NextTimeInterval")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_NextTimeIntervalMode)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_BackupScheduleMode")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_BackupScheduleMode)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_BackupTime")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; $_t_MirrorBackupTIme)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_BackupTimeInterval")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; $_t_MirrorBackupTimeInterval)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_NextBackupIntervalMode")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_NextBackupIntervalMode)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_TransactionDelay")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; $_t_MirrorTransactionDelay)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_TransactionRetries")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; $_t_MirrorTransactionRetries)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_LastSegmentNumber")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_LastLogNumber)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ErrorSMTPServer")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_SMTPServer)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ErrorEMail")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_ErrorEMailAccount)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ErrorEMailAuthentication")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_AuthenticationRequired)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ErrorEMailUsername")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_AuthenticationUserName)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ErrorEMailPassword")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; <>MIR_t_AuthenticationPassword)
			$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_MinimumDiskFreeSpace")
			DOM GET XML ELEMENT VALUE:C731($_t_XMLElementReference; $_t_MinimumDiskFreeSpace)
			DOM CLOSE XML:C722($_t_XMLReference)
			CLEAR SEMAPHORE:C144("$ModMirrorPrefs")
			<>MIR_ti_Time:=Time:C179($_t_MirrorTime)
			<>MIR_ti_TimeInterval:=Time:C179($_t_MirrorTimeInterval)
			<>MIR_ti_BackupTime:=Time:C179($_t_MirrorBackupTIme)
			<>MIR_ti_BackupTimeInterval:=Time:C179($_t_MirrorBackupTimeInterval)
			<>MIR_ti_TransactionDelay:=Time:C179($_t_MirrorTransactionDelay)
			<>MIR_l_TransactionRetries:=Num:C11($_t_MirrorTransactionRetries)
			<>MIR_l_MinimumDiskFreeSpace:=Num:C11($_t_MinimumDiskFreeSpace)
		End if 
		
	: ($_t_Action="HandleModePopup")
		Case of 
			: (MIR_at_Mode{MIR_at_Mode}="Off")  // Keep the last settings
				//Mir_at_TimeHr:=1  ` Set to Zero
				//Mir_at_TimeMin:=1
				//Mir_at_Hr:=1  ` Set to Zero
				//Mir_at_Min:=1
				
			: (MIR_at_Mode{MIR_at_Mode}="Time Only")
				MIR_at_Hr:=1  // Set to Zero
				MIR_at_Min:=1
				MIR_MirrorPreferences("HandleBackupModePopup")
				
			: (MIR_at_Mode{MIR_at_Mode}="Interval Only")
				MIR_at_TimeHr:=1  // Set to Zero
				MIR_at_TimeMin:=1
				
			Else 
				MIR_MirrorPreferences("HandleBackupModePopup")
				
		End case 
		<>MIR_ti_Time:=Time:C179(MIR_at_TimeHr{MIR_at_TimeHr}+":"+MIR_at_TimeMin{MIR_at_TimeMin}+":00")
		<>MIR_ti_TimeInterval:=Time:C179(MIR_at_Hr{MIR_at_Hr}+":"+MIR_at_Min{MIR_at_Min}+":00")
		MIR_MirrorPreferences("SetModePopup")
		
	: ($_t_Action="SetModePopup")
		Case of 
			: (MIR_at_Mode{MIR_at_Mode}="Off")
				OBJECT SET ENABLED:C1123(*; "MIR_Time@"; False:C215)
				OBJECT SET ENABLED:C1123(*; "MIR_Interval@"; False:C215)
				OBJECT SET RGB COLORS:C628(*; "MIR_Time@"; 0x00BBBBBB; 0x00FFFFFF)
				OBJECT SET RGB COLORS:C628(*; "MIR_Interval@"; 0x00BBBBBB; 0x00FFFFFF)
				
			: (MIR_at_Mode{MIR_at_Mode}="Time Only")
				OBJECT SET ENABLED:C1123(*; "MIR_Time@"; True:C214)
				OBJECT SET ENABLED:C1123(*; "MIR_Interval@"; False:C215)
				OBJECT SET RGB COLORS:C628(*; "MIR_Time@"; 0x0000; 0x00FFFFFF)
				OBJECT SET RGB COLORS:C628(*; "MIR_Interval@"; 0x00BBBBBB; 0x00FFFFFF)
				
			: (MIR_at_Mode{MIR_at_Mode}="Interval Only")
				OBJECT SET ENABLED:C1123(*; "MIR_Time@"; False:C215)
				OBJECT SET ENABLED:C1123(*; "MIR_Interval@"; True:C214)
				OBJECT SET RGB COLORS:C628(*; "MIR_Time@"; 0x00BBBBBB; 0x00FFFFFF)
				OBJECT SET RGB COLORS:C628(*; "MIR_Interval@"; 0x0000; 0x00FFFFFF)
				
			Else 
				OBJECT SET ENABLED:C1123(*; "MIR_Time@"; True:C214)
				OBJECT SET ENABLED:C1123(*; "MIR_Interval@"; True:C214)
				OBJECT SET RGB COLORS:C628(*; "MIR_Time@"; 0x0000; 0x00FFFFFF)
				OBJECT SET RGB COLORS:C628(*; "MIR_Interval@"; 0x0000; 0x00FFFFFF)
				
		End case 
		
	: ($_t_Action="HandleBackupModePopup")
		Case of 
			: (MIR_at_BackupMode{MIR_at_BackupMode}="Use Mirror Machine Scheduler")
				MIR_at_BackupTimeHr:=1  // Set to Zero
				MIR_at_BackupTimeMin:=1
				MIR_at_BackupHr:=1  // Set to Zero
				MIR_at_BackupMin:=1
				
			: (MIR_at_Mode{MIR_at_Mode}="Time Only") & (MIR_at_BackupMode{MIR_at_BackupMode}#"via Main Server Time")
				Gen_Alert("Backups on the Mirrored Server may only occur at the secheduled mirroring time."+"\rTo use a different time you must use the preference settings on the Mirrored mac"+"hine itself.")
				MIR_at_BackupMode:=2
				MIR_at_BackupTimeHr:=MIR_l_TimeHour
				MIR_at_BackupTimeMin:=MIT_l_TimeMin
				MIR_at_BackupHr:=1  // Set to Zero
				MIR_at_BackupMin:=1
				
			: (MIR_at_Mode{MIR_at_Mode}#"Interval Only") & (MIR_at_BackupMode{MIR_at_BackupMode}="via Main Server Interval")
				Gen_Alert("Backups on the Mirrored Server may only be set to Interval mode when the Scheduli"+"ng Mode is also Interval Mode")
				MIR_at_BackupMode:=MIR_at_Mode
				MIR_at_BackupTimeHr:=MIR_l_TimeHour
				MIR_at_BackupTimeMin:=MIR_at_TimeMin
				MIR_at_BackupHr:=MIR_at_Hr
				MIR_at_BackupMin:=MIR_at_Min
				
			: (MIR_at_BackupMode{MIR_at_BackupMode}="via Main Server Time")
				MIR_at_BackupHr:=1  // Set to Zero
				MIR_at_BackupMin:=1
				
			: (MIR_at_BackupMode{MIR_at_BackupMode}="via Main Server Interval")
				MIR_at_BackupTimeHr:=1  // Set to Zero
				MIR_at_BackupTimeMin:=1
				
		End case 
		<>MIR_ti_BackupTime:=Time:C179(MIR_at_BackupTimeHr{MIR_at_BackupTimeHr}+":"+MIR_at_BackupTimeMin{MIR_at_BackupTimeMin}+":00")
		<>MIR_ti_BackupTimeInterval:=Time:C179(MIR_at_BackupHr{MIR_at_BackupHr}+":"+MIR_at_BackupMin{MIR_at_BackupMin}+":00")
		MIR_MirrorPreferences("SetBackupModePopup")
		
	: ($_t_Action="SetBackupModePopup")
		Case of 
			: (MIR_at_BackupMode{MIR_at_BackupMode}="Use Mirror Machine Scheduler")
				OBJECT SET ENABLED:C1123(*; "MIR_BackupTime@"; False:C215)
				OBJECT SET ENABLED:C1123(*; "MIT_BackupInterval@"; False:C215)
				OBJECT SET RGB COLORS:C628(*; "MIR_BackupTime@"; 0x00BBBBBB; 0x00FFFFFF)
				OBJECT SET RGB COLORS:C628(*; "MIR_BackupInterval@"; 0x00BBBBBB; 0x00FFFFFF)
				
			: (MIR_at_BackupMode{MIR_at_BackupMode}="via Main Server Time")
				OBJECT SET ENABLED:C1123(*; "MIR_BackupTime@"; True:C214)
				OBJECT SET ENABLED:C1123(*; "MIR_BackupInterval@"; False:C215)
				OBJECT SET RGB COLORS:C628(*; "MIR_BackupTime@"; 0x0000; 0x00FFFFFF)
				OBJECT SET RGB COLORS:C628(*; "MIR_BackupInterval@"; 0x00BBBBBB; 0x00FFFFFF)
				
			: (MIR_at_BackupMode{MIR_at_BackupMode}="via Main Server Interval")
				OBJECT SET ENABLED:C1123(*; "MIR_BackupTime@"; False:C215)
				OBJECT SET ENABLED:C1123(*; "MIR_BackupInterval@"; True:C214)
				OBJECT SET RGB COLORS:C628(*; "MIR_BackupTime@"; 0x00BBBBBB; 0x00FFFFFF)
				OBJECT SET RGB COLORS:C628(*; "MIR_BackupInterval@"; 0x0000; 0x00FFFFFF)
				
			Else 
				OBJECT SET ENABLED:C1123(*; "MIR_BackupTime@"; True:C214)
				OBJECT SET ENABLED:C1123(*; "MIR_BackupInterval@"; True:C214)
				OBJECT SET RGB COLORS:C628(*; "MIR_BackupTime@"; 0x0000; 0x00FFFFFF)
				OBJECT SET RGB COLORS:C628(*; "MIR_BackupInterval@"; 0x0000; 0x00FFFFFF)
				
		End case 
		
	: ($_t_Action="ValidateBackupScheduling")
		If (MIR_at_Mode{MIR_at_Mode}="Time Only")
			If ((MIR_l_BackupTimeHour#MIR_at_TimeHr) | (MIR_at_BackupTimeMin#MIR_at_TimeMin))
				Gen_Alert("Backups on the Mirrored Server may only occur at the secheduled mirroring time."+"\rTo use a different time you must use the preference settings on the Mirrored mac"+"hine itself.")
				Mir_at_BackupMode:=2
				MiR_l_BackupTimeHr:=Mir_at_TimeHr
				Mir_at_BackupTimeMin:=Mir_at_TimeMin
			End if 
			
		Else 
			$_bo_TImeValid:=False:C215
			$_bo_IntervalValid:=False:C215
			
			If ((<>MIR_ti_Time#?00:00:00?) | (<>MIR_ti_BackupTime#?00:00:00?))
				If (<>MIR_ti_Time<=<>MIR_ti_BackupTime)
					$_ti_MirroringTime:=<>MIR_ti_Time
					Repeat 
						If ($_ti_MirroringTime=<>MIR_ti_BackupTime)
							$_bo_TImeValid:=True:C214
						End if 
						$_ti_MirroringTime:=$_ti_MirroringTime+<>MIR_ti_TimeInterval
					Until (($_bo_TImeValid) | ($_ti_MirroringTime>?24:00:00?) | (<>MIR_ti_TimeInterval=?00:00:00?))
				Else 
					$_ti_MirroringTime:=<>MIR_ti_Time
					If ($_ti_MirroringTime=<>MIR_ti_BackupTimeInterval)
						$_bo_IntervalValid:=True:C214
					Else 
						Repeat 
							$_ti_MirroringTime:=$_ti_MirroringTime-<>MIR_ti_TimeInterval
							If ($_ti_MirroringTime=<>MIR_ti_BackupTime)
								$_bo_TImeValid:=True:C214
							End if 
						Until (($_bo_TImeValid) | ($_ti_MirroringTime<<>MIR_ti_TimeInterval) | (<>MIR_ti_TimeInterval=?00:00:00?))
					End if 
				End if 
			End if 
			
			If ((<>MIR_ti_TimeInterval#?00:00:00?) & (<>MIR_ti_BackupTimeInterval#?00:00:00?))
				$_ti_MirroringTime:=<>MIR_ti_TimeInterval
				Repeat 
					If ($_ti_MirroringTime=<>MIR_ti_BackupTimeInterval)
						$_bo_IntervalValid:=True:C214
					End if 
					$_ti_MirroringTime:=$_ti_MirroringTime+<>MIR_ti_TimeInterval
				Until (($_bo_IntervalValid) | ($_ti_MirroringTime>?24:00:00?) | (<>MIR_ti_TimeInterval=?00:00:00?))
			End if 
		End if 
		
		Case of 
			: ($_bo_IntervalValid) & (MIR_at_BackupMode{MIR_at_BackupMode}="via Main Server Interval")
				// OK
				
			: (((Not:C34($_bo_TImeValid)) & (<>MIR_ti_TimeInterval#?00:00:00?)) | ((Not:C34($_bo_IntervalValid)) & (<>MIR_ti_BackupTimeInterval#?00:00:00?)))
				Gen_Alert("Backup not synchronized with scheduled Mirroring. Best available backup time will"+" be used.")
		End case 
		
		
		
		
	: ($_t_Action="Save")
		While (Semaphore:C143("$ModMirrorPrefs"))
			DelayTicks(2)
			
		End while 
		$_t_XMLReference:=DOM Parse XML source:C719($_t_PreferencesPath)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ServerType")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_ServerType)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ServerName")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_DatabaseName)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ServerIPAddress")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_ServerIPAddress)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ScheduleMode")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_ScheduleMode)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_Time")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; $_t_MirrorTime)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_TimeInterval")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; $_t_MirrorTimeInterval)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_NextTimeInterval")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_NextTimeIntervalMode)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_BackupScheduleMode")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_BackupScheduleMode)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_BackupTime")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; $_t_MirrorBackupTIme)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_BackupTimeInterval")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; $_t_MirrorBackupTimeInterval)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_NextBackupIntervalMode")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_NextBackupIntervalMode)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_TransactionDelay")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; $_t_MirrorTransactionDelay)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_TransactionRetries")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; String:C10(<>MIR_l_TransactionRetries))
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_LastSegmentNumber")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_LastLogNumber)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ErrorSMTPServer")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_SMTPServer)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ErrorEMail")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_ErrorEMailAccount)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ErrorEMailAuthentication")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_AuthenticationRequired)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ErrorEMailUsername")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_AuthenticationUserName)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_ErrorEMailPassword")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_AuthenticationPassword)
		$_t_XMLElementReference:=DOM Find XML element:C864($_t_XMLReference; "/Mirror/PreferenceSetting/Mirror_MinimumDiskFreeSpace")
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; String:C10(<>MIR_l_MinimumDiskFreeSpace))
		DOM EXPORT TO FILE:C862($_t_XMLReference; $_t_PreferencesPath)
		DOM CLOSE XML:C722($_t_XMLReference)
		CLEAR SEMAPHORE:C144("$ModMirrorPrefs")
		
	: ($_t_Action="SaveFromClient") | ($_t_Action="Save&LaunchFromClient")
		MIR_MirrorPreferences("Save")
		Case of 
			: ($_t_Action="Save&LaunchFromClient")
				$_l_ProcessID:=New process:C317("MIR_P_MirrorProcess"; 256000; "MirroringProcess"; *)
			Else 
				$_l_ProcessID:=Process number:C372("MirroringProcess"; *)
				If ($_l_ProcessID>0)
					RESUME PROCESS:C320($_l_ProcessID)
				End if 
		End case 
		
	: ($_t_Action="Create")
		While (Semaphore:C143("$ModMirrorPrefs"))
			DelayTicks(2)
		End while 
		
		$_t_XMLReference:=DOM Create XML Ref:C861("Mirror")
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_ServerType"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_ServerType)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_ServerName"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_DatabaseName)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_ServerIPAddress"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_ServerIPAddress)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_ScheduleMode"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_ScheduleMode)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_Time"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; $_t_MirrorTime)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_TimeInterval"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; $_t_MirrorTimeInterval)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_NextTimeInterval"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_NextTimeIntervalMode)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_BackupScheduleMode"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_BackupScheduleMode)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_BackupTime"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; $_t_MirrorBackupTIme)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_BackupTimeInterval"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; $_t_MirrorBackupTimeInterval)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_NextBackupIntervalMode"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_NextBackupIntervalMode)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_TransactionDelay"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; $_t_MirrorTransactionDelay)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_TransactionRetries"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; String:C10(<>MIR_l_TransactionRetries))
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_LastSegmentNumber"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_LastLogNumber)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_ErrorSMTPServer"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_SMTPServer)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_ErrorEMail"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_ErrorEMailAccount)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_ErrorEMailAuthentication"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_AuthenticationRequired)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_ErrorEMailUsername"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_AuthenticationUserName)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_ErrorEMailPassword"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; <>MIR_t_AuthenticationPassword)
		$_t_XMLElementValue:="/Mirror/PreferenceSetting/Mirror_MinimumDiskFreeSpace"
		$_t_XMLElementReference:=DOM Create XML element:C865($_t_XMLReference; $_t_XMLElementValue)
		DOM SET XML ELEMENT VALUE:C868($_t_XMLElementReference; String:C10(<>MIR_l_MinimumDiskFreeSpace))
		DOM EXPORT TO FILE:C862($_t_XMLReference; $_t_PreferencesPath)
		DOM CLOSE XML:C722($_t_XMLReference)
		CLEAR SEMAPHORE:C144("$ModMirrorPrefs")
		<>MIR_ti_Time:=Time:C179($_t_MirrorTime)
		<>MIR_ti_TimeInterval:=Time:C179($_t_MirrorTimeInterval)
		<>MIR_ti_BackupTime:=Time:C179($_t_MirrorBackupTIme)
		<>MIR_ti_BackupTimeInterval:=Time:C179($_t_MirrorBackupTimeInterval)
		<>MIR_ti_TransactionDelay:=Time:C179($_t_MirrorTransactionDelay)
		<>MIR_l_MinimumDiskFreeSpace:=Num:C11($_t_MinimumDiskFreeSpace)
End case 
//End of method
ERR_MethodTrackerReturn("MIR_MirrorPreferences"; $_t_oldMethodName)
