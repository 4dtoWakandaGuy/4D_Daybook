If (False:C215)
	//object Name: [USER]INT_SkinSelector.Variable6
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].INT_SkinSelector.Variable6"; Form event code:C388)
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].INT_SkinSelector.Variable6"; $_t_oldMethodName)