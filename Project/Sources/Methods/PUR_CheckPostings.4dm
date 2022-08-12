//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_CheckPostings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 13:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchCodes; 0)
	//ARRAY LONGINT(ACC_al_Batches;0)
	ARRAY REAL:C219($_ar_AccountBalances; 0)
	ARRAY TEXT:C222($_at_accountReferences; 0)
	C_BOOLEAN:C305($_bo_BatchChecked; $_bo_FoundAllocation)
	C_LONGINT:C283($_l_BatchCount; $_l_Index; $_l_Index2; $_l_Index3; $_l_Index4; $_l_SkipItems; $_l_TransactionIndex; DS_l_BATCHITEMRef)
	C_REAL:C285($_r_Amount; $_r_TaxAmount; $_r_TotalAllocationAmounts)
	C_TEXT:C284($_t_AnalysisCode; $_t_CreditAccount; $_t_CurrencyCode; $_t_DebitAccount; $_t_oldMethodName; $_t_PeriodCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_CheckPostings")
//The method is to check the postings
//The real problem is that TRANS IN on the Payment side refers back to the PI on original invoice NOT the Payment

//Purchase state=-2 are ok
//its the -3 that are a problem
ARRAY TEXT:C222($_at_accountReferences; 0)
ARRAY REAL:C219($_ar_AccountBalances; 0)

ALL RECORDS:C47([PURCHASE_INVOICES:37])
QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-3)
For ($_l_Index; 1; Records in selection:C76([PURCHASE_INVOICES:37]))
	QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
	
	FIRST RECORD:C50([PURCHASE_INVOICE_ALLOCATIONS:159])
	$_t_AnalysisCode:=[PURCHASE_INVOICES:37]Analysis_Code:15
	$_t_CurrencyCode:=[PURCHASE_INVOICES:37]Currency_Code:23
	$_t_PeriodCode:=[PURCHASE_INVOICES:37]Period_Code:3
	$_r_Amount:=[PURCHASE_INVOICES:37]Total_Paid:8
	//CHECK ALLOCATIONS=PAID AMOUNT
	$_r_TotalAllocationAmounts:=0
	For ($_l_Index2; 1; Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159]))
		$_r_TotalAllocationAmounts:=$_r_TotalAllocationAmounts+[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2
		
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22=[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1)
		SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchCodes)
		QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchCodes)
		
		If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
			CREATE SET:C116([TRANSACTION_BATCHES:30]; "$TRANSINTEMP")
			FIRST RECORD:C50([TRANSACTION_BATCHES:30])
			$_bo_FoundAllocation:=False:C215
			For ($_l_Index3; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
				USE SET:C118("$TRANSINTEMP")
				GOTO SELECTED RECORD:C245([TRANSACTION_BATCHES:30]; $_l_Index3)
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
				
				FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
				For ($_l_Index4; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
					
					$_r_Amount:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
					$_r_TaxAmount:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
					$_t_DebitAccount:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
					$_t_CreditAccount:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
					If ($_r_Amount=[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2) & ([PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Invoice_Number:4=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17)
						$_bo_FoundAllocation:=True:C214
						If ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2#$_t_AnalysisCode)
							//ANALYSIS DOES NOT MATCH
						End if 
						If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
							[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
						End if 
						DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
						DB_SaveRecord(->[TRANSACTION_BATCHES:30])
						
						If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26=0) & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
							$_l_BatchCount:=Record number:C243([TRANSACTION_BATCHES:30])
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10)
							CREATE SET:C116([TRANSACTIONS:29]; "$TEMP")
							For ($_l_TransactionIndex; 1; Records in set:C195("$TEMP"))
								ARRAY LONGINT:C221(ACC_al_Batches; 0)
								USE SET:C118("$TEMP")
								GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_TransactionIndex)
								$_bo_BatchChecked:=ACC_TransValidateBatch([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTION_BATCHES:30]Batch_Number:10)
							End for 
							GOTO RECORD:C242([TRANSACTION_BATCHES:30]; $_l_BatchCount)
							QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
							
							FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
							For ($_l_SkipItems; 1; $_l_Index4-1)
								NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
							End for 
							
						End if 
						If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27=0) & ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
							$_l_BatchCount:=Record number:C243([TRANSACTION_BATCHES:30])
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10)
							CREATE SET:C116([TRANSACTIONS:29]; "$TEMP")
							For ($_l_TransactionIndex; 1; Records in set:C195("$TEMP"))
								ARRAY LONGINT:C221(ACC_al_Batches; 0)
								USE SET:C118("$TEMP")
								GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_TransactionIndex)
								ACC_TransValidateBatch([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTION_BATCHES:30]Batch_Number:10)
								
							End for 
							GOTO RECORD:C242([TRANSACTION_BATCHES:30]; $_l_BatchCount)
							QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
							
							FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
							For ($_l_SkipItems; 1; $_l_Index4-1)
								NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
							End for 
							
						End if 
						
						If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26#0)
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26)
						Else 
							
							If ($_t_CreditAccount#"")
								QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; *)
								QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10)
								CREATE SET:C116([TRANSACTIONS:29]; "$TEMP")
								For ($_l_TransactionIndex; 1; Records in set:C195("$TEMP"))
									ARRAY LONGINT:C221(ACC_al_Batches; 0)
									USE SET:C118("$TEMP")
									GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_TransactionIndex)
									ACC_TransValidateBatch([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTION_BATCHES:30]Batch_Number:10)
									
								End for 
								GOTO RECORD:C242([TRANSACTION_BATCHES:30]; $_l_BatchCount)
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
								
								FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
								For ($_l_SkipItems; 1; $_l_Index4-1)
									NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
								End for 
								
								
								QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]x_OneBatchItemID:3=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
								
							End if 
							
						End if 
						If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27#0)
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27)
						Else 
							If ($_t_DebitAccount#"")
								QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]x_OneBatchItemID:3=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
								
							End if 
							
						End if 
					End if 
					
					NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
					If ($_bo_FoundAllocation)
						$_l_Index4:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])
						
					End if 
					
				End for 
				NEXT RECORD:C51([TRANSACTION_BATCHES:30])
				If ($_bo_FoundAllocation)
					$_l_Index3:=Records in selection:C76([TRANSACTION_BATCHES:30])
				End if 
			End for 
			
		Else 
			// it is not posted yet?
		End if 
		NEXT RECORD:C51([PURCHASE_INVOICE_ALLOCATIONS:159])
	End for 
	
	NEXT RECORD:C51([PURCHASE_INVOICES:37])
End for 
ERR_MethodTrackerReturn("PUR_CheckPostings"; $_t_oldMethodName)