//%attributes = {}
If (False:C215)
	//Project Method Name:      ZStartup_SetOB
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

$_t_oldMethodName:=ERR_MethodTracker("ZStartup_SetOB")
ZProc("Startup_SetOB"; DB_ProcessMemoryinit(2); "Opening Balances")
ERR_MethodTrackerReturn("ZStartup_SetOB"; $_t_oldMethodName)
