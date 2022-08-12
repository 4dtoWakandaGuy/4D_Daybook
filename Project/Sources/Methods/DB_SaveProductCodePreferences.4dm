//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_SaveProductCodePreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_SaveProductCodePreferences")
DB_LoadProductCodePreferences(True:C214)
ERR_MethodTrackerReturn("DB_SaveProductCodePreferences"; $_t_oldMethodName)