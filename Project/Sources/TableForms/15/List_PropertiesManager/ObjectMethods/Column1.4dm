If (False:C215)
	//object Name: [USER]List_PropertiesManager.Column1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/09/2012 22:59
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_PropertiesManager.Column1"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [USER].List_PropertiesManager.Column1"; $_t_oldMethodName)