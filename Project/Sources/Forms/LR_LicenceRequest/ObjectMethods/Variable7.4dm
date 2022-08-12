If (False:C215)
	//object Name: Object Name:      LR_LicenceRequest.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 19:02
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ LR_LicenceRequest.Variable7")

$_t_oldMethodName:=ERR_MethodTracker("OBJ LR_LicenceRequest.Variable7"; Form event code:C388)
Path_TestDlogOK
ERR_MethodTrackerReturn("OBJ LR_LicenceRequest.Variable7"; $_t_oldMethodName)
