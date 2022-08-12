//%attributes = {}
If (False:C215)
	//Project Method Name:      ZJobs_TS
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

$_t_oldMethodName:=ERR_MethodTracker("ZJobs_TS")
ZProc("Jobs_TS"; DB_ProcessMemoryinit(1); "Time Sheets")
ERR_MethodTrackerReturn("ZJobs_TS"; $_t_oldMethodName)
