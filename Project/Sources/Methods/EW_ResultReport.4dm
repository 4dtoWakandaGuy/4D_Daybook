//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ResultReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; $_bo_Error; $4)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Error; SMS_l_MessagesAvailable)
	C_REAL:C285(SMS_Credits)
	C_TEXT:C284(<>EMAIL_t_DefaultSMTPhost; <>PER_t_CurrentEmailFrom; $_t_Message; $_t_MessageText; $_t_oldMethodName; $_t_ReportCode; $_t_Result; $_t_SMSText; $1; $2; $3)
	C_TEXT:C284(SMS_AccountName; SMS_Password; vHeading)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ResultReport")
// EW-ResultReport
// Sends SMS, email, or diary item wfter auto exports run
// 03/10/02 pb

// Parameters: $1 = the error report code 94 chars)
//                     $2 = SMS text to send
//                     $3 = Diary or email text
//                     $4 = Success or fail: True if the export was successful


$_t_ReportCode:=$1
$_t_SMSText:=$2
$_t_MessageText:=$3
$_bo_Error:=False:C215

While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 
CLEAR SEMAPHORE:C144("InitEmail")


If ($_t_ReportCode[[2]]="1")  // send an email
	If ($4=True:C214)  // it was successful
		vHeading:="Daybook Data Export completed successfully"
	Else 
		vHeading:="Daybook Data Export error"
	End if 
	$_l_Error:=SMTP_QuickSend(<>EMAIL_t_DefaultSMTPhost; <>PER_t_CurrentEmailFrom; [EW_ExportProjects:117]ErrorReportEmailAddress:18; vHeading; $_t_MessageText)
	If ($_l_Error#0)
		[EW_ExportProjects:117]ErrorMessage:17:=[EW_ExportProjects:117]ErrorMessage:17+Char:C90(13)+"Error: Email could not be sent."+Char:C90(13)
		[EW_ExportProjects:117]ErrorMessage:17:=[EW_ExportProjects:117]ErrorMessage:17+"The error reported was: "+IT_ErrorText($_l_Error)
	End if 
End if 

If ($_t_ReportCode[[3]]="1")  // send an SMS
	SMS_LoadVariables  // yes this does need to be loaded fresh each time
	$_t_Result:=SMS_SendMsg2(SMS_AccountName; SMS_Password; [EW_ExportProjects:117]ErrorReportMobileNumber:19; $_t_SMSText; False:C215; "DayBook")
	If ($_t_Result#"")
		$_l_CharacterPosition:=Position:C15("Result: "; $_t_Result)
		If ($_l_CharacterPosition<1)
			[EW_ExportProjects:117]ErrorMessage:17:=[EW_ExportProjects:117]ErrorMessage:17+"SMS error: "+$_t_Result+Char:C90(13)  // TCP or OT error
			$_bo_Error:=True:C214
		Else 
			$_t_Result:=Substring:C12($_t_Result; $_l_CharacterPosition+8)
			Case of 
				: ($_t_Result="Error@")  // 01/07/02 pb
					$_bo_Error:=True:C214
					$_l_CharacterPosition:=Position:C15("["; $_t_Result)
					If ($_l_CharacterPosition>0)
						$_t_Result:=Substring:C12($_t_Result; $_l_CharacterPosition+1)
						$_l_CharacterPosition:=Position:C15("]"; $_t_Result)
						If ($_l_CharacterPosition>0)
							$_t_Result:=Substring:C12($_t_Result; 1; $_l_CharacterPosition-1)
							$_l_CharacterPosition:=Position:C15(":"; $_t_Result)
							$_t_Result:=Substring:C12($_t_Result; $_l_CharacterPosition+1)  // this should yield the error message
							[EW_ExportProjects:117]ErrorMessage:17:=[EW_ExportProjects:117]ErrorMessage:17+"SMS error: "+$_t_Result+Char:C90(13)
						Else   // this should never happen
							[EW_ExportProjects:117]ErrorMessage:17:=[EW_ExportProjects:117]ErrorMessage:17+"SMS error: Unknown error; message not sent"+Char:C90(13)  // some other error
						End if 
					Else 
						Case of 
							: (Position:C15("out of credit"; $_t_Result)>0)
								[EW_ExportProjects:117]ErrorMessage:17:=[EW_ExportProjects:117]ErrorMessage:17+"SMS ERROR: Out of credits with SMSRelay; message not sent."+Char:C90(13)
								SMS_LoadVariables
								SMS_Credits:=0
								SMS_l_MessagesAvailable:=0
								SMS_SaveVariables
							Else 
								[EW_ExportProjects:117]ErrorMessage:17:=[EW_ExportProjects:117]ErrorMessage:17+"Unknown error; message not sent"+Char:C90(13)  // some other error
						End case 
					End if 
					
				: ($_t_Result="OK@")
					// okey dokey
				Else 
					//TRACE
					$_t_Message:="Error in SMS_SendViaRelay (1)"
			End case 
		End if 
	End if 
End if   // send SMS error message

If ($_t_ReportCode[[4]]="1")  // make a Diary entry
	CREATE RECORD:C68([DIARY:12])
	DiarySetCode
	[DIARY:12]Date_Do_From:4:=Current date:C33(*)
	[DIARY:12]Date_Done_From:5:=Current date:C33(*)
	[DIARY:12]Time_Do_From:6:=Current time:C178(*)
	[DIARY:12]Time_Done_From:7:=Current time:C178(*)
	[DIARY:12]Person:8:=[EW_ExportProjects:117]ErrorReportDiaryName:20  // user initials
	[DIARY:12]Action_Details:10:="Automated Data Export: "+$_t_MessageText
	[DIARY:12]Document_Code:15:="Auto Data Export"
	[DIARY:12]Action_Code:9:="ADE"
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
	
End if 
ERR_MethodTrackerReturn("EW_ResultReport"; $_t_oldMethodName)