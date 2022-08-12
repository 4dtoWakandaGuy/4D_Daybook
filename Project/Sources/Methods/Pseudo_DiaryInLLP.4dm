//%attributes = {}
If (False:C215)
	//Project Method Name:      Pseudo_DiaryInLLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/06/2010 18:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(WR PICTURE TO AREA)
	//ARRAY LONGINT(aEmail_FileNo;0)
	//ARRAY LONGINT(WS_al_EmailID;0)
	//ARRAY TEXT(EMAIL_at_MailTypes;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	//ARRAY TEXT(WT_at_EmailAttachments;0)
	//ARRAY TEXT(WT_at_EMailRecipients;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; EMAIL_bo_DonotChangeSubject; EMAIL_bo_MailListBuilt; PAL_bo_ButtonSubFunction)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Clash; $_l_EmailRow; $_l_Event; $_l_index; $_l_OK; ATTACH_COUNT; BgetTemplate; cSave; DB_l_ButtonClickedFunction; DOC_l_CallEvent)
	C_LONGINT:C283(EmailChoiceProc; iCancel; iOK; REICIPIENT_COUNT; vCreate; vEdit; Write; WS_l_ContactElement; WS_l_SelectedEmailName)
	C_TEXT:C284(<>eLetAct; <>PER_t_CurrentUserName; <>SYS_t_4DWriteType; $_t_ContactCode; $_t_EmailAddress; $_t_oldMethodName; $_t_PalletButtonName; DOC_t_DocumentCode; DOC_T_EmailFromcom; EMAIL_t_Attachment; EMAIL_t_AttachmentsLabel)
	C_TEXT:C284(EMAIL_t_BodyText; EMAIL_t_EmailBody; EMAIL_T_EmailSignature; EMAIL_t_EmailTo; EMAIL_t_EmailType; EMAIL_t_FooterText; EMAIL_t_InsText; EMAIL_t_RecipientsLabel; EMAIL_t_Subject; PAL_BUTTON; vButtDisDry)
	C_TEXT:C284(vCompName; vContName; vFrom; vHeading; vPerson; vTel; vWT_EmailSenderName; WIN_t_CurrentInputForm; WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Pseudo_DiaryInLLP")
$_l_Event:=Form event code:C388
//this method mimics the behaviour of Diary_In LLP it is used by
//[USER];"Psuedo_diary_inEmail"
//LP Diary_InL LP
// the difference here is that we are not creating a NEW diary entry


EMAIL_t_InsText:=""

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DOCUMENTS:7]); WIN_t_CurrentInputForm)
		ARRAY TEXT:C222(EMAIL_at_MailTypes; 3)
		EMAIL_at_MailTypes{1}:="To"
		EMAIL_at_MailTypes{2}:="CC"
		EMAIL_at_MailTypes{3}:="Bcc"
		EMAIL_at_MailTypes:=1
		WS_l_SelectedEmailName:=0
		WS_l_ContactElement:=0
		If (WIN_t_CurrentInputForm="Diary_InEmail")
			WS_AutoscreenSize(1; 355; 597; Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm)
		Else 
			WS_AutoscreenSize(1; 0; 700; Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm)
		End if 
		//```````````````
		OBJECT SET ENTERABLE:C238([DIARY:12]Company_Code:1; False:C215)
		OBJECT SET ENTERABLE:C238([DIARY:12]Contact_Code:2; False:C215)
		OBJECT SET ENTERABLE:C238([DIARY:12]Person:8; False:C215)
		If (Not:C34(EMAIL_bo_MailListBuilt))
			ARRAY TEXT:C222(SD2_at_EmailType; 0)
			ARRAY TEXT:C222(WS_at_Attachments; 0)
			ARRAY TEXT:C222(WS_at_AttachmentsPath; 0)
			ARRAY TEXT:C222(SD3_at_DocDiaryCode; 0)
			ARRAY LONGINT:C221(WS_al_EmailID; 0)
			ARRAY TEXT:C222(SD2_at_EmailAddresses; 0)
			ARRAY TEXT:C222(SD2_at_EmailName; 0)
			ARRAY TEXT:C222(SD2_at_ContactIDs; 0)
			
		End if 
		
		vDate:=[DIARY:12]Date_Do_From:4
		Letter_Date
		OBJECT SET ENTERABLE:C238([DIARY:12]Document_Code:15; False:C215)
		If ([DIARY:12]Action_Code:9="")
			OBJECT SET TITLE:C194(BgetTemplate; "Select Template")  //for template button
			ARRAY TEXT:C222(WT_at_EMailRecipients; 0)
			ARRAY TEXT:C222(WT_at_EmailAttachments; 2)
			If (Not:C34(EMAIL_bo_MailListBuilt))
				[DIARY:12]Email_From:38:=GetEmailSender
			End if 
			DOC_T_EmailFromcom:=<>PER_t_CurrentUserName+"<"+[DIARY:12]Email_From:38+">"
			If ([DIARY:12]Document_Code:15#"")
				If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15)
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
				End if 
				//`````````
				If ([DOCUMENTS:7]Document_Class:14=Text Email) | (Records in selection:C76([DOCUMENTS:7])=0)  //it is a letter)
					EMAIL_t_RecipientsLabel:="Recipients"
					EMAIL_t_AttachmentsLabel:="Attachments"
					OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; True:C214)
					RELATE ONE:C42([DIARY:12]Document_Code:15)
					EMAIL_t_EmailBody:=[DOCUMENTS:7]Text:3
					If (Not:C34(EMAIL_bo_MailListBuilt))
						[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
						EMAIL_t_BodyText:=[DOCUMENTS:7]Text:3
						QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1=[DIARY:12]Diary_Code:3)
						SELECTION TO ARRAY:C260([EMAIL_RECIPIENTS:104]Classification:2; SD2_at_EmailType; [EMAIL_RECIPIENTS:104]Email_Address:3; SD2_at_EmailAddresses; [EMAIL_RECIPIENTS:104]ContactID:4; SD2_at_ContactIDs)
						$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
						If ([DIARY:12]Email_ID:41=0)
							QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
						Else 
							//this is needed so that where a group of diary items relate to a single email
							//there is only one group of records containing the attachments
							QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2=[DIARY:12]Email_ID:41)
						End if 
						SELECTION TO ARRAY:C260([EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Email_ID:2; WS_al_EmailID; [EMAIL_ATTACHMENTS:103]DiaryID:1; SD3_at_DocDiaryCode; [EMAIL_ATTACHMENTS:103]FileNo:5; aEmail_FileNo)
						ARRAY TEXT:C222(SD2_at_EmailName; Size of array:C274(SD2_at_ContactIDs))
						For ($_l_index; 1; Size of array:C274(SD2_at_EmailType))
							If (SD2_at_ContactIDs{$_l_index}#"")
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactIDs{$_l_index})
								SD2_at_EmailName{$_l_index}:=[CONTACTS:1]Contact_Name:31
							End if 
						End for 
						
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
					Else 
						OBJECT SET ENTERABLE:C238(*; "ov_EMAIL_Subject_Text"; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Company_Code:1; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Contact_Code:2; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Person:8; False:C215)
						OBJECT SET VISIBLE:C603(BgetTemplate; False:C215)
						OBJECT SET VISIBLE:C603(vCompName; False:C215)
						OBJECT SET VISIBLE:C603(vContName; False:C215)
						OBJECT SET VISIBLE:C603(vTel; False:C215)
						OBJECT SET VISIBLE:C603(vPerson; False:C215)
						OBJECT SET VISIBLE:C603([COMPANIES:2]Address_Line_two:4; False:C215)
						OBJECT SET VISIBLE:C603(*; "text2"; False:C215)
						OBJECT SET VISIBLE:C603(*; "text1"; False:C215)
						OBJECT SET VISIBLE:C603(*; "text3"; False:C215)
						OBJECT SET VISIBLE:C603(*; "text5"; False:C215)
						OBJECT SET VISIBLE:C603(*; "text6"; False:C215)
						OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; True:C214)
						EMAIL_t_AttachmentsLabel:="Attachments"
						OBJECT SET VISIBLE:C603(EMAIL_t_RecipientsLabel; True:C214)
						EMAIL_t_RecipientsLabel:="Recipients"
						FORM GOTO PAGE:C247(2)
						
					End if 
					[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
					EMAIL_t_BodyText:=[DOCUMENTS:7]Text:3
					If ([DIARY:12]Email_Subject:40#"")  //BSW 1/07/02 `NG 28/3/2003
						EMAIL_t_Subject:=[DIARY:12]Email_Subject:40
					Else 
						[DIARY:12]Email_Subject:40:=[DOCUMENTS:7]Heading:2
						EMAIL_t_Subject:=[DOCUMENTS:7]Heading:2
					End if 
					[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
					cSave:=1
					vCreate:=0
				Else 
					//it is a template-so copy it first
					If ([DOCUMENTS:7]Document_Class:14=Text Email Template)
						DUPLICATE RECORD:C225([DOCUMENTS:7])
						Let_No("E")
						Set_DocumentCode(2; "E"; DOC_t_DocumentCode)
						[DOCUMENTS:7]Document_Class:14:=Text Email
						OBJECT SET TITLE:C194(BgetTemplate; "Select Template")  //for template button
						EMAIL_t_RecipientsLabel:="Recipients"
						EMAIL_t_AttachmentsLabel:="Attachments"
						OBJECT SET VISIBLE:C603(EMAIL_t_RecipientsLabel; True:C214)
						ARRAY TEXT:C222(WT_at_EmailAttachments; 0)
						OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; True:C214)
						EMAIL_t_EmailBody:=[DOCUMENTS:7]Text:3
						If (EMAIL_t_EmailBody="")
							EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+[DIARY:12]Email_From:38+Char:C90(13)+Char:C90(13)
							EMAIL_T_EmailSignature:=GetEmailSignature
							//            EMAIL_t_EmailBody:=Char(13)+EMAIL_T_EmailSignature  `EMAIL_t_InsText+Char(13)+
							EMAIL_t_EmailBody:=Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  //26/06/02 pb
							
						End if 
						[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
						EMAIL_t_BodyText:=EMAIL_t_EmailBody
						
						If (Not:C34(EMAIL_bo_MailListBuilt))
							QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1=[DIARY:12]Diary_Code:3)
							SELECTION TO ARRAY:C260([EMAIL_RECIPIENTS:104]Classification:2; SD2_at_EmailType; [EMAIL_RECIPIENTS:104]Email_Address:3; SD2_at_EmailAddresses; [EMAIL_RECIPIENTS:104]ContactID:4; SD2_at_ContactIDs)
							$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
							If ([DIARY:12]Email_ID:41=0)
								QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
							Else 
								//this is needed so that where a group of diary items relate to a single email
								//there is only one group of records containing the attachments
								QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2=[DIARY:12]Email_ID:41)
							End if 
							SELECTION TO ARRAY:C260([EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Email_ID:2; WS_al_EmailID; [EMAIL_ATTACHMENTS:103]DiaryID:1; SD3_at_DocDiaryCode; [EMAIL_ATTACHMENTS:103]FileNo:5; aEmail_FileNo)
							ARRAY TEXT:C222(SD2_at_EmailName; Size of array:C274(SD2_at_ContactIDs))
							For ($_l_index; 1; Size of array:C274(SD2_at_EmailType))
								If (SD2_at_ContactIDs{$_l_index}#"")
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactIDs{$_l_index})
									SD2_at_EmailName{$_l_index}:=[CONTACTS:1]Contact_Name:31
								End if 
							End for 
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
						End if 
						[DIARY:12]Email_From:38:=GetEmailSender
						EMAIL_t_FooterText:=""
						EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+[DIARY:12]Email_From:38+Char:C90(13)+Char:C90(13)
						EMAIL_T_EmailSignature:=GetEmailSignature
						//           EMAIL_t_EmailBody:=Char(13)+EMAIL_T_EmailSignature  `EMAIL_t_InsText+Char(13)+
						EMAIL_t_EmailBody:=Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  //26/06/02 pb
						[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
						EMAIL_t_BodyText:=EMAIL_t_EmailBody
						If ([DIARY:12]Email_Subject:40#"")  //BSW 6/08/02
							EMAIL_t_Subject:=[DIARY:12]Email_Subject:40
						Else 
							[DIARY:12]Email_Subject:40:=[DOCUMENTS:7]Heading:2
							EMAIL_t_Subject:=[DOCUMENTS:7]Heading:2
						End if 
						
						[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
						cSave:=1
						vCreate:=0
					End if 
					
				End if 
				//````````
			Else 
				EMAIL_t_RecipientsLabel:="Recipients"
				EMAIL_t_AttachmentsLabel:="Attachments"
				EMAIL_t_FooterText:=""
				EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+[DIARY:12]Email_From:38+Char:C90(13)+Char:C90(13)
				EMAIL_T_EmailSignature:=GetEmailSignature
				//        EMAIL_t_EmailBody:=EMAIL_T_EmailSignature  `EMAIL_t_InsText+Char(13)+
				EMAIL_t_EmailBody:=Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  // 26/06/02 pb + bsw
				[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
				EMAIL_t_BodyText:=EMAIL_t_EmailBody
				Let_No("E")
				
				Repeat 
					IDLE:C311
					SET QUERY DESTINATION:C396(3; $_l_Clash)
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
					SET QUERY DESTINATION:C396(0)
					If ($_l_Clash>0)
						Let_No("E")
						//DOC_t_DocumentCode:="L"+DOC_t_DocumentCode
					End if 
					DelayTicks(1)
				Until ($_l_Clash=0)
				
				[DIARY:12]Document_Code:15:="E"+DOC_t_DocumentCode
				//C_TEXT(◊eLetAct) This is defined in UserDetailsBLOB
				[DIARY:12]Action_Code:9:=<>eLetAct
				If (<>eLetAct="")
					[DIARY:12]Action_Code:9:="Email"
				End if 
				
				Diary_InLLPHead
				OBJECT SET VISIBLE:C603(WT_at_EMailRecipients; True:C214)
				EMAIL_t_RecipientsLabel:="Recipients"
				EMAIL_t_AttachmentsLabel:="Attachments"
				OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; True:C214)
			End if 
		Else   // action code set
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[DIARY:12]Person:8)
			DOC_T_EmailFromcom:=[PERSONNEL:11]Name:2+"<"+[DIARY:12]Email_From:38+">"
			UNLOAD RECORD:C212([PERSONNEL:11])
			
			DOC_t_DocumentCode:=[DIARY:12]Document_Code:15
			If ([DIARY:12]Document_Code:15#"")  //it is not a new document
				If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15)
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
				End if 
				If ([DOCUMENTS:7]Document_Class:14=Text Email) | (Records in selection:C76([DOCUMENTS:7])=0)  //it is a letter)
					//BUTTON TEXT(BgetTemplate;"Modify eMail")   `BSW 6/08/02for template button
					EMAIL_t_RecipientsLabel:="Recipients"
					OBJECT SET VISIBLE:C603(WT_at_EmailAttachments; False:C215)
					EMAIL_t_AttachmentsLabel:="Attachments"
					OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; True:C214)
					RELATE ONE:C42([DIARY:12]Document_Code:15)
					EMAIL_t_EmailBody:=[DOCUMENTS:7]Text:3
					If (EMAIL_t_EmailBody="")
						//new record
						EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+[DIARY:12]Email_From:38+Char:C90(13)+Char:C90(13)
						EMAIL_T_EmailSignature:=GetEmailSignature
						//           EMAIL_t_EmailBody:=Char(13)+EMAIL_T_EmailSignature  `EMAIL_t_InsText+Char(13)+
						EMAIL_t_EmailBody:=Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  //26/06/02 pb
						[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
						EMAIL_t_BodyText:=EMAIL_t_EmailBody
					End if 
					
					If (Not:C34(EMAIL_bo_MailListBuilt))
						[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
						EMAIL_t_BodyText:=[DOCUMENTS:7]Text:3
						QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1=[DIARY:12]Diary_Code:3)
						SELECTION TO ARRAY:C260([EMAIL_RECIPIENTS:104]Classification:2; SD2_at_EmailType; [EMAIL_RECIPIENTS:104]Email_Address:3; SD2_at_EmailAddresses; [EMAIL_RECIPIENTS:104]ContactID:4; SD2_at_ContactIDs)
						$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
						If ([DIARY:12]Email_ID:41=0)
							QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
						Else 
							//this is needed so that where a group of diary items relate to a single email
							//there is only one group of records containing the attachments
							QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2=[DIARY:12]Email_ID:41)
						End if 
						SELECTION TO ARRAY:C260([EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Email_ID:2; WS_al_EmailID; [EMAIL_ATTACHMENTS:103]DiaryID:1; SD3_at_DocDiaryCode; [EMAIL_ATTACHMENTS:103]FileNo:5; aEmail_FileNo)
						ARRAY TEXT:C222(SD2_at_EmailName; Size of array:C274(SD2_at_ContactIDs))
						For ($_l_index; 1; Size of array:C274(SD2_at_EmailType))
							If (SD2_at_ContactIDs{$_l_index}#"")
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactIDs{$_l_index})
								SD2_at_EmailName{$_l_index}:=[CONTACTS:1]Contact_Name:31
							End if 
						End for 
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
					Else 
						OBJECT SET ENTERABLE:C238(*; "ov_EMAIL_Subject_Text"; True:C214)
						OBJECT SET VISIBLE:C603([DIARY:12]Company_Code:1; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Contact_Code:2; False:C215)
						OBJECT SET VISIBLE:C603([DIARY:12]Person:8; False:C215)
						OBJECT SET VISIBLE:C603(BgetTemplate; False:C215)
						OBJECT SET VISIBLE:C603(vCompName; False:C215)
						OBJECT SET VISIBLE:C603(vContName; False:C215)
						OBJECT SET VISIBLE:C603(vTel; False:C215)
						OBJECT SET VISIBLE:C603(vPerson; False:C215)
						OBJECT SET VISIBLE:C603([COMPANIES:2]Address_Line_two:4; False:C215)
						OBJECT SET VISIBLE:C603(*; "text2"; False:C215)
						OBJECT SET VISIBLE:C603(*; "text1"; False:C215)
						OBJECT SET VISIBLE:C603(*; "text3"; False:C215)
						OBJECT SET VISIBLE:C603(*; "text5"; False:C215)
						OBJECT SET VISIBLE:C603(*; "text6"; False:C215)
						OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; True:C214)
						EMAIL_t_AttachmentsLabel:="Attachments"
						OBJECT SET VISIBLE:C603(EMAIL_t_RecipientsLabel; True:C214)
						EMAIL_t_RecipientsLabel:="Recipients"
						FORM GOTO PAGE:C247(2)
					End if 
					[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
					EMAIL_t_BodyText:=[DOCUMENTS:7]Text:3
					If ([DIARY:12]Email_Subject:40#"")
						EMAIL_t_Subject:=[DIARY:12]Email_Subject:40
					Else 
						[DIARY:12]Email_Subject:40:=[DOCUMENTS:7]Heading:2
						EMAIL_t_Subject:=[DOCUMENTS:7]Heading:2
					End if 
					//BSW 6/08/02ng
					[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
					cSave:=1
					vCreate:=0
				Else 
					//it is a template-so copy it first
					If ([DOCUMENTS:7]Document_Class:14=Text Email Template)
						DUPLICATE RECORD:C225([DOCUMENTS:7])
						Let_No("E")
						Set_DocumentCode(2; "E"; DOC_t_DocumentCode)
						[DOCUMENTS:7]Document_Class:14:=Text Email
						OBJECT SET TITLE:C194(BgetTemplate; "Select Template")  //for template button
						EMAIL_t_RecipientsLabel:="Recipients"
						OBJECT SET VISIBLE:C603(EMAIL_t_RecipientsLabel; True:C214)
						EMAIL_t_AttachmentsLabel:="Attachments"
						OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; True:C214)
						EMAIL_t_EmailBody:=[DOCUMENTS:7]Text:3
						OBJECT SET ENTERABLE:C238(*; "ov_EMAIL_Body_Text"; True:C214)
						[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
						EMAIL_t_BodyText:=EMAIL_t_EmailBody
						If (Not:C34(EMAIL_bo_MailListBuilt))
							QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1=[DIARY:12]Diary_Code:3)
							SELECTION TO ARRAY:C260([EMAIL_RECIPIENTS:104]Classification:2; SD2_at_EmailType; [EMAIL_RECIPIENTS:104]Email_Address:3; SD2_at_EmailAddresses; [EMAIL_RECIPIENTS:104]ContactID:4; SD2_at_ContactIDs)
							$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
							Case of 
								: ([DIARY:12]Diary_Code:3#"")  //Sun, Feb 12, 2006 bwalia: make sure DiaryCode is not empty before looking for email attachments
									QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
									
								: ([DIARY:12]Email_ID:41#0)
									//this is needed so that where a group of diary items relate to a single email
									//there is only one group of records containing the attachments
									QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2=[DIARY:12]Email_ID:41)
									
								Else 
							End case 
							SELECTION TO ARRAY:C260([EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Email_ID:2; WS_al_EmailID; [EMAIL_ATTACHMENTS:103]DiaryID:1; SD3_at_DocDiaryCode; [EMAIL_ATTACHMENTS:103]FileNo:5; aEmail_FileNo)
							ARRAY TEXT:C222(SD2_at_EmailName; Size of array:C274(SD2_at_ContactIDs))
							For ($_l_index; 1; Size of array:C274(SD2_at_EmailType))
								If (SD2_at_ContactIDs{$_l_index}#"")
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactIDs{$_l_index})
									SD2_at_EmailName{$_l_index}:=[CONTACTS:1]Contact_Name:31
								End if 
							End for 
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
						End if 
						[DIARY:12]Email_From:38:=GetEmailSender
						EMAIL_t_FooterText:=""
						EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+[DIARY:12]Email_From:38+Char:C90(13)+Char:C90(13)
						EMAIL_T_EmailSignature:=GetEmailSignature
						//           EMAIL_t_EmailBody:=Char(13)+EMAIL_T_EmailSignature  `EMAIL_t_InsText+Char(13)+
						EMAIL_t_EmailBody:=Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  //26/06/02 pb
						[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
						EMAIL_t_BodyText:=EMAIL_t_EmailBody
						If ([DIARY:12]Email_Subject:40#"")
							EMAIL_t_Subject:=[DIARY:12]Email_Subject:40
						Else 
							[DIARY:12]Email_Subject:40:=[DOCUMENTS:7]Heading:2  //BSW 6/08/02
							EMAIL_t_Subject:=[DOCUMENTS:7]Heading:2
						End if 
						[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
						cSave:=1
						vCreate:=0
					End if 
					
				End if 
				
			Else 
				OBJECT SET TITLE:C194(BgetTemplate; "Select Template")  //for template button
				REDUCE SELECTION:C351([DOCUMENTS:7]; 0)
				Let_No("E")
				SET QUERY DESTINATION:C396(3; $_l_Clash)
				Repeat 
					IDLE:C311
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
					If ($_l_Clash>0)
						Let_No("E")
						
					End if 
				Until ($_l_Clash=0)
				SET QUERY DESTINATION:C396(0)
				[DIARY:12]Document_Code:15:="E"+DOC_t_DocumentCode
				EMAIL_t_RecipientsLabel:="Recipients"
				OBJECT SET VISIBLE:C603(EMAIL_t_RecipientsLabel; True:C214)
				EMAIL_t_AttachmentsLabel:="Attachments"
				[DIARY:12]Email_From:38:=GetEmailSender
				EMAIL_t_FooterText:=""
				EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+[DIARY:12]Email_From:38+Char:C90(13)+Char:C90(13)+"Daybook 4.2.014a DEMO"
				EMAIL_T_EmailSignature:=GetEmailSignature
				//       EMAIL_t_EmailBody:=Char(13)+EMAIL_T_EmailSignature  `EMAIL_t_InsText+Char(13)+
				EMAIL_t_EmailBody:=Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  //26/06/02 pb + bsw
				[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
				EMAIL_t_BodyText:=EMAIL_t_EmailBody
				cSave:=1
				vCreate:=0
			End if 
			
			
		End if 
		
		If (<>SYS_t_4DWriteType="WS")  // 4Dwrite "Silver"
			WR TEXT ACCESS:P12000:42(Write; 1)
			vEdit:=0
		Else 
			vEdit:=1
		End if 
		If ((DB_GetModuleSettingByNUM(1))=5)
			
			//DISABLE MENU ITEM(2050;3)
		End if 
		//  End if
		If ([DIARY:12]Company_Code:1#"")
			If ([DIARY:12]Contact_Code:2#"")
				If ([CONTACTS:1]Contact_Code:2#[DIARY:12]Contact_Code:2)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
				End if 
			End if 
			MCont_Add("")
		End if 
		If ([DIARY:12]Person:8#"")
			vFrom:=[PERSONNEL:11]Name:2
		End if 
		
		If (WIN_t_CurrentInputForm="Diary_InEmail") & (Not:C34(EMAIL_bo_MailListBuilt))  //
			
			If (EMAIL_t_EmailTo="") & ([DIARY:12]Contact_Code:2#"")  //C
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
				If (([CONTACTS:1]Email_Before_At:30#"") & ([CONTACTS:1]EMail_After_At:24#""))  //BSW 1/07/02
					EMAIL_t_EmailTo:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
				Else   //there is no email for the recipient
					Repeat 
						DelayTicks(1)
						$_t_EmailAddress:=Request:C163("Please enter eMail address for "+vContName; "")
						$_l_OK:=OK
					Until (OK=0) | ($_t_EmailAddress#"")
					If ($_l_OK=0)  //D
						CANCEL:C270
					Else   //D
						EMAIL_t_EmailTo:=$_t_EmailAddress
					End if 
					UNLOAD RECORD:C212([CONTACTS:1])
					If (Read only state:C362([CONTACTS:1]))
						UNLOAD RECORD:C212([CONTACTS:1])
						READ WRITE:C146([CONTACTS:1])
						LOAD RECORD:C52([CONTACTS:1])
					End if 
					$_l_CharacterPosition:=Position:C15(Char:C90(64); EMAIL_t_EmailTo)  // 10/06/02 pb
					If ($_l_CharacterPosition>0)
						[CONTACTS:1]Email_Before_At:30:=Substring:C12(EMAIL_t_EmailTo; 1; $_l_CharacterPosition-1)
						[CONTACTS:1]EMail_After_At:24:=Substring:C12(EMAIL_t_EmailTo; $_l_CharacterPosition+1)
					Else 
						[CONTACTS:1]EMail_After_At:24:=EMAIL_t_EmailTo
					End if 
					DB_SaveRecord(->[CONTACTS:1])
					AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
					WS_KeepFocus
				End if   //D
			End if   //C
			UNLOAD RECORD:C212([CONTACTS:1])
			$_l_EmailRow:=Find in array:C230(SD2_at_EmailAddresses; EMAIL_t_EmailTo)
			If ($_l_EmailRow<0)  //A
				INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
				WS_l_ContactElement:=Size of array:C274(SD2_at_EmailType)
				$_l_EmailRow:=Size of array:C274(SD2_at_EmailType)
				SD2_at_EmailType{$_l_EmailRow}:="To"
				SD2_at_EmailAddresses{$_l_EmailRow}:=EMAIL_t_EmailTo
				SD2_at_ContactIDs{$_l_EmailRow}:=[DIARY:12]Contact_Code:2
				SD2_at_EmailName{$_l_EmailRow}:=vContName
				$_l_EmailRow:=Size of array:C274(SD2_at_EmailType)
			Else   //A
				WS_l_ContactElement:=$_l_EmailRow
			End if   //A
			WS_l_SelectedEmailName:=$_l_EmailRow
			EMAIL_t_EmailType:=SD2_at_EmailType{WS_l_ContactElement}
			WS_t_EmailAddress:=SD2_at_EmailAddresses{WS_l_ContactElement}
			WS_t_EmailName:=SD2_at_EmailName{WS_l_ContactElement}
			If (EMAIL_t_Attachment#"")  //B
				INSERT IN ARRAY:C227(WS_at_Attachments; 9999; 1)
				INSERT IN ARRAY:C227(WS_at_AttachmentsPath; 9999; 1)
				INSERT IN ARRAY:C227(WS_al_EmailID; 9999; 1)
				INSERT IN ARRAY:C227(SD3_at_DocDiaryCode; 9999; 1)
				WS_at_Attachments{Size of array:C274(WS_at_Attachments)}:=FileNamefromPath(EMAIL_t_Attachment)
				WS_at_AttachmentsPath{Size of array:C274(WS_at_AttachmentsPath)}:=EMAIL_t_Attachment
				EMAIL_t_Attachment:=""
				// CLEAN_UP_ARRAY (->WS_at_Attachments)  `BSW 7/8/02
				//CLEAN_UP_ARRAY (->WS_at_AttachmentsPath)  `BSW 7/8/02
			End if   //B
		Else 
			If (Size of array:C274(SD2_at_EmailType)=1)
				WS_l_SelectedEmailName:=1
				EMAIL_t_EmailType:=SD2_at_EmailType{1}
				WS_t_EmailAddress:=SD2_at_EmailAddresses{1}
				WS_t_EmailName:=SD2_at_EmailName{1}
			End if 
			
		End if   //E
		WS_t_ContactID:=[DIARY:12]Contact_Code:2
		Macro_AccType("Load "+String:C10(Table:C252(->[DIARY:12])))
		AA_LoadNameArrays
		RESET_DIARY_EMAIL_OBJS
		
		OBJECT SET ENTERABLE:C238([DIARY:12]Company_Code:1; False:C215)
		OBJECT SET ENTERABLE:C238([DIARY:12]Contact_Code:2; False:C215)
		OBJECT SET ENTERABLE:C238([DIARY:12]Person:8; False:C215)
		//GOTO AREA([DIARY]Email_Subject)
		In_ButtChkDis(->vButtDisDry)
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[DOCUMENTS:7]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisDry)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		
		EMAIL_ON_OUTSIDE_CALL
		DB_l_ButtonClickedFunction:=0
		
	: ($_l_Event=On Outside Call:K2:11)
		EMAIL_ON_OUTSIDE_CALL(True:C214)
	: ($_l_Event=On Data Change:K2:15)
		Diary_InD
		Case of 
			: (Modified:C32([DIARY:12]Company_Code:1))
				MCont_Add("")
				Diary_InLLPHead
			: (Modified:C32([DIARY:12]Contact_Code:2))
				MCont_Add("")
				Diary_InLLPHead
			: (Modified:C32([DIARY:12]Date_Do_From:4))
				vDate:=[DIARY:12]Date_Do_From:4
				Letter_Date
				Diary_InLLPHead
			: (Modified:C32([DIARY:12]Person:8))
				vFrom:=[PERSONNEL:11]Name:2
			: (Modified:C32([DIARY:12]Document_Code:15))
				If (False:C215)
					If (([DOCUMENTS:7]Document_Code:1#"") & (vCreate#2))
						Gen_Confirm("Create a duplicate copy of this Document, or View it?"+((Char:C90(13)+Char:C90(13)+"NB: It is a Standard Document, so should usually be copied.")*Num:C11([DOCUMENTS:7]Standard:9)); "Copy"; "View")
						If (OK=1)
							DUPLICATE RECORD:C225([DOCUMENTS:7])
							[DOCUMENTS:7]Document_Code:1:=[DOCUMENTS:7]Document_Code:1+DOC_t_DocumentCode
							RemoveLeadTr(Uppers2(Gen_Request("New Document Code:"; [DOCUMENTS:7]Document_Code:1)); ->[DOCUMENTS:7]Document_Code:1)
							[DOCUMENTS:7]Document_Code:1:=Substring:C12([DOCUMENTS:7]Document_Code:1; 1; 15)
							[DOCUMENTS:7]Standard:9:=False:C215
							[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
							[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
							[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
							//WR O PICTURE TO AREA (Write;[DOCUMENTS]Write_)
							//Above command replace April 200 for 6.5
							WR SET DOC PROPERTY:P12000:109(WRITE; wr view references:K12003:17; 0)
							WR SET DOC PROPERTY:P12000:109(WRITE; wr view standard palette:K12003:12; 1)
							WR SET DOC PROPERTY:P12000:109(WRITE; wr view format palette:K12003:13; 0)
							WR SET DOC PROPERTY:P12000:109(WRITE; wr view style palette:K12003:14; 0)
							WR SET DOC PROPERTY:P12000:109(WRITE; wr view borders palette:K12003:15; 0)
							WR PICTURE TO AREA:P12000:141(Write; [DOCUMENTS:7]Write_:5)
						Else 
							vHeading:=[DOCUMENTS:7]Heading:2
							If (Documents_4DWriteAccessType(False:C215)="W@")
								WR SET DOC PROPERTY:P12000:109(WRITE; wr view references:K12003:17; 0)
								WR SET DOC PROPERTY:P12000:109(WRITE; wr view standard palette:K12003:12; 1)
								WR SET DOC PROPERTY:P12000:109(WRITE; wr view format palette:K12003:13; 1)
								WR SET DOC PROPERTY:P12000:109(WRITE; wr view style palette:K12003:14; 1)
								WR SET DOC PROPERTY:P12000:109(WRITE; wr view borders palette:K12003:15; 1)
								
								WR PICTURE TO AREA:P12000:141(Write; [DOCUMENTS:7]Write_:5)
								WR TEXT ACCESS:P12000:42(Write; 1)
							Else 
								OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Heading:2; False:C215)
								OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Text:3; False:C215)
							End if 
						End if 
						cSave:=1
						vCreate:=1
					Else 
						vHeading:=[DOCUMENTS:7]Heading:2
						vCreate:=0
						If (Documents_4DWriteAccessType(False:C215)="W")
							WR SET DOC PROPERTY:P12000:109(WRITE; wr view references:K12003:17; 1)
							WR SET DOC PROPERTY:P12000:109(WRITE; wr view standard palette:K12003:12; 1)
							WR SET DOC PROPERTY:P12000:109(WRITE; wr view format palette:K12003:13; 1)
							WR SET DOC PROPERTY:P12000:109(WRITE; wr view style palette:K12003:14; 1)
							WR SET DOC PROPERTY:P12000:109(WRITE; wr view borders palette:K12003:15; 1)
							WR PICTURE TO AREA:P12000:141(Write; [DOCUMENTS:7]Write_:5)
							WR TEXT ACCESS:P12000:42(Write; 1)
						Else 
							OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Heading:2; False:C215)
							OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Text:3; False:C215)
						End if 
					End if 
				End if 
				
				vEdit:=0
		End case 
		If ([DIARY:12]Contact_Code:2#"")
			EMAIL_t_EmailTo:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
		End if 
		vWT_EmailSenderName:=vPerson
		[DIARY:12]Email_Person:39:=vPerson
		
		Attach_Count:=Records in selection:C76([EMAIL_ATTACHMENTS:103])
		Reicipient_Count:=Records in selection:C76([EMAIL_RECIPIENTS:104])
	: ($_l_Event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
	: ($_l_Event=On Deactivate:K2:10)
		If (EmailChoiceProc>0)
			DOC_l_CallEvent:=1
			SET PROCESS VARIABLE:C370(EmailChoiceProc; DOC_l_CallEvent; DOC_l_CallEvent)
			POST OUTSIDE CALL:C329(EmailChoiceProc)
			
		End if 
		
		
End case 
ERR_MethodTrackerReturn("Pseudo_DiaryInLLP"; $_t_oldMethodName)
