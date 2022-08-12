If (False:C215)
	//object Name: [JOB_STAGES]JobStages_List_90.Variable29
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
	C_REAL:C285(vPayment)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_STAGES].JobStages_List_90.Variable29"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vPayment:=Subtotal:C97([JOB_STAGES:47]JS_Budget_Sales_Amount:37)
End if 
ERR_MethodTrackerReturn("OBJ [JOB_STAGES].JobStages_List_90.Variable29"; $_t_oldMethodName)
