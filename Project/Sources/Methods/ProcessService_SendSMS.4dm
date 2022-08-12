//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_SendSMS
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
	ARRAY TEXT:C222($_at_ContactIDS; 0)
	ARRAY TEXT:C222($_at_Mobiles; 0)
	C_BOOLEAN:C305($_bo_Error; $_bo_HasDiaryEntry; $_t_Flash; $0; SMS_LowLevelWarningSent)
	C_DATE:C307($_d_DateDoFrom)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index; $_l_Offset; $_l_RecipientCount; iSMS_Msgs_Sent; SMS_iCreditsLowLevel; SMS_l_MessagesAvailable)
	C_REAL:C285($_l_CharacterPosition2; $_l_CreditsUsed; lCredits; SMS_Credits; SMS_rCreditsUsed)
	C_TEXT:C284($_t_ContactIDSLIST; $_t_Credits; $_t_DiaryCode; $_t_ErrorMessage; $_t_Message; $_t_Mobile; $_t_oldMethodName; $_t_Result; $_t_SenderID; $_t_SMSAccountName; $_t_SMSPassword)
	C_TEXT:C284($_t_SmsText; $_t_user; SMS_AccountName; SMS_Password; SMS_ReminderPhone)
	C_TIME:C306($_ti_TimeDoFrom)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_SendSMS")
// ProcessServices_SendSMS
// 8/05/02 pb

//TRACE
$_l_Offset:=0
BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_SMSAccountName; $_l_Offset)
BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_SMSPassword; $_l_Offset)
BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_Mobile; $_l_Offset)  // a pipe-delimited list of recipient mobile nos.
BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_Message; $_l_Offset)
BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_Flash; $_l_Offset)  // send flash message -- not currently used
BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_d_DateDoFrom; $_l_Offset)
BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_ti_TimeDoFrom; $_l_Offset)
BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_user; $_l_Offset)
BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_l_RecipientCount; $_l_Offset)  // the no. of recipients
BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_ContactIDSLIST; $_l_Offset)  // pipe-delimited list of contact IDs
BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_SenderID; $_l_Offset)
BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_DiaryCode; $_l_Offset)  // Record no. of Diary entry 26/06/02 pb

SMS_LoadVariables  // 7/01/03 pb

ARRAY TEXT:C222($_at_Mobiles; $_l_RecipientCount)
ARRAY TEXT:C222($_at_ContactIDS; $_l_RecipientCount)
For ($_l_Index; 1; $_l_RecipientCount)
	$_l_CharacterPosition:=Position:C15("|"; $_t_Mobile)
	If ($_l_CharacterPosition>0)  // should never be less than 1, but just in case ...
		$_at_Mobiles{$_l_Index}:=Substring:C12($_t_Mobile; 1; $_l_CharacterPosition-1)
		$_t_Mobile:=Substring:C12($_t_Mobile; $_l_CharacterPosition+1)
	Else 
		If ($_t_Mobile#"")
			$_at_Mobiles{$_l_Index}:=$_t_Mobile
		End if 
	End if 
	$_l_CharacterPosition:=Position:C15("|"; $_t_ContactIDSLIST)
	If ($_l_CharacterPosition>0)  // could happen if there was only 1
		$_at_ContactIDS{$_l_Index}:=Substring:C12($_t_ContactIDSLIST; 1; $_l_CharacterPosition-1)
		$_t_ContactIDSLIST:=Substring:C12($_t_ContactIDSLIST; $_l_CharacterPosition+1)
	Else 
		If ($_t_ContactIDSLIST#"")
			$_at_ContactIDS{$_l_Index}:=$_t_ContactIDSLIST
		End if 
	End if 
End for 

If ($_t_DiaryCode="")
	$_bo_HasDiaryEntry:=False:C215
Else 
	$_bo_HasDiaryEntry:=True:C214
End if 
//TRACE
// now to send the messages ...
For ($_l_Index; 1; $_l_RecipientCount)
	$_bo_Error:=False:C215
	If ($_at_Mobiles{$_l_Index}#"")  // should never be blank ...
		CREATE RECORD:C68([EMAIL_RECIPIENTS:104])
		[EMAIL_RECIPIENTS:104]DiaryID:1:=$_t_DiaryCode  // 26/06/02 pb
		[EMAIL_RECIPIENTS:104]Classification:2:="To"
		[EMAIL_RECIPIENTS:104]Email_Address:3:=$_at_Mobiles{$_l_Index}
		[EMAIL_RECIPIENTS:104]ContactID:4:=$_at_ContactIDS{$_l_Index}
		$_t_Result:=SMS_SendMsg2($_t_SMSAccountName; $_t_SMSPassword; $_at_Mobiles{$_l_Index}; $_t_Message; $_t_Flash; $_t_SenderID)
		If ($_t_Result#"")
			$_l_CharacterPosition:=Position:C15("Result: "; $_t_Result)
			If ($_l_CharacterPosition<1)
				[EMAIL_RECIPIENTS:104]Result:5:="ERROR: "+$_t_Result  // TCP or OT error
				$_bo_Error:=True:C214
			Else 
				$_t_Result:=Substring:C12($_t_Result; $_l_CharacterPosition+8)
				Case of 
						//         : ($_t_Result="Errors@")
					: ($_t_Result="Error@")  // 01/07/02 pb
						SMS_AddMessageLog($_at_Mobiles{$_l_Index}; $_t_Message; $_t_user; $_l_CreditsUsed; $_t_SenderID; $_t_Result)  // 14/01/03
						$_bo_Error:=True:C214
						$_l_CharacterPosition:=Position:C15("["; $_t_Result)
						If ($_l_CharacterPosition>0)
							$_t_Result:=Substring:C12($_t_Result; $_l_CharacterPosition+1)
							$_l_CharacterPosition:=Position:C15("]"; $_t_Result)
							If ($_l_CharacterPosition>0)
								$_t_Result:=Substring:C12($_t_Result; 1; $_l_CharacterPosition-1)
								$_l_CharacterPosition:=Position:C15(":"; $_t_Result)
								$_t_Result:=Substring:C12($_t_Result; $_l_CharacterPosition+1)  // this should yield the error message
								[EMAIL_RECIPIENTS:104]Result:5:=$_t_Result
							Else   // this should never happen
								[EMAIL_RECIPIENTS:104]Result:5:="ERROR: Unknown error; message not sent."  // some other error
							End if 
						Else 
							Case of 
								: (Position:C15("out of credit"; $_t_Result)>0)
									[EMAIL_RECIPIENTS:104]Result:5:="ERROR: Out of credits with SMSRelay; message not sent."
									//                  SMS_LoadVariables
									SMS_Credits:=0
									SMS_l_MessagesAvailable:=0
									SMS_SaveVariables
								Else 
									[EMAIL_RECIPIENTS:104]Result:5:="Unknown error; message not sent"  // some other error
							End case 
						End if 
						
					: ($_t_Result="OK@")
						//         TRACE
						[EMAIL_RECIPIENTS:104]Result:5:="Message sent OK"
						iSMS_Msgs_Sent:=iSMS_Msgs_Sent+1
						$_l_CharacterPosition2:=Position:C15("account-charge:"; $_t_Result)  // 20/12/02
						If ($_l_CharacterPosition2>0)
							$_l_CreditsUsed:=Num:C11(Substring:C12($_t_Result; $_l_CharacterPosition2+15; 5))
							SMS_rCreditsUsed:=SMS_rCreditsUsed+$_l_CreditsUsed
							SMS_Credits:=SMS_Credits-$_l_CreditsUsed
						End if 
						
						$_l_CharacterPosition2:=Position:C15("Account-Value: "; $_t_Result)
						If ($_l_CharacterPosition2>0)
							$_t_Credits:=Substring:C12($_t_Result; $_l_CharacterPosition2+15)
							$_l_CharacterPosition2:=Position:C15(Char:C90(10); $_t_Credits)
							If ($_l_CharacterPosition2>0)
								$_t_Credits:=Substring:C12($_t_Credits; 1; $_l_CharacterPosition2-1)
							End if 
							lCredits:=Num:C11($_t_Credits)
						End if 
						
						SMS_AddMessageLog($_at_Mobiles{$_l_Index}; $_t_Message; $_t_user; $_l_CreditsUsed; $_t_SenderID; $_t_Result)  // 07/01/03
						Case of 
							: ((SMS_iCreditsLowLevel>SMS_Credits) & (SMS_LowLevelWarningSent=False:C215) & (SMS_ReminderPhone#""))  // 7/01/03 pb
								$_t_SmsText:="Message from Daybook:"+Char:C90(13)+"You are running low on SMS message credits. Currently you have "+String:C10(SMS_Credits)+" credits available."
								$_t_Result:=SMS_SendMsg2(SMS_AccountName; SMS_Password; SMS_ReminderPhone; $_t_SmsText; False:C215; "DayBook")
								$_l_CharacterPosition:=Position:C15("Result: "; $_t_Result)
								If ($_l_CharacterPosition<1)
									[EMAIL_RECIPIENTS:104]Result:5:="ERROR: "+$_t_Result  // TCP or OT error
									$_bo_Error:=True:C214
								Else 
									$_t_Result:=Substring:C12($_t_Result; $_l_CharacterPosition+8)
									If ($_t_Result="OK@")
										$_l_CharacterPosition2:=Position:C15("account-charge:"; $_t_Result)  // 20/12/02
										If ($_l_CharacterPosition2>0)
											$_l_CreditsUsed:=Num:C11(Substring:C12($_t_Result; $_l_CharacterPosition2+15; 5))
										Else 
											$_l_CreditsUsed:=1
										End if 
										SMS_AddMessageLog(SMS_ReminderPhone; $_t_SmsText; "Daybook"; $_l_CreditsUsed; "Daybook"; $_t_Result)  // 07/01/03
										SMS_LowLevelWarningSent:=True:C214
									End if 
								End if 
								
							: ((SMS_iCreditsLowLevel<SMS_Credits) & (SMS_LowLevelWarningSent=True:C214))  // 7/01/03 pb
								SMS_LowLevelWarningSent:=False:C215
						End case 
						
					Else 
						//BEEP
						//BEEP
						//BEEP
						//TRACE
						$_t_ErrorMessage:="Error in SMS_SendViaRelay (1)"
				End case 
			End if 
		End if   // $_at_Mobiles{$_l_Index}#""
		
		If (($_bo_Error) & ($_bo_HasDiaryEntry=False:C215))
			// Create main Diary entry
			CREATE RECORD:C68([DIARY:12])
			DiarySetCode
			[DIARY:12]Date_Do_From:4:=$_d_DateDoFrom
			[DIARY:12]Date_Done_From:5:=Current date:C33(*)
			[DIARY:12]Time_Do_From:6:=$_ti_TimeDoFrom
			[DIARY:12]Time_Done_From:7:=Current time:C178(*)
			[DIARY:12]Person:8:=$_t_user  // user initials
			[DIARY:12]Action_Details:10:="SMS: "+$_t_Message
			[DIARY:12]Document_Code:15:="SMS"
			DB_SaveRecord(->[DIARY:12])
			AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
			[EMAIL_RECIPIENTS:104]DiaryID:1:=[DIARY:12]Diary_Code:3  // 26/06/02 pb
		End if 
		
		If (($_bo_HasDiaryEntry=True:C214) | (($_bo_Error) & ($_bo_HasDiaryEntry=False:C215)))
			DB_SaveRecord(->[EMAIL_RECIPIENTS:104])
		End if 
	End if 
End for 
UNLOAD RECORD:C212([EMAIL_RECIPIENTS:104])
UNLOAD RECORD:C212([DIARY:12])
UNLOAD RECORD:C212([SMS_Log:124])
$0:=True:C214
ERR_MethodTrackerReturn("ProcessService_SendSMS"; $_t_oldMethodName)