If (False:C215)
	//object Method Name: Object Name:      [DIARY].Diary_InEmail.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DOC_al_RecordNumbers;0)
	//ARRAY TEXT(<>DOC_at_EmailChoices;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	C_LONGINT:C283($_l_AtPosition; $_l_EmailPosition; $_l_EmailRow; $_l_EndHighlight; $_l_event; $_l_Index; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight)
	C_LONGINT:C283($_l_ObjectTop; $_l_RecordNumber; $_l_StartHighlight; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; DOC_l_CallEvent; EmailChoiceProc; WS_l_ContactElement; WS_l_SelectedEmailName)
	C_TEXT:C284($_t_EditedText; $_t_EmailAddress; $_t_EmailAfter; $_t_EmailBefore; $_t_EmailName; $_t_ExtractedContactFirstName; $_t_ExtractedContactLastName; $_t_ExtractedContactTitle; $_t_Keystroke; $_t_oldMethodName; EMAIL_t_EmailType)
	C_TEXT:C284(WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InEmail.Variable6"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On After Keystroke:K2:26)
		$_t_EditedText:=Get edited text:C655
		$_t_Keystroke:=Keystroke:C390
		If (Character code:C91($_t_Keystroke)#Backspace:K15:36)
			GET HIGHLIGHT:C209(WS_t_EmailAddress; $_l_StartHighlight; $_l_EndHighlight)
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
							WS_t_EmailAddress:=$_t_EmailAddress
							$_t_EmailName:=CON_BuildContactName
							$_l_EmailPosition:=Position:C15(WS_t_EmailName; $_t_EmailName)
							//I want only to append the name
							WS_t_EmailName:=Substring:C12($_t_EmailName; $_l_EmailPosition; Length:C16($_t_EmailName))
							If ([DIARY:12]Contact_Code:2="")
								[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
								Diary_InD
								MCont_Add("")
								Diary_InLLPHead
								WS_t_ContactID:=[DIARY:12]Contact_Code:2
								If (Size of array:C274(SD2_at_EmailType)=0)
									INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
									INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
									INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
									INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
								End if 
								WS_l_ContactElement:=Size of array:C274(SD2_at_EmailType)
								SD2_at_EmailType{1}:=EMAIL_t_EmailType
								SD2_at_EmailAddresses{1}:=WS_t_EmailAddress
								SD2_at_ContactIDs{1}:=WS_t_ContactID
								SD2_at_EmailName{1}:=WS_t_EmailName
							Else 
								WS_t_ContactID:=[CONTACTS:1]Contact_Code:2
							End if 
						End if 
						HIGHLIGHT TEXT:C210(WS_t_EmailAddress; $_l_EndHighlight; Length:C16(WS_t_EmailAddress)+1)
						NEXT RECORD:C51([CONTACTS:1])
					: (Records in selection:C76([CONTACTS:1])>1)
						ARRAY TEXT:C222(<>DOC_at_EmailChoices; 0)
						ARRAY LONGINT:C221(<>DOC_al_RecordNumbers; 0)
						SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Name:31; <>DOC_at_EmailChoices)
						ARRAY LONGINT:C221(<>DOC_al_RecordNumbers; Size of array:C274(<>DOC_at_EmailChoices))
						FIRST RECORD:C50([CONTACTS:1])
						For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
							<>DOC_at_EmailChoices{$_l_Index}:=<>DOC_at_EmailChoices{$_l_Index}+"  <"+Contact_Email+">"
							<>DOC_al_RecordNumbers{$_l_Index}:=Record number:C243([CONTACTS:1])
							NEXT RECORD:C51([CONTACTS:1])
						End for 
						
						If (EmailChoiceProc=0)
							GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
							OBJECT GET COORDINATES:C663(WS_t_EmailName; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
							OBJECT GET COORDINATES:C663(WS_t_EmailAddress; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom2)
							EmailChoiceProc:=New process:C317("DOC_EmailChoices"; DB_ProcessMemoryinit(1); "EmailNames"; $_l_WindowLeft+$_l_ObjectLeft; $_l_WindowTop+$_l_ObjectBottom; $_l_WindowLeft+$_l_ObjectRight; Current process:C322)
							WS_KeepFocus
						Else 
							POST OUTSIDE CALL:C329(EmailChoiceProc)
						End if 
						GOTO OBJECT:C206(Self:C308->)
				End case 
				
			End if 
			
		End if 
	: ($_l_event=On Losing Focus:K2:8) | ($_l_event=On Data Change:K2:15)
		If (EmailChoiceProc>0)
			DOC_l_CallEvent:=1
			SET PROCESS VARIABLE:C370(EmailChoiceProc; DOC_l_CallEvent; DOC_l_CallEvent)
			POST OUTSIDE CALL:C329(EmailChoiceProc)
			
		End if 
		If (WS_t_EmailAddress#"")
			If (WS_l_SelectedEmailName=0)
				GOTO OBJECT:C206([DIARY:12]Email_Subject:40)
				$_l_EmailRow:=Find in array:C230(SD2_at_EmailAddresses; WS_t_EmailAddress)
				If ($_l_EmailRow<0)
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
					If (Size of array:C274(SD2_at_ContactIDs)>1)
						WS_l_SelectedEmailName:=0
						EMAIL_t_EmailType:=""
						WS_t_EmailAddress:=""
						WS_t_ContactID:=""
						WS_t_EmailName:=""
					End if 
					
				Else 
					SD2_at_EmailType{WS_l_SelectedEmailName}:=EMAIL_t_EmailType
					SD2_at_EmailAddresses{WS_l_SelectedEmailName}:=WS_t_EmailAddress
					SD2_at_ContactIDs{WS_l_SelectedEmailName}:=WS_t_ContactID
					SD2_at_EmailName{WS_l_SelectedEmailName}:=WS_t_EmailName
					If (Size of array:C274(SD2_at_ContactIDs)>1)
						WS_l_SelectedEmailName:=0
						EMAIL_t_EmailType:=""
						WS_t_EmailAddress:=""
						WS_t_ContactID:=""
						WS_t_EmailName:=""
					End if 
					
				End if 
				SETEMAILFORMOBJECTS
			End if 
			
			
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InEmail.Variable6"; $_t_oldMethodName)
