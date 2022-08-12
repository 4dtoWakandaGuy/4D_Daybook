//%attributes = {}
If (False:C215)
	//Project Method Name:      Menus_Button
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>BAR; <>MenuProc)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menus_Button")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
//Copied to Menu Button scripts
If (((Gen_Option) | (Frontmost process:C327(*)=<>MenuProc)) & (DB_GetModuleSettingByNUM(Module_DiaryManager)>1) & (<>Bar#1) & (<>Bar#20) & (DB_GetModuleSettingByNUM(1)#5))
	//Menu Main
	// Menu_UpdateWin
	Menus
	Gen_PostKey(1; 49; 256)
Else 
	Menus
End if 
ERR_MethodTrackerReturn("Menus_Button"; $_t_oldMethodName)