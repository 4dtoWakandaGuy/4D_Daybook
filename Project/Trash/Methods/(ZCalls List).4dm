//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZCalls_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2010 15:56
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

$_t_oldMethodName:=ERR_MethodTracker("ZCalls_List")
ZProc("Calls_List"; DB_ProcessMemoryinit(2); "Calls_List")
// See SVS_PrintCallsList
ERR_MethodTrackerReturn("ZCalls_List"; $_t_oldMethodName)