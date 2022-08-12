//%attributes = {}

If (False:C215)
	//Project Method Name:      On_EventCmdW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; $_l_ProcessState; $_l_ProcessTime; DB_l_ButtonClickedFunction)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("On_EventCmdW")

$_l_Process:=Frontmost process:C327(*)
PROCESS PROPERTIES:C336($_l_Process; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
If ($_t_ProcessName#"Design Process")
	SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Close"))
	POST OUTSIDE CALL:C329($_l_Process)
	FILTER EVENT:C321
End if 
//ERR_MethodTrackerReturn ("On_EventCmdW";$_t_oldMethodName)