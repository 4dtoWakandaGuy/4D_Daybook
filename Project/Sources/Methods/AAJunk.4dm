//%attributes = {}
If (False:C215)
	//Project Method Name:      AAJunk
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/03/2013 07:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_InvoiceNumber; 0)
	C_BOOLEAN:C305($1)
	C_REAL:C285($3; $2)
	C_TEXT:C284($_t_InvoiceToAdjust; $_t_oldMethodName; $_t_ReceipttoDelete; <>SYS_t_LastSavedTableName; $_t_InvoiceToAdjust; $_t_oldMethodName; $_t_ReceipttoDelete)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AAJunk")

If (False:C215)
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Invoice_Number:1="*R@"; *)
	QUERY:C277([INVOICES_ALLOCATIONS:162];  & ; [INVOICES_ALLOCATIONS:162]Amount:2<0)
	SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_InvoiceNumber)
	QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumber)
	QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7>0)
End if 
//71911
//TRACE
QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Invoice_Number:1="71911"; *)
QUERY:C277([INVOICES_ALLOCATIONS:162];  & ; [INVOICES_ALLOCATIONS:162]Amount:2<0)
//Delete the following receipt
READ WRITE:C146(*)
$_t_InvoiceToAdjust:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
$_t_ReceipttoDelete:=[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6
QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_ReceipttoDelete)
DELETE RECORD:C58([INVOICES:39])
QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=$_t_ReceipttoDelete)
DELETE RECORD:C58([XInvoiceAllocation:126])
QUERY:C277([INVOICES_ALLOCATIONS:162];  & ; [INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_t_ReceipttoDelete; *)
QUERY:C277([INVOICES_ALLOCATIONS:162];  & ; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=$_t_InvoiceToAdjust)
DELETE RECORD:C58([INVOICES_ALLOCATIONS:162])

QUERY:C277([INVOICES_ALLOCATIONS:162];  & ; [INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_t_InvoiceToAdjust; *)
QUERY:C277([INVOICES_ALLOCATIONS:162];  & ; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=$_t_ReceipttoDelete)
DELETE RECORD:C58([INVOICES_ALLOCATIONS:162])
QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceToAdjust)
INV_CheckRemainder
<>SYS_t_LastSavedTableName:="INVOICES"
SAVE RECORD:C53([INVOICES:39])
ERR_MethodTrackerReturn("AAJunk"; $_t_oldMethodName)
