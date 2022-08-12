//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuToArray
	//------------------ Method Notes ------------------
	//This method populates an array with the menu items. -note that it appends the array not builds from scratch
	//this is called from DB_SetBrowserBarSelection with a parameter of 'module'-the array is declared in that method
	//each menu is in one row of a 2D array. if there is a submenu this has a reference to a row of another (2D) array containing the submenus
	//------------------ Revision Control ----------------
	//Date Created: 17/01/2012 13:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_MenuShortCutModifier;0)
	//ARRAY LONGINT(DB_al_SubMenuShortCutmodifier;0)
	//ARRAY LONGINT(DB_al_TextMenuItemModifier;0;0)
	//ARRAY LONGINT(DB_al_TextSubMenuItemModifier;0;0)
	//ARRAY TEXT(DB_at_menuitem;0)
	//ARRAY TEXT(DB_at_MenuItem4DFunction;0)
	//ARRAY TEXT(DB_at_MenuItemParameter;0)
	//ARRAY TEXT(DB_at_MenuShortCut;0)
	//ARRAY TEXT(DB_at_SubMenu1Item4DFunction;0)
	//ARRAY TEXT(DB_at_SubMenu1ItemParameter;0)
	//ARRAY TEXT(DB_at_Submenuitem;0)
	//ARRAY TEXT(DB_at_SubMenuReference;0)
	//ARRAY TEXT(DB_at_SubMenuShortCut;0)
	//ARRAY TEXT(DB_at_TextMenuItemMethod;0;0)
	//ARRAY TEXT(DB_at_TextMenuItemParameter;0;0)
	//ARRAY TEXT(DB_at_TextMenuItems;0;0)
	//ARRAY TEXT(DB_at_TextMenuItemShortCut;0;0)
	//ARRAY TEXT(DB_at_TextMenuItemSubmenu;0;0)
	//ARRAY TEXT(DB_at_TextMenuNames;0)
	//ARRAY TEXT(DB_at_TextSubMenuItemMethod;0;0)
	//ARRAY TEXT(DB_at_TextSubMenuItemParameter;0;0)
	//ARRAY TEXT(DB_at_TextSubMenuItems;0;0)
	//ARRAY TEXT(DB_at_TextSubMenuItemShortCut;0;0)
	//ARRAY TEXT(DB_at_TextSubMenuReference;0)
	C_LONGINT:C283($_l_BuildMenuIndex; $_l_Column; $_l_NewRow; $_l_offset; $_l_Row; $_l_SizeofArray; $_l_SubMenuIndex; $_l_SubMenuReference)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuToArray")
If (Count parameters:C259>=1)
	
	Case of 
		: ($1="Module")
			If (False:C215)
				ARRAY TEXT:C222(DB_at_TextMenuNames; 0)
				ARRAY TEXT:C222(DB_at_TextMenuItems; 0; 0)
				ARRAY TEXT:C222(DB_at_TextMenuItemMethod; 0; 0)
				ARRAY TEXT:C222(DB_at_TextMenuItemParameter; 0; 0)
				ARRAY TEXT:C222(DB_at_TextMenuItemShortCut; 0; 0)
				ARRAY LONGINT:C221(DB_al_TextMenuItemModifier; 0; 0)
				ARRAY TEXT:C222(DB_at_TextMenuItemSubmenu; 0; 0)
				
				ARRAY TEXT:C222(DB_at_TextSubMenuReference; 0)
				ARRAY TEXT:C222(DB_at_TextSubMenuItems; 0; 0)
				ARRAY TEXT:C222(DB_at_TextSubMenuItemMethod; 0; 0)
				ARRAY TEXT:C222(DB_at_TextSubMenuItemParameter; 0; 0)
				ARRAY TEXT:C222(DB_at_TextSubMenuItemShortCut; 0; 0)
				ARRAY LONGINT:C221(DB_al_TextSubMenuItemModifier; 0; 0)
			End if 
			
			
			$_l_offset:=Size of array:C274(DB_at_TextSubMenuReference)  //number of existing submenus-have to offset the new submenu references by this amount
			
			$_l_Row:=Size of array:C274(DB_at_TextMenuNames)+1
			APPEND TO ARRAY:C911(DB_at_TextMenuNames; $2)
			//add a row to the 2D array
			INSERT IN ARRAY:C227(DB_at_TextMenuItems; $_l_Row; 1)
			INSERT IN ARRAY:C227(DB_at_TextMenuItemMethod; $_l_Row; 1)
			INSERT IN ARRAY:C227(DB_at_TextMenuItemParameter; $_l_Row; 1)
			INSERT IN ARRAY:C227(DB_at_TextMenuItemShortCut; $_l_Row; 1)
			INSERT IN ARRAY:C227(DB_al_TextMenuItemModifier; $_l_Row; 1)
			INSERT IN ARRAY:C227(DB_at_TextMenuItemSubmenu; $_l_Row; 1)
			
			For ($_l_BuildMenuIndex; 1; Size of array:C274(DB_at_menuitem))
				APPEND TO ARRAY:C911(DB_at_TextMenuItems{$_l_Row}; DB_at_menuitem{$_l_BuildMenuIndex})
				APPEND TO ARRAY:C911(DB_at_TextMenuItemMethod{$_l_Row}; DB_at_MenuItem4DFunction{$_l_BuildMenuIndex})
				APPEND TO ARRAY:C911(DB_at_TextMenuItemParameter{$_l_Row}; DB_at_MenuItemParameter{$_l_BuildMenuIndex})
				APPEND TO ARRAY:C911(DB_at_TextMenuItemShortCut{$_l_Row}; DB_at_MenuShortCut{$_l_BuildMenuIndex})
				APPEND TO ARRAY:C911(DB_al_TextMenuItemModifier{$_l_Row}; DB_al_MenuShortCutModifier{$_l_BuildMenuIndex})
				//Append to array(DB_at_TextMenuItemSubmenu{$_l_Row}
				If (DB_at_SubMenuReference{$_l_BuildMenuIndex}#"")
					APPEND TO ARRAY:C911(DB_at_TextMenuItemSubmenu{$_l_Row}; String:C10(Num:C11(DB_at_SubMenuReference{$_l_BuildMenuIndex})+$_l_offset))
					$_l_Column:=Size of array:C274(DB_at_TextMenuItemSubmenu{$_l_Row})
					$_l_SubMenuReference:=Num:C11(DB_at_SubMenuReference{$_l_BuildMenuIndex})
					$_l_NewRow:=Size of array:C274(DB_at_TextSubMenuReference)+1
					APPEND TO ARRAY:C911(DB_at_TextSubMenuReference; DB_at_TextMenuItemSubmenu{$_l_Row}{$_l_Column})
					INSERT IN ARRAY:C227(DB_at_TextSubMenuItems; $_l_NewRow; 1)
					INSERT IN ARRAY:C227(DB_at_TextSubMenuItemMethod; $_l_NewRow; 1)
					INSERT IN ARRAY:C227(DB_at_TextSubMenuItemParameter; $_l_NewRow; 1)
					INSERT IN ARRAY:C227(DB_at_TextSubMenuItemShortCut; $_l_NewRow; 1)
					INSERT IN ARRAY:C227(DB_al_TextSubMenuItemModifier; $_l_NewRow; 1)
					$_l_NewRow:=Size of array:C274(DB_at_TextSubMenuItems)
					For ($_l_SubMenuIndex; 1; Size of array:C274(DB_at_Submenuitem{$_l_SubMenuReference}))
						$_l_SizeofArray:=Size of array:C274(DB_at_TextSubMenuItems{$_l_NewRow})+1
						INSERT IN ARRAY:C227(DB_at_TextSubMenuItems{$_l_NewRow}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_TextSubMenuItemMethod{$_l_NewRow}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_TextSubMenuItemParameter{$_l_NewRow}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_TextSubMenuItemShortCut{$_l_NewRow}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_al_TextSubMenuItemModifier{$_l_NewRow}; $_l_SizeofArray; 1)
						$_l_SizeofArray:=Size of array:C274(DB_al_TextSubMenuItemModifier{$_l_NewRow})
						DB_at_TextSubMenuItems{$_l_NewRow}{$_l_SizeofArray}:=DB_at_Submenuitem{$_l_SubMenuReference}{$_l_SubMenuIndex}
						DB_at_TextSubMenuItemMethod{$_l_NewRow}{$_l_SizeofArray}:=DB_at_SubMenu1Item4DFunction{$_l_SubMenuReference}{$_l_SubMenuIndex}
						DB_at_TextSubMenuItemParameter{$_l_NewRow}{$_l_SizeofArray}:=DB_at_SubMenu1ItemParameter{$_l_SubMenuReference}{$_l_SubMenuIndex}
						DB_at_TextSubMenuItemShortCut{$_l_NewRow}{$_l_SizeofArray}:=DB_at_SubMenuShortCut{$_l_SubMenuReference}{$_l_SubMenuIndex}
						DB_al_TextSubMenuItemModifier{$_l_NewRow}{$_l_SizeofArray}:=DB_al_SubMenuShortCutmodifier{$_l_SubMenuReference}{$_l_SubMenuIndex}
					End for 
					
				Else 
					APPEND TO ARRAY:C911(DB_at_TextMenuItemSubmenu{$_l_Row}; "")
				End if 
				
			End for 
			
			
	End case 
End if 
ERR_MethodTrackerReturn("DB_MenuToArray"; $_t_oldMethodName)