If (False:C215)
	//object Name: [COMPANIES]dRequest_SMSText.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(AA_at_ProffesionallAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefix;0)
	C_BOOLEAN:C305(EMAIL_bo_MailListBuilt)
	C_LONGINT:C283($_l_CharacterPosition; $_l_EndHighlight; $_l_event; $_l_RecordNumber; $_l_SalutationRow; $_l_StartHighlight)
	C_TEXT:C284($_t_EditedText; $_t_EmailName; $_t_ExtractedContactFirstName; $_t_ExtractedContactLastName; $_t_ExtractedContactTitle; $_t_Keystroke; $_t_oldMethodName; WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRequest_SMSText.Variable6"; Form event code:C388)
If (Not:C34(EMAIL_bo_MailListBuilt))
	$_l_event:=Form event code:C388
	Case of 
		: ($_l_event=On After Keystroke:K2:26)
			$_t_EditedText:=Get edited text:C655
			$_t_Keystroke:=Keystroke:C390
			If (Character code:C91($_t_Keystroke)#Backspace:K15:36)
				If (Length:C16($_t_EditedText)<2)
					WS_t_EmailAddress:=""  // 21/01/03 pb
				End if 
				AA_ParseName($_t_EditedText; 0; ->$_t_ExtractedContactTitle; ->$_t_ExtractedContactFirstName; ->$_t_ExtractedContactLastName; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
				If ($_t_ExtractedContactTitle#"")
					//to ensure capitalization is correct
					$_l_SalutationRow:=Find in array:C230(AA_at_Salutations; $_t_ExtractedContactTitle)
					If ($_l_SalutationRow>0)
						$_t_ExtractedContactTitle:=AA_at_Salutations{$_l_SalutationRow}
					End if 
				End if 
				GET HIGHLIGHT:C209(WS_t_EmailName; $_l_StartHighlight; $_l_EndHighlight)
				
				If ($_t_ExtractedContactFirstName#"") & ($_t_ExtractedContactLastName#"")
					$_l_RecordNumber:=Record number:C243([CONTACTS:1])
					MESSAGES OFF:C175
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_ExtractedContactFirstName; *)
					If ($_t_ExtractedContactLastName#"")
						QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_ExtractedContactLastName+"@")
					Else 
						QUERY:C277([CONTACTS:1])
					End if 
					MESSAGES ON:C181
					If (Records in selection:C76([CONTACTS:1])>=1)
						FIRST RECORD:C50([CONTACTS:1])
						Repeat 
							If ([CONTACTS:1]Mobile:12#"")
								WS_t_EmailAddress:=SMS_IntlPhoneNumber(->[CONTACTS:1]Mobile:12)
								$_t_EmailName:=CON_BuildContactName
								$_l_CharacterPosition:=Position:C15($_t_EditedText; $_t_EmailName; *)
								
								//I want only to append the name
								WS_t_EmailName:=Substring:C12($_t_EmailName; $_l_CharacterPosition; Length:C16($_t_EmailName))
								WS_t_ContactID:=[CONTACTS:1]Contact_Code:2
							End if 
							HIGHLIGHT TEXT:C210(WS_t_EmailName; $_l_EndHighlight; Length:C16(WS_t_EmailName)+1)
							NEXT RECORD:C51([CONTACTS:1])
						Until (WS_t_EmailAddress#"") | (End selection:C36([CONTACTS:1]))
						REDUCE SELECTION:C351([CONTACTS:1]; 0)
					Else 
						WS_t_EmailAddress:=""  // 21/01/03 pb
					End if 
				End if 
			End if 
	End case 
	
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRequest_SMSText.Variable6"; $_t_oldMethodName)
