//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BatchCreateItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/04/2010 18:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ACC_ad_BatchItemTransDate;0)
	//ARRAY LONGINT(ACC_al_BatchItemDelete;0)
	//ARRAY LONGINT(ACC_al_BatchItemID;0)
	//ARRAY REAL(ACC_ar_BatchItemAmounts;0)
	//ARRAY REAL(ACC_ar_BatchItemSecondAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTaxAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTotal;0)
	//ARRAY TEXT(ACC_at_BatchItemAnalysisCode;0)
	//ARRAY TEXT(ACC_at_BatchItemChequeNo;0)
	//ARRAY TEXT(ACC_at_BatchItemCoCode;0)
	//ARRAY TEXT(ACC_at_BatchItemCreditAcc;0)
	//ARRAY TEXT(ACC_at_BatchItemCreditIO;0)
	//ARRAY TEXT(ACC_at_BatchItemCurrencyCode;0)
	//ARRAY TEXT(ACC_at_BatchItemDebitAcc;0)
	//ARRAY TEXT(ACC_at_BatchItemDebitIO;0)
	//ARRAY TEXT(ACC_at_BatchItemDescription;0)
	//ARRAY TEXT(ACC_at_BatchItemInvoiceNo;0)
	//ARRAY TEXT(ACC_at_BatchItemJobCode;0)
	//ARRAY TEXT(ACC_at_BatchItemlayerCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPeriodCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchinvno;0)
	//ARRAY TEXT(ACC_at_BatchItemTaxCode;0)
	//ARRAY TEXT(ACC_at_BatchItemTaxUKEC;0)
	//ARRAY TEXT(ACC_at_BatchItemTransTypeCode;0)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_SizeofBatchItemArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

//NG July 2004
$_t_oldMethodName:=ERR_MethodTracker("ACC_BatchCreateItems")
//This method will save the data from the arrays into the subtable records..
READ WRITE:C146([TRANSACTION_BATCH_ITEMS:155])

If (Size of array:C274(ACC_al_BatchItemDelete)>0)
	//there are deletions
	For ($_l_Index; 1; Size of array:C274(ACC_al_BatchItemDelete))
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
		QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=ACC_al_BatchItemDelete{$_l_Index})
		
		For ($_l_Index2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
			If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25#ACC_al_BatchItemDelete{$_l_Index})
				NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
			Else 
				$_l_Index2:=999999
				DELETE RECORD:C58([TRANSACTION_BATCH_ITEMS:155])
			End if 
			//this is the one to delete
			
		End for 
	End for 
	
End if 

$_l_SizeofBatchItemArray:=Size of array:C274(ACC_al_BatchItemID)

For ($_l_Index; 1; $_l_SizeofBatchItemArray)
	If (ACC_al_BatchItemID{$_l_Index}>0)  //an existing item
		If (ACC_al_BatchItemID{$_l_Index}<0)
			//this item is modified
			QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
			QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=ACC_al_BatchItemID{$_l_Index})
			
			For ($_l_Index2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
				If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25#ACC_al_BatchItemID{$_l_Index})
					NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
				Else 
					$_l_Index2:=999999
				End if 
			End for 
			ACC_al_BatchItemID{$_l_Index}:=Abs:C99(ACC_al_BatchItemID{$_l_Index})
			[TRANSACTION_BATCH_ITEMS:155]Amount:6:=ACC_ar_BatchItemAmounts{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=ACC_at_BatchItemAnalysisCode{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=ACC_at_BatchItemChequeNo{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=ACC_at_BatchItemCoCode{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=ACC_at_BatchItemCreditAcc{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=ACC_at_BatchItemCreditIO{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=ACC_at_BatchItemCurrencyCode{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=ACC_at_BatchItemDebitAcc{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=ACC_at_BatchItemDebitIO{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Description:10:=ACC_at_BatchItemDescription{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=ACC_at_BatchItemInvoiceNo{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=ACC_at_BatchItemJobCode{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=ACC_at_BatchItemlayerCode{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=ACC_at_BatchItemPeriodCode{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=ACC_at_BatchItemPurchinvno{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=ACC_at_BatchItemPurchCode{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21:=ACC_ar_BatchItemSecondAmt{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=ACC_ar_BatchItemTaxAmt{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=ACC_at_BatchItemTaxCode{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Total:9:=ACC_ar_BatchItemTotal{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=ACC_at_BatchItemTransTypeCode{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=ACC_ad_BatchItemTransDate{$_l_Index}
			[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=ACC_at_BatchItemTaxUKEC{$_l_Index}
			DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			
		End if 
	Else 
		
		//new item
		CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
		[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
		
		[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=Abs:C99(ACC_al_BatchItemID{$_l_Index})
		ACC_al_BatchItemID{$_l_Index}:=Abs:C99(ACC_al_BatchItemID{$_l_Index})
		ACC_al_BatchItemID{$_l_Index}:=Abs:C99(ACC_al_BatchItemID{$_l_Index})
		[TRANSACTION_BATCH_ITEMS:155]Amount:6:=ACC_ar_BatchItemAmounts{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=ACC_at_BatchItemAnalysisCode{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=ACC_at_BatchItemChequeNo{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=ACC_at_BatchItemCoCode{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=ACC_at_BatchItemCreditAcc{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=ACC_at_BatchItemCreditIO{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=ACC_at_BatchItemCurrencyCode{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=ACC_at_BatchItemDebitAcc{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=ACC_at_BatchItemDebitIO{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Description:10:=ACC_at_BatchItemDescription{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=ACC_at_BatchItemInvoiceNo{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=ACC_at_BatchItemJobCode{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=ACC_at_BatchItemlayerCode{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=ACC_at_BatchItemPeriodCode{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=ACC_at_BatchItemPurchinvno{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=ACC_at_BatchItemPurchCode{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21:=ACC_ar_BatchItemSecondAmt{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=ACC_ar_BatchItemTaxAmt{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=ACC_at_BatchItemTaxCode{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Total:9:=ACC_ar_BatchItemTotal{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=ACC_at_BatchItemTransTypeCode{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=ACC_ad_BatchItemTransDate{$_l_Index}
		[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=ACC_at_BatchItemTaxUKEC{$_l_Index}
		DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
		
	End if 
	
End for 
ERR_MethodTrackerReturn("ACC_BatchCreateItems"; $_t_oldMethodName)
