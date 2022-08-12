//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_AllocationCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_PurchaseInvoiceAmount; 0)
	ARRAY TEXT:C222($_at_PurchaseInvoiceNumber; 0)
	C_BOOLEAN:C305($_bo_Found)
	C_DATE:C307($_d_PurchaseInvoiceDate)
	C_LONGINT:C283($_l_CountPurchaseInvAllocations; $_l_PurchaseAllocationsIndex; $_l_PurchaseAllocationsIndex2; $_l_PurchaseIndex; $_l_RecordsInSelection)
	C_TEXT:C284($_t_oldMethodName; $_t_PurchaseInvoiceCode; $_t_PurchaseInvoiceDate)
	C_TIME:C306($_ti_DocumentReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_AllocationCheck")
ALL RECORDS:C47([PURCHASE_INVOICES:37])
CREATE SET:C116([PURCHASE_INVOICES:37]; "ALLRECORDS")
$_l_RecordsInSelection:=Records in selection:C76([PURCHASE_INVOICES:37])
$_ti_DocumentReference:=DB_CreateDocument("PURCHALLOCREPORT4"; "TEXT")
For ($_l_PurchaseIndex; 1; $_l_RecordsInSelection)
	USE SET:C118("ALLRECORDS")
	GOTO SELECTED RECORD:C245([PURCHASE_INVOICES:37]; $_l_PurchaseIndex)
	QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
	
	If (Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159])>0)
		$_l_CountPurchaseInvAllocations:=Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159])
		ARRAY TEXT:C222($_at_PurchaseInvoiceNumber; 0)
		ARRAY REAL:C219($_ar_PurchaseInvoiceAmount; 0)
		ARRAY TEXT:C222($_at_PurchaseInvoiceNumber; $_l_CountPurchaseInvAllocations)
		ARRAY REAL:C219($_ar_PurchaseInvoiceAmount; $_l_CountPurchaseInvAllocations)
		FIRST RECORD:C50([PURCHASE_INVOICE_ALLOCATIONS:159])
		$_t_PurchaseInvoiceCode:=[PURCHASE_INVOICES:37]Purchase_Code:1
		$_t_PurchaseInvoiceDate:=String:C10([PURCHASE_INVOICES:37]Invoice_Date:5)
		For ($_l_PurchaseAllocationsIndex; 1; $_l_CountPurchaseInvAllocations)
			$_at_PurchaseInvoiceNumber{$_l_PurchaseAllocationsIndex}:=[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Invoice_Number:4
			$_ar_PurchaseInvoiceAmount{$_l_PurchaseAllocationsIndex}:=[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2
			NEXT RECORD:C51([PURCHASE_INVOICE_ALLOCATIONS:159])
		End for 
		For ($_l_PurchaseAllocationsIndex; 1; Size of array:C274($_at_PurchaseInvoiceNumber))
			If ($_at_PurchaseInvoiceNumber{$_l_PurchaseAllocationsIndex}="")
				SEND PACKET:C103($_ti_DocumentReference; "PURCHASE INVOICE "+$_t_PurchaseInvoiceCode+"("+$_t_PurchaseInvoiceDate+") HAS AN ALLOCATION TO A BLANK ENTRY  FOR AN AMOUNT OF "+String:C10($_ar_PurchaseInvoiceAmount{$_l_PurchaseAllocationsIndex})+Char:C90(13))
				
			Else 
				QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_at_PurchaseInvoiceNumber{$_l_PurchaseAllocationsIndex})
				If (Records in selection:C76([PURCHASE_INVOICES:37])=0)
					SEND PACKET:C103($_ti_DocumentReference; "PURCHASE INVOICE "+$_t_PurchaseInvoiceCode+"("+$_t_PurchaseInvoiceDate+") HAS AN ALLOCATION TO AN ENTRY "+$_at_PurchaseInvoiceNumber{$_l_PurchaseAllocationsIndex}+" WHICH DOES NOT EXIST "+" FOR AN AMOUNT OF "+String:C10($_ar_PurchaseInvoiceAmount{$_l_PurchaseAllocationsIndex})+Char:C90(13))
					
				Else 
					QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
					
					$_bo_Found:=False:C215
					For ($_l_PurchaseAllocationsIndex2; 1; Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159]))
						If ([PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Invoice_Number:4=$_t_PurchaseInvoiceCode)
							$_bo_Found:=True:C214
						End if 
						NEXT RECORD:C51([PURCHASE_INVOICE_ALLOCATIONS:159])
					End for 
					If (Not:C34($_bo_Found))
						SEND PACKET:C103($_ti_DocumentReference; "PURCHASE INVOICE "+$_t_PurchaseInvoiceCode+"("+$_t_PurchaseInvoiceDate+") HAS AN ALLOCATION TO A ENTRY "+[PURCHASE_INVOICES:37]Purchase_Code:1+"  FOR AN AMOUNT OF "+String:C10($_ar_PurchaseInvoiceAmount{$_l_PurchaseAllocationsIndex})+" WHICH DOES NOT REFER BACK"+Char:C90(13))
					End if 
					
				End if 
			End if 
			
		End for 
		
	End if 
	
End for 
ERR_MethodTrackerReturn("Purchases_AllocationCheck"; $_t_oldMethodName)
