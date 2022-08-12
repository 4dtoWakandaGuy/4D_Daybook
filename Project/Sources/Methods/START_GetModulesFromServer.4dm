//%attributes = {}
If (False:C215)
	//Project Method Name:      START_GetModulesFromServer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 16:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>Mod_l_MaxModules)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("START_GetModulesFromServer")
While (Semaphore:C143("$CheckingModules"))
	DelayTicks
End while 

If (Application type:C494=4D Remote mode:K5:5)
	Modules_Array
Else 
	Modules_Array
	//Do the server or single user thing
End if 
CLEAR SEMAPHORE:C144("$CheckingModules")
ERR_MethodTrackerReturn("START_GetModulesFromServer"; $_t_oldMethodName)