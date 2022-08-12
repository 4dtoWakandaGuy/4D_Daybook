//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_TransferTaxDate
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
	C_LONGINT:C283($_l_CurrentRevision; $_l_CurrentRow; $_l_Index; $_l_ItemID; $_l_NextRevision; $_l_offset; $_l_RecordCount; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("SI_TransferTaxDate")
//BSW Sept 2004
//If SI_Transfer didn't save tax point date so this routine does it

If (Count parameters:C259>=3)
	$_bo_Validation:=$1
	$_l_NextRevision:=$2
	$_l_CurrentRow:=$3
	READ ONLY:C145([PREFERENCES:116])
	
	$_l_ItemID:=PREF_GetPreferenceID("SI Allocation Tax Date")
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
Else 
	$_bo_Validation:=False:C215
	$_l_NextRevision:=0
	$_l_CurrentRow:=0
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
	If (Not:C34(<>SYS_bo_SkipDateUpdates))
		READ WRITE:C146([XInvoiceAllocation:126])
		QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xTaxPointDate:8=!00-00-00!)
		FIRST RECORD:C50([XInvoiceAllocation:126])
		$_l_RecordCount:=0
		For ($_l_Index; 1; Records in selection:C76([XInvoiceAllocation:126]))
			$_l_RecordCount:=$_l_RecordCount+1
			If ($_l_RecordCount>1000)
				If ($_bo_Validation)
					Transact_End
					StartTransaction
				End if 
				$_l_RecordCount:=0
			End if 
			If ([XInvoiceAllocation:126]xTaxPointDate:8=!00-00-00!) | ([XInvoiceAllocation:126]XPeriodCode:9="")
				If ([XInvoiceAllocation:126]xAllocationDate:6#!00-00-00!)
					$_l_RecordCount:=$_l_RecordCount+1
					SI_SetTaxPoint
					DB_SaveRecord(->[XInvoiceAllocation:126])
				End if 
			End if 
			NEXT RECORD:C51([XInvoiceAllocation:126])
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
		VER_UpdateRoutineValidation($_l_CurrentRow; $_l_NextRevision)
		Transact_End
	End if 
End if 
ERR_MethodTrackerReturn("SI_TransferTaxDate"; $_t_oldMethodName)
