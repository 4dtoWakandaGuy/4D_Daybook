//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_P_MirrorProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/01/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; <>MIR_bo_Quit; $_bo_OK; MIR_bo_SoapPresent)
	C_LONGINT:C283(<>MIR_l_CurrentDiskFreeSpace; <>MIR_l_MinimumDiskFreeSpace; $_l_CurrentWinRefOLD; $_l_DelayTicks; $_l_ErrorCode; $_l_MessagePosition; $_l_SMTPID; $LRetryCounter; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284(<>EMAIL_t_DefaultReplyToAddress; <>MIR_t_AuthenticationPassword; <>MIR_t_AuthenticationRequired; <>MIR_t_AuthenticationUserName; <>MIR_t_DatabaseName; <>MIR_t_ErrorEMailAccount; <>MIR_t_LastLogNumber; <>MIR_t_NextTimeIntervalMode; <>MIR_t_ScheduleMode; <>MiR_t_SMTPServer; $_t_ApplicationVersion)
	C_TEXT:C284($_t_DateTimeDelay; $_t_EmailAttachment; $_t_EmailID; $_t_EmailSentTo; $_t_EmailSubject; $_t_EmailText; $_t_MessageText; $_t_MirrorCurrentDIskFreeSpace; $_t_MirrorLastBackupID; $_t_MirrorLastBackupNumberValue; $_t_MirrorLastBackupPath)
	C_TEXT:C284($_t_MirrorScheduleMode; $_t_oldMethodName; EMAIL_t_EmailType; EMAIL_t_SendCalledFrom; MIR_t_LastBackupTime; MIR_t_SOAP_tErrorMessage)
	C_TIME:C306(<>MIR_ti_TimeInterval; $_ti_CurrentTime; $_ti_DelayInterval; $_ti_DelayUntil)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_P_MirrorProcess")

$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef

WIN_l_CurrentWinRef:=Open window:C153(200; 200; 450; 400; 0; "Mirror Status")
// Declare local varaibles

$_t_ApplicationVersion:=Application version:C493
MIR_MirrorPreferences("Load")

Case of 
	: (Application type:C494#4D Server:K5:6)
		Gen_Alert("Mirroring only works with 4D Server.")
	: (Num:C11($_t_ApplicationVersion)<804)
		Gen_Alert("This Mirroring system requires 4D  2004.4 or higher.")
	Else 
		$_t_MirrorLastBackupID:=""
		$_t_MirrorLastBackupNumberValue:=""
		$_t_MirrorLastBackupPath:=""
		$_t_MirrorCurrentDIskFreeSpace:=""
		MIR_BackUpPreferences("Load"; ->$_t_MirrorLastBackupID; ->$_t_MirrorLastBackupNumberValue; ->$_t_MirrorLastBackupPath; ->$_t_MirrorCurrentDIskFreeSpace)
		<>MIR_l_CurrentDiskFreeSpace:=Num:C11($_t_MirrorCurrentDIskFreeSpace)
		
		$_t_MirrorScheduleMode:=<>MIR_t_ScheduleMode
		$_ti_DelayInterval:=<>MIR_ti_TimeInterval
		$_ti_CurrentTime:=Current time:C178  // Set now for use later
		MIR_t_LastBackupTime:=MIR_GetDateTimeStamp(Current date:C33; Current time:C178)
		
		While ((Not:C34(<>MIR_bo_Quit)) & (<>MIR_t_ScheduleMode#"Off"))
			Repeat 
				Case of 
					: ($_t_MirrorScheduleMode="Interval Only")
						If ($_ti_DelayInterval#<>MIR_ti_TimeInterval)
							$_ti_DelayInterval:=<>MIR_ti_TimeInterval
						End if 
						
						If ($_ti_DelayInterval<?00:15:00?)
							$_ti_CurrentTime:=Current time:C178  // Less than 15 minutes, set to relative to time last mirroring finished rather than  time began
						End if 
						
						$_ti_DelayUntil:=$_ti_CurrentTime+$_ti_DelayInterval
						If ($_ti_DelayUntil>?24:00:00?)
							$_t_DateTimeDelay:=MIR_GetDateTimeStamp(Add to date:C393(Current date:C33; 0; 0; 1); $_ti_CurrentTime+$_ti_DelayInterval-?24:00:00?)
						Else 
							$_t_DateTimeDelay:=MIR_GetDateTimeStamp(Current date:C33; $_ti_DelayUntil)
						End if 
					Else 
						$_t_DateTimeDelay:=<>MIR_t_NextTimeIntervalMode
						MIR_MirrorPreferences("SetNextTimeInterval")
						If ($_t_DateTimeDelay#<>MIR_t_NextTimeIntervalMode)
							MIR_MirrorPreferences("Save")
						End if 
						
						$_t_DateTimeDelay:=<>MIR_t_NextTimeIntervalMode
				End case 
				
				$_ti_DelayUntil:=Time:C179(Substring:C12($_t_DateTimeDelay; 9; 2)+":"+Substring:C12($_t_DateTimeDelay; 11; 2)+":"+Substring:C12($_t_DateTimeDelay; 13; 2))
				
				If (Date:C102(Substring:C12($_t_DateTimeDelay; 5; 2)+"/"+Substring:C12($_t_DateTimeDelay; 7; 2)+"/"+Substring:C12($_t_DateTimeDelay; 1; 4))>(Current date:C33))  // Next schedule after midnight
					$_l_DelayTicks:=($_ti_DelayUntil+?24:00:00?)-$_ti_CurrentTime*60
				Else 
					$_l_DelayTicks:=$_ti_DelayUntil-$_ti_CurrentTime*60
				End if 
				DelayTicks($_l_DelayTicks)
				
				$_ti_DelayUntil:=?00:00:00?
				// It is possible that a Client machine could be changing the delay mode
				If ($_t_MirrorScheduleMode#<>MIR_t_ScheduleMode)  // The mode has been changed need to recalculate time
					$_t_MirrorScheduleMode:=<>MIR_t_ScheduleMode
				End if 
				
			Until ((MIR_GetDateTimeStamp(Current date:C33; Current time:C178)>=$_t_DateTimeDelay) | (<>MIR_t_ScheduleMode="Off"))
			
			If (<>MIR_t_ScheduleMode#"Off")  // If we are not  turning off the mirroring
				$_bo_OK:=False:C215
				$_t_MessageText:=""
				Repeat 
					MESSAGE:C88("Starting mirroring: "+String:C10(Current time:C178)+Char:C90(13))  // JYFH
					$_l_ErrorCode:=MIR_SendLogFile
					
					Case of 
						: ($_l_ErrorCode=0)  // Mirroring Sucessful
							MESSAGE:C88("Mirror Completed: "+String:C10(Current time:C178)+Char:C90(13))
							$_bo_OK:=True:C214
						: ($_l_ErrorCode#1403) | ($_l_ErrorCode#1407) | ($_l_ErrorCode#1410) | ($_l_ErrorCode#1412) | ($_l_ErrorCode#1422)  // Fatal mirroring error
							<>MIR_t_ScheduleMode:="Off"  //Stop the mirroring
							MESSAGE:C88("Error "+String:C10($_l_ErrorCode)+"during mirroring: "+String:C10(Current time:C178)+Char:C90(13))
							$_bo_OK:=True:C214  // JY: If we stop the mirroring, we should stop trying  ` JYFH Modif
						: ($_l_ErrorCode#1409) & ($_l_ErrorCode#1411)  // Unexpected error stop trying this cycle
							$_bo_OK:=True:C214
							MESSAGE:C88("Error "+String:C10($_l_ErrorCode)+"during mirroring: "+String:C10(Current time:C178)+Char:C90(13))
						Else 
							// An error of 1411 happens when a critical operation prevents creating the new log file Transactions or Indexing
							// jyfh: Same if error = -17053: backup in progress
							MESSAGE:C88("Error "+String:C10($_l_ErrorCode)+"during log sent: "+String:C10(Current time:C178)+Char:C90(13))
							If ($LRetryCounter<<>MIR_l_TransactionRetries)
								$LRetryCounter:=$LRetryCounter+1
								DelayTicks(3600)  // Wait one minute before retrying      jyfh was 360
							Else 
								$_bo_OK:=True:C214  // Stop trying
							End if 
					End case 
					
					If (MIR_t_SOAP_tErrorMessage#"")  // An error occurred add to the error message
						$_l_MessagePosition:=Position:C15(MIR_t_SOAP_tErrorMessage; $_t_MessageText)
						If ($_l_MessagePosition=0)  // If the error message is not already in the outgoing message add it to the message
							$_t_MessageText:=$_t_MessageText+MIR_t_SOAP_tErrorMessage+Char:C90(Carriage return:K15:38)
						End if 
					End if 
					
				Until ($_bo_OK)
				
				// Check the backup Disk Size is the minimium size is set
				If (<>MIR_l_MinimumDiskFreeSpace>0)
					$_t_MirrorLastBackupID:=""
					$_t_MirrorLastBackupNumberValue:=""
					$_t_MirrorLastBackupPath:=""
					$_t_MirrorCurrentDIskFreeSpace:=""
					MIR_BackUpPreferences("Load"; ->$_t_MirrorLastBackupID; ->$_t_MirrorLastBackupNumberValue; ->$_t_MirrorLastBackupPath; ->$_t_MirrorCurrentDIskFreeSpace)
					<>MIR_l_CurrentDiskFreeSpace:=Num:C11($_t_MirrorCurrentDIskFreeSpace)
					
					If (<>MIR_l_CurrentDiskFreeSpace<<>MIR_l_MinimumDiskFreeSpace)
						$_l_ErrorCode:=-17054
						If (MIR_bo_SoapPresent)
							MIR_SOAP_ErrorHandling($_l_ErrorCode)
							$_t_MessageText:=$_t_MessageText+Char:C90(Carriage return:K15:38)+MIR_t_SOAP_tErrorMessage+Char:C90(Carriage return:K15:38)
							$_t_MessageText:=$_t_MessageText+"Structure File: "+Structure file:C489
							$_t_MessageText:=$_t_MessageText+"Drive Used for log files and the last log file: "+<>MIR_t_LastLogNumber
							$_t_MessageText:=$_t_MessageText+"Available Space Remaining on the Drive: "+$_t_MirrorCurrentDIskFreeSpace+" MB"
						Else 
							//Send an email
							$_t_MessageText:=$_t_MessageText+Char:C90(Carriage return:K15:38)+MIR_t_SOAP_tErrorMessage+Char:C90(Carriage return:K15:38)
							$_t_MessageText:=$_t_MessageText+"Structure File: "+Structure file:C489
							$_t_MessageText:=$_t_MessageText+"Drive Used for log files and the last log file: "+<>MIR_t_LastLogNumber
							$_t_MessageText:=$_t_MessageText+"Available Space Remaining on the Drive: "+$_t_MirrorCurrentDIskFreeSpace+" MB"
						End if 
					End if 
				End if 
				
				Case of 
					: ($_l_ErrorCode=0)  // Mirroring Sucessful nothing else to do
					: (Length:C16(<>MiR_t_SMTPServer)=0) & (<>MiR_t_SMTPServer#"None")  // Nothing to do no place to send error message
					: (Position:C15("."; <>MIR_t_SMTPServer)<1) | ((Position:C15("."; <>MIR_t_SMTPServer))=(Length:C16(<>MIR_t_SMTPServer)))  //invalid format for mail server exists (must have a period to be valid and not only a period at the end)
					Else 
						//E-Mail Error message
						// Note: This might be added to an existing e-mail or other messaging system in the database.
						// If such a system involves saving records
						// But be sure it is NOT done on the mirrored server side only on the Master server
						
						// The problem with this solution is if the SMTP server is down, the message will not be sent,
						// so an existing messaging system already in the database might be a better solution
						//NG replace this with a call to mail server...
						While (Semaphore:C143("InitEmail"))
							DelayTicks(2)
						End while 
						If (<>Email_bo_PersonInited=False:C215)
							LOGIN_SetEmail
						End if 
						CLEAR SEMAPHORE:C144("InitEmail")
						EMAIL_t_EmailType:="To"
						$_t_EmailSentTo:="To"
						$_t_EmailAttachment:=""
						$_t_EmailText:=$_t_MessageText
						$_t_EmailSubject:="Error with Mirroring for "+<>MIR_t_DatabaseName
						EMAIL_t_SendCalledFrom:="MIR_P_MirrorProcess"
						$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>MIR_t_ErrorEMailAccount; -><>MIR_t_ErrorEMailAccount; <>MIR_t_ErrorEMailAccount; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; $_t_EmailSubject; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
						If (False:C215)
							$_l_ErrorCode:=SMTP_New($_l_SMTPID)
							$_l_ErrorCode:=SMTP_Host($_l_SMTPID; <>MIR_t_SMTPServer)
							$_l_ErrorCode:=SMTP_From($_l_SMTPID; <>MIR_t_ErrorEMailAccount)
							$_l_ErrorCode:=SMTP_Subject($_l_SMTPID; "Error with Mirroring for "+<>MiR_t_DatabaseName)
							$_l_ErrorCode:=SMTP_To($_l_SMTPID; <>MiR_t_ErrorEMailAccount)
							$_l_ErrorCode:=SMTP_Body($_l_SMTPID; $_t_MessageText)
							If (<>MIR_t_AuthenticationRequired="Yes")
								$_l_ErrorCode:=SMTP_Auth($_l_SMTPID; <>MIR_t_AuthenticationUserName; <>MIR_t_AuthenticationPassword)
							End if 
							$_l_ErrorCode:=SMTP_Send($_l_SMTPID)
							$_l_ErrorCode:=SMTP_Clear($_l_SMTPID)
						End if 
				End case 
				
				$_ti_CurrentTime:=Current time:C178  // Reset for next Time_Interval
			End if 
		End while 
		
End case 
//End of method
ERR_MethodTrackerReturn("MIR_P_MirrorProcess"; $_t_oldMethodName)
