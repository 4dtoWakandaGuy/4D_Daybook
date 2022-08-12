If (False:C215)
	//object Name: Object Name:      CCM_TestOptions.Button
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ CCM_TestOptions.Button"; Form event code:C388)
ACCEPT:C269
ERR_MethodTrackerReturn("OBJ CCM_TestOptions.Button"; $_t_oldMethodName)