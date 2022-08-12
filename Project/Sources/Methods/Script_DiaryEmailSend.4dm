//%attributes = {}
If (False:C215)
	//Project Method Name:      Script_DiaryEmailSend
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 14:26
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
	C_BOOLEAN:C305(<>Email_bo_Enabled)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index; $_l_Process)
	C_TEXT:C284($_t_EmailID; $_t_EmailSignature; $_t_EmailText; $_t_InsertText; $_t_oldMethodName; EMAIL_t_SendCalledFrom; vPerson)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Script_DiaryEmailSend")
//this is called from the form
If (<>Email_bo_Enabled)
	If ([DIARY:12]Email_ID:41<=0)
		If ([DIARY:12]Email_ID:41=0)
			[DIARY:12]Email_ID:41:=-(AA_GetNextIDinMethod(->[DIARY:12]Email_ID:41))  //Give a negative value until this email is sent
		End if 
		If (False:C215)
			READ WRITE:C146([EMAIL_ATTACHMENTS:103])
			ARRAY TO SELECTION:C261(WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; SD3_at_DocDiaryCode; [EMAIL_ATTACHMENTS:103]DiaryID:1; WS_al_EmailID; [EMAIL_ATTACHMENTS:103]Email_ID:2)
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:=[DIARY:12]Diary_Code:3)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Location:6:=Get_Email_Owner)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; EMAILupdateattachmentlocation)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
		Else 
			EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 2; [DIARY:12]Diary_Code:3; [DIARY:12]Email_ID:41)
		End if 
		
		If (Size of array:C274(SD2_at_EmailType)>0)
			EMAIL_t_SendCalledFrom:="Script_DiaryEmailSend"
			$_t_EmailID:=Email_Send(->SD2_at_EmailType; ->SD2_at_EmailName; ->SD2_at_EmailAddresses; vPerson; [DIARY:12]Email_From:38; [DIARY:12]Email_From:38; [DIARY:12]Email_Subject:40; ->WS_at_AttachmentsPath; ->[DIARY:12]Email_Text:42; True:C214)
			If ($_t_EmailID#"")
				If ([DIARY:12]Email_ID:41=0)
					[DIARY:12]Email_ID:41:=AA_GetNextIDinMethod(->[DIARY:12]Email_ID:41)
				Else 
					[DIARY:12]Email_ID:41:=Abs:C99([DIARY:12]Email_ID:41)
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
			READ WRITE:C146([EMAIL_ATTACHMENTS:103])
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2:=[DIARY:12]Email_ID:41)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			For ($_l_Index; 1; Records in selection:C76([EMAIL_ATTACHMENTS:103]))
				[EMAIL_ATTACHMENTS:103]Email_ID:2:=[DIARY:12]Email_ID:41
				If (Test path name:C476([EMAIL_ATTACHMENTS:103]Attachment_Path:3))=Is a document:K24:1
					[EMAIL_ATTACHMENTS:103]Document_Type:7:=_o_Document type:C528([EMAIL_ATTACHMENTS:103]Attachment_Path:3)
					[EMAIL_ATTACHMENTS:103]Document_Creator:8:=_o_Document creator:C529([EMAIL_ATTACHMENTS:103]Attachment_Path:3)
				End if 
				DB_SaveRecord(->[EMAIL_ATTACHMENTS:103])
				AA_CheckFileUnlocked(->[EMAIL_ATTACHMENTS:103]FileNo:5)
			End for 
			DB_SaveRecord(->[DIARY:12])
			AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
			If (Records in selection:C76([EMAIL_ATTACHMENTS:103])>0)
				$_l_Process:=New process:C317("DS_DocstoServer"; 128000; "Moving Documents"; [DIARY:12]Email_ID:41)
			End if 
			ACCEPT:C269
		End if 
	Else 
		// ALERT("This email is already sent")
		Gen_Alert("This email is already sent")
	End if 
Else 
	//ALERT("Email is not enabled")
	Gen_Alert("Email is not enabled")
End if 
ERR_MethodTrackerReturn("Script_DiaryEmailSend"; $_t_oldMethodName)
//Nigel Greenlee21/01/2010 18:09
//Nigel Greenlee20/11/2012 14:01 v7.0.0/1
//Nigel Greenlee20/11/2012 14:26 v7.0.0/1
ERR_MethodTrackerReturn("Script_DiaryEmailSend"; $_t_oldMethodName)
