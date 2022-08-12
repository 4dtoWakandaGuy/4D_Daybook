//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuCreateViewsMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/01/2011 12:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_MenuShortCutModifier;0)
	//ARRAY LONGINT(DB_al_MenuShortCutsUsed;0)
	//ARRAY LONGINT(DB_al_SubMenuShortCutmodifier;0;0)
	//ARRAY TEXT(CO_at_ViewTabsLabels;0)
	//ARRAY TEXT(COM_at_CompanyTab;0)
	//ARRAY TEXT(CON_at_ContactTab;0)
	//ARRAY TEXT(CON_at_ViewTabsLabels;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	//ARRAY TEXT(DB_at_menuitem;0)
	//ARRAY TEXT(DB_at_MenuItem4DFunction;0)
	//ARRAY TEXT(DB_at_MenuItemParameter;0)
	//ARRAY TEXT(DB_at_MenuShortCut;0)
	//ARRAY TEXT(DB_at_SubMenu1Item4DFunction;0;0)
	//ARRAY TEXT(DB_at_SubMenu1ItemParameter;0;0)
	//ARRAY TEXT(DB_at_Submenuitem;0;0)
	//ARRAY TEXT(DB_at_SubMenuReference;0)
	//ARRAY TEXT(DB_at_SubMenuShortCut;0;0)
	//ARRAY TEXT(INV_at_InvoicesTab;0)
	//ARRAY TEXT(INV_at_ViewTabsLabels;0)
	//ARRAY TEXT(ORD_at_OrdersTab;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	//ARRAY TEXT(PI_at_ViewTabsLabels;0)
	//ARRAY TEXT(PO_at_ViewTabsLabels;0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	//ARRAY TEXT(PRD_at_ViewTabsLabels;0)
	//ARRAY TEXT(PUR_at_PurchasesTab;0)
	//ARRAY TEXT(SVS_at_ContractsTabs;0)
	C_BOOLEAN:C305($_bo_CheckMark; $_bo_Tabs; $_bo_Tabs2; DB_bo_MenusInited; DB_bo_ModuleArrayInited; DB_bo_ViewsOption)
	C_LONGINT:C283($_l_CharacterPosition; $_l_MenuShortcut; $_l_TabsIndex)
	C_OBJECT:C1216($_obj_WindowPrefs)
	C_REAL:C285($1)
	C_TEXT:C284($_t_Label; $_t_MenuType; $_t_oldMethodName; $_t_TabName; $_t_ViewsMenuReference; $0; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuCreateViewsMenu")
If (Count parameters:C259>=3)
	$_t_MenuType:=$3
Else 
	$_t_MenuType:="4D menu"
End if 
$_obj_WindowPrefs:=New object:C1471
$_obj_WindowPrefs:=DB_GetWindowPrefs
If ($_obj_WindowPrefs.SetInputOpeninNewWindow=Null:C1517)
	$_obj_WindowPrefs.SetInputOpeninNewWindow:=False:C215
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
	$_t_ViewsMenuReference:=""
Else 
	$_t_ViewsMenuReference:=Create menu:C408
End if 
$_t_ViewsMenuReference:=Create menu:C408
If (Not:C34(DB_bo_ModuleArrayInited))
	ARRAY LONGINT:C221(DB_al_MenuShortCutsUsed; 0)
	DB_bo_ModuleArrayInited:=True:C214
	DB_bo_MenusInited:=False:C215
End if 
//DB_WindowPrefs
DB_bo_ViewsOption:=$_obj_WindowPrefs.SetInputOpeninNewWindow

Case of 
	: ($1=Table:C252(->[COMPANIES:2]))
		Case of 
			: ($2="Company_In")
				//Page_1,2,3..
				$_bo_Tabs:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(COM_at_CompanyTab))
					$_bo_CheckMark:=False:C215
					$_t_TabName:=COM_at_CompanyTab{$_l_TabsIndex}
					If ($_l_TabsIndex=COM_at_CompanyTab)
						//$_bo_CheckMark:=True
					End if 
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_CompanyTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex))
							$_bo_Tabs:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_CompanyTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex))
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							$_bo_Tabs:=True:C214
							
					End case 
				End for 
				If ($_bo_Tabs)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				
				//Contacts
				//Products
				//Price
				$_bo_Tabs2:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(CO_at_ViewTabsLabels))
					$_t_TabName:=CO_at_ViewTabsLabels{$_l_TabsIndex}
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							If ($_l_TabsIndex<10)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_CompanyViewsTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex))
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							$_bo_Tabs2:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_CompanyViewsTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex))
							
							If ($_l_TabsIndex<10)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							$_bo_Tabs2:=True:C214
							
					End case 
				End for 
				If ($_bo_Tabs2)
					Case of 
						: ($_t_MenuType="4D menu")
							
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "Open Views In New Window")
							$_l_MenuShortcut:=Character code:C91("W")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_SetViewsOption")
							If ($_t_MenuType="4D menu")
								//SET MENU ITEM PARAMETER($_t_ViewsMenuReference;-1;"")
								If (DB_bo_ViewsOption)
									SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; Char:C90(18))
								Else 
									SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
								End if 
							End if 
							
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							
							APPEND TO ARRAY:C911(DB_at_menuitem; "Open Views In New Window")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "W")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_SetViewsOption")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							
							
							$_l_MenuShortcut:=Character code:C91("W")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							
							
					End case 
					
					
				End if 
				
			: ($2="Contact_In")
				
				$_bo_Tabs:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(CON_at_ContactTab))
					$_bo_CheckMark:=False:C215
					$_t_TabName:=CON_at_ContactTab{$_l_TabsIndex}
					If ($_l_TabsIndex=CON_at_ContactTab)
						//$_bo_CheckMark:=True
					End if 
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_ContactTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex))
							$_bo_Tabs:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_ContactTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex))
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							
							$_bo_Tabs:=True:C214
							
					End case 
					
				End for 
				If ($_bo_Tabs)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
							
							//``
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Company"))
							$_l_MenuShortcut:=Character code:C91("1")
							
							$_l_MenuShortcut:=Character code:C91(String:C10(1))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_ContactViewsTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "-1")
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							//`
							APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Company"))
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_ContactViewsTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "-1")
							
							
							
							$_l_MenuShortcut:=Character code:C91(String:C10(1))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							
							
							
							
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				
				
				
				//Contacts
				//Products
				//Price
				$_bo_Tabs2:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(CON_at_ViewTabsLabels))
					$_t_TabName:=CON_at_ViewTabsLabels{$_l_TabsIndex}
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							If ($_l_TabsIndex<10)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
								
							End if 
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_ContactViewsTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex))
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							$_bo_Tabs2:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_ContactViewsTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex))
							
							If ($_l_TabsIndex<10)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
								
								
							End if 
							
							$_bo_Tabs2:=True:C214
							
					End case 
					
				End for 
				If ($_bo_Tabs2)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "Open Views In New Window")
							$_l_MenuShortcut:=Character code:C91("W")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_SetViewsOption")
							
							//SET MENU ITEM PARAMETER($_t_ViewsMenuReference;-1;"")
							If (DB_bo_ViewsOption)
								SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; Char:C90(18))
								
							Else 
								SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							End if 
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							
							APPEND TO ARRAY:C911(DB_at_menuitem; "Open Views In New Window")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "W")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_SetViewsOption")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							$_l_MenuShortcut:=Character code:C91("W")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							
							
					End case 
					
				End if 
				
		End case 
	: ($1=Table:C252(->[CONTACTS:1]))
		Case of 
			: ($2="Contact_In")
				If (Not:C34(Undefined:C82(CON_at_ContactTab)))
					$_bo_Tabs:=False:C215
					For ($_l_TabsIndex; 1; Size of array:C274(CON_at_ContactTab))
						$_bo_CheckMark:=False:C215
						$_t_TabName:=CON_at_ContactTab{$_l_TabsIndex}
						If ($_l_TabsIndex=CON_at_ContactTab)
							//$_bo_CheckMark:=True
						End if 
						Repeat 
							If ($_t_TabName[[1]]=" ")
								$_t_TabName:=Substring:C12($_t_TabName; 2)
							End if 
						Until ($_t_TabName[[1]]#" ")
						$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
						If ($_l_CharacterPosition>0)
							$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
						End if 
						
						Case of 
							: ($_t_MenuType="4D menu")
								INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
								//```
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
								SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_ContactTab")
								SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex))
								$_bo_Tabs:=True:C214
							: ($_t_MenuType="menu string")
								APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
								APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
								APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
								APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_ContactTab")
								APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex))
								//```
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
								
								$_bo_Tabs:=True:C214
								
						End case 
						
					End for 
					If ($_bo_Tabs)
						Case of 
							: ($_t_MenuType="4D menu")
								INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
							: ($_t_MenuType="menu string")
								APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
								APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
								APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
								APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
								APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
						End case 
					End if 
				End if 
				
				//Contacts
				//Products
				//Price
				$_bo_Tabs2:=False:C215
				$_t_TabName:="Company"
				
				
				For ($_l_TabsIndex; 1; Size of array:C274(CON_at_ViewTabsLabels))
					$_t_TabName:=CON_at_ViewTabsLabels{$_l_TabsIndex}
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							If ($_l_TabsIndex<9)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex+1))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_ContactViewsTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex))
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							$_bo_Tabs2:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_ContactViewsTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex))
							
							If ($_l_TabsIndex<9)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex+1))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							$_bo_Tabs2:=True:C214
							
					End case 
					$_bo_Tabs2:=True:C214
					
				End for 
				If ($_bo_Tabs2)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "Open Views In New Window")
							$_l_MenuShortcut:=Character code:C91("W")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_SetViewsOption")
							
							//SET MENU ITEM PARAMETER($_t_ViewsMenuReference;-1;"")
							If (DB_bo_ViewsOption)
								SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; Char:C90(18))
								
							Else 
								SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							End if 
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							
							APPEND TO ARRAY:C911(DB_at_menuitem; "Open Views In New Window")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "W")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_SetViewsOption")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							$_l_MenuShortcut:=Character code:C91("W")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							
							
					End case 
					
					
					
				End if 
		End case 
	: ($1=Table:C252(->[CONTRACTS:17]))
		Case of 
			: ($2="Contract_in")
				
				$_bo_Tabs:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(SVS_at_ContractsTabs))
					$_bo_CheckMark:=False:C215
					$_t_TabName:=SVS_at_ContractsTabs{$_l_TabsIndex}
					If ($_l_TabsIndex=SVS_at_ContractsTabs)
						//$_bo_CheckMark:=True
					End if 
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_ContractTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex))
							$_bo_Tabs:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_ContractTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex))
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							$_bo_Tabs:=True:C214
							
					End case 
					
				End for 
				If ($_bo_Tabs)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				
				
				//DB_MenuValidateShortcut ($_t_ViewsMenuReference;$_t_MenuType;$_l_MenuShortcut)
				
				
				Case of 
					: ($_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Company"))
						$_l_MenuShortcut:=Character code:C91("]")
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_ContractViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "1")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Contact"))
						$_l_MenuShortcut:=Character code:C91("/")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_ContractViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "2")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						$_bo_Tabs2:=True:C214
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
					: ($_t_MenuType="menu string")
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Company"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "]")
						$_l_MenuShortcut:=Character code:C91("]")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_ContractViewsTab")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "1")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Contact"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "/")
						$_l_MenuShortcut:=Character code:C91("/")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_ContractViewsTab")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "2")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						
						
						$_bo_Tabs2:=True:C214
						APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
						
						
				End case 
				//Contacts
				//Products
				//Price
				$_bo_Tabs2:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(CONT_at_ViewTabsLabels))
					$_t_TabName:=CONT_at_ViewTabsLabels{$_l_TabsIndex}
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							If ($_l_TabsIndex<10)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_ContractViewsTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex))
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							$_bo_Tabs2:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_ContractViewsTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex))
							
							If ($_l_TabsIndex<10)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							$_bo_Tabs2:=True:C214
							
					End case 
				End for 
				If ($_bo_Tabs2)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "Open Views In New Window")
							$_l_MenuShortcut:=Character code:C91("W")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_SetViewsOption")
							
							//SET MENU ITEM PARAMETER($_t_ViewsMenuReference;-1;"")
							If (DB_bo_ViewsOption)
								SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; Char:C90(18))
								
							Else 
								SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							End if 
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							
							APPEND TO ARRAY:C911(DB_at_menuitem; "Open Views In New Window")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "W")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_SetViewsOption")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							$_l_MenuShortcut:=Character code:C91("W")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							
							
					End case 
					
				End if 
		End case 
		
		
	: ($1=Table:C252(->[CURRENT_STOCK:62]))
		
		
		Case of 
			: ($2="CurrentStock_In")
				Case of 
					: ($_t_MenuType="4D menu")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_StockHistory"))
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "StockCurr_MenV")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "1")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
					: ($_t_MenuType="menu string")
						
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_StockHistory"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "StockCurr_MenV")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "1")
						
						
				End case 
		End case 
	: ($1=Table:C252(->[INVOICES:39]))
		Case of 
			: ($2="Invoice_In")
				//Page_1,2,3..
				$_bo_Tabs:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(INV_at_InvoicesTab))
					$_bo_CheckMark:=False:C215
					$_t_TabName:="Page "+String:C10(Num:C11(INV_at_InvoicesTab{$_l_TabsIndex}))
					
					If ($_l_TabsIndex=INV_at_InvoicesTab)
						//$_bo_CheckMark:=True
					End if 
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_InvoicesTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex))
							$_bo_Tabs:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_InvoicesTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex))
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							$_bo_Tabs:=True:C214
							
					End case 
					
				End for 
				If ($_bo_Tabs)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				
				
				
				
				Case of 
					: ($_t_MenuType="4D menu")
						
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Company"))
						$_l_MenuShortcut:=Character code:C91("1")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_InvoicesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "1")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Contact"))
						$_l_MenuShortcut:=Character code:C91("2")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_InvoicesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "2")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Product"))
						$_l_MenuShortcut:=Character code:C91("3")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_InvoicesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "3")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_TransBatch"))
						$_l_MenuShortcut:=Character code:C91("4")
						//$_l_MenuShortcut:=Character code("R")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_InvoicesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "4")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Allocations"))
						$_l_MenuShortcut:=Character code:C91("5")
						//$_l_MenuShortcut:=Character code("R")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_InvoicesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "5")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						//Contacts
					: ($_t_MenuType="menu string")
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Company"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_InvoicesViewsTab")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "1")
						$_l_MenuShortcut:=Character code:C91("1")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Company"))
						$_l_MenuShortcut:=Character code:C91("1")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_InvoicesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "1")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Contact"))
						$_l_MenuShortcut:=Character code:C91("2")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_InvoicesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "2")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Product"))
						$_l_MenuShortcut:=Character code:C91("3")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_InvoicesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "3")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_TransBatch"))
						$_l_MenuShortcut:=Character code:C91("4")
						//$_l_MenuShortcut:=Character code("R")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_InvoicesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "4")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Allocations"))
						$_l_MenuShortcut:=Character code:C91("5")
						//$_l_MenuShortcut:=Character code("R")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_InvoicesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "5")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						//Contacts
						
				End case 
				//Products
				//Price
				$_bo_Tabs2:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(INV_at_ViewTabsLabels))
					$_t_TabName:=INV_at_ViewTabsLabels{$_l_TabsIndex}
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							If ($_l_TabsIndex<4)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex+5))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_InvoicesViewsTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex+5))
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							$_bo_Tabs2:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_InvoicesViewsTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex+5))
							
							If ($_l_TabsIndex<4)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex+5))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							$_bo_Tabs2:=True:C214
							
					End case 
					
				End for 
				If ($_bo_Tabs2)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "Open Views In New Window")
							$_l_MenuShortcut:=Character code:C91("W")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_SetViewsOption")
							
							//SET MENU ITEM PARAMETER($_t_ViewsMenuReference;-1;"")
							If (DB_bo_ViewsOption)
								SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; Char:C90(18))
								
							Else 
								SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							End if 
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							
							APPEND TO ARRAY:C911(DB_at_menuitem; "Open Views In New Window")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "W")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_SetViewsOption")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							$_l_MenuShortcut:=Character code:C91("W")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							
							
					End case 
				End if 
				
		End case 
	: ($1=Table:C252(->[ORDERS:24]))
		Case of 
			: ($2="Order_In")
				//Page_1,2,3..
				$_bo_Tabs:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(ORD_at_OrdersTab))
					$_bo_CheckMark:=False:C215
					$_t_TabName:="Page "+String:C10(Num:C11(ORD_at_OrdersTab{$_l_TabsIndex}))
					
					If ($_l_TabsIndex=ORD_at_OrdersTab)
						//$_bo_CheckMark:=True
					End if 
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_OrdersTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex))
							$_bo_Tabs:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_OrdersTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex))
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							$_bo_Tabs:=True:C214
							
					End case 
				End for 
				If ($_bo_Tabs)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: ($_t_MenuType="4D menu")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Company"))
						$_l_MenuShortcut:=Character code:C91("1")
						
						$_l_MenuShortcut:=Character code:C91(String:C10(1))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_OrdersViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "1")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Contact"))
						$_l_MenuShortcut:=Character code:C91("2")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_OrdersViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "2")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Product"))
						$_l_MenuShortcut:=Character code:C91("3")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_OrdersViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "3")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						
						
					: ($_t_MenuType="menu string")
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Company"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_OrdersViewsTab")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "1")
						$_l_MenuShortcut:=Character code:C91("1")
						$_l_MenuShortcut:=Character code:C91(String:C10(1))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Contact"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_OrdersViewsTab")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "2")
						$_l_MenuShortcut:=Character code:C91("2")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Product"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_OrdersViewsTab")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "3")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Product"))
						$_l_MenuShortcut:=Character code:C91("3")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						
						
						
				End case 
				//TRACE
				
				$_bo_Tabs2:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(ORD_at_ViewTabsLabels))
					$_t_TabName:=ORD_at_ViewTabsLabels{$_l_TabsIndex}
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							If ($_l_TabsIndex<7)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex+3))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_OrdersViewsTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex+3))
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							$_bo_Tabs2:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_OrdersViewsTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex+3))
							
							If ($_l_TabsIndex<7)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex+3))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							$_bo_Tabs2:=True:C214
							
					End case 
					
				End for 
				
				If (DB_GetModuleSettingByNUM(Module_Subscriptions)>1)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_SubscriptionDetails"))
							
							$_l_MenuShortcut:=Character code:C91("Y")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_OrdersViewsTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "4")
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							
							APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_SubscriptionDetails"))
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_OrdersViewsTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "4")
					End case 
				End if 
				Case of 
					: ($_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_PaymentCards"))
						//$_l_MenuShortcut:=Character code("5")
						//SET MENU ITEM SHORTCUT($_t_ViewsMenuReference;-1;$_l_MenuShortcut)
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "ORD_showContactCCards")
						//SET MENU ITEM PARAMETER($_t_ViewsMenuReference;-1;"4")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "Open Views In New Window")
						
						$_l_MenuShortcut:=Character code:C91("W")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_SetViewsOption")
						
						//SET MENU ITEM PARAMETER($_t_ViewsMenuReference;-1;"")
						If (DB_bo_ViewsOption)
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; Char:C90(18))
							
						Else 
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						End if 
					: ($_t_MenuType="menu string")
						
						APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_PaymentCards"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "ORD_showContactCCards")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
						
						
						
						APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
						
						APPEND TO ARRAY:C911(DB_at_menuitem; "Open Views In New Window")
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_SetViewsOption")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
				End case 
		End case 
	: ($1=Table:C252(->[PERSONNEL:11]))
		Case of 
			: ($2="Personnel_In")
				Case of 
					: ($_t_MenuType="4D menu")
						$_t_Label:="Personnel"
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_Label)
						//SET MENU ITEM SHORTCUT($_t_ViewsMenuReference;-1;Character code(String(1)))
						$_l_MenuShortcut:=Character code:C91(String:C10(1))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "PerSelDummy")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10(1))
						
						$_t_Label:="Email Settings"
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_Label)
						//SET MENU ITEM SHORTCUT($_t_ViewsMenuReference;-1;Character code(String(2)))
						$_l_MenuShortcut:=Character code:C91(String:C10(2))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "PerSelDummy")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10(2))
						
						$_t_Label:="Access Rights"
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_Label)
						//SET MENU ITEM SHORTCUT($_t_ViewsMenuReference;-1;Character code(String(3)))
						$_l_MenuShortcut:=Character code:C91(String:C10(3))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "PerSelDummy")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10(3))
						
						$_t_Label:="Further Fields Access"
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_Label)
						//SET MENU ITEM SHORTCUT($_t_ViewsMenuReference;-1;Character code(String(4)))
						$_l_MenuShortcut:=Character code:C91(String:C10(4))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "PerSelDummy")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10(4))
						
						$_t_Label:="Time Manager Access"
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_Label)
						//SET MENU ITEM SHORTCUT($_t_ViewsMenuReference;-1;Character code(String(5)))
						$_l_MenuShortcut:=Character code:C91(String:C10(5))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "PerSelDummy")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10(5))
						
						
						$_t_Label:="Product Collections Access"
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_Label)
						//SET MENU ITEM SHORTCUT($_t_ViewsMenuReference;-1;Character code(String(6)))
						$_l_MenuShortcut:=Character code:C91(String:C10(6))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "PerSelDummy")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10(6))
						If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
							$_t_Label:="Job Costing"
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_Label)
							//SET MENU ITEM SHORTCUT($_t_ViewsMenuReference;-1;Character code(String(7)))
							$_l_MenuShortcut:=Character code:C91(String:C10(7))
							
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "PerSelDummy")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10(7))
						End if 
						
					: ($_t_MenuType="menu string")
						
						
						$_t_Label:="Personnel"
						
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_Label)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "PerSelDummy")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "1")
						$_l_MenuShortcut:=Character code:C91(String:C10(1))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						$_t_Label:="Email Settings"
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_Label)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "PerSelDummy")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "2")
						$_l_MenuShortcut:=Character code:C91(String:C10(2))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						$_t_Label:="Access Rights"
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_Label)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "PerSelDummy")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "3")
						$_l_MenuShortcut:=Character code:C91(String:C10(3))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						$_t_Label:="Further Fields Access"
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_Label)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "PerSelDummy")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "4")
						$_l_MenuShortcut:=Character code:C91(String:C10(4))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						$_t_Label:="Time Manager Access"
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_Label)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "PerSelDummy")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "5")
						$_l_MenuShortcut:=Character code:C91(String:C10(5))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						$_t_Label:="Product Collections Access"
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_Label)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "PerSelDummy")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "6")
						$_l_MenuShortcut:=Character code:C91(String:C10(6))
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
							$_t_Label:="Job Costing"
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_Label)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "PerSelDummy")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "7")
							$_l_MenuShortcut:=Character code:C91(String:C10(7))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						End if 
						
				End case 
				
				
		End case 
	: ($1=Table:C252(->[PRODUCTS:9]))
		Case of 
			: ($2="Products_in2009")
				//Page_1,2,3..
				$_bo_Tabs:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(PRD_at_ProductsTab))
					$_bo_CheckMark:=False:C215
					$_t_TabName:=PRD_at_ProductsTab{$_l_TabsIndex}
					
					If ($_l_TabsIndex=PRD_at_ProductsTab)
						//$_bo_CheckMark:=True
					End if 
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_ProductsTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex))
							$_bo_Tabs:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_ProductsTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex))
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							$_bo_Tabs:=True:C214
							
					End case 
					
				End for 
				If ($_bo_Tabs)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				
				$_bo_Tabs2:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(PRD_at_ViewTabsLabels))
					$_t_TabName:=PRD_at_ViewTabsLabels{$_l_TabsIndex}
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							If ($_l_TabsIndex<10)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_ProductsViewsTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex+3))
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							$_bo_Tabs2:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_ProductsViewsTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex+3))
							
							If ($_l_TabsIndex<10)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							$_bo_Tabs2:=True:C214
							
					End case 
					
				End for 
				
				
				If ($_bo_Tabs2)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "Open Views In New Window")
							$_l_MenuShortcut:=Character code:C91("W")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_SetViewsOption")
							
							//SET MENU ITEM PARAMETER($_t_ViewsMenuReference;-1;"")
							If (DB_bo_ViewsOption)
								SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; Char:C90(18))
								
							Else 
								SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							End if 
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							
							APPEND TO ARRAY:C911(DB_at_menuitem; "Open Views In New Window")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "W")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_SetViewsOption")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							$_l_MenuShortcut:=Character code:C91("W")
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							
							
					End case 
				End if 
				
				
				//Contacts
				//Products
				//Price
				
				
		End case 
	: ($1=Table:C252(->[PROJECTS:89]))
		Case of 
			: ($2="Projects_In")
				Case of 
					: ($_t_MenuType="4D menu")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Company"))
						$_l_MenuShortcut:=Character code:C91("]")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						//SET MENU ITEM SHORTCUT($_t_ViewsMenuReference;-1;$_l_MenuShortcut)
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "Projects_MenV")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "1")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Contact"))
						$_l_MenuShortcut:=Character code:C91("/")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "Projects_MenV")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "2")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
					: ($_t_MenuType="menu string")
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Company"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "]")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Projects_MenV")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "1")
						$_l_MenuShortcut:=Character code:C91("]")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						//SET MENU ITEM SHORTCUT($_t_ViewsMenuReference;-1;$_l_MenuShortcut)
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Contact"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "/")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Projects_MenV")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "2")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Contact"))
						$_l_MenuShortcut:=Character code:C91("/")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						
				End case 
		End case 
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
		Case of 
			: ($2="PurchaseOrder_In")
				//Page_1,2,3..
				
				Case of 
						
					: ($_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Company"))
						$_l_MenuShortcut:=Character code:C91("]")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_PurchOrdersViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "1")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Contact"))
						$_l_MenuShortcut:=Character code:C91("/")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_PurchOrdersViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "2")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
					: ($_t_MenuType="menu string")
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Company"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "]")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_PurchOrdersViewsTab")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "1")
						$_l_MenuShortcut:=Character code:C91("]")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Contact"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "/")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_PurchOrdersViewsTab")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "2")
						$_l_MenuShortcut:=Character code:C91("/")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						
				End case 
				
				$_bo_Tabs2:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(PO_at_ViewTabsLabels))
					$_t_TabName:=PO_at_ViewTabsLabels{$_l_TabsIndex}
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							If ($_l_TabsIndex<10)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_PurchOrdersViewsTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex+2))
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							$_bo_Tabs2:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_PurchOrdersViewsTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex+3))
							
							If ($_l_TabsIndex<10)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							$_bo_Tabs2:=True:C214
							
					End case 
				End for 
				
				
				
				
				Case of 
					: ($_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "Open Views In New Window")
						$_l_MenuShortcut:=Character code:C91("W")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_SetViewsOption")
						
						//SET MENU ITEM PARAMETER($_t_ViewsMenuReference;-1;"")
						If (DB_bo_ViewsOption)
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; Char:C90(18))
							
						Else 
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						End if 
					: ($_t_MenuType="menu string")
						APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
						
						APPEND TO ARRAY:C911(DB_at_menuitem; "Open Views In New Window")
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "W")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_SetViewsOption")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
						$_l_MenuShortcut:=Character code:C91("W")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						
						
				End case 
				
				
				//Contacts
				//Products
				//Price
				
				
		End case 
		
	: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
		Case of 
			: ($2="Purchases_in")
				//Page_1,2,3..
				
				
				$_bo_Tabs:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(PUR_at_PurchasesTab))
					$_bo_CheckMark:=False:C215
					$_t_TabName:="Page "+String:C10(Num:C11(PUR_at_PurchasesTab{$_l_TabsIndex}))
					
					If ($_l_TabsIndex=PUR_at_PurchasesTab)
						//$_bo_CheckMark:=True
					End if 
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_PurchasesTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex))
							$_bo_Tabs:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_PurchasesTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex))
							//```
							$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
							DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
							
							
							$_bo_Tabs:=True:C214
							
					End case 
					
				End for 
				If ($_bo_Tabs)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				
				Case of 
					: ($_t_MenuType="4D menu")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Company"))
						$_l_MenuShortcut:=Character code:C91("]")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_PurchasesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "1")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Product"))
						$_l_MenuShortcut:=Character code:C91("/")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_PurchasesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "2")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_TransBatch"))
						$_l_MenuShortcut:=Character code:C91("/")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_PurchasesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "3")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						
						
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						
						
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Allocations"))
						$_l_MenuShortcut:=Character code:C91("/")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_PurchasesViewsTab")
						SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "4")
						SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
					: ($_t_MenuType="menu string")
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Company"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "]")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_PurchasesViewsTab")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "1")
						$_l_MenuShortcut:=Character code:C91("]")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Product"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "/")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_PurchasesViewsTab")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "2")
						$_l_MenuShortcut:=Character code:C91("/")
						
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_TransBatch"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_PurchasesViewsTab")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "3")
						
						//$_l_MenuShortcut:=Character code("/")
						
						//DB_MenuValidateShortcut ($_t_ViewsMenuReference;$_t_MenuType;$_l_MenuShortcut)
						
						
						APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
						
						
						
						
						
						
						APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Allocations"))
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_PurchasesViewsTab")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "4")
						
						
						
				End case 
				
				$_bo_Tabs2:=False:C215
				For ($_l_TabsIndex; 1; Size of array:C274(PI_at_ViewTabsLabels))
					$_t_TabName:=PI_at_ViewTabsLabels{$_l_TabsIndex}
					Repeat 
						If ($_t_TabName[[1]]=" ")
							$_t_TabName:=Substring:C12($_t_TabName; 2)
						End if 
					Until ($_t_TabName[[1]]#" ")
					$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
					If ($_l_CharacterPosition>0)
						$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
					End if 
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
							If ($_l_TabsIndex<10)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_PurchasesViewsTab")
							SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex+3))
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
							$_bo_Tabs2:=True:C214
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TabName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_PurchasesViewsTab")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10($_l_TabsIndex+3))
							
							If ($_l_TabsIndex<10)
								$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
								DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
								
							End if 
							$_bo_Tabs2:=True:C214
							
					End case 
					
				End for 
				
				
				
				
				Case of 
					: ($_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
						INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "Open Views In New Window")
						$_l_MenuShortcut:=Character code:C91("W")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_SetViewsOption")
						
						//SET MENU ITEM PARAMETER($_t_ViewsMenuReference;-1;"")
						If (DB_bo_ViewsOption)
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; Char:C90(18))
							
						Else 
							SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
						End if 
					: ($_t_MenuType="menu string")
						APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
						
						APPEND TO ARRAY:C911(DB_at_menuitem; "Open Views In New Window")
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "W")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_SetViewsOption")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
						$_l_MenuShortcut:=Character code:C91("W")
						DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
						
						
						
						
				End case 
				
				
				
				
				//Contacts
				//Products
				//Price
				
				
		End case 
		
	: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
		
		
		//Page_1,2,3..
		
		Case of 
			: ($_t_MenuType="4D menu")
				INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Company"))
				$_l_MenuShortcut:=Character code:C91("]")
				
				DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
				
				SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "Move_MenV")
				SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "1")
				SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
				
				INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Product"))
				$_l_MenuShortcut:=Character code:C91("R")
				
				DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
				
				SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "Move_MenV")
				SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "2")
				SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
				
				
				INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
				
				INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_ItemHistory"))
				$_l_MenuShortcut:=Character code:C91("H")
				
				DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
				
				SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "Move_MenV")
				SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "4")
				SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
				
				
			: ($_t_MenuType="menu string")
				APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Company"))
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "]")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Move_MenV")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "1")
				$_l_MenuShortcut:=Character code:C91("]")
				DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
				
				
				
				
				APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_Product"))
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "R")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Move_MenV")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "2")
				$_l_MenuShortcut:=Character code:C91("R")
				
				DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
				
				APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
				INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
				
				
				APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_ItemHistory"))
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "H")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Move_MenV")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "4")
				$_l_MenuShortcut:=Character code:C91("H")
				
				DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
				
				
				
				
				
				
		End case 
		
		If (False:C215)
			
			INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
			
			
			INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; Get localized string:C991("MenuItem_Allocations"))
			$_l_MenuShortcut:=Character code:C91("/")
			
			DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
			
			SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_PurchasesViewsTab")
			SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; "4")
			SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
			
			
			$_bo_Tabs2:=False:C215
			For ($_l_TabsIndex; 1; Size of array:C274(PI_at_ViewTabsLabels))
				$_t_TabName:=PI_at_ViewTabsLabels{$_l_TabsIndex}
				Repeat 
					If ($_t_TabName[[1]]=" ")
						$_t_TabName:=Substring:C12($_t_TabName; 2)
					End if 
				Until ($_t_TabName[[1]]#" ")
				$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
				If ($_l_CharacterPosition>0)
					$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
				End if 
				INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; $_t_TabName)
				If ($_l_TabsIndex<10)
					
					$_l_MenuShortcut:=Character code:C91(String:C10($_l_TabsIndex))
					DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
					
				End if 
				SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_PurchasesViewsTab")
				SET MENU ITEM PARAMETER:C1004($_t_ViewsMenuReference; -1; String:C10($_l_TabsIndex+4))
				SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
				$_bo_Tabs2:=True:C214
				
			End for 
			
			
			
			
			INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "(-")
			
			INSERT MENU ITEM:C412($_t_ViewsMenuReference; -1; "Open Views In New Window")
			
			$_l_MenuShortcut:=Character code:C91("W")
			DB_MenuValidateShortcut($_t_ViewsMenuReference; $_t_MenuType; $_l_MenuShortcut)
			
			
			SET MENU ITEM METHOD:C982($_t_ViewsMenuReference; -1; "DB_SetViewsOption")
			If ($_obj_WindowPrefs.SetInputOpeninNewWindow)
				DB_bo_ViewsOption:=False:C215
				DB_SetViewsOption
				
			End if 
			
			
			//SET MENU ITEM PARAMETER($_t_ViewsMenuReference;-1;"")
			If (DB_bo_ViewsOption)
				SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; Char:C90(18))
				
			Else 
				SET MENU ITEM MARK:C208($_t_ViewsMenuReference; -1; "")
			End if 
		End if 
		
		//Contacts
		//Products
		//Price
		
		
End case 

$0:=$_t_ViewsMenuReference
ERR_MethodTrackerReturn("DB_MenuCreateViewsMenu"; $_t_oldMethodName)
