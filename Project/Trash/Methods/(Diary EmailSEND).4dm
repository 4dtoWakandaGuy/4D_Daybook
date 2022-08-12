//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary EmailSEND
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
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	//ARRAY TEXT(WT_at_EMailRecipients;0)
	C_BOOLEAN:C305(<>Email_bo_Enabled)
	C_LONGINT:C283($_l_EmailtoRow)
	C_TEXT:C284($_t_EmailID; $_t_Message; $_t_oldMethodName; EMAIL_t_Attachment; EMAIL_t_EmailBody; EMAIL_T_EmailSignature; EMAIL_t_EmailTo; EMAIL_t_EmailType; EMAIL_t_FooterText; EMAIL_t_InsText; EMAIL_t_SendCalledFrom)
	C_TEXT:C284(vContName; vperson)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary EmailSEND")
//GET EMAIL DATA

If (<>Email_bo_Enabled)
	If ([DIARY:12]Document_Code:15#"")
		RELATE ONE:C42([DIARY:12]Document_Code:15)
		If ([DOCUMENTS:7]Document_Class:14=Text Email Template) | ([DOCUMENTS:7]Document_Class:14=Text Email)
			
			
			ARRAY TEXT:C222(SD2_at_EmailType; 0)
			ARRAY TEXT:C222(WS_at_Attachments; 0)
			ARRAY TEXT:C222(WS_at_AttachmentsPath; 0)
			ARRAY TEXT:C222(SD3_at_DocDiaryCode; 0)
			ARRAY LONGINT:C221(WS_al_EmailID; 0)
			ARRAY TEXT:C222(SD2_at_EmailAddresses; 0)
			ARRAY TEXT:C222(SD2_at_EmailName; 0)
			ARRAY TEXT:C222(SD2_at_ContactIDs; 0)
			ARRAY TEXT:C222(WT_at_EMailRecipients; 0)
			[DIARY:12]Email_From:38:=GetEmailSender
			EMAIL_t_FooterText:=""
			EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+Char:C90(13)
			EMAIL_T_EmailSignature:=GetEmailSignature
			EMAIL_t_EmailBody:=EMAIL_t_InsText+Char:C90(13)+EMAIL_T_EmailSignature
			[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3+EMAIL_t_EmailBody
			If ([CONTACTS:1]Contact_Code:2#[DIARY:12]Contact_Code:2)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
			End if 
			If ([CONTACTS:1]Email_Before_At:30#"") & ([CONTACTS:1]EMail_After_At:24#"")
				EMAIL_t_EmailTo:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
			Else 
				EMAIL_t_EmailTo:=""
			End if 
			$_l_EmailtoRow:=Find in array:C230(SD2_at_EmailAddresses; EMAIL_t_EmailTo)
			If ($_l_EmailtoRow<0)
				INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
				SD2_at_EmailType{Size of array:C274(SD2_at_EmailType)}:="To"
				SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}:=EMAIL_t_EmailTo
				SD2_at_ContactIDs{Size of array:C274(SD2_at_ContactIDs)}:=[DIARY:12]Contact_Code:2
				SD2_at_EmailName{Size of array:C274(SD2_at_EmailName)}:=vContName
			End if 
			EMAIL_t_SendCalledFrom:="Diary EmailSEND"
			$_t_EmailID:=Email_Send(->SD2_at_EmailType; ->SD2_at_EmailName; ->SD2_at_EmailAddresses; vperson; [DIARY:12]Email_From:38; [DIARY:12]Email_From:38; [DIARY:12]Email_Subject:40; ->WS_at_AttachmentsPath; ->[DIARY:12]Email_Text:42; True:C214)
			If ($_t_EmailID#"")
				// [DIARY]Email_ID:=Num($_t_EmailID) `bsw 11/09/02 get next id this is not
				[DIARY:12]Email_ID:41:=AA_GetNextIDinMethod(->[DIARY:12]Email_ID:41)
			End if 
			
		Else 
			$_t_Message:=". To send a letter Via Email Select Print Letter"
			//     ALERT("The related document is not an eMail"+$_t_Message)
			Gen_Alert("The related document is not an eMail"+$_t_Message)
		End if 
		
	Else 
		//  ALERT("There is no related document")
		Gen_Alert("There is no related document.")
	End if 
End if 
ERR_MethodTrackerReturn("Diary EmailSEND"; $_t_oldMethodName)