//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_CrossInvoiceFix
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 11:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_SubDelete; 0)
	ARRAY REAL:C219($_ar_SubRefersInvoiceAMTs; 0)
	ARRAY TEXT:C222($_at_SubRefersInvoices; 0)
	ARRAY TEXT:C222($_at_SubRefersInvoices2; 0)
	C_BOOLEAN:C305(<>SI_bo_AllocationValidationDisab)
	C_LONGINT:C283($_l_AllocationsIndex; $_l_CountAllocationsRecords; $_l_CountInvoicesRecords; $_l_DeleteRow; $_l_Index; $_l_IndexR)
	C_TEXT:C284($_t_InvoiceNumber; $_t_oldMethodName; $_t_PostingType; $_t_PostingType2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_CrossInvoiceFix")
QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1#"*@")
CREATE SET:C116([INVOICES:39]; "ToCheck")


$_l_CountInvoicesRecords:=Records in selection:C76([INVOICES:39])
For ($_l_Index; 1; $_l_CountInvoicesRecords)
	
	READ WRITE:C146([INVOICES:39])
	USE SET:C118("ToCheck")
	GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
	Case of 
		: ([INVOICES:39]Total_Invoiced:5<0) | ([INVOICES:39]Invoice_Number:1="C@")
			$_t_PostingType:="CREDIT"
		Else 
			$_t_PostingType:="INVOICE"
	End case 
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
	
	ARRAY TEXT:C222($_at_SubRefersInvoices; 0)
	ARRAY TEXT:C222($_at_SubRefersInvoices2; 0)
	
	ARRAY BOOLEAN:C223($_abo_SubDelete; 0)
	$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
	$_l_CountAllocationsRecords:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
	ARRAY TEXT:C222($_at_SubRefersInvoices; $_l_CountAllocationsRecords)
	ARRAY REAL:C219($_ar_SubRefersInvoiceAMTs; $_l_CountAllocationsRecords)
	ARRAY BOOLEAN:C223($_abo_SubDelete; $_l_CountAllocationsRecords)
	FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
	For ($_l_AllocationsIndex; 1; $_l_CountAllocationsRecords)
		$_abo_SubDelete{$_l_AllocationsIndex}:=False:C215  //Just to be safe
		$_at_SubRefersInvoices{$_l_AllocationsIndex}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
		$_ar_SubRefersInvoiceAMTs{$_l_AllocationsIndex}:=[INVOICES_ALLOCATIONS:162]Amount:2
		NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
	End for 
	For ($_l_AllocationsIndex; 1; Size of array:C274($_at_SubRefersInvoices))
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_SubRefersInvoices{$_l_AllocationsIndex})
		If (Records in selection:C76([INVOICES:39])>0)
			If ([INVOICES:39]Invoice_Number:1#"*@")
				Case of 
					: ([INVOICES:39]Total_Invoiced:5<0) | ([INVOICES:39]Invoice_Number:1="C@")
						$_t_PostingType2:="CREDIT"
					Else 
						$_t_PostingType2:="INVOICE"
				End case 
				If ($_t_PostingType=$_t_PostingType2)
					$_abo_SubDelete{$_l_AllocationsIndex}:=True:C214
				End if 
				
			End if 
		End if 
	End for 
	USE SET:C118("ToCheck")
	GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
	
	$_l_DeleteRow:=Find in array:C230($_abo_SubDelete; True:C214)
	If ($_l_DeleteRow>0)
		LAST RECORD:C200([INVOICES_ALLOCATIONS:162])
		For ($_l_AllocationsIndex; 1; $_l_CountAllocationsRecords)
			If ($_abo_SubDelete{$_l_AllocationsIndex})
				FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
				For ($_l_IndexR; 1; $_l_CountAllocationsRecords)
					If ($_at_SubRefersInvoices{$_l_AllocationsIndex}=[INVOICES_ALLOCATIONS:162]Invoice_Number:1) & ($_ar_SubRefersInvoiceAMTs{$_l_AllocationsIndex}=[INVOICES_ALLOCATIONS:162]Amount:2)
						DELETE RECORD:C58([INVOICES_ALLOCATIONS:162])
					Else 
						NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
					End if 
				End for 
				
			End if 
		End for 
		SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; True:C214)
		SAVE RECORD:C53([INVOICES:39])
		READ WRITE:C146([XInvoiceAllocation:126])
		INV_GetAllocations([INVOICES:39]Invoice_Number:1; [INVOICES:39]State:10)
		If (Records in selection:C76([XInvoiceAllocation:126])>0)
			//TRACE
			DELETE SELECTION:C66([XInvoiceAllocation:126])
		End if 
		
		
	End if 
	
End for 
ERR_MethodTrackerReturn("SI_CrossInvoiceFix"; $_t_oldMethodName)
