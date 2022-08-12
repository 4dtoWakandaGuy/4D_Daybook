//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Menu ModIcon
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	C_BOOLEAN:C305(<>ModuleIcons)
	C_LONGINT:C283(<>BAR; <>MENU_l_BarModule; <>Mod_l_MenuBarPaletteProcess)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Menu ModIcon")

//this menu item has been removed now
If ((DB_GetModuleSettingByNUM(1))#5)
	Menu_Record("Menu ModIcon"; "Module Icons")
	
	If (<>ModuleIcons=True:C214)
		<>ModuleIcons:=False:C215
		If (Is Windows:C1573)  //needed to force it to turn the check off
			
			If (<>MENU_l_BarModule<=Size of array:C274(<>Mod_at_ProcessFunction))
				If (<>Mod_at_ProcessFunction{<>MENU_l_BarModule}#"")
					<>Bar:=0
					$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
					EXECUTE FORMULA:C63(<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
				End if 
			End if 
			
			
		Else 
			
		End if 
	Else 
		<>ModuleIcons:=True:C214
		
	End if 
	If (<>Mod_l_MenuBarPaletteProcess>0)
		ZMenu_ModBar2
		ZMenu_ModBar2
	Else 
		ZMenu_ModBar2
	End if 
End if 
ERR_MethodTrackerReturn("Menu ModIcon"; $_t_oldMethodName)
