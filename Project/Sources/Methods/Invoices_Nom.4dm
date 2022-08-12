//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_Nom
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:48
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

$_t_oldMethodName:=ERR_MethodTracker("Invoices_Nom")
//Invoices_Nom
DBI_MenuDisplayRecords("BatchPostInvoices")
ERR_MethodTrackerReturn("Invoices_Nom"; $_t_oldMethodName)