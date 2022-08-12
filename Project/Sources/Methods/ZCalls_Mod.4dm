//%attributes = {}
If (False:C215)
	//Project Method Name:      ZCalls_Mod
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
	C_LONGINT:C283(<>K3)
	C_POINTER:C301($0; $3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZCalls_Mod")
If (Count parameters:C259>=3)
	$3->:=ZProc_withReply("Calls_Mod"; DB_ProcessMemoryinit(3); "View Calls"; $1; $2)
	
Else 
	ZProc("Calls_Mod"; <>K3; "View Calls")
End if 
ERR_MethodTrackerReturn("ZCalls_Mod"; $_t_oldMethodName)