If (False:C215)
	//Table Form Method Name: [COMPANIES]dRequest_SMSText
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
	//ARRAY TEXT(SMS_at_Results;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SMS_at_Mobile;0)
	//ARRAY TEXT(SMS_at_Name;0)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts; DB_bo_NoLoad; MSG_bo_NewMessage; MSG_bo_QuickMessage; SMS_bo_LockedRecipients)
	C_LONGINT:C283($_l_event; $i; Badd; BMinus; xOK)
	C_TEXT:C284($_t_oldMethodName; MSG_t_CharsRemain; MSG_t_MessageFrom; SMS_From; vConfirm; vT; vTitle; WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dRequest_SMSText"; Form event code:C388)


$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dRequest_SMSText")
		MSG_t_MessageFrom:=SMS_From  // 03/07/02 pb
		
		If (<>SCPT_bo_NoAutoScripts=False:C215)
			PLAY:C290("Daybook Confirm"; 0)
		End if 
		
		ARRAY TEXT:C222(SMS_at_Results; 0)  // 3/7/02 pb
		If ((MSG_t_CharsRemain="") | (MSG_bo_NewMessage=False:C215))  // 09/05/02 pb
			//    the message has already been sent  - we can only review it
			OBJECT SET VISIBLE:C603(MSG_t_CharsRemain; False:C215)
			OBJECT SET VISIBLE:C603(Badd; False:C215)
			OBJECT SET VISIBLE:C603(BMinus; False:C215)
			OBJECT SET VISIBLE:C603(WS_t_EmailName; False:C215)
			OBJECT SET VISIBLE:C603(WS_t_EmailAddress; False:C215)
			OBJECT SET ENTERABLE:C238(vT; False:C215)
			OBJECT SET ENTERABLE:C238(MSG_t_MessageFrom; False:C215)
			//      [EMAIL_RECIPIENTS]DiaryID:=[DIARY]Diary Code
			QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1=[DIARY:12]Diary_Code:3)
			SELECTION TO ARRAY:C260([EMAIL_RECIPIENTS:104]Email_Address:3; SMS_at_Mobile; [EMAIL_RECIPIENTS:104]ContactID:4; SD2_at_ContactIDs; [EMAIL_RECIPIENTS:104]Result:5; SMS_at_Results)
			ARRAY TEXT:C222(SMS_at_Name; Size of array:C274(SD2_at_ContactIDs))
			For ($i; 1; Size of array:C274(SD2_at_ContactIDs))
				If (SD2_at_ContactIDs{$i}#"")
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactIDs{$i})
					SMS_at_Name{$i}:=[CONTACTS:1]Contact_Name:31
				End if 
			End for 
			SORT ARRAY:C229(SMS_at_Name; SD2_at_ContactIDs; SMS_at_Mobile; SMS_at_Results)
			vTitle:="SMS Message (sent)"
			vConfirm:="Message:"
			FORM GOTO PAGE:C247(2)
		Else   // it is a new message -- not yet sent
			OBJECT SET VISIBLE:C603(SMS_at_Results; False:C215)
			OBJECT SET VISIBLE:C603(*; "Text3"; False:C215)
			//    SET VISIBLE(WS_t_EmailName;False)
			//    SET VISIBLE(WS_t_EmailAddress;False)
			OBJECT SET TITLE:C194(xOK; "Send")
			
			If (SMS_bo_LockedRecipients)
				OBJECT SET VISIBLE:C603(Badd; False:C215)
				OBJECT SET VISIBLE:C603(BMinus; False:C215)
			End if 
			
			
			
			vTitle:="New SMS Message"
		End if 
		//    WS_AutoscreenSize (1;355;597)
		AA_LoadNameArrays  // 26/06/02 pb
		WS_t_EmailName:=""
		WS_t_EmailAddress:=""
		WS_t_ContactID:=""
		INT_SetDialog
		
	Else 
		
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dRequest_SMSText"; $_t_oldMethodName)
