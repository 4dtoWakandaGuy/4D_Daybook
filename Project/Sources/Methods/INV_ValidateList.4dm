//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_ValidateList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 09:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_OrderInvoiceNumbers; 0)
	C_DATE:C307($_d_InvoiceDate)
	C_LONGINT:C283($_l_index)
	C_TEXT:C284($_t_LowestNumber; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_ValidateList")
Open window:C153(40; 60; 200; 100; -1984)
CREATE SET:C116([INVOICES:39]; "CheckSet")
MESSAGE:C88("Checking "+String:C10(Records in selection:C76([INVOICES:39]))+" For Validity")
ORDER BY:C49([INVOICES:39]; [INVOICES:39]Invoice_Number:1)
$_t_LowestNumber:=[INVOICES:39]Invoice_Number:1
$_d_InvoiceDate:=[INVOICES:39]Invoice_Date:4
ORDER BY:C49([INVOICES:39]; [INVOICES:39]Invoice_Date:4)
FIRST RECORD:C50([INVOICES:39])
If ($_d_InvoiceDate>[INVOICES:39]Invoice_Date:4)
	//the lowest number is not the earliest
	$_d_InvoiceDate:=[INVOICES:39]Invoice_Date:4
	QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Date:4=$_d_InvoiceDate)
	ORDER BY:C49([INVOICES:39]; [INVOICES:39]Invoice_Number:1)
	FIRST RECORD:C50([INVOICES:39])
	If ($_t_LowestNumber>[INVOICES:39]Invoice_Number:1)
		$_t_LowestNumber:=[INVOICES:39]Invoice_Number:1
	End if 
End if 
ARRAY TEXT:C222($_at_OrderInvoiceNumbers; 0)
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17>=$_t_LowestNumber)
SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Invoice_Number:17; $_at_OrderInvoiceNumbers)
CREATE EMPTY SET:C140([INVOICES:39]; "LinkedSet")
ERASE WINDOW:C160
MESSAGE:C88("Checking "+String:C10(Records in selection:C76([ORDER_ITEMS:25]))+" For Invoices")
For ($_l_index; 1; Size of array:C274($_at_OrderInvoiceNumbers))
	GOTO XY:C161(0; 1)
	MESSAGE:C88("Order"+String:C10($_l_index)+" of "+String:C10(Size of array:C274($_at_OrderInvoiceNumbers)))
	QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_OrderInvoiceNumbers{$_l_index})
	ADD TO SET:C119([INVOICES:39]; "LinkedSet")
End for 
QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Invoice_Number:10>=$_t_LowestNumber)
SELECTION TO ARRAY:C260([JOB_STAGES:47]Invoice_Number:10; $_at_OrderInvoiceNumbers)

ERASE WINDOW:C160
MESSAGE:C88("Checking "+String:C10(Records in selection:C76([JOB_STAGES:47]))+" For Invoices")
For ($_l_index; 1; Size of array:C274($_at_OrderInvoiceNumbers))
	GOTO XY:C161(0; 1)
	MESSAGE:C88("Job Stage"+String:C10($_l_index)+" of "+String:C10(Size of array:C274($_at_OrderInvoiceNumbers)))
	QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_OrderInvoiceNumbers{$_l_index})
	ADD TO SET:C119([INVOICES:39]; "LinkedSet")
End for 
ERASE WINDOW:C160
MESSAGE:C88("Returning List of unlinked invoices")
//Now take out of "CheckSet" the "LinkedSet"
DIFFERENCE:C122("CheckSet"; "LinkedSet"; "CheckSet")
USE SET:C118("CheckSet")
CLEAR SET:C117("CheckSet")
CLEAR SET:C117("LinkedSet")
CLOSE WINDOW:C154
If (Records in selection:C76([INVOICES:39])>0)
	If (Records in selection:C76([INVOICES:39])=1)
		//  ALERT("There is one INVOICE from the selectionwhich does not relate to any dat
		Gen_Alert("There is one INVOICE from the selectionwhich does not relate to any data in your"+" Database")
	Else 
		//  ALERT("There are "+String(Records in selection([INVOICES]))+" INVOICES from th
		Gen_Alert("There are "+String:C10(Records in selection:C76([INVOICES:39]))+" INVOICES from the selectionwhich does not relate"+" to any data in your Database")
	End if 
Else 
	// ALERT("All Invoices_In the selection relate to other data in your database")
	Gen_Alert("All Invoices_In the selection relate to other data in your database")
End if 
ERR_MethodTrackerReturn("INV_ValidateList"; $_t_oldMethodName)