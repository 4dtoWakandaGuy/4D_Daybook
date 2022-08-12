//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_ShowInvoiceItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 12:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	C_BOOLEAN:C305(<>INV_bo_ITEMSUSESET)
	C_LONGINT:C283(<>MENU_l_BarModule)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_ShowInvoiceItems")
//This method is called from the menu for a l ist of invoices. It will select the invoice items related and launch a new process with the selection.
If (Records in set:C195("userset")>0)
	USE SET:C118("userset")
End if 

ALL RECORDS:C47([INVOICES:39])
REDUCE SELECTION:C351([INVOICES:39]; 1000)

SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
QUERY WITH ARRAY:C644([INVOICES_ITEMS:161]INVOICES_CODE:18; $_at_InvoiceNumbers)
COPY NAMED SELECTION:C331([INVOICES_ITEMS:161]; "◊RelatedInvoiceItems")
<>INV_bo_ITEMSUSESET:=True:C214

DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[INVOICES_ITEMS:161])); <>MENU_l_BarModule; "◊RelatedInvoiceItems")

//InvoiceItems_Mod
ERR_MethodTrackerReturn("INV_ShowInvoiceItems"; $_t_oldMethodName)