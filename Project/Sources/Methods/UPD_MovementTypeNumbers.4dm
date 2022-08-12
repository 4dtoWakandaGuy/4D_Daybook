//%attributes = {}
If (False:C215)
	//Project Method Name:      UPD_MovementTypeNumbers
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
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	C_BOOLEAN:C305($_bo_Validation; $1)
	C_LONGINT:C283($_l_CurrentRevision; $_l_CurrentRow; $_l_ItemID; $_l_NextRevision; $_l_offset; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UPD_MovementTypeNumbers")
//NG June 2004
// The way that the multi-number file is assigned to Movement types is to change.
//First Check it

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
ERR_MethodTrackerReturn("UPD_MovementTypeNumbers"; $_t_oldMethodName)
