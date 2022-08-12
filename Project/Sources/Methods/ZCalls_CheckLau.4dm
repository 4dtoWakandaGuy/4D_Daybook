//%attributes = {}
If (False:C215)
	//Project Method Name:      ZCalls_CheckLau
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

$_t_oldMethodName:=ERR_MethodTracker("ZCalls_CheckLau")
ZProc("Calls_CheckLaun"; DB_ProcessMemoryinit(2); "Checking Calls")
ERR_MethodTrackerReturn("ZCalls_CheckLau"; $_t_oldMethodName)
