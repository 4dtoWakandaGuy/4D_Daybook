If (False:C215)
	//object Name: [INVOICES]INVOICES_LIST_85.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/04/2011 13:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(INV_R_TotalInvoicedOUt; vTotal)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].INVOICES_LIST_85.Variable4"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vTotal:=Subtotal:C97(INV_R_TotalInvoicedOUt)
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].INVOICES_LIST_85.Variable4"; $_t_oldMethodName)
