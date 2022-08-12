//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_ModEnable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 13:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Mod_at_LocalisedModuleName;0)
	C_LONGINT:C283(<>BarPos; <>MENU_l_BarModule; <>MenuProc)
	C_TEXT:C284($_t_ModuleMenuName; $_t_oldMethodName; $_t_VolumesMenuName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_ModEnable")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
If (<>BarPos>0)  //The is enable the current volume and sets the check mark.
	//TRACE
	$_t_ModuleMenuName:=Get localized string:C991(<>Mod_at_LocalisedModuleName{<>MENU_l_BarModule})
	DB_MenuAction($_t_VolumesMenuName; $_t_ModuleMenuName; 2; ""; <>MenuProc; False:C215)
	DB_MenuAction($_t_VolumesMenuName; $_t_ModuleMenuName; 4; ""; <>MenuProc; False:C215)
	
	
End if 
ERR_MethodTrackerReturn("Menu_ModEnable"; $_t_oldMethodName)
