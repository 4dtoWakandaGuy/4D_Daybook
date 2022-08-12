//%attributes = {}
If (False:C215)
	//Project Method Name:      VER_UpdateRoutineValidation
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
	C_LONGINT:C283($_l_ItemID; $_l_offset; $_l_RevisionNumber; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_UpdateRoutineValidation")
If (False:C215)
	//NG Feb 2004
	//This method is used to update the stored preference record
	//INPUTS
	//$1=Offset(the array element)
	//$2=The revision number of the upda(default=1)
	//OUTPUTS
	//NONE
End if 
If (Count parameters:C259>=1)
	If (Count parameters:C259>=2)
		$_l_RevisionNumber:=$2
	Else 
		$_l_RevisionNumber:=1
	End if 
	While (Semaphore:C143("LoadingValidationPrefs"))
		DelayTicks(2)
	End while 
	READ WRITE:C146([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Validation Settings")
	$_l_offset:=0
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		VARIABLE TO BLOB:C532($_al_StoredUpdates; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
	Else 
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_StoredUpdates; $_l_offset)
		
	End if 
	If (Size of array:C274($_al_StoredUpdates)<$1)
		ARRAY LONGINT:C221($_al_StoredUpdates; $1)
	End if 
	CLEAR SEMAPHORE:C144("LoadingValidationPrefs")
	
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	
	$_al_StoredUpdates{$1}:=$_l_RevisionNumber
	VARIABLE TO BLOB:C532($_al_StoredUpdates; [PREFERENCES:116]DataBlob:2; *)
	SAVE RECORD:C53([PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	CLEAR SEMAPHORE:C144("LoadingValidationPrefs")
End if 
ERR_MethodTrackerReturn("VER_UpdateRoutineValidation"; $_t_oldMethodName)
