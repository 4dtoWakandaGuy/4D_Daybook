If (False:C215)
	//object Name: [SCRIPTS]Scripts_in.Variable6
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Scripts_in.Variable6"; Form event code:C388)
FORM GOTO PAGE:C247(1)
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Scripts_in.Variable6"; $_t_oldMethodName)