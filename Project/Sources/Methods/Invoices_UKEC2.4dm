//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_UKEC2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 16:24
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

$_t_oldMethodName:=ERR_MethodTracker("Invoices_UKEC2")
If (([INVOICES:39]TAX_Prefix:19#DB_GetOrganisationVATPrefix) & ([INVOICES:39]TAX_Prefix:19#""))
	[INVOICES:39]UK_EC:21:="E"
Else 
	[INVOICES:39]UK_EC:21:="U"
End if 
ERR_MethodTrackerReturn("Invoices_UKEC2"; $_t_oldMethodName)