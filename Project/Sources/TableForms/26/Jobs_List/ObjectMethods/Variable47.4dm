If (False:C215)
	//object Name: [JOBS]Jobs_List.Variable47
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
	C_REAL:C285(vSubtotal)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Jobs_List.Variable47"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vSubtotal:=Subtotal:C97([JOBS:26]JS_Actual_Sales_Amount:35)
End if 
ERR_MethodTrackerReturn("OBJ [JOBS].Jobs_List.Variable47"; $_t_oldMethodName)
