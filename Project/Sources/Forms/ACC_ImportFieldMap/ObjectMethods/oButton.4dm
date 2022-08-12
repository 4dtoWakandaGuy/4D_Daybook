If (False:C215)
	//object Name: Object Name:      ACC_ImportFieldMap.oButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/02/2012 09:51
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/ACC_ImportFieldMap/oButton"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ ACC_ImportFieldMap.oButton"; $_t_oldMethodName)