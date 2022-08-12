//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Menu ModBar2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(<>Mod_al_ModuleOrder;0)
	ARRAY LONGINT:C221($_al_ModuleSort; 0)
	//ARRAY TEXT(<>MEN_at_ContextualMenuFunctions;0)
	//ARRAY TEXT(<>MEN_at_ContextualMenuItems;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	//ARRAY TEXT(Mod_at_ToolTips;0)
	C_BOOLEAN:C305($_bo_BarState; DB_bo_FontsInited)
	C_LONGINT:C283(<>BAR; <>MENU_l_BarModule; <>MenuProc; <>Mod_l_MaxModules; <>Mod_l_MenuBarPaletteProcess; <>PER_l_CurrentPersFunctions; <>SYS_l_WindowTop; <>WIN_MINTOP; $_l_CurrentWinRefOLD; $_l_DefaultSpaceRequired; $_l_MaxBarWidth)
	C_LONGINT:C283($_l_MenuBarScreen; $_l_VisibleModules; $_l_Windowbottom; $_l_Windowleft; $_l_Windowright; $_l_WindowTop; vSNo; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; $_t_VolumesMenuName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TIME:C306(vTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Menu ModBar2")


//ALERT("Starting MenuModBar2, 1")
//Menu ModBar2 - the new Modules palette
ARRAY TEXT:C222(<>MEN_at_ContextualMenuItems; 0)
ARRAY TEXT:C222(<>MEN_at_ContextualMenuFunctions; 0)

//ALERT("Starting MenuModBar2, 2")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
//ALERT("Starting MenuModBar2, 3")
$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
//ALERT("Starting MenuModBar2, 4")
Start_ProcCount("Module Palette")
//ALERT("Starting MenuModBar2, 5")
DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_VolumesPalette"); 4; "18"; <>MenuProc; False:C215)
//ALERT("Starting MenuModBar2, 6")
While (Semaphore:C143("$BarMod"))
	DelayTicks
End while 
//ALERT("Starting MenuModBar2, 7")

ARRAY INTEGER:C220(<>MOD_al_ModuleBarNum; 50)
ARRAY TEXT:C222(Mod_at_ToolTips; 50)
DB_t_CurrentFormUsage:="ModBar"  //To prevent the Menu procs from calling this procedure
DB_t_CurrentFormUsage3:=""
vSNo:=0  //the var used to store the current Module No clicked
vTime:=?00:00:00?
//ALERT("Starting MenuModBar2, 8")
If ((DB_GetModuleSettingByNUM(1))=5)  //If Silver only ever show up to 5
	$_l_VisibleModules:=1
	// INSERT ELEMENT(◊MOD_al_ModuleBarNum;$_l_VisibleModules;1)
	<>MOD_al_ModuleBarNum{$_l_VisibleModules}:=1
	Mod_at_ToolTips{$_l_VisibleModules}:=<>Mod_at_ModuleName{<>MOD_al_ModuleBarNum{$_l_VisibleModules}}
	If ((DB_GetModuleSettingByNUM(30))>1)
		$_l_VisibleModules:=$_l_VisibleModules+1
		//  INSERT ELEMENT(◊MOD_al_ModuleBarNum;$_l_VisibleModules;1)
		<>MOD_al_ModuleBarNum{$_l_VisibleModules}:=30
		Mod_at_ToolTips{$_l_VisibleModules}:=<>Mod_at_ModuleName{<>MOD_al_ModuleBarNum{$_l_VisibleModules}}
	End if 
	If ((DB_GetModuleSettingByNUM(Module_WPManager))>1)
		
		$_l_VisibleModules:=$_l_VisibleModules+1
		//   INSERT ELEMENT(◊MOD_al_ModuleBarNum;$_l_VisibleModules;1)
		<>MOD_al_ModuleBarNum{$_l_VisibleModules}:=3
		Mod_at_ToolTips{$_l_VisibleModules}:=<>Mod_at_ModuleName{<>MOD_al_ModuleBarNum{$_l_VisibleModules}}
	End if 
	If ((DB_GetModuleSettingByNUM(Module_JobCosting))>1)
		$_l_VisibleModules:=$_l_VisibleModules+1
		// INSERT ELEMENT(◊MOD_al_ModuleBarNum;$_l_VisibleModules;1)
		<>MOD_al_ModuleBarNum{$_l_VisibleModules}:=9
		Mod_at_ToolTips{$_l_VisibleModules}:=<>Mod_at_ModuleName{<>MOD_al_ModuleBarNum{$_l_VisibleModules}}
	End if 
	If (DB_GetModuleSettingByNUM(Module_DataManager)>1)
		$_l_VisibleModules:=$_l_VisibleModules+1
		// INSERT ELEMENT(◊MOD_al_ModuleBarNum;$_l_VisibleModules;1)
		<>MOD_al_ModuleBarNum{$_l_VisibleModules}:=37
		Mod_at_ToolTips{$_l_VisibleModules}:=<>Mod_at_ModuleName{<>MOD_al_ModuleBarNum{$_l_VisibleModules}}
	End if 
	ARRAY INTEGER:C220(<>MOD_al_ModuleBarNum; $_l_VisibleModules)
Else 
	//ALERT("Starting MenuModBar2, 9")
	ARRAY LONGINT:C221($_al_ModuleSort; 50)
	$_l_VisibleModules:=0
	For ($_l_MaxBarWidth; 1; <>Mod_l_MaxModules)
		//ALERT("Starting MenuModBar2, 10("+String($_l_MaxBarWidth)+")")
		
		If ((DB_GetModuleSettingByNUM($_l_MaxBarWidth))>1)  //If the Module is available
			If (<>Mod_al_ModuleOrder{$_l_MaxBarWidth}#0)  //If it is a Module with a Menu Bar
				If ($_l_MaxBarWidth<=Size of array:C274(<>Mod_al_ModuleOrder))
					If (($_l_MaxBarWidth=32) | ($_l_MaxBarWidth=Module_IntServer))
						//An exception for Telephony so that it doesn't repeat
						$_l_DefaultSpaceRequired:=Find in array:C230(<>MOD_al_ModuleBarNum; 21)
						If ($_l_DefaultSpaceRequired<1)
							$_l_VisibleModules:=$_l_VisibleModules+1
							<>MOD_al_ModuleBarNum{$_l_VisibleModules}:=$_l_MaxBarWidth
							$_al_ModuleSort{$_l_VisibleModules}:=<>Mod_al_ModuleOrder{$_l_MaxBarWidth}
							Mod_at_ToolTips{$_l_VisibleModules}:=<>Mod_at_ModuleName{<>MOD_al_ModuleBarNum{$_l_VisibleModules}}
						End if 
					Else 
						$_l_VisibleModules:=$_l_VisibleModules+1
						<>MOD_al_ModuleBarNum{$_l_VisibleModules}:=$_l_MaxBarWidth
						$_al_ModuleSort{$_l_VisibleModules}:=<>Mod_al_ModuleOrder{$_l_MaxBarWidth}
						Mod_at_ToolTips{$_l_VisibleModules}:=<>Mod_at_ModuleName{<>MOD_al_ModuleBarNum{$_l_VisibleModules}}
					End if 
				End if 
			End if 
		End if 
	End for 
	//ALERT("Starting MenuModBar2, 11")
	ARRAY INTEGER:C220(<>MOD_al_ModuleBarNum; $_l_VisibleModules)
	
	ARRAY LONGINT:C221($_al_ModuleSort; $_l_VisibleModules)
	
	
	ARRAY TEXT:C222(Mod_at_ToolTips; $_l_VisibleModules)
	SORT ARRAY:C229($_al_ModuleSort; <>MOD_al_ModuleBarNum; Mod_at_ToolTips; >)
End if 

CLEAR SEMAPHORE:C144("$BarMod")
//ALERT("Starting MenuModBar2, 12")
$_l_MaxBarWidth:=Screen width:C187-30
$_l_DefaultSpaceRequired:=199+(31*$_l_VisibleModules)
While ($_l_DefaultSpaceRequired>$_l_MaxBarWidth)
	$_l_DefaultSpaceRequired:=$_l_DefaultSpaceRequired-31
End while 
//ALERT("Starting MenuModBar2, 13")
<>WIN_MINTOP:=0
If (Not:C34(DB_bo_FontsInited))
	DB_SetDefaultFonts
End if 
//ALERT("Starting MenuModBar2, 14")
If (<>Bar=0)
	ALERT:C41("19x2")
	Module_First(1; False:C215)
End if 
///ALERT("Starting MenuModBar2, 15")
$_l_MenuBarScreen:=Menu bar screen:C441
If ($_l_MenuBarScreen=1)
	$_l_WindowTop:=<>SYS_l_WindowTop
Else 
	SCREEN COORDINATES:C438($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom; $_l_MenuBarScreen)
End if 
//ALERT("Starting MenuModBar2, 16")
$_bo_BarState:=(<>PER_l_CurrentPersFunctions ?? 2)
If ($_bo_BarState) | (True:C214)
	If (True:C214)
		//ALERT("Starting MenuModBar2, 17")
		$_l_WindowTop:=36+$_l_WindowTop
		//Open window(0;(◊WindowTop+1)-0;0;(◊WindowTop+32+1)-0;-1984)  `Rollo 7/22/2004 - added one pixel to top & bottom
		//Users don't like the window hiding when you move away from the app...so may 2008 changine this back to -2
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		//ALERT("Starting MenuModBar2, 18")
		WIN_l_CurrentWinRef:=Open window:C153(0; (($_l_WindowTop+1)-0); 0; (($_l_WindowTop+32+1)-0); -2)
		//WIN_l_CurrentWinRef:=Open form window([COMPANIES];"WS_TOOLBAR";Toolbar form window;131072;327680)
		
		//ALERT("Starting MenuModBar2, 19("+String(WIN_l_CurrentWinRef)+"top"+String($_l_WindowTop)+")")
		
		//}}}} ) //-> Function result 
		DIALOG:C40([COMPANIES:2]; "WS_TOOLBAR")
		
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	Else 
		$_l_WindowTop:=36+$_l_WindowTop+8
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(0; $_l_WindowTop+8; 0; $_l_WindowTop+32+8; -1986)
		
		DIALOG:C40([COMPANIES:2]; "WS_TOOLBAR")
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	End if 
	
End if 
//ALERT("Starting 5-11-6-pal-14")

<>Mod_l_MenuBarPaletteProcess:=0
If (Is Windows:C1573)  //needed to force it to turn the check off
	
	If (<>MENU_l_BarModule<=Size of array:C274(<>Mod_at_ProcessFunction))
		If (<>Mod_at_ProcessFunction{<>MENU_l_BarModule}#"")
			DB_t_CurrentFormUsage3:="NoCheck"
			<>Bar:=0
			$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
			EXECUTE FORMULA:C63(<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
			DB_t_CurrentFormUsage3:="NoCheck"
		End if 
	End if 
	
Else 
	DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_VolumesPalette"); 4; ""; <>MenuProc; False:C215)
	
End if 
//ALERT("Starting 5-11-6-pal-end")
ERR_MethodTrackerReturn("Menu ModBar2"; $_t_oldMethodName)
