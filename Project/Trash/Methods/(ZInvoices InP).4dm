//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZInvoices_InP
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

$_t_oldMethodName:=ERR_MethodTracker("ZInvoices_InP")
ZProc("Invoices_InP"; DB_ProcessMemoryinit(2); "Deposit Receipt")
ERR_MethodTrackerReturn("ZInvoices_InP"; $_t_oldMethodName)