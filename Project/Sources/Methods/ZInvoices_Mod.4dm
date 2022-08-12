//%attributes = {}
If (False:C215)
	//Project Method Name:      ZInvoices_Mod
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
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZInvoices_Mod")
If (Count parameters:C259>=3)
	$3->:=ZProc_withReply("Invoices_Mod"; DB_ProcessMemoryinit(3); Term_SLPLWT("View Sales Ledger"); $1; $2)
Else 
	ZProc("Invoices_Mod"; DB_ProcessMemoryinit(3); Term_SLPLWT("View Sales Ledger"))
End if 
ERR_MethodTrackerReturn("ZInvoices_Mod"; $_t_oldMethodName)