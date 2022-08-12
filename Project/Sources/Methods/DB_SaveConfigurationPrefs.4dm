//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SaveConfigurationPrefs
	//------------------ Method Notes ------------------
	//Simple passthrough method to save the basic configuration.
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 06:17
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

$_t_oldMethodName:=ERR_MethodTracker("DB_SaveConfigurationPrefs")
DB_LoadConfigurationPrefs(True:C214)
ERR_MethodTrackerReturn("DB_SaveConfigurationPrefs"; $_t_oldMethodName)