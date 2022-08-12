//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_FindMy
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
	C_BOOLEAN:C305(<>FindMy)
	C_LONGINT:C283(<>BAR; <>MENU_l_BarModule; <>MenuProc)
	C_TEXT:C284($_t_FileMenuName; $_t_oldMethodName; $_t_oldMethodName2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Menu_FindMy")

If (<>MenuProc=0)
	<>MenuProc:=1
End if 

Menu_Record("Menu FindMy"; "Find My Data")
$_t_FileMenuName:=Get localized string:C991("Menu_File")
If (<>FindMy)
	<>FindMy:=False:C215
	If (Is Windows:C1573)  //needed to force it to turn the check off
		
		If (<>MENU_l_BarModule<=Size of array:C274(<>Mod_at_ProcessFunction))
			If (<>Mod_at_ProcessFunction{<>MENU_l_BarModule}#"")
				<>Bar:=0
				$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
				
				EXECUTE FORMULA:C63(<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
			End if 
		End if 
		
	Else 
		DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Finduserdata"); 4; ""; <>MenuProc; False:C215)
		
	End if 
Else 
	<>FindMy:=True:C214
	DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Finduserdata"); 4; "18"; <>MenuProc; False:C215)
	
End if 
ERR_MethodTrackerReturn("Menu_FindMy"; $_t_oldMethodName)
