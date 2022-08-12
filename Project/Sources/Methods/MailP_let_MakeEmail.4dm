//%attributes = {}
If (False:C215)
	//Project Method Name:      MailP_let_MakeEmail
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
	//ARRAY LONGINT(WS_al_EmailID;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	C_BOOLEAN:C305($2; DOC_bo_Loaded2; EMAIL_bo_DonotChangeSubject; Email_bo_TestMailing)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_OK; $_l_Process; $1; $EmailID; DOC_l_ContactIDreturn)
	C_TEXT:C284(<>eLetAct; <>PER_t_CurrentUserInitials; $_t_EmailAddress; $_t_EmailID; $_t_oldMethodName; $3; DOC_t_ContactCodeReturn; DOC_t_ContactNameReturn; EMAIL_t_EmailTo; EMAIL_t_EmailType; EMAIL_t_SendCalledFrom)
	C_TEXT:C284(MMeMailCode; vContName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MailP_let_MakeEmail")

If ($1>0)
	//we are not looping through the diary
	//we must create a diary record relating to the contact for the invoice
	If ($2=True:C214)
		CREATE RECORD:C68([DIARY:12])
		[DIARY:12]Company_Code:1:=[COMPANIES:2]Company_Code:1
		[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
		vContName:=CON_BuildContactNameandJobTitle
		DiarySetCode
		[DIARY:12]Date_Do_From:4:=<>DB_d_CurrentDate
		[DIARY:12]Originator:23:=<>PER_t_CurrentUserInitials
		If (Count parameters:C259>=3)
			If ($3#"")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$3)
				[DIARY:12]Person:8:=[PERSONNEL:11]Initials:1
			Else 
				[DIARY:12]Person:8:=<>PER_t_CurrentUserInitials
			End if 
		Else 
			[DIARY:12]Person:8:=<>PER_t_CurrentUserInitials
		End if 
		
	Else 
		DUPLICATE RECORD:C225([DIARY:12])
		[DIARY:12]x_ID:50:=0
		
		DiarySetCode
		
	End if 
	
	
	If ([CONTACTS:1]Email_Before_At:30#"") & ([CONTACTS:1]EMail_After_At:24#"")
		EMAIL_t_EmailTo:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
	Else 
		EMAIL_t_EmailTo:=""
		Repeat 
			$_t_EmailAddress:=Request:C163("Please enter eMail address for "+vContName; "")
			$_l_OK:=OK
		Until (OK=0) | ($_t_EmailAddress#"")
		If ($_l_OK=1)
			EMAIL_t_EmailTo:=$_t_EmailAddress
		End if 
	End if 
	[DIARY:12]Status:30:=[COMPANIES:2]Status:12
	[DIARY:12]Action_Code:9:=<>eLetAct
	If (<>eLetAct="")
		[DIARY:12]Action_Code:9:="Email"
	End if 
	
	[DIARY:12]Action_Details:10:="Sending Email"
	[DIARY:12]Email_From:38:=GetEmailSender
	DOC_bo_Loaded2:=Letter_LoadD(DOC_bo_Loaded2; ->MMeMailCode)
	[DIARY:12]Document_Code:15:=MMeMAILCode
	If ([DIARY:12]Email_Subject:40="")  //BSW 1/07/02
		[DIARY:12]Email_Subject:40:=[DOCUMENTS:7]Heading:2
	End if 
	[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
	EMAIL_t_EmailType:="To"
	
	If ([DIARY:12]Person:8#<>PER_t_CurrentUserInitials)
		RELATE ONE:C42([DIARY:12]Person:8)
		[DIARY:12]Email_Person:39:=[PERSONNEL:11]Name:2
	Else 
		[DIARY:12]Email_Person:39:=[DIARY:12]Person:8
	End if 
	//WS_t_EmailName:=
	If (EMAIL_t_EmailTo#"")
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		EMAIL_t_EmailType:="To"
		EMAIL_t_SendCalledFrom:="MailP_LetmakeEmail"
		$_t_EmailID:=Email_Send(->EMAIL_t_EmailType; ->vContName; ->EMAIL_t_EmailTo; [DIARY:12]Email_Person:39; [DIARY:12]Email_From:38; [DIARY:12]Email_From:38; [DIARY:12]Email_Subject:40; ->WS_at_AttachmentsPath; ->[DIARY:12]Email_Text:42; False:C215)
		If ($_t_EmailID#"")
			If ([DIARY:12]Email_ID:41=0)
				$EmailID:=AA_GetNextIDinMethod(->[DIARY:12]Email_ID:41)
			Else 
				$EmailID:=Abs:C99([DIARY:12]Email_ID:41)
			End if 
		Else 
			$EmailID:=-(AA_GetNextIDinMethod(->[DIARY:12]Email_ID:41))
		End if 
		[DIARY:12]Email_ID:41:=$EmailID
		[DIARY:12]Result_Code:11:="OK"
		[DIARY:12]Done:14:=True:C214
		[DIARY:12]Date_Done_From:5:=<>DB_d_CurrentDate
		[DIARY:12]Date_Done_To:34:=<>DB_d_CurrentDate
		[DIARY:12]Time_Done_From:7:=Current time:C178(*)
		[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Done_From:7
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		
		
		CREATE RECORD:C68([EMAIL_RECIPIENTS:104])
		[EMAIL_RECIPIENTS:104]DiaryID:1:=[DIARY:12]Diary_Code:3
		[EMAIL_RECIPIENTS:104]Classification:2:="To"
		[EMAIL_RECIPIENTS:104]Email_Address:3:=EMAIL_t_EmailTo
		[EMAIL_RECIPIENTS:104]ContactID:4:=[DIARY:12]Contact_Code:2
		DOC_l_ContactIDreturn:=0
		$_l_Process:=New process:C317("DOC_GetContactDetails"; DB_ProcessMemoryinit(1); "Contact_Details"; Current process:C322; 0; [DIARY:12]Contact_Code:2)
		While (DOC_l_ContactIDreturn=0)
			DelayTicks(2)
		End while 
		If (DOC_l_ContactIDreturn>0)
			[EMAIL_RECIPIENTS:104]Person_ID:6:=DOC_l_ContactIDreturn
		End if 
		DOC_l_ContactIDreturn:=0
		DB_SaveRecord(->[EMAIL_RECIPIENTS:104])
		REDUCE SELECTION:C351([EMAIL_ATTACHMENTS:103]; 0)
		If (False:C215)
			ARRAY TO SELECTION:C261(WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Attachment_Path:3)
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:=[DIARY:12]Diary_Code:3)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2:=$EmailID)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; EMAILupdateattachmentlocation)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			$_l_Process:=New process:C317("DS_DocstoServer"; DB_ProcessMemoryinit(4); "Moving Documents"; $EmailID)
		Else 
			EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 2; [DIARY:12]Diary_Code:3; $EmailID)
		End if 
		
	Else 
		REDUCE SELECTION:C351([EMAIL_ATTACHMENTS:103]; 0)
		[DIARY:12]Email_ID:41:=-(AA_GetNextIDinMethod(->[EMAIL_ATTACHMENTS:103]Email_ID:2))
		If (False:C215)
			ARRAY TO SELECTION:C261(WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Attachment_Path:3)
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:=[DIARY:12]Diary_Code:3)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2:=[DIARY:12]Email_ID:41)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
		Else 
			EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 2; [DIARY:12]Diary_Code:3; [DIARY:12]Email_ID:41)
		End if 
		
		[DIARY:12]Email_Text:42:=""
		[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" Email Error"
		DB_SaveRecord(->[DIARY:12])
		
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		// ALERT("This eMail Failed to send")
		Gen_Alert("This eMail Failed to send")
	End if 
	EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 5; [DIARY:12]Diary_Code:3; [DIARY:12]Email_ID:41)
	
	//Now delete the element added-this attachment is unique
	DELETE FROM ARRAY:C228(WS_at_Attachments; Size of array:C274(WS_at_Attachments))
	DELETE FROM ARRAY:C228(WS_at_AttachmentsPath; Size of array:C274(WS_at_AttachmentsPath))
	DELETE FROM ARRAY:C228(WS_al_EmailID; Size of array:C274(WS_al_EmailID))
	DELETE FROM ARRAY:C228(SD3_at_DocDiaryCode; Size of array:C274(SD3_at_DocDiaryCode))
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
End if 
ERR_MethodTrackerReturn("MailP_let_MakeEmail"; $_t_oldMethodName)
