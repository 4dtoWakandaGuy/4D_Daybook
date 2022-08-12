//%attributes = {}

If (False:C215)
	//Project Method Name:      Processes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MenuProc; <>ProcProc; $_l_Menu; $_l_menu_command; $_l_processpalleteproc)
	C_REAL:C285(<>_l_ProcPaletteWinSizeState)
	C_TEXT:C284($_t_oldMethodName; $_t_VolumesMenuName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Processes")

//Processes
If (<>MenuProc=0)
	<>MenuProc:=1
End if 

$_t_oldMethodName:=ERR_MethodTracker("Processes")

$_l_Menu:=Menu selected:C152\65536
$_l_menu_command:=Menu selected:C152%65536

$_l_processpalleteproc:=Process number:C372("$Processes")
$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
If (False:C215)
	If (Get menu title:C430($_l_Menu)="Volumes")
		If ($_l_processpalleteproc<=0)
			<>ProcProc:=New process:C317("Processes2"; DB_ProcessMemoryinit(4); "$Processes")
			$_l_processpalleteproc:=<>ProcProc
			
			DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_WindowsPalette"); 4; "18"; <>menuProc; False:C215)
			
		Else 
			<>ProcProc:=0
			RESUME PROCESS:C320($_l_processpalleteproc)
			POST OUTSIDE CALL:C329($_l_processpalleteproc)
			SHOW PROCESS:C325($_l_processpalleteproc)
			
			DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_WindowsPalette"); 4; ""; <>menuProc; False:C215)
		End if 
	Else 
		If ($_l_processpalleteproc<=0)
			<>ProcProc:=New process:C317("Processes2"; DB_ProcessMemoryinit(4); "$Processes")
			
			DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_WindowsPalette"); 4; "18"; <>menuProc; False:C215)
		Else 
			If (<>_l_ProcPaletteWinSizeState=0)  //maximize proc palette
				<>_l_ProcPaletteWinSizeState:=1
				DB_MenuAction(Get menu title:C430($_l_Menu); Get menu item:C422($_l_Menu; $_l_menu_command); 4; "18"; <>menuProc; False:C215)
				DB_MenuAction(Get menu title:C430($_l_Menu); Get menu item:C422($_l_Menu; $_l_menu_command); 4; "18"; Current process:C322; False:C215)
			Else   //minimize proc palette
				<>_l_ProcPaletteWinSizeState:=0
				DB_MenuAction(Get menu title:C430($_l_Menu); Get menu item:C422($_l_Menu; $_l_menu_command); 4; ""; <>menuProc; False:C215)
				DB_MenuAction(Get menu title:C430($_l_Menu); Get menu item:C422($_l_Menu; $_l_menu_command); 4; ""; Current process:C322; False:C215)
				
			End if 
		End if 
		RESUME PROCESS:C320($_l_processpalleteproc)
		POST OUTSIDE CALL:C329($_l_processpalleteproc)
		SHOW PROCESS:C325($_l_processpalleteproc)
	End if 
End if 
ERR_MethodTrackerReturn("Processes"; $_t_oldMethodName)
