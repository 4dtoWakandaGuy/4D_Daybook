//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_Swtch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	C_BOOLEAN:C305(<>StatsSwitch; <>SYS_bo_StatsView)
	C_LONGINT:C283(<>BAR; <>MENU_l_BarModule; <>MenuProc)
	C_TEXT:C284($_t_FileMenuName; $_t_oldMethodName; $_t_oldMethodName2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("StatsView_Swtch")

If (<>MenuProc=0)
	<>MenuProc:=1
End if 
$_t_FileMenuName:=Get localized string:C991("Menu_File")
If ((DB_GetModuleSettingByNUM(1))#5)
	Menu_Record("StatsView Swtch"; "Statistics View")
	If (<>SYS_bo_StatsView=True:C214)
		<>StatsSwitch:=True:C214
		
		StatsView_Setup
		<>SYS_bo_StatsView:=False:C215
		If (Application type:C494#4D Server:K5:6)
			POST OUTSIDE CALL:C329(Frontmost process:C327(*))
		End if 
		
		If (Is Windows:C1573)  //needed to force it to turn the check off
			
			If (<>MENU_l_BarModule<=Size of array:C274(<>Mod_at_ProcessFunction))
				If (<>Mod_at_ProcessFunction{<>MENU_l_BarModule}#"")
					<>Bar:=0
					$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
					EXECUTE FORMULA:C63(<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
				End if 
			End if 
			
		Else 
			DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Statisticsview"); 4; ""; <>MenuProc; False:C215)
			
		End if 
	Else 
		//  If (◊Screen="")
		//  Gen_Confirm ("You cannot use Statistics View with 9 inch screens in use";"13in
		// If (OK=1)
		//  ◊Screen:="13"
		//  CHECK ITEM(1;8+Menu_FileSG ;"18";◊MenuProc)
		//  ◊StatsView:=True
		//  CHECK ITEM(1;14+Menu_FileSG ;"18";◊MenuProc)
		// End if
		//  Else
		<>SYS_bo_StatsView:=True:C214
		DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Statisticsview"); 4; "18"; <>MenuProc; False:C215)
		
		<>StatsSwitch:=True:C214
		If (Application type:C494#4D Server:K5:6)
			POST OUTSIDE CALL:C329(Frontmost process:C327(*))
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("StatsView_Swtch"; $_t_oldMethodName)
