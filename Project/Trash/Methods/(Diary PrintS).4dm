//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_PrintS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 14:19
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WS_al_EmailID;0)
	ARRAY TEXT:C222($_at_AttachmentPaths; 0)
	ARRAY TEXT:C222($_at_Attachments; 0)
	ARRAY TEXT:C222($_at_ContactID; 0)
	ARRAY TEXT:C222($_at_EmailAddresses; 0)
	ARRAY TEXT:C222($_at_EmailType; 0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	C_BOOLEAN:C305($_bo_Confirm; $_bo_Save; $0; $1; $2; DB_bo_RecordModified)
	C_LONGINT:C283($_l_Process; $_l_SelectedEmailRow; $_l_SignaturePosition; cSave; vCreate; vEdit; WRITE; WS_l_SelectedEmailName; xCancel; xnext; xOK)
	C_TEXT:C284(<>eLetAct; $_t_EmailID; $_t_EmailSignature; $_t_EmailText; $_t_InsText; $_t_oldMethodName; DOC_t_DocumentCode; EMAIL_t_EmailType; EMAIL_t_SendCalledFrom; vLetterCode; vPerson)
	C_TEXT:C284(WIN_t_CurrentInputForm; WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_PrintS")
//Diary_PrintS - Save

$0:=True:C214
If (Count parameters:C259>0)
	$_bo_Save:=$1
Else 
	$_bo_Save:=False:C215
End if 

If (Count parameters:C259>1)
	$_bo_Confirm:=$2
Else 
	$_bo_Confirm:=True:C214
End if 
READ WRITE:C146([EMAIL_ATTACHMENTS:103])
//modify this
//C_TEXT($Heading)
If (WIN_t_CurrentInputForm="Diary_InEmail")
	If ((WS_t_EmailName#"") & (WS_t_EmailAddress#"")) | ((WS_t_EmailName="") & (WS_t_EmailAddress=""))
		GOTO OBJECT:C206([DIARY:12]Email_Subject:40)
		If (WS_l_SelectedEmailName>0)
			$_l_SelectedEmailRow:=WS_l_SelectedEmailName
		Else 
			If (WS_t_EmailAddress#"")
				$_l_SelectedEmailRow:=Find in array:C230(SD2_at_EmailAddresses; WS_t_EmailAddress)
			Else 
				$_l_SelectedEmailRow:=0
			End if 
		End if 
		If ($_l_SelectedEmailRow<0)
			INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
			INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
			INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
			INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
			If (EMAIL_t_EmailType="")
				EMAIL_t_EmailType:="To"
			End if 
			SD2_at_EmailType{Size of array:C274(SD2_at_EmailType)}:=EMAIL_t_EmailType
			SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}:=WS_t_EmailAddress
			SD2_at_ContactIDs{Size of array:C274(SD2_at_ContactIDs)}:=WS_t_ContactID
			SD2_at_EmailName{Size of array:C274(SD2_at_EmailName)}:=WS_t_EmailName
			If (Size of array:C274(SD2_at_EmailName)>1)
				WS_l_SelectedEmailName:=0
				EMAIL_t_EmailType:=""
				WS_t_EmailAddress:=""
				WS_t_ContactID:=""
				WS_t_EmailName:=""
			End if 
		Else 
			If (EMAIL_t_EmailType="")
				EMAIL_t_EmailType:="To"
			End if 
			SD2_at_EmailType{WS_l_SelectedEmailName}:=EMAIL_t_EmailType
			SD2_at_EmailAddresses{WS_l_SelectedEmailName}:=WS_t_EmailAddress
			SD2_at_ContactIDs{WS_l_SelectedEmailName}:=WS_t_ContactID
			SD2_at_EmailName{WS_l_SelectedEmailName}:=WS_t_EmailName
			If (Size of array:C274(SD2_at_EmailName)>1)
				WS_l_SelectedEmailName:=0
				EMAIL_t_EmailType:=""
				WS_t_EmailAddress:=""
				WS_t_ContactID:=""
				WS_t_EmailName:=""
			End if 
		End if 
	Else 
	End if 
	
	//SETEMAILFORMOBJECTS
	
	If (cSave>0)
		[DOCUMENTS:7]Heading:2:=[DIARY:12]Email_Subject:40
		[DOCUMENTS:7]Text:3:=[DIARY:12]Email_Text:42
		DB_SaveRecord(->[DOCUMENTS:7])
		RELATE ONE:C42([DIARY:12]Document_Code:15)
		vLetterCode:=[DIARY:12]Document_Code:15
		Case of 
			: (Records in selection:C76([DOCUMENTS:7])=0)
				CREATE RECORD:C68([DOCUMENTS:7])
				[DOCUMENTS:7]Document_Code:1:=vLetterCode
				[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
				[DOCUMENTS:7]Export:6:=Export_Stamp
				[DIARY:12]Document_Code:15:=vLetterCode
				[DOCUMENTS:7]Document_Class:14:=Text Email
				
			Else 
				If ((vEdit=1) & (cSave>0) & (vCreate=1))
					CREATE RECORD:C68([DOCUMENTS:7])
					[DOCUMENTS:7]Document_Code:1:=vLetterCode+"/"+DOC_t_DocumentCode
					[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
					[DOCUMENTS:7]Export:6:=Export_Stamp
					[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
					[DOCUMENTS:7]Document_Class:14:=Text Email
				End if 
		End case 
		If (DB_bo_RecordModified)
			[DOCUMENTS:7]Export:6:=Export_Stamp
		End if 
		[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
		[DOCUMENTS:7]Text:3:=[DIARY:12]Email_Text:42
		[DOCUMENTS:7]Person:10:=[DIARY:12]Person:8
		DB_SaveRecord(->[DOCUMENTS:7])
		//now need to check the recipients are saved
		READ WRITE:C146([EMAIL_RECIPIENTS:104])
		If ($_bo_Save)
			QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1=[DIARY:12]Diary_Code:3)
			SELECTION TO ARRAY:C260([EMAIL_RECIPIENTS:104]Classification:2; $_at_EmailType; [EMAIL_RECIPIENTS:104]Email_Address:3; $_at_EmailAddresses; [EMAIL_RECIPIENTS:104]ContactID:4; $_at_ContactID)
			If (Size of array:C274(SD2_at_EmailType)>Size of array:C274($_at_EmailType))
				DELETE SELECTION:C66([EMAIL_RECIPIENTS:104])
				ARRAY TO SELECTION:C261(SD2_at_EmailType; [EMAIL_RECIPIENTS:104]Classification:2; SD2_at_EmailAddresses; [EMAIL_RECIPIENTS:104]Email_Address:3; SD2_at_ContactIDs; [EMAIL_RECIPIENTS:104]ContactID:4)
			Else 
				ARRAY TO SELECTION:C261(SD2_at_EmailType; [EMAIL_RECIPIENTS:104]Classification:2; SD2_at_EmailAddresses; [EMAIL_RECIPIENTS:104]Email_Address:3; SD2_at_ContactIDs; [EMAIL_RECIPIENTS:104]ContactID:4)
			End if 
			DB_lockFile(->[EMAIL_RECIPIENTS:104])
			APPLY TO SELECTION:C70([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1:=[DIARY:12]Diary_Code:3)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_RECIPIENTS:104]))
			UNLOAD RECORD:C212([EMAIL_RECIPIENTS:104])
			READ ONLY:C145([EMAIL_RECIPIENTS:104])
			If ([DIARY:12]Email_ID:41=0)
				[DIARY:12]Email_ID:41:=-(AA_GetNextIDinMethod(->[DIARY:12]Email_ID:41))  //Give a negative value until this email is sent
				DB_SaveRecord(->[DIARY:12])
				AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
			End if 
			
			If (False:C215)
				QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
				
				SELECTION TO ARRAY:C260([EMAIL_ATTACHMENTS:103]Attachment_Name:4; $_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; $_at_AttachmentPaths)
				
				If (Size of array:C274($_at_Attachments)>Size of array:C274(WS_at_Attachments))
					DELETE SELECTION:C66([EMAIL_ATTACHMENTS:103])
					ARRAY TO SELECTION:C261(WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; SD3_at_DocDiaryCode; [EMAIL_ATTACHMENTS:103]DiaryID:1; WS_al_EmailID; [EMAIL_ATTACHMENTS:103]Email_ID:2)
				Else 
					ARRAY TO SELECTION:C261(WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; SD3_at_DocDiaryCode; [EMAIL_ATTACHMENTS:103]DiaryID:1; WS_al_EmailID; [EMAIL_ATTACHMENTS:103]Email_ID:2)
				End if 
				DB_lockFile(->[EMAIL_ATTACHMENTS:103])
				APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:=[DIARY:12]Diary_Code:3)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
				DB_lockFile(->[EMAIL_ATTACHMENTS:103])
				APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Location:6:=Get_Email_Owner)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
				DB_lockFile(->[EMAIL_ATTACHMENTS:103])
				APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Document_Type:7:=_o_Document type:C528([EMAIL_ATTACHMENTS:103]Attachment_Path:3))
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
				DB_lockFile(->[EMAIL_ATTACHMENTS:103])
				APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Document_Creator:8:=_o_Document creator:C529([EMAIL_ATTACHMENTS:103]Attachment_Path:3))
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
				DB_lockFile(->[EMAIL_ATTACHMENTS:103])
				APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; EMAILupdateattachmentlocation)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			Else 
				EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 1; [DIARY:12]Diary_Code:3; [DIARY:12]Email_ID:41)
				
			End if 
			
		End if 
		
		If ([DIARY:12]Email_ID:41<=0) & (Size of array:C274(SD2_at_EmailType)>0)
			If ($_bo_Confirm)
				If (Count parameters:C259>=2)
					xCancel:=0
					xnext:=0
					xOK:=0
					Gen_Confirm3("This eMail has not been sent. Do you wish to send it now?"; "Yes"; "No"; "Stop")
					OK:=xOK
					
					If (xnext=1)
						$0:=False:C215
					Else 
						$0:=True:C214
					End if 
				Else 
					Gen_Confirm("This eMail has not been sent. Do you wish to send it now?"; "Yes"; "No")
					
				End if 
				
			Else 
				OK:=1
			End if 
			If (OK=1)
				Repeat 
					$_l_SelectedEmailRow:=Find in array:C230(SD2_at_EmailAddresses; "")
					If ($_l_SelectedEmailRow>0)
						DELETE FROM ARRAY:C228(SD2_at_EmailAddresses; $_l_SelectedEmailRow)
						DELETE FROM ARRAY:C228(SD2_at_EmailType; $_l_SelectedEmailRow)
						DELETE FROM ARRAY:C228(SD2_at_EmailName; $_l_SelectedEmailRow)
						
					End if 
				Until ($_l_SelectedEmailRow<0)
				If (Size of array:C274(SD2_at_EmailName)>0)
					EMAIL_t_SendCalledFrom:="Diary_PrintS"
					$_t_EmailID:=Email_Send(->SD2_at_EmailType; ->SD2_at_EmailName; ->SD2_at_EmailAddresses; vPerson; [DIARY:12]Email_From:38; [DIARY:12]Email_From:38; [DIARY:12]Email_Subject:40; ->WS_at_AttachmentsPath; ->[DIARY:12]Email_Text:42; True:C214)
					If ($_t_EmailID#"")
						If ([DIARY:12]Email_ID:41=0)
							If ([DIARY:12]Action_Code:9=<>eLetAct)
								[DIARY:12]Done:14:=True:C214
							End if 
							[DIARY:12]Email_ID:41:=AA_GetNextIDinMethod(->[DIARY:12]Email_ID:41)
						Else 
							[DIARY:12]Email_ID:41:=Abs:C99([DIARY:12]Email_ID:41)
						End if 
					End if 
					If ([DOCUMENTS:7]Text:3#"")
						[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
						$_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+Char:C90(13)
						$_t_EmailSignature:=GetEmailSignature
						$_l_SignaturePosition:=Position:C15(Char:C90(13)+$_t_InsText+Char:C90(13)+$_t_EmailSignature; [DIARY:12]Email_Text:42)
						If ($_l_SignaturePosition>0)
							$_t_EmailText:=Replace string:C233([DOCUMENTS:7]Text:3; Char:C90(13)+$_t_InsText+Char:C90(13)+$_t_EmailSignature; "")
						Else 
							$_t_EmailText:=[DOCUMENTS:7]Text:3
						End if 
						
						If ([DIARY:12]Action_Details:10="")
							[DIARY:12]Action_Details:10:=$_t_EmailText
						Else 
							[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+Char:C90(13)+"Email Text"+Char:C90(13)+$_t_EmailText
						End if 
					End if 
					
					If (Records in selection:C76([EMAIL_ATTACHMENTS:103])=0)
						If (False:C215)
							READ WRITE:C146([EMAIL_ATTACHMENTS:103])
							ARRAY TO SELECTION:C261(WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; SD3_at_DocDiaryCode; [EMAIL_ATTACHMENTS:103]DiaryID:1; WS_al_EmailID; [EMAIL_ATTACHMENTS:103]Email_ID:2)
						Else 
							EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 2; [DIARY:12]Diary_Code:3; [DIARY:12]Email_ID:41)
						End if 
					Else 
						EMail_SaveAttachments(->WS_at_Attachments; ->WS_at_AttachmentsPath; ->SD3_at_DocDiaryCode; ->WS_al_EmailID; 3; [DIARY:12]Diary_Code:3; [DIARY:12]Email_ID:41)
						DB_lockFile(->[EMAIL_ATTACHMENTS:103])
						APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2:=[DIARY:12]Email_ID:41)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
						
					End if 
					If (False:C215)
						
						DB_lockFile(->[EMAIL_ATTACHMENTS:103])
						APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:=[DIARY:12]Diary_Code:3)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
						DB_lockFile(->[EMAIL_ATTACHMENTS:103])
						APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; EMAILupdateattachmentlocation)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
					End if 
					
					
					DB_SaveRecord(->[DIARY:12])
					AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
					UNLOAD RECORD:C212([EMAIL_ATTACHMENTS:103])
					READ ONLY:C145([EMAIL_ATTACHMENTS:103])
					QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2=[DIARY:12]Email_ID:41)
					If (Records in selection:C76([EMAIL_ATTACHMENTS:103])>0)
						If ([DIARY:12]Email_ID:41>0)
							If (In transaction:C397)
								$_l_Process:=New process:C317("DS_DocstoServer"; 128000; "Moving Documents"; [DIARY:12]Email_ID:41; Current process:C322)
							Else 
								$_l_Process:=New process:C317("DS_DocstoServer"; 128000; "Moving Documents"; [DIARY:12]Email_ID:41)
								
							End if 
						End if 
					End if 
				Else 
					Gen_Alert("This email has no valid recipients so cannot be sent!")
				End if 
			Else 
				OK:=1
			End if 
		End if 
	End if 
	
Else 
	
	
	If (cSave>0)
		Case of 
			: (Documents_4DWriteAccessType(False:C215)="W@")
				// $Heading:=[DOCUMENTS]Heading
				DB_SaveRecord(->[DOCUMENTS:7])
				RELATE ONE:C42([DIARY:12]Document_Code:15)
				vLetterCode:=[DIARY:12]Document_Code:15
				Case of 
					: (Records in selection:C76([DOCUMENTS:7])=0)
						CREATE RECORD:C68([DOCUMENTS:7])
						[DOCUMENTS:7]Document_Code:1:=DOC_t_DocumentCode
						[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
						[DOCUMENTS:7]Export:6:=Export_Stamp
						[DIARY:12]Document_Code:15:=DOC_t_DocumentCode
						
						[DOCUMENTS:7]Document_Class:14:=4D Write Letter
						
						
					Else 
						
						If ((vEdit=1) & (cSave>0) & (vCreate=1))
							CREATE RECORD:C68([DOCUMENTS:7])
							[DOCUMENTS:7]Document_Code:1:=vLetterCode+"/"+DOC_t_DocumentCode
							[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
							[DOCUMENTS:7]Export:6:=Export_Stamp
							[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
							[DOCUMENTS:7]Document_Class:14:=4D Write Letter
						End if 
				End case 
				If (DB_bo_RecordModified)
					[DOCUMENTS:7]Export:6:=Export_Stamp
				End if 
				[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
				[DOCUMENTS:7]Write_:5:=WR Area to picture:P12000:139(WRITE; 1; 0)
				[DOCUMENTS:7]Person:10:=[DIARY:12]Person:8
				DB_SaveRecord(->[DOCUMENTS:7])
				//     : (◊Write="SW")  ` SuperWrite OUT 24/04/02 pb
				//      $r:=SW Get Area (Write;$p)
				//      [DOCUMENTS]Write_:=$p
				//     DB_SaveRecord(->[DOCUMENTS])
			Else 
				Letter_Text
				DB_SaveRecord(->[DOCUMENTS:7])
		End case 
	End if 
	cSave:=0
	vCreate:=2
End if 
ERR_MethodTrackerReturn("Diary_PrintS"; $_t_oldMethodName)
