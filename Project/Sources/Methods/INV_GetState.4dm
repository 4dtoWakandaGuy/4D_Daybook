//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_GetState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/06/2010 12:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_InvoiceStates; 0)
	ARRAY TEXT:C222($_at_InvoiceStates; 0)
	C_LONGINT:C283($_l_InvoiceState; $_l_StateRow)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_GetState")
ARRAY TEXT:C222($_at_InvoiceStates; 9)
ARRAY LONGINT:C221($_al_InvoiceStates; 9)
$_at_InvoiceStates{1}:=Term_SLPLWT(Get localized string:C991("InvoiceString_Receipt"))

$_al_InvoiceStates{1}:=-3
$_at_InvoiceStates{2}:=Term_SLPLWT(Get localized string:C991("InvoiceString_Deposit"))  //"Deposit"
$_al_InvoiceStates{2}:=-2
$_at_InvoiceStates{3}:=Term_SLPLWT(Get localized string:C991("InvoiceString_Proforma"))  //"Proforma"
$_al_InvoiceStates{3}:=-1
$_at_InvoiceStates{4}:=Term_SLPLWT(Get localized string:C991("InvoiceString_UnpostedInvoice"))  //"Credit Note"
$_al_InvoiceStates{4}:=-0
If ([INVOICES:39]Total_Invoiced:5<0)
	$_at_InvoiceStates{5}:=Term_SLPLWT(Get localized string:C991("MenuItem_CreditNote_UnpostedCredit"))  //"Unposted Invoice"
	$_al_InvoiceStates{5}:=4
	$_at_InvoiceStates{6}:=Term_SLPLWT(Get localized string:C991("MenuItem_CreditNote_BatchedCredit"))  //"Batched Invoice"
	$_al_InvoiceStates{6}:=1
	
	$_at_InvoiceStates{7}:=Term_SLPLWT(Get localized string:C991("InvoiceString_PostedCredit"))  //"Posted Invoice"
	$_al_InvoiceStates{7}:=2
	
Else 
	$_at_InvoiceStates{5}:=Term_SLPLWT(Get localized string:C991("InvoiceString_UnpostedInvoice"))  //"Unposted Invoice"
	$_al_InvoiceStates{5}:=4
	$_at_InvoiceStates{6}:=Term_SLPLWT(Get localized string:C991("InvoiceString_BatchedInvoice"))  //"Batched Invoice"
	$_al_InvoiceStates{6}:=1
	
	$_at_InvoiceStates{7}:=Term_SLPLWT(Get localized string:C991("InvoiceString_PostedInvoice"))  //"Posted Invoice"
	$_al_InvoiceStates{7}:=2
End if 
$_at_InvoiceStates{8}:=Term_SLPLWT(Get localized string:C991("InvoiceString_importedInvoice"))  //"imported Invoice"
$_al_InvoiceStates{8}:=3

$_at_InvoiceStates{9}:=Term_SLPLWT(Get localized string:C991("MenuItem_CreditNote"))  //"imported Credit Note"
$_al_InvoiceStates{9}:=4
$_l_InvoiceState:=[INVOICES:39]State:10
If ([INVOICES:39]State:10=3) & ([INVOICES:39]Total_Invoiced:5<0)
	$_l_InvoiceState:=$_l_InvoiceState+1
End if 
$_l_StateRow:=Find in array:C230($_al_InvoiceStates; $_l_InvoiceState)
If ($_l_StateRow>0)
	$0:=$_at_InvoiceStates{$_l_StateRow}
Else 
	$0:="Unknown Invoice type"
End if 
//$0:=99
ERR_MethodTrackerReturn("INV_GetState"; $_t_oldMethodName)