If (False:C215)
	//object Name: [INVOICES]dInv_Sel.oInvoiceDateT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/07/2012 15:02
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dInv_Sel.oInvoiceDateT"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [INVOICES].dInv_Sel.oInvoiceDateT"; $_t_oldMethodName)