//%attributes = {}
If (False:C215)
	//Project Method Name:      MailP_Let_GroupedEmail
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
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	C_BOOLEAN:C305(<>EMAIL_bo_NotHandleEmailing; EMAIL_bo_MailListBuilt; Mail_bo_inOK)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_EmailID; $_l_Index; $_l_Process; cSave)
	C_REAL:C285($1)
	C_TEXT:C284($_t_EmailID; $_t_oldMethodName; EMAIL_t_SendCalledFrom; MMailIDStr; vPerson; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MailP_Let_GroupedEmail")
//here display

WIN_t_CurrentInputForm:="Diary_InEmail"
EMAIL_bo_MailListBuilt:=True:C214
Mail_bo_inOK:=False:C215  // this is false here so we know if it is to be sent
cSave:=0
<>EMAIL_bo_NotHandleEmailing:=True:C214  //this is true here so the form methods dont send
//[USER];"Pseudo_diary_inEmail2"
//modify this
FORM SET INPUT:C55([USER:15]; "SD2_EmailEntry")
//INPUT FORM([USER];"Pseudo_diary_inEmail2")
READ WRITE:C146([USER:15])
ADD RECORD:C56([USER:15]; *)
CLOSE WINDOW:C154
<>EMAIL_bo_NotHandleEmailing:=False:C215
If (Mail_bo_inOK)  //if ok was pressed
	
	[DOCUMENTS:7]Text:3:=[DIARY:12]Email_Text:42
	DB_SaveRecord(->[DOCUMENTS:7])
	If ([DIARY:12]Email_ID:41>0)
		$_l_EmailID:=[DIARY:12]Email_ID:41
	Else 
		If (Not:C34(Macro_AccTypeDEF("EMail_Send")))
			EMAIL_t_SendCalledFrom:="MailP_LetGroupedEmail"
			$_t_EmailID:=Email_Send(->SD2_at_EmailType; ->SD2_at_EmailName; ->SD2_at_EmailAddresses; vPerson; [DIARY:12]Email_From:38; [DIARY:12]Email_From:38; [DIARY:12]Email_Subject:40; ->WS_at_AttachmentsPath; ->[DIARY:12]Email_Text:42; True:C214)
			If ($_t_EmailID#"")
				If ([DIARY:12]Email_ID:41=0)
					$_l_EmailID:=AA_GetNextIDinMethod(->[DIARY:12]Email_ID:41)
				Else 
					$_l_EmailID:=Abs:C99([DIARY:12]Email_ID:41)
				End if 
			Else 
				$_l_EmailID:=-(AA_GetNextIDinMethod(->[DIARY:12]Email_ID:41))
			End if 
		Else 
			//Get the email ID returned by the macro...
			
			$_l_EmailID:=Num:C11(MMailIDStr)
			
			
		End if 
		
	End if 
	If ($_l_EmailID>0)
		//   ALERT("Email Sent")
		Gen_Alert("Email Sent")
		USE SET:C118("MailSet")
		READ WRITE:C146([DIARY:12])
		If (Not:C34(In transaction:C397))
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Email_ID:41:=$_l_EmailID)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			USE SET:C118("MailSet")
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Result_Code:11:="OK")
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			USE SET:C118("MailSet")
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Done:14:=True:C214)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			USE SET:C118("MailSet")
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Date_Done_From:5:=<>DB_d_CurrentDate)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			USE SET:C118("MailSet")
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Date_Done_To:34:=<>DB_d_CurrentDate)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			USE SET:C118("MailSet")
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Time_Done_From:7:=Current time:C178(*))
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			USE SET:C118("MailSet")
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Done_From:7)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			USE SET:C118("MailSet")
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Email_Text:42:="")
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
		Else 
			FIRST RECORD:C50([DIARY:12])
			For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
				[DIARY:12]Email_ID:41:=$_l_EmailID
				[DIARY:12]Result_Code:11:="OK"
				[DIARY:12]Done:14:=True:C214
				[DIARY:12]Date_Done_From:5:=<>DB_d_CurrentDate
				[DIARY:12]Date_Done_To:34:=<>DB_d_CurrentDate
				[DIARY:12]Time_Done_From:7:=Current time:C178(*)
				[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Done_From:7
				[DIARY:12]Email_Text:42:=""
				DB_SaveRecord(->[DIARY:12])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
				NEXT RECORD:C51([DIARY:12])
			End for 
		End if 
		
		FIRST RECORD:C50([DIARY:12])
		READ WRITE:C146([EMAIL_ATTACHMENTS:103])
		REDUCE SELECTION:C351([EMAIL_ATTACHMENTS:103]; 0)
		If (False:C215)
			ARRAY TO SELECTION:C261(WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Attachment_Path:3)
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:="")
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2:=$_l_EmailID)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; EMAILupdateattachmentlocation)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
		Else 
			EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 2; [DIARY:12]Diary_Code:3; $_l_EmailID)
		End if 
		
		
		UNLOAD RECORD:C212([EMAIL_ATTACHMENTS:103])
		READ ONLY:C145([EMAIL_ATTACHMENTS:103])
		$_l_Process:=New process:C317("DS_DocstoServer"; 25600; "Moving Documents"; $_l_EmailID)
		CLEAR SET:C117("mailSet")
	Else 
		$_l_EmailID:=-(AA_GetNextIDinMethod(->[EMAIL_ATTACHMENTS:103]Email_ID:2))
		If (Not:C34(In transaction:C397))
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Email_ID:41:=$_l_EmailID)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
		Else 
			FIRST RECORD:C50([DIARY:12])
			For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
				[DIARY:12]Email_ID:41:=$_l_EmailID
				DB_SaveRecord(->[DIARY:12])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
				NEXT RECORD:C51([DIARY:12])
			End for 
		End if 
		If (False:C215)
			ARRAY TO SELECTION:C261(WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Attachment_Path:3)
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2:=[DIARY:12]Email_ID:41)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
		Else 
			EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 2; [DIARY:12]Diary_Code:3; $_l_EmailID)
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:="")
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			//NOTE: here we have attachments belonging to several Diary records
			//BUT ONE EMAIL--CHECK THE RELATION WORKS OK
		End if 
		If (Not:C34(In transaction:C397))
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Email_Text:42:="")
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" Email Error")
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
		Else 
			FIRST RECORD:C50([DIARY:12])
			For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
				[DIARY:12]Email_Text:42:=""
				[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" Email Error"
				DB_SaveRecord(->[DIARY:12])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
				NEXT RECORD:C51([DIARY:12])
			End for 
		End if 
		//   ALERT("This eMail DID NOT send")
		Gen_Alert("This eMail DID NOT send")
	End if 
	
Else 
	$_l_EmailID:=-(AA_GetNextIDinMethod(->[EMAIL_ATTACHMENTS:103]Email_ID:2))
	DB_lockFile(->[DIARY:12])
	APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Email_ID:41:=$_l_EmailID)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
	If (False:C215)
		DB_lockFile(->[DIARY:12])
		APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Email_ID:41:=-(AA_GetNextIDinMethod(->[EMAIL_ATTACHMENTS:103]Email_ID:2)))
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
		ARRAY TO SELECTION:C261(WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Attachment_Path:3)
		DB_lockFile(->[EMAIL_ATTACHMENTS:103])
		APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:="")
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
		DB_lockFile(->[EMAIL_ATTACHMENTS:103])
		APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2:=[DIARY:12]Email_ID:41)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
	Else 
		EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 2; [DIARY:12]Diary_Code:3; $_l_EmailID)
		DB_lockFile(->[EMAIL_ATTACHMENTS:103])
		APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:="")
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
		//NOTE: here we have attachments belonging to several Diary records
		//BUT ONE EMAIL--CHECK THE RELATION WORKS OK
	End if 
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[DIARY:12])
		APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Email_Text:42:="")
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
		DB_lockFile(->[DIARY:12])
		APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" Cancelled")
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
	Else 
		FIRST RECORD:C50([DIARY:12])
		For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
			[DIARY:12]Email_Text:42:=""
			[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" Cancelled"
			DB_SaveRecord(->[DIARY:12])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			NEXT RECORD:C51([DIARY:12])
		End for 
	End if 
	
	//  ALERT("This eMail was cancelled")
	Gen_Alert("This eMail was cancelled")
End if 
ERR_MethodTrackerReturn("MailP_Let_GroupedEmail"; $_t_oldMethodName)
