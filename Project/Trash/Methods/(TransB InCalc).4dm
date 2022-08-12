//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      TransB InCalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/02/2010 16:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_BatchItemID;0)
	//ARRAY REAL(ACC_ar_BatchItemTotal;0)
	//ARRAY TEXT(ACC_at_BatchItemCreditAcc;0)
	//ARRAY TEXT(ACC_at_BatchItemDebitAcc;0)
	C_BOOLEAN:C305($1)
	C_LONGINT:C283($_l_Index)
	C_REAL:C285($_r_ZeroAmountCred; $_r_ZeroAmountDeb)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB InCalc")
//TransB InCalc
//Modified NG July 2004 to work with area list area

If (Count parameters:C259=0)
	If (DB_t_CurrentFormUsage2#"NBat")
		Menu_Record("TransB InCalc"; "Update Single-Sided Total")
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
		
		QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
		If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
			[TRANSACTION_BATCHES:30]Zero:13:=Gen_Round((0-Sum:C1([TRANSACTION_BATCH_ITEMS:155]Total:9)); 2; 2)
		Else 
			[TRANSACTION_BATCHES:30]Zero:13:=0
		End if 
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
		QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
		If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
			[TRANSACTION_BATCHES:30]Zero:13:=Gen_Round(([TRANSACTION_BATCHES:30]Zero:13+Sum:C1([TRANSACTION_BATCH_ITEMS:155]Total:9)); 2; 2)
		End if 
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
		
	End if 
Else 
	Case of 
		: ($1)  //Use area list area
			$_r_ZeroAmountDeb:=0
			$_r_ZeroAmountCred:=0
			For ($_l_Index; 1; Size of array:C274(ACC_al_BatchItemID))
				If (ACC_at_BatchItemDebitAcc{$_l_Index}#"")
					$_r_ZeroAmountDeb:=$_r_ZeroAmountDeb+(0-ACC_ar_BatchItemTotal{$_l_Index})
				End if 
				If (ACC_at_BatchItemCreditAcc{$_l_Index}#"")
					$_r_ZeroAmountCred:=$_r_ZeroAmountCred+(ACC_ar_BatchItemTotal{$_l_Index})
				End if 
			End for 
			[TRANSACTION_BATCHES:30]Zero:13:=$_r_ZeroAmountDeb+$_r_ZeroAmountCred
		Else 
			If (DB_t_CurrentFormUsage2#"NBat")
				Menu_Record("TransB InCalc"; "Update Single-Sided Total")
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
				
				QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
				If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
					[TRANSACTION_BATCHES:30]Zero:13:=Gen_Round((0-Sum:C1([TRANSACTION_BATCH_ITEMS:155]Total:9)); 2; 2)
				Else 
					[TRANSACTION_BATCHES:30]Zero:13:=0
				End if 
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
				
				QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
				If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
					[TRANSACTION_BATCHES:30]Zero:13:=Gen_Round(([TRANSACTION_BATCHES:30]Zero:13+Sum:C1([TRANSACTION_BATCH_ITEMS:155]Total:9)); 2; 2)
				End if 
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
				
			End if 
	End case 
End if 
ERR_MethodTrackerReturn("TransB InCalc"; $_t_oldMethodName)