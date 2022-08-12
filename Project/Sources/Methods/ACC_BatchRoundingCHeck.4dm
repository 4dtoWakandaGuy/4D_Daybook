//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BatchRoundingCHeck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 12:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Update; $_bo_Update1)
	C_LONGINT:C283($_l_Index; $_l_Index2; DS_l_BATCHITEMRef)
	C_REAL:C285($_r_Amount; $_r_AmountRND; $_r_TaxAmount; $_r_TaxAmountRND; $_r_Total; $_r_TotalRND)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BatchRoundingCHeck")
READ WRITE:C146([TRANSACTION_BATCHES:30])
ALL RECORDS:C47([TRANSACTION_BATCHES:30])
Open window:C153(40; 40; 400; 200; 1)
FIRST RECORD:C50([TRANSACTION_BATCHES:30])
For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
	
	$_bo_Update:=False:C215
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
	
	
	FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
	For ($_l_Index2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
		ERASE WINDOW:C160
		
		MESSAGE:C88("Checking Batch"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+" Item "+String:C10($_l_Index2)+" of "+String:C10(Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])))
		
		$_bo_Update1:=False:C215
		$_r_Amount:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
		$_r_TaxAmount:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
		$_r_Total:=[TRANSACTION_BATCH_ITEMS:155]Total:9
		$_r_AmountRND:=Round:C94($_r_Amount; 2)
		$_r_TaxAmountRND:=Round:C94($_r_TaxAmount; 2)
		$_r_TotalRND:=Round:C94($_r_Total; 2)
		If ($_r_AmountRND#$_r_Amount)
			[TRANSACTION_BATCH_ITEMS:155]Amount:6:=$_r_AmountRND
			$_bo_Update1:=True:C214
		End if 
		If ($_r_TaxAmountRND#$_r_TaxAmount)
			[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=$_r_TaxAmountRND
			$_bo_Update1:=True:C214
		End if 
		If ($_bo_Update1)
			[TRANSACTION_BATCH_ITEMS:155]Total:9:=[TRANSACTION_BATCH_ITEMS:155]Amount:6+[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
			$_bo_Update:=True:C214
		Else 
			If ($_r_TotalRND#$_r_Total)
				[TRANSACTION_BATCH_ITEMS:155]Total:9:=[TRANSACTION_BATCH_ITEMS:155]Amount:6+[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
				$_bo_Update:=True:C214
			End if 
		End if 
		If ($_bo_Update)
			If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
				[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
			End if 
			DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			$_bo_Update:=False:C215
			$_bo_Update1:=False:C215
		End if 
		NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
	End for 
	If ($_bo_Update)
		[TRANSACTION_BATCHES:30]Zero:13:=Gen_Round((0-Sum:C1([TRANSACTION_BATCH_ITEMS:155]Total:9)); 2; 2)
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])
	End if 
	
	NEXT RECORD:C51([TRANSACTION_BATCHES:30])
End for 

CLOSE WINDOW:C154
ERR_MethodTrackerReturn("ACC_BatchRoundingCHeck"; $_t_oldMethodName)
