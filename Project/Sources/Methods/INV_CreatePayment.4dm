//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_CreatePayment
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 06:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_InvoiceOrderCodes; 0)
	C_LONGINT:C283($_l_SelectedRecord; vIn)
	C_REAL:C285($_r_Amount; $1)
	C_TEXT:C284($_t_AmountSTR; $_t_InvoiceNumber; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_CreatePayment")
//This method is called by an invoice-it will allocate a pament to an invoice.becuase the current selection will change it has to remember the selection and return to where it was
//...so anything that needs to modify the or
//Start by saving the invoice
$_l_SelectedRecord:=Selected record number:C246([INVOICES:39])
COPY NAMED SELECTION:C331([INVOICES:39]; "CurrentSelection")
$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
$_r_Amount:=[INVOICES:39]Total_Due:7
ONE RECORD SELECT:C189([INVOICES:39])

QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)


FIRST RECORD:C50([INVOICES_ITEMS:161])
ARRAY TEXT:C222($_at_InvoiceOrderCodes; 0)

If (Count parameters:C259>=1)
	$_t_AmountSTR:=String:C10($1)
Else 
	$_t_AmountSTR:=Gen_Request("Enter the receipt amount"; String:C10($_r_Amount))
End if 

If ($_t_AmountSTR#"")
	$_r_Amount:=Num:C11($_t_AmountSTR)
	Invoices_Pay2(False:C215; $_r_Amount; 0; False:C215; True:C214)
	USE NAMED SELECTION:C332("CurrentSelection")
	GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_SelectedRecord)
	Invoices_InLPBB
	Invoices_InLPß("B")
	vIn:=0
End if 
ERR_MethodTrackerReturn("INV_CreatePayment"; $_t_oldMethodName)