If (False:C215)
	//object Name: [JOBS]Jobs_List_83.Variable32
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
	C_REAL:C285(vBalance)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Jobs_List_83.Variable32"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vBalance:=Subtotal:C97([JOBS:26]JS_Budget_Cost_Amount:38)
End if 
ERR_MethodTrackerReturn("OBJ [JOBS].Jobs_List_83.Variable32"; $_t_oldMethodName)
