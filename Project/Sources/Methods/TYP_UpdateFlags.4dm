//%attributes = {}

If (False:C215)
	//Project Method Name:      TYP_UpdateFlags
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/07/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN(UseAsCompanyType)
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	C_BOOLEAN:C305($_bo_Run; $_bo_Validation; $1)
	C_LONGINT:C283($_l_AllRecords; $_l_CompanyTypes; $_l_CurrentRevision; $_l_Element; $_l_ItemID; $_l_NextRevision; $_l_offset; $2; $3)
End if 
//Code Starts Here
If (Count parameters:C259>=3)
	$_bo_Validation:=$1
	$_l_NextRevision:=$2
	$_l_Element:=$3
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
		If (Size of array:C274($_al_StoredUpdates)>=$_l_Element)
			$_l_CurrentRevision:=$_al_StoredUpdates{$_l_Element}
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
	READ WRITE:C146([TYPES:5])
	ALL RECORDS:C47([TYPES:5])
	$_l_AllRecords:=Records in selection:C76([TYPES:5])
	APPLY TO SELECTION:C70([TYPES:5]; [TYPES:5]UseAsCompanyType:7:=True:C214)  //this is the default. This is a new thing so we can filter out some for address types 
	QUERY:C277([TYPES:5]; [TYPES:5]UseAsCompanyType:7=True:C214)
	$_l_CompanyTypes:=Records in selection:C76([TYPES:5])
	If ($_l_CompanyTypes=$_l_AllRecords)
		If ($_bo_Validation)
			VER_UpdateRoutineValidation($_l_Element; $_l_NextRevision)
			Transact_End
		End if 
	End if 
End if 
UNLOAD RECORD:C212([TYPES:5])
