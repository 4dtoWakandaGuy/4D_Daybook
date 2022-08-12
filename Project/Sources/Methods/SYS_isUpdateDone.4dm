//%attributes = {}

If (False:C215)
	//Project Method Name:      SYS_isUpdateDone
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
	//C_UNKNOWN($0)
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	C_BOOLEAN:C305($_bo_Validation)
	C_LONGINT:C283($_l_CurrentRevision; $_l_Element; $_l_ItemID; $_l_NextRevision; $_l_Offset; $_l_Retries; $1; $2)
End if 
//Code Starts Here
//$_bo_Validation:=$1
$_l_NextRevision:=$1
$_l_Element:=$2
$_l_Retries:=0
$0:=False:C215

While (Semaphore:C143("LoadingValidationPrefs"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks($_l_Retries*2)
End while 
READ ONLY:C145([PREFERENCES:116])

$_l_ItemID:=PREF_GetPreferenceID("Validation Settings")
If ($_l_ItemID>0)
	$_l_Offset:=0
	
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])>0)
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_StoredUpdates; $_l_Offset)
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
	//$_bo_Validation:=False
	$_l_NextRevision:=0
	$_l_Element:=0
End if 
If ($_l_CurrentRevision>=$1)
	$0:=True:C214
End if 

CLEAR SEMAPHORE:C144("LoadingValidationPrefs")

