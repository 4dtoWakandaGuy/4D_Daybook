//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_ImplementClearedDate
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
	C_LONGINT:C283($_l_CurrentRevision; $_l_CurrentRow; $_l_InvoiceIndex; $_l_ItemID; $_l_NextRevision; $_l_offset; $_l_RecordCount; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("INV_ImplementClearedDate")
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
READ WRITE:C146([INVOICES:39])
If ($_bo_Validation)
	
	If ($_l_CurrentRevision<$_l_NextRevision)
		Open window:C153(40; 200; 300; 250; -1984)
		StartTransaction
		QUERY:C277([INVOICES:39]; [INVOICES:39]X_invoiceClearedDate:43=!00-00-00!; *)
		QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7=0)
		$_bo_Run:=True:C214
	End if 
	
Else 
	QUERY:C277([INVOICES:39]; [INVOICES:39]X_invoiceClearedDate:43=!00-00-00!; *)
	QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7=0)
	
	$_bo_Run:=True:C214
End if 
If (Not:C34(<>SYS_bo_SkipDateUpdates))
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[INVOICES:39])
		APPLY TO SELECTION:C70([INVOICES:39]; [INVOICES:39]X_invoiceClearedDate:43:=INV_CalcClearedDate)
		
		
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[INVOICES:39]))
	Else 
		$_l_RecordCount:=0
		FIRST RECORD:C50([INVOICES:39])
		For ($_l_InvoiceIndex; 1; Records in selection:C76([INVOICES:39]))
			[INVOICES:39]X_invoiceClearedDate:43:=INV_CalcClearedDate
			DB_SaveRecord(->[INVOICES:39])
			$_l_RecordCount:=$_l_RecordCount+1
			If ($_l_RecordCount>1000)
				If ($_bo_Validation)
					Transact_End
					StartTransaction
				End if 
				$_l_RecordCount:=0
			End if 
			
			NEXT RECORD:C51([INVOICES:39])
		End for 
	End if 
End if 
UNLOAD RECORD:C212([INVOICES:39])
READ ONLY:C145([INVOICES:39])

If ($_bo_Validation)
	CLOSE WINDOW:C154
	VER_UpdateRoutineValidation($_l_CurrentRow; $_l_NextRevision)
	Transact_End
End if 
ERR_MethodTrackerReturn("INV_ImplementClearedDate"; $_t_oldMethodName)