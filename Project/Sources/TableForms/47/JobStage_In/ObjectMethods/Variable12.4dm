If (False:C215)
	//object Name: [JOB_STAGES]JobStage_in.Variable12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_STAGES].JobStage_in.Variable12"; Form event code:C388)
DB_t_CurrentFormUsage:="JobStage"
OrderI_DelBut
ERR_MethodTrackerReturn("OBJ [JOB_STAGES].JobStage_in.Variable12"; $_t_oldMethodName)
