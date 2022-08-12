If (False:C215)
	//object Name: Object Name:      dInvoiceItems_Sel.Variable35
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ dInvoiceItems_Sel.Variable35")

$_t_oldMethodName:=ERR_MethodTracker("OBJ dInvoiceItems_Sel.Variable35"; Form event code:C388)
Sel_LPCompCode(->vCompCode; ->[PURCHASE_INVOICES:37])
ERR_MethodTrackerReturn("OBJ dInvoiceItems_Sel.Variable35"; $_t_oldMethodName)