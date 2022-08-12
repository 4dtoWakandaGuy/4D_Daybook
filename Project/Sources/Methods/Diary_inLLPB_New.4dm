//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_inLLPB_New
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   03/06/2010 18:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>LetAct)
	//C_UNKNOWN(<>QtnAct)
	//C_UNKNOWN(BgetTemplate)
	//C_UNKNOWN(cSave)
	//C_UNKNOWN(Products)
	//C_UNKNOWN(ProductsD)
	//C_UNKNOWN(vCompCode)
	//C_UNKNOWN(vContCode)
	//C_UNKNOWN(vContName)
	//C_UNKNOWN(vCreate)
	//C_UNKNOWN(vEdit)
	//C_UNKNOWN(vFrom)
	//C_UNKNOWN(write)
	//C_UNKNOWN(Write_2)
	//ARRAY LONGINT(DOC_al_FIeldLink;0)
	//ARRAY LONGINT(DOC_al_RecordID;0)
	//ARRAY LONGINT(DOC_al_TableLink;0)
	//ARRAY LONGINT(WS_al_EmailID;0)
	//ARRAY TEXT(DOC_at_RecordCode;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	//ARRAY TEXT(WT_at_EMailRecipients;0)
	C_BOOLEAN:C305($_bo_SetPrime; EMAIL_bo_DonotChangeSubject; SD_bo_AdditionalRelations; $_bo_newRecord; $_bo_SetPrime; SD_bo_AdditionalRelations)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_AdrressRow; $_l_CharacterPosition; $_l_CharacterPosition2; $_l_Clash; $_l_DocumentClass; $_l_IDFieldNumber; $_l_Index; $_l_OK; $_l_Page; $_l_RelationsIndex; BgetTemplate)
	C_LONGINT:C283(cSave; vCreate; vEdit; write; WRITE_2; WS_l_ContactElement; WS_l_SelectedEmailName; <>DataSize; $_l_AdrressRow; $_l_CharacterPosition; $_l_CharacterPosition2)
	C_LONGINT:C283($_l_Clash; $_l_DocumentClass; $_l_IDFieldNumber; $_l_Index; $_l_OK; $_l_Page; $_l_RelationsIndex; $SELECTED; WS_l_ContactElement; WS_l_SelectedEmailName)
	C_PICTURE:C286($_pic_4DWrite)
	C_POINTER:C301($_ptr_Field2; $_ptr_Table; $_ptr_Field; $_ptr_Field2; $_ptr_Table)
	C_REAL:C285($_l_DeNormalised)
	C_TEXT:C284(<>LetAct; <>QtnAct; <>SYS_t_4DWriteType; $_t_ApplicationPath; $_t_DiaryContactCode; $_t_oldMethodName; $_t_RelationName; $_t_RequestEmailAddress; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DOC_t_DocumentCode)
	C_TEXT:C284(EMAIL_t_Attachment; EMAIL_t_AttachmentsLabel; EMAIL_t_EmailBody; EMAIL_T_EmailSignature; EMAIL_t_EmailTo; EMAIL_t_EmailType; EMAIL_t_FooterText; EMAIL_t_InsText; EMAIL_t_RecipientsLabel; Products; ProductsD)
	C_TEXT:C284(vCompCode; vContCode; vContName; vFrom; WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName; <>eLetAct; <>SYS_t_4DWriteType; $_t_ApplicationPath; $_t_DiaryContactCode)
	C_TEXT:C284($_t_oldMethodName; $_t_RelationName; $_t_RequestEmailAddress; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage3; DOC_t_DocumentCode; EMAIL_t_Attachment; EMAIL_t_AttachmentsLabel; EMAIL_t_EmailBody; EMAIL_T_EmailSignature; EMAIL_t_EmailTo)
	C_TEXT:C284(EMAIL_t_EmailType; EMAIL_t_FooterText; EMAIL_t_InsText; EMAIL_t_RecipientsLabel; Enclosures; WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Diary_inLLPB_New")

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
cSave:=0
vCreate:=0
Case of 
	: ([DIARY:12]Diary_Code:3="")  //New record
		$_bo_newRecord:=True:C214
	Else 
		$_bo_newRecord:=False:C215
End case 
//End if
Diary_InB
vDate:=[DIARY:12]Date_Do_From:4
Letter_Date([DIARY:12]Date_Do_From:4)
OBJECT SET ENTERABLE:C238([DIARY:12]Document_Code:15; False:C215)
If ([DIARY:12]Document_Code:15="")
	OBJECT SET TITLE:C194(*; "ogetTemplate@"; "Select Template")  //for template button
Else 
	OBJECT SET VISIBLE:C603(*; "oGetTemplate@"; False:C215)
End if 
$_l_DocumentClass:=0
If ($_bo_newRecord)
	Case of 
		: (DB_t_CurrentFormUsage="E@") & (Not:C34(Undefined:C82(<>eLetAct)))
			DOC_t_DocumentCode:=""
			Repeat 
				If (DOC_t_DocumentCode#"")
					SET QUERY DESTINATION:C396(3; $_l_Clash)
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
					SET QUERY DESTINATION:C396(0)
				Else 
					$_l_Clash:=1
				End if 
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
			
			[DIARY:12]Action_Code:9:=<>eLetAct
			If (<>eLetAct="")
				[DIARY:12]Action_Code:9:="Email"
			End if 
			ARRAY TEXT:C222(WT_at_EMailRecipients; 0)
			EMAIL_t_AttachmentsLabel:="Attachments"
			EMAIL_t_RecipientsLabel:="Recipients"
			[DIARY:12]Email_From:38:=GetEmailSender
			EMAIL_t_FooterText:=""
			EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+Char:C90(13)
			EMAIL_T_EmailSignature:=GetEmailSignature
			//      EMAIL_t_EmailBody:=Char(13)+EMAIL_T_EmailSignature  `EMAIL_t_InsText+Char(13)+
			EMAIL_t_EmailBody:=Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  //PB 26/06/02
			[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
			$_l_DocumentClass:=Text Email
			
		: (DB_t_CurrentFormUsage="Q@")  //its a quote
			DOC_t_DocumentCode:=""
			Repeat 
				If (DOC_t_DocumentCode#"")
					SET QUERY DESTINATION:C396(3; $_l_Clash)
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
					SET QUERY DESTINATION:C396(0)
				Else 
					$_l_Clash:=1
				End if 
				If ($_l_Clash>0)
					Let_No("Q")
				End if 
			Until ($_l_Clash=0)
			
			DOC_t_DocumentCode:="Q"+DOC_t_DocumentCode
			[DIARY:12]Document_Code:15:=DOC_t_DocumentCode
			[DIARY:12]Action_Code:9:=<>QtnAct
			If (<>QtnAct="")
				[DIARY:12]Action_Code:9:="QTN"
			End if 
			//Find the template to use
			
			Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
			$_pic_4DWrite:=WR Area to picture:P12000:139(Write_2; 1; 1)
			WR PICTURE TO AREA:P12000:141(write; $_pic_4DWrite)
			WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
			If (Documents_4DWriteAccessType(False:C215)="W@")  //4D write quote
				
				
				Case of 
					: (Test path name:C476("QtnTem.4WR")=Is a document:K24:1)
						WR OPEN DOCUMENT:P12000:48(write; "QtnTem.4WR")
						DOC_SetWriteModifiable(write; 2; True:C214)
					: (Test path name:C476("Quote Template")=Is a document:K24:1)
						WR OPEN DOCUMENT:P12000:48(write; "Quote Template")
						DOC_SetWriteModifiable(write; 2; True:C214)
					: (Test path name:C476("Quote Template.4WR")=Is a document:K24:1)
					Else 
						
						DOC_SetWriteModifiable(write; 2; True:C214)
				End case 
				$_l_DocumentClass:=4D Write Letter
			Else 
				$_l_DocumentClass:=Text Letter
			End if 
			If ((DB_t_CurrentFormUsage="QOrd") | (DB_t_CurrentFormUsage="QJob"))
				If ([ORDERS:24]Person:5#"")
					[DIARY:12]Person:8:=[ORDERS:24]Person:5
				End if 
				If (Documents_4DWriteAccessType(False:C215)="W@")
					
					Diary_InLLPQtnR
					$_l_DocumentClass:=4D Write Letter
				Else 
					$_l_CharacterPosition:=Position:C15("<Products>"; [DOCUMENTS:7]Text:3)
					If ($_l_CharacterPosition>0)
						$_l_CharacterPosition2:=$_l_CharacterPosition+10
						[DOCUMENTS:7]Text:3:=Substring:C12([DOCUMENTS:7]Text:3; 1; $_l_CharacterPosition-1)+Products+Substring:C12([DOCUMENTS:7]Text:3; $_l_CharacterPosition2; 32000)
					End if 
					$_l_CharacterPosition:=Position:C15("<ProductsD>"; [DOCUMENTS:7]Text:3)
					If ($_l_CharacterPosition>0)
						$_l_CharacterPosition2:=$_l_CharacterPosition+10
						[DOCUMENTS:7]Text:3:=Substring:C12([DOCUMENTS:7]Text:3; 1; $_l_CharacterPosition-1)+ProductsD+Substring:C12([DOCUMENTS:7]Text:3; $_l_CharacterPosition2; 32000)
					End if 
					$_l_CharacterPosition:=Position:C15("<Enclosures>"; [DOCUMENTS:7]Text:3)
					If ($_l_CharacterPosition>0)
						$_l_CharacterPosition2:=$_l_CharacterPosition+12
						[DOCUMENTS:7]Text:3:=Substring:C12([DOCUMENTS:7]Text:3; 1; $_l_CharacterPosition-1)+Enclosures+Substring:C12([DOCUMENTS:7]Text:3; $_l_CharacterPosition2; 32000)
					End if 
					$_l_DocumentClass:=Text Letter
				End if 
				
			End if 
		Else 
			DOC_t_DocumentCode:=""
			Repeat 
				If (DOC_t_DocumentCode#"")
					SET QUERY DESTINATION:C396(3; $_l_Clash)
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
					SET QUERY DESTINATION:C396(0)
				Else 
					$_l_Clash:=1
				End if 
				If ($_l_Clash>0)
					Let_No("L")
				End if 
			Until ($_l_Clash=0)
			[DIARY:12]Document_Code:15:="L"+DOC_t_DocumentCode
			[DIARY:12]Action_Code:9:=<>LetAct
			If (<>LetAct="")
				[DIARY:12]Action_Code:9:="LET"
			End if 
			//Find the template to use
			Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
			$_pic_4DWrite:=WR Area to picture:P12000:139(Write_2; 1; 1)
			WR PICTURE TO AREA:P12000:141(write; $_pic_4DWrite)
			WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
			If (Documents_4DWriteAccessType(False:C215)="W@")
				
				$_t_ApplicationPath:=PathFromPathName(Application file:C491)
				Case of 
					: ((Test path name:C476($_t_ApplicationPath+"LetTem.4WR"))=1)
						WR OPEN DOCUMENT:P12000:48(write; $_t_ApplicationPath+"LetTem.4WR")
						DOC_SetWriteModifiable(write; 2; True:C214)
					: ((Test path name:C476($_t_ApplicationPath+"Lettter Template.4WR"))=1)
						WR OPEN DOCUMENT:P12000:48(write; $_t_ApplicationPath+"Letter Template.4WR")
						DOC_SetWriteModifiable(write; 2; True:C214)
					: ((Test path name:C476($_t_ApplicationPath+"Lettter Template"))=1)
						WR OPEN DOCUMENT:P12000:48(write; $_t_ApplicationPath+"Letter Template")
						DOC_SetWriteModifiable(write; 2; True:C214)
					Else 
						
						WR PICTURE TO AREA:P12000:141(write; [DOCUMENTS:7]Write_:5)
						DOC_SetWriteModifiable(write; 2; True:C214)
				End case 
				
				
				$_l_DocumentClass:=4D Write Letter
			Else 
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="Let Tem")
				If (Records in selection:C76([DOCUMENTS:7])>0)
					DUPLICATE RECORD:C225([DOCUMENTS:7])
					//HERE SET THE CLASS OF THAT DOCUMENT
					[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
					[DOCUMENTS:7]Document_Code:1:=DOC_t_DocumentCode
					[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
				End if 
				$_l_DocumentClass:=Text Letter
			End if 
			
	End case 
	Diary_inLPHead_New(DB_t_CurrentFormUsage)
	
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
	//Make sure the document class is set
	
Else 
	//Not a new record
	DOC_t_DocumentCode:=[DIARY:12]Document_Code:15
	
	
End if 
If ([DIARY:12]Company_Code:1#"")
	MCont_Add("")
End if 

Case of 
	: ([DOCUMENTS:7]Document_Class:14=Text Email) | ([DOCUMENTS:7]Document_Class:14=Text Email Template) | ($_l_DocumentClass=Text Email)
		$_l_Page:=2
	: ([DOCUMENTS:7]Document_Class:14=4D Write Email) | ([DOCUMENTS:7]Document_Class:14=4D Write Email Template) | ($_l_DocumentClass=4D Write Email)
		$_l_Page:=3
	: ([DOCUMENTS:7]Document_Class:14=4D Write Letter) | ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template) | ($_l_DocumentClass=4D Write Letter)
		$_l_Page:=1
	: ([DOCUMENTS:7]Document_Class:14=Text Letter) | ([DOCUMENTS:7]Document_Class:14=Text Letter Template) | ($_l_DocumentClass=Text Letter)
		//$0`Add some pages in
	: ([DOCUMENTS:7]Document_Class:14=4D Write Report) | ([DOCUMENTS:7]Document_Class:14=4D Write ReportTemplate) | ($_l_DocumentClass=4D Write Report)
		//$_l_Page:=6
		//add some pages in
	: ([DOCUMENTS:7]Document_Class:14=SuperReport Report) | ([DOCUMENTS:7]Document_Class:14=SuperReportReport Template) | ($_l_DocumentClass=SuperReport Report)
		
		//$_l_Page:=5
		//Add some pages in
End case 
Case of 
	: ($_l_Page=1)  //4d write letter
		If ($_bo_newRecord)
			OBJECT SET TITLE:C194(BgetTemplate; "Select Template")  //for template button
			REDUCE SELECTION:C351([DOCUMENTS:7]; 0)
			DOC_SetWriteModifiable(write; 2; True:C214)
			//```
			
			//```
		Else 
			
			
		End if 
		If (<>SYS_t_4DWriteType="WS")  // 4DWrite "silver"
			WR TEXT ACCESS:P12000:42(write; 1)
			vEdit:=0
		Else 
			vEdit:=1
		End if 
	: ($_l_Page=2)  //text email
		If ([DIARY:12]Person:8#"")
			vFrom:=[DIARY:12]Person:8
			[DIARY:12]Email_Person:39:=[DIARY:12]Person:8
		End if 
		If ($_bo_newRecord)
			If (EMAIL_t_EmailTo="") & ([DIARY:12]Contact_Code:2#"")
				//there is no email for the recipient
				Repeat 
					$_t_RequestEmailAddress:=Request:C163("Please enter eMail address for "+vContName; "")
					$_l_OK:=OK
				Until (OK=0) | ($_t_RequestEmailAddress#"")
				If ($_l_OK=0)
					CANCEL:C270
				Else 
					EMAIL_t_EmailTo:=$_t_RequestEmailAddress
				End if 
				
			End if 
			$_l_AdrressRow:=Find in array:C230(SD2_at_EmailAddresses; EMAIL_t_EmailTo)
			
			If ($_l_AdrressRow<0)
				INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
				WS_l_ContactElement:=Size of array:C274(SD2_at_EmailType)
				$_l_AdrressRow:=Size of array:C274(SD2_at_EmailType)
				
				SD2_at_EmailType{$_l_AdrressRow}:="To"
				SD2_at_EmailAddresses{$_l_AdrressRow}:=EMAIL_t_EmailTo
				SD2_at_ContactIDs{$_l_AdrressRow}:=[DIARY:12]Contact_Code:2
				SD2_at_EmailName{$_l_AdrressRow}:=vContName
				$_l_AdrressRow:=Size of array:C274(SD2_at_EmailType)
			Else 
				WS_l_ContactElement:=$_l_AdrressRow
			End if 
			WS_l_SelectedEmailName:=$_l_AdrressRow
			EMAIL_t_EmailType:=SD2_at_EmailType{WS_l_ContactElement}
			WS_t_EmailAddress:=SD2_at_EmailAddresses{WS_l_ContactElement}
			WS_t_EmailName:=SD2_at_EmailName{WS_l_ContactElement}
		End if 
		If (EMAIL_t_Attachment#"")
			INSERT IN ARRAY:C227(WS_at_Attachments; 9999; 1)
			INSERT IN ARRAY:C227(WS_at_AttachmentsPath; 9999; 1)
			INSERT IN ARRAY:C227(WS_al_EmailID; 9999; 1)
			INSERT IN ARRAY:C227(SD3_at_DocDiaryCode; 9999; 1)
			WS_at_Attachments{Size of array:C274(WS_at_Attachments)}:=FileNamefromPath(EMAIL_t_Attachment)
			WS_at_AttachmentsPath{Size of array:C274(WS_at_AttachmentsPath)}:=EMAIL_t_Attachment
			EMAIL_t_Attachment:=""
		End if 
		
		QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1=[DIARY:12]Diary_Code:3)
		SELECTION TO ARRAY:C260([EMAIL_RECIPIENTS:104]Classification:2; SD2_at_EmailType; [EMAIL_RECIPIENTS:104]Email_Address:3; SD2_at_EmailAddresses; [EMAIL_RECIPIENTS:104]ContactID:4; SD2_at_ContactIDs)
		$_t_DiaryContactCode:=[DIARY:12]Contact_Code:2
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
		RELATE ONE:C42([DIARY:12]Document_Code:15)
		EMAIL_t_EmailBody:=[DOCUMENTS:7]Text:3
		[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_DiaryContactCode)
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
		
		
		
		EMAIL_t_RecipientsLabel:="Recipients"
		EMAIL_t_AttachmentsLabel:="Attachments"
		OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; True:C214)
		OBJECT SET VISIBLE:C603(WT_at_EMailRecipients; True:C214)
		WS_t_ContactID:=[DIARY:12]Contact_Code:2
		SETEMAILFORMOBJECTS_NEW
	: ($_l_Page=3)  //4d write email
		If ([DIARY:12]Person:8#"")
			vFrom:=[DIARY:12]Person:8
			[DIARY:12]Email_Person:39:=[DIARY:12]Person:8
		End if 
	: ($_l_Page=99)  //set this to a text page if we ever make one again
		If ($_bo_newRecord)
			SetFontsByPointerParameter(<>DataSize; ""; 0; ->[DOCUMENTS:7]Heading:2; ->[DOCUMENTS:7]Text:3)
			
		Else 
		End if 
		
End case 
If ($_bo_newRecord)
	If (SD_bo_AdditionalRelations)
		// ARRAY LONGINT(DOC_al_TableLink;0)
		//ARRAY LONGINT(DOC_al_FIeldLink;0)
		//ARRAY LONGINT(DOC_al_RecordID;0)
		//ARRAY STRING(55;DOC_at_RecordCode;0)
		//The above contain the record details of relations to create-note that if they are set the PRIME relation will be set to the first one
		For ($_l_RelationsIndex; 1; Size of array:C274(DOC_al_TableLink))
			//NOTE THAT THE 1ST RELATION WILL BE THE PRIME RELATION-DOES NOT REALLY MATTHER THOUGH
			$_bo_SetPrime:=False:C215
			If ($_l_RelationsIndex=1)
				$_bo_SetPrime:=True:C214
			End if 
			If ($_bo_SetPrime)
				[DIARY:12]Data_Source_Table:49:=DOC_al_TableLink{$_l_RelationsIndex}
			End if 
			$_t_RelationName:=""
			Case of 
					
				: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[SERVICE_CALLS:20])) & ([DIARY:12]Call_Code:25="")
					[DIARY:12]Call_Code:25:=DOC_at_RecordCode{$_l_RelationsIndex}
					$_t_RelationName:="Service Call"
				: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[COMPANIES:2])) & ([DIARY:12]Company_Code:1="")
					[DIARY:12]Company_Code:1:=DOC_at_RecordCode{$_l_RelationsIndex}
					$_t_RelationName:="Company"
				: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[CONTACTS:1])) & ([DIARY:12]Contact_Code:2="")
					[DIARY:12]Contact_Code:2:=DOC_at_RecordCode{$_l_RelationsIndex}
					$_t_RelationName:="Contact"
				: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[JOBS:26])) & ([DIARY:12]Job_Code:19="")
					[DIARY:12]Job_Code:19:=DOC_at_RecordCode{$_l_RelationsIndex}
					$_t_RelationName:="Job"
				: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[ORDERS:24])) & ([DIARY:12]Order_Code:26="")
					[DIARY:12]Order_Code:26:=DOC_at_RecordCode{$_l_RelationsIndex}
					$_t_RelationName:="Order"
				: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[PRODUCTS:9])) & ([DIARY:12]Product_Code:13="")
					[DIARY:12]Product_Code:13:=DOC_at_RecordCode{$_l_RelationsIndex}
					$_t_RelationName:="Product"
				: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[JOB_STAGES:47])) & ([DIARY:12]Stage_Code:21="")
					[DIARY:12]Stage_Code:21:=DOC_at_RecordCode{$_l_RelationsIndex}
					$_t_RelationName:="Job Stage"
			End case 
			CREATE RECORD:C68([xDiaryRelations:137])
			[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
			
			If (Count parameters:C259>=4)
				If (DOC_al_RecordID{$_l_RelationsIndex}=0)
					$_ptr_Field:=Field:C253(DOC_al_TableLink{$_l_RelationsIndex}; DOC_al_FIeldLink{$_l_RelationsIndex})
					If ($_ptr_Field->#DOC_at_RecordCode{$_l_RelationsIndex})  //Note the $2  must always be pointer at the code field  not the ID field
						$_ptr_Table:=Table:C252(DOC_al_TableLink{$_l_RelationsIndex})
						QUERY:C277($_ptr_Table->; $_ptr_Field->=DOC_at_RecordCode{$_l_RelationsIndex})
					End if 
					$_l_IDFieldNumber:=AA_GetIDFieldNum(DOC_al_TableLink{$_l_RelationsIndex})
					If ($_l_IDFieldNumber>0)
						$_ptr_Field2:=Field:C253(DOC_al_TableLink{$_l_RelationsIndex}; $_l_IDFieldNumber)
						[xDiaryRelations:137]xRecordID:4:=$_ptr_Field2->
					End if 
					
				Else 
					[xDiaryRelations:137]xRecordID:4:=DOC_al_RecordID{$_l_RelationsIndex}
				End if 
				[xDiaryRelations:137]XRecord_Code:5:=DOC_at_RecordCode{$_l_RelationsIndex}
			Else 
				$_ptr_Field:=Field:C253(DOC_al_TableLink{$_l_RelationsIndex}; DOC_al_FIeldLink{$_l_RelationsIndex})
				If ($_ptr_Field->#DOC_at_RecordCode{$_l_RelationsIndex})  //Note the $2  must always be pointer at the code field  not the ID field
					$_ptr_Table:=Table:C252(DOC_al_TableLink{$_l_RelationsIndex})
					QUERY:C277($_ptr_Table->; $_ptr_Field->=DOC_at_RecordCode{$_l_RelationsIndex})
				End if 
				$_l_IDFieldNumber:=AA_GetIDFieldNum(DOC_al_TableLink{$_l_RelationsIndex})
				If ($_l_IDFieldNumber>0)
					$_ptr_Field2:=Field:C253(DOC_al_TableLink{$_l_RelationsIndex}; $_l_IDFieldNumber)
					[xDiaryRelations:137]xRecordID:4:=$_ptr_Field2->
				End if 
				[xDiaryRelations:137]XRecord_Code:5:=DOC_at_RecordCode{$_l_RelationsIndex}
			End if 
			[xDiaryRelations:137]xTableNUM:3:=DOC_al_TableLink{$_l_RelationsIndex}
			$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
			[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
			[xDiaryRelations:137]X_DisplayedName:6:=""
			[xDiaryRelations:137]x_RelationshipName:7:=$_t_RelationName
			DB_SaveRecord(->[xDiaryRelations:137])
			
		End for 
		
		
	End if 
	SD_bo_AdditionalRelations:=False:C215  //Make sure it is set to false now
	
End if 
If ((DB_GetModuleSettingByNUM(1))=5)
	DB_MenuAction("Functions"; "Add Product Items"; 3; "")
End if 
ERR_MethodTrackerReturn("Diary_inLLPB_New"; $_t_oldMethodName)
