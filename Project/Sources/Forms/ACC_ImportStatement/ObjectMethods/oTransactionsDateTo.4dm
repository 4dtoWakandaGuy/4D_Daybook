If (False:C215)
	//object Name: Object Name:      ACC_ImportStatement.Variable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/08/2012 22:37
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ImportStatement.Variable"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ ACC_ImportStatement.Variable"; $_t_oldMethodName)