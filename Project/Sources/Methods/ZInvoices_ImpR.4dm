//%attributes = {}
If (False:C215)
	//Project Method Name:      ZInvoices_ImpR
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZInvoices_ImpR")
ZProc("Invoices_ImpR"; DB_ProcessMemoryinit(2); "Import Receipts")
ERR_MethodTrackerReturn("ZInvoices_ImpR"; $_t_oldMethodName)
