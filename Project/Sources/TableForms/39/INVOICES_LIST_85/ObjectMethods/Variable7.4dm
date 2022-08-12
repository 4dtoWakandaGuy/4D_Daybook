If (False:C215)
	//object Name: [INVOICES]INVOICES_LIST_85.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(v0; vSubtotal)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].INVOICES_LIST_85.Variable7"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vSubtotal:=Subtotal:C97(v0)
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].INVOICES_LIST_85.Variable7"; $_t_oldMethodName)
