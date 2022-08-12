If (False:C215)
	//object Name: [JOB_STAGES]JobStages_List_90.Variable25
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_STAGES].JobStages_List_90.Variable25"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	v0:=Subtotal:C97([JOB_STAGES:47]JT_WIP_Cost_Amount:43)
End if 
ERR_MethodTrackerReturn("OBJ [JOB_STAGES].JobStages_List_90.Variable25"; $_t_oldMethodName)
