If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.oSMSButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Proceed; MSG_bo_NewMessage; MSG_bo_QuickMessage)
	C_TEXT:C284($_t_oldMethodName; MSG_t_Message; MSG_t_MessageFrom)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.oSMSButton"; Form event code:C388)
$_bo_Proceed:=True:C214
MSG_t_Message:=""
MSG_bo_NewMessage:=True:C214
Case of 
		//  : ([DIARY]Contact Code="")  ` 26/06/02 pb
	: (([DIARY:12]Contact_Code:2="") & ([DIARY:12]Document_Code:15=""))  // 26/06/02 pb
		//    ALERT("Please select a contact first!")
		Gen_Alert("Please select a contact first!")
		$_bo_Proceed:=False:C215
		
	: ([DIARY:12]Document_Code:15="SMS")
		//    CONFIRM("The SMS message has already been sent. Do you wish to re-send it?";
		//    If (OK=0)
		//    $_bo_Proceed:=False
		//   Else
		MSG_t_Message:=Replace string:C233([DIARY:12]Action_Details:10; "SMS: "; "")
		MSG_bo_NewMessage:=False:C215
		
		//  End if
	: ([DIARY:12]Document_Code:15#"")
		//    ALERT("An Email or letter has already been selected for this Diary item.")
		Gen_Alert("An Email or letter has already been selected for this Diary item.")
		$_bo_Proceed:=False:C215
	Else 
End case 

If ($_bo_Proceed)
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)  // 26/06/02 pb
	//  [DIARY]Email_From:=SMS_From  ` 26/06/02 pb
	MSG_bo_QuickMessage:=False:C215
	SMS_SendOneMessage(->[CONTACTS:1]Mobile:12)
	If ((MSG_t_Message#"") & ([DIARY:12]Action_Details:10=""))  // Action desc will not be blank if the msg has already been sent
		[DIARY:12]Action_Details:10:="SMS: "+MSG_t_Message
		[DIARY:12]Email_Text:42:=MSG_t_Message
		[DIARY:12]Document_Code:15:="SMS"
		
		[DIARY:12]Email_From:38:=MSG_t_MessageFrom
		//    [DIARY]Email_From:=GetEmailSender
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.oSMSButton"; $_t_oldMethodName)
