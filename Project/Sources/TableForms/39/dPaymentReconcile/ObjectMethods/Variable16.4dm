If (False:C215)
	//object Name: [INVOICES]dPaymentReconcile.Variable16
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
	C_REAL:C285(v0; v31; v61)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dPaymentReconcile.Variable16"; Form event code:C388)
v0:=Round:C94((v31-v61); 2)
ERR_MethodTrackerReturn("OBJ [INVOICES].dPaymentReconcile.Variable16"; $_t_oldMethodName)