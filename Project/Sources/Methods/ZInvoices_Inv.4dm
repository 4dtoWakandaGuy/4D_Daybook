//%attributes = {}
If (False:C215)
	//Project Method Name:      ZInvoices_Inv
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 06:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZInvoices_Inv")
//ZProc ("Invoices_Inv";◊K3;"Batch Print Invoices")
DBI_MenuDisplayRecords("InvoicesPrint")
ERR_MethodTrackerReturn("ZInvoices_Inv"; $_t_oldMethodName)