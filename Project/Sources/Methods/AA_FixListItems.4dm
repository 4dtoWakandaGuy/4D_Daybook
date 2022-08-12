//%attributes = {}

If (False:C215)
	//Database Method Name:      AA_FixListItems
	//------------------ Method Notes ------------------
	
	//Updated NG Feb 2004
	//this allow parameters to be called
	//whcih use the new update  validation routines to check the item is done
	//Parameters
	//$1 /$_bo_Validation Identifies if the updates are to run
	//$2/$_l_NextRevision Identifies the code revision that this is
	//$3/$_l_Element identifies which element in the arrays this refers to
	// NOTE the updates are done in a transaction
	
	//------------------ Revision Control ----------------
	//Date Created:  13/07/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ListIDS; 0)
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	C_BOOLEAN:C305(<>SYS_bo_SkipDateUpdates; $_bo_Run; $_bo_Validation; $1)
	C_LONGINT:C283($_l_CurrentRevision; $_l_Element; $_l_Index; $_l_Index2; $_l_ItemID; $_l_NextRevision; $_l_Offset; $_l_RecordCount; $_l_RepeatedIDPosition; $_l_Retries; $2)
	C_LONGINT:C283($3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here




$_t_oldMethodName:=ERR_MethodTracker("AA_FixListItems")


If (Count parameters:C259>=3)
	
	$_bo_Validation:=$1
	$_l_NextRevision:=$2
	$_l_Element:=$3
	$_l_Retries:=0
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
		$_bo_Validation:=False:C215
		$_l_NextRevision:=0
		$_l_Element:=0
	End if 
	CLEAR SEMAPHORE:C144("LoadingValidationPrefs")
	
Else 
	$_bo_Validation:=False:C215
	$_l_NextRevision:=0
	$_l_Element:=0
End if 
$_bo_Run:=False:C215
If ($_bo_Validation)
	Open window:C153(40; 200; 300; 250; -1984)
	If ($_l_CurrentRevision<$_l_NextRevision)
		StartTransaction
		ALL RECORDS:C47([LIST_ITEMS:95])
		$_bo_Run:=True:C214
	End if 
	
Else 
	ALL RECORDS:C47([LIST_ITEMS:95])
	$_bo_Run:=True:C214
End if 
If ($_bo_Run)
	If (Not:C34(<>SYS_bo_SkipDateUpdates))
		
		ARRAY LONGINT:C221($_al_ListIDS; 0)
		SELECTION TO ARRAY:C260([LIST_ITEMS:95]X_ID:3; $_al_ListIDS)
		SORT ARRAY:C229($_al_ListIDS; >)
		$_l_RecordCount:=0
		For ($_l_Index; 1; Size of array:C274($_al_ListIDS))
			$_l_RecordCount:=$_l_RecordCount+1
			$_l_RepeatedIDPosition:=Find in array:C230($_al_ListIDS; $_al_ListIDS{$_l_Index}; $_l_Index+1)
			If ($_l_RepeatedIDPosition>0)
				
				
				READ WRITE:C146([LIST_ITEMS:95])
				
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_al_ListIDS{$_l_Index})
				
				FIRST RECORD:C50([LIST_ITEMS:95])
				NEXT RECORD:C51([LIST_ITEMS:95])
				
				For ($_l_Index2; 2; Records in selection:C76([LIST_ITEMS:95]))
					$_l_RecordCount:=$_l_RecordCount+1
					ERASE WINDOW:C160
					MESSAGE:C88("Updating List item Record"+String:C10($_l_Index2)+" of "+String:C10(Records in selection:C76([LIST_ITEMS:95])))
					
					[LIST_ITEMS:95]X_ID:3:=AA_GetNextIDinMethod(->[LIST_ITEMS:95]X_ID:3)
					DB_SaveRecord(->[LIST_ITEMS:95])
					AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
					NEXT RECORD:C51([LIST_ITEMS:95])
				End for 
				
				$_l_Index:=$_l_Index+($_l_Index2-1)
				
			End if 
			If ($_l_RecordCount>1000)
				If ($_bo_Validation)
					Transact_End
					StartTransaction
				End if 
				$_l_RecordCount:=0
			End if 
		End for 
	End if 
	If ($_bo_Validation)
		CLOSE WINDOW:C154
		VER_UpdateRoutineValidation($_l_Element; $_l_NextRevision)
		
		Transact_End
		
	End if 
End if 
ERR_MethodTrackerReturn("AA_FixListItems"; $_t_oldMethodName)
