
If (False:C215)
	//Object Name:      Temp.oSearchvalue
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ Temp.oSearchvalue"; Form event code:C388)
//automatically repaired method
ERR_MethodTrackerReturn("OBJ Temp.oSearchvalue"; $_t_oldMethodName)