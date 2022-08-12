//%attributes = {}
If (False:C215)
	//Project Method Name:      SMS_SendOneMessage
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
	ARRAY TEXT:C222($_at_Mobilenumbers; 0)
	//ARRAY TEXT(SMS_at_ContactCodes;0)
	C_BOOLEAN:C305(MSG_bo_NewMessage)
	C_LONGINT:C283($iRecordcount)
	C_POINTER:C301($1; pTable)
	C_REAL:C285(SMS_AvgMsgCredits; SMS_Credits)
	C_TEXT:C284($_t_MobileNumber; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMS_SendOneMessage")
// SMS_SendMessageButton
// This is called when you click on one of the SMS buttons
// e.g. on the Diary screen
//Parameters: $1=pointer to the Contact mobile field
// OR
//              pointer to a variable containing a mobile number
// 06/06/02 PB


$_t_MobileNumber:=$1->
SMS_LoadVariables  // yes this does need to be loaded fresh each time
//$iRecordcount:=Records in selection([CONTACTS])
pTable:=Current form table:C627
Case of 
		// : ($iRecordcount>SMS_MaxMsgs)
		//   $_t_Message:="The maximum number of recipients is "+String(SMS_MaxMsgs)
		//  $_t_Message:=$_t_Message+". Please reduce the number of Contacts_In the selection."
		//  ALERT($_t_Message)
		
	: (((SMS_Credits/SMS_AvgMsgCredits)<2) & (MSG_bo_NewMessage=True:C214))
		Gen_Alert("You do not have sufficient credits available to send this message.")
		
		//  : (Records in selection([CONTACTS])=0)
		//   ALERT("Please select a Contact record first.")
	: (($1->="") & (MSG_bo_NewMessage=True:C214))
		//   ALERT("Please enter a Mobile Number for the Contact.")
		Gen_Alert("Please enter a Mobile Number for the Contact.")
	Else 
		If ($_t_MobileNumber#"")
			$_t_MobileNumber:=SMS_IntlPhoneNumber($1)
		End if 
		If (($_t_MobileNumber#"") | ($_t_MobileNumber=""))
			ARRAY TEXT:C222($_at_Mobilenumbers; 0)
			ARRAY TEXT:C222(SMS_at_ContactCodes; 0)
			//    SMS_SendMessage ($_t_MobileNumber;[CONTACTS]Contact Code;->$_at_Mobilenumbers;->SMS_at_ContactCodes)
			SMS_SendMessage($_t_MobileNumber; ""; ->$_at_Mobilenumbers; ->SMS_at_ContactCodes)  // 19/12/02 pb
		End if 
End case 
ERR_MethodTrackerReturn("SMS_SendOneMessage"; $_t_oldMethodName)
