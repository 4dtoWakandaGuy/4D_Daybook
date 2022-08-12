If (False:C215)
	//object Name: [JOBS]Job_In.Variable6
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Job_In.Variable6"; Form event code:C388)
JobsI_DelBut(1)
ERR_MethodTrackerReturn("OBJ [JOBS].Job_In.Variable6"; $_t_oldMethodName)