//%attributes = {}
If (False:C215)
	//Project Method Name:      ZRecord_Bar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 15:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MenuProc; <>RecBarUp; $_l_MenuBarProcess; $_l_ProcessState; $_l_ProcessTime)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $_t_VolumesMenuName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZRecord_Bar")
$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
Menu_Record("ZRecord_Bar"; Get localized string:C991("MenuItem_MacrosPalette"))

If (<>RecBarUp>0)
	$_l_MenuBarProcess:=<>RecBarUp
	//◊RecBarUp:=0 Changed NG
	//this is used to HIDE the process-it did end it
	PROCESS PROPERTIES:C336(<>RecBarUp; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
	If ($_l_ProcessState>=0)  // 30/05/02 pb
		SET PROCESS VARIABLE:C370(<>RecBarUp; SM_l_ShowScripts; 2)
		POST OUTSIDE CALL:C329($_l_MenuBarProcess)
		DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_MacrosPalette"); 4; ""; <>menuProc; False:C215)
	End if 
	<>RecBarUp:=0
	
Else 
	If (((Gen_Option) | (Screen height:C188>480)) & (DB_GetModuleSettingByNUM(1)#5))
		<>RecBarUp:=New process:C317("Record_BarList"; 256000; "Macro List")
	Else 
		<>RecBarUp:=New process:C317("Record_Bar"; 256000; "Macro Palette")
	End if 
	//◊newSetsProcess:=◊RecBarUp  `Rollo 25/11/2004
	
End if 
ERR_MethodTrackerReturn("ZRecord_Bar"; $_t_oldMethodName)
