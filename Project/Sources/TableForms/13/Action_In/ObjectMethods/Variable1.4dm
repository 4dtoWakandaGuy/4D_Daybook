If (False:C215)
	//object Name: [ACTIONS]Action_In.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/09/2013 12:27
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable1"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable1"; $_t_oldMethodName)