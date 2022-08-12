//%attributes = {}
If (False:C215)
	//Project Method Name:      ZUser_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 17:12`Method: ZUser_Mod
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

$_t_oldMethodName:=ERR_MethodTracker("ZUser_Mod")
ZProc("User_Mod"; DB_ProcessMemoryinit(4); "Preferences")
ERR_MethodTrackerReturn("ZUser_Mod"; $_t_oldMethodName)