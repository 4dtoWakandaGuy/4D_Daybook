//%attributes = {}
If (False:C215)
	//Project Method Name:      STOCK_itemsUpdate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2010 23:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	C_BOOLEAN:C305(<>SYS_bo_SkipDateUpdates; $_bo_Run; $_bo_Validation; $1)
	C_LONGINT:C283($_l_CurrentRevision; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_ItemID; $_l_MovementItemsIndex; $_l_NextRevision; $_l_offset; $_l_RecordCount; $_l_StockMovementID; $_l_Unique; $2)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285($3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("STOCK_itemsUpdate")
//this method just checks there are no stock items with an ID of 0
If (False:C215)
	//Updated NG Feb 2004
	//this allow parameters to be called
	//whcih use the new update  validation routines to check the item is done
	//Parameters
	//$1 /$_bo_Validation Identifies if the updates are to run
	//$2/$_l_NextRevision Identifies the code revision that this is
	//$3/$_l_CurrentRow identifies which element in the arrays this refers to
	//NOTE the updates are done in a
End if 
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
$_bo_Run:=False:C215
If ($_bo_Validation)
	
	If ($_l_CurrentRevision<$_l_NextRevision)
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(40; 200; 300; 250; -1984)
		StartTransaction
		ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
		$_bo_Run:=True:C214
	End if 
	
Else 
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
	CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "ToFix1")
	ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
	CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "ProblemIDs")
	For ($_l_MovementItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		$_l_StockMovementID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
		SET QUERY DESTINATION:C396(3; $_l_Unique)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockMovementID)
		If ($_l_Unique>1)
			ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "ProblemIDs")
		End if 
		SET QUERY DESTINATION:C396(0)
		
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
	End for 
	UNION:C120("ProblemIDs"; "ToFix1"; "ToFix1")
	USE SET:C118("toFix1")
	CLEAR SET:C117("ProblemIDs")
	CLEAR SET:C117("ToFix1")
	
	$_bo_Run:=True:C214
End if 
If ($_bo_Run)
	If (Not:C34(<>SYS_bo_SkipDateUpdates))
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
			LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
			$_l_RecordCount:=0
			For ($_l_MovementItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
					$_l_RecordCount:=$_l_RecordCount+1
					ERASE WINDOW:C160
					MESSAGE:C88("Updating Stock Item Record"+String:C10($_l_MovementItemsIndex)+" of "+String:C10(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])))
					
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					
					
					If ($_l_RecordCount>1000)
						If ($_bo_Validation)
							Transact_End
							StartTransaction
						End if 
						$_l_RecordCount:=0
					End if 
				End if 
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				
			End for 
			
			
		End if 
	End if 
	If ($_bo_Validation)
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		VER_UpdateRoutineValidation($_l_CurrentRow; $_l_NextRevision)
		Transact_End
	End if 
	
End if 
ERR_MethodTrackerReturn("STOCK_itemsUpdate"; $_t_oldMethodName)
