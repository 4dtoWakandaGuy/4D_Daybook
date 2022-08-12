//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_UpdateReportingPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2010 22:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_aDiaryOwnerIDs;0)
	//ARRAY LONGINT(ACC_al_EmailOwnerIDS;0)
	//ARRAY TEXT(ACC_at_DiaryNames;0)
	//ARRAY TEXT(ACC_at_EMailAccounts;0)
	//ARRAY TEXT(ACC_at_EMailAccountsUser;0)
	C_BOOLEAN:C305($_bo_local; $_bo_OK; ACC_bo_ReportPrefsLoaded; ACC_bo_ReportPrefsLoaded2)
	C_DATE:C307(ACC_D_EDate)
	C_LONGINT:C283($_l_Delay; $_l_ItemID; $_l_offset; $_l_OldRunning; $_l_Repeats; ACC_l_CBConstantCheck; ACC_l_CBContinuousCheck; ACC_l_CBFixAccountB; ACC_l_CBFixAccountV; ACC_l_CBFixTransactionsA; ACC_l_CBFixTransactionsC)
	C_LONGINT:C283(ACC_l_CBFixTransactionsL; ACC_l_CBFixTransactionsV; ACC_l_CBLogToDiary; ACC_l_CBLogToeMail; ACC_l_CBOneCheck; ACC_l_LastTransactionID)
	C_TEXT:C284($_t_oldMethodName; ACC_t_ActionCode; ACC_t_ActionName; ACC_t_EPeriodCode)
	C_TIME:C306(ACC_ti_cTImeEnd; Acc_ti_cTimeStart)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("ACC_UpdateReportingPrefs")
//this now indicates whether to run a check the variables ACC_l_CBOneCheck and ACC_l_CBContinuousCheck
//indicate whether it is continuous
//ARRAY STRING(255;ACC_at_DiaryNames;0)
//ARRAY LONGINT(ACC_al_aDiaryOwnerIDs;0)
//ARRAY STRING(255;ACC_at_EMailAccounts;0)
//ARRAY STRING(255;ACC_at_EmailAccountsUser;0)

//ARRAY LONGINT(ACC_al_EmailOwnerIDS;0)

$_l_OldRunning:=ACC_l_CBConstantCheck
While (Semaphore:C143("LoadingOrderPrefs"))
	DelayTicks
End while 
READ WRITE:C146([PREFERENCES:116])
$_l_ItemID:=PREF_GetPreferenceID("Order Reporting Preferences")
If ($_l_ItemID>0)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	End if 
	$_bo_OK:=False:C215
	$_l_Repeats:=0
	$_l_Delay:=1
	Repeat 
		$_l_Repeats:=$_l_Repeats+1
		$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 1)
		If (Not:C34($_bo_OK))
			
			If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
				//only increase every 10 tries
				$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
			End if 
			DelayTicks(2*$_l_Delay)
		End if 
	Until ($_bo_OK=True:C214)
	
	$_l_offset:=0
	VARIABLE TO BLOB:C532(ACC_l_CBLogToDiary; [PREFERENCES:116]DataBlob:2)  // log to diary
	VARIABLE TO BLOB:C532(ACC_l_CBLogToeMail; [PREFERENCES:116]DataBlob:2; *)  //log to email
	
	VARIABLE TO BLOB:C532(ACC_l_CBConstantCheck; [PREFERENCES:116]DataBlob:2; *)  //run continually on server
	VARIABLE TO BLOB:C532(Acc_ti_cTimeStart; [PREFERENCES:116]DataBlob:2; *)  //Time to start working
	VARIABLE TO BLOB:C532(Acc_ti_cTimeEnd; [PREFERENCES:116]DataBlob:2; *)  //time to stop working
	//if no times are set the service will run all the time
	//note also that the STOP time should  normally be earlier then the START time
	//as the run would probably start in the evening and end in the morning
	VARIABLE TO BLOB:C532(ACC_t_ActionCode; [PREFERENCES:116]DataBlob:2; *)  //diary action code
	VARIABLE TO BLOB:C532(ACC_t_ActionName; [PREFERENCES:116]DataBlob:2; *)  //diary action name
	VARIABLE TO BLOB:C532(ACC_at_DiaryNames; [PREFERENCES:116]DataBlob:2; *)  //whose diaries
	VARIABLE TO BLOB:C532(ACC_al_aDiaryOwnerIDs; [PREFERENCES:116]DataBlob:2; *)  //whose diaries
	VARIABLE TO BLOB:C532(ACC_at_EMailAccounts; [PREFERENCES:116]DataBlob:2; *)  //email accounts
	VARIABLE TO BLOB:C532(ACC_at_EmailAccountsUser; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(ACC_al_EmailOwnerIDS; [PREFERENCES:116]DataBlob:2; *)  //email owner IDs?
	VARIABLE TO BLOB:C532(ACC_l_CBFixAccountV; [PREFERENCES:116]DataBlob:2; *)  //validate account on balance update
	VARIABLE TO BLOB:C532(ACC_l_CBFixAccountB; [PREFERENCES:116]DataBlob:2; *)  //fix account if it is wrong(else report it)
	VARIABLE TO BLOB:C532(ACC_D_EDate; [PREFERENCES:116]DataBlob:2; *)  //earliest date to fix account if fix accounts is set
	VARIABLE TO BLOB:C532(ACC_t_EPeriodCode; [PREFERENCES:116]DataBlob:2; *)  //or earlies period to fix accounts
	VARIABLE TO BLOB:C532(ACC_l_CBFixTransactionsA; [PREFERENCES:116]DataBlob:2; *)  //Fix Transaction Analysis codes
	//this will check they match the batch and they exist
	//if not set mismatch will be reported only
	VARIABLE TO BLOB:C532(ACC_l_CBFixTransactionsL; [PREFERENCES:116]DataBlob:2; *)  //fix transaction layer codes
	VARIABLE TO BLOB:C532(ACC_l_CBFixTransactionsC; [PREFERENCES:116]DataBlob:2; *)  //fix transaction Currency codes
	VARIABLE TO BLOB:C532(ACC_l_CBFixTransactionsV; [PREFERENCES:116]DataBlob:2; *)  //fix transaction Amount codes
	VARIABLE TO BLOB:C532(ACC_l_LastTransactionID; [PREFERENCES:116]DataBlob:2; *)
	//NG march 2004 new variables added here
	VARIABLE TO BLOB:C532(ACC_l_CBOneCheck; [PREFERENCES:116]DataBlob:2; *)  //fix transaction Amount codes
	VARIABLE TO BLOB:C532(ACC_l_CBContinuousCheck; [PREFERENCES:116]DataBlob:2; *)
	
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
End if 
CLEAR SEMAPHORE:C144("LoadingOrderPrefs")

//this needs to reload on server
Case of 
	: (ApplicationType_isSingleUser)
		//run locally
		$_bo_local:=True:C214
	: (Application type:C494=4D Remote mode:K5:5)  //run on server
		$_bo_local:=False:C215
	: (Application type:C494=4D Server:K5:6)  //run locally
		$_bo_local:=True:C214
End case 
If ($_bo_local)
	Case of 
		: ($_l_OldRunning>ACC_l_CBConstantCheck)
			//was off...turn it on
			ACC_FullValidation(ACC_l_CBConstantCheck)
		: ($_l_OldRunning>ACC_l_CBConstantCheck)
			//was on turn it off
			//nothing to do it will stop itself
	End case 
Else 
	ACC_bo_ReportPrefsLoaded2:=False:C215
	If (ACC_l_CBConstantCheck=1)  //run constant check
		ACC_FullValidation(ACC_l_CBConstantCheck)
	End if 
End if 
ERR_MethodTrackerReturn("ACC_UpdateReportingPrefs"; $_t_oldMethodName)
