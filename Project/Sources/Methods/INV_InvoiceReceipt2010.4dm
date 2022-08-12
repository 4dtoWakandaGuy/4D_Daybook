//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_InvoiceReceipt2010
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   01/10/2010 14:29
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

$_t_oldMethodName:=ERR_MethodTracker("INV_InvoiceReceipt2010")
CREATE SET:C116([INVOICES:39]; "$Temp")
USE SET:C118("ListboxSet0")
Invoices_PaySel
USE SET:C118("$Temp")
QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=2; *)  //Deposits
QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=-2)
QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7#0)
DB_l_MaxRecords:=Records in selection:C76([INVOICES:39])
DB_SetFormMenuoptions
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("INV_InvoiceReceipt2010"; $_t_oldMethodName)