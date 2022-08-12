//%attributes = {}
If (False:C215)
	//Project Method Name:      Access_Switch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>MenuProc)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	C_LONGINT:C283(<>MENU_l_BarModule; <>MenuProc; <>Bar; <>MENU_l_BarModule)
	C_TEXT:C284($_t_ExecuteMethodName; $_t_FileMenuName; $_t_oldMethodName; <>SYS_t_AccessType; $_t_ExecuteMethodName; $_t_FileMenuName; $_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Access_Switch")

If (<>MenuProc=0)
	<>MenuProc:=1
End if 
$_t_FileMenuName:=Get localized string:C991("Menu_File")
Menu_Record("Access_Switch"; "QuickAccess")

If (<>SYS_t_AccessType="Q")
	<>SYS_t_AccessType:=""
	If (Is Windows:C1573)  //needed to force it to turn the check off
		//DB_MenuAction ($_t_FileMenuName;"Quick Access";4;"";◊MenuProc;False)
		
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
		
		//DB_MenuAction ($_t_FileMenuName;"Quick Access";4;"";◊MenuProc;False)
		
	End if 
Else 
	<>SYS_t_AccessType:="Q"
	
	
	//DB_MenuAction ($_t_FileMenuName;"Quick Access";4;"18";◊MenuProc;False)
	
End if 
ERR_MethodTrackerReturn("Access_Switch"; $_t_oldMethodName)
