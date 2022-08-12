//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices UKEC
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

$_t_oldMethodName:=ERR_MethodTracker("Invoices UKEC")
//Invoices UKEC
If ([INVOICES:39]Company_Code:2#"")
	[INVOICES:39]TAX_Prefix:19:=[COMPANIES:2]TAX_Prefix:38
	[INVOICES:39]TAX_Registration_Number:20:=[COMPANIES:2]TAX_Registration_Number:39
	If (([COMPANIES:2]TAX_Prefix:38#DB_GetOrganisationVATPrefix) & ([COMPANIES:2]TAX_Prefix:38#""))
		[INVOICES:39]UK_EC:21:="E"
	Else 
		[INVOICES:39]UK_EC:21:="U"
	End if 
Else 
	[INVOICES:39]UK_EC:21:="U"
	[INVOICES:39]TAX_Prefix:19:=""
	[INVOICES:39]TAX_Registration_Number:20:=""
End if 
ERR_MethodTrackerReturn("Invoices UKEC"; $_t_oldMethodName)