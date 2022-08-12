//%attributes = {}
If (False:C215)
	//Project Method Name:      UPD_ContactSoundex
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/02/2010 11:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	C_BOOLEAN:C305(<>SYS_bo_SkipDateUpdates; $_bo_Run; $_bo_Validation; $1)
	C_LONGINT:C283($_l_CurrentRevision; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_index; $_l_ItemID; $_l_NextRevision; $_l_offset; $_l_RecordCount; $2; $3; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $_t_Soundex; $_t_Soundex2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UPD_ContactSoundex")
If (Count parameters:C259>=3)
	$_bo_Validation:=$1
	$_l_NextRevision:=$2
	$_l_CurrentRow:=$3
	While (Semaphore:C143("LoadingValidationPrefs"))
		DelayTicks(2)
	End while 
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Validation Settings")
	$_l_offset:=0
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])>0)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_StoredUpdates; $_l_offset)
		UNLOAD RECORD:C212([PREFERENCES:116])
		If (Size of array:C274($_al_StoredUpdates)>=$_l_CurrentRow)
			$_l_CurrentRevision:=$_al_StoredUpdates{$_l_CurrentRow}
		Else 
			$_l_CurrentRevision:=0
		End if 
		
	Else 
		$_l_CurrentRevision:=0
	End if 
	CLEAR SEMAPHORE:C144("LoadingValidationPrefs")
	
Else 
	$_bo_Validation:=False:C215
	$_l_NextRevision:=0
	$_l_CurrentRow:=0
End if 
//Now we build a soundex of that
$_bo_Run:=False:C215
READ WRITE:C146([CONTACTS:1])
If ($_bo_Validation)
	
	If ($_l_CurrentRevision<$_l_NextRevision)
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(40; 200; 300; 250; -1984)
		StartTransaction
		ALL RECORDS:C47([CONTACTS:1])
		$_bo_Run:=True:C214
	End if 
	
Else 
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Soundex:37="")
	$_bo_Run:=True:C214
End if 
If (Not:C34(<>SYS_bo_SkipDateUpdates))
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[CONTACTS:1])
		APPLY TO SELECTION:C70([CONTACTS:1]; [CONTACTS:1]Soundex:37:=DB_BuildSoundex(DB_ContactNameClean([CONTACTS:1]Surname:5)))
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[CONTACTS:1]))
	Else 
		
		$_l_RecordCount:=0
		FIRST RECORD:C50([CONTACTS:1])
		For ($_l_index; 1; Records in selection:C76([CONTACTS:1]))
			
			$_t_Soundex:=[CONTACTS:1]Soundex:37
			$_t_Soundex2:=DB_BuildSoundex(DB_ContactNameClean([CONTACTS:1]Surname:5))
			If ($_t_Soundex#$_t_Soundex2)  //It has changed
				$_l_RecordCount:=$_l_RecordCount+1
				[CONTACTS:1]Soundex:37:=$_t_Soundex2
				DB_SaveRecord(->[CONTACTS:1])
				AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
			End if 
			If ($_l_RecordCount>1000)
				If ($_bo_Validation)
					Transact_End
					StartTransaction
				End if 
				$_l_RecordCount:=0
			End if 
			
			NEXT RECORD:C51([CONTACTS:1])
		End for 
	End if 
End if 
UNLOAD RECORD:C212([CONTACTS:1])
READ ONLY:C145([CONTACTS:1])
If ($_bo_Validation)
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	VER_UpdateRoutineValidation($_l_CurrentRow; $_l_NextRevision)
	Transact_End
End if 
ERR_MethodTrackerReturn("UPD_ContactSoundex"; $_t_oldMethodName)
