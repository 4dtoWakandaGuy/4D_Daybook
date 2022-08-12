//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_RefundReceipt2010
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/10/2010 15:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; DB_l_MaxRecords)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_RefundReceipt2010")
READ WRITE:C146([INVOICES:39])
READ WRITE:C146([INVOICES_ALLOCATIONS:162])
READ WRITE:C146([INVOICES_ITEMS:161])
READ WRITE:C146([XInvoiceAllocation:126])

CREATE SET:C116([INVOICES:39]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
INV_UndoSel
READ ONLY:C145([INVOICES:39])
READ ONLY:C145([INVOICES_ALLOCATIONS:162])
READ ONLY:C145([INVOICES_ITEMS:161])
READ ONLY:C145([XInvoiceAllocation:126])
USE SET:C118("$Temp")
QUERY:C277([INVOICES:39]; [INVOICES:39]Total_Paid:6>=0; *)  // Modified NG 3/8/2006
QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*R"+"@"; *)
QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
DB_l_MaxRecords:=Records in selection:C76([INVOICES:39])
DB_SetFormMenuoptions
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("INV_RefundReceipt2010"; $_t_oldMethodName)