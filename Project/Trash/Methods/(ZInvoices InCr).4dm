//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZInvoices_InCr
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

$_t_oldMethodName:=ERR_MethodTracker("ZInvoices_InCr")
ZProc("Invoices_InCr"; DB_ProcessMemoryinit(3); Term_SLPLWT("Enter Adhoc Credit Notes"))
ERR_MethodTrackerReturn("ZInvoices_InCr"; $_t_oldMethodName)