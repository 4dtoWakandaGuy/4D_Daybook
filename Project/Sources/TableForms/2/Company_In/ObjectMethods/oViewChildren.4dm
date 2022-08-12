If (False:C215)
	//object Name: [COMPANIES]Company_In.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Variable4"; Form event code:C388)
Comp_SupDown
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.Variable4"; $_t_oldMethodName)
