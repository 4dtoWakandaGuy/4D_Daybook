//%attributes = {}

If (False:C215)
	//Project Method Name:      On_EventCmdS
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
	C_LONGINT:C283($_l_Process; $_l_ProcessState; $_l_ProcessTime)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("On_EventCmdS")

//$_t_oldMethodName:=ERR_MethodTracker ("On_EventCmdS")
$_l_Process:=Frontmost process:C327(*)
PROCESS PROPERTIES:C336($_l_Process; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
If ($_t_ProcessName#"Design Process")
	Gen_PallShow
	FILTER EVENT:C321
End if 
//ERR_MethodTrackerReturn ("On_EventCmdS";$_t_oldMethodName)