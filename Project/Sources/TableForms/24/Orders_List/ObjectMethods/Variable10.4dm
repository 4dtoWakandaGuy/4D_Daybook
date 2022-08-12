If (False:C215)
	//object Name: [ORDERS]Orders_List.Variable10
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
	C_REAL:C285(vT4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_List.Variable10"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vT4:=Subtotal:C97([ORDERS:24]Total_Cost:11)
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_List.Variable10"; $_t_oldMethodName)
