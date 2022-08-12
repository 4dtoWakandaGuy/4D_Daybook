//%attributes = {}
If (False:C215)
	//Project Method Name:      ZInvoices_Repos
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

$_t_oldMethodName:=ERR_MethodTracker("ZInvoices_Repos")
ZProc("Invoices_Repost"; DB_ProcessMemoryinit(3); "Repost Invoice")
ERR_MethodTrackerReturn("ZInvoices_Repos"; $_t_oldMethodName)
