If (False:C215)
	//object Name: Object Name:      ACC_ImportStatement.oButtonContinue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/05/2012 15:43
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ImportStatement.oButtonContinue"; Form event code:C388)
CANCEL:C270
ERR_MethodTrackerReturn("OBJ ACC_ImportStatement.oButtonContinue"; $_t_oldMethodName)