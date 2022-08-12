//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_DeleteDuplicateReceipt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2013 14:54
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_Amounts; 0)
	ARRAY TEXT:C222($_at_ReceiptNumbers; 0)
	C_REAL:C285($_l_AmountsIndex; $_R_Amount)
	C_TEXT:C284($_t_InvoiceNumber; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_DeleteDuplicateReceipt")

READ WRITE:C146(*)

$_t_InvoiceNumber:=Gen_Request("Enter the Invoice number that has a duplicate Receipt"; "")

If ($_t_InvoiceNumber#"")
	
	If ($_t_InvoiceNumber#"*R@") & ($_t_InvoiceNumber#"*D@")
		
		
		
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
		
		If (Records in selection:C76([INVOICES:39])=1)
			
			QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=$_t_InvoiceNumber)
			
			If (Records in selection:C76([INVOICES_ALLOCATIONS:162])>=2)
				SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]Amount:2; $_ar_Amounts)
				For ($_l_AmountsIndex; 1; Size of array:C274($_ar_Amounts))
					$_R_Amount:=$_ar_Amounts{$_l_AmountsIndex}
					
					QUERY SELECTION:C341([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Amount:2=$_R_Amount)
					
					If (Records in selection:C76([INVOICES_ALLOCATIONS:162])=2)
						
						ARRAY TEXT:C222($_at_ReceiptNumbers; 0)
						
						SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]Invoice_Number:1; $_at_ReceiptNumbers)
						
						//we will only delete the second one
						
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_ReceiptNumbers{2})
						
						DELETE RECORD:C58([INVOICES:39])
						
						QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=$_at_ReceiptNumbers{2})
						
						DELETE SELECTION:C66([INVOICES_ALLOCATIONS:162])
						
						QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_at_ReceiptNumbers{2})
						
						DELETE SELECTION:C66([INVOICES_ALLOCATIONS:162])
						
						QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=$_at_ReceiptNumbers{2})
						
						DELETE SELECTION:C66([XInvoiceAllocation:126])
						
					End if 
				End for 
				
			End if 
			
		End if 
		
	Else 
		
		Gen_Alert("Please enter an invoice not a Receipt or deposit")
		
	End if 
	
End if 
ERR_MethodTrackerReturn("INV_DeleteDuplicateReceipt"; $_t_oldMethodName)