//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_EmailBuildRecipientArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_SentStatus;0)
	//ARRAY LONGINT(WS_al_PersonID;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(WS_at_EmailComb;0)
	//ARRAY TEXT(WS_at_EmailSentStatus;0)
	C_LONGINT:C283($_l_AtPosition; $_l_EmailIndex; $_l_Process; DOC_l_ContactIDreturn)
	C_POINTER:C301($_ptr_DiaryCode; $_ptr_DiaryContactCode; $1; $2)
	C_TEXT:C284($_t_ContactName; $_t_EmailAfter; $_t_EmailBefore; $_t_oldMethodName; DOC_t_ContactCodeReturn; DOC_t_ContactNameReturn)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_EmailBuildRecipientArrays")

//SD2_EmailBuildRecipientArrays -Added 21/10/08 v621b120a -kmw (Code factored out with Minor_Modifcations from SD2_DiaryInLLB to tidy it up and allow to be called more than once)

//
$_ptr_DiaryCode:=$1
$_ptr_DiaryContactCode:=$2
//
QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1=$_ptr_DiaryCode->)
SELECTION TO ARRAY:C260([EMAIL_RECIPIENTS:104]Classification:2; SD2_at_EmailType; [EMAIL_RECIPIENTS:104]Email_Address:3; SD2_at_EmailAddresses; [EMAIL_RECIPIENTS:104]ContactID:4; SD2_at_ContactIDs; [EMAIL_RECIPIENTS:104]Person_ID:6; WS_al_PersonID; [EMAIL_RECIPIENTS:104]SentStatus:7; SD2_al_SentStatus)
If (Size of array:C274(SD2_at_EmailAddresses)<1)
	ARRAY TEXT:C222(SD2_at_EmailName; 0)
	ARRAY TEXT:C222(WS_at_EmailComb; 0)
	
	If ($_ptr_DiaryContactCode->#"")
		//add the contact to the list of recipients...
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_ptr_DiaryContactCode->; *)  //20/10/08 v621b120a -kmw, added condiition that contact must have an email address
		QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Email_Address:35#"")  //20/10/08 v621b120a -kmw, added condition that diary contact must have an email address
		If (Records in selection:C76([CONTACTS:1])>0)
			APPEND TO ARRAY:C911(SD2_at_EmailType; "To")
			APPEND TO ARRAY:C911(SD2_at_EmailAddresses; [CONTACTS:1]Email_Address:35)
			APPEND TO ARRAY:C911(SD2_at_EmailName; [CONTACTS:1]Contact_Name:31)
			APPEND TO ARRAY:C911(SD2_al_SentStatus; 0)
			APPEND TO ARRAY:C911(WS_at_EmailSentStatus; "Not Sent")
			APPEND TO ARRAY:C911(SD2_at_ContactIDs; [CONTACTS:1]Contact_Code:2)
			APPEND TO ARRAY:C911(WS_al_PersonID; [CONTACTS:1]x_ID:33)
			APPEND TO ARRAY:C911(WS_at_EmailComb; [CONTACTS:1]Contact_Name:31+"  <"+SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}+">")
		End if 
	End if 
Else 
	ARRAY TEXT:C222(SD2_at_EmailName; Size of array:C274(SD2_at_ContactIDs))
	ARRAY TEXT:C222(WS_at_EmailComb; Size of array:C274(SD2_at_ContactIDs))
	
	For ($_l_EmailIndex; 1; Size of array:C274(SD2_at_EmailType))
		
		If (WS_al_PersonID{$_l_EmailIndex}>=0)
			If (WS_al_PersonID{$_l_EmailIndex}=0) & (SD2_at_ContactIDs{$_l_EmailIndex}#"")
				DOC_l_ContactIDreturn:=0
				$_l_Process:=New process:C317("DOC_GetContactDetails"; DB_ProcessMemoryinit(1); "Contact_Details"; Current process:C322; WS_al_PersonID{$_l_EmailIndex}; SD2_at_ContactIDs{$_l_EmailIndex})
				While (DOC_l_ContactIDreturn=0)
					DelayTicks(2)
				End while 
				If (DOC_l_ContactIDreturn>0)
					WS_al_PersonID{$_l_EmailIndex}:=DOC_l_ContactIDreturn
				End if 
			End if 
			
			$_t_ContactName:=""  //added 10/12/08 v631b120k -kmw
			
			
			
			If (SD2_at_ContactIDs{$_l_EmailIndex}#"")
				
				If ([CONTACTS:1]x_ID:33#WS_al_PersonID{$_l_EmailIndex})
					DOC_l_ContactIDreturn:=0
					$_l_Process:=New process:C317("DOC_GetContactDetails"; DB_ProcessMemoryinit(1); "Contact_Details"; Current process:C322; WS_al_PersonID{$_l_EmailIndex})
					While (DOC_l_ContactIDreturn=0)
						DelayTicks(2)
					End while 
					If (DOC_l_ContactIDreturn>0)
						SD2_at_ContactIDs{$_l_EmailIndex}:=DOC_t_ContactCodeReturn
						$_t_ContactName:=DOC_t_ContactNameReturn
						WS_al_PersonID{$_l_EmailIndex}:=DOC_l_ContactIDreturn
					End if 
				Else 
					SD2_at_ContactIDs{$_l_EmailIndex}:=[CONTACTS:1]Contact_Code:2
					$_t_ContactName:=[CONTACTS:1]Contact_Name:31
					WS_al_PersonID{$_l_EmailIndex}:=[CONTACTS:1]x_ID:33
					
				End if 
				
				SD2_at_EmailName{$_l_EmailIndex}:=$_t_ContactName
				WS_at_EmailComb{$_l_EmailIndex}:=SD2_at_EmailName{$_l_EmailIndex}+"<"+SD2_at_EmailAddresses{$_l_EmailIndex}+">"
			End if 
		Else 
			If (SD2_at_ContactIDs{$_l_EmailIndex}#"")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD2_at_ContactIDs{$_l_EmailIndex})
				SD2_at_EmailName{$_l_EmailIndex}:=[PERSONNEL:11]Name:2
				WS_at_EmailComb{$_l_EmailIndex}:=SD2_at_EmailName{$_l_EmailIndex}+"<"+SD2_at_EmailAddresses{$_l_EmailIndex}+">"
			Else 
				$_l_AtPosition:=Position:C15(Char:C90(64); SD2_at_EmailAddresses{$_l_EmailIndex})
				If ($_l_AtPosition>0)
					$_t_EmailBefore:=Substring:C12(SD2_at_EmailAddresses{$_l_EmailIndex}; 1; $_l_AtPosition-1)
					$_t_EmailAfter:=Substring:C12(SD2_at_EmailAddresses{$_l_EmailIndex}; $_l_AtPosition+1)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Email_Before_At:30=$_t_EmailBefore; *)
					QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]EMail_After_At:24=$_t_EmailAfter)
					If (Records in selection:C76([CONTACTS:1])>0)
						WS_al_PersonID{$_l_EmailIndex}:=[CONTACTS:1]x_ID:33
						SD2_at_ContactIDs{$_l_EmailIndex}:=[CONTACTS:1]Contact_Code:2
						SD2_at_EmailName{$_l_EmailIndex}:=[CONTACTS:1]Contact_Name:31
						WS_at_EmailComb{$_l_EmailIndex}:=SD2_at_EmailName{$_l_EmailIndex}+"<"+SD2_at_EmailAddresses{$_l_EmailIndex}+">"
					Else 
						SD2_at_EmailName{$_l_EmailIndex}:="Unknown"
						WS_at_EmailComb{$_l_EmailIndex}:=SD2_at_EmailName{$_l_EmailIndex}+"<"+SD2_at_EmailAddresses{$_l_EmailIndex}+">"
					End if 
					
				End if 
			End if 
		End if 
	End for 
	
	
End if 
ERR_MethodTrackerReturn("SD2_EmailBuildRecipientArrays"; $_t_oldMethodName)