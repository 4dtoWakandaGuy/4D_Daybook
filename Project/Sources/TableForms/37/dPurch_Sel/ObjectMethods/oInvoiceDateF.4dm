If (False:C215)
	//object Name: [PURCHASE_INVOICES]dPurch Sel.oInvoiceDateF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2014 20:35
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES]dPurch Sel.oInvoiceDateF"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ dPurch Sel.oInvoiceDateF"; $_t_oldMethodName)