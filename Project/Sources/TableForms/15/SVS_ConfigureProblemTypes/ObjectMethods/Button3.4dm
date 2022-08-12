If (False:C215)
	//object Name: [USER]SVS_ConfigureProblemTypes.Button3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:24
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SVS_ConfigureProblemTypes.Button3"; Form event code:C388)
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].SVS_ConfigureProblemTypes.Button3"; $_t_oldMethodName)