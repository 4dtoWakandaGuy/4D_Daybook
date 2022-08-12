//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_BuildVolumesMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/05/2010 21:52
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
	C_LONGINT:C283($_l_MenuShortCut; $_l_MenuShortCutNumber; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_DataListsPaletteName; $_t_DataManagerName; $_t_DocumentManagerName; $_t_FunctionsPaletteName; $_t_JobCostingsName; $_t_MenuType; $_t_NominalLedgerName; $_t_oldMethodName; $_t_PurchaseLedgerName; $_t_PurchaseOrdersName; $_t_SalesLedgerName)
	C_TEXT:C284($_t_SalesOrdersName; $_t_ScriptsPaletteName; $_t_StockManagerName; $_t_TimeManagerMenuName; $_t_VolumesMenuRef; $_t_VolumesPaletteName; $_t_WIndowsPaletteName; $0; $1; $2; $3)
	C_TEXT:C284(DB_t_MenusFormat; DB_t_MenusSetting; Db_t_MenuType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_BuildVolumesMenu")
If (Count parameters:C259>=1)
	Db_t_MenuType:=$1
	If (Db_t_MenuType="")
		Db_t_MenuType:="4D menu"
	End if 
Else 
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
	$_t_VolumesMenuRef:=Create menu:C408
Else 
	$_t_VolumesMenuRef:=""
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



$_l_MenuShortCutNumber:=1

If ((DB_GetModuleSettingByNUM(Module_DiaryManager))>=2)
	$_t_TimeManagerMenuName:=Get localized string:C991("MenuItem_Timemanager")
	$_l_MenuShortCut:=Character code:C91(String:C10($_l_MenuShortCutNumber))
	Case of 
		: ($_t_MenuType="4D menu")
			INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_TimeManagerMenuName)
			SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "Menu_Main")
			SET MENU ITEM SHORTCUT:C423($_t_VolumesMenuRef; -1; $_l_MenuShortCut)
		: ($_t_MenuType="menu string")
			APPEND TO ARRAY:C911(DB_at_menuitem; $_t_TimeManagerMenuName)
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; String:C10($_l_MenuShortCutNumber))
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Menu_Main")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			
	End case 
	$_l_MenuShortCutNumber:=$_l_MenuShortCutNumber+1
End if 
If ((DB_GetModuleSettingByNUM(Module_WPManager))>=2)
	$_t_DocumentManagerName:=Get localized string:C991("MenuItem_DocumentManager")
	$_l_MenuShortCut:=Character code:C91(String:C10($_l_MenuShortCutNumber))
	$_l_MenuShortCutNumber:=$_l_MenuShortCutNumber+1
	Case of 
		: ($_t_MenuType="4D menu")
			INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_DocumentManagerName)
			SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "Menu_WP")
			SET MENU ITEM SHORTCUT:C423($_t_VolumesMenuRef; -1; $_l_MenuShortCut)
		: ($_t_MenuType="menu string")
			APPEND TO ARRAY:C911(DB_at_menuitem; $_t_DocumentManagerName)
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; String:C10($_l_MenuShortCutNumber))
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Menu_WP")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			
	End case 
End if 
If ((DB_GetModuleSettingByNUM(Module_StockControl))>=2)
	$_t_StockManagerName:=Get localized string:C991("MenuItem_StockManager")
	$_t_StockManagerName:=Term_StoWT($_t_StockManagerName)
	$_l_MenuShortCut:=Character code:C91(String:C10($_l_MenuShortCutNumber))
	$_l_MenuShortCutNumber:=$_l_MenuShortCutNumber+1
	Case of 
		: ($_t_MenuType="4D menu")
			INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_StockManagerName)
			SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "Menu_Stock")
			SET MENU ITEM SHORTCUT:C423($_t_VolumesMenuRef; -1; $_l_MenuShortCut)
		: ($_t_MenuType="menu string")
			APPEND TO ARRAY:C911(DB_at_menuitem; $_t_StockManagerName)
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; String:C10($_l_MenuShortCutNumber))
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Menu_Stock")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			
	End case 
End if 
If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>=2)
	$_t_SalesOrdersName:=Get localized string:C991("MenuItem_SalesOrders")
	$_l_MenuShortCut:=Character code:C91(String:C10($_l_MenuShortCutNumber))
	$_l_MenuShortCutNumber:=$_l_MenuShortCutNumber+1
	Case of 
		: ($_t_MenuType="4D menu")
			INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_SalesOrdersName)
			SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "Menu_SOP")
			SET MENU ITEM SHORTCUT:C423($_t_VolumesMenuRef; -1; $_l_MenuShortCut)
		: ($_t_MenuType="menu string")
			APPEND TO ARRAY:C911(DB_at_menuitem; $_t_SalesOrdersName)
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; String:C10($_l_MenuShortCutNumber))
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Menu_SOP")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
	End case 
End if 
If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>=2)
	$_t_PurchaseOrdersName:=Get localized string:C991("MenuItem_PurchaseOrders")
	$_l_MenuShortCut:=Character code:C91(String:C10($_l_MenuShortCutNumber))
	$_l_MenuShortCutNumber:=$_l_MenuShortCutNumber+1
	Case of 
		: ($_t_MenuType="4D menu")
			INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_PurchaseOrdersName)
			SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "Menu_POP")
			SET MENU ITEM SHORTCUT:C423($_t_VolumesMenuRef; -1; $_l_MenuShortCut)
		: ($_t_MenuType="menu string")
			APPEND TO ARRAY:C911(DB_at_menuitem; $_t_PurchaseOrdersName)
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; String:C10($_l_MenuShortCutNumber))
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Menu_POP")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
	End case 
End if 
If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>=2)
	$_t_SalesLedgerName:=Get localized string:C991("MenuItem_SalesLedger")
	$_t_SalesLedgerName:=Term_SLPLWT($_t_SalesLedgerName)
	$_l_MenuShortCut:=Character code:C91(String:C10($_l_MenuShortCutNumber))
	$_l_MenuShortCutNumber:=$_l_MenuShortCutNumber+1
	Case of 
		: ($_t_MenuType="4D menu")
			INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_SalesLedgerName)
			SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "Menu_Sales")
			SET MENU ITEM SHORTCUT:C423($_t_VolumesMenuRef; -1; $_l_MenuShortCut)
		: ($_t_MenuType="menu string")
			APPEND TO ARRAY:C911(DB_at_menuitem; $_t_SalesLedgerName)
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; String:C10($_l_MenuShortCutNumber))
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Menu_Sales")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
	End case 
End if 

If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>=2)
	$_t_PurchaseLedgerName:=Get localized string:C991("MenuItem_PurchaseLedger")
	$_t_PurchaseLedgerName:=Term_SLPLWT($_t_PurchaseLedgerName)
	$_l_MenuShortCut:=Character code:C91(String:C10($_l_MenuShortCutNumber))
	$_l_MenuShortCutNumber:=$_l_MenuShortCutNumber+1
	Case of 
		: ($_t_MenuType="4D menu")
			INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_PurchaseLedgerName)
			SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "Menu_Purch")
			SET MENU ITEM SHORTCUT:C423($_t_VolumesMenuRef; -1; $_l_MenuShortCut)
		: ($_t_MenuType="menu string")
			APPEND TO ARRAY:C911(DB_at_menuitem; $_t_PurchaseLedgerName)
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; String:C10($_l_MenuShortCutNumber))
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Menu_Purch")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
	End case 
End if 
If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>=2)
	$_t_NominalLedgerName:=Get localized string:C991("MenuItem_NominalLedger")
	$_l_MenuShortCut:=Character code:C91(String:C10($_l_MenuShortCutNumber))
	$_l_MenuShortCutNumber:=$_l_MenuShortCutNumber+1
	Case of 
		: ($_t_MenuType="4D menu")
			INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_NominalLedgerName)
			SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "Menu Nom")
			SET MENU ITEM SHORTCUT:C423($_t_VolumesMenuRef; -1; $_l_MenuShortCut)
		: ($_t_MenuType="menu string")
			APPEND TO ARRAY:C911(DB_at_menuitem; $_t_NominalLedgerName)
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; String:C10($_l_MenuShortCutNumber))
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Menu Nom")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
	End case 
End if 

If ((DB_GetModuleSettingByNUM(Module_JobCosting))>=2)
	$_t_JobCostingsName:=Get localized string:C991("MenuItem_JobCosts")
	$_l_MenuShortCut:=Character code:C91(String:C10($_l_MenuShortCutNumber))
	$_l_MenuShortCutNumber:=$_l_MenuShortCutNumber+1
	Case of 
		: ($_t_MenuType="4D menu")
			INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_JobCostingsName)
			SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "Menu_Jobs")
			SET MENU ITEM SHORTCUT:C423($_t_VolumesMenuRef; -1; $_l_MenuShortCut)
		: ($_t_MenuType="menu string")
			APPEND TO ARRAY:C911(DB_at_menuitem; $_t_JobCostingsName)
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; String:C10($_l_MenuShortCutNumber))
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Menu_Jobs")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
	End case 
End if 
If (User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator"))
	$_t_DataManagerName:=Get localized string:C991("MenuItem_ConfigurationManager")
	$_l_MenuShortCut:=Character code:C91("~")
	$_l_MenuShortCutNumber:=$_l_MenuShortCutNumber+1
	Case of 
		: ($_t_MenuType="4D menu")
			INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_DataManagerName)
			SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "Menu_Lists")
			SET MENU ITEM SHORTCUT:C423($_t_VolumesMenuRef; -1; $_l_MenuShortCut)
		: ($_t_MenuType="menu string")
			APPEND TO ARRAY:C911(DB_at_menuitem; $_t_DataManagerName)
			APPEND TO ARRAY:C911(DB_at_MenuShortCut; "~")
			APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
			APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Menu_Lists")
			APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
	End case 
End if 
Case of 
	: ($_t_MenuType="4D menu")
		INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; "(-")
	: ($_t_MenuType="menu string")
		APPEND TO ARRAY:C911(DB_at_menuitem; "-")
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
End case 

If (False:C215)
	$_t_FunctionsPaletteName:=Get localized string:C991("MenuItem_FunctionsPalette")
	INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_FunctionsPaletteName)
	SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "In_ButtProc")
	
	$_t_VolumesPaletteName:=Get localized string:C991("MenuItem_VolumesPalette")
	INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_VolumesPaletteName)
	SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "ZMenu_ModBar2")
End if 
$_t_WIndowsPaletteName:=Get localized string:C991("MenuItem_WindowsPalette")
Case of 
	: ($_t_MenuType="4D menu")
		//INSERT MENU ITEM($_t_VolumesMenuRef;-1;$_t_WIndowsPaletteName)
		//SET MENU ITEM METHOD($_t_VolumesMenuRef;-1;"ProcessesP")
	: ($_t_MenuType="menu string")
		//APPEND TO ARRAY(DB_at_menuitem;$_t_WIndowsPaletteName)
		//APPEND TO ARRAY(DB_at_MenuShortCut;"")
		//APPEND TO ARRAY(DB_al_MenuShortCutModifier;0)
		//APPEND TO ARRAY(DB_at_MenuItem4DFunction;"ProcessesP")
		//APPEND TO ARRAY(DB_at_MenuItemParameter;"")
End case 
If (False:C215)
	$_t_DataListsPaletteName:=Get localized string:C991("MenuItem_DatListsPal")
	INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_DataListsPaletteName)
	SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "Gen_ListSet")
	SET MENU ITEM PARAMETER:C1004($_t_VolumesMenuRef; -1; String:C10(DB_l_CurrentDisplayedForm))
	
	
End if 
$_t_ScriptsPaletteName:=Get localized string:C991("MenuItem_MacrosPalette")
Case of 
	: ($_t_MenuType="4D menu")
		INSERT MENU ITEM:C412($_t_VolumesMenuRef; -1; $_t_ScriptsPaletteName)
		SET MENU ITEM METHOD:C982($_t_VolumesMenuRef; -1; "SCPT_LaunchPalette")
	: ($_t_MenuType="menu string")
		APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ScriptsPaletteName)
		APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
		APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
		APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "SCPT_LaunchPalette")
		APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
End case 


$0:=$_t_VolumesMenuRef
ERR_MethodTrackerReturn("DB_BuildVolumesMenu"; $_t_oldMethodName)
