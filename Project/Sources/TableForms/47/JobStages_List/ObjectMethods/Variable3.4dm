If (False:C215)
	//object Name: [JOB_STAGES]JobStages_List.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2009 14:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_STAGES].JobStages_List.Variable3"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [JOB_STAGES].JobStages_List.Variable3"; $_t_oldMethodName)