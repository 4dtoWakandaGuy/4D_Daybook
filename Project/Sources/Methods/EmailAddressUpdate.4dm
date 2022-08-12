//%attributes = {}
If (False:C215)
	//Project Method Name:      EmailAddressUpdate
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
	C_LONGINT:C283($_l_CurrentRevision; $_l_Index; $_l_ItemID; $_l_NextRevision; $_l_offset; $_l_RecordCount; $_l_Row; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_Search)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("EmailAddressUpdate")
// EmailAddressUpdate
// 01/09/03 pb
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
		
		$_bo_Run:=True:C214
	End if 
	
Else 
	$_bo_Run:=True:C214
End if 

If ($_bo_Run)
	If (Not:C34(<>SYS_bo_SkipDateUpdates))
		If ($_bo_Validation)
			Open window:C153(40; 200; 300; 250; -1984)
			StartTransaction
			READ WRITE:C146([CONTACTS:1])
			ALL RECORDS:C47([CONTACTS:1])
			$_l_Index:=-1
		Else 
			READ ONLY:C145(*)
			READ WRITE:C146([CONTACTS:1])
			$_t_Search:="@.@"
			$_l_Index:=Find in field:C653([CONTACTS:1]Email_Address:35; $_t_Search)
		End if 
		
		If ($_l_Index=-1)
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]EMail_After_At:24#"")
			$_l_RecordCount:=0
			For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
				
				ERASE WINDOW:C160
				MESSAGE:C88("Updating Record"+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([CONTACTS:1])))
				
				If ([CONTACTS:1]EMail_After_At:24#"") & ([CONTACTS:1]Email_Before_At:30#"") & ([CONTACTS:1]Email_Address:35#([CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24))
					[CONTACTS:1]Email_Address:35:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
					$_l_RecordCount:=$_l_RecordCount+1
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
		VER_UpdateRoutineValidation($_l_Row; $_l_NextRevision)
		Transact_End
	End if 
	
	
End if 
ERR_MethodTrackerReturn("EmailAddressUpdate"; $_t_oldMethodName)