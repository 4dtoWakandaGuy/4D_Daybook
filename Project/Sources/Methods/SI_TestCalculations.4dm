//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_TestCalculations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AllocationsIndex; $_l_CountAllocations; $_l_Index)
	C_REAL:C285($_r_Sum; $_r_TotalDue; $_r_TotalDue2; $_r_TotalPaid; $_r_TotalPaid2)
	C_TEXT:C284($_t_InvoiceNumberC; $_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_TestCalculations")
ALL RECORDS:C47([INVOICES:39])
$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")

For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
	$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
	$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
	$_r_Sum:=(Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; True:C214); 2))
	$_r_TotalPaid2:=Gen_Round(($_r_Sum); 2; 2)
	$_r_TotalDue2:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid2); 2; 2)
	If ($_r_TotalPaid#$_r_TotalPaid2) | ($_r_TotalDue#$_r_TotalDue2)
		QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
		
		SEND PACKET:C103($_ti_DocumentRef; [INVOICES:39]Invoice_Number:1+Char:C90(13)+"Subrecords"+Char:C90(13))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(9))
		$_l_CountAllocations:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
		FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
		For ($_l_AllocationsIndex; 1; $_l_CountAllocations)
			SEND PACKET:C103($_ti_DocumentRef; String:C10([INVOICES_ALLOCATIONS:162]Amount:2)+Char:C90(9)+[INVOICES_ALLOCATIONS:162]Invoice_Number:1+Char:C90(13)+Char:C90(9))
			NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
		End for 
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
		INV_GetAllocations([INVOICES:39]Invoice_Number:1)
		$_t_InvoiceNumberC:=[INVOICES:39]Invoice_Number:1
		SEND PACKET:C103($_ti_DocumentRef; "Allocations"+Char:C90(13))
		
		
		For ($_l_AllocationsIndex; 1; Records in selection:C76([XInvoiceAllocation:126]))
			Case of 
				: ([XInvoiceAllocation:126]xInvoiceNumber:2#"") & ([XInvoiceAllocation:126]xInvoiceNumber:2#$_t_InvoiceNumberC)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xInvoiceNumber:2+Char:C90(13))
				: ([XInvoiceAllocation:126]xCreditNumber:3#"") & ([XInvoiceAllocation:126]xCreditNumber:3#$_t_InvoiceNumberC)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xCreditNumber:3+Char:C90(13))
				: ([XInvoiceAllocation:126]xReceiptNumber:4#"") & ([XInvoiceAllocation:126]xReceiptNumber:4#$_t_InvoiceNumberC)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xReceiptNumber:4+Char:C90(13))
				: ([XInvoiceAllocation:126]xDepositNumber:5#"") & ([XInvoiceAllocation:126]xDepositNumber:5#$_t_InvoiceNumberC)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xDepositNumber:5+Char:C90(13))
					
			End case 
			
			NEXT RECORD:C51([XInvoiceAllocation:126])
		End for 
		SEND PACKET:C103($_ti_DocumentRef; "Allocations"+Char:C90(13))
		
		
	End if 
	NEXT RECORD:C51([INVOICES:39])
End for 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("SI_TestCalculations"; $_t_oldMethodName)
