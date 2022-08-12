//%attributes = {}
If (False:C215)
	//Project Method Name:      ZStartup_Export
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("ZStartup_Export")
ZProc("Startup_Export"; DB_ProcessMemoryinit(4); "Create Startup_Import")
ERR_MethodTrackerReturn("ZStartup_Export"; $_t_oldMethodName)
