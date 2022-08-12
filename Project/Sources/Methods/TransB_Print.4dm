//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_Print
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 15:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_BatchItemDelete;0)
	//ARRAY LONGINT(ACC_al_BatchItemID;0)
	C_BOOLEAN:C305($_bo_noSave; BAT_bo_UseAreaList)
	C_LONGINT:C283($_l_SizeofArray; $_l_SizeofArray2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_Print")
$_bo_noSave:=False:C215
If ([TRANSACTION_BATCHES:30]State:15=0)
	If (BAT_bo_UseAreaList)
		$_l_SizeofArray:=Size of array:C274(ACC_al_BatchItemID)
		$_l_SizeofArray2:=Size of array:C274(ACC_al_BatchItemDelete)
		If ($_l_SizeofArray=0) & ($_l_SizeofArray2=0)
			//nothing to save?
			$_bo_noSave:=True:C214
		End if 
	Else 
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
		
		If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])=0)
			$_bo_noSave:=True:C214
		End if 
	End if 
End if 
If ($_bo_noSave=False:C215)
	If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
		BatchNo
	End if 
	If ((OK=1) & ([TRANSACTION_BATCHES:30]Batch_Number:10#0))
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])  // For safety
		If (BAT_bo_UseAreaList)
			ACC_BatchCreateItems
		End if 
		
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])
	End if 
End if 
TransB_InCalc

Menu_Record("TransB_Print"; "Print Transaction Batch")
FORM SET OUTPUT:C54([TRANSACTION_BATCHES:30]; "TransB_Print")
PRINT RECORD:C71([TRANSACTION_BATCHES:30])

FORM SET OUTPUT:C54([TRANSACTION_BATCHES:30]; "TransB_Out")
ERR_MethodTrackerReturn("TransB_Print"; $_t_oldMethodName)
