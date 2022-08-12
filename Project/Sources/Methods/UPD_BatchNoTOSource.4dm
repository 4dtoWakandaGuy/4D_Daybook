//%attributes = {}
If (False:C215)
	//Project Method Name:      UPD_BatchNoTOSource
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 16:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	ARRAY TEXT:C222($_at_allInvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_allPurchaseInvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_PurchaseInvoiceNumbers; 0)
	C_DATE:C307($_d_TransactionDate)
	C_LONGINT:C283($_l_BatchNumber; $_l_index; $_l_Index2; $_l_Index3; $_l_InvoiceRow; $_l_PIRow)
	C_TEXT:C284($_t_AnalysisCode; $_t_DebitAccount; $_t_invoiceNumber; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UPD_BatchNoTOSource")
If (False:C215)
	ALL RECORDS:C47([TRANSACTION_BATCHES:30])
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	ARRAY TEXT:C222($_at_allInvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_allPurchaseInvoiceNumbers; 0)
	
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4#""; *)
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  | ; [TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22#"")
	SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
	QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
	
	FIRST RECORD:C50([TRANSACTION_BATCHES:30])
	For ($_l_index; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
		$_l_BatchNumber:=[TRANSACTION_BATCHES:30]Batch_Number:10
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
		ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
		ARRAY TEXT:C222($_at_PurchaseInvoiceNumbers; 0)
		FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
		For ($_l_Index2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
			$_d_TransactionDate:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5
			$_t_AnalysisCode:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
			$_t_DebitAccount:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
			$_t_invoiceNumber:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
			
			If ($_t_invoiceNumber#"")
				$_l_InvoiceRow:=Find in array:C230($_at_InvoiceNumbers; $_t_invoiceNumber)
				If ($_l_InvoiceRow<0)
					APPEND TO ARRAY:C911($_at_InvoiceNumbers; $_t_invoiceNumber)
				End if 
			End if 
			If ([TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22#"")
				$_l_PIRow:=Find in array:C230($_at_PurchaseInvoiceNumbers; [TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22)
				If ($_l_PIRow<0)
					APPEND TO ARRAY:C911($_at_PurchaseInvoiceNumbers; [TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22)
				End if 
				
			End if 
			
			NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
		End for 
		For ($_l_Index3; 1; Size of array:C274($_at_InvoiceNumbers))
			$_l_InvoiceRow:=Find in array:C230($_at_allInvoiceNumbers; $_at_InvoiceNumbers{$_l_Index3})
			If ($_l_InvoiceRow<0)
				INSERT IN ARRAY:C227($_al_BatchNumbers; Size of array:C274($_al_BatchNumbers)+1; 1)
				INSERT IN ARRAY:C227($_at_allInvoiceNumbers; Size of array:C274($_at_allInvoiceNumbers)+1; 1)
				INSERT IN ARRAY:C227($_at_allPurchaseInvoiceNumbers; Size of array:C274($_at_allPurchaseInvoiceNumbers)+1; 1)
				$_l_InvoiceRow:=Size of array:C274($_al_BatchNumbers)
			Else 
				//TRACE
			End if 
			$_at_allInvoiceNumbers{$_l_InvoiceRow}:=$_at_InvoiceNumbers{$_l_Index3}
			$_al_BatchNumbers{$_l_InvoiceRow}:=$_l_BatchNumber
		End for 
		For ($_l_Index3; 1; Size of array:C274($_at_PurchaseInvoiceNumbers))
			$_l_PIRow:=Find in array:C230($_at_allPurchaseInvoiceNumbers; $_at_PurchaseInvoiceNumbers{$_l_Index3})
			If ($_l_PIRow<0)
				INSERT IN ARRAY:C227($_al_BatchNumbers; Size of array:C274($_al_BatchNumbers)+1; 1)
				INSERT IN ARRAY:C227($_at_allInvoiceNumbers; Size of array:C274($_at_allInvoiceNumbers)+1; 1)
				INSERT IN ARRAY:C227($_at_allPurchaseInvoiceNumbers; Size of array:C274($_at_allPurchaseInvoiceNumbers)+1; 1)
				$_l_PIRow:=Size of array:C274($_al_BatchNumbers)
				
			Else 
				//   TRACE
			End if 
			$_at_allPurchaseInvoiceNumbers{$_l_PIRow}:=$_at_PurchaseInvoiceNumbers{$_l_Index3}
			$_al_BatchNumbers{$_l_PIRow}:=$_l_BatchNumber
		End for 
		
		NEXT RECORD:C51([TRANSACTION_BATCHES:30])
	End for 
End if 
ALL RECORDS:C47([INVOICES:39])
For ($_l_index; 1; Records in selection:C76([INVOICES:39]))
	SI_AllocationValidation
	NEXT RECORD:C51([INVOICES:39])
End for 
ERR_MethodTrackerReturn("UPD_BatchNoTOSource"; $_t_oldMethodName)