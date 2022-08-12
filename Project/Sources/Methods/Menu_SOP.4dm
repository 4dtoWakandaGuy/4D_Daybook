//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_SOP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 15:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_MenuShortCutsUsed;0)
	//ARRAY LONGINT(DB_al_ModuleMenuShortCuts;0)
	C_BOOLEAN:C305(DB_bo_MenusInited; DB_bo_ModuleArrayInited; MENU_bo_Overwrite)
	C_LONGINT:C283(<>BAR; <>BarPos; <>MENU_l_BarModule; <>MenuProc; $_l_MenuProc; $4; DB_l_currentSelectedModuleID; DBWS_l_CurrentBarPosition; DBWS_l_DBWS_l_menuRef; DBWS_l_SelectedBar; ModuleNumber)
	C_TEXT:C284($_t_CompaniesMenuName; $_t_CompaniesMenuReference; $_t_EditMenuName; $_t_EditMenuReference; $_t_EnquiriesMenuReference; $_t_FIleMenuName; $_t_FileMenuReference; $_t_oldMethodName; $_t_ProductsMenuName; $_t_ProductsMenuNameName; $_t_ProductsMenuReference)
	C_TEXT:C284($_t_SalesOrdersMenuName; $_t_SOMenuReference; $_t_SubsMenuName; $_t_SubsMenuReference; $_t_TImeMenuReference; $_t_VolumesMenuName; $_t_VolumesMenuReference; $1; $2; $3; DB_t_MainMenuBar)
	C_TEXT:C284(DB_t_MenusFormat; DB_t_MenusSetting; Db_t_MenuType; DBWS_t_ModuleMenuJSON)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_SOP")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
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
If (Count parameters:C259>=4)
	$_l_MenuProc:=$4
Else 
	$_l_MenuProc:=<>MenuProc
End if 
Check_Mod(Module_SalesOrders; "Sales Orders")
If (False:C215)
	
Else 
	If (DB_t_MenusSetting#"WEB")
		Menu_ModEnable
		<>Bar:=15
		<>MENU_l_BarModule:=17  //BarMod is the module number
		<>BarPos:=4  //6
	Else 
		DBWS_l_SelectedBar:=15
		DB_l_currentSelectedModuleID:=17
		DBWS_l_CurrentBarPosition:=4
	End if 
	
	ModuleNumber:=Module_SalesOrders
	DB_t_MainMenuBar:=Get menu bar reference:C979($_l_MenuProc)
	If (DB_t_MainMenuBar#"")
		RELEASE MENU:C978(DB_t_MainMenuBar)
	End if 
	If (DB_t_MenusFormat="JSON")
		DBWS_t_ModuleMenuJSON:=""
		DBWS_l_DBWS_l_menuRef:=0
	End if 
	$_t_EnquiriesMenuReference:=""
	$_t_TImeMenuReference:=""
	$_t_ProductsMenuReference:=""
	$_t_CompaniesMenuReference:=""
	$_t_FIleMenuName:=Get localized string:C991("Menu_File")
	
	
	$_t_FileMenuReference:=DB_CreateFilemenu(Db_t_MenuType; DB_t_MenusFormat; DB_t_MenusSetting)
	If (DB_t_MenusFormat="JSON")
		
		DBWS_t_ModuleMenuJSON:=DBWS_MenutoJSON("Settings"; DBWS_t_ModuleMenuJSON)
	End if 
	$_t_EditMenuName:=Get localized string:C991("Menu_Edit")
	
	$_t_EditMenuReference:=DB_CreateEditMenu(Db_t_MenuType; DB_t_MenusFormat; DB_t_MenusSetting)
	If (DB_t_MenusFormat="JSON")
		DBWS_t_ModuleMenuJSON:=DBWS_MenutoJSON($_t_EditMenuName; DBWS_t_ModuleMenuJSON)
	End if 
	$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
	$_t_VolumesMenuReference:=DB_BuildVolumesMenu(Db_t_MenuType; DB_t_MenusFormat; DB_t_MenusSetting)
	If (DB_t_MenusFormat="JSON")
		DBWS_t_ModuleMenuJSON:=DBWS_MenutoJSON($_t_VolumesMenuName; DBWS_t_ModuleMenuJSON)
	End if 
	$_t_CompaniesMenuName:=Get localized string:C991("Menu_Companies")
	ARRAY LONGINT:C221(DB_al_MenuShortCutsUsed; 0)
	ARRAY LONGINT:C221(DB_al_ModuleMenuShortCuts; 0)  //Copied to at the bottom of this method
	DB_bo_MenusInited:=False:C215
	DB_bo_ModuleArrayInited:=True:C214
	
	$_t_CompaniesMenuReference:=DB_BuildModuleMenu("Companies"; "Enter Companies"; "View Companies"; "Enter Contacts"; "View Contacts")
	If (DB_t_MenusFormat="JSON")
		DBWS_t_ModuleMenuJSON:=DBWS_MenutoJSON($_t_CompaniesMenuName; DBWS_t_ModuleMenuJSON)
	End if 
	$_t_ProductsMenuNameName:=Get localized string:C991("Menu_Products")
	If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
		$_t_ProductsMenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products")
	Else 
		$_t_ProductsMenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products"; "Enter to Price Table"; "View Price Table")
	End if 
	If (DB_t_MenusFormat="JSON")
		DBWS_t_ModuleMenuJSON:=DBWS_MenutoJSON($_t_ProductsMenuNameName; DBWS_t_ModuleMenuJSON)
	End if 
	$_t_SOMenuReference:=""
	$_t_SalesOrdersMenuName:=Get localized string:C991("Menu_SalesOrders")
	If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>=2)
		
		$_t_SOMenuReference:=DB_BuildModuleMenu("Sales Orders"; "Enter New Orders"; "View Sales Orders"; "View Order Items")
		If (DB_t_MenusFormat="JSON")
			DBWS_t_ModuleMenuJSON:=DBWS_MenutoJSON($_t_SalesOrdersMenuName; DBWS_t_ModuleMenuJSON)
		End if 
	End if 
	
	$_t_SubsMenuReference:=""
	$_t_SubsMenuName:=Get localized string:C991("Menu_Subscriptions")
	
	
	If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>=2)
		$_t_SubsMenuReference:=DB_BuildModuleMenu("Subscriptions"; "Issue Deliveries"; "Subscription Billing"; "Renewals Mailing")
		If (DB_t_MenusFormat="JSON")
			DBWS_t_ModuleMenuJSON:=DBWS_MenutoJSON($_t_SubsMenuName; DBWS_t_ModuleMenuJSON)
		End if 
	End if 
	If (Db_t_MenuType="4D menu")  //if we are on a web page this bit does not happen
		DB_t_MainMenuBar:=Create menu:C408
		INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; Get indexed string:C510(79; 1); $_t_FileMenuReference)
		INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; Get indexed string:C510(79; 5); $_t_EditMenuReference)
		INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_VolumesMenuName; $_t_VolumesMenuReference)
		INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_CompaniesMenuName; $_t_CompaniesMenuReference)
		INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_ProductsMenuNameName; $_t_ProductsMenuReference)
		If ($_t_SOMenuReference#"")
			INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_SalesOrdersMenuName; $_t_SOMenuReference)
		End if 
		If ($_t_SubsMenuReference#"")
			INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_SubsMenuName; $_t_SubsMenuReference)
		End if 
		SET MENU BAR:C67(DB_t_MainMenuBar; $_l_MenuProc)
		SET MENU BAR:C67(DB_t_MainMenuBar)
		$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
		If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
			DB_MenuAction($_t_ProductsMenuName; Get localized string:C991("MenuItem_EnterPricetable"); 3; ""; $_l_MenuProc; False:C215)
			DB_MenuAction($_t_ProductsMenuName; Get localized string:C991("MenuItem_ViewPricetable"); 3; ""; $_l_MenuProc; False:C215)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_Subscriptions))<2)  //Subscription
			DB_MenuAction(Get localized string:C991("Menu_Subscriptions"); ""; 3; ""; $_l_MenuProc; False:C215)
			
			//     DISABLE MENU ITEM(6;0)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_WPManager))<2)  //WP
			DB_MenuAction(Get localized string:C991("Menu_Subscriptions"); Get localized string:C991("MenuItem_RenewalMailing"); 3; ""; $_l_MenuProc; False:C215)
		End if 
		Menu_DisComp
		Menu_DisFile
		//◊Bar:=DB_t_MainMenuBar
		BRING TO FRONT:C326($_l_MenuProc)
	End if 
End if 
MENU_bo_Overwrite:=False:C215
ERR_MethodTrackerReturn("Menu_SOP"; $_t_oldMethodName)
