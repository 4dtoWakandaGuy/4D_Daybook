//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryInLLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/06/2010 18:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DOC_al_FIeldLink;0)
	//ARRAY LONGINT(DOC_al_RecordID;0)
	//ARRAY LONGINT(DOC_al_TableLink;0)
	//ARRAY LONGINT(SD2_al_SentStatus;0)
	//ARRAY LONGINT(WS_al_EmailID;0)
	//ARRAY LONGINT(WS_al_PersonID;0)
	//ARRAY TEXT(DOC_at_RecordCode;0)
	//ARRAY TEXT(PER_at_DefaultSignatures;0)
	//ARRAY TEXT(PER_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	//ARRAY TEXT(WS_at_EmailComb;0)
	C_BOOLEAN:C305($_bo_LoadDocuments; $_bo_SetPrime; EMAIL_bo_DonotChangeSubject; EMAIL_bo_MailListBuilt; SD_bo_AdditionalRelations; SD2_bo_SaveDraftEmail)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_Clash; $_l_EmailAddressRow; $_l_IDFieldNumber; $_l_Relations; $_l_SizeofArray; cSave; SD2_l_DocType; vCreate)
	C_PICTURE:C286($_pic_Picture)
	C_POINTER:C301($_ptr_Field; $_ptr_Field2; $_ptr_Table)
	C_REAL:C285($_l_DeNormalised)
	C_TEXT:C284(<>eLetAct; $_t_DiaryContactCode; $_t_EmailBody; $_t_EmailSignature; $_t_InsertText; $_t_oldMethodName; $_t_RelationName; DB_t_CurrentFormUsage; DOC_t_DocumentCode; DOC_T_EmailFromcom; EMAIL_t_EmailBody)
	C_TEXT:C284(vCompCode; vContCode; Vperson)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryInLLPB")

If (Not:C34(EMAIL_bo_MailListBuilt))
	ARRAY TEXT:C222(SD2_at_EmailType; 0)
	ARRAY TEXT:C222(SD2_at_EmailAddresses; 0)
	ARRAY TEXT:C222(SD2_at_ContactIDs; 0)
	ARRAY TEXT:C222(SD2_at_EmailName; 0)
	ARRAY TEXT:C222(WS_at_EmailComb; 0)
Else 
	$_l_SizeofArray:=Size of array:C274(SD2_at_EmailType)
	//This is just to make sure there is no size mismatch...
	ARRAY TEXT:C222(SD2_at_EmailType; $_l_SizeofArray)
	ARRAY TEXT:C222(SD2_at_EmailAddresses; $_l_SizeofArray)
	ARRAY TEXT:C222(SD2_at_ContactIDs; $_l_SizeofArray)
	ARRAY TEXT:C222(SD2_at_EmailName; $_l_SizeofArray)
	ARRAY TEXT:C222(WS_at_EmailComb; $_l_SizeofArray)
End if 
ARRAY TEXT:C222(WS_at_Attachments; 0)
ARRAY TEXT:C222(WS_at_AttachmentsPath; 0)
ARRAY LONGINT:C221(WS_al_EmailID; 0)
ARRAY TEXT:C222(SD3_at_DocDiaryCode; 0)
ARRAY LONGINT:C221(WS_al_PersonID; 0)
ARRAY LONGINT:C221(SD2_al_SentStatus; 0)

Case of 
	: (DB_t_CurrentFormUsage="E") | (SD2_l_DocType=Text Email)
		If ([DIARY:12]Company_Code:1="")
			[DIARY:12]Company_Code:1:=vCompCode
		End if 
		If ([DIARY:12]Contact_Code:2="")
			[DIARY:12]Contact_Code:2:=vContCode
		End if 
End case 
Diary_InB
vDate:=[DIARY:12]Date_Do_From:4
Letter_Date([DIARY:12]Date_Do_From:4)
OBJECT SET ENTERABLE:C238([DIARY:12]Document_Code:15; False:C215)

$_bo_LoadDocuments:=False:C215  //added NG 19/08/09

If ([DIARY:12]Action_Code:9="") | ([DIARY:12]Document_Code:15="")  //Definately a new Record
	
	Case of 
		: (SD2_l_DocType=Text Email)  //Email Text Style
			If ([DIARY:12]Company_Code:1="")
				[DIARY:12]Company_Code:1:=vCompCode
			End if 
			If ([DIARY:12]Contact_Code:2="")
				[DIARY:12]Contact_Code:2:=vContCode
			End if 
			If ([DIARY:12]Action_Code:9="") & (Not:C34(Undefined:C82(<>eLetAct)))  //Set the [DIARY] action code
				[DIARY:12]Action_Code:9:=<>eLetAct
				If (<>eLetAct="")
					[DIARY:12]Action_Code:9:="Email"
				End if 
			End if 
			[DIARY:12]Email_From:38:=GetEmailSender
			DOC_T_EmailFromcom:=Vperson+"<"+[DIARY:12]Email_From:38+">"
			$_t_InsertText:=Char:C90(13)+"----------------------"+Char:C90(13)+Char:C90(13)
			$_t_EmailSignature:=GetEmailSignature
			$_l_EmailAddressRow:=Find in array:C230(PER_at_EmailAddresses; [DIARY:12]Email_From:38)
			If ($_l_EmailAddressRow>0)
				If (PER_at_DefaultSignatures{$_l_EmailAddressRow}#"")
					$_t_EmailSignature:=PER_at_DefaultSignatures{$_l_EmailAddressRow}
				End if 
			End if 
			$_t_EmailBody:=Char:C90(13)+Char:C90(13)+$_t_EmailSignature  //PB 26/06/02
			[DIARY:12]Email_Text:42:=$_t_EmailBody
			If ([DIARY:12]Document_Code:15="")
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
			Else 
				$_bo_LoadDocuments:=True:C214  //added NG 19/08/09
			End if 
			
			SD2_EmailBuildRecipientArrays(->[DIARY:12]Diary_Code:3; ->[DIARY:12]Contact_Code:2)  //kmw 21/10/08 v631b120a, factored out following sections of code
			
			//  `******************************** Added 20/10/08 v621b120a -kmw (although this is a new diary and email its possible it already has an email recipients against it e.g.. through macro code - can't hurt to check anyway) ******************************
			//QUERY([EMAIL_RECIPIENTS];[EMAIL_RECIPIENTS]DiaryID=[DIARY]Diary Code)
			//SELECTION TO ARRAY([EMAIL_RECIPIENTS]Classification;SD2_at_EmailType;[EMAIL_RECIPIENTS]Email_Address;SD2_at_EmailAddresses;[EMAIL_RECIPIENTS]ContactID;SD2_at_ContactIDs;[EMAIL_RECIPIENTS]Person_ID;WS_al_PersonID;[EMAIL_RECIPIENTS]SentStatus;SD2_al_SentStatus)
			//
			// `*********************************************************************************************************************************************************************************************************************************
			//If ([DIARY]Contact Code#"")
			//  `add the contact to the list of recipients...
			//QUERY([CONTACTS];[CONTACTS]Contact Code=[DIARY]Contact Code;*)  `20/10/08 v621b120a -kmw, added condiition that contact must have an email address
			//QUERY([CONTACTS]; & ;[CONTACTS]EmailAddress#"")  `20/10/08 v621b120a -kmw, added condition that diary contact must have an email address
			//If (Records in selection([CONTACTS])>0)
			//APPEND TO ARRAY(SD2_at_EmailType;"To")
			//APPEND TO ARRAY(SD2_at_EmailAddresses;[CONTACTS]EmailAddress)
			//APPEND TO ARRAY(SD2_at_EmailName;[CONTACTS]Contact_Name)
			//APPEND TO ARRAY(SD2_al_SentStatus;0)
			//APPEND TO ARRAY(WS_at_EmailSentStatus;"Not Sent")
			//APPEND TO ARRAY(SD2_at_ContactIDs;[CONTACTS]Contact Code)
			//APPEND TO ARRAY(WS_al_PersonID;[CONTACTS]x_ID)
			//APPEND TO ARRAY(WS_at_EmailComb;[CONTACTS]Contact_Name+"  <"+SD2_at_EmailAddresses{Size of array(SD2_at_EmailAddresses)}+">")
			//End if
			//End if
	End case 
	
Else 
	If ([DIARY:12]Document_Code:15#"")
		$_bo_LoadDocuments:=True:C214
	End if 
End if 

If ($_bo_LoadDocuments)  //added NG 19/08/09
	
	
	
	RELATE ONE:C42([DIARY:12]Document_Code:15)
	Case of 
		: ([DOCUMENTS:7]Document_Class:14=Text Email)  //Text Email)
			DOC_t_DocumentCode:=[DIARY:12]Document_Code:15
			
			SD2_EmailBuildRecipientArrays(->[DIARY:12]Diary_Code:3; ->[DIARY:12]Contact_Code:2)  //kmw 21/10/08 v631b120a, factored out following sections of code
			
			//QUERY([EMAIL_RECIPIENTS];[EMAIL_RECIPIENTS]DiaryID=[DIARY]Diary Code)
			//SELECTION TO ARRAY([EMAIL_RECIPIENTS]Classification;SD2_at_EmailType;[EMAIL_RECIPIENTS]Email_Address;SD2_at_EmailAddresses;[EMAIL_RECIPIENTS]ContactID;SD2_at_ContactIDs;[EMAIL_RECIPIENTS]Person_ID;WS_al_PersonID;[EMAIL_RECIPIENTS]SentStatus;SD2_al_SentStatus)
			//If (Size of array(SD2_at_EmailAddresses)<1)
			//If ([DIARY]Contact Code#"")
			//  `add the contact to the list of recipients...
			//QUERY([CONTACTS];[CONTACTS]Contact Code=[DIARY]Contact Code;*)  `20/10/08 v621b120a -kmw, added condiition that contact must have an email address
			//QUERY([CONTACTS]; & ;[CONTACTS]EmailAddress#"")  `20/10/08 v621b120a -kmw, added condition that diary contact must have an email address
			//If (Records in selection([CONTACTS])>0)
			//APPEND TO ARRAY(SD2_at_EmailType;"To")
			//APPEND TO ARRAY(SD2_at_EmailAddresses;[CONTACTS]EmailAddress)
			//APPEND TO ARRAY(SD2_at_EmailName;[CONTACTS]Contact_Name)
			//APPEND TO ARRAY(SD2_al_SentStatus;0)
			//APPEND TO ARRAY(WS_at_EmailSentStatus;"Not Sent")
			//APPEND TO ARRAY(SD2_at_ContactIDs;[CONTACTS]Contact Code)
			//APPEND TO ARRAY(WS_al_PersonID;[CONTACTS]x_ID)
			//APPEND TO ARRAY(WS_at_EmailComb;[CONTACTS]Contact_Name+"  <"+SD2_at_EmailAddresses{Size of array(SD2_at_EmailAddresses)}+">")
			//End if
			//End if
			//End if
			
			
			$_t_DiaryContactCode:=[DIARY:12]Contact_Code:2  //kmw 21/10/08 v631b120a - this was already here but just making a note that the purpose of this seems to be remember contact code (in case it changes?) so can use in a query later on
			
			SD2_EmailBuildAttachmentArrays(->[DIARY:12]Diary_Code:3; ->[DIARY:12]Email_ID:41)  //kmw 21/10/08 v631b120a, factored out following sections of code
			//If ([DIARY]Email_ID<=0)
			//QUERY([EMAIL_ATTACHMENTS];[EMAIL_ATTACHMENTS]DiaryID=[DIARY]Diary Code)
			//Else   `this is needed so that where a group of diary items relate to a single email `there is only one group of records containing the attachments
			//QUERY([EMAIL_ATTACHMENTS];[EMAIL_ATTACHMENTS]Email_ID=[DIARY]Email_ID)
			//End if
			//SELECTION TO ARRAY([EMAIL_ATTACHMENTS]Attachment_Name;WS_at_Attachments;[EMAIL_ATTACHMENTS]Attachment_Path;WS_at_AttachmentsPath;[EMAIL_ATTACHMENTS]Email_ID;WS_al_EmailID;[EMAIL_ATTACHMENTS]DiaryID;SD3_at_DocDiaryCode)
			
			
			
			
			//ARRAY STRING(255;SD2_at_EmailName;Size of array(SD2_at_ContactIDs))
			//ARRAY TEXT(WS_at_EmailComb;Size of array(SD2_at_ContactIDs))
			//
			//For ($i;1;Size of array(SD2_at_EmailType))
			//C_LONGINT(DOC_l_ContactIDreturn)
			//C_TEXT(DOC_t_ContactNameReturn)
			//C_TEXT(DOC_t_ContactCodeReturn)
			//
			//If (WS_al_PersonID{$i}>=0)
			//If (WS_al_PersonID{$i}=0) & (SD2_at_ContactIDs{$i}#"")
			//DOC_l_ContactIDreturn:=0
			//$_l_Process:=New process("DOC_GetContactDetails";DB_ProcessMemoryinit(1);"Contact_Details";Current process;WS_al_PersonID{$i};SD2_at_ContactIDs{$i})
			//While (DOC_l_ContactIDreturn=0)
			//DelayTicks (2)
			//End while
			//If (DOC_l_ContactIDreturn>0)
			//WS_al_PersonID{$i}:=DOC_l_ContactIDreturn
			//End if
			//End if
			//If (SD2_at_ContactIDs{$i}#"")
			//
			//If ([CONTACTS]x_ID#WS_al_PersonID{$i})
			//DOC_l_ContactIDreturn:=0
			//$_l_Process:=New process("DOC_GetContactDetails";DB_ProcessMemoryinit(1);"Contact_Details";Current process;WS_al_PersonID{$i})
			//While (DOC_l_ContactIDreturn=0)
			//DelayTicks (2)
			//End while
			//If (DOC_l_ContactIDreturn>0)
			//SD2_at_ContactIDs{$i}:=DOC_t_ContactCodeReturn
			//$Name:=DOC_t_ContactNameReturn
			//WS_al_PersonID{$i}:=DOC_l_ContactIDreturn
			//End if
			//Else
			//SD2_at_ContactIDs{$i}:=[CONTACTS]Contact Code
			//$Name:=[CONTACTS]Contact_Name
			//WS_al_PersonID{$i}:=[CONTACTS]x_ID
			//
			//End if
			//
			//SD2_at_EmailName{$i}:=$Name
			//WS_at_EmailComb{$i}:=SD2_at_EmailName{$i}+"<"+SD2_at_EmailAddresses{$i}+">"
			//End if
			//Else
			//If (SD2_at_ContactIDs{$i}#"")
			//QUERY([PERSONNEL];[PERSONNEL]Initials=SD2_at_ContactIDs{$i})
			//SD2_at_EmailName{$i}:=[PERSONNEL]Name
			//WS_at_EmailComb{$i}:=SD2_at_EmailName{$i}+"<"+SD2_at_EmailAddresses{$i}+">"
			//Else
			//:=Position(Char(64);SD2_at_EmailAddresses{$i})
			//If ($Pos>0)
			//$EmailBefore:=Substring(SD2_at_EmailAddresses{$i};1;$pos-1)
			//$EmalAfter:=Substring(SD2_at_EmailAddresses{$i};$Pos+1)
			//QUERY([CONTACTS];[CONTACTS]Email BeforeAt=$EmailBefore;*)
			//QUERY([CONTACTS]; & ;[CONTACTS]EMail AfterAt=$EmalAfter)
			//If (Records in selection([CONTACTS])>0)
			//WS_al_PersonID{$i}:=[CONTACTS]x_ID
			//SD2_at_ContactIDs{$i}:=[CONTACTS]Contact Code
			//SD2_at_EmailName{$i}:=[CONTACTS]Contact_Name
			//WS_at_EmailComb{$i}:=SD2_at_EmailName{$i}+"<"+SD2_at_EmailAddresses{$i}+">"
			//Else
			//SD2_at_EmailName{$i}:="Unknown"
			//WS_at_EmailComb{$i}:=SD2_at_EmailName{$i}+"<"+SD2_at_EmailAddresses{$i}+">"
			//End if
			//
			//End if
			//End if
			//End if
			//End for
			
			
			If ([DIARY:12]Email_From:38="")
				[DIARY:12]Email_From:38:=GetEmailSender
			End if 
			DOC_T_EmailFromcom:=Vperson+"<"+[DIARY:12]Email_From:38+">"
			
			//*****************************************`changed to use tokens 24/09/08 -kmw ***********************************
			//EMAIL_t_EmailBody:=[DOCUMENTS]Text
			//[DIARY]Email_Text:=[DOCUMENTS]Text
			EMAIL_t_EmailBody:=Document_EmailTokens([DOCUMENTS:7]Text:3)
			//[DIARY]Email_Text:=EMAIL_t_EmailBody
			[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody  //corrected typo 25/09/08 -kmw
			
			//**********************************************************************************************************************************************
			
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_DiaryContactCode)
			//If ([DIARY]Email_Subject="")  `BSW 1/07/02
			If (Not:C34(EMAIL_bo_DonotChangeSubject)) | ([DIARY:12]Email_Subject:40="")  //changed to set the subject if EITHER EMAIL_bo_DonotChangeSubject OR  lack of subject -24/09/08, kmw
				//[DIARY]Email_Subject:=[DOCUMENTS]Heading
				[DIARY:12]Email_Subject:40:=Document_EmailTokens([DOCUMENTS:7]Heading:2)  //changed to use tokens 24/09/08 -kmw
			End if 
			cSave:=1
			vCreate:=0
			If ([DIARY:12]Email_ID:41>0)
				OBJECT SET ENTERABLE:C238([DIARY:12]Email_Text:42; False:C215)
			End if 
			
	End case 
	
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
	For ($_l_Relations; 1; Size of array:C274(DOC_al_TableLink))
		//NOTE THAT THE 1ST RELATION WILL BE THE PRIME RELATION-DOES NOT REALLY MATTHER THOUGH
		$_bo_SetPrime:=False:C215
		If ($_l_Relations=1)
			$_bo_SetPrime:=True:C214
		End if 
		If ($_bo_SetPrime)
			[DIARY:12]Data_Source_Table:49:=DOC_al_TableLink{$_l_Relations}
		End if 
		$_t_RelationName:=""
		Case of 
			: (DOC_al_TableLink{$_l_Relations}=Table:C252(->[SERVICE_CALLS:20])) & ([DIARY:12]Call_Code:25="")
				[DIARY:12]Call_Code:25:=DOC_at_RecordCode{$_l_Relations}
				$_t_RelationName:="Service Call"
			: (DOC_al_TableLink{$_l_Relations}=Table:C252(->[COMPANIES:2])) & ([DIARY:12]Company_Code:1="")
				[DIARY:12]Company_Code:1:=DOC_at_RecordCode{$_l_Relations}
				$_t_RelationName:="Company"
			: (DOC_al_TableLink{$_l_Relations}=Table:C252(->[CONTACTS:1])) & ([DIARY:12]Contact_Code:2="")
				[DIARY:12]Contact_Code:2:=DOC_at_RecordCode{$_l_Relations}
				$_t_RelationName:="Contact"
			: (DOC_al_TableLink{$_l_Relations}=Table:C252(->[JOBS:26])) & ([DIARY:12]Job_Code:19="")
				[DIARY:12]Job_Code:19:=DOC_at_RecordCode{$_l_Relations}
				$_t_RelationName:="Job"
			: (DOC_al_TableLink{$_l_Relations}=Table:C252(->[ORDERS:24])) & ([DIARY:12]Order_Code:26="")
				[DIARY:12]Order_Code:26:=DOC_at_RecordCode{$_l_Relations}
				$_t_RelationName:="Order"
			: (DOC_al_TableLink{$_l_Relations}=Table:C252(->[PRODUCTS:9])) & ([DIARY:12]Product_Code:13="")
				[DIARY:12]Product_Code:13:=DOC_at_RecordCode{$_l_Relations}
				$_t_RelationName:="Product"
			: (DOC_al_TableLink{$_l_Relations}=Table:C252(->[JOB_STAGES:47])) & ([DIARY:12]Stage_Code:21="")
				[DIARY:12]Stage_Code:21:=DOC_at_RecordCode{$_l_Relations}
				$_t_RelationName:="Job Stage"
		End case 
		CREATE RECORD:C68([xDiaryRelations:137])
		[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
		
		If (Count parameters:C259>=4)
			If (DOC_al_RecordID{$_l_Relations}=0)
				$_ptr_Field:=Field:C253(DOC_al_TableLink{$_l_Relations}; DOC_al_FIeldLink{$_l_Relations})
				If ($_ptr_Field->#DOC_at_RecordCode{$_l_Relations})  //Note the $2  must always be pointer at the code field  not the ID field
					$_ptr_Table:=Table:C252(DOC_al_TableLink{$_l_Relations})
					QUERY:C277($_ptr_Table->; $_ptr_Field->=DOC_at_RecordCode{$_l_Relations})
				End if 
				$_l_IDFieldNumber:=AA_GetIDFieldNum(DOC_al_TableLink{$_l_Relations})
				If ($_l_IDFieldNumber>0)
					$_ptr_Field2:=Field:C253(DOC_al_TableLink{$_l_Relations}; $_l_IDFieldNumber)
					[xDiaryRelations:137]xRecordID:4:=$_ptr_Field2->
				End if 
				
			Else 
				[xDiaryRelations:137]xRecordID:4:=DOC_al_RecordID{$_l_Relations}
			End if 
			[xDiaryRelations:137]XRecord_Code:5:=DOC_at_RecordCode{$_l_Relations}
		Else 
			$_ptr_Field:=Field:C253(DOC_al_TableLink{$_l_Relations}; DOC_al_FIeldLink{$_l_Relations})
			If ($_ptr_Field->#DOC_at_RecordCode{$_l_Relations})  //Note the $2  must always be pointer at the code field  not the ID field
				$_ptr_Table:=Table:C252(DOC_al_TableLink{$_l_Relations})
				QUERY:C277($_ptr_Table->; $_ptr_Field->=DOC_at_RecordCode{$_l_Relations})
			End if 
			$_l_IDFieldNumber:=AA_GetIDFieldNum(DOC_al_TableLink{$_l_Relations})
			If ($_l_IDFieldNumber>0)
				$_ptr_Field2:=Field:C253(DOC_al_TableLink{$_l_Relations}; $_l_IDFieldNumber)
				[xDiaryRelations:137]xRecordID:4:=$_ptr_Field2->
			End if 
			[xDiaryRelations:137]XRecord_Code:5:=DOC_at_RecordCode{$_l_Relations}
		End if 
		[xDiaryRelations:137]xTableNUM:3:=DOC_al_TableLink{$_l_Relations}
		$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
		[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
		[xDiaryRelations:137]X_DisplayedName:6:=""
		[xDiaryRelations:137]x_RelationshipName:7:=$_t_RelationName
		DB_SaveRecord(->[xDiaryRelations:137])
		
	End for 
	
	
End if 
SD_bo_AdditionalRelations:=False:C215  //Make sure it is set to false now
ERR_MethodTrackerReturn("SD2_DiaryInLLPB"; $_t_oldMethodName)
