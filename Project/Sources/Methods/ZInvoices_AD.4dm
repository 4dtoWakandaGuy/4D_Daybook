//%attributes = {}
If (False:C215)
	//Project Method Name:      ZInvoices_AD
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

$_t_oldMethodName:=ERR_MethodTracker("ZInvoices_AD")
ZProc("Invoices_AD"; DB_ProcessMemoryinit(3); Term_SLPLWT("Aged Debtors"))
ERR_MethodTrackerReturn("ZInvoices_AD"; $_t_oldMethodName)
