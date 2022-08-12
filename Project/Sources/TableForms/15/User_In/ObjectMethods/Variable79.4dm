If (False:C215)
	//object Name: [USER]User_In.Variable79
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/08/2012 11:12
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable79"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable79"; $_t_oldMethodName)