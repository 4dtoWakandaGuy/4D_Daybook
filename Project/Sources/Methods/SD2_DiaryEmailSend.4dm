//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryEmailSend
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SD2_DiaryEmailSend
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	//C_UNKNOWN(cSave)
	//C_UNKNOWN(vCreate)
	//C_UNKNOWN(vEdit)
	//C_UNKNOWN(vLetterCode)
	//C_UNKNOWN(vPerson)
	//C_UNKNOWN(xCancel)
	//C_UNKNOWN(xnext)
	//C_UNKNOWN(xOK)
	//ARRAY LONGINT(WS_al_EmailID;0)
	ARRAY TEXT:C222($_at_ContactID; 0)
	ARRAY TEXT:C222($_at_EmailAddresses; 0)
	ARRAY TEXT:C222($_at_EmailType; 0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	C_BOOLEAN:C305($_bo_Save; $_bo_SendEmail; $0; $1; $2; $3; DB_bo_RecordModified; $_bo_Confirm; $_bo_Save; $_bo_SendEmail; $1)
	C_BOOLEAN:C305($2; $3; DB_bo_RecordModified)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Process; cSave; vCreate; vEdit; xCancel; xnext; xOK; $_l_BlankRow; $_l_CharacterPosition; $_l_Process)
	C_LONGINT:C283(SD2_l_SaveRecord)
	C_TEXT:C284($_t_EmailID; $_t_EmailSignature; $_t_EmailText; $_t_InsertText; $_t_oldMethodName; DOC_t_DocumentCode; EMAIL_t_SendCalledFrom; vLetterCode; vPerson; WS_t_EmailAddress; <>eLetAct)
	C_TEXT:C284($_t_EmailID; $_t_EmailSignature; $_t_EmailText; $_t_InsertText; $_t_oldMethodName; DOC_t_DocumentCode; EMAIL_t_SendCalledFrom; WS_t_EmailName)
	C_TIME:C306($_ti_Time)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryEmailSend")
//Diary_PrintS - Save

$0:=True:C214
If (Count parameters:C259>0)
	$_bo_Save:=$1
Else 
	$_bo_Save:=False:C215
End if 

If (Count parameters:C259>1)
	$_bo_Confirm:=$2
Else 
	$_bo_Confirm:=True:C214
End if 
READ WRITE:C146([EMAIL_ATTACHMENTS:103])

//C_TEXT($Heading)


//SETEMAILFORMOBJECTS

If (SD2_l_SaveRecord>0)
	
	[DIARY:12]Document_Heading:32:=[DIARY:12]Email_Subject:40
	[DOCUMENTS:7]Text:3:=[DIARY:12]Email_Text:42
	DB_SaveRecord(->[DOCUMENTS:7])
	RELATE ONE:C42([DIARY:12]Document_Code:15)
	vLetterCode:=[DIARY:12]Document_Code:15
	Case of 
		: (Records in selection:C76([DOCUMENTS:7])=0)
			CREATE RECORD:C68([DOCUMENTS:7])
			[DOCUMENTS:7]Document_Code:1:=vLetterCode
			[DOCUMENTS:7]Heading:2:=[DIARY:12]Email_Subject:40
			[DOCUMENTS:7]Export:6:=Export_Stamp
			[DOCUMENTS:7]Document_Class:14:=Text Email
		Else 
			If ((vEdit=1) & (cSave>0) & (vCreate=1))
				CREATE RECORD:C68([DOCUMENTS:7])
				[DOCUMENTS:7]Document_Code:1:=vLetterCode+"/"+DOC_t_DocumentCode
				[DOCUMENTS:7]Heading:2:=[DIARY:12]Email_Subject:40
				[DOCUMENTS:7]Export:6:=Export_Stamp
				[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
				[DOCUMENTS:7]Document_Class:14:=Text Email
			End if 
	End case 
	If (DB_bo_RecordModified)
		[DOCUMENTS:7]Export:6:=Export_Stamp
	End if 
	[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
	[DOCUMENTS:7]Text:3:=[DIARY:12]Email_Text:42
	[DOCUMENTS:7]Person:10:=[DIARY:12]Person:8
	DB_SaveRecord(->[DOCUMENTS:7])
	//now need to check the recipients are saved
	READ WRITE:C146([EMAIL_RECIPIENTS:104])
	If ($_bo_Save)
		QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1=[DIARY:12]Diary_Code:3)
		SELECTION TO ARRAY:C260([EMAIL_RECIPIENTS:104]Classification:2; $_at_EmailType; [EMAIL_RECIPIENTS:104]Email_Address:3; $_at_EmailAddresses; [EMAIL_RECIPIENTS:104]ContactID:4; $_at_ContactID)
		//If (Size of array(SD2_at_EmailType)>Size of array($_at_EmailType))
		If (Size of array:C274(SD2_at_EmailType)<Size of array:C274($_at_EmailType))
			
			DELETE SELECTION:C66([EMAIL_RECIPIENTS:104])
			ARRAY TO SELECTION:C261(SD2_at_EmailType; [EMAIL_RECIPIENTS:104]Classification:2; SD2_at_EmailAddresses; [EMAIL_RECIPIENTS:104]Email_Address:3; SD2_at_ContactIDs; [EMAIL_RECIPIENTS:104]ContactID:4)
		Else 
			ARRAY TO SELECTION:C261(SD2_at_EmailType; [EMAIL_RECIPIENTS:104]Classification:2; SD2_at_EmailAddresses; [EMAIL_RECIPIENTS:104]Email_Address:3; SD2_at_ContactIDs; [EMAIL_RECIPIENTS:104]ContactID:4)
		End if 
		DB_lockFile(->[EMAIL_RECIPIENTS:104])
		APPLY TO SELECTION:C70([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1:=[DIARY:12]Diary_Code:3)
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_RECIPIENTS:104]))
		UNLOAD RECORD:C212([EMAIL_RECIPIENTS:104])
		READ ONLY:C145([EMAIL_RECIPIENTS:104])
		If ([DIARY:12]Email_ID:41=0)
			[DIARY:12]Email_ID:41:=-(AA_GetNextIDinMethod(->[DIARY:12]Email_ID:41))  //Give a negative value until this email is sent
			DB_SaveRecord(->[DIARY:12])
			AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		End if 
		//Here we can also set the diary persons...
		EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 1; [DIARY:12]Diary_Code:3; [DIARY:12]Email_ID:41)
		
		
		
	End if 
	
	If ([DIARY:12]Email_ID:41<=0) & (Size of array:C274(SD2_at_EmailType)>0)
		If ($_bo_Confirm)
			If (Count parameters:C259>=2)
				xCancel:=0
				xnext:=0
				xOK:=0
				Gen_Confirm3("This eMail has not been sent. Do you wish to send it now?"; "Yes"; "No"; "Stop")
				OK:=xOK
				If (xnext=1)
					$0:=False:C215
				Else 
					$0:=True:C214
				End if 
			Else 
				Gen_Confirm("This eMail has not been sent. Do you wish to send it now?"; "Yes"; "No")
				
			End if 
			
		Else 
			$0:=True:C214
			OK:=1
		End if 
		If (OK=1)
			Repeat   //Just a trap to make sure the email is not sent to blank addresses
				$_l_BlankRow:=Find in array:C230(SD2_at_EmailAddresses; "")
				If ($_l_BlankRow>0)
					DELETE FROM ARRAY:C228(SD2_at_EmailAddresses; $_l_BlankRow)
					DELETE FROM ARRAY:C228(SD2_at_EmailType; $_l_BlankRow)
					DELETE FROM ARRAY:C228(SD2_at_EmailName; $_l_BlankRow)
					
				End if 
			Until ($_l_BlankRow<0)
			If (Count parameters:C259>=3)
				$_bo_SendEmail:=$3
			Else 
				$_bo_SendEmail:=True:C214
			End if 
			//If (Size of array(SD2_at_EmailName)>0)
			//If ($_bo_SendEmail)
			If ($_bo_SendEmail)  //kmw 26/09/08, do check for send email PRIOR to check for valid email addresses as should still be able to save as draft (alternative was to change the message in this situtation to "sorry can't save as draft because no valid email addresses)
				If (Size of array:C274(SD2_at_EmailName)>0)  //kmw 26/09/08, do check for send email PRIOR to check for valid email addresses as should still be able to save as draft (alternative was to change the message in this situtation to "sorry can't save as draft because no valid email addresses)
					
					
					
					$_ti_Time:=Current time:C178(*)
					EMAIL_t_SendCalledFrom:="SD2_DiaryEmailSend"
					$_t_EmailID:=Email_Send(->SD2_at_EmailType; ->SD2_at_EmailName; ->SD2_at_EmailAddresses; vPerson; [DIARY:12]Email_From:38; [DIARY:12]Email_From:38; [DIARY:12]Email_Subject:40; ->WS_at_AttachmentsPath; ->[DIARY:12]Email_Text:42; True:C214)
					If ($_t_EmailID#"")
						If ([DIARY:12]Email_ID:41=0)
							If ([DIARY:12]Action_Code:9=<>eLetAct)
								[DIARY:12]Done:14:=True:C214
								[DIARY:12]Date_Done_From:5:=Current date:C33(*)
								[DIARY:12]Date_Done_To:34:=Current date:C33(*)
								[DIARY:12]Time_Done_From:7:=$_ti_Time
								[DIARY:12]Time_Done_To:36:=$_ti_Time
								DB_SaveRecord(->[DIARY:12])
							End if 
							[DIARY:12]Email_ID:41:=AA_GetNextIDinMethod(->[DIARY:12]Email_ID:41)
						Else 
							[DIARY:12]Email_ID:41:=Abs:C99([DIARY:12]Email_ID:41)
							If ([DIARY:12]Action_Code:9=<>eLetAct)
								[DIARY:12]Done:14:=True:C214
								[DIARY:12]Date_Done_From:5:=Current date:C33(*)
								[DIARY:12]Date_Done_To:34:=Current date:C33(*)
								[DIARY:12]Time_Done_From:7:=$_ti_Time
								[DIARY:12]Time_Done_To:36:=$_ti_Time
								DB_SaveRecord(->[DIARY:12])
								
							End if 
							
						End if 
					End if 
					If ([DOCUMENTS:7]Text:3#"")
						[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
						$_t_InsertText:=Char:C90(13)+"----------------------"+Char:C90(13)+Char:C90(13)
						$_t_EmailSignature:=GetEmailSignature
						$_l_CharacterPosition:=Position:C15(Char:C90(13)+$_t_InsertText+Char:C90(13)+$_t_EmailSignature; [DIARY:12]Email_Text:42)
						If ($_l_CharacterPosition>0)
							$_t_EmailText:=Replace string:C233([DOCUMENTS:7]Text:3; Char:C90(13)+$_t_InsertText+Char:C90(13)+$_t_EmailSignature; "")
						Else 
							$_t_EmailText:=[DOCUMENTS:7]Text:3
						End if 
						
						If ([DIARY:12]Action_Details:10="")
							[DIARY:12]Action_Details:10:=$_t_EmailText
						Else 
							[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+Char:C90(13)+"Email Text"+Char:C90(13)+$_t_EmailText
						End if 
					End if 
					
					If (Records in selection:C76([EMAIL_ATTACHMENTS:103])=0)
						EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 2; [DIARY:12]Diary_Code:3; [DIARY:12]Email_ID:41)
						
					Else 
						EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 3; [DIARY:12]Diary_Code:3; [DIARY:12]Email_ID:41)
						DB_lockFile(->[EMAIL_ATTACHMENTS:103])
						APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2:=[DIARY:12]Email_ID:41)
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
					End if 
					DB_SaveRecord(->[DIARY:12])
					AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
					UNLOAD RECORD:C212([EMAIL_ATTACHMENTS:103])
					READ ONLY:C145([EMAIL_ATTACHMENTS:103])
					QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2=[DIARY:12]Email_ID:41)
					If (Records in selection:C76([EMAIL_ATTACHMENTS:103])>0)
						If ([DIARY:12]Email_ID:41>0)  //Fri, Feb 3, 2006 bwalia: added
							If (In transaction:C397)  //Fri, Feb 3, 2006 bwalia: added- not very good as it unloads records...
								
								//VALIDATE TRANSACTION
								//End if
								//ok-looking at the above it was added o stop an error in DS_docsto server..problem..records get unloads..so I am going to make DS_docstoserver wait till the current Process_Ends
								
							Else 
								$_l_Process:=New process:C317("DS_DocstoServer"; 128000; "Moving Documents"; [DIARY:12]Email_ID:41; Current process:C322; *)  //changed so only one instance of of move documents - v631v120o (this should be ok, as it waits until this current Process_Ends before running so it will get all the attchemnts crteated....only needs one instance of the doc mover process which waits untl the ned and moves them all).
								
								
							End if 
						End if 
					End if 
				Else   //kmw 26/09/08, do check for send email PRIOR to check for valid email addresses as should still be able to save as draft (alternative was to change the message in this situtation to "sorry can't save as draft because no valid email addresses)
					
					
					Gen_Alert("This email has no valid recipients so cannot be sent!")  //kmw 26/09/08, do check for send email PRIOR to check for valid email addresses as should still be able to save as draft (alternative was to change the message in this situtation to "sorry can't save as draft because no valid email addresses)
					
					
				End if   //kmw 26/09/08, do check for send email PRIOR to check for valid email addresses as should still be able to save as draft (alternative was to change the message in this situtation to "sorry can't save as draft because no valid email addresses)
				
				
			Else   //kmw 26/09/08, do check for send email PRIOR to check for valid email addresses as should still be able to save as draft (alternative was to change the message in this situtation to "sorry can't save as draft because no valid email addresses)
				
				If ([DOCUMENTS:7]Text:3#"")
					[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
					$_t_InsertText:=Char:C90(13)+"----------------------"+Char:C90(13)+Char:C90(13)
					$_t_EmailSignature:=GetEmailSignature
					$_l_CharacterPosition:=Position:C15(Char:C90(13)+$_t_InsertText+Char:C90(13)+$_t_EmailSignature; [DIARY:12]Email_Text:42)
					If ($_l_CharacterPosition>0)
						$_t_EmailText:=Replace string:C233([DOCUMENTS:7]Text:3; Char:C90(13)+$_t_InsertText+Char:C90(13)+$_t_EmailSignature; "")
					Else 
						$_t_EmailText:=[DOCUMENTS:7]Text:3
					End if 
					
					If ([DIARY:12]Action_Details:10="")
						[DIARY:12]Action_Details:10:=$_t_EmailText
					Else 
						[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+Char:C90(13)+"Email Text"+Char:C90(13)+$_t_EmailText
					End if 
				End if 
				If (Records in selection:C76([EMAIL_ATTACHMENTS:103])=0)
					EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 2; [DIARY:12]Diary_Code:3; [DIARY:12]Email_ID:41)
					
				Else 
					EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 3; [DIARY:12]Diary_Code:3; [DIARY:12]Email_ID:41)
					DB_lockFile(->[EMAIL_ATTACHMENTS:103])
					APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2:=[DIARY:12]Email_ID:41)
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
				End if 
				
				DB_SaveRecord(->[DIARY:12])
				AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
				UNLOAD RECORD:C212([EMAIL_ATTACHMENTS:103])
				READ ONLY:C145([EMAIL_ATTACHMENTS:103])
				
			End if 
		Else 
			OK:=1
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SD2_DiaryEmailSend"; $_t_oldMethodName)
