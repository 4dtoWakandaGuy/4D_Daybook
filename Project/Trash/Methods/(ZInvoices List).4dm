//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZInvoices_List
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

$_t_oldMethodName:=ERR_MethodTracker("ZInvoices_List")
ZProc("Invoices_List"; DB_ProcessMemoryinit(2); Term_SLPLWT("List Sales Ledger"))
ERR_MethodTrackerReturn("ZInvoices_List"; $_t_oldMethodName)