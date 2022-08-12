//%attributes = {}
If (False:C215)
	//Project Method Name:      ZWebAccess_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 17:12`Method: ZWebAccess_Mod
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

$_t_oldMethodName:=ERR_MethodTracker("ZWebAccess_Mod")
ZProc("WebAccess_Mod"; DB_ProcessMemoryinit(2); "Web Access")
ERR_MethodTrackerReturn("ZWebAccess_Mod"; $_t_oldMethodName)