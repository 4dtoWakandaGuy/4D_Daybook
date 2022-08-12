If (False:C215)
	//object Name: [USER]SD2_EmailEntry.OModifyOrReSend
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; EMAIL_t_EmailBody; EMAIL_T_EmailSignature; EMAIL_t_InsText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_EmailEntry.OModifyOrReSend"; Form event code:C388)

//This button added on 08/07/08 - originally based on functionality moved from get template button (but changed as per discussion with Nigel)

//16/10/08, v631b120a -kmw. Modified the confirmation text below to reflect the truth that actually currently when an email is modified or re-sent the original details are lost
Gen_Confirm("Do you wish to be able to modify or re-send this (previously sent) email? "+Char:C90(13)+Char:C90(13)+"In the event that you send a modified version of this email or save a modified ve"+"rsion of it as a draf"+"t, the current details"+" will be overwritten."; "No"; "Yes")

If (OK=0)
	If (False:C215)  //kmw 08/07/08
		DUPLICATE RECORD:C225([DIARY:12])
		[DIARY:12]x_ID:50:=0
		DiarySetCode
		//the document should be loaded
		If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
		End if 
		Set_DocumentCode(3)
		[DOCUMENTS:7]Standard:9:=False:C215
		[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
		[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
		[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
		[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
		[DOCUMENTS:7]Document_Status:15:=1
		EMAIL_t_EmailBody:=Document_EmailTokens([DOCUMENTS:7]Text:3)
		EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+Char:C90(13)
		EMAIL_T_EmailSignature:=GetEmailSignature
		//   EMAIL_t_EmailBody:=EMAIL_t_EmailBody+Char(13)+EMAIL_T_EmailSignature  `BSW +Char(13)+vWT_
		EMAIL_t_EmailBody:=EMAIL_t_EmailBody+Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  //BSW +PB 26/06/02
		[DIARY:12]Email_Text:42:=Document_EmailTokens(EMAIL_t_EmailBody)
		DB_MenuAction("Functions"; "See Modulus Text"; 2; "")
		DB_MenuAction("Functions"; "See 4D Write Text"; 3; "")
		DB_MenuAction("Functions"; "Preview"; 3; "")
		// ENABLE MENU ITEM(2050;3)
		// DISABLE MENU ITEM(2050;4)
		// DISABLE MENU ITEM(2050;6)
	End if 
	
	SD2_CreateDiaryEmail(True:C214; [DIARY:12]Document_Code:15)  //kmw 08/07/08 - Create new eMail_Diary record and do so in a new process
	
	[DIARY:12]Email_ID:41:=0  //set Email_ID back to zero to indicate that it hasn't been sent (which once modified will be technically true for it's new form) and is therefore editable
	SD2_DiaryINLLPInterface("SD2_EmailEntry")
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_EmailEntry.OModifyOrReSend"; $_t_oldMethodName)  //added error tracker call 08/07/08 -kmw
