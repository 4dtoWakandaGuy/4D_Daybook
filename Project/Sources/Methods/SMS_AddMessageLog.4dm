//%attributes = {}

If (False:C215)
	//Project Method Name:      SMS_AddMessageLog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(SMS_CreateLog)
	C_REAL:C285($4)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $5; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMS_AddMessageLog")

// SMS-AddMessageLog
// Adds a message log record whenever an SMS is successfully sent
// 7/01/03 PB
// parameters: $1 = mobile number to which msg was sent
//                     $2 = text of the message
//                     $3 = Sender's intials or name
//                     $4 = No. of credits used in sending this message
//                     $5 = the sender ID ("from" field)
//                     $6 = the text of the HTTP Result

$_t_oldMethodName:=ERR_MethodTracker("SMS_AddMessageLog")

If (SMS_CreateLog=1)
	CREATE RECORD:C68([SMS_Log:124])
	[SMS_Log:124]DateSent:1:=Current date:C33(*)
	[SMS_Log:124]TimeSent:6:=Current time:C178(*)
	[SMS_Log:124]MobileNumber:2:=$1
	[SMS_Log:124]MessageText:3:=$2
	[SMS_Log:124]Sender:4:=$3
	[SMS_Log:124]CreditsUsed:5:=$4
	[SMS_Log:124]From:7:=$5
	[SMS_Log:124]X_ID:8:=AA_GetNextIDinMethod(->[SMS_Log:124]X_ID:8)
	[SMS_Log:124]ResultText:9:=$6
	DB_SaveRecord(->[SMS_Log:124])
End if 
ERR_MethodTrackerReturn("SMS_AddMessageLog"; $_t_oldMethodName)