//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_Inv
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2013 21:48
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
$_t_oldMethodName:=ERR_MethodTracker("Invoices_Inv")

DBI_MenuDisplayRecords("InvoicesPrint")
ERR_MethodTrackerReturn("Invoices_Inv"; $_t_oldMethodName)