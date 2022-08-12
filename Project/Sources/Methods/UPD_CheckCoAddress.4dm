//%attributes = {}
If (False:C215)
	//Project Method Name:      UPD_CheckCoAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/02/2010 10:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	C_BOOLEAN:C305(<>SYS_bo_SkipDateUpdates; $_bo_Run; $_bo_Validation; $1)
	C_LONGINT:C283($_l_CurrentRevision; $_l_CurrentWinRefOLD; $_l_index; $_l_ItemID; $_l_NextRevision; $_l_offset; $_l_RecordCount; $_l_Row; $2; $3; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_Address; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UPD_CheckCoAddress")

If (Count parameters:C259>=3)
	
	$_bo_Validation:=$1
	$_l_NextRevision:=$2
	$_l_Row:=$3
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
		If (Size of array:C274($_al_StoredUpdates)>=$_l_Row)
			$_l_CurrentRevision:=$_al_StoredUpdates{$_l_Row}
		Else 
			$_l_CurrentRevision:=0
		End if 
		
	Else 
		$_l_CurrentRevision:=0
	End if 
	CLEAR SEMAPHORE:C144("LoadingValidationPrefs")
	
Else 
	$_bo_Validation:=False:C215
End if 
If ($_bo_Validation)
	If ($_l_CurrentRevision<$_l_NextRevision)
		StartTransaction
		$_bo_Run:=True:C214
	End if 
	
Else 
	$_bo_Run:=True:C214
End if 
If ($_bo_Run)
	MESSAGES OFF:C175
	If ($_bo_Validation)
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(40; 200; 300; 250; -1984)
		ALL RECORDS:C47([COMPANIES:2])
	Else 
		
		READ WRITE:C146([COMPANIES:2])
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]ADDRESS:60="")
	End if 
	
	//bsw 13/01/04
	If (Not:C34(<>SYS_bo_SkipDateUpdates))
		If (Records in selection:C76([COMPANIES:2])>0)
			
			
			FIRST RECORD:C50([COMPANIES:2])
			$_l_RecordCount:=0
			For ($_l_index; 1; Records in selection:C76([COMPANIES:2]))
				$_l_RecordCount:=$_l_RecordCount+1
				ERASE WINDOW:C160
				MESSAGE:C88("Updating Record"+String:C10($_l_index)+" of "+String:C10(Records in selection:C76([COMPANIES:2])))
				$_t_Address:=WS_BUILDADDRESS
				If ($_t_Address#[COMPANIES:2]ADDRESS:60)
					[COMPANIES:2]ADDRESS:60:=$_t_Address
					DB_SaveRecord(->[COMPANIES:2])
					AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
				End if 
				If ($_l_RecordCount>1000)
					If ($_bo_Validation)
						Transact_End
						StartTransaction
					End if 
					$_l_RecordCount:=0
				End if 
				
				NEXT RECORD:C51([COMPANIES:2])
			End for 
			
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			
			
		End if 
	End if 
	READ ONLY:C145([COMPANIES:2])
	If ($_bo_Validation)
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		VER_UpdateRoutineValidation($_l_Row; $_l_NextRevision)
		Transact_End
	End if 
	
	
End if 
ERR_MethodTrackerReturn("UPD_CheckCoAddress"; $_t_oldMethodName)
