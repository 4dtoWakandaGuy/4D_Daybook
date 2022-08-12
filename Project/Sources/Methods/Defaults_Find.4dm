//%attributes = {}
If (False:C215)
	//Project Method Name:      Defaults_Find
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	C_BOOLEAN:C305(<>SYS_bo_DefaultEntry; <>SYS_bo_DefaultsFind)
	C_LONGINT:C283(<>BAR; <>MENU_l_BarModule; <>MenuProc)
	C_TEXT:C284($_t_ExecuteMethodName; $_t_FileMenuName; $_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Defaults_Find")

If (<>MenuProc=0)
	<>MenuProc:=1
End if 
$_t_FileMenuName:=Get localized string:C991("Menu_File")
Menu_Record("Defaults_Find"; "Find Defaults")
If (<>SYS_bo_DefaultsFind)
	<>SYS_bo_DefaultsFind:=False:C215
	If (Is Windows:C1573)  //needed to force it to turn the check off
		
		If (<>MENU_l_BarModule<=Size of array:C274(<>Mod_at_ProcessFunction))
			If (<>Mod_at_ProcessFunction{<>MENU_l_BarModule}#"")
				<>Bar:=0
				//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
				//EXECUTE FORMULA(<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
				$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace(<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
				EXECUTE METHOD:C1007($_t_ExecuteMethodName)
				
				
			End if 
		End if 
		
	Else 
		DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Finddefaults"); 4; ""; <>MenuProc; False:C215)
	End if 
	If (<>SYS_bo_DefaultEntry=False:C215)
		Defaults_Clear
	End if 
Else 
	<>SYS_bo_DefaultsFind:=True:C214
	DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Finddefaults"); 4; "18"; <>MenuProc; False:C215)
End if 
ERR_MethodTrackerReturn("Defaults_Find"; $_t_oldMethodName)
