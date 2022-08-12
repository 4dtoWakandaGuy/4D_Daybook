//%attributes = {}
If (False:C215)
	//Project Method Name:      ZRecord_BarList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/05/2010 17:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>RecBarUp; $_l_MenuBarProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZRecord_BarList")
Menu_Record("ZRecord_BarList"; Get localized string:C991("MenuItem_MacrosPalette"))

If ((DB_GetModuleSettingByNUM(1))#5)
	If (<>RecBarUp>0)
		$_l_MenuBarProcess:=<>RecBarUp
		<>RecBarUp:=0
		POST OUTSIDE CALL:C329($_l_MenuBarProcess)
	Else 
		<>RecBarUp:=New process:C317("Record_BarList"; 256000; "Macro List")
	End if 
Else 
	Gen_Alert("The larger Macros Palette is not available in Silver"; "Cancel")
End if 
ERR_MethodTrackerReturn("ZRecord_BarList"; $_t_oldMethodName)