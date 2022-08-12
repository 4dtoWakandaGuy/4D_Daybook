//%attributes = {}
If (False:C215)
	//Project Method Name:      Document_EmailPDF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 13:14
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
	//ARRAY TEXT(DOC_at_RecordCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	C_BOOLEAN:C305($_bo_SetPrime; INT_bo_SkinsPrefsLoaded; Mail_bo_inOK)
	C_LONGINT:C283($_l_AtPosition; $_l_Denormalised; $_l_DocumentCodeTries; $_l_IdFIeldNumber; $_l_Process; $_l_RelationsIndex; DOC_l_ContactIDreturn; iCancel; iOK)
	C_POINTER:C301($_ptr_Field; $_ptr_Field2; $_ptr_Table; $4)
	C_TEXT:C284(<>Per_at_PersonnelNames_EmailSign; <>PER_t_CurrentUserInitials; $_t_EmailBody; $_t_EmailSubject; $_t_FindContactEmailAfter; $_t_FindContactEmailBefore; $_t_oldMethodName; $_t_PdfOutputFilePath; $_t_RelationshipName; $_t_ToEmailAddressSTR; $1)
	C_TEXT:C284($2; $3; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DOC_S20_ContactcodeReturn; DOC_t_ContactNameReturn; DOC_t_DocumentCode; DOC_t_DocumentName; DOC_t_EmailBodyReport)
	C_TEXT:C284(DOC_t_EmailSubject; DOC_t_HTMLEmailPath; UknownContact; vContName; WIN_t_FormSettingsLoaded; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Document_EmailPDF")

$_t_PdfOutputFilePath:=$1
If (Count parameters:C259>1)
	$_t_ToEmailAddressSTR:=$2
Else 
	$_t_ToEmailAddressSTR:=""
End if 
//************************************ added kmw 25/11/08 v631b120i -kmw **********************************
$_l_AtPosition:=Position:C15(Char:C90(64); $_t_ToEmailAddressSTR)
$_t_FindContactEmailBefore:=""
$_t_FindContactEmailAfter:=""
If ($_l_AtPosition>0)
	$_t_FindContactEmailBefore:=Substring:C12($_t_ToEmailAddressSTR; 1; $_l_AtPosition-1)
	$_t_FindContactEmailAfter:=Substring:C12($_t_ToEmailAddressSTR; $_l_AtPosition+1; Length:C16($_t_ToEmailAddressSTR))
End if 
//****************************************************************************************************************

StartTransaction

CREATE RECORD:C68([DIARY:12])
DiarySetCode
[DIARY:12]x_ID:50:=AA_GetNextID(->[DIARY:12]x_ID:50)
[DIARY:12]Person:8:=<>PER_t_CurrentUserInitials
[DIARY:12]Action_Code:9:="Email"

If (Count parameters:C259>=4)  //Link this record to the correc things....
	ARRAY LONGINT:C221(DOC_al_TableLink; 0)
	ARRAY LONGINT:C221(DOC_al_FIeldLink; 0)
	ARRAY LONGINT:C221(DOC_al_RecordID; 0)
	ARRAY TEXT:C222(DOC_at_RecordCode; 0)
	Case of 
		: (Table:C252($4)=Table:C252(->[PURCHASE_ORDERS:57]))
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[PURCHASE_ORDERS:57]))
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[COMPANIES:2]))
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTACTS:1]))
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2))
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[COMPANIES:2]Company_Code:1))
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[CONTACTS:1]Contact_Code:2))
			APPEND TO ARRAY:C911(DOC_al_RecordID; [PURCHASE_ORDERS:57]x_ID:21)
			APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
			APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [PURCHASE_ORDERS:57]Purchase_Order_Number:2)
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [PURCHASE_ORDERS:57]Company_Code:1)
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [PURCHASE_ORDERS:57]Contact_Code:5)
			//if contact with passed email address exists AND its different from the contact just added to array above then add that contact also.
			DOC_l_ContactIDreturn:=0
			$_l_Process:=New process:C317("DOC_GetContactDetails"; DB_ProcessMemoryinit(1); "Contact_Details"; Current process:C322; 0; ""; $_t_FindContactEmailBefore; $_t_FindContactEmailAfter)
			While (DOC_l_ContactIDreturn=0)
				DelayTicks(2)
			End while 
			If (DOC_l_ContactIDreturn<-1)  //there was more than one contact with that email address but only the first id found was returned....we will use it
				DOC_l_ContactIDreturn:=DOC_l_ContactIDreturn*-1
			End if 
			If (DOC_l_ContactIDreturn>0)  //if we have a contact
				If (DOC_S20_ContactcodeReturn#[INVOICES:39]Contact_Code:3)  //and its different from the one we just determined contextually
					//then add it also
					APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTACTS:1]))
					APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[PURCHASE_ORDERS:57]Contact_Code:5))
					APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
					APPEND TO ARRAY:C911(DOC_at_RecordCode; DOC_S20_ContactcodeReturn)
				End if 
			End if 
		: (Table:C252($4)=Table:C252(->[INVOICES:39]))
			ARRAY LONGINT:C221(DOC_al_TableLink; 0)
			ARRAY LONGINT:C221(DOC_al_FIeldLink; 0)
			ARRAY LONGINT:C221(DOC_al_RecordID; 0)
			ARRAY TEXT:C222(DOC_at_RecordCode; 0)
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[INVOICES:39]))
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[INVOICES:39]Invoice_Number:1))
			APPEND TO ARRAY:C911(DOC_al_RecordID; [INVOICES:39]X_ID:49)
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [INVOICES:39]Invoice_Number:1)
			
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[COMPANIES:2]))
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[COMPANIES:2]Company_Code:1))
			APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [INVOICES:39]Company_Code:2)
			
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTACTS:1]))
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[CONTACTS:1]Contact_Code:2))
			APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [INVOICES:39]Contact_Code:3)
			DOC_l_ContactIDreturn:=0
			$_l_Process:=New process:C317("DOC_GetContactDetails"; DB_ProcessMemoryinit(1); "Contact_Details"; Current process:C322; 0; ""; $_t_FindContactEmailBefore; $_t_FindContactEmailAfter)
			While (DOC_l_ContactIDreturn=0)
				DelayTicks(2)
			End while 
			If (DOC_l_ContactIDreturn<-1)  //there was more than one contact with that email address but only the first id found was returned....we will use it
				DOC_l_ContactIDreturn:=DOC_l_ContactIDreturn*-1
			End if 
			If (DOC_l_ContactIDreturn>0)  //if we have a contact
				If (DOC_S20_ContactcodeReturn#[INVOICES:39]Contact_Code:3)  //and its different from the one we just determined contextually
					//then add it also
					APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTACTS:1]))
					APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[CONTACTS:1]Contact_Code:2))
					APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
					APPEND TO ARRAY:C911(DOC_at_RecordCode; DOC_S20_ContactcodeReturn)
				End if 
			End if 
		: (Table:C252($4)=Table:C252(->[COMPANIES:2]))
			ARRAY LONGINT:C221(DOC_al_TableLink; 0)
			ARRAY LONGINT:C221(DOC_al_FIeldLink; 0)
			ARRAY LONGINT:C221(DOC_al_RecordID; 0)
			ARRAY TEXT:C222(DOC_at_RecordCode; 0)
			
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[COMPANIES:2]))
			
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[COMPANIES:2]Company_Code:1))
			
			APPEND TO ARRAY:C911(DOC_al_RecordID; [COMPANIES:2]x_ID:63)
			
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [COMPANIES:2]Company_Code:1)
		: (Table:C252($4)=Table:C252(->[CONTACTS:1]))
			ARRAY LONGINT:C221(DOC_al_TableLink; 0)
			ARRAY LONGINT:C221(DOC_al_FIeldLink; 0)
			ARRAY LONGINT:C221(DOC_al_RecordID; 0)
			ARRAY TEXT:C222(DOC_at_RecordCode; 0)
			
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[COMPANIES:2]))
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTACTS:1]))
			
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[COMPANIES:2]Company_Code:1))
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[CONTACTS:1]Contact_Code:2))
			
			APPEND TO ARRAY:C911(DOC_al_RecordID; [CONTACTS:1]x_ID:33)
			APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
			
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [CONTACTS:1]Contact_Code:2)
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [CONTACTS:1]Company_Code:1)
		: (Table:C252($4)=Table:C252(->[JOBS:26]))
		: (Table:C252($4)=Table:C252(->[ORDERS:24]))
			ARRAY LONGINT:C221(DOC_al_TableLink; 0)
			ARRAY LONGINT:C221(DOC_al_FIeldLink; 0)
			ARRAY LONGINT:C221(DOC_al_RecordID; 0)
			ARRAY TEXT:C222(DOC_at_RecordCode; 0)
			
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[ORDERS:24]))
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[COMPANIES:2]))
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTACTS:1]))
			
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[ORDERS:24]Order_Code:3))
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[COMPANIES:2]Company_Code:1))
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[CONTACTS:1]Contact_Code:2))
			
			
			APPEND TO ARRAY:C911(DOC_al_RecordID; [ORDERS:24]x_ID:58)
			APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
			APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
			
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [ORDER_ITEMS:25]Order_Code:1)
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [ORDERS:24]Company_Code:1)
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [ORDERS:24]Contact_Code:2)
			
			DOC_l_ContactIDreturn:=0
			$_l_Process:=New process:C317("DOC_GetContactDetails"; DB_ProcessMemoryinit(1); "Contact_Details"; Current process:C322; 0; ""; $_t_FindContactEmailBefore; $_t_FindContactEmailAfter)
			While (DOC_l_ContactIDreturn=0)
				DelayTicks(2)
			End while 
			If (DOC_l_ContactIDreturn<-1)  //there was more than one contact with that email address but only the first id found was returned....we will use it
				DOC_l_ContactIDreturn:=DOC_l_ContactIDreturn*-1
			End if 
			If (DOC_l_ContactIDreturn>0)  //if we have a contact
				If (DOC_S20_ContactcodeReturn#[ORDERS:24]Contact_Code:2)  //and its different from the one we just determined contextually
					//then add it also
					APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTACTS:1]))
					APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[PURCHASE_ORDERS:57]Contact_Code:5))
					APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
					APPEND TO ARRAY:C911(DOC_at_RecordCode; DOC_S20_ContactcodeReturn)
				End if 
			End if 
			
			
		: (Table:C252($4)=Table:C252(->[PRODUCTS:9]))
		: (Table:C252($4)=Table:C252(->[JOB_STAGES:47]))
		: (Table:C252($4)=Table:C252(->[JOB_STAGES:47]))
	End case 
	For ($_l_RelationsIndex; 1; Size of array:C274(DOC_al_TableLink))
		//NOTE THAT THE 1ST RELATION WILL BE THE PRIME RELATION-DOES NOT REALLY MATTHER THOUGH
		$_bo_SetPrime:=False:C215
		If ($_l_RelationsIndex=1)
			$_bo_SetPrime:=True:C214
		End if 
		If ($_bo_SetPrime)
			[DIARY:12]Data_Source_Table:49:=DOC_al_TableLink{$_l_RelationsIndex}
		End if 
		$_t_RelationshipName:=""
		Case of 
				
			: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[SERVICE_CALLS:20])) & ([DIARY:12]Call_Code:25="")
				[DIARY:12]Call_Code:25:=DOC_at_RecordCode{$_l_RelationsIndex}
				$_t_RelationshipName:="Service Call"
			: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[COMPANIES:2])) & ([DIARY:12]Company_Code:1="")
				[DIARY:12]Company_Code:1:=DOC_at_RecordCode{$_l_RelationsIndex}
				$_t_RelationshipName:="Company"
			: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[CONTACTS:1])) & ([DIARY:12]Contact_Code:2="")
				[DIARY:12]Contact_Code:2:=DOC_at_RecordCode{$_l_RelationsIndex}
				$_t_RelationshipName:="Contact"
			: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[JOBS:26])) & ([DIARY:12]Job_Code:19="")
				[DIARY:12]Job_Code:19:=DOC_at_RecordCode{$_l_RelationsIndex}
				$_t_RelationshipName:="Job"
			: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[ORDERS:24])) & ([DIARY:12]Order_Code:26="")
				[DIARY:12]Order_Code:26:=DOC_at_RecordCode{$_l_RelationsIndex}
				$_t_RelationshipName:="Order"
			: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[PRODUCTS:9])) & ([DIARY:12]Product_Code:13="")
				[DIARY:12]Product_Code:13:=DOC_at_RecordCode{$_l_RelationsIndex}
				$_t_RelationshipName:="Product"
			: (DOC_al_TableLink{$_l_RelationsIndex}=Table:C252(->[JOB_STAGES:47])) & ([DIARY:12]Stage_Code:21="")
				[DIARY:12]Stage_Code:21:=DOC_at_RecordCode{$_l_RelationsIndex}
				$_t_RelationshipName:="Job Stage"
		End case 
		CREATE RECORD:C68([xDiaryRelations:137])
		[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
		
		
		If (DOC_al_RecordID{$_l_RelationsIndex}=0)
			$_ptr_Field:=Field:C253(DOC_al_TableLink{$_l_RelationsIndex}; DOC_al_FIeldLink{$_l_RelationsIndex})
			If ($_ptr_Field->#DOC_at_RecordCode{$_l_RelationsIndex})  //Note the $2  must always be pointer at the code field  not the ID field
				$_ptr_Table:=Table:C252(DOC_al_TableLink{$_l_RelationsIndex})
				QUERY:C277($_ptr_Table->; $_ptr_Field->=DOC_at_RecordCode{$_l_RelationsIndex})
			End if 
			$_l_IdFIeldNumber:=AA_GetIDFieldNum(DOC_al_TableLink{$_l_RelationsIndex})
			If ($_l_IdFIeldNumber>0)
				$_ptr_Field2:=Field:C253(DOC_al_TableLink{$_l_RelationsIndex}; $_l_IdFIeldNumber)
				[xDiaryRelations:137]xRecordID:4:=$_ptr_Field2->
			End if 
			
		Else 
			[xDiaryRelations:137]xRecordID:4:=DOC_al_RecordID{$_l_RelationsIndex}
		End if 
		[xDiaryRelations:137]XRecord_Code:5:=DOC_at_RecordCode{$_l_RelationsIndex}
		
		[xDiaryRelations:137]xTableNUM:3:=DOC_al_TableLink{$_l_RelationsIndex}
		$_l_Denormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
		[xDiaryRelations:137]XRelationNUM:2:=$_l_Denormalised
		[xDiaryRelations:137]X_DisplayedName:6:=""
		[xDiaryRelations:137]x_RelationshipName:7:=$_t_RelationshipName
		DB_SaveRecord(->[xDiaryRelations:137])
		
	End for 
	//DB_SaveRecord (->[DIARY])
End if 
If ([DIARY:12]Company_Code:1="")
	[DIARY:12]Company_Code:1:=[CONTACTS:1]Company_Code:1
End if 

If ([DIARY:12]Contact_Code:2="")
	If (Records in selection:C76([CONTACTS:1])>0)
		[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
	Else 
		If ($_t_ToEmailAddressSTR#"")
			//$_t_FindContactEmailBefore and $_t_FindContactEmailAfter have already been determined from $_t_ToEmailAddressSTR
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Email_Before_At:30=$_t_FindContactEmailBefore; *)
			QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]EMail_After_At:24=$_t_FindContactEmailAfter)
			If (Records in selection:C76([CONTACTS:1])>0)
				[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
			Else 
				
				//*********************** factored out into it's own method 16/03/09 -kmw ***********************
				//QUERY([COMPANIES];[COMPANIES]Company Code="*UKNWN*")
				//If (Records in selection([COMPANIES])=0)
				//READ WRITE([COMPANIES])
				//CREATE RECORD([COMPANIES])
				//[COMPANIES]Company Code:="*UKNWN*"
				//[COMPANIES]x_ID:=AA_GetNextID (->[COMPANIES]x_ID)
				//[COMPANIES]Company Name:=""  `"Unknown EMail_Contact"
				//[COMPANIES]Private:=True
				//[COMPANIES]Deleted:=1
				//SAVE RECORD([COMPANIES])
				//End if
				//QUERY([CONTACTS];[CONTACTS]Contact Code="*UKNWN*")
				//If (Records in selection([CONTACTS])=0)
				//READ WRITE([CONTACTS])
				//CREATE RECORD([CONTACTS])
				//[CONTACTS]Contact Code:="*UKNWN*"
				//[CONTACTS]Company Code:="*UKNWN*"
				//[CONTACTS]x_ID:=AA_GetNextID (->[CONTACTS]x_ID)
				//[CONTACTS]Contact_Name:=""  `"Unknown Email_Contact"
				//[CONTACTS]Forename:=""  `"Unknown"
				//[CONTACTS]Surname:=""  `"Email_Contact"
				//[CONTACTS]Deleted:=1
				//SAVE RECORD([CONTACTS])
				//End if
				//[DIARY]Contact Code:=[CONTACTS]Contact Code
				[DIARY:12]Contact_Code:2:=UknownContact
				//****************************************************************************************************
				
				If ([DIARY:12]Company_Code:1="")
					[DIARY:12]Company_Code:1:=[CONTACTS:1]Company_Code:1
				End if 
				
				
				
			End if 
		Else 
			//leave blank
		End if 
	End if 
Else 
	//Everything ok already
End if 


[DIARY:12]Person:8:=<>PER_t_CurrentUserInitials
[DIARY:12]Action_Code:9:="Email"
$_l_DocumentCodeTries:=0
Repeat 
	
	Let_No("E")
	[DIARY:12]Document_Code:15:="E/"+DOC_t_DocumentCode
	$_l_DocumentCodeTries:=$_l_DocumentCodeTries+1
	If ($_l_DocumentCodeTries>100)
		[DIARY:12]Document_Code:15:=[DIARY:12]Document_Code:15+String:C10($_l_DocumentCodeTries)
	End if 
Until ((Find in field:C653([DOCUMENTS:7]Document_Code:1; [DIARY:12]Document_Code:15)=-1) & (Find in field:C653([DIARY:12]Document_Code:15; [DIARY:12]Document_Code:15)=-1))

[DIARY:12]Email_From:38:=GetEmailSender

If (Developer) | (Is compiled mode:C492=False:C215)
	Gen_Confirm("Send from test address?")
	If (OK=1)
		[DIARY:12]Email_From:38:="nigel.greenlee@me.com"
	End if 
End if 

[DIARY:12]Company_Code:1:=[CONTACTS:1]Company_Code:1
[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
If (DOC_t_EmailSubject="")
	If (Count parameters:C259>=3)
		$_t_EmailSubject:=$3
	End if 
Else 
	$_t_EmailSubject:=Document_EmailTokens(DOC_t_EmailSubject)
End if 
[DIARY:12]Email_Subject:40:=$_t_EmailSubject
If (DOC_t_EmailBodyReport="")
	$_t_EmailBody:=<>Per_at_PersonnelNames_EmailSign
Else 
	$_t_EmailBody:=Document_EmailTokens(DOC_t_EmailBodyReport)
End if 
[DIARY:12]Email_Text:42:=$_t_EmailBody
[DIARY:12]Date_Done_From:5:=Current date:C33(*)
[DIARY:12]Date_Do_From:4:=Current date:C33(*)
[DIARY:12]Date_Do_To:33:=Current date:C33(*)
[DIARY:12]Date_Done_To:34:=Current date:C33(*)
[DIARY:12]Time_Do_To:35:=Current time:C178(*)
[DIARY:12]Time_Done_To:36:=Current time:C178(*)
[DIARY:12]Time_Do_From:6:=Current time:C178(*)
[DIARY:12]Time_Done_From:7:=Current time:C178(*)
[DIARY:12]Done:14:=False:C215
DB_SaveRecord(->[DIARY:12])


CREATE RECORD:C68([DOCUMENTS:7])
[DOCUMENTS:7]Document_Code:1:=[DIARY:12]Document_Code:15
[DOCUMENTS:7]Document_Class:14:=Text Email
[DOCUMENTS:7]Heading:2:=[DIARY:12]Email_Subject:40  //added -kmw, 17/10/08 v631b120a (fix problem with email subject not coming through from super report template when emailing a PO - and probably fixes same problem in any other super report for that matter)
[DOCUMENTS:7]Text:3:=[DIARY:12]Email_Text:42
DB_SaveRecord(->[DOCUMENTS:7])
DB_t_CurrentFormUsage:=""
DB_t_CurrentFormUsage2:=""
DB_t_CallOnCloseorSave:=""
WIN_t_CurrentInputForm:=""
vContName:=""
WIN_t_FormSettingsLoaded:=""
INT_bo_SkinsPrefsLoaded:=False:C215
iOK:=0
iCancel:=0
ARRAY TEXT:C222(WS_at_Attachments; 0)



CREATE RECORD:C68([EMAIL_ATTACHMENTS:103])
[EMAIL_ATTACHMENTS:103]DiaryID:1:=[DIARY:12]Diary_Code:3
[EMAIL_ATTACHMENTS:103]Attachment_Path:3:=$_t_PdfOutputFilePath
[EMAIL_ATTACHMENTS:103]Attachment_Name:4:=DOC_t_DocumentName+".PDF"
DB_SaveRecord(->[EMAIL_ATTACHMENTS:103])

Case of 
	: (Position:C15("@"; $_t_ToEmailAddressSTR)<=0)  //invalid email
	: ($_t_ToEmailAddressSTR#"")
		
		CREATE RECORD:C68([EMAIL_RECIPIENTS:104])
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
		
		[EMAIL_RECIPIENTS:104]DiaryID:1:=[DIARY:12]Diary_Code:3
		[EMAIL_RECIPIENTS:104]Email_Address:3:=$_t_ToEmailAddressSTR
		[EMAIL_RECIPIENTS:104]Classification:2:="To"
		DB_SaveRecord(->[EMAIL_RECIPIENTS:104])
		UNLOAD RECORD:C212([EMAIL_RECIPIENTS:104])
		
	Else 
End case 

DOC_t_HTMLEmailPath:=""

Diary_EmailNew

If (Mail_bo_inOK)
	//VALIDATE TRANSACTION
	Transact_End(True:C214)
Else 
	//CANCEL TRANSACTION
	Transact_End(False:C215)
End if 
ERR_MethodTrackerReturn("Document_EmailPDF"; $_t_oldMethodName)