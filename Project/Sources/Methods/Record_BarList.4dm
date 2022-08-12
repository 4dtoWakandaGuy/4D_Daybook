//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_BarList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 14:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>BAR; <>MENU_l_BarModule; <>MenuProc; <>newSetsProcess; <>RecBarUp; <>SCPT_l_PlayerActive; $_l_ProcessState; $_l_ProcessTime; MOD_l_CurrentModuleAccess)
	C_TEXT:C284(<>KEYS; $_t_oldMethodName; $_t_processName; $_t_VolumesMenuName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_BarList")

If (<>MenuProc=0)
	<>MenuProc:=1
End if 

PROCESS PROPERTIES:C336(<>NewSetsProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime)

If ($_t_processName#"Set Manager")
	<>newSetsProcess:=0
Else 
	If ($_l_ProcessState<0)
		<>newSetsProcess:=0
	End if 
End if 

If (<>newSetsProcess=0)
	<>newSetsProcess:=New process:C317("Gen_SetManager"; 128000; "Set Manager"; 0; 0; 0; 1)
	<>RecBarUp:=<>newSetsProcess
Else 
	<>RecBarUp:=<>newSetsProcess
	PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
	If ($_l_ProcessState>=0)  // 29/05/02
		SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_ShowScripts; 1)
		POST OUTSIDE CALL:C329(<>newSetsProcess)
		$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
		DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_MacrosPalette"); 4; "18"; <>menuProc; False:C215)
	End if 
End if 
ERR_MethodTrackerReturn("Record_BarList"; $_t_oldMethodName)
