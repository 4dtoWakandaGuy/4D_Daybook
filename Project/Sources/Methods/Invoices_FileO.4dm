//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_FileO
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
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_FileO")
FORM SET OUTPUT:C54([INVOICES:39]; "Invoices_Out")
WIN_t_CurrentOutputform:="Invoices_Out"
ERR_MethodTrackerReturn("Invoices_FileO"; $_t_oldMethodName)