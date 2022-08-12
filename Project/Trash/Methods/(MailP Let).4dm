//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MailP Let
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    03/06/2010 18:53
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
	C_BOOLEAN:C305(DOCLOADED; DOCLOADED2; EMAIL_bo_DonotChangeSubject; EMAIL_bo_MailListBuilt; Email_bo_TestMailing)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_EmailAccess; $_l_EmailAddressRow; $_l_ID; $_l_Index; $_l_OK; $_l_RecordNumber; bd1; Bd4; cLetters; cMerged)
	C_LONGINT:C283(cOC; cPreview; First; MMLetterClass; PrintCount; rDiary; rState; WS_l_bd5; WS_l_bd6)
	C_POINTER:C301($_ptr_CurrentTable; $1)
	C_REAL:C285($_l_DeNormalised)
	C_TEXT:C284(<>eLetAct; <>PER_t_CurrentUserInitials; $_t_After; $_t_Before; $_t_DiaryCode; $_t_DocumentName; $_t_DocumentPathname; $_t_From; $_t_Initials; $_t_oldMethodName; $_t_Request)
	C_TEXT:C284($_t_TableSTR; DOC_NAME; DOC_PATHNAME; DOC_t_DocumentCode; EMAIL_t_Attachment; EMAIL_t_EmailTo; EMAIL_t_EmailType; MMEmailCode; MMLetterCode; MMLetterRef; PDF_t_CURPDriver)
	C_TEXT:C284(PDF_t_CURPName; PDF_t_CURPType; PDF_t_CURPZone; vContName; vFrom; vHeading; VletterCode; vName; vOurRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MailP Let")
//MailP Let
Email_bo_TestMailing:=False:C215
//TRACE
//Email_bo_TestMailing:=TEST_MAILING
//then we dont want to print the document
$_ptr_CurrentTable:=$1
Case of 
	: (MMLetterClass=0) | (MMLetterClass=4D Write Letter) | (MMLetterClass=4D Write Letter Template)  //this is a letter
		//MMLetterCode is already =vletterCode
		//what we do need to remember
		//if we are doing an email merge-we need to print the document to PDF
		//then add create the Email-with ONE attachment and send it
		//if we are
		If (MMLetterCode#[DOCUMENTS:7]Document_Code:1)  //the wrong document is current
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=MMLetterCode)
		End if 
		<>SYS_l_CancelProcess:=0
		vHeading:=[DOCUMENTS:7]Heading:2
		MMLetterRef:=""  //this is to store the copy of document name
		
		Letter_Date
		vName:=""
		DOCLOADED:=False:C215
		DOCLOADED2:=False:C215
		If ((cPreview=1) & (Documents_4DWriteAccessType(False:C215)="W@"))  //Print preview
			MailP_Ready("Are you ready to Preview one Document to screen?")
			If (OK=1)
				Gen_PallHide
				FIRST RECORD:C50($_ptr_CurrentTable->)
				
				Mail_MSRec
				vOurRef:="Preview Copy: "+[DOCUMENTS:7]Document_Code:1
				Case of 
					: (rDiary=1)
						DOCLOADED:=Letter_LoadD(DOCLOADED; ->MMLetterCode)
						RELATE ONE:C42([DIARY:12]Company_Code:1)
						RELATE ONE:C42([DIARY:12]Contact_Code:2)
						MCont_Add("")
					: (rState>1)
						RELATE ONE:C42([INVOICES:39]Credit_Stage:22)
						DOCLOADED:=Letter_LoadI(DOCLOADED; ->MMLetterCode)
						MState_Calc2
						MCont_Add("")
					Else 
						Letter_AllDets(False:C215)
				End case 
				Letter_Preview
				Gen_PallShow
			End if 
		End if   //end print preview
		
		If (cOC=1)  // Print office copy-this we print-even if we are emailing
			MailP_Ready("Are you ready to print an Office Copy of one Document?")
			$_l_OK:=PRINT_SetSIZE("A4"; "P"; "LetterPrinting")
			If ($_l_OK>=0)
				If (Documents_4DWriteAccessType(False:C215)="")
					//  PRINT SETTINGS
				Else 
					First:=1
				End if 
				If (OK=1)
					FIRST RECORD:C50($_ptr_CurrentTable->)
					Mail_MSRec
					vOurRef:="Office Copy: "+[DOCUMENTS:7]Document_Code:1
					Case of 
						: (rDiary=1)
							DOCLOADED:=Letter_LoadD(DOCLOADED; ->MMLetterCode)
							RELATE ONE:C42([DIARY:12]Company_Code:1)
							RELATE ONE:C42([DIARY:12]Contact_Code:2)
							MCont_Add("")
						: (rState>1)
							RELATE ONE:C42([INVOICES:39]Credit_Stage:22)
							DOCLOADED:=Letter_LoadI(DOCLOADED; ->MMLetterCode)
							MState_Calc2
							MCont_Add("")
						Else 
							Letter_AllDets(False:C215)
					End case 
					
					Letter_Print([DOCUMENTS:7]Document_Code:1)
				End if 
			End if 
		End if   //end office copy
		$_l_EmailAccess:=0
		If (cLetters=1)
			If (Bd4=0)  //not sending an email
				MailP_Ready("Are you ready to print all Documents?  (Settings 100% Portrait)")
			Else 
				
				$_l_EmailAccess:=EmailCheckPDFWriter(1)
				If (MMEmailCode#"") & ($_l_EmailAccess>0)
					//an Email Template is selected-so use that for the email
				Else 
					//$_l_TableNumber:=Current default table
					MMEmailCode:=Letters_In("3"; $_l_EmailAccess)
					//DEFAULT TABLE($_l_TableNumber->)  `MMEmailCode:=VletterCode
				End if 
				If ($_l_EmailAccess>0)  //this will say 1 when I set up using 4D write to .doc
					
					$_l_OK:=PLUGCALL_PDFs("GETPRINTER"; ->PDF_t_CURPName; ->PDF_t_CURPType; ->PDF_t_CURPZone; ->PDF_t_CURPDriver)
					$_l_OK:=SetMachinePDFWriter(<>PER_t_CurrentUserInitials)
					If (MMLetterCode#[DOCUMENTS:7]Document_Code:1)  //the wrong document is current
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=MMLetterCode)
					End if 
					$_t_DocumentName:=[DOCUMENTS:7]Heading:2
					For ($_l_Index; Length:C16($_t_DocumentName); 1; -1)
						If ((Character code:C91($_t_DocumentName[[$_l_Index]])>64) & (Character code:C91($_t_DocumentName[[$_l_Index]])<91)) | ((Character code:C91($_t_DocumentName[[$_l_Index]])>96) & (Character code:C91($_t_DocumentName[[$_l_Index]])<123))
						Else 
							//not valid char
							$_t_Before:=Substring:C12($_t_DocumentName; 1; $_l_Index-1)
							$_t_After:=Substring:C12($_t_DocumentName; $_l_Index+1; Length:C16($_t_DocumentName))
							$_t_DocumentName:=$_t_Before+$_t_After
						End if 
					End for 
					If (Length:C16($_t_DocumentName)>8)
						$_t_DocumentName:=Substring:C12($_t_DocumentName; 1; 8)
					End if 
					DOC_NAME:=$_t_DocumentName
					$_l_OK:=PLUGCALL_PDFs("GETPATH"; ->DOC_PATHNAME; ->DOC_NAME)
					
					OK:=Abs:C99($_l_OK-1)  //$L:=PD_Define (Doc_Pathname;0)-this will be done for each one
				End if 
				
			End if 
			If (OK=1)
				If (Documents_4DWriteAccessType(False:C215)="")
					
					PRINT SETTINGS:C106
				Else 
					First:=1
					//   Gen_Confirm ("Are you sure? (The Print Settings will not Cancel)";"Yes";"No")
				End if 
				If (OK=1)
					
					PrintCount:=0
					Check_Pages
					If (OK=1)
						//Because we may swap selections in  here now
						COPY NAMED SELECTION:C331($_ptr_CurrentTable->; "Selection_Current")
						FIRST RECORD:C50($_ptr_CurrentTable->)
						$_l_RecordNumber:=1
						Mail_MSRec
						While ((Not:C34(End selection:C36($_ptr_CurrentTable->))) & (OK=1) & (<>SYS_l_CancelProcess#Current process:C322))
							USE NAMED SELECTION:C332("Selection_Current")
							If ($_l_RecordNumber<=Records in selection:C76($_ptr_CurrentTable->))
								
								GOTO SELECTED RECORD:C245($_ptr_CurrentTable->; $_l_RecordNumber)
								If (Table:C252($_ptr_CurrentTable)=Table:C252(->[ORDER_ITEMS:25]))
									QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[ORDERS:24]Company_Code:1)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[ORDERS:24]Contact_Code:2)
									
								End if 
								
								Case of 
									: (rDiary=1)  //printing from the diary-so loop is diary
										
										$_t_From:=vFrom
										DOCLOADED:=Letter_LoadD(DOCLOADED; ->MMLetterCode)
										RELATE ONE:C42([DIARY:12]Company_Code:1)
										RELATE ONE:C42([DIARY:12]Contact_Code:2)
										vOurRef:=[DIARY:12]Company_Code:1+"-"+[DIARY:12]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
										MCont_Add("")  //GET THE Contact_Details
										$_t_DocumentPathname:=MailP_Let_namepdf($_l_EmailAccess; DOC_NAME)
										Letter_Print([DOCUMENTS:7]Document_Code:1; $_l_EmailAccess; $_t_DocumentPathname)
										ARRAY TEXT:C222(WS_at_Attachments; 0)
										ARRAY TEXT:C222(WS_at_AttachmentsPath; 0)
										ARRAY LONGINT:C221(WS_al_EmailID; 0)
										ARRAY TEXT:C222(SD3_at_DocDiaryCode; 0)
										If ($_l_EmailAccess>0)  //we now need to add this to the attachments
											APPEND TO ARRAY:C911(WS_at_AttachmentsPath; $_t_DocumentPathname)
											APPEND TO ARRAY:C911(WS_at_Attachments; FileNamefromPath($_t_DocumentPathname))
											APPEND TO ARRAY:C911(WS_al_EmailID; 0)
											APPEND TO ARRAY:C911(SD3_at_DocDiaryCode; "")
										End if 
										Letter_AllocD([DOCUMENTS:7]Document_Code:1)
										If ($_l_EmailAccess>0)
											DB_SaveRecord(->[DIARY:12])
											AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
											$_t_DiaryCode:=[DIARY:12]Diary_Code:3  //so we can get it back
											MailP_let_MakeEmail($_l_EmailAccess; False:C215; $_t_From)
											QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCode)
										End if 
									: (rState>1)
										
										MState_CalcRel  //kmw, 04/07/08 - if user selects "multiple" after selecting "other" there was no invoice loaded so no value in [invoices]credit stage so also needed to do this (as well as moving relate to before "MState_Calc2")
										RELATE ONE:C42([INVOICES:39]Credit_Stage:22)  //kmw, 04/07/08 - moved from after call to "MState_Calc2" to before call to "MState_Calc2" ("MState_Calc2" creates a selection of invocies but goes past the end of that selection meanining no calue in [invoices]credit stage).
										MState_Calc2
										//RELATE ONE([INVOICES]Credit Stage)``kmw, 04/07/08 - moved from after call to "MState_Calc2" to before call to "MState_Calc2" ("MState_Calc2" creates a selection of invocies but goes past the end of that selection meanining no calue in [invoices]credit stage).
										
										
										DOCLOADED:=Letter_LoadI(DOCLOADED; ->MMLetterCode)
										vOurRef:=[COMPANIES:2]Company_Code:1+"-"+[CONTACTS:1]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
										MCont_Add("")
										$_t_DocumentPathname:=MailP_Let_namepdf($_l_EmailAccess; DOC_NAME)
										Letter_Print([DOCUMENTS:7]Document_Code:1; $_l_EmailAccess; $_t_DocumentPathname)
										
										ARRAY TEXT:C222(WS_at_Attachments; 0)
										ARRAY TEXT:C222(WS_at_AttachmentsPath; 0)
										ARRAY LONGINT:C221(WS_al_EmailID; 0)
										ARRAY TEXT:C222(SD3_at_DocDiaryCode; 0)
										If ($_l_EmailAccess>0)  //we now need to add this to the attachments
											APPEND TO ARRAY:C911(WS_at_AttachmentsPath; $_t_DocumentPathname)
											APPEND TO ARRAY:C911(WS_at_Attachments; FileNamefromPath($_t_DocumentPathname))
											APPEND TO ARRAY:C911(WS_al_EmailID; 0)
											APPEND TO ARRAY:C911(SD3_at_DocDiaryCode; "")
										End if 
										Letter_Alloc([DOCUMENTS:7]Document_Code:1)
										MailP_let_MakeEmail($_l_EmailAccess; True:C214; $_t_From)
										vFrom:=$_t_From
										If (rState=2)
											LOAD RECORD:C52([INVOICES:39])
											[INVOICES:39]Credit_Stage:22:=[CREDIT_STAGES:54]Next_Stage:6
											DB_SaveRecord(->[INVOICES:39])
										Else 
											FIRST RECORD:C50([INVOICES:39])
											While (Not:C34(End selection:C36([INVOICES:39])))
												[INVOICES:39]Credit_Stage:22:=[CREDIT_STAGES:54]Next_Stage:6
												DB_SaveRecord(->[INVOICES:39])
												NEXT RECORD:C51([INVOICES:39])
											End while 
										End if 
									Else 
										//here we need to load a copy of the document
										//MMLetterRef
										If (MMLetterRef="")
											//first record
											If ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template) | ([DOCUMENTS:7]Document_Class:14=0)
												DUPLICATE RECORD:C225([DOCUMENTS:7])
												Let_No("M")
												Set_DocumentCode(2; "M"; DOC_t_DocumentCode)  //we have a copy of the document now
												[DOCUMENTS:7]Standard:9:=False:C215
												[DOCUMENTS:7]Document_Status:15:=0
												[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
												DB_SaveRecord(->[DOCUMENTS:7])
											End if 
											MMLetterRef:=[DOCUMENTS:7]Document_Code:1
											
										Else 
											QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=MMLetterRef)
										End if 
										Letter_AllDets(True:C214)
										$_t_DocumentPathname:=MailP_Let_namepdf($_l_EmailAccess; DOC_NAME)
										Letter_Print([DOCUMENTS:7]Document_Code:1; $_l_EmailAccess; DOC_NAME)
										If ($_l_EmailAccess>0)  //we now need to add this to the attachments
											INSERT IN ARRAY:C227(WS_at_Attachments; Size of array:C274(WS_at_Attachments)+1; 1)
											INSERT IN ARRAY:C227(WS_at_AttachmentsPath; Size of array:C274(WS_at_AttachmentsPath)+1; 1)
											INSERT IN ARRAY:C227(WS_al_EmailID; Size of array:C274(WS_al_EmailID)+1; 1)
											INSERT IN ARRAY:C227(SD3_at_DocDiaryCode; Size of array:C274(SD3_at_DocDiaryCode)+1; 1)
											WS_at_AttachmentsPath{Size of array:C274(WS_at_AttachmentsPath)}:=$_t_DocumentPathname
											WS_at_Attachments{Size of array:C274(WS_at_Attachments)}:=FileNamefromPath($_t_DocumentPathname)
											WS_al_EmailID{Size of array:C274(WS_al_EmailID)}:=0
											SD3_at_DocDiaryCode{Size of array:C274(SD3_at_DocDiaryCode)}:=""
										End if 
										Letter_Alloc([DOCUMENTS:7]Document_Code:1)
										MailP_let_MakeEmail($_l_EmailAccess; True:C214; VFrom)
										
								End case 
								USE NAMED SELECTION:C332("Selection_Current")
								GOTO SELECTED RECORD:C245($_ptr_CurrentTable->; $_l_RecordNumber)
								$_l_RecordNumber:=$_l_RecordNumber+1
								NEXT RECORD:C51($_ptr_CurrentTable->)
								Mail_MSRec
							Else 
								LAST RECORD:C200($_ptr_CurrentTable->)
								NEXT RECORD:C51($_ptr_CurrentTable->)
							End if 
						End while 
					End if 
				End if 
			End if 
		End if 
		//the merged option cannot be used with the email option
		//because you cant do a 'print merge
		//you only have one print job
		
		If ((cMerged=1) & (Documents_4DWriteAccessType(False:C215)="W@") & (rDiary=0) & (rState<2))
			MailP_Ready("Are you ready to print all Merged Documents? (Settings 100% Portrait)")
			If (OK=1)
				UNLOAD RECORD:C212($1->)
				//Here we duplicate the document and make a new template.
				If (Records in selection:C76([DOCUMENTS:7])=1)
					DUPLICATE RECORD:C225([DOCUMENTS:7])
					[DOCUMENTS:7]Standard:9:=False:C215
					[DOCUMENTS:7]Document_Status:15:=0
					[DOCUMENTS:7]Document_Class:14:=-([DOCUMENTS:7]Document_Class:14)
					Let_No("M")
					Set_DocumentCode(2; "M"; DOC_t_DocumentCode)
					//we have a copy of the document now
					Letter_Merge($1)
					DB_SaveRecord(->[DOCUMENTS:7])
				End if 
				
			End if 
		End if 
		
		If (bd1=1)
			MailP_LetFax($_ptr_CurrentTable)
		End if 
	: (MMLetterClass=Text Email) | (MMLetterClass=Text Email Template)
		//here we have selected to email-the template is an email so we behave differently
		//MMLetterCode is already =vletterCode
		If (MMEmailCode#[DOCUMENTS:7]Document_Code:1)  //
			//the wrong document is current
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=MMLetterCode)
		End if 
		If (MMLetterCode#"")
			MMLetterClass:=4D Write Letter Template
			MailP Let($1)
			//just recall the code-merge from the letter
		Else 
			
			//no letter so build the list of recipients
			If (MMEmailCode#"")
				//an Email Template is selected-so use that for the email
			Else 
				//$TableCurrent:=Current default table
				Letters_In("3")
				//DEFAULT TABLE($tableCurrent->)
				MMEmailCode:=VletterCode
			End if 
			
			
			DOCLOADED:=False:C215
			DOCLOADED2:=False:C215
			ARRAY TEXT:C222(SD2_at_EmailType; 0)
			ARRAY TEXT:C222(WS_at_Attachments; 0)
			ARRAY TEXT:C222(WS_at_AttachmentsPath; 0)
			ARRAY TEXT:C222(SD2_at_EmailAddresses; 0)
			ARRAY TEXT:C222(SD2_at_EmailName; 0)
			ARRAY TEXT:C222(SD2_at_ContactIDs; 0)
			
			ARRAY TEXT:C222(WT_at_EMailRecipients; 0)
			
			PrintCount:=0
			Check_Pages
			If (OK=1)
				//Because we may swap selections in  here now
				COPY NAMED SELECTION:C331($_ptr_CurrentTable->; "Selection_Current")
				CREATE EMPTY SET:C140([DIARY:12]; "MailSet")
				FIRST RECORD:C50($_ptr_CurrentTable->)
				$_l_RecordNumber:=1
				Mail_MSRec
				
				While ((Not:C34(End selection:C36($_ptr_CurrentTable->))) & (OK=1) & (<>SYS_l_CancelProcess#Current process:C322))
					USE NAMED SELECTION:C332("Selection_Current")
					If ($_l_RecordNumber<=Records in selection:C76($_ptr_CurrentTable->))
						GOTO SELECTED RECORD:C245($_l_RecordNumber)
						If (Table:C252($_ptr_CurrentTable)=Table:C252(->[ORDER_ITEMS:25]))
							QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[ORDERS:24]Company_Code:1)
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[ORDERS:24]Contact_Code:2)
							
						End if 
						
						
						Case of 
							: (rDiary=1)  //printing from the diary-so loop is diary
								[DIARY:12]Action_Code:9:=<>eLetAct
								If (<>eLetAct="")
									[DIARY:12]Action_Code:9:="Email"
								End if 
								
								[DIARY:12]Action_Details:10:="Sending Email"
								[DIARY:12]Email_From:38:=GetEmailSender
								DOCLOADED2:=Letter_LoadD(DOCLOADED2; ->MMeMailCode)
								[DIARY:12]Document_Code:15:=MMeMAILCode
								If ([DIARY:12]Email_Subject:40="")  //bsw 6/08/02
									[DIARY:12]Email_Subject:40:=[DOCUMENTS:7]Heading:2
								End if 
								[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
								RELATE ONE:C42([DIARY:12]Company_Code:1)
								RELATE ONE:C42([DIARY:12]Contact_Code:2)
								MCont_Add("")  //GET THE Contact_Details
								vContName:=CON_BuildContactNameandJobTitle
								//no need to create diary items
								[DIARY:12]Email_From:38:=GetEmailSender
								[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
								If ([CONTACTS:1]Contact_Code:2#[DIARY:12]Contact_Code:2)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
								End if 
								If ([CONTACTS:1]Email_Before_At:30#"") & ([CONTACTS:1]EMail_After_At:24#"")
									If (WS_l_bd6=0)
										EMAIL_t_EmailTo:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
									Else 
										EMAIL_t_EmailTo:="nigel.greenlee@workstation.co.uk"  //big email test
									End if 
								Else 
									EMAIL_t_EmailTo:=""
									Repeat 
										$_t_Request:=Request:C163("Please enter eMail address for "+vContName; "")
										$_l_OK:=OK
									Until (OK=0) | ($_t_Request#"")
									If ($_l_OK=1)
										EMAIL_t_EmailTo:=$_t_Request
									End if 
								End if 
								If (EMAIL_t_EmailTo#"")
									$_l_EmailAddressRow:=Find in array:C230(SD2_at_EmailAddresses; EMAIL_t_EmailTo)
									If ($_l_EmailAddressRow<0)
										INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
										INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
										INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
										INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
										If (WS_l_bd5=0)
											SD2_at_EmailType{Size of array:C274(SD2_at_EmailType)}:="To"
										Else 
											SD2_at_EmailType{Size of array:C274(SD2_at_EmailType)}:="Bcc"
										End if 
										SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}:=EMAIL_t_EmailTo
										SD2_at_ContactIDs{Size of array:C274(SD2_at_ContactIDs)}:=[DIARY:12]Contact_Code:2
										SD2_at_EmailName{Size of array:C274(SD2_at_EmailName)}:=vContName
									End if 
									CREATE RECORD:C68([EMAIL_RECIPIENTS:104])
									[EMAIL_RECIPIENTS:104]DiaryID:1:=[DIARY:12]Diary_Code:3
									[EMAIL_RECIPIENTS:104]Email_Address:3:=EMAIL_t_EmailTo
									[EMAIL_RECIPIENTS:104]Classification:2:="To"
									[EMAIL_RECIPIENTS:104]ContactID:4:=[CONTACTS:1]Contact_Code:2
									[EMAIL_RECIPIENTS:104]Person_ID:6:=[CONTACTS:1]x_ID:33
									
									DB_SaveRecord(->[EMAIL_RECIPIENTS:104])
									UNLOAD RECORD:C212([EMAIL_RECIPIENTS:104])
									READ ONLY:C145([EMAIL_RECIPIENTS:104])
									//READ WRITE([EMAIL_ATTACHMENTS])
									// If (Size of array(WS_at_Attachments)>0)
									//  REDUCE SELECTION([EMAIL_ATTACHMENTS];0)
									//`  ARRAY TO SELECTION(WS_at_Attachments;[EMAIL_ATTACHMENTS]Attachment_Name;WS_T
									// DB_LockFile(->[EMAIL_ATTACHMENTS])
									// APPLY TO SELECTION([EMAIL_ATTACHMENTS];[EMAIL_ATTACHMENTS]DiaryID:=[DIARY]Email
									
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
									// End if
									//UNLOAD RECORD([EMAIL_ATTACHMENTS])
									// READ ONLY([EMAIL_ATTACHMENTS])
								End if 
								DB_SaveRecord(->[DIARY:12])
								AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
								If ($_l_RecordNumber>Records in selection:C76([DIARY:12]))  //last record
									USE NAMED SELECTION:C332("Selection_Current")
									CREATE SET:C116([DIARY:12]; "MailSet")
									MailP_Let_GroupedEmail(Size of array:C274(WS_at_AttachmentsPath))
								End if 
								
							: (rState>1)
								//printing from somewhere else
								//so we can just create one diary entry with many recipients
								MState_CalcRel  //kmw, 04/07/08 - if user selects "multiple" after selecting "other" there was no invoice loaded so no value in [invoices]credit stage so also needed to do this (as well as moving relate to before "MState_Calc2")
								RELATE ONE:C42([INVOICES:39]Credit_Stage:22)  //kmw, 04/07/08 - moved from after call to "MState_Calc2" to before call to "MState_Calc2" ("MState_Calc2" creates a selection of invocies but goes past the end of that selection meanining no calue in [invoices]credit stage).
								MState_Calc2
								//RELATE ONE([INVOICES]Credit Stage)``kmw, 04/07/08 - moved from after call to "MState_Calc2" to before call to "MState_Calc2" ("MState_Calc2" creates a selection of invocies but goes past the end of that selection meanining no calue in [invoices]credit stage).
								
								vOurRef:=[COMPANIES:2]Company_Code:1+"-"+[CONTACTS:1]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
								MCont_Add("")
								vContName:=CON_BuildContactNameandJobTitle
								If ([CONTACTS:1]Email_Before_At:30#"") & ([CONTACTS:1]EMail_After_At:24#"")
									If (WS_l_bd6=0)
										EMAIL_t_EmailTo:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
									Else 
										EMAIL_t_EmailTo:="nigel.greenlee@workstation.co.uk"  //big email test
									End if 
								Else 
									EMAIL_t_EmailTo:=""
									Repeat 
										$_t_Request:=Request:C163("Please enter eMail address for "+vContName; "")
										$_l_OK:=OK
									Until (OK=0) | ($_t_Request#"")
									If ($_l_OK=1)
										EMAIL_t_EmailTo:=$_t_Request
									End if 
								End if 
								If (EMAIL_t_EmailTo#"")
									$_l_EmailAddressRow:=Find in array:C230(SD2_at_EmailAddresses; EMAIL_t_EmailTo)
									If ($_l_EmailAddressRow<0)
										INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
										INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
										INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
										INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
										If (WS_l_bd5=0)
											SD2_at_EmailType{Size of array:C274(SD2_at_EmailType)}:="To"
										Else 
											SD2_at_EmailType{Size of array:C274(SD2_at_EmailType)}:="Bcc"
										End if 
										SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}:=EMAIL_t_EmailTo
										SD2_at_ContactIDs{Size of array:C274(SD2_at_ContactIDs)}:=[DIARY:12]Contact_Code:2
										SD2_at_EmailName{Size of array:C274(SD2_at_EmailName)}:=vContName
									End if 
								End if 
								QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=VFrom)
								$_t_Initials:=[PERSONNEL:11]Initials:1
								If (EMAIL_t_EmailTo#"")
									//we are not looping through the diary
									//we must create a diary record relating to the contact for the invoice
									CREATE RECORD:C68([DIARY:12])
									[DIARY:12]Company_Code:1:=[CONTACTS:1]Company_Code:1
									[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
									Diary_Code
									[DIARY:12]Date_Do_From:4:=<>DB_d_CurrentDate
									[DIARY:12]Originator:23:=<>PER_t_CurrentUserInitials
									[DIARY:12]Person:8:=$_t_Initials
									[DIARY:12]Status:30:=[COMPANIES:2]Status:12
									[DIARY:12]Action_Code:9:=<>eLetAct
									If (<>eLetAct="")
										[DIARY:12]Action_Code:9:="Email"
									End if 
									
									[DIARY:12]Action_Details:10:="Sending Email"
									[DIARY:12]Email_From:38:=GetEmailSender
									DOCLOADED2:=Letter_LoadD(DOCLOADED2; ->MMeMailCode)
									[DIARY:12]Document_Code:15:=MMeMAILCode
									If ([DIARY:12]Email_Subject:40="")  //bsw 6/08/02
										[DIARY:12]Email_Subject:40:=[DOCUMENTS:7]Heading:2  //BSW 6/08/02
									End if 
									[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
									If (WS_l_bd5=1)
										EMAIL_t_EmailType:="Bcc"
									Else 
										
										EMAIL_t_EmailType:="To"
									End if 
									
									If ([DIARY:12]Person:8#<>PER_t_CurrentUserInitials)
										RELATE ONE:C42([DIARY:12]Person:8)
										[DIARY:12]Email_Person:39:=[PERSONNEL:11]Name:2
									Else 
										[DIARY:12]Email_Person:39:=[DIARY:12]Person:8
									End if 
									DB_SaveRecord(->[DIARY:12])
									AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
									ADD TO SET:C119([DIARY:12]; "MailSet")
									$_l_EmailAddressRow:=Find in array:C230(SD2_at_EmailAddresses; EMAIL_t_EmailTo)
									READ WRITE:C146([EMAIL_RECIPIENTS:104])
									CREATE RECORD:C68([EMAIL_RECIPIENTS:104])
									[EMAIL_RECIPIENTS:104]DiaryID:1:=[DIARY:12]Diary_Code:3
									[EMAIL_RECIPIENTS:104]Email_Address:3:=EMAIL_t_EmailTo
									[EMAIL_RECIPIENTS:104]Classification:2:="To"
									[EMAIL_RECIPIENTS:104]ContactID:4:=[CONTACTS:1]Contact_Code:2
									DB_SaveRecord(->[EMAIL_RECIPIENTS:104])
									UNLOAD RECORD:C212([EMAIL_RECIPIENTS:104])
									//  READ ONLY([EMAIL_RECEIPIENTS])
									//  READ WRITE([EMAIL_ATTACHMENTS])
									//  If (Size of array(WS_at_Attachments)>0)
									//   REDUCE SELECTION([EMAIL_ATTACHMENTS];0)
									//   ARRAY TO SELECTION(WS_at_Attachments;[EMAIL_ATTACHMENTS]Attachment_Name;WS_T
									//    DB_LockFile(->[EMAIL_ATTACHMENTS])
									//  APPLY TO SELECTION([EMAIL_ATTACHMENTS];[EMAIL_ATTACHMENTS]DiaryID:=[DIARY]Emai
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
									// End if
									// UNLOAD RECORD([EMAIL_ATTACHMENTS])
									// READ ONLY([EMAIL_ATTACHMENTS])
								End if 
								DB_SaveRecord(->[DIARY:12])
								AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
								If ($_l_RecordNumber>Records in selection:C76($_ptr_CurrentTable->))  //last record
									MailP_Let_GroupedEmail(Size of array:C274(WS_at_AttachmentsPath))
								End if 
								vFrom:=$_t_From
								If (rState=2)
									LOAD RECORD:C52([INVOICES:39])
									[INVOICES:39]Credit_Stage:22:=[CREDIT_STAGES:54]Next_Stage:6
									DB_SaveRecord(->[INVOICES:39])
								Else 
									FIRST RECORD:C50([INVOICES:39])
									While (Not:C34(End selection:C36([INVOICES:39])))
										[INVOICES:39]Credit_Stage:22:=[CREDIT_STAGES:54]Next_Stage:6
										DB_SaveRecord(->[INVOICES:39])
										NEXT RECORD:C51([INVOICES:39])
									End while 
								End if 
							Else 
								If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
								End if 
								
								//
								MCont_Add("")
								vContName:=CON_BuildContactNameandJobTitle
								If ([CONTACTS:1]Email_Before_At:30#"") & ([CONTACTS:1]EMail_After_At:24#"")
									If (WS_l_bd6=0)
										EMAIL_t_EmailTo:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
									Else 
										EMAIL_t_EmailTo:="nigel.greenlee@workstation.co.uk"  //big email test
									End if 
								Else 
									EMAIL_t_EmailTo:=""
									Repeat 
										$_t_Request:=Request:C163("Please enter eMail address for "+vContName; "")
										$_l_OK:=OK
									Until (OK=0) | ($_t_Request#"")
									If ($_l_OK=1)
										EMAIL_t_EmailTo:=$_t_Request
									End if 
								End if 
								If (EMAIL_t_EmailTo#"")
									$_l_EmailAddressRow:=Find in array:C230(SD2_at_EmailAddresses; EMAIL_t_EmailTo)
									If ($_l_EmailAddressRow<0)
										INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
										INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
										INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
										INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
										If (WS_l_bd5=0)
											SD2_at_EmailType{Size of array:C274(SD2_at_EmailType)}:="To"
										Else 
											SD2_at_EmailType{Size of array:C274(SD2_at_EmailType)}:="Bcc"
										End if 
										SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}:=EMAIL_t_EmailTo
										SD2_at_ContactIDs{Size of array:C274(SD2_at_ContactIDs)}:=[DIARY:12]Contact_Code:2
										SD2_at_EmailName{Size of array:C274(SD2_at_EmailName)}:=vContName
									End if 
								End if 
								QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=VFrom)
								$_t_Initials:=[PERSONNEL:11]Initials:1
								If (EMAIL_t_EmailTo#"")
									//we are not looping through the diary
									//we must create a diary record relating to the contact for the invoice
									//If (FIRST RECORD)
									If ($_l_RecordNumber=2)
										CREATE RECORD:C68([DIARY:12])
										[DIARY:12]Company_Code:1:=[CONTACTS:1]Company_Code:1
										[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
										Diary_Code
										[DIARY:12]Date_Do_From:4:=<>DB_d_CurrentDate
										[DIARY:12]Originator:23:=<>PER_t_CurrentUserInitials
										[DIARY:12]Person:8:=$_t_Initials
										[DIARY:12]Status:30:=[COMPANIES:2]Status:12
										[DIARY:12]Action_Code:9:=<>eLetAct
										If (<>eLetAct="")
											[DIARY:12]Action_Code:9:="Email"
										End if 
										
										[DIARY:12]Action_Details:10:="Sending Email"
										[DIARY:12]Email_From:38:=GetEmailSender
										DOCLOADED2:=Letter_LoadD(DOCLOADED2; ->MMeMailCode)
										[DIARY:12]Document_Code:15:=MMeMAILCode
										If ([DIARY:12]Email_Subject:40="")
											[DIARY:12]Email_Subject:40:=[DOCUMENTS:7]Heading:2  //BSW 6/08/02
										End if 
										[DIARY:12]Email_Text:42:=[DOCUMENTS:7]Text:3
										If (WS_l_bd5=1)
											EMAIL_t_EmailType:="Bcc"
										Else 
											EMAIL_t_EmailType:="To"
										End if 
										If ([DIARY:12]Person:8#<>PER_t_CurrentUserInitials)
											RELATE ONE:C42([DIARY:12]Person:8)
											[DIARY:12]Email_Person:39:=[PERSONNEL:11]Name:2
										Else 
											[DIARY:12]Email_Person:39:=[DIARY:12]Person:8
										End if 
										DB_SaveRecord(->[DIARY:12])
										AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
										ADD TO SET:C119([DIARY:12]; "MailSet")
									Else 
										//add the contact to the email
										$_l_ID:=[CONTACTS:1]x_ID:33
										$_t_TableSTR:=String:C10(Table:C252(->[CONTACTS:1]); "0000")
										$_t_TableSTR:="1"+$_t_TableSTR+(String:C10($_l_ID; "000000000"))
										$_l_DeNormalised:=Num:C11($_t_TableSTR)
										CREATE RECORD:C68([xDiaryRelations:137])
										[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
										[xDiaryRelations:137]xRecordID:4:=[CONTACTS:1]x_ID:33
										[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[CONTACTS:1])
										[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
										[xDiaryRelations:137]X_DisplayedName:6:="Contact"
										[xDiaryRelations:137]x_RelationshipName:7:="Mail Recipient"
										
										SAVE RECORD:C53([xDiaryRelations:137])
										
									End if 
									$_l_EmailAddressRow:=Find in array:C230(SD2_at_EmailAddresses; EMAIL_t_EmailTo)
									READ WRITE:C146([EMAIL_RECIPIENTS:104])
									CREATE RECORD:C68([EMAIL_RECIPIENTS:104])
									[EMAIL_RECIPIENTS:104]DiaryID:1:=[DIARY:12]Diary_Code:3
									[EMAIL_RECIPIENTS:104]Email_Address:3:=EMAIL_t_EmailTo
									[EMAIL_RECIPIENTS:104]Classification:2:=EMAIL_t_EmailType
									[EMAIL_RECIPIENTS:104]ContactID:4:=[CONTACTS:1]Contact_Code:2
									DB_SaveRecord(->[EMAIL_RECIPIENTS:104])
									UNLOAD RECORD:C212([EMAIL_RECIPIENTS:104])
									READ ONLY:C145([EMAIL_RECIPIENTS:104])
									// READ WRITE([EMAIL_ATTACHMENTS])
									//If (Size of array(WS_at_Attachments)>0)
									//  REDUCE SELECTION([EMAIL_ATTACHMENTS];0)
									// ARRAY TO SELECTION(WS_at_Attachments;[EMAIL_ATTACHMENTS]Attachment_Name;WS_T_a
									// DB_lockFile (->[EMAIL_ATTACHMENTS])
									//APPLY TO SELECTION([EMAIL_ATTACHMENTS];[EMAIL_ATTACHMENTS]DiaryID:=[DIARY]Email_
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
									// End if
									//  UNLOAD RECORD([EMAIL_ATTACHMENTS])
									// READ ONLY([EMAIL_ATTACHMENTS])
									
								End if 
								DB_SaveRecord(->[DIARY:12])
								AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
								If ($_l_RecordNumber>Records in selection:C76($_ptr_CurrentTable->))  //last record
									MailP_Let_GroupedEmail(Size of array:C274(WS_at_AttachmentsPath))
									
								End if 
								
								
								//  End if   `end sending the email
								
						End case 
						USE NAMED SELECTION:C332("Selection_Current")
						GOTO SELECTED RECORD:C245($_l_RecordNumber)
						$_l_RecordNumber:=$_l_RecordNumber+1
					Else 
						LAST RECORD:C200($_ptr_CurrentTable->)
					End if 
					NEXT RECORD:C51($_ptr_CurrentTable->)
					Mail_MSRec
				End while 
			End if 
		End if 
End case 
If ($_l_EmailAccess>0)
	//switch printer back
	$_l_OK:=PLUGCALL_PDFs("SETPRINTER"; ->PDF_t_CURPName; ->PDF_t_CURPType; ->PDF_t_CURPZone; ->PDF_t_CURPDriver)
End if 
EMAIL_bo_MailListBuilt:=False:C215
ERR_MethodTrackerReturn("MailP Let"; $_t_oldMethodName)
