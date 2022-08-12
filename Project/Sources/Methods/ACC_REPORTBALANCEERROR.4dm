//%attributes = {}
If (False:C215)
	//Project Method Name: 
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 21/01/2010 17:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_aDiaryOwnerIDs;0)
	//ARRAY TEXT(ACC_at_EMailAccountsUser;0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; ACC_bo_ReportPrefsLoaded)
	C_LONGINT:C283($_l_index; $4; ACC_l_CBLogToDiary; ACC_l_CBLogToeMail; ACC_l_errorDestination)
	C_REAL:C285($2; $3)
	C_TEXT:C284(<>EMAIL_t_DefaultReplyToAddress; <>PER_t_CurrentEmailFrom; $_t_Attach; $_t_EmailAttachments; $_t_EmailID; $_t_EmailSentTo; $_t_EmailText; $_t_ErrorMessage; $_t_oldMethodName; $_t_SentTo; $1)
	C_TEXT:C284(ACC_t_ActionCode; EMAIL_t_SendCalledFrom)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_REPORTBALANCEERROR")
$_t_ErrorMessage:=""

If (Not:C34(ACC_bo_ReportPrefsLoaded))
	ACC_ReportingPrefs
End if 
If (ACC_l_CBLogToDiary=1)
	If (ACC_t_ActionCode#"")
		If (Size of array:C274(ACC_al_aDiaryOwnerIDs)>0)
			READ WRITE:C146([DIARY:12])
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=ACC_al_aDiaryOwnerIDs{1})
			CREATE RECORD:C68([DIARY:12])
			DiarySetCode
			[DIARY:12]Action_Code:9:=ACC_t_ActionCode
			[DIARY:12]Date_Do_From:4:=Current date:C33(*)
			[DIARY:12]Time_Do_From:6:=Current time:C178(*)
			[DIARY:12]Person:8:=[PERSONNEL:11]Initials:1
			Case of 
				: ($4=1)
					//fixed
					[DIARY:12]Action_Details:10:="SYSTEM MESSAGE:"+Char:C90(13)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"Accounts balance "+$1+Char:C90(13)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"When checking this balance the sum of the transactions is not equal to"
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" the balance on the account"
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"The balance is "+String:C10($2)+" and the value of the transactions is "+String:C10($3)+Char:C90(13)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"This has been fixed"+Char:C90(13)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"This is provided for your information only"
				: ($4=-1)
					//not fixed
					[DIARY:12]Action_Details:10:="SYSTEM MESSAGE:"+Char:C90(13)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"Accounts balance "+$1+Char:C90(13)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"When checking this balance the sum of the transactions is not equal to"
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" the balance on the account"
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"The balance is "+String:C10($2)+" and the value of the transactions is "+String:C10($3)+Char:C90(13)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"This has been NOT BEEN  fixed"+Char:C90(13)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"You should check the value of the account balance and correct any problems"
					
					
			End case 
			$_t_ErrorMessage:=[DIARY:12]Action_Details:10
			DB_SaveRecord(->[DIARY:12])
			AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
			READ WRITE:C146([DIARY_ITEMOWNERS:106])
			For ($_l_index; 1; Size of array:C274(ACC_al_aDiaryOwnerIDs))
				CREATE RECORD:C68([DIARY_ITEMOWNERS:106])
				[DIARY_ITEMOWNERS:106]DIARY_CODE:1:=[DIARY:12]Diary_Code:3
				[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2:=ACC_al_aDiaryOwnerIDs{$_l_index}
				[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3:=1
				[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSNAME:4:="Diary Item Owner"
				DB_SaveRecord(->[DIARY_ITEMOWNERS:106])
			End for 
			UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
			UNLOAD RECORD:C212([DIARY:12])
			READ ONLY:C145([DIARY_ITEMOWNERS:106])
			READ ONLY:C145([DIARY:12])
		End if 
	End if 
End if 

If (ACC_l_CBLogToeMail=1)
	
	While (Semaphore:C143("InitEmail"))
		DelayTicks(2)
	End while 
	If (<>Email_bo_PersonInited=False:C215)
		LOGIN_SetEmail
	End if 
	CLEAR SEMAPHORE:C144("InitEmail")
	
	If (Size of array:C274(ACC_at_EMailAccountsUser)>0)
		Case of 
			: ($4=1)
				//fixed
				$_t_EmailText:="SYSTEM MESSAGE:"+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"Accounts balance "+$1+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"When checking this balance the sum of the transactions is not equal to"
				$_t_EmailText:=$_t_EmailText+" the balance on the account"
				$_t_EmailText:=$_t_EmailText+"The balance is "+String:C10($2)+" and the value of the transactions is "+String:C10($3)+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"This has been fixed"+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"This is provided for your information only"
			: ($4=-1)
				//not fixed
				$_t_EmailText:="SYSTEM MESSAGE:"+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"Accounts balance "+$1+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"When checking this balance the sum of the transactions is not equal to"
				$_t_EmailText:=$_t_EmailText+" the balance on the account"
				$_t_EmailText:=$_t_EmailText+"The balance is "+String:C10($2)+" and the value of the transactions is "+String:C10($3)+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"This has been NOT BEEN  fixed"+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"You should check the value of the account balance and correct any problems"
		End case 
		$_t_SentTo:="To"
		$_t_ErrorMessage:=$_t_EmailText
		EMAIL_t_SendCalledFrom:="ACC_ReportBalanceError"
		$_t_EmailID:=Email_Send(->$_t_SentTo; ->ACC_at_EMailAccountsUser; ->ACC_at_EMailAccounts; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook: Accounts Balance error"; ->$_t_Attach; ->$_t_EmailText; False:C215)
	End if 
End if 


ACC_l_errorDestination:=1  //file
If (ACC_l_errorDestination=1)
	If (Test path name:C476("Transactionerrs.txt")#Is a document:K24:1)
		$_ti_DocumentRef:=DB_CreateDocument("Transactionerrs.txt"; "TEXT")
		If (OK=1)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
		End if 
	End if 
	If ($_t_ErrorMessage="")
		Case of 
			: ($4=1)
				//fixed
				$_t_EmailText:="SYSTEM MESSAGE:"+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"Accounts balance "+$1+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"When checking this balance the sum of the transactions is not equal to"
				$_t_EmailText:=$_t_EmailText+" the balance on the account"
				$_t_EmailText:=$_t_EmailText+"The balance is "+String:C10($2)+" and the value of the transactions is "+String:C10($3)+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"This has been fixed"+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"This is provided for your information only"
			: ($4=-1)
				//not fixed
				$_t_EmailText:="SYSTEM MESSAGE:"+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"Accounts balance "+$1+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"When checking this balance the sum of the transactions is not equal to"
				$_t_EmailText:=$_t_EmailText+" the balance on the account"
				$_t_EmailText:=$_t_EmailText+"The balance is "+String:C10($2)+" and the value of the transactions is "+String:C10($3)+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"This has been NOT BEEN  fixed"+Char:C90(13)
				$_t_EmailText:=$_t_EmailText+"You should check the value of the account balance and correct any problems"
		End case 
		$_t_ErrorMessage:=$_t_EmailText
		
	End if 
	
	$_ti_DocumentRef:=Append document:C265("Transactionerrs.txt"; "TEXT")
	SEND PACKET:C103($_ti_DocumentRef; $_t_ErrorMessage+Char:C90(13))
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
End if 
ERR_MethodTrackerReturn("ACC_REPORTBALANCEERROR"; $_t_oldMethodName)
