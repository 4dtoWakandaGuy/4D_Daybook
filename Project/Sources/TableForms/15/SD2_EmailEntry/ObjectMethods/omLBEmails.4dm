If (False:C215)
	//object Name: [USER]SD2_EmailEntry.omLBEmails1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DOC_lb_Recipients;0)
	//ARRAY LONGINT(SD2_al_InviteeClass;0)
	//ARRAY LONGINT(SD2_al_InviteeStatus;0)
	//ARRAY LONGINT(SD2_al_InviteStati;0)
	//ARRAY LONGINT(SD2_al_RecordID;0)
	//ARRAY LONGINT(SD2_al_SentStatus;0)
	//ARRAY LONGINT(WS_al_PersonID;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(SD2_at_inviteeClass;0)
	//ARRAY TEXT(SD2_at_InviteeEmailAddress;0)
	//ARRAY TEXT(SD2_at_InviteeEmailOption;0)
	//ARRAY TEXT(SD2_at_Invitees;0)
	//ARRAY TEXT(SD2_at_InviteeStatus;0)
	//ARRAY TEXT(SD2_at_InviteStati;0)
	//ARRAY TEXT(WS_at_EmailComb;0)
	//ARRAY TEXT(WS_at_EmailSentStatus;0)
	C_LONGINT:C283($_l_ArraySize; $_l_AtPosition; $_l_CharacterPosition; $_l_ContactsProcess; $_l_CurrentWinRefOLD; $_l_event; $_l_Index; $_l_Retries; $_l_SelectedRow; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRIght; $_l_WindowTop; DOC_l_CallEvent; DOC_l_ContactIDreturn; SD_l_InviteeContext; SD2_l_EditID; SD2_l_EmailChoiceProc; SD2_l_InviteeMode; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_Name; $_t_oldMethodName; DOC_t_ContactCodeReturn; DOC_t_ContactNameReturn)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_EmailEntry.omLBEmails1"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		If ([DIARY:12]Email_ID:41<=0)
			$_l_SelectedRow:=LB_GetRow(->DOC_lb_Recipients)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
			If ($_l_SelectedRow=0)
				SD2_l_InviteeMode:=1
			Else 
				SD2_l_InviteeMode:=2
			End if 
			SD_l_InviteeContext:=1  //Email
			
			ARRAY TEXT:C222(SD2_at_InviteStati; 2)
			ARRAY LONGINT:C221(SD2_al_InviteStati; 2)
			SD2_al_InviteStati{1}:=0
			SD2_at_InviteStati{1}:="Not Sent"
			SD2_al_InviteStati{2}:=1
			SD2_at_InviteStati{2}:="Sent"
			
			//unlike inviteees there are only 2 status here
			ARRAY TEXT:C222(SD2_at_InviteeEmailAddress; 0)
			ARRAY TEXT:C222(SD2_at_Invitees; 0)
			ARRAY TEXT:C222(SD2_at_InviteeStatus; 0)
			ARRAY LONGINT:C221(SD2_al_InviteeStatus; 0)
			ARRAY LONGINT:C221(SD2_al_InviteeClass; 0)
			ARRAY TEXT:C222(SD2_at_inviteeClass; 0)
			ARRAY LONGINT:C221(SD2_al_RecordID; 0)
			ARRAY TEXT:C222(SD2_at_InviteeEmailOption; 0)
			For ($_l_Index; 1; Size of array:C274(SD2_at_ContactIDs))
				APPEND TO ARRAY:C911(SD2_at_InviteeEmailOption; SD2_at_EmailType{$_l_Index})
				APPEND TO ARRAY:C911(SD2_at_InviteeEmailAddress; SD2_at_EmailAddresses{$_l_Index})
				APPEND TO ARRAY:C911(SD2_at_Invitees; SD2_at_EmailName{$_l_Index})
				If (SD2_al_SentStatus{$_l_Index}=0) & ([DIARY:12]Email_ID:41>0)
					SD2_al_SentStatus{$_l_Index}:=1
				End if 
				If (SD2_al_SentStatus{$_l_Index}>=0)
					APPEND TO ARRAY:C911(SD2_al_InviteeStatus; SD2_al_SentStatus{$_l_Index})
					APPEND TO ARRAY:C911(SD2_at_InviteeStatus; SD2_at_InviteStati{Find in array:C230(SD2_al_InviteStati; SD2_al_SentStatus{$_l_Index})})
					
				Else 
					APPEND TO ARRAY:C911(SD2_al_InviteeStatus; SD2_al_SentStatus{$_l_Index})
					APPEND TO ARRAY:C911(SD2_at_InviteeStatus; "Not Sent")
				End if 
				SD2_l_EditID:=0
				Case of 
					: (WS_al_PersonID{$_l_Index}=0)
						//Person ID not stored..
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactIDs{$_l_Index})
						WS_al_PersonID{$_l_Index}:=[CONTACTS:1]x_ID:33
						APPEND TO ARRAY:C911(SD2_al_InviteeClass; 1)
						APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Contact")
						APPEND TO ARRAY:C911(SD2_al_RecordID; [CONTACTS:1]x_ID:33)
						SD2_l_EditID:=WS_al_PersonID{$_l_Index}
					: (WS_al_PersonID{$_l_Index}>0)
						APPEND TO ARRAY:C911(SD2_al_InviteeClass; 1)
						APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Contact")
						APPEND TO ARRAY:C911(SD2_al_RecordID; WS_al_PersonID{$_l_Index})
						
					: (WS_al_PersonID{$_l_Index}<0)
						APPEND TO ARRAY:C911(SD2_al_InviteeClass; 2)
						APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Internal")
						APPEND TO ARRAY:C911(SD2_al_RecordID; Abs:C99(WS_al_PersonID{$_l_Index}))
						SD2_l_EditID:=Abs:C99(WS_al_PersonID{$_l_Index})
				End case 
			End for 
			//If (Macintosh ) | (False)
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			
			If (Is macOS:C1572)  //kmw 17/10/08 v631b120a  -changed to AND false (intention of the false was to disable use of this type of window because it causes issues)
				
				WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft+20; $_l_WindowTop+10; $_l_WindowRIght-50; $_l_WindowTop+10; 1984)
			Else 
				
				WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft+20; $_l_WindowTop+10; $_l_WindowRIght-50; $_l_WindowTop+10; 1984)
			End if 
			
			DIALOG:C40([USER:15]; "SD2_PersonAdd")
			If (SD2_l_EmailChoiceProc>0)  //Tell the process to end
				
				$_l_Retries:=0
				While (Semaphore:C143("$SD2NamesCall"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*$_l_Retries)
				End while 
				SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 1)
				BRING TO FRONT:C326(SD2_l_EmailChoiceProc)
				POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
				CLEAR SEMAPHORE:C144("$SD2NamesCall")
				SD2_l_EmailChoiceProc:=0
			End if 
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			//SD2_at_EmailType;->WS_at_EmailComb;->SD2_at_EmailAddresses;->SD2_at_EmailName;->SD2_at_ContactIDs;->WS_al_PersonID;->SD2_al_SentStatus
			ARRAY TEXT:C222(SD2_at_EmailType; 0)
			ARRAY TEXT:C222(SD2_at_EmailAddresses; 0)
			ARRAY TEXT:C222(SD2_at_EmailName; 0)
			ARRAY LONGINT:C221(SD2_al_SentStatus; 0)
			ARRAY TEXT:C222(WS_at_EmailSentStatus; 0)
			ARRAY TEXT:C222(SD2_at_ContactIDs; 0)
			ARRAY LONGINT:C221(WS_al_PersonID; 0)
			ARRAY TEXT:C222(WS_at_EmailComb; 0)
			For ($_l_Index; 1; Size of array:C274(SD2_at_InviteeEmailOption))
				If (SD2_al_RecordID{$_l_Index}>0)
					
					$_l_ArraySize:=Size of array:C274(SD2_at_InviteeEmailAddress)
					APPEND TO ARRAY:C911(SD2_at_EmailType; SD2_at_InviteeEmailOption{$_l_Index})
					
					
					APPEND TO ARRAY:C911(SD2_at_EmailAddresses; SD2_at_InviteeEmailAddress{$_l_Index})
					APPEND TO ARRAY:C911(SD2_at_EmailName; SD2_at_Invitees{$_l_Index})
					APPEND TO ARRAY:C911(SD2_al_SentStatus; SD2_al_InviteeStatus{$_l_Index})
					APPEND TO ARRAY:C911(WS_at_EmailSentStatus; SD2_at_InviteeStatus{$_l_Index})
					Case of 
						: (SD2_al_InviteeClass{$_l_Index}=0)  //need to modify this so it does move current record pointer
							
							If (SD2_al_RecordID{$_l_Index}#-999)
								
								If ([CONTACTS:1]x_ID:33#SD2_al_RecordID{$_l_Index})
									DOC_l_ContactIDreturn:=0
									
									$_l_ContactsProcess:=New process:C317("DOC_GetContactDetails"; 32000; "Contact_Details"; Current process:C322; SD2_al_RecordID{$_l_Index})
									$_l_Retries:=0
									While (DOC_l_ContactIDreturn=0)
										$_l_Retries:=$_l_Retries+1
										DelayTicks(2*$_l_Retries)
									End while 
									If (DOC_l_ContactIDreturn>0)
										APPEND TO ARRAY:C911(SD2_at_ContactIDs; DOC_t_ContactCodeReturn)
										$_t_Name:=DOC_t_ContactNameReturn
										APPEND TO ARRAY:C911(WS_al_PersonID; DOC_l_ContactIDreturn)
									End if 
								Else 
									APPEND TO ARRAY:C911(SD2_at_ContactIDs; [CONTACTS:1]Contact_Code:2)
									$_t_Name:=[CONTACTS:1]Contact_Name:31
									APPEND TO ARRAY:C911(WS_al_PersonID; [CONTACTS:1]x_ID:33)
									
								End if 
							Else 
								$_l_AtPosition:=Position:C15(Char:C90(64); SD2_at_InviteeEmailAddress{$_l_Index})
								$_t_Name:=Substring:C12(SD2_at_InviteeEmailAddress{$_l_Index}; 1; $_l_AtPosition-1)
								
								$_t_Name:=Gen_Request("Enter a Name for "+SD2_at_InviteeEmailAddress{$_l_Index}; $_t_Name)
								APPEND TO ARRAY:C911(SD2_at_ContactIDs; "")
								
								APPEND TO ARRAY:C911(WS_al_PersonID; -999)
							End if 
						: (SD2_al_InviteeClass{$_l_Index}=1)  //Need to modify this to not change the current record pointer
							
							If (SD2_al_RecordID{$_l_Index}#-999)
								
								If ([CONTACTS:1]x_ID:33#SD2_al_RecordID{$_l_Index})
									DOC_l_ContactIDreturn:=0
									
									$_l_ContactsProcess:=New process:C317("DOC_GetContactDetails"; 32000; "Contact_Details"; Current process:C322; SD2_al_RecordID{$_l_Index})
									$_l_Retries:=0
									While (DOC_l_ContactIDreturn=0)
										$_l_Retries:=$_l_Retries+1
										DelayTicks(2*$_l_Retries)
									End while 
									If (DOC_l_ContactIDreturn>0)
										APPEND TO ARRAY:C911(SD2_at_ContactIDs; DOC_t_ContactCodeReturn)
										$_t_Name:=DOC_t_ContactNameReturn
										APPEND TO ARRAY:C911(WS_al_PersonID; DOC_l_ContactIDreturn)
									End if 
								Else 
									APPEND TO ARRAY:C911(SD2_at_ContactIDs; [CONTACTS:1]Contact_Code:2)
									$_t_Name:=[CONTACTS:1]Contact_Name:31
									APPEND TO ARRAY:C911(WS_al_PersonID; [CONTACTS:1]x_ID:33)
									
								End if 
							Else 
								$_l_CharacterPosition:=Position:C15(Char:C90(64); SD2_at_InviteeEmailAddress{$_l_Index})
								$_t_Name:=Substring:C12(SD2_at_InviteeEmailAddress{$_l_Index}; 1; $_l_CharacterPosition-1)
								$_t_Name:=Gen_Request("Enter a Name for "+SD2_at_InviteeEmailAddress{$_l_Index}; $_t_Name)
								APPEND TO ARRAY:C911(SD2_at_ContactIDs; "")
								
								APPEND TO ARRAY:C911(WS_al_PersonID; -999)
							End if 
							
						Else 
							If (SD2_al_RecordID{$_l_Index}#-999)
								
								QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SD2_al_RecordID{$_l_Index})
								$_t_Name:=[PERSONNEL:11]Name:2
								APPEND TO ARRAY:C911(SD2_at_ContactIDs; [PERSONNEL:11]Initials:1)
								APPEND TO ARRAY:C911(WS_al_PersonID; -[PERSONNEL:11]Personnel_ID:48)
							Else 
								$_l_CharacterPosition:=Position:C15(Char:C90(64); SD2_at_InviteeEmailAddress{$_l_Index})
								$_t_Name:=Substring:C12(SD2_at_InviteeEmailAddress{$_l_Index}; 1; $_l_CharacterPosition-1)
								$_t_Name:=Gen_Request("Enter a Name for "+SD2_at_InviteeEmailAddress{$_l_Index}; $_t_Name)
								APPEND TO ARRAY:C911(SD2_at_ContactIDs; "")
								
								APPEND TO ARRAY:C911(WS_al_PersonID; -999)
							End if 
							
					End case 
					APPEND TO ARRAY:C911(WS_at_EmailComb; $_t_Name+"  <"+SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}+">")
				Else 
					APPEND TO ARRAY:C911(SD2_at_EmailType; SD2_at_InviteeEmailOption{$_l_Index})
					
					
					APPEND TO ARRAY:C911(SD2_at_EmailAddresses; SD2_at_InviteeEmailAddress{$_l_Index})
					APPEND TO ARRAY:C911(SD2_at_EmailName; SD2_at_Invitees{$_l_Index})
					APPEND TO ARRAY:C911(SD2_al_SentStatus; SD2_al_InviteeStatus{$_l_Index})
					APPEND TO ARRAY:C911(WS_at_EmailSentStatus; SD2_at_InviteeStatus{$_l_Index})
					
					//this is an adhoc email address
					$_l_CharacterPosition:=Position:C15(Char:C90(64); SD2_at_InviteeEmailAddress{$_l_Index})
					$_t_Name:=Substring:C12(SD2_at_InviteeEmailAddress{$_l_Index}; 1; $_l_CharacterPosition-1)
					$_t_Name:=Gen_Request("Enter a Name for "+SD2_at_InviteeEmailAddress{$_l_Index}; $_t_Name)
					APPEND TO ARRAY:C911(SD2_at_ContactIDs; "")
					
					
					
					
					
					APPEND TO ARRAY:C911(WS_al_PersonID; -999)
					APPEND TO ARRAY:C911(WS_at_EmailComb; $_t_Name+"  <"+SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}+">")
					
					
					
					
				End if 
			End for 
			SD2_DiaryINLLPInterface("SD2_EmailEntry")
		End if 
	: ($_l_event=On After Keystroke:K2:26)
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ:Diary_InEmail,DOC_lb_Recipients"; $_t_oldMethodName)
