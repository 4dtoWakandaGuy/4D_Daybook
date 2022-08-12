//%attributes = {}
If (False:C215)
	//Project Method Name:      SMS_SendMessage
	//------------------ Method Notes ------------------
	// SMS_SendMessage
	// Method that sends SMS messages via SMSrelay
	// 02/05/02 pb
	// This will handle sending a message to one person or the same message
	// to a number of people -- in which case their mobile nos. and
	// Contact Codes should be in two arrays
	// Parameters: $1= One mobile no. (validated) -- blank if $3 is used
	//                     $2 = One [Contacts]Contact Code
	//                     $3 = POINTER TO an array of mobile nos. (validated)
	//                     $4 = POINTER TO an array of Contact Codes
	//$5=BOOLEAN(NG Oct 2002)
	//$5 allows me to tell whether to record seperate diary items
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SMS_at_Mobile;0)
	C_BLOB:C604(bDataBlob)
	C_BOOLEAN:C305($_bo_Continue; $0; $5; MSG_bo_NewMessage; yResend)
	C_LONGINT:C283(<>iSMS_MaxMessageLength)
	C_POINTER:C301($3; $4)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; $1; $2; SMS_AccountName; SMS_From; SMS_Password; tMessage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMS_SendMessage")

$0:=False:C215
Case of 
	: ((SMS_From="") | (SMS_AccountName="") | (SMS_Password=""))
		$_t_Message:="You need to set up an SMS account first. Please"
		$_t_Message:=$_t_Message+" go to the SMS page on the Preferences screen to do this."
		//    ALERT($_t_Message)
		Gen_Alert($_t_Message)
		$0:=False:C215
		
	Else 
		If (Count parameters:C259>=4)
			//   tMessage:=""
			$_bo_Continue:=True:C214
			yResend:=False:C215  // 14/01/03 pb
			While ($_bo_Continue)
				IDLE:C311  // 7/04/03 pb
				tMessage:=Gen_SMS_Msg("Message to send (limit "+String:C10(<>iSMS_MaxMessageLength)+" characters):"; tmessage; $1; $2; $3; $4)
				Case of 
					: (OK=0)
						$_bo_Continue:=False:C215
						tMessage:=""  // 26/06/02 pb
						$0:=False:C215
					Else 
						$_bo_Continue:=False:C215
				End case 
			End while 
			If ((OK=1) & (tMessage#"") & ((MSG_bo_NewMessage=True:C214) | (yResend=True:C214)))
				If (Count parameters:C259>=5)
					SMS_SendMessage2(->SMS_at_Mobile; ->SD2_at_ContactIDs; $5)  // mobile nos., contact codes
				Else 
					SMS_SendMessage2(->SMS_at_Mobile; ->SD2_at_ContactIDs; False:C215)
				End if   // request message text
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("SMS_SendMessage"; $_t_oldMethodName)
