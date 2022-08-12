If (False:C215)
	//object Name: [PRODUCTS]Product List.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vT1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Product List.Variable5"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vT1:=Subtotal:C97([PRODUCTS:9]Sales_Price:9)
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Product List.Variable5"; $_t_oldMethodName)
