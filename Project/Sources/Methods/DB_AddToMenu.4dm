//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_AddToMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      16/05/2010 08:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_MenuItemIDS; 0)
	ARRAY TEXT:C222($_at_MenuItemsArray; 0)
	ARRAY TEXT:C222($_at_MenuReferencesArray; 0)
	ARRAY TEXT:C222($_at_MenuTitlesArray; 0)
	C_LONGINT:C283($_l_MenuTitleRow; $_l_Shortcut; $3)
	C_TEXT:C284($_t_MenuReference; $_t_MenuTitle; $_t_oldMethodName; $_t_ShortcutSTRING; $1; $2; $4; $5; $6; $7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_AddToMenu")
//$1 is the menu (bar)reference-pass an empty string from the current menu
//$2 is the menu( titlte) name e.g volumes
//$3 is the location(-1 for append)
//$4 is the name to add
//$5 is the men method
//$6 is the menu shortcut-optional
//%7 is menu item parameter
//Declarations

If (Count parameters:C259>=5)
	If ($1="")
		$_t_MenuReference:=Get menu bar reference:C979
	Else 
		$_t_MenuReference:=$1
	End if 
	If (Count parameters:C259>=6)
		$_t_ShortcutSTRING:=$6
	Else 
		$_t_ShortcutSTRING:=""
	End if 
	$_t_MenuTitle:=$2
	ARRAY TEXT:C222($_at_MenuTitlesArray; 0)
	ARRAY TEXT:C222($_at_MenuReferencesArray; 0)
	
	GET MENU ITEMS:C977($_t_MenuReference; $_at_MenuTitlesArray; $_at_MenuReferencesArray)
	$_l_MenuTitleRow:=Find in array:C230($_at_MenuTitlesArray; $_t_MenuTitle)
	If ($_l_MenuTitleRow>0)
		ARRAY TEXT:C222($_at_MenuItemsArray; 0)
		ARRAY TEXT:C222($_at_MenuItemIDS; 0)
		
		GET MENU ITEMS:C977($_at_MenuReferencesArray{$_l_MenuTitleRow}; $_at_MenuItemsArray; $_at_MenuItemIDS)
		If ($3=-1)
			INSERT MENU ITEM:C412($_at_MenuReferencesArray{$_l_MenuTitleRow}; -1; $4)
			SET MENU ITEM METHOD:C982($_at_MenuReferencesArray{$_l_MenuTitleRow}; -1; $5)
			If ($_t_ShortcutSTRING#"")
				$_l_Shortcut:=Character code:C91($_t_ShortcutSTRING)
				SET MENU ITEM SHORTCUT:C423($_at_MenuReferencesArray{$_l_MenuTitleRow}; -1; $_l_Shortcut)
			End if 
			If (Count parameters:C259>=7)
				SET MENU ITEM PARAMETER:C1004($_at_MenuReferencesArray{$_l_MenuTitleRow}; -1; $7)
				
			End if 
		Else 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_AddToMenu"; $_t_oldMethodName)