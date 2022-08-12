If (False:C215)
	//object Name: [JOB_STAGES]JobStages_List.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2009 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vT1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_STAGES].JobStages_List.Variable8"; Form event code:C388)
vT1:=0
ERR_MethodTrackerReturn("OBJ [JOB_STAGES].JobStages_List.Variable8"; $_t_oldMethodName)