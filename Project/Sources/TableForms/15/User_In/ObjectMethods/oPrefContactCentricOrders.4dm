If (False:C215)
	//object Name: [USER]User_In.Variable14
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 15:24
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable14"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable14"; $_t_oldMethodName)