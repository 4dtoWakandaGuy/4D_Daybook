If (False:C215)
	//object Name: [JOBS]Jobs_List.Variable23
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
	C_REAL:C285(vT5)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Jobs_List.Variable23"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vT5:=Subtotal:C97([JOBS:26]JT_Bud_Sales_Amount:23)
End if 
ERR_MethodTrackerReturn("OBJ [JOBS].Jobs_List.Variable23"; $_t_oldMethodName)
