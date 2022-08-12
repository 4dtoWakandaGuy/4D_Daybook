//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_DoublesRemove
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AllocationIndex)
	C_REAL:C285($_r_Amount)
	C_TEXT:C284($_t_CreditNumber; $_t_DepositNumber; $_t_InvoiceNumber; $_t_oldMethodName; $_t_ReceiptNumber)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_DoublesRemove")
ALL RECORDS:C47([XInvoiceAllocation:126])
CREATE EMPTY SET:C140([XInvoiceAllocation:126]; "TODELETE")

CREATE SET:C116([XInvoiceAllocation:126]; "ALL")
For ($_l_AllocationIndex; 1; Records in table:C83([XInvoiceAllocation:126]))
	USE SET:C118("ALL")
	GOTO SELECTED RECORD:C245([XInvoiceAllocation:126]; $_l_AllocationIndex)
	$_t_InvoiceNumber:=[XInvoiceAllocation:126]xInvoiceNumber:2
	$_t_CreditNumber:=[XInvoiceAllocation:126]xCreditNumber:3
	$_t_ReceiptNumber:=[XInvoiceAllocation:126]xReceiptNumber:4
	$_t_DepositNumber:=[XInvoiceAllocation:126]xDepositNumber:5
	$_r_Amount:=[XInvoiceAllocation:126]xAmount:7
	QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_t_InvoiceNumber; *)
	If ($_t_CreditNumber#"")  //9
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=$_t_CreditNumber; *)
	End if 
	If ($_t_ReceiptNumber#"")  //9
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=$_t_ReceiptNumber; *)
	End if 
	If ($_t_DepositNumber#"")  //10
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=$_t_DepositNumber; *)
	End if 
	QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=$_r_Amount)
	If (Records in selection:C76([XInvoiceAllocation:126])>1)
		REDUCE SELECTION:C351([XInvoiceAllocation:126]; 1)
		ADD TO SET:C119([XInvoiceAllocation:126]; "TODELETE")
	End if 
End for 
//TRACE
READ WRITE:C146(*)

USE SET:C118("TODELETE")
If (Records in selection:C76([XInvoiceAllocation:126])>0)
	//TRACE
	DELETE SELECTION:C66([XInvoiceAllocation:126])
End if 
ERR_MethodTrackerReturn("SI_DoublesRemove"; $_t_oldMethodName)
