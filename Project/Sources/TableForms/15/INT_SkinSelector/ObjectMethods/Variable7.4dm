If (False:C215)
	//object Name: [USER]INT_SkinSelector.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].INT_SkinSelector.Variable7"; Form event code:C388)
INT_SaveMyPreference
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].INT_SkinSelector.Variable7"; $_t_oldMethodName)