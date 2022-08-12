//%attributes = {}
If (False:C215)
	//Project Method Name:      ResumeBackgrounder
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
	C_LONGINT:C283(<>SYS_bo_ReloadBackupPrefs; $_l_BackgrounderServerProc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ResumeBackgrounder")
$_l_BackgrounderServerProc:=Process number:C372("Backgrounder Process"; *)
If ($_l_BackgrounderServerProc#0)  //Is backgrounder running on server
	<>SYS_bo_ReloadBackupPrefs:=1
	RESUME PROCESS:C320($_l_BackgrounderServerProc)
End if 
ERR_MethodTrackerReturn("ResumeBackgrounder"; $_t_oldMethodName)
