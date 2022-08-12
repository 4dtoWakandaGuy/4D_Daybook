//%attributes = {}
If (False:C215)
	//Project Method Name:      ZCalls_In
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

$_t_oldMethodName:=ERR_MethodTracker("ZCalls_In")
ZProc("Calls_In"; DB_ProcessMemoryinit(3); "Enter Calls")
ERR_MethodTrackerReturn("ZCalls_In"; $_t_oldMethodName)