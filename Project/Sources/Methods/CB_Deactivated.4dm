//%attributes = {}
If (False:C215)
	//Project Method Name:      CB_Deactivated
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
	C_BOOLEAN:C305(<>SYS_bo_Active)
	C_LONGINT:C283($_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CB_Deactivated")
Gen_PallHide
<>SYS_bo_Active:=False:C215
$_l_Process:=Process_No("$ScreenSaveWin")
If ($_l_Process>0)
	PAUSE PROCESS:C319($_l_Process)
End if 
$_l_Process:=Process_No("$ScrnSaveChange")
If ($_l_Process>0)
	PAUSE PROCESS:C319($_l_Process)
End if 
ERR_MethodTrackerReturn("CB_Deactivated"; $_t_oldMethodName)