//%attributes = {}
If (False:C215)
	//Project Method Name:      SMS_SaveVariables
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
	C_BOOLEAN:C305(DSS_bo_Enabled; SMS_LowLevelWarningSent)
	C_LONGINT:C283($_l_ItemID; SMS_CreateLog; SMS_iCreditsLowLevel; SMS_MaxMsgs; SMS_OneOrTwoWay)
	C_REAL:C285(SMS_AvgMsgCredits; SMS_Credits)
	C_TEXT:C284($_t_oldMethodName; SMS_AccountName; SMS_From; SMS_Password; SMS_ReminderPhone)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMS_SaveVariables")
// SMS_SaveVariables
// 05/06/02 pb

READ WRITE:C146([PREFERENCES:116])
While (Semaphore:C143("AddingPrefs1"))
	DelayTicks(20)
End while 
//READ ONLY([Preferences])   WHY????
$_l_ItemID:=PREF_GetPreferenceID("SMS Preferences")
//QUERY([Preferences];[Preferences]IDNumber=1)  ` 1 = SMS prefs
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)  // 19/12/02 pb
// Check_Locked here
SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
VARIABLE TO BLOB:C532(SMS_From; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(SMS_AccountName; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(SMS_Password; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(SMS_Credits; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(SMS_OneOrTwoWay; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(SMS_AvgMsgCredits; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(SMS_MaxMsgs; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(SMS_CreateLog; [PREFERENCES:116]DataBlob:2; *)  // 7/1/03 pb
VARIABLE TO BLOB:C532(SMS_iCreditsLowLevel; [PREFERENCES:116]DataBlob:2; *)  // 7/1/03 pb
VARIABLE TO BLOB:C532(SMS_LowLevelWarningSent; [PREFERENCES:116]DataBlob:2; *)  // 7/1/03 pb
VARIABLE TO BLOB:C532(SMS_ReminderPhone; [PREFERENCES:116]DataBlob:2; *)  // 7/1/03 pb
DB_SaveRecord(->[PREFERENCES:116])
UNLOAD RECORD:C212([PREFERENCES:116])
CLEAR SEMAPHORE:C144("AddingPrefs1")
ERR_MethodTrackerReturn("SMS_SaveVariables"; $_t_oldMethodName)
