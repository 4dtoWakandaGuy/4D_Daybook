If (False:C215)
	//object Method Name: Object Name:      [DIARY].Diary_InDocument.olbMailsReciptients
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_lb_Analysis;0)
	//ARRAY BOOLEAN(DIA_LB_MailRecipients;0)
	//ARRAY LONGINT(<>DOC_al_RecordNumbers;0)
	//ARRAY TEXT(<>DOC_at_EmailChoices;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	//ARRAY TEXT(AA_at_ProffesionallAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefix;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	C_LONGINT:C283($_l_AtPosition; $_l_ColumnNumber; $_l_ContactsIndex; $_l_EndHighlight; $_l_event; $_l_FieldNumber; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight)
	C_LONGINT:C283($_l_ObjectTop; $_l_RecordNumber; $_l_Row; $_l_SalutionRow; $_l_StartHighlight; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; EmailChoiceProc)
	C_LONGINT:C283(WS_l_ContactElement)
	C_TEXT:C284($_t_EditedText; $_t_EmailAddress; $_t_EmailAfter; $_t_EmailBefore; $_t_EmailName; $_t_ExtractedContactFirstName; $_t_ExtractedContactLastName; $_t_ExtractedContactTitle; $_t_Keystroke; $_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InDocument.olbMailsReciptients"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Losing Focus:K2:8)
		
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->ACC_lb_Analysis; $_t_VariableName)
	: ($_l_event=On After Keystroke:K2:26)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->ACC_lb_Analysis; $_t_VariableName)
		Case of 
			: ($_l_ColumnNumber=2)
				$_t_EditedText:=Get edited text:C655
				$_t_Keystroke:=Keystroke:C390
				If (Character code:C91($_t_Keystroke)#Backspace:K15:36)
					AA_ParseName($_t_EditedText; 0; ->$_t_ExtractedContactTitle; ->$_t_ExtractedContactFirstName; ->$_t_ExtractedContactLastName; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
					If ($_t_ExtractedContactTitle#"")
						//to ensure capitalization is correct
						$_l_SalutionRow:=Find in array:C230(AA_at_Salutations; $_t_ExtractedContactTitle)
						If ($_l_SalutionRow>0)
							$_t_ExtractedContactTitle:=AA_at_Salutations{$_l_SalutionRow}
						End if 
					End if 
					//`````````
					GET HIGHLIGHT:C209(SD2_at_EmailName{$_l_Row}; $_l_StartHighlight; $_l_EndHighlight)
					
					
					
					
					//WS_t_EmailName:=Cont Name ($_t_ExtractedContactTitle;$_t_ExtractedContactFirstName;$_t_ExtractedContactLastName)
					If ($_t_ExtractedContactFirstName#"") & ($_t_ExtractedContactLastName#"")
						$_l_RecordNumber:=Record number:C243([CONTACTS:1])
						MESSAGES OFF:C175
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_ExtractedContactFirstName; *)
						If ($_t_ExtractedContactLastName#"")
							QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_ExtractedContactLastName+"@")
						Else 
							QUERY:C277([CONTACTS:1])
						End if 
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Email_Before_At:30#"")
						If ([DIARY:12]Contact_Code:2="")
							If ([DIARY:12]Company_Code:1#"")
								SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
								QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[DIARY:12]Company_Code:1)
								CREATE SET:C116([CONTACTS:1]; "$Set1")
								QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
								
								QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[DIARY:12]Company_Code:1; *)
								QUERY SELECTION:C341([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
								
								SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
								QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
								CREATE SET:C116([CONTACTS:1]; "$Set2")
								UNION:C120("$set1"; "$Set2"; "$Set1")
								USE SET:C118("$Set1")
							End if 
						End if 
						MESSAGES ON:C181
						Case of 
							: (Records in selection:C76([CONTACTS:1])=1)
								
								$_t_EmailAddress:=Contact_Email
								If ($_t_EmailAddress#"")
									SD2_at_EmailAddresses{$_l_Row}:=$_t_EmailAddress
									$_t_EmailName:=CON_BuildContactName
									$_l_AtPosition:=Position:C15($_t_EditedText; $_t_EmailName)
									//I want only to append the name
									SD2_at_EmailName{$_l_Row}:=Substring:C12($_t_EmailName; $_l_AtPosition; Length:C16($_t_EmailName))
									If ([DIARY:12]Contact_Code:2="")
										[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
										Diary_InD
										MCont_Add("")
										Diary_InLLPHead
										SD2_at_ContactIDs{$_l_Row}:=[DIARY:12]Contact_Code:2
										//``
										
										WS_l_ContactElement:=$_l_Row
										
										
										//````
										
									Else 
										SD2_at_ContactIDs{$_l_Row}:=[CONTACTS:1]Contact_Code:2
									End if 
								End if 
								HIGHLIGHT TEXT:C210(SD2_at_EmailName{$_l_Row}; $_l_EndHighlight; Length:C16(SD2_at_EmailName{$_l_Row})+1)
								NEXT RECORD:C51([CONTACTS:1])
							: (Records in selection:C76([CONTACTS:1])>0)
								ARRAY TEXT:C222(<>DOC_at_EmailChoices; 0)
								ARRAY LONGINT:C221(<>DOC_al_RecordNumbers; 0)
								SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Name:31; <>DOC_at_EmailChoices)
								ARRAY LONGINT:C221(<>DOC_al_RecordNumbers; Size of array:C274(<>DOC_at_EmailChoices))
								FIRST RECORD:C50([CONTACTS:1])
								For ($_l_ContactsIndex; 1; Records in selection:C76([CONTACTS:1]))
									<>DOC_at_EmailChoices{$_l_ContactsIndex}:=<>DOC_at_EmailChoices{$_l_ContactsIndex}+"  <"+Contact_Email+">"
									<>DOC_al_RecordNumbers{$_l_ContactsIndex}:=Record number:C243([CONTACTS:1])
									NEXT RECORD:C51([CONTACTS:1])
								End for 
								If (EmailChoiceProc=0)
									GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
									OBJECT GET COORDINATES:C663(DIA_LB_MailRecipients; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
									EmailChoiceProc:=New process:C317("DOC_EmailChoices"; DB_ProcessMemoryinit(1); "EmailNames"; $_l_WindowLeft+$_l_ObjectLeft; $_l_WindowTop+$_l_ObjectBottom; $_l_WindowLeft+$_l_ObjectRight; Current process:C322)
									WS_KeepFocus
								Else 
									POST OUTSIDE CALL:C329(EmailChoiceProc)
								End if 
								GOTO OBJECT:C206(Self:C308->)
						End case 
						
					End if 
					// WS_KEEPFOCUS
				End if 
			: ($_l_ColumnNumber=3)
				$_t_EditedText:=Get edited text:C655
				$_t_Keystroke:=Keystroke:C390
				If (Character code:C91($_t_Keystroke)#Backspace:K15:36)
					GET HIGHLIGHT:C209(SD2_at_EmailAddresses{$_l_Row}; $_l_StartHighlight; $_l_EndHighlight)
					$_l_AtPosition:=Position:C15(Char:C90(64); $_t_EditedText)
					If ($_l_AtPosition>0)  // dont search till after the @ is typed!
						$_t_EmailBefore:=Substring:C12($_t_EditedText; 1; $_l_AtPosition-1)
						$_t_EmailAfter:=Substring:C12($_t_EditedText; $_l_AtPosition+1; Length:C16($_t_EditedText))
						$_l_RecordNumber:=Record number:C243([CONTACTS:1])
						MESSAGES OFF:C175
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Email_Before_At:30=$_t_EmailBefore; *)
						If ($_t_EmailAfter#"")
							QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]EMail_After_At:24=$_t_EmailAfter+"@")
						Else 
							QUERY:C277([CONTACTS:1])
						End if 
						MESSAGES ON:C181
						Case of 
							: (Records in selection:C76([CONTACTS:1])=1)
								$_t_EmailAddress:=Contact_Email
								If ($_t_EmailAddress#"")
									SD2_at_EmailAddresses{$_l_Row}:=$_t_EmailAddress
									$_t_EmailName:=CON_BuildContactName
									$_l_AtPosition:=Position:C15(SD2_at_EmailName{$_l_Row}; $_t_EmailName)
									//I want only to append the name
									SD2_at_EmailName{$_l_Row}:=Substring:C12($_t_EmailName; $_l_AtPosition; Length:C16($_t_EmailName))
									If ([DIARY:12]Contact_Code:2="")
										[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
										Diary_InD
										MCont_Add("")
										Diary_InLLPHead
										SD2_at_ContactIDs{$_l_Row}:=[DIARY:12]Contact_Code:2
										
										WS_l_ContactElement:=$_l_Row
										
										
										
										
									Else 
										SD2_at_ContactIDs{$_l_Row}:=[CONTACTS:1]Contact_Code:2
									End if 
								End if 
								HIGHLIGHT TEXT:C210(SD2_at_EmailAddresses{$_l_Row}; $_l_EndHighlight; Length:C16(SD2_at_EmailAddresses{$_l_Row})+1)
								NEXT RECORD:C51([CONTACTS:1])
							: (Records in selection:C76([CONTACTS:1])>1)
								ARRAY TEXT:C222(<>DOC_at_EmailChoices; 0)
								ARRAY LONGINT:C221(<>DOC_al_RecordNumbers; 0)
								SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Name:31; <>DOC_at_EmailChoices)
								ARRAY LONGINT:C221(<>DOC_al_RecordNumbers; Size of array:C274(<>DOC_at_EmailChoices))
								FIRST RECORD:C50([CONTACTS:1])
								For ($_l_ContactsIndex; 1; Records in selection:C76([CONTACTS:1]))
									<>DOC_at_EmailChoices{$_l_ContactsIndex}:=<>DOC_at_EmailChoices{$_l_ContactsIndex}+"  <"+Contact_Email+">"
									<>DOC_al_RecordNumbers{$_l_ContactsIndex}:=Record number:C243([CONTACTS:1])
									NEXT RECORD:C51([CONTACTS:1])
								End for 
								
								If (EmailChoiceProc=0)
									GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
									OBJECT GET COORDINATES:C663(DIA_LB_MailRecipients; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
									EmailChoiceProc:=New process:C317("DOC_EmailChoices"; DB_ProcessMemoryinit(1); "EmailNames"; $_l_WindowLeft+$_l_ObjectLeft; $_l_WindowTop+$_l_ObjectBottom; $_l_WindowLeft+$_l_ObjectRight; Current process:C322)
									WS_KeepFocus
								Else 
									POST OUTSIDE CALL:C329(EmailChoiceProc)
								End if 
								GOTO OBJECT:C206(Self:C308->)
						End case 
						
					End if 
					
				End if 
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InDocument.olbMailsReciptients"; $_t_oldMethodName)
