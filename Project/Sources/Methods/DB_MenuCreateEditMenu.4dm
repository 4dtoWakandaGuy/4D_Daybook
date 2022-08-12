//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuCreateEditMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/03/2012 16:48
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
	C_LONGINT:C283($_l_offset; $1)
	C_TEXT:C284($_t_Context; $_t_EditMenu; $_t_MenuType; $_t_oldMethodName; $0; $2; $3; $MenuReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuCreateEditMenu")
If ($MenuReference#"")
	RELEASE MENU:C978($MenuReference)
End if 


If (Count parameters:C259>=2)
	$_t_Context:=$2
Else 
	$_t_Context:=""
End if 
If (Count parameters:C259>=3)
	$_t_MenuType:=$3
Else 
	
	
	$_t_MenuType:="4D menu"
End if 


If ($_t_MenuType="4D menu")
	$_t_EditMenu:=Create menu:C408
End if 
If ($_t_MenuType="menu string")
	//Return the menu into arrays-this can then be passed to the web as a JSON string after some filtering
	//Note these arrays are used on each 'build' of a menu-file-edit-reports-etc etc etc.
	//and on the build of the module menus. they have to be passed into a 2D array which represents the whole menu bar.ARRAY TEXT(DB_at_menuitem;0)
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
End if 
If ($_t_Context="Input")
	Case of 
		: ($_t_MenuType="4D menu")
			APPEND MENU ITEM:C411($_t_EditMenu; "Undo")
			SET MENU ITEM SHORTCUT:C423($_t_EditMenu; 1; Character code:C91("Z"))
			SET MENU ITEM PROPERTY:C973($_t_EditMenu; 1; Associated standard action name:K28:8; ak undo:K76:51)  //_o_Undo action)
			INSERT MENU ITEM:C412($_t_EditMenu; -1; "(-")
			$_l_offset:=2
		: ($_t_MenuType="menu string")
			APPEND TO ARRAY:C911(DB_at_menuitem; "Undo")
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; "Z")
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_TextMenuUndo")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			
			APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
	End case 
Else 
	$_l_offset:=0
End if 
Case of 
	: ($_t_MenuType="4D menu")
		APPEND MENU ITEM:C411($_t_EditMenu; "Cut;Copy;Paste")
		SET MENU ITEM SHORTCUT:C423($_t_EditMenu; 1+$_l_offset; Character code:C91("X"))
		SET MENU ITEM PROPERTY:C973($_t_EditMenu; 1+$_l_offset; Associated standard action name:K28:8; ak cut:K76:53)  //_o_Cut action)
		SET MENU ITEM SHORTCUT:C423($_t_EditMenu; 2+$_l_offset; Character code:C91("C"))
		SET MENU ITEM PROPERTY:C973($_t_EditMenu; 2+$_l_offset; Associated standard action name:K28:8; ak copy:K76:54)  //_o_Copy action)
		SET MENU ITEM SHORTCUT:C423($_t_EditMenu; 3+$_l_offset; Character code:C91("V"))
		SET MENU ITEM PROPERTY:C973($_t_EditMenu; 3+$_l_offset; Associated standard action name:K28:8; ak paste:K76:55)  //_o_Paste action)
		
	: ($_t_MenuType="menu string")
		APPEND TO ARRAY:C911(DB_at_menuitem; "Cut")
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "X")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_TextMenuCut")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		APPEND TO ARRAY:C911(DB_at_menuitem; "Copy")
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "C")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_TextMenuCopy")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		APPEND TO ARRAY:C911(DB_at_menuitem; "Paste")
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "V")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_TextMenuPaste")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
End case 
If ($_t_Context="Input")
	Case of 
		: ($_t_MenuType="4D menu")
			APPEND MENU ITEM:C411($_t_EditMenu; "Clear")
			//SET MENU ITEM SHORTCUT($_t_EditMenu;1+$_l_offset;Character code("X"))
			SET MENU ITEM PROPERTY:C973($_t_EditMenu; 4+$_l_offset; Associated standard action name:K28:8; ak clear:K76:56)  //_o_Clear action)
			APPEND MENU ITEM:C411($_t_EditMenu; "Select all")
			SET MENU ITEM SHORTCUT:C423($_t_EditMenu; -1; Character code:C91("A"))
			SET MENU ITEM PROPERTY:C973($_t_EditMenu; -1; Associated standard action name:K28:8; ak select all:K76:57)  //_o_Select all action)
			INSERT MENU ITEM:C412($_t_EditMenu; -1; "(-")
			APPEND MENU ITEM:C411($_t_EditMenu; "Show Clipboard")
			//SET MENU ITEM SHORTCUT($_t_EditMenu;1+$_l_offset;Character code("X"))
			SET MENU ITEM PROPERTY:C973($_t_EditMenu; -1; Associated standard action name:K28:8; ak show clipboard:K76:58)
			//ak show clipboard)  //_o_Show clipboard action)
			//INSERT MENU ITEM($_t_EditMenu;-1;"(-")
		: ($_t_MenuType="menu string")
			
			APPEND TO ARRAY:C911(DB_at_menuitem; "Clear")
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_TextMenuClear")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			
			APPEND TO ARRAY:C911(DB_at_menuitem; "Select all")
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; "A")
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_TextMenuSelectall")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			
			APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			
			APPEND TO ARRAY:C911(DB_at_menuitem; "Show Clipboard")
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_TextMenuShowClipboard")
			
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			
			
	End case 
	
Else 
	Case of 
		: ($_t_MenuType="4D menu")
			APPEND MENU ITEM:C411($_t_EditMenu; "Select all")
			SET MENU ITEM SHORTCUT:C423($_t_EditMenu; -1; Character code:C91("A"))
			SET MENU ITEM PROPERTY:C973($_t_EditMenu; -1; Associated standard action name:K28:8; ak select all:K76:57)  //_o_Select all action)
		: ($_t_MenuType="menu string")
			
			APPEND TO ARRAY:C911(DB_at_menuitem; "Select all")
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; "A")
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_TextMenuSelectall")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			
	End case 
	
End if 

//INSERT MENU ITEM($_t_EditMenu;-1;"(-")
$0:=$_t_EditMenu
// item that will have submenu INSERT MENU ITEM($_t_EditMenu;-1;"Find and Replace" ; FindAndReplaceMenu)
ERR_MethodTrackerReturn("DB_MenuCreateEditMenu"; $_t_oldMethodName)
