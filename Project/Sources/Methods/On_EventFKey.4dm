//%attributes = {}

If (False:C215)
	//Project Method Name:      On_EventFKey
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
	C_LONGINT:C283(<>AutoProc; $_l_Process; $_l_ProcessState; $_l_ProcessTime)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("On_EventFKey")

//$_t_oldMethodName:=ERR_MethodTracker ("On_EventFKey")
//On_EventFKey
//See also Macro_MenuFile
//If (◊RecPlayUp=0)
// If (◊RecEditUp=0)
If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
	$_l_Process:=Frontmost process:C327(*)
	PROCESS PROPERTIES:C336($_l_Process; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
	If ($_t_ProcessName#"Design Process")
		<>AutoProc:=Keycode
		$_l_ProcessState:=New process:C317("Record_FKey"; DB_ProcessMemoryinit(4); "Macro FKey")
		FILTER EVENT:C321
	End if 
Else 
	Gen_Alert("You do not have access to Macros"; "Cancel")
End if 
// End if
//End if
//ERR_MethodTrackerReturn ("On_EventFKey";$_t_oldMethodName)