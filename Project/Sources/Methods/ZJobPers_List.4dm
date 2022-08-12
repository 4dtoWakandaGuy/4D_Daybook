//%attributes = {}
If (False:C215)
	//Project Method Name:      ZJobPers_List
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

$_t_oldMethodName:=ERR_MethodTracker("ZJobPers_List")
ZProc("JobPers_List"; DB_ProcessMemoryinit(2); "Job Personnel List")
ERR_MethodTrackerReturn("ZJobPers_List"; $_t_oldMethodName)