If (False:C215)
	//object Name: [JOB PERSONNEL]JobPers_List.Variable10
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
	C_REAL:C285(vT2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB PERSONNEL].JobPers_List.Variable10"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vT2:=Subtotal:C97([JOB PERSONNEL:48]JT_Budget_Cost_Amount:11)
End if 
ERR_MethodTrackerReturn("OBJ [JOB PERSONNEL].JobPers_List.Variable10"; $_t_oldMethodName)
