If (False:C215)
	//object Name: [USER]SD2_EmailEntry.oaddrecipient
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/01/2013 10:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_InviteeClass;0)
	//ARRAY LONGINT(SD2_al_InviteeStatus;0)
	//ARRAY LONGINT(SD2_al_InviteStati;0)
	//ARRAY LONGINT(SD2_al_RecordID;0)
	//ARRAY LONGINT(SD2_al_SentStatus;0)
	//ARRAY LONGINT(WS_al_PersonID;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_ContCompany;0)
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
	C_LONGINT:C283($_l_ArraySize; $_l_CurrentWinRefOLD; $_l_Index; $_l_Retries; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; DOC_l_CallEvent; SD_l_InviteeContext; SD2_l_EmailChoiceProc)
	C_LONGINT:C283(SD2_l_InviteeMode; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_Name; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_EmailEntry.oaddrecipient"; Form event code:C388)

GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
SD2_l_InviteeMode:=1
SD_l_InviteeContext:=1  //Email(see form method for SD2_PersonAdd
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
ARRAY TEXT:C222(SD2_at_ContCompany; 0)  //for any contacts added we need the company code

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
	Case of 
		: (WS_al_PersonID{$_l_Index}=0)
			//Person ID not stored..
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactIDs{$_l_Index})
			WS_al_PersonID{$_l_Index}:=[CONTACTS:1]x_ID:33
			APPEND TO ARRAY:C911(SD2_al_InviteeClass; 1)
			APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Contact")
			APPEND TO ARRAY:C911(SD2_al_RecordID; [CONTACTS:1]x_ID:33)
		: (WS_al_PersonID{$_l_Index}>0)
			APPEND TO ARRAY:C911(SD2_al_InviteeClass; 1)
			APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Contact")
			APPEND TO ARRAY:C911(SD2_al_RecordID; WS_al_PersonID{$_l_Index})
			
		: (WS_al_PersonID{$_l_Index}<0)
			APPEND TO ARRAY:C911(SD2_al_InviteeClass; 2)
			APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Internal")
			APPEND TO ARRAY:C911(SD2_al_RecordID; Abs:C99(WS_al_PersonID{$_l_Index}))
	End case 
End for 
//HIDE WINDOW
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
If (Macintosh)  //& (False)  `kmw 17/10/08 v631b120a  -added AND false (disable use of this type of window here because it causes issues)
	WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft+20; $_l_WindowTop+10; $_l_WindowRight-50; $_l_WindowTop+10; 34)
Else 
	
	WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft+20; $_l_WindowTop+10; $_l_WindowRight-50; $_l_WindowTop+10; 1984)
End if 
DIALOG:C40([USER:15]; "SD2_PersonAdd")
CLOSE WINDOW:C154
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
	//If (SD2_al_RecordID{Size of array(SD2_al_RecordID)}#0)
	If (SD2_al_RecordID{$_l_Index}#0)  //Altered from above 11/07/08 -kmw (previously it was only checking the last line's record id but it effected ALL lines)
		
		$_l_ArraySize:=Size of array:C274(SD2_at_InviteeEmailAddress)
		APPEND TO ARRAY:C911(SD2_at_EmailType; SD2_at_InviteeEmailOption{$_l_Index})
		APPEND TO ARRAY:C911(SD2_at_EmailAddresses; SD2_at_InviteeEmailAddress{$_l_Index})
		APPEND TO ARRAY:C911(SD2_at_EmailName; SD2_at_Invitees{$_l_Index})
		APPEND TO ARRAY:C911(SD2_al_SentStatus; SD2_al_InviteeStatus{$_l_Index})
		APPEND TO ARRAY:C911(WS_at_EmailSentStatus; SD2_at_InviteeStatus{$_l_Index})
		Case of 
			: (SD2_al_InviteeClass{$_l_Index}=0)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=SD2_al_RecordID{$_l_Index})
				APPEND TO ARRAY:C911(SD2_at_ContactIDs; [CONTACTS:1]Contact_Code:2)
				$_t_Name:=[CONTACTS:1]Contact_Name:31
				APPEND TO ARRAY:C911(WS_al_PersonID; [CONTACTS:1]x_ID:33)
			: (SD2_al_InviteeClass{$_l_Index}=1)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=SD2_al_RecordID{$_l_Index})
				
				$_t_Name:=[CONTACTS:1]Contact_Name:31
				APPEND TO ARRAY:C911(SD2_at_ContactIDs; [CONTACTS:1]Contact_Code:2)
				APPEND TO ARRAY:C911(WS_al_PersonID; [CONTACTS:1]x_ID:33)
			Else 
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SD2_al_RecordID{$_l_Index})
				$_t_Name:=[PERSONNEL:11]Name:2
				APPEND TO ARRAY:C911(SD2_at_ContactIDs; [PERSONNEL:11]Initials:1)
				APPEND TO ARRAY:C911(WS_al_PersonID; -[PERSONNEL:11]Personnel_ID:48)
		End case 
		APPEND TO ARRAY:C911(WS_at_EmailComb; $_t_Name+"  <"+SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}+">")
	End if 
End for 
SD2_DiaryINLLPInterface("SD2_EmailEntry")
ERR_MethodTrackerReturn("OBJ [USER].SD2_EmailEntry.oaddrecipient"; $_t_oldMethodName)
