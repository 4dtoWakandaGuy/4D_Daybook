//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_11Update
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
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	C_BOOLEAN:C305(<>noBalanceCheck; <>SYS_bo_SkipDateUpdates; <>TransactionDisableValidation; $_bo_CheckData; $1; ACC_bo_ReportPrefsLoaded)
	C_LONGINT:C283($_l_CurrentRevision; $_l_Element; $_l_Index; $_l_ItemID; $_l_NextRevision; $_l_offset; $_l_Process; $_l_RecordsCount; $_l_RecordsinSelection; $_l_Retries; $2)
	C_LONGINT:C283($3; ACC_l_CBConstantCheck)
	C_TEXT:C284($_t_oldMethodName; $_t_Unique_StringIdent)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_11Update")


If (False:C215)
	//NG Modified to interact with new updating routines
	//Optional paramters
	//$1/$_bo_CheckData If the update is not needed this is called with false so the valid
	//$2 /$_l_NextRevision the revision version to run
	//$3/$_l_Element the element of the array where this is stored.
End if 
DelayIfIndexing
If (Count parameters:C259>=1)
	$_bo_CheckData:=$1
	
Else 
	$_bo_CheckData:=True:C214
End if 
If (Count parameters:C259>=3)
	$_l_NextRevision:=$2
	$_l_Element:=$3
	$_t_oldMethodName:=ERR_MethodTracker("ACC_11Update"; 0; "$2="+String:C10(($2))+"$3="+String:C10(($2)))
	
	
Else 
	$_l_NextRevision:=2
	$_l_Element:=5
End if 

If ($_bo_CheckData)  //```
	$_l_Retries:=0
	While (Semaphore:C143("$LoadingValidationPrefs"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Validation Settings")
	If ($_l_ItemID>0)
		$_l_offset:=0
		ARRAY LONGINT:C221($_al_StoredUpdates; 0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		If (Records in selection:C76([PREFERENCES:116])>0)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_StoredUpdates; $_l_offset)
			UNLOAD RECORD:C212([PREFERENCES:116])
			If (Size of array:C274($_al_StoredUpdates)>=$_l_Element)
				$_l_CurrentRevision:=$_al_StoredUpdates{$_l_Element}
			Else 
				$_l_CurrentRevision:=0
			End if 
			
		Else 
			$_l_CurrentRevision:=0
		End if 
	Else 
		$_l_CurrentRevision:=0
	End if 
	CLEAR SEMAPHORE:C144("$LoadingValidationPrefs")
	
	StartTransaction
	If (Not:C34(<>SYS_bo_SkipDateUpdates))
		
		//$_l_TableNumber:=Current default table
		
		REDUCE SELECTION:C351([COMPANIES:2]; 0)
		//this routine needs to run to check account/balances have been set up for 1.1
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=0)
		If (Records in selection:C76([TRANSACTIONS:29])>0) | ($_l_CurrentRevision<$_l_NextRevision)
			
			Open window:C153(40; 200; 300; 250; -1984)
			MESSAGE:C88("Accounts System Updates")
			<>noBalanceCheck:=True:C214
			READ WRITE:C146([ACCOUNT_BALANCES:34])
			If ($_l_CurrentRevision>=$_l_NextRevision)
				QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8="")
			Else 
				ALL RECORDS:C47([ACCOUNT_BALANCES:34])
			End if 
			
			FIRST RECORD:C50([ACCOUNT_BALANCES:34])
			$_l_RecordsinSelection:=Records in selection:C76([ACCOUNT_BALANCES:34])
			$_l_RecordsCount:=0
			For ($_l_Index; 1; $_l_RecordsinSelection)
				$_l_RecordsCount:=$_l_RecordsCount+1
				ERASE WINDOW:C160
				MESSAGE:C88("Updating Account balance identifier "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection))
				$_t_Unique_StringIdent:=ACC_Buildunique([ACCOUNT_BALANCES:34]Account_Code:2; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
				If ($_t_Unique_StringIdent#[ACCOUNT_BALANCES:34]Unique_StringIdent:8)
					$_l_RecordsCount:=$_l_RecordsCount+1
					[ACCOUNT_BALANCES:34]Unique_StringIdent:8:=""
					DB_SaveRecord(->[ACCOUNT_BALANCES:34])
					AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
				End if 
				NEXT RECORD:C51([ACCOUNT_BALANCES:34])
				If ($_l_RecordsCount>1000)
					Transact_End
					StartTransaction
					
					$_l_RecordsCount:=0
				End if 
			End for 
			<>noBalanceCheck:=False:C215
			REDUCE SELECTION:C351([ACCOUNT_BALANCES:34]; 0)
			UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
			CLOSE WINDOW:C154
		End if 
		If ($_l_CurrentRevision<$_l_NextRevision)
			ALL RECORDS:C47([TRANSACTIONS:29])
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28="")
		End if 
		
		If (Records in selection:C76([TRANSACTIONS:29])>0)
			Open window:C153(40; 200; 200; 300; -1984)
			$_l_Retries:=0
			While (Semaphore:C143("TRANSACTIONUPDATE"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*(1+$_l_Retries))
			End while 
			<>TransactionDisableValidation:=True:C214
			SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
			READ WRITE:C146([TRANSACTIONS:29])
			If ($_l_CurrentRevision<$_l_NextRevision)
				ALL RECORDS:C47([TRANSACTIONS:29])
			Else 
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28="")
			End if 
			
			FIRST RECORD:C50([TRANSACTIONS:29])
			$_l_RecordsinSelection:=Records in selection:C76([TRANSACTIONS:29])
			$_l_RecordsCount:=0
			For ($_l_Index; 1; $_l_RecordsinSelection)
				$_l_RecordsCount:=$_l_RecordsCount+1
				ERASE WINDOW:C160
				MESSAGE:C88("Updating Transaction Account identifier "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection))
				$_t_Unique_StringIdent:=ACC_Buildunique([TRANSACTIONS:29]Account_Code:3; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
				$_l_Retries:=0
				While (Semaphore:C143("UpdateTransaction"+[TRANSACTIONS:29]Account_Code:3))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*(1+$_l_Retries))
				End while 
				If ($_t_Unique_StringIdent#[TRANSACTIONS:29]Unique_StringIdent:28)
					//MESSAGE("Updating Transaction Account identifier "+String($_l_Index)+" of "+String($_l_RecordsinSelection))
					[TRANSACTIONS:29]Unique_StringIdent:28:=ACC_Buildunique([TRANSACTIONS:29]Account_Code:3; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
					[TRANSACTIONS:29]Unique_StringIdentTAX:29:=TRANS_BuildUniqueTAX
					DB_SaveRecord(->[TRANSACTIONS:29])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
				End if 
				CLEAR SEMAPHORE:C144("UpdateTransaction"+[TRANSACTIONS:29]Account_Code:3)
				
				If ($_l_RecordsCount>1000)
					
					Transact_End
					StartTransaction
					
					$_l_RecordsCount:=0
				End if 
				NEXT RECORD:C51([TRANSACTIONS:29])
			End for 
			<>TransactionDisableValidation:=False:C215
			SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
			CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
			REDUCE SELECTION:C351([TRANSACTIONS:29]; 0)
			UNLOAD RECORD:C212([TRANSACTIONS:29])
		End if 
	End if 
	If ($_l_CurrentRevision<$_l_NextRevision)
		//well its just been updated
		VER_UpdateRoutineValidation($_l_Element; $_l_NextRevision)
		
		
	End if 
	
	Transact_End
	
End if 

If (Not:C34(ACC_bo_ReportPrefsLoaded))
	ACC_ReportingPrefs
End if 
If (ACC_l_CBConstantCheck=1)
	//run constant check
	If (False:C215)
		$_l_Process:=Execute on server:C373("ACC_FullValidation"; 64000; "Validating Transactions "; ACC_l_CBConstantCheck)
	End if 
	If (ACC_l_CBConstantCheck=1)
		//run constant check
		ACC_FullValidation(ACC_l_CBConstantCheck)
	End if 
	
	
	
	
End if 
ERR_MethodTrackerReturn("ACC_11Update"; $_t_oldMethodName)
