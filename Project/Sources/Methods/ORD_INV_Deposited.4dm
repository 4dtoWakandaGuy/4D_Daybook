//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_INV_Deposited
	//------------------ Method Notes ------------------
	//NG January 2005
	//this method is called when transferring an order to invoice.
	//This is called before displaying the invoice to determine the amount on deposit from in relation to this order
	//and the amount depostited(PAID) by credit card.
	//these amount are then used in the invoice on the payment page to determine if(and how much can be further authorised)
	//(note that if an amount was authorised on the order but payment not taken then this is handled in the payment window)
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $1)
	C_POINTER:C301($3; $4)
	C_TEXT:C284($_t_InvoiceNumber; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_INV_Deposited")

$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
QUERY:C277([INVOICES:39]; [INVOICES:39]X_DepositRelatedTable:44=Table:C252(->[ORDERS:24]); *)
QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_DepositRelatedRecordID:45=$1; *)
QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D@"; *)
QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0)

If (Records in selection:C76([INVOICES:39])>0)
	$3->:=Abs:C99(Sum:C1([INVOICES:39]Total_Due:7))
	CREATE EMPTY SET:C140([INVOICES:39]; "BYCC")
	
	For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
		QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]xDepositCode:8=[INVOICES:39]Invoice_Number:1)
		If (Records in selection:C76([CC_OrderAuths:133])>0)
			ADD TO SET:C119([INVOICES:39]; "BYCC")
		End if 
		NEXT RECORD:C51([INVOICES:39])
		
	End for 
	USE SET:C118("BYCC")
	$4->:=Abs:C99(Sum:C1([INVOICES:39]Total_Due:7))
Else 
	$3->:=0
	$4->:=0
	
End if 
QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
ERR_MethodTrackerReturn("ORD_INV_Deposited"; $_t_oldMethodName)
