//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CreateEditMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:        08/05/2010 16:35
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
	C_TEXT:C284($_t_EditMenuReference; $_t_ItemName; $_t_MenuType; $_t_oldMethodName; $0; $1; $2; $3; DB_t_MenusFormat; DB_t_MenusSetting; Db_t_MenuType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CreateEditMenu")
If (Count parameters:C259>=1)
	Db_t_MenuType:=$1
	
End if 
If (Db_t_MenuType="")
	Db_t_MenuType:="4D menu"
End if 
If (Count parameters:C259>=2)
	DB_t_MenusFormat:=$2
End if 
If (Count parameters:C259>=3)
	DB_t_MenusSetting:=$3
End if 
$_t_MenuType:=Db_t_MenuType
If (Db_t_MenuType#"Menu string")
	$_t_EditMenuReference:=Create menu:C408
Else 
	$_t_EditMenuReference:=""
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
		APPEND MENU ITEM:C411($_t_EditMenuReference; Get indexed string:C510(131; 18))
		SET MENU ITEM SHORTCUT:C423($_t_EditMenuReference; -1; Character code:C91("Z"))
		SET MENU ITEM PROPERTY:C973($_t_EditMenuReference; -1; Associated standard action name:K28:8; ak undo:K76:51)  //_o_Undo action)
		INSERT MENU ITEM:C412($_t_EditMenuReference; -1; "(-")
		APPEND MENU ITEM:C411($_t_EditMenuReference; Get indexed string:C510(131; 19))
		SET MENU ITEM SHORTCUT:C423($_t_EditMenuReference; -1; Character code:C91("R"))
		SET MENU ITEM PROPERTY:C973($_t_EditMenuReference; -1; Associated standard action name:K28:8; ak redo:K76:52)  //_o_Redo action)
		INSERT MENU ITEM:C412($_t_EditMenuReference; -1; "(-")
		
		
		
		
		APPEND MENU ITEM:C411($_t_EditMenuReference; Get indexed string:C510(131; 20))
		SET MENU ITEM SHORTCUT:C423($_t_EditMenuReference; -1; Character code:C91("X"))
		SET MENU ITEM PROPERTY:C973($_t_EditMenuReference; -1; Associated standard action name:K28:8; ak cut:K76:53)  //_o_Cut action)
		
		APPEND MENU ITEM:C411($_t_EditMenuReference; Get indexed string:C510(131; 21))
		SET MENU ITEM SHORTCUT:C423($_t_EditMenuReference; -1; Character code:C91("C"))
		SET MENU ITEM PROPERTY:C973($_t_EditMenuReference; -1; Associated standard action name:K28:8; ak copy:K76:54)  //_o_Copy action)
		
		APPEND MENU ITEM:C411($_t_EditMenuReference; Get indexed string:C510(131; 22))
		SET MENU ITEM SHORTCUT:C423($_t_EditMenuReference; -1; Character code:C91("V"))
		SET MENU ITEM PROPERTY:C973($_t_EditMenuReference; -1; Associated standard action name:K28:8; ak paste:K76:55)  //_o_Paste action)
		
		APPEND MENU ITEM:C411($_t_EditMenuReference; Get indexed string:C510(131; 23))
		//SET MENU ITEM SHORTCUT($_t_EditMenuReference;-1;Character code("V"))
		SET MENU ITEM PROPERTY:C973($_t_EditMenuReference; -1; Associated standard action name:K28:8; ak clear:K76:56)  //_o_Clear action)
		
		APPEND MENU ITEM:C411($_t_EditMenuReference; Get indexed string:C510(131; 24))
		SET MENU ITEM SHORTCUT:C423($_t_EditMenuReference; -1; Character code:C91("A"))
		SET MENU ITEM PROPERTY:C973($_t_EditMenuReference; -1; Associated standard action name:K28:8; ak select all:K76:57)  //_o_Select all action)
		
		
		INSERT MENU ITEM:C412($_t_EditMenuReference; -1; "(-")
		
		APPEND MENU ITEM:C411($_t_EditMenuReference; Get indexed string:C510(131; 25))
		//SET MENU ITEM SHORTCUT($_t_EditMenuReference;-1;Character code("A"))
		SET MENU ITEM PROPERTY:C973($_t_EditMenuReference; -1; Associated standard action name:K28:8; ak show clipboard:K76:58)  //_o_Show clipboard action)
		
		// item that will have submenu INSERT MENU ITEM(EditMenu;-1;"Find and Replace" ; FindAndReplaceMenu)
	: ($_t_MenuType="menu string")
		$_t_ItemName:=Get indexed string:C510(131; 18)
		
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ItemName)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "Z")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DBmenuactionUndo")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		
		$_t_ItemName:=Get indexed string:C510(131; 19)
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ItemName)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "R")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DBmenuactionRedo")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		$_t_ItemName:=Get indexed string:C510(131; 20)
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ItemName)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "X")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DBmenuactioncut")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		$_t_ItemName:=Get indexed string:C510(131; 21)
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ItemName)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "C")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DBmenuactioncopy")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		$_t_ItemName:=Get indexed string:C510(131; 22)
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ItemName)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "V")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DBmenuactionpaste")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		$_t_ItemName:=Get indexed string:C510(131; 23)
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ItemName)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DBmenuactionClear")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		$_t_ItemName:=Get indexed string:C510(131; 24)
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ItemName)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "A")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DBmenuactionSelectAll")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		
		
		APPEND TO ARRAY:C911(DB_at_menuitem; "-")
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		
		$_t_ItemName:=Get indexed string:C510(131; 25)
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ItemName)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "A")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DBmenuactionShowClipboard")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		
		
End case 


$0:=$_t_EditMenuReference
ERR_MethodTrackerReturn("DB_CreateEditMenu"; $_t_oldMethodName)
