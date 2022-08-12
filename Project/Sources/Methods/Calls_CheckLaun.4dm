//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_CheckLaun
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	C_LONGINT:C283($_l_Process; $_l_ProcessRow; $_l_ProcessState)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_CheckLaun")
//Calls_Check Launch
//If (◊SinProc)
// Gen_Alert ("This function requires Multiple Processes";"Cancel")
//Else


$_l_ProcessRow:=Find in array:C230(<>PRC_at_ProcessName; "Service Check")
If ($_l_ProcessRow>0)
	$_l_ProcessState:=Process state:C330($_l_ProcessRow+3)
	If ($_l_ProcessState#-1)
		RESUME PROCESS:C320($_l_ProcessRow+3)
	Else 
		$_l_Process:=New process:C317("Calls_Check"; DB_ProcessMemoryinit(2); "Service Check")
	End if 
Else 
	$_l_Process:=New process:C317("Calls_Check"; DB_ProcessMemoryinit(2); "Service Check")
End if 
//End if
ERR_MethodTrackerReturn("Calls_CheckLaun"; $_t_oldMethodName)