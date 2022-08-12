If (False:C215)
	//object Name: [PERSONNEL_GROUPS]Groups_In.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL_GROUPS].Groups_In.Variable4"; Form event code:C388)
FORM GOTO PAGE:C247(2)
ERR_MethodTrackerReturn("OBJ [PERSONNEL_GROUPS].Groups_In.Variable4"; $_t_oldMethodName)