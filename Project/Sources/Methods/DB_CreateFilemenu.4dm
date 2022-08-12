//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CreateFilemenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       08/05/2010 15:44
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_MenuShortCutModifier;0)
	//ARRAY LONGINT(DB_al_SubMenuShortCutmodifier;0;0)
	//ARRAY TEXT(DB_at_menuitem;0)
	//ARRAY TEXT(DB_at_MenuItem4DFunction;0)
	//ARRAY TEXT(DB_at_MenuItemParameter;0)
	//ARRAY TEXT(DB_at_MenuShortCut;0)
	//ARRAY TEXT(DB_at_SubMenu1Item4DFunction;0;0)
	//ARRAY TEXT(DB_at_SubMenu1ItemParameter;0;0)
	//ARRAY TEXT(DB_at_Submenuitem;0;0)
	//ARRAY TEXT(DB_at_SubMenuReference;0)
	//ARRAY TEXT(DB_at_SubMenuShortCut;0;0)
	C_BOOLEAN:C305(DB_FIlemenuActivated)
	C_TEXT:C284($_t_ChangeAccessLabel; $_t_EntryDefaultLabel; $_t_ExitLabel; $_t_ExitToUserLabel; $_t_FindDefaultLabel; $_t_MenuReference; $_t_MenuType; $_t_oldMethodName; $_t_ProcessesLabel; $0; $1)
	C_TEXT:C284($2; $3; DB_t_MenusFormat; DB_t_MenusSetting; Db_t_MenuType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CreateFilemenu")

If (Count parameters:C259>=1)
	Db_t_MenuType:=$1
End if 
If (Count parameters:C259>=2)
	DB_t_MenusFormat:=$2
End if 
If (Count parameters:C259>=3)
	DB_t_MenusSetting:=$3
End if 
If (Db_t_MenuType#"Menu string")
	$_t_MenuReference:=Create menu:C408
	$_t_MenuType:=Db_t_MenuType
	If ($_t_MenuType="")
		$_t_MenuType:="4D Menu"
	End if 
Else 
	$_t_MenuReference:=""
	ARRAY TEXT:C222(DB_at_menuitem; 0)
	ARRAY TEXT:C222(DB_at_MenuShortCut; 0)
	ARRAY LONGINT:C221(DB_al_MenuShortCutModifier; 0)
	
	ARRAY TEXT:C222(DB_at_MenuItem4DFunction; 0)
	ARRAY TEXT:C222(DB_at_MenuItemParameter; 0)
	ARRAY TEXT:C222(DB_at_SubMenuReference; 0)
	//``
	ARRAY TEXT:C222(DB_at_SubMenuReference; 0)  //tells us the row
	ARRAY TEXT:C222(DB_at_Submenuitem; 0; 0)
	ARRAY TEXT:C222(DB_at_SubMenuShortCut; 0; 0)
	ARRAY LONGINT:C221(DB_al_SubMenuShortCutmodifier; 0; 0)
	
	ARRAY TEXT:C222(DB_at_SubMenu1Item4DFunction; 0; 0)
	ARRAY TEXT:C222(DB_at_SubMenu1ItemParameter; 0; 0)
	$_t_MenuType:=Db_t_MenuType
End if 



Case of 
	: ($_t_MenuType="4D menu")
		//Change to take out process window
		
		//$_t_ProcessesLabel:=Get localized string("MenuItem_Processes")
		//INSERT MENU ITEM($_t_MenuReference;-1;$_t_ProcessesLabel)
		//SET MENU ITEM METHOD($_t_MenuReference;-1;"ProcessesP")
		//$MenuShortCut:=Character code("=")
		//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$MenuShortCut)
		
		$_t_ChangeAccessLabel:=Get localized string:C991("MenuItem_ChangeAccess")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_ChangeAccessLabel)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "Change_AccessP")
		
		INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
		
		
		$_t_EntryDefaultLabel:=Get localized string:C991("MenuItem_Entrydefaults")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_EntryDefaultLabel)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "Defaults_Entry")
		
		$_t_FindDefaultLabel:=Get localized string:C991("MenuItem_Finddefaults")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_FindDefaultLabel)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "Defaults_Find")
		
		$_t_FindDefaultLabel:=Get localized string:C991("MenuItem_Finduserdata")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_FindDefaultLabel)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "Menu_FindMy")
		
		$_t_FindDefaultLabel:=Get localized string:C991("MenuItem_Statisticsview")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_FindDefaultLabel)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "StatsView_Swtch")
		
		INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
		
		$_t_FindDefaultLabel:=Get localized string:C991("MenuItem_Reportabug")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_FindDefaultLabel)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "ERR_ReporterTool")
		
		
		$_t_FindDefaultLabel:=Get localized string:C991("MenuItem_debugwindow")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_FindDefaultLabel)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "ErrorDebugInit")
		
		INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
		If (Current user:C182="Administrator") | (Current user:C182="Designer") | (User in group:C338(Current user:C182; "Administrator"))
			
			If (Is macOS:C1572)
				$_t_ExitToUserLabel:=Get localized string:C991("MenuItem_Quittouser")
			Else 
				$_t_ExitToUserLabel:=Get localized string:C991("MenuItem_ExitUser")
			End if 
			
			INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_ExitToUserLabel)
			SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "Quit_to_User")
		End if 
		
		If (Is macOS:C1572)
			$_t_ExitLabel:=Get localized string:C991("MenuItem_Quit")
		Else 
			$_t_ExitLabel:=Get localized string:C991("MenuItem_Exit")
		End if 
		//DB_FIlemenuActivated:=False
		//If (Not(DB_FIlemenuActivated))
		//$0:=$_t_MenuReference
		//INSERT MENU ITEM($_t_MenuReference;-1;$_t_ExitLabel)
		//SET MENU ITEM METHOD($_t_MenuReference;-1;"Quit")
		
		INSERT MENU ITEM:C412($_t_MenuReference; -1; Get indexed string:C510(131; 30))
		SET MENU ITEM PROPERTY:C973($_t_MenuReference; -1; Associated standard action name:K28:8; ak quit:K76:61)  //Quit
		SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; Character code:C91("Q"))
		DB_FIlemenuActivated:=True:C214
		
	: ($_t_MenuType="menu string")
		$_t_ProcessesLabel:=Get localized string:C991("MenuItem_Processes")
		//APPEND TO ARRAY(DB_at_menuitem;$_t_ProcessesLabel)
		//APPEND TO ARRAY(DB_at_MenuShortCut;"=")
		//APPEND TO ARRAY(DB_al_MenuShortCutModifier;0)
		//APPEND TO ARRAY(DB_at_MenuItem4DFunction;"ProcessesP")
		//APPEND TO ARRAY(DB_at_MenuItemParameter;"")
		
		$_t_ChangeAccessLabel:=Get localized string:C991("MenuItem_ChangeAccess")
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ChangeAccessLabel)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Change_AccessP")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		APPEND TO ARRAY:C911(DB_at_menuitem; "-")
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		$_t_EntryDefaultLabel:=Get localized string:C991("MenuItem_Entrydefaults")
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_EntryDefaultLabel)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Defaults_Entry")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		$_t_FindDefaultLabel:=Get localized string:C991("MenuItem_Finddefaults")
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_FindDefaultLabel)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Defaults_Find")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		
		$_t_FindDefaultLabel:=Get localized string:C991("MenuItem_Finduserdata")
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_FindDefaultLabel)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Menu_FindMy")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		
		$_t_FindDefaultLabel:=Get localized string:C991("MenuItem_Statisticsview")
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_FindDefaultLabel)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "StatsView_Swtch")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		APPEND TO ARRAY:C911(DB_at_menuitem; "-")
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		
		$_t_FindDefaultLabel:=Get localized string:C991("MenuItem_Reportabug")
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_FindDefaultLabel)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "ERR_ReporterTool")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		
		$_t_FindDefaultLabel:=Get localized string:C991("MenuItem_debugwindow")
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_FindDefaultLabel)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "ErrorDebugInit")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		
		
		APPEND TO ARRAY:C911(DB_at_menuitem; "-")
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		If (Current user:C182="Administrator") | (Current user:C182="Designer") | (User in group:C338(Current user:C182; "Administrator"))
			
			If (Is macOS:C1572)
				$_t_ExitToUserLabel:=Get localized string:C991("MenuItem_Quittouser")
			Else 
				$_t_ExitToUserLabel:=Get localized string:C991("MenuItem_ExitUser")
			End if 
			
			APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ExitToUserLabel)
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Quit_to_User")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			
		End if 
		If (Is macOS:C1572)
			$_t_ExitLabel:=Get localized string:C991("MenuItem_Quit")
		Else 
			$_t_ExitLabel:=Get localized string:C991("MenuItem_Exit")
		End if 
		
		APPEND TO ARRAY:C911(DB_at_menuitem; Get indexed string:C510(131; 30))
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "Q")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Quit")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		DB_FIlemenuActivated:=True:C214
		
		
End case 
$0:=$_t_MenuReference
ERR_MethodTrackerReturn("DB_CreateFilemenu"; $_t_oldMethodName)
