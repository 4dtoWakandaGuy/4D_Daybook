If (False:C215)
	//object Name: [JOBS]Job_In.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:30
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Job_In.Variable10"; Form event code:C388)
Jobs_TitUp
ERR_MethodTrackerReturn("OBJ [JOBS].Job_In.Variable10"; $_t_oldMethodName)
