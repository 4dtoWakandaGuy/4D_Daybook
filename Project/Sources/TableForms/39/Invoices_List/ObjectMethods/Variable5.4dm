If (False:C215)
	//object Name: [INVOICES]Invoices_List.Variable5
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
	C_REAL:C285(v31; vPaid)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_List.Variable5"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vPaid:=Subtotal:C97(v31)
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].Invoices_List.Variable5"; $_t_oldMethodName)
