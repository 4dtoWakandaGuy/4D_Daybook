//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_InLLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2009 08:07`Method: Diary_InLLPB
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>DataSize)
	//C_UNKNOWN(<>eLetAct)
	//C_UNKNOWN(<>QtnAct)
	//C_UNKNOWN(BgetTemplate)
	//C_UNKNOWN(cSave)
	//C_UNKNOWN(Enclosures)
	//C_UNKNOWN(Products)
	//C_UNKNOWN(ProductsD)
	//C_UNKNOWN(vCompCode)
	//C_UNKNOWN(vContCode)
	//C_UNKNOWN(vContName)
	//C_UNKNOWN(vCreate)
	//C_UNKNOWN(vEdit)
	//C_UNKNOWN(vFrom)
	//C_UNKNOWN(Write_2)
	//C_UNKNOWN(WriteDocument)
	//ARRAY BOOLEAN(DOC_lb_Recipients;0)
	//ARRAY LONGINT(DOC_al_FIeldLink;0)
	//ARRAY LONGINT(DOC_al_RecordID;0)
	//ARRAY LONGINT(DOC_al_TableLink;0)
	//ARRAY LONGINT(WS_al_EmailID;0)
	//ARRAY TEXT(DOC_at_RecordCode;0)
	//ARRAY TEXT(EMAIL_at_MailTypes;0)
	//ARRAY TEXT(PER_at_DefaultSignatures;0)
	//ARRAY TEXT(PER_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	//ARRAY TEXT(WT_at_EmailAttachments;0)
	//ARRAY TEXT(WT_at_EMailRecipients;0)
	C_BOOLEAN:C305($_bo_SetPrime; SD_bo_AdditionalRelations; $_bo_SetPrime; EMAIL_bo_DonotChangeSubject; SD_bo_AdditionalRelations)
	C_DATE:C307(vDate)
	C_LONGINT:C283(<>DataSize; $_l_ArraySize; $_l_Clash; $_l_IDFIeldNumber; $_l_Index; $_l_LinkRelations; $_l_MarkerEndPosition; $_l_MarkerPosition; $_l_ObjectBottom; $_l_Objecteft; $_l_ObjectRight)
	C_LONGINT:C283($_l_ObjectTop; $_l_OK; $_l_RecordsinSelection; $_l_SuggestedHeight; BgetTemplate; cSave; DOC_l_BUT1; DOC_l_But2; DOC_l_BUT3; DOC_l_BUT4; DOC_l_BUT5)
	C_LONGINT:C283(DOC_l_BUT7; DOC_l_BUT8; vCreate; vEdit; write; WRITE_2; WS_l_ContactElement; WS_l_SelectedEmailName; $_l_ArraySize; $_l_Clash; $_l_IDFIeldNumber)
	C_LONGINT:C283($_l_Index; $_l_LinkRelations; $_l_MarkerEndPosition; $_l_MarkerPosition; $_l_ObjectBottom; $_l_Objecteft; $_l_ObjectRight; $_l_ObjectTop; $_l_OK; $_l_RecordsinSelection; $_l_SuggestedHeight)
	C_LONGINT:C283(DOC_l_BUT6; DOC_l_BUT9; WS_l_ContactElement; WS_l_SelectedEmailName)
	C_PICTURE:C286($_pic_Picture; write)
	C_POINTER:C301($_ptr_Field; $_ptr_Field2; $_ptr_Table; $_ptr_Field; $_ptr_Field2; $_ptr_Table)
	C_REAL:C285($_l_Denormalised)
	C_TEXT:C284(<>eLetAct; <>QtnAct; <>SYS_t_4DWriteType; $_t_ApplicationPath; $_t_ContactCode; $_t_CurrentInputForm; $_t_NewEmailAddress; $_t_oldMethodName; $_t_RelationName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3; DOC_t_COL2; DOC_t_COL3; DOC_t_COL4; DOC_t_COL5; DOC_t_COL6; DOC_t_COL7; DOC_t_COL8; DOC_t_COL9; DOC_t_DocumentCode; DOC_T_EmailFromcom)
	C_TEXT:C284(DOC_t_HED1; DOC_t_HED3; DOC_t_HED4; DOC_t_HED5; DOC_t_HED6; DOC_t_HED7; DOC_t_HED8; DOC_t_HED9; EMAIL_t_Attachment; EMAIL_t_AttachmentsLabel; EMAIL_t_EmailBody)
	C_TEXT:C284(EMAIL_T_EmailSignature; EMAIL_t_EmailType; EMAIL_t_FooterText; EMAIL_t_InsText; EMAIL_t_RecipientsLabel; Enclosures; Products; ProductsD; vCompCode; vContCode; vContName)
	C_TEXT:C284(vFrom; WIN_t_CurrentInputForm; WriteDocument; WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName; <>LetAct; <>SYS_t_4DWriteType; $_t_ApplicationPath; $_t_ContactCode; $_t_CurrentInputForm)
	C_TEXT:C284($_t_NewEmailAddress; $_t_oldMethodName; $_t_RelationName; DB_t_CurrentFormUsage; DOC_t_COL1; DOC_t_DocumentCode; DOC_T_EmailFromcom; DOC_t_HED2; EMAIL_t_Attachment; EMAIL_t_AttachmentsLabel; EMAIL_t_EmailBody)
	C_TEXT:C284(EMAIL_T_EmailSignature; EMAIL_t_EmailTo; EMAIL_t_EmailType; EMAIL_t_FooterText; EMAIL_t_InsText; EMAIL_t_RecipientsLabel; Vperson; WIN_t_CurrentInputForm; WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InLLPB")

ARRAY TEXT:C222(SD2_at_EmailType; 0)
WS_l_ContactElement:=0
ARRAY TEXT:C222(WS_at_Attachments; 0)
ARRAY TEXT:C222(WS_at_AttachmentsPath; 0)
ARRAY TEXT:C222(SD2_at_EmailAddresses; 0)
ARRAY TEXT:C222(SD2_at_EmailName; 0)
ARRAY TEXT:C222(SD2_at_ContactIDs; 0)
ARRAY TEXT:C222(SD3_at_DocDiaryCode; 0)
ARRAY LONGINT:C221(WS_al_EmailID; 0)
EMAIL_t_InsText:=""  //BSW 24/06/02

WS_l_SelectedEmailName:=0
WS_l_ContactElement:=0
Case of 
	: (DB_t_CurrentFormUsage="QOrd")
		If ([DIARY:12]Company_Code:1="")
			[DIARY:12]Company_Code:1:=[ORDERS:24]Company_Code:1
		End if 
		If ([DIARY:12]Contact_Code:2="")
			[DIARY:12]Contact_Code:2:=[ORDERS:24]Contact_Code:2
		End if 
		If ([DIARY:12]Order_Code:26="")
			[DIARY:12]Order_Code:26:=[ORDERS:24]Order_Code:3
		End if 
	: (DB_t_CurrentFormUsage="QJob")
		If ([DIARY:12]Company_Code:1="")
			[DIARY:12]Company_Code:1:=[ORDERS:24]Company_Code:1
		End if 
		If ([DIARY:12]Contact_Code:2="")
			[DIARY:12]Contact_Code:2:=[ORDERS:24]Contact_Code:2
		End if 
		If ([DIARY:12]Job_Code:19="")
			[DIARY:12]Job_Code:19:=[JOBS:26]Job_Code:1
		End if 
	: (DB_t_CurrentFormUsage="E")
		If ([DIARY:12]Company_Code:1="")
			[DIARY:12]Company_Code:1:=vCompCode
		End if 
		If ([DIARY:12]Contact_Code:2="")
			[DIARY:12]Contact_Code:2:=vContCode
		End if 
End case 
Diary_InB
vDate:=[DIARY:12]Date_Do_From:4
Letter_Date
OBJECT SET ENTERABLE:C238([DIARY:12]Document_Code:15; False:C215)
//If (◊Write="SW") SuperWrite out 24/04/02 pb
//  RELATE ONE([DIARY]Document Code)
// $_l_MarkerPosition:=SW Set Area (Write;[DOCUMENTS]Write_)
// If ($_l_MarkerPosition=0)
//   $_l_MarkerPosition:=SW Options (Write;0;0;0;0;1;1;0)
//   $_l_MarkerPosition:=SW Area Mode (Write;1;1)
// End if
// vEdit:=0
//  DISABLE MENU ITEM(2051;3)
//Else
If ([DIARY:12]Action_Code:9="")
	OBJECT SET TITLE:C194(BgetTemplate; "Select Template")  //for template button
	//i have not completed the template setup yet
	If (DB_t_CurrentFormUsage="Q@")  //its a quote
		Let_No("Q")
		//check for number clash
		
		Repeat 
			SET QUERY DESTINATION:C396(3; $_l_Clash)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
			SET QUERY DESTINATION:C396(0)
			If ($_l_Clash>0)
				Let_No("Q")
			End if 
		Until ($_l_Clash=0)
		
		DOC_t_DocumentCode:="Q"+DOC_t_DocumentCode
		[DIARY:12]Document_Code:15:=DOC_t_DocumentCode
		[DIARY:12]Action_Code:9:=<>QtnAct
		//```````
		//Find the template to use
		
		Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
		$_pic_Picture:=WR Area to picture:P12000:139(Write_2; 1; 1)
		WR PICTURE TO AREA:P12000:141(write; $_pic_Picture)
		WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
		If (Documents_4DWriteAccessType(False:C215)="W@")  //4D write quote
			If (Is Windows:C1573)
				WR Open_DocUMENT(write; "QtnTem.4WR")
				DOC_SetWriteModifiable(write; 2; True:C214)
			Else 
				WR Open_DocUMENT(write; "Quote Template")
				DOC_SetWriteModifiable(write; 2; True:C214)
			End if 
		Else   //text templates!!!
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="Qtn Tem")
			$_l_RecordsinSelection:=Records in selection:C76([DOCUMENTS:7])
			
			
			
			SET QUERY DESTINATION:C396(3; $_l_Clash)
			//Check for number clash
			//`dont think we need this bit-it should append the QTN TEM
			Repeat 
				Let_No("Q")
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
			Until ($_l_Clash=0)
			SET QUERY DESTINATION:C396(0)
			If ($_l_RecordsinSelection>0)
				DUPLICATE RECORD:C225([DOCUMENTS:7])
			Else   //no template
				//CREATE RECORD([DOCUMENTS])  `Added NG Feb 2001
			End if 
			[DOCUMENTS:7]Document_Code:1:="Q"+DOC_t_DocumentCode
			[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
		End if   //template selected
		//specific handling for orders and jobs
		If ((DB_t_CurrentFormUsage="QOrd") | (DB_t_CurrentFormUsage="QJob"))
			If ([ORDERS:24]Person:5#"")
				[DIARY:12]Person:8:=[ORDERS:24]Person:5
			End if 
			If (Documents_4DWriteAccessType(False:C215)="W@")
				Diary_InLLPQtnR
			Else 
				$_l_MarkerPosition:=Position:C15("<Products>"; [DOCUMENTS:7]Text:3)
				If ($_l_MarkerPosition>0)
					$_l_MarkerEndPosition:=$_l_MarkerPosition+10
					[DOCUMENTS:7]Text:3:=Substring:C12([DOCUMENTS:7]Text:3; 1; $_l_MarkerPosition-1)+Products+Substring:C12([DOCUMENTS:7]Text:3; $_l_MarkerEndPosition; 32000)
				End if 
				$_l_MarkerPosition:=Position:C15("<ProductsD>"; [DOCUMENTS:7]Text:3)
				If ($_l_MarkerPosition>0)
					$_l_MarkerEndPosition:=$_l_MarkerPosition+10
					[DOCUMENTS:7]Text:3:=Substring:C12([DOCUMENTS:7]Text:3; 1; $_l_MarkerPosition-1)+ProductsD+Substring:C12([DOCUMENTS:7]Text:3; $_l_MarkerEndPosition; 32000)
				End if 
				$_l_MarkerPosition:=Position:C15("<Enclosures>"; [DOCUMENTS:7]Text:3)
				If ($_l_MarkerPosition>0)
					$_l_MarkerEndPosition:=$_l_MarkerPosition+12
					[DOCUMENTS:7]Text:3:=Substring:C12([DOCUMENTS:7]Text:3; 1; $_l_MarkerPosition-1)+Enclosures+Substring:C12([DOCUMENTS:7]Text:3; $_l_MarkerEndPosition; 32000)
				End if 
			End if 
		End if   //end quote and job handling
	Else   //end "Q" handling
		//`````
		//modify this probably
		If (WIN_t_CurrentInputForm="Diary_InEmail")  //new record
			ARRAY TEXT:C222(WT_at_EMailRecipients; 0)
			EMAIL_t_AttachmentsLabel:="Attachments"
			EMAIL_t_RecipientsLabel:="Recipients"
			[DIARY:12]Email_From:38:=GetEmailSender
			
			DOC_T_EmailFromcom:=Vperson+"<"+[DIARY:12]Email_From:38+">"
			EMAIL_t_FooterText:=""
			EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+Char:C90(13)
			EMAIL_T_EmailSignature:=GetEmailSignature
			$_l_ArraySize:=Find in array:C230(PER_at_EmailAddresses; [DIARY:12]Email_From:38)
			If ($_l_ArraySize>0)
				If (PER_at_DefaultSignatures{$_l_ArraySize}#"")
					EMAIL_T_EmailSignature:=PER_at_DefaultSignatures{$_l_ArraySize}
				End if 
			End if 
			//      EMAIL_t_EmailBody:=Char(13)+EMAIL_T_EmailSignature  `EMAIL_t_InsText+Char(13)+
			EMAIL_t_EmailBody:=Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  //PB 26/06/02
			[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
			Let_No("E")
			SET QUERY DESTINATION:C396(3; $_l_Clash)
			Repeat 
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
				If ($_l_Clash>0)
					Let_No("E")
				End if 
			Until ($_l_Clash=0)
			SET QUERY DESTINATION:C396(0)
			[DIARY:12]Document_Code:15:="E"+DOC_t_DocumentCode
			[DIARY:12]Action_Code:9:=<>eLetAct
			If (<>eLetAct="")
				[DIARY:12]Action_Code:9:="Email"
			End if 
			
		Else 
			Let_No("L")
			SET QUERY DESTINATION:C396(3; $_l_Clash)
			Repeat 
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
				If ($_l_Clash>0)
					Let_No("L")
					DOC_t_DocumentCode:="L"+DOC_t_DocumentCode
				End if 
			Until ($_l_Clash=0)
			SET QUERY DESTINATION:C396(0)
			[DIARY:12]Document_Code:15:="L"+DOC_t_DocumentCode
			[DIARY:12]Action_Code:9:=<>LetAct
			//Find the template to use
			Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
			$_pic_Picture:=WR Area to picture:P12000:139(Write_2; 1; 1)
			WR PICTURE TO AREA:P12000:141(write; $_pic_Picture)
			WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
			//WR DELETE OFFSCREEN AREA (Write)
			//QUERY([DOCUMENTS];[DOCUMENTS]LDocument_Code="FMW99-MM&E")
			If (Documents_4DWriteAccessType(False:C215)="W@")
				If (Is Windows:C1573)
					$_t_ApplicationPath:=PathFromPathName(Application file:C491)
					WriteDocument:=$_t_ApplicationPath+"LetTem.4WR"
					If (Test path name:C476(WriteDocument)=1)
						WR Open_DocUMENT(write; WriteDocument)
						DOC_SetWriteModifiable(write; 2; True:C214)
					Else 
						WR PICTURE TO AREA:P12000:141(write; [DOCUMENTS:7]Write_:5)
						DOC_SetWriteModifiable(write; 2; True:C214)
					End if 
					
					
				Else 
					$_t_ApplicationPath:=PathFromPathName(Application file:C491)
					WriteDocument:=$_t_ApplicationPath+"Letter Template"
					If (Test path name:C476(WriteDocument)=1)
						WR Open_DocUMENT(write; WriteDocument)
						DOC_SetWriteModifiable(write; 2; True:C214)
					Else 
						WR PICTURE TO AREA:P12000:141(write; [DOCUMENTS:7]Write_:5)
						DOC_SetWriteModifiable(write; 2; True:C214)
					End if 
					
				End if 
			Else 
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="Let Tem")
				If (Records in selection:C76([DOCUMENTS:7])>0)
					DUPLICATE RECORD:C225([DOCUMENTS:7])
					//HERE SET THE CLASS OF THAT DOCUMENT
					[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
					[DOCUMENTS:7]Document_Code:1:=DOC_t_DocumentCode
					[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
				End if 
			End if 
		End if 
	End if 
	Diary_InLLPHead
Else   // action code set
	RELATE ONE:C42([DIARY:12]Document_Code:15)
	//QUERY([DOCUMENTS];[DOCUMENTS]LDocument_Code="FMW99-MM&E")
	
	$_t_CurrentInputForm:=WIN_t_CurrentInputForm
	If ([DOCUMENTS:7]Document_Class:14=Text Email)
		If (WIN_t_CurrentInputForm#"Diary_InEmail")
			$_t_CurrentInputForm:="Diary_InEmail"
			//GOTO PAGE(2)
		End if 
	End if 
	If (WIN_t_CurrentInputForm="Diary_InEmail") | ($_t_CurrentInputForm="Diary_InEmail")
		DOC_t_DocumentCode:=[DIARY:12]Document_Code:15
		QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1=[DIARY:12]Diary_Code:3)
		SELECTION TO ARRAY:C260([EMAIL_RECIPIENTS:104]Classification:2; SD2_at_EmailType; [EMAIL_RECIPIENTS:104]Email_Address:3; SD2_at_EmailAddresses; [EMAIL_RECIPIENTS:104]ContactID:4; SD2_at_ContactIDs)
		$_t_ContactCode:=[DIARY:12]Contact_Code:2
		If ([DIARY:12]Email_ID:41<=0)
			QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
		Else 
			//this is needed so that where a group of diary items relate to a single email
			//there is only one group of records containing the attachments
			QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2=[DIARY:12]Email_ID:41)
		End if 
		SELECTION TO ARRAY:C260([EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Email_ID:2; WS_al_EmailID; [EMAIL_ATTACHMENTS:103]DiaryID:1; SD3_at_DocDiaryCode)
		ARRAY TEXT:C222(SD2_at_EmailName; Size of array:C274(SD2_at_ContactIDs))
		For ($_l_Index; 1; Size of array:C274(SD2_at_EmailType))
			If (SD2_at_ContactIDs{$_l_Index}#"")
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactIDs{$_l_Index})
				SD2_at_EmailName{$_l_Index}:=[CONTACTS:1]Contact_Name:31
			End if 
		End for 
		EMAIL_t_RecipientsLabel:="Recipients"
		EMAIL_t_AttachmentsLabel:="Attachments"
		OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; True:C214)
		OBJECT SET VISIBLE:C603(WT_at_EMailRecipients; True:C214)
		If ([DIARY:12]Document_Code:15#"")  //it is not a new document
			RELATE ONE:C42([DIARY:12]Document_Code:15)
			If ([DOCUMENTS:7]Document_Class:14=Text Email)  //it is a letter)
				DOC_T_EmailFromcom:=Vperson+"<"+[DIARY:12]Email_From:38+">"
				//BUTTON TEXT(BgetTemplate;"Modify eMail")  `BSW 6/08/02 for template button
				
				EMAIL_t_EmailBody:=[DOCUMENTS:7]Text:3
				[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
				[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
				If ([DIARY:12]Email_Subject:40="")  //BSW 1/07/02
					[DIARY:12]Email_Subject:40:=[DOCUMENTS:7]Heading:2
				Else 
					
				End if 
				cSave:=1
				vCreate:=0
				If ([DIARY:12]Email_ID:41>0)
					OBJECT SET ENTERABLE:C238([DIARY:12]Email_Text:42; False:C215)
				End if 
			Else 
				//it is a template-so copy it first
				If ([DOCUMENTS:7]Document_Class:14=Text Email Template)
					DUPLICATE RECORD:C225([DOCUMENTS:7])
					Let_No("E")
					Set_DocumentCode(2; "E"; DOC_t_DocumentCode)
					[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
					EMAIL_t_EmailBody:=[DOCUMENTS:7]Text:3
					OBJECT SET ENTERABLE:C238([DIARY:12]Email_Text:42; True:C214)
					[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
					QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1=[DIARY:12]Diary_Code:3)
					SELECTION TO ARRAY:C260([EMAIL_RECIPIENTS:104]Classification:2; SD2_at_EmailType; [EMAIL_RECIPIENTS:104]Email_Address:3; SD2_at_EmailAddresses; [EMAIL_RECIPIENTS:104]ContactID:4; SD2_at_ContactIDs)
					$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
					If ([DIARY:12]Email_ID:41>0)
						QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
					Else 
						//this is needed so that where a group of diary items relate to a single email
						//there is only one group of records containing the attachments
						
						QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2=[DIARY:12]Email_ID:41)
					End if 
					SELECTION TO ARRAY:C260([EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Email_ID:2; WS_al_EmailID; [EMAIL_ATTACHMENTS:103]DiaryID:1; SD3_at_DocDiaryCode)
					
					ARRAY TEXT:C222(SD2_at_EmailName; Size of array:C274(SD2_at_ContactIDs))
					For ($_l_Index; 1; Size of array:C274(SD2_at_EmailType))
						If (SD2_at_ContactIDs{$_l_Index}#"")
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactIDs{$_l_Index})
							SD2_at_EmailName{$_l_Index}:=[CONTACTS:1]Contact_Name:31
						End if 
					End for 
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
					[DIARY:12]Email_From:38:=GetEmailSender
					EMAIL_t_FooterText:=""
					EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+[DIARY:12]Email_From:38+Char:C90(13)+Char:C90(13)
					EMAIL_T_EmailSignature:=GetEmailSignature
					//         EMAIL_t_EmailBody:=Char(13)+EMAIL_T_EmailSignature  `EMAIL_t_InsText+Char(13)+
					EMAIL_t_EmailBody:=Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  //26/06/02 pb
					[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
					If ([DIARY:12]Email_Subject:40="")
						[DIARY:12]Email_Subject:40:=[DOCUMENTS:7]Heading:2  //BSW 6/08/02
					End if 
					[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
					cSave:=1
					vCreate:=0
					If ([DIARY:12]Email_ID:41>0)
						OBJECT SET ENTERABLE:C238([DIARY:12]Email_Text:42; False:C215)
					End if 
				End if 
			End if 
			
		Else 
			OBJECT SET TITLE:C194(BgetTemplate; "Select Template")  //for template button
			REDUCE SELECTION:C351([DOCUMENTS:7]; 0)
			Let_No("E")
			SET QUERY DESTINATION:C396(3; $_l_Clash)
			Repeat 
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
				If ($_l_Clash>0)
					Let_No("E")
					
				End if 
			Until ($_l_Clash=0)
			SET QUERY DESTINATION:C396(0)
			[DIARY:12]Document_Code:15:="E"+DOC_t_DocumentCode
			ARRAY TEXT:C222(WT_at_EMailRecipients; 2)
			WT_at_EMailRecipients{1}:="Add Receipients"
			WT_at_EMailRecipients{2}:="Del Receipients"
			EMAIL_t_RecipientsLabel:=WT_at_EMailRecipients{1}
			ARRAY TEXT:C222(WT_at_EMailRecipients; 0)
			OBJECT SET VISIBLE:C603(WT_at_EMailRecipients; True:C214)
			EMAIL_t_RecipientsLabel:=""
			OBJECT SET VISIBLE:C603(EMAIL_t_RecipientsLabel; True:C214)
			ARRAY TEXT:C222(WT_at_EmailAttachments; 2)
			WT_at_EmailAttachments{1}:="Add Attachments"
			WT_at_EmailAttachments{2}:="Del Attachments"
			EMAIL_t_AttachmentsLabel:=WT_at_EmailAttachments{1}
			[DIARY:12]Email_From:38:=GetEmailSender
			EMAIL_t_FooterText:=""
			If (False:C215)  //BSW 24/06/01 - changed as directed by steve
				EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+[DIARY:12]Email_From:38+Char:C90(13)+Char:C90(13)+"Daybook 4.2.014a DEMO"
			Else 
				EMAIL_t_InsText:=""
			End if 
			EMAIL_T_EmailSignature:=GetEmailSignature
			//      EMAIL_t_EmailBody:=Char(13)+EMAIL_T_EmailSignature  `EMAIL_t_InsText+Char(13)+
			EMAIL_t_EmailBody:=Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  //26/06/02 pb
			[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
		End if 
		
	Else 
		
		DOC_t_DocumentCode:=[DIARY:12]Document_Code:15
		If ([DIARY:12]Document_Code:15#"")  //it is not a new document
			OBJECT SET TITLE:C194(BgetTemplate; "Modify Document")  //for template button
			//just get the document and set it to non enterable
			//here if the user wants to copy the document then
			RELATE ONE:C42([DIARY:12]Document_Code:15)
			If (Documents_4DWriteAccessType(False:C215)="W@")
				If (Picture size:C356([DOCUMENTS:7]Write_:5)>0)
					WR PICTURE TO AREA:P12000:141(write; [DOCUMENTS:7]Write_:5)
				End if 
				If (Documents_4DWriteAccessType(False:C215)="W@")
					DOC_SetWriteModifiable(write; 2; False:C215)
				Else 
					SetFontsByPointerParameter(<>DataSize; ""; 0; ->[DOCUMENTS:7]Heading:2)
					//Set_Fonts ("[DOCUMENTS]Heading+[DOCUMENTS]Text";◊DataSize)
					OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Text:3; False:C215)
				End if 
				
			Else 
				OBJECT SET TITLE:C194(BgetTemplate; "Select Template")  //for template button
				REDUCE SELECTION:C351([DOCUMENTS:7]; 0)
				//new diary item
				Let_No("L")
				//DOC_t_DocumentCode:="L"+DOC_t_DocumentCode
				SET QUERY DESTINATION:C396(3; $_l_Clash)
				Repeat 
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
					If ($_l_Clash>0)
						Let_No("L")
						//DOC_t_DocumentCode:="L"+DOC_t_DocumentCode
					End if 
				Until ($_l_Clash=0)
				SET QUERY DESTINATION:C396(0)
				[DIARY:12]Document_Code:15:="L"+DOC_t_DocumentCode
				//when the user selects a template
				//we will copy the template to a DOCUMENT of that code
				//if the user does not select a template
				//then we will create a DOCUMENT of that code
				If (Documents_4DWriteAccessType(False:C215)="W@")
					DOC_SetWriteModifiable(write; 2; True:C214)
				Else 
					Set_Fonts("[DOCUMENTS]Heading+[DOCUMENTS]Text"; <>DataSize)
				End if 
			End if 
		End if 
	End if 
	
	If (<>SYS_t_4DWriteType="WS")  // 4DWrite "silver"
		WR TEXT ACCESS:P12000:42(write; 1)
		vEdit:=0
	Else 
		vEdit:=1
	End if 
	If ((DB_GetModuleSettingByNUM(1))=5)
		DB_MenuAction("Functions"; "Add Product Items"; 3; "")
	End if 
	//End if
	If ([DIARY:12]Company_Code:1#"")
		MCont_Add("")
	End if 
	If ([DIARY:12]Person:8#"")
		vFrom:=[DIARY:12]Person:8
		[DIARY:12]Email_Person:39:=[DIARY:12]Person:8
	End if 
	cSave:=0
	vCreate:=0
	If (False:C215)
		If ((Records in selection:C76([EMAIL_RECIPIENTS:104])<1) & ([DIARY:12]Contact_Code:2#""))
			CREATE RECORD:C68([EMAIL_RECIPIENTS:104])
			[EMAIL_RECIPIENTS:104]DiaryID:1:=[DIARY:12]Diary_Code:3
			[EMAIL_RECIPIENTS:104]Classification:2:="To"
			[EMAIL_RECIPIENTS:104]Email_Address:3:=EMAIL_t_EmailTo
		End if 
		RELATE MANY:C262([DIARY:12]Diary_Code:3)
	Else 
		If (WIN_t_CurrentInputForm="Diary_InEmail")
			If (EMAIL_t_EmailTo="") & ([DIARY:12]Contact_Code:2#"")
				//there is no email for the recipient
				Repeat 
					$_t_NewEmailAddress:=Request:C163("Please enter eMail address for "+vContName; "")
					$_l_OK:=OK
				Until (OK=0) | ($_t_NewEmailAddress#"")
				If ($_l_OK=0)
					CANCEL:C270
				Else 
					EMAIL_t_EmailTo:=$_t_NewEmailAddress
				End if 
				
			End if 
			$_l_ArraySize:=Find in array:C230(SD2_at_EmailAddresses; EMAIL_t_EmailTo)
			
			If ($_l_ArraySize<0)
				INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
				WS_l_ContactElement:=Size of array:C274(SD2_at_EmailType)
				$_l_ArraySize:=Size of array:C274(SD2_at_EmailType)
				
				SD2_at_EmailType{$_l_ArraySize}:="To"
				SD2_at_EmailAddresses{$_l_ArraySize}:=EMAIL_t_EmailTo
				SD2_at_ContactIDs{$_l_ArraySize}:=[DIARY:12]Contact_Code:2
				SD2_at_EmailName{$_l_ArraySize}:=vContName
				$_l_ArraySize:=Size of array:C274(SD2_at_EmailType)
			Else 
				WS_l_ContactElement:=$_l_ArraySize
			End if 
			WS_l_SelectedEmailName:=$_l_ArraySize
			EMAIL_t_EmailType:=SD2_at_EmailType{WS_l_ContactElement}
			WS_t_EmailAddress:=SD2_at_EmailAddresses{WS_l_ContactElement}
			WS_t_EmailName:=SD2_at_EmailName{WS_l_ContactElement}
		End if 
		WS_t_ContactID:=[DIARY:12]Contact_Code:2
		If (EMAIL_t_Attachment#"")
			INSERT IN ARRAY:C227(WS_at_Attachments; 9999; 1)
			INSERT IN ARRAY:C227(WS_at_AttachmentsPath; 9999; 1)
			INSERT IN ARRAY:C227(WS_al_EmailID; 9999; 1)
			INSERT IN ARRAY:C227(SD3_at_DocDiaryCode; 9999; 1)
			WS_at_Attachments{Size of array:C274(WS_at_Attachments)}:=FileNamefromPath(EMAIL_t_Attachment)
			WS_at_AttachmentsPath{Size of array:C274(WS_at_AttachmentsPath)}:=EMAIL_t_Attachment
			EMAIL_t_Attachment:=""
			
			
		End if 
	End if 
	AA_LoadNameArrays
	
	If (WIN_t_CurrentInputForm="Diary_InEmail") | ([DOCUMENTS:7]Document_Class:14=Text Email)
		SETEMAILFORMOBJECTS
	End if 
	If (False:C215)  // Until new area ready
		ARRAY BOOLEAN:C223(DOC_lb_Recipients; 0)
		
		LB_SetupListbox(->DOC_lb_Recipients; "DOC_t"; "DOC_L"; 1; ->SD2_at_EmailType; ->SD2_at_EmailName; ->SD2_at_EmailAddresses; ->SD2_at_ContactIDs)
		LB_SetColumnHeaders(->DOC_lb_Recipients; "DOC_L"; 1; "To-CC-Bcc"; "Name"; "Email Address"; "ID")
		ARRAY TEXT:C222(EMAIL_at_MailTypes; 3)
		EMAIL_at_MailTypes{1}:="To"
		EMAIL_at_MailTypes{2}:="CC"
		EMAIL_at_MailTypes{3}:="Bcc"
		
		LB_SetChoiceList("EmailType"; ->EMAIL_at_MailTypes; ->SD2_at_EmailType)
		LB_SetColumnWidths(->DOC_lb_Recipients; "DOC_t"; 1; 87; 187; 88; 0)
		
		LB_SetEnterable(->DOC_lb_Recipients; False:C215; 0)
		LB_SetScroll(->DOC_lb_Recipients; -3; -2)
		LB_StyleSettings(->DOC_lb_Recipients; "Black"; 9; "DOC_t"; ->[ACCOUNTS:32])
		$_l_ArraySize:=Size of array:C274(SD2_at_EmailType)
		If ($_l_ArraySize=0)
			$_l_ArraySize:=1
		End if 
		$_l_SuggestedHeight:=16+($_l_ArraySize*13)
		
		OBJECT GET COORDINATES:C663(DOC_lb_Recipients; $_l_Objecteft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(DOC_lb_Recipients; $_l_Objecteft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectTop+$_l_SuggestedHeight; *)
		If (SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}="")
			LB_SetEnterable(->DOC_lb_Recipients; True:C214; 0)
			LB_GoToCell(->DOC_lb_Recipients; 3; Size of array:C274(SD2_at_EmailAddresses))
		End if 
	End if 
	If (SD_bo_AdditionalRelations)
		If ([DIARY:12]x_ID:50=0)
			[DIARY:12]x_ID:50:=AA_GetNextID(->[DIARY:12]x_ID:50)
		End if 
		// ARRAY LONGINT(DOC_al_TableLink;0)
		//ARRAY LONGINT(DOC_al_FIeldLink;0)
		//ARRAY LONGINT(DOC_al_RecordID;0)
		//ARRAY STRING(55;DOC_at_RecordCode;0)
		//The above contain the record details of relations to create-note that if they are set the PRIME relation will be set to the first one
		For ($_l_LinkRelations; 1; Size of array:C274(DOC_al_TableLink))
			//NOTE THAT THE 1ST RELATION WILL BE THE PRIME RELATION-DOES NOT REALLY MATTHER THOUGH
			$_bo_SetPrime:=False:C215
			If ($_l_LinkRelations=1)
				$_bo_SetPrime:=True:C214
			End if 
			If ($_bo_SetPrime)
				[DIARY:12]Data_Source_Table:49:=DOC_al_TableLink{$_l_LinkRelations}
			End if 
			$_t_RelationName:=""
			Case of 
					
				: (DOC_al_TableLink{$_l_LinkRelations}=Table:C252(->[SERVICE_CALLS:20])) & ([DIARY:12]Call_Code:25="")
					[DIARY:12]Call_Code:25:=DOC_at_RecordCode{$_l_LinkRelations}
					$_t_RelationName:="Service Call"
				: (DOC_al_TableLink{$_l_LinkRelations}=Table:C252(->[COMPANIES:2])) & ([DIARY:12]Company_Code:1="")
					[DIARY:12]Company_Code:1:=DOC_at_RecordCode{$_l_LinkRelations}
					$_t_RelationName:="Company"
				: (DOC_al_TableLink{$_l_LinkRelations}=Table:C252(->[CONTACTS:1])) & ([DIARY:12]Contact_Code:2="")
					[DIARY:12]Contact_Code:2:=DOC_at_RecordCode{$_l_LinkRelations}
					$_t_RelationName:="Contact"
					
				: (DOC_al_TableLink{$_l_LinkRelations}=Table:C252(->[JOBS:26])) & ([DIARY:12]Job_Code:19="")
					[DIARY:12]Job_Code:19:=DOC_at_RecordCode{$_l_LinkRelations}
					$_t_RelationName:="Job"
				: (DOC_al_TableLink{$_l_LinkRelations}=Table:C252(->[ORDERS:24])) & ([DIARY:12]Order_Code:26="")
					[DIARY:12]Order_Code:26:=DOC_at_RecordCode{$_l_LinkRelations}
					$_t_RelationName:="Order"
				: (DOC_al_TableLink{$_l_LinkRelations}=Table:C252(->[PRODUCTS:9])) & ([DIARY:12]Product_Code:13="")
					[DIARY:12]Product_Code:13:=DOC_at_RecordCode{$_l_LinkRelations}
					$_t_RelationName:="Product"
				: (DOC_al_TableLink{$_l_LinkRelations}=Table:C252(->[JOB_STAGES:47])) & ([DIARY:12]Stage_Code:21="")
					[DIARY:12]Stage_Code:21:=DOC_at_RecordCode{$_l_LinkRelations}
					$_t_RelationName:="Job Stage"
			End case 
			CREATE RECORD:C68([xDiaryRelations:137])
			[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
			
			If (Count parameters:C259>=4)
				If (DOC_al_RecordID{$_l_LinkRelations}=0)
					$_ptr_Field:=Field:C253(DOC_al_TableLink{$_l_LinkRelations}; DOC_al_FIeldLink{$_l_LinkRelations})
					If ($_ptr_Field->#DOC_at_RecordCode{$_l_LinkRelations})  //Note the $2  must always be pointer at the code field  not the ID field
						$_ptr_Table:=Table:C252(DOC_al_TableLink{$_l_LinkRelations})
						QUERY:C277($_ptr_Table->; $_ptr_Field->=DOC_at_RecordCode{$_l_LinkRelations})
					End if 
					$_l_IDFIeldNumber:=AA_GetIDFieldNum(DOC_al_TableLink{$_l_LinkRelations})
					If ($_l_IDFIeldNumber>0)
						$_ptr_Field2:=Field:C253(DOC_al_TableLink{$_l_LinkRelations}; $_l_IDFIeldNumber)
						[xDiaryRelations:137]xRecordID:4:=$_ptr_Field2->
					End if 
					
				Else 
					[xDiaryRelations:137]xRecordID:4:=DOC_al_RecordID{$_l_LinkRelations}
				End if 
				[xDiaryRelations:137]XRecord_Code:5:=DOC_at_RecordCode{$_l_LinkRelations}
			Else 
				$_ptr_Field:=Field:C253(DOC_al_TableLink{$_l_LinkRelations}; DOC_al_FIeldLink{$_l_LinkRelations})
				If ($_ptr_Field->#DOC_at_RecordCode{$_l_LinkRelations})  //Note the $2  must always be pointer at the code field  not the ID field
					$_ptr_Table:=Table:C252(DOC_al_TableLink{$_l_LinkRelations})
					QUERY:C277($_ptr_Table->; $_ptr_Field->=DOC_at_RecordCode{$_l_LinkRelations})
				End if 
				$_l_IDFIeldNumber:=AA_GetIDFieldNum(DOC_al_TableLink{$_l_LinkRelations})
				If ($_l_IDFIeldNumber>0)
					$_ptr_Field2:=Field:C253(DOC_al_TableLink{$_l_LinkRelations}; $_l_IDFIeldNumber)
					[xDiaryRelations:137]xRecordID:4:=$_ptr_Field2->
				End if 
				[xDiaryRelations:137]XRecord_Code:5:=DOC_at_RecordCode{$_l_LinkRelations}
			End if 
			[xDiaryRelations:137]xTableNUM:3:=DOC_al_TableLink{$_l_LinkRelations}
			$_l_Denormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
			[xDiaryRelations:137]XRelationNUM:2:=$_l_Denormalised
			[xDiaryRelations:137]X_DisplayedName:6:=""
			[xDiaryRelations:137]x_RelationshipName:7:=$_t_RelationName
			DB_SaveRecord(->[xDiaryRelations:137])
			
		End for 
		
		
	End if 
	SD_bo_AdditionalRelations:=False:C215  //Make sure it is set to false now
End if 
ERR_MethodTrackerReturn("Diary_InLLPB"; $_t_oldMethodName)
