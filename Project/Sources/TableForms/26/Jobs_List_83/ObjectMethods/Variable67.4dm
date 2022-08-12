If (False:C215)
	//object Name: [JOBS]Jobs_List_83.Variable67
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
	C_REAL:C285(v0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Jobs_List_83.Variable67"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	v0:=Subtotal:C97([JOBS:26]JT_WIP_Cost_Amount:43)
End if 
ERR_MethodTrackerReturn("OBJ [JOBS].Jobs_List_83.Variable67"; $_t_oldMethodName)
