//%attributes = {}
If (False:C215)
	//Project Method Name:      MOD_UpdateButtonSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/02/2010 13:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	C_BOOLEAN:C305(<>SYS_bo_SkipDateUpdates; $_bo_Run; $_bo_Validation; $1)
	C_LONGINT:C283($_l_CurrentRevision; $_l_CurrentRow; $_l_Index; $_l_ItemID; $_l_NextRevision; $_l_offset; $_l_RecordCount; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MOD_UpdateButtonSettings")
//NG March 2008 a new feature is added to enable the user settings to display only the module icons they wish to see(even if they have access to other modules).
//By default of course all the icons are displayed which means the field has to be set to true
//An additional setting is also recorded to display text next to the icon. Although this is stored on each record at the moment this is set once for all icons, by storing this on each record we do have the option to change it to a per module setting

If (Count parameters:C259>=3)
	$_bo_Validation:=$1
	$_l_NextRevision:=$2
	$_l_CurrentRow:=$3
	READ ONLY:C145([PREFERENCES:116])
	
	While (Semaphore:C143("LoadingValidationPrefs"))
		DelayTicks(2)
	End while 
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

$_bo_Run:=False:C215
READ WRITE:C146([MODULES:63])
If ($_bo_Validation)
	
	
	
	StartTransaction
	ALL RECORDS:C47([MODULES:63])
	
	$_bo_Run:=True:C214
	
	
Else 
	ALL RECORDS:C47([MODULES:63])
	
	$_bo_Run:=True:C214
End if 
If (Not:C34(<>SYS_bo_SkipDateUpdates))
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[MODULES:63])
		APPLY TO SELECTION:C70([MODULES:63]; [MODULES:63]xDisplayIcon:5:=True:C214)
		APPLY TO SELECTION:C70([MODULES:63]; [MODULES:63]xDisplayIconText:6:=True:C214)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[MODULES:63]))
	Else 
		$_l_RecordCount:=0
		FIRST RECORD:C50([MODULES:63])
		For ($_l_Index; 1; Records in selection:C76([MODULES:63]))
			[MODULES:63]xDisplayIcon:5:=True:C214
			[MODULES:63]xDisplayIconText:6:=True:C214
			DB_SaveRecord(->[MODULES:63])
			$_l_RecordCount:=$_l_RecordCount+1
			If ($_l_RecordCount>1000)
				If ($_bo_Validation)
					Transact_End
					StartTransaction
				End if 
				$_l_RecordCount:=0
			End if 
			
			NEXT RECORD:C51([MODULES:63])
		End for 
	End if 
End if 

UNLOAD RECORD:C212([MODULES:63])
READ ONLY:C145([MODULES:63])

If ($_bo_Validation)
	CLOSE WINDOW:C154
	VER_UpdateRoutineValidation($_l_CurrentRow; $_l_NextRevision)
	Transact_End
End if 
ERR_MethodTrackerReturn("MOD_UpdateButtonSettings"; $_t_oldMethodName)
