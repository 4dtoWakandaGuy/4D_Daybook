If (False:C215)
	//object Name: [COMPANIES]Aged Debtors.Variable14
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(v31; vTot31)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Aged Debtors.Variable14"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vTot31:=Round:C94(Subtotal:C97(v31); 2)
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].Aged Debtors.Variable14"; $_t_oldMethodName)
