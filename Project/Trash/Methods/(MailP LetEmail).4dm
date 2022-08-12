//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MailP_LetEmail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; <>Per_bo_EmailCOPY; <>UserGr_EmailCopytoOption; $_bo_DocPathOK; $_bo_EmailCopyTo; $_bo_GroupEmailCopyTo; $_bo_OK; $SentOK; DOCLOADED; WIN_bo_TrackerInited)
	C_DATE:C307(vWT_EmailDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_AttachementsIndex; $_l_CharacterPosition; $_l_EmailID; $_l_Error; $_l_SMTPSetPrefs; $_l_WindowReferenceRow; rDiary; rState; vWT_EmailTextCount; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_TablePointer; $1)
	C_TEXT:C284(<>DefCopytoaddress; <>DefSignature; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultSMTPhost; <>MAIL_t_SMTPServer; <>Per_t_PersonnelNames_EmailTo; <>PER_t_CurrentEmailFrom; <>UserGr_EmailTo; $_t_AttachmentPath; $_t_EmailBCCAddress; $_t_EmailCCAddress)
	C_TEXT:C284($_t_EmailFromAddress; $_t_EmailFromSMTP; $_t_EmailSignature; $_t_EmailToAddress; $_t_FromAddressDefault; $_t_GroupEmailFromAddress; $_t_GroupEmailFromSMTP; $_t_GroupEmailSignature; $_t_GroupEmailToAddress; $_t_oldMethodName; EMAIL_t_EmailTo)
	C_TEXT:C284(vFrom; vOurRef; vWT_EmailBcc; vWT_EmailCc; vWT_EmailComments; vWT_EmailFrom; vWT_EmailSubject; vWT_SMTP_Attachments; vWT_SMTP_HeaderInfo; vWT_SMTP_Server)
	C_TIME:C306(vWT_EmailTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MailP_LetEmail")
$_ptr_TablePointer:=$1
While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 
CLEAR SEMAPHORE:C144("InitEmail")

If ((DB_GetModuleSettingByNUM(Module_IntServer))>1)
	MailP_Ready("Are you ready to send Emails?")
	If (OK=1)
		
		If (Records in selection:C76>1)
			Open_PrD_Window("Emailing ...")
			MESSAGE:C88(Char:C90(13))
		End if 
		
		If (Not:C34((rDiary=1) & (vFrom="AUTO")))
			$_l_CharacterPosition:=Position:C15(Char:C90(64); vFrom)
			If ($_l_CharacterPosition<1)
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=vFrom)
				$_t_FromAddressDefault:=[PERSONNEL:11]Email_Address:36
				If ($_t_FromAddressDefault#"")
					IME_SetMailOpts(<>MAIL_t_SMTPServer; $_t_FromAddressDefault)
				Else 
					IME_SetMailOpts(<>MAIL_t_SMTPServer; <>PER_t_CurrentEmailFrom)
				End if 
			Else 
				If (vFrom#"")
					IME_SetMailOpts(<>MAIL_t_SMTPServer; vFrom)
				Else 
					IME_SetMailOpts(<>MAIL_t_SMTPServer; <>PER_t_CurrentEmailFrom)
				End if 
			End if 
		End if 
		
		FIRST RECORD:C50($_ptr_TablePointer->)
		Mail_MSRec
		While ((Not:C34(End selection:C36($_ptr_TablePointer->))) & (OK=1) & (<>SYS_l_CancelProcess#Current process:C322))
			Case of 
				: (rDiary=1)
					$_t_FromAddressDefault:=vFrom
					Letter_LoadD
					RELATE ONE:C42([DIARY:12]Company_Code:1)
					RELATE ONE:C42([DIARY:12]Contact_Code:2)
					vOurRef:=[DIARY:12]Company_Code:1+"-"+[DIARY:12]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
					MCont_Add("")
					If ([PERSONNEL:11]Email_Address:36#"")
						IME_SetMailOpts(<>MAIL_t_SMTPServer; [PERSONNEL:11]Email_Address:36)
					Else 
						IME_SetMailOpts(<>MAIL_t_SMTPServer; <>PER_t_CurrentEmailFrom)
					End if 
					If (Letter_Email($_ptr_TablePointer)=0)
						Letter_AllocD([DOCUMENTS:7]Document_Code:1)
					End if 
					vFrom:=$_t_FromAddressDefault
				: (rState>1)
					RELATE ONE:C42([INVOICES:39]Credit_Stage:22)
					Letter_LoadI
					MState_Calc2
					vOurRef:=[COMPANIES:2]Company_Code:1+"-"+[CONTACTS:1]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
					MCont_Add("")
					If (Letter_Email($_ptr_TablePointer)=0)
						Letter_Alloc([DOCUMENTS:7]Document_Code:1; "EMAIL")
						If (rState=2)
							LOAD RECORD:C52([INVOICES:39])
							[INVOICES:39]Credit_Stage:22:=[CREDIT_STAGES:54]Next_Stage:6
							DB_SaveRecord(->[INVOICES:39])
						Else 
							FIRST RECORD:C50([INVOICES:39])
							While (Not:C34(End selection:C36([INVOICES:39])))
								[INVOICES:39]Credit_Stage:22:=[CREDIT_STAGES:54]Next_Stage:6
								DB_SaveRecord(->[INVOICES:39])
								NEXT RECORD:C51([INVOICES:39])
							End while 
						End if 
					End if 
				Else 
					Letter_AllDets(True:C214)
					If (Letter_Email($_ptr_TablePointer)=0)
						Letter_Alloc([DOCUMENTS:7]Document_Code:1; "EMAIL")
					End if 
			End case 
			NEXT RECORD:C51($_ptr_TablePointer->)
			Mail_MSRec
		End while 
		If (Records in selection:C76($_ptr_TablePointer->)>1)
			CLOSE WINDOW:C154
			If (WIN_bo_TrackerInited)
				$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
				If ($_l_WindowReferenceRow>0)
					WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
				End if 
			End if 
			
		End if 
		
	End if 
Else 
	//Gen_Alert ("You do not have Access to the Internet Manager")
	//Changed in V4.2.014
	MailP_Ready("Are you ready to send Emails?")
	//Construct the components of the eMail
	
	//the document (template is loaded ) so all we need to do is take the text and add
	//the salutations or whatever to it
	If (OK=1)
		
		If (Records in selection:C76($_ptr_TablePointer->)>1)
			Open_PrD_Window("Emailing ...")
			MESSAGE:C88(Char:C90(13))
		End if 
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=vFrom)
		If (Records in selection:C76([PERSONNEL:11])=1)
			//get smtp info
			$_t_EmailFromAddress:=[PERSONNEL:11]Email_Address:36
			$_t_EmailFromSMTP:=[PERSONNEL:11]PER_SMTPHOST:41
			$_t_EmailToAddress:=[PERSONNEL:11]PER_CopyToAddress:42
			$_t_EmailFromAddress:=[PERSONNEL:11]Email_Address:36
			$_t_EmailSignature:=[PERSONNEL:11]Per_DefaultSignature:44
			$_bo_EmailCopyTo:=[PERSONNEL:11]PER_CopytoOption:43
			If ([PERSONNEL:11]Group_Code:28#"")
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
			Else 
				REDUCE SELECTION:C351([PERSONNEL_GROUPS:92]; 0)
			End if 
			If (Records in selection:C76([PERSONNEL_GROUPS:92])>0)
				
				$_t_GroupEmailFromSMTP:=[PERSONNEL_GROUPS:92]X_DEF_GRP_SMTPHOST:5
				$_t_GroupEmailToAddress:=[PERSONNEL_GROUPS:92]X_DEF_GRP_ReplyToAddress:6
				$_t_GroupEmailFromAddress:=[PERSONNEL_GROUPS:92]X_Def_GRP_EmailSenderAddress:10
				$_t_GroupEmailSignature:=[PERSONNEL_GROUPS:92]X_Def_GRP_Signature:9
				$_bo_GroupEmailCopyTo:=[PERSONNEL_GROUPS:92]X_Def_CopytoOption:8
			Else 
				$_t_GroupEmailFromSMTP:=<>EMAIL_t_DefaultSMTPhost
				$_t_GroupEmailToAddress:=<>DefCopytoaddress
				$_t_GroupEmailFromAddress:=<>EMAIL_t_DefaultReplyToAddress
				$_t_GroupEmailSignature:=<>DefSignature
				$_bo_GroupEmailCopyTo:=False:C215
			End if 
			If ($_t_EmailFromAddress="")
				$_t_EmailFromAddress:=$_t_GroupEmailFromAddress
			End if 
			If ($_t_EmailFromSMTP="")
				$_t_EmailFromSMTP:=$_t_GroupEmailFromSMTP
			End if 
			If ($_t_EmailToAddress="")
				$_t_EmailToAddress:=$_t_GroupEmailToAddress
			End if 
			If ($_t_EmailFromAddress="")
				$_t_EmailFromAddress:=$_t_GroupEmailFromAddress
			End if 
			If ($_t_EmailSignature="")
				$_t_EmailSignature:=$_t_GroupEmailSignature
			End if 
			
			
			
			
			
			
			
			
		End if 
		If (Abs:C99([DOCUMENTS:7]Document_Class:14)=4D Write Email Template)  // 4D write email
			FIRST RECORD:C50($_ptr_TablePointer->)
			Mail_MSRec
			While ((Not:C34(End selection:C36($_ptr_TablePointer->))) & (OK=1) & (<>SYS_l_CancelProcess#Current process:C322))
				Case of 
					: (rDiary=1)
						$_t_FromAddressDefault:=vFrom
						DOCLOADED:=Letter_LoadD(DOCLOADED)
						RELATE ONE:C42([DIARY:12]Company_Code:1)
						RELATE ONE:C42([DIARY:12]Contact_Code:2)
						vOurRef:=[DIARY:12]Company_Code:1+"-"+[DIARY:12]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
						MCont_Add("")
						If (Letter_Email($_ptr_TablePointer)=0)
							Letter_AllocD([DOCUMENTS:7]Document_Code:1)
						End if 
						vFrom:=$_t_FromAddressDefault
					: (rState>1)
						RELATE ONE:C42([INVOICES:39]Credit_Stage:22)
						Letter_LoadI
						MState_Calc2
						vOurRef:=[COMPANIES:2]Company_Code:1+"-"+[CONTACTS:1]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
						MCont_Add("")
						If (Letter_Email($_ptr_TablePointer)=0)
							Letter_Alloc([DOCUMENTS:7]Document_Code:1; "EMAIL")
							If (rState=2)
								LOAD RECORD:C52([INVOICES:39])
								[INVOICES:39]Credit_Stage:22:=[CREDIT_STAGES:54]Next_Stage:6
								DB_SaveRecord(->[INVOICES:39])
							Else 
								FIRST RECORD:C50([INVOICES:39])
								While (Not:C34(End selection:C36([INVOICES:39])))
									[INVOICES:39]Credit_Stage:22:=[CREDIT_STAGES:54]Next_Stage:6
									DB_SaveRecord(->[INVOICES:39])
									NEXT RECORD:C51([INVOICES:39])
								End while 
							End if 
						End if 
					Else 
						Letter_AllDets(True:C214)
						If (Letter_Email($_ptr_TablePointer)=0)
							Letter_Alloc([DOCUMENTS:7]Document_Code:1; "EMAIL")
						End if 
				End case 
				NEXT RECORD:C51($_ptr_TablePointer->)
				Mail_MSRec
			End while 
			If (Records in selection:C76($_ptr_TablePointer->)>1)
				CLOSE WINDOW:C154
				If (WIN_bo_TrackerInited)
					$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowReferenceRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
					End if 
				End if 
			End if 
		Else 
			//not an email 4D write document so no embedding
			FIRST RECORD:C50($_ptr_TablePointer->)
			For ($_l_AttachementsIndex; 1; Records in selection:C76($_ptr_TablePointer->))
				
			End for 
			$_l_SMTPSetPrefs:=SMTP_SetPrefs(1; 1; 0)
			vWT_SMTP_HeaderInfo:="Daybook 4.2.014"
			$_t_EmailFromAddress:=[PERSONNEL:11]Email_Address:36
			vWT_EmailSubject:="This has to come from somewhere!"
			$_t_EmailToAddress:=[PERSONNEL:11]PER_CopyToAddress:42
			$_t_EmailFromAddress:=[PERSONNEL:11]Email_Address:36
			$_t_EmailSignature:=[PERSONNEL:11]Per_DefaultSignature:44
			$_bo_EmailCopyTo:=[PERSONNEL:11]PER_CopytoOption:43
			vWT_EmailDate:=Current date:C33
			vWT_EmailTime:=Current time:C178
			vWT_SMTP_HeaderInfo:=vFrom
			vWT_EmailComments:="Sent via Daybook, 'the modular business system'."
			$_l_Error:=SMTP_New($_l_EmailID)
			//[DIARY]Email_ID:=[DIARY]Person+String($_l_EmailID)
			$_l_Error:=SMTP_Host($_l_EmailID; $_t_EmailFromSMTP)
			vWT_EmailFrom:=[DIARY:12]Email_From:38
			$_l_Error:=SMTP_From($_l_EmailID; $_t_EmailFromAddress)
			$_l_Error:=SMTP_Sender($_l_EmailID; $_t_EmailFromAddress)
			$_l_Error:=SMTP_ReplyTo($_l_EmailID; $_t_EmailToAddress)
			$_l_Error:=SMTP_Subject($_l_EmailID; vWT_EmailSubject)
			$_t_EmailToAddress:=EMAIL_t_EmailTo
			EMAIL_t_EmailTo:=""
			For ($_l_AttachementsIndex; 1; Size of array:C274(SD2_at_EmailAddresses))
				If (SD2_at_EmailType{$_l_AttachementsIndex}="To")
					If (EMAIL_t_EmailTo#"")
						EMAIL_t_EmailTo:=EMAIL_t_EmailTo+","
					End if 
					EMAIL_t_EmailTo:=EMAIL_t_EmailTo+SD2_at_EmailAddresses{$_l_AttachementsIndex}
				End if 
			End for 
			
			$_l_Error:=SMTP_To($_l_EmailID; EMAIL_t_EmailTo)
			EMAIL_t_EmailTo:=$_t_EmailToAddress
			$_t_EmailCCAddress:=vWT_EmailCc
			vWT_EmailCc:=""
			For ($_l_AttachementsIndex; 1; Size of array:C274(SD2_at_EmailAddresses))
				If (SD2_at_EmailType{$_l_AttachementsIndex}="CC")
					If (vWT_EmailCc#"")
						vWT_EmailCc:=vWT_EmailCc+","
					End if 
					vWT_EmailCc:=vWT_EmailCc+SD2_at_EmailAddresses{$_l_AttachementsIndex}
				End if 
			End for 
			$_l_Error:=SMTP_Cc($_l_EmailID; vWT_EmailCc)
			vWT_EmailCc:=$_t_EmailCCAddress
			$_t_EmailBCCAddress:=vWT_EmailBcc
			vWT_EmailBcc:=""
			For ($_l_AttachementsIndex; 1; Size of array:C274(SD2_at_EmailAddresses))
				If (SD2_at_EmailType{$_l_AttachementsIndex}="BCC")
					If (vWT_EmailBcc#"")
						vWT_EmailBcc:=vWT_EmailBcc+","
					End if 
					vWT_EmailBcc:=vWT_EmailBcc+SD2_at_EmailAddresses{$_l_AttachementsIndex}
				End if 
			End for 
			If (<>Per_bo_EmailCOPY)
				If (vWT_EmailBcc#"")
					vWT_EmailBcc:=vWT_EmailBcc+","
				End if 
				vWT_EmailBcc:=vWT_EmailBcc+<>Per_t_PersonnelNames_EmailTo
			Else 
				If (<>UserGr_EmailCopytoOption)
					
					If (vWT_EmailBcc#"")
						vWT_EmailBcc:=vWT_EmailBcc+","
					End if 
					vWT_EmailBcc:=vWT_EmailBcc+<>UserGr_EmailTo
				End if 
				$_l_Error:=SMTP_Bcc($_l_EmailID; vWT_EmailBcc)
				$_l_Error:=SMTP_Date($_l_EmailID; vWT_EmailDate; vWT_EmailTime; 1)
				$_l_Error:=SMTP_Comments($_l_EmailID; vWT_EmailComments)
				$_l_Error:=SMTP_AddHeader($_l_EmailID; vWT_SMTP_HeaderInfo)
				If (Records in selection:C76([EMAIL_ATTACHMENTS:103])>0)
					For ($_l_AttachementsIndex; 1; Records in selection:C76([EMAIL_ATTACHMENTS:103]))
						$_t_AttachmentPath:=[EMAIL_ATTACHMENTS:103]Attachment_Path:3
						
						$_bo_DocPathOK:=Test path name:C476($_t_AttachmentPath)=Is a document:K24:1
						If ($_bo_DocPathOK) & ($_t_AttachmentPath#"")  //this is must otherwise get errors
							If (_o_Document type:C528($_t_AttachmentPath)="pdf")
								$_l_Error:=SMTP_Attachment($_l_EmailID; $_t_AttachmentPath; -1)
							Else 
								$_l_Error:=SMTP_Attachment($_l_EmailID; $_t_AttachmentPath; 1)
							End if 
						End if 
					End for 
				End if 
				//$_l_Error:=SMTP_Body ($_l_EmailID;EMAIL_t_EmailBody)
				$_l_Error:=SMTP_Body($_l_EmailID; [DIARY:12]Email_Text:42)
				$_l_Error:=SMTP_Send($_l_EmailID)
				//BEEP
				// ALERT("Email Sent")
				Gen_Alert("Email Sent")
				If ($_l_EmailID#0)
					$_l_Error:=SMTP_Clear($_l_EmailID)
				End if 
				
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("MailP_LetEmail"; $_t_oldMethodName)
