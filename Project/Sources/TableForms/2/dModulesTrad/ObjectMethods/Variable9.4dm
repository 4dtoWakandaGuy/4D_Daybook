If (False:C215)
	//object Name: [COMPANIES]dModulesTrad.Variable9
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
	C_REAL:C285(vT2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dModulesTrad.Variable9"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vT2:=Subtotal:C97([ORDERS:24]Total_TAX:7)
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dModulesTrad.Variable9"; $_t_oldMethodName)
