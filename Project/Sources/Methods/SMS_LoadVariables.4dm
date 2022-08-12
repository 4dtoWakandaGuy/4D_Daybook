//%attributes = {}
If (False:C215)
	//Project Method Name:      SMS_LoadVariables
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
	C_BOOLEAN:C305(SMS_LowLevelWarningSent)
	C_LONGINT:C283(<>iSMS_MaxMessageLength; $_l_ItemID; $_l_Offset; SMS_CreateLog; SMS_iCreditsLowLevel; SMS_l_MessagesAvailable; SMS_MaxMsgs; SMS_OneOrTwoWay)
	C_REAL:C285(SMS_AvgMsgCredits; SMS_Credits)
	C_TEXT:C284($_t_oldMethodName; SMS_AccountName; SMS_From; SMS_Password; SMS_ReminderPhone)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMS_LoadVariables")
// SMS_LoadVariables
// 2/05/02 pb
// Loads the SMS settings from the Preferences blob

READ ONLY:C145([PREFERENCES:116])
$_l_ItemID:=PREF_GetPreferenceID("SMS Preferences")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	READ WRITE:C146([PREFERENCES:116])
	While (Semaphore:C143("AddingPrefs1"))
		DelayTicks(20)
	End while 
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		DB_SaveRecord(->[PREFERENCES:116])
		SMS_From:=""
		SMS_AccountName:=""
		SMS_Password:=""
		SMS_Credits:=0
		SMS_OneOrTwoWay:=1
		SMS_AvgMsgCredits:=2
		SMS_MaxMsgs:=99
		SMS_CreateLog:=1  // 7/01/03 pb
		SMS_iCreditsLowLevel:=50  // 7/1/03 pb
		SMS_LowLevelWarningSent:=False:C215
		SMS_ReminderPhone:=""
		SMS_SaveVariables
	End if 
End if 
CLEAR SEMAPHORE:C144("AddingPrefs1")

$_l_Offset:=0
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SMS_From; $_l_Offset)  // "from" address (phone no. or identifier)
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SMS_AccountName; $_l_Offset)  // SMSRelay account name
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SMS_Password; $_l_Offset)  // SMSRelay password
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SMS_Credits; $_l_Offset)  // SMSRelay credits available
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SMS_OneOrTwoWay; $_l_Offset)  // One- or Two-way SMS messaging
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SMS_AvgMsgCredits; $_l_Offset)  // the average no. of credits used per msg sent
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SMS_MaxMsgs; $_l_Offset)  // the maximum no. of recipients that can be sent to in one go
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SMS_CreateLog; $_l_Offset)  // TRUE if you want to create a SMS_Log record for each msg
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SMS_iCreditsLowLevel; $_l_Offset)  // Warn Administrator when credits get down to this level
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SMS_LowLevelWarningSent; $_l_Offset)  // TRUE wen a msg has been sent to warn of low credit level
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SMS_ReminderPhone; $_l_Offset)  // Mobile no. to send low credits warnings to
UNLOAD RECORD:C212([PREFERENCES:116])
//◊SMS_From:=SMS_From
//◊SMS_AccountName:=SMS_AccountName
//◊SMS_Password:=SMS_Password
<>iSMS_MaxMessageLength:=160  // this could be a user preference
If (SMS_MaxMsgs=0)
	SMS_MaxMsgs:=99
End if 
If (SMS_AvgMsgCredits=0)
	SMS_AvgMsgCredits:=2
End if 
SMS_l_MessagesAvailable:=Int:C8(SMS_Credits/SMS_AvgMsgCredits)
ERR_MethodTrackerReturn("SMS_LoadVariables"; $_t_oldMethodName)
