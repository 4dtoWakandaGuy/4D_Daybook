//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_DisFile
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 13:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>MOD_al_ModuleBarNum;0)
	//ARRAY TEXT(<>Mod_at_LocalisedModuleName;0)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts; <>SM_isHidden; $_bo_ProcessVisible)
	C_LONGINT:C283(<>BAR; <>BarPos; <>BUTTPROC; <>MENU_l_BarModule; <>MenuProc; <>newSetsProcess; <>ProcProc; <>SCPT_l_PaletteWIndow; $_l_BarProcess; $_l_DataManagerModuleName; $_l_DiaryModule)
	C_LONGINT:C283($_l_JobCostingModule; $_l_NLModule; $_l_Pallete; $_l_PLModule; $_l_POModule; $_l_ProcessState; $_l_ProcessTime; $_l_PurchaseOrderModule; $_l_SalesOrderModule; $_l_ServiceCallModule; $_l_SLModule)
	C_LONGINT:C283($_l_StockControlModule; $_l_WindowsPallete; $_l_WPModule)
	C_TEXT:C284(<>RECTEXT; $_t_ConfigurationManagerMenuTitl; $_t_DataListsMenuTitle; $_t_DocumentsMenuTitle; $_t_FileMenuTitle; $_t_FunctionsMenuTitle; $_t_JobCostingMenuName; $_t_ModulesMenuTitle; $_t_NominalLedgerMenuTitle; $_t_oldMethodName; $_t_PlatformVersion)
	C_TEXT:C284($_t_ProcessName; $_t_PurchaseLedgerMenuTitle; $_t_PurchaseOrderMenuTitle; $_t_QuitMenuTitle; $_t_QuitToUserMenuTitle; $_t_SalesLedgerMenuTitle; $_t_SalesOrderMenuTitle; $_t_ScriptsMenuTitle; $_t_ServiceMenuTitle; $_t_StockManagerMenuTItle; $_t_TImeManagerMenuTitle)
	C_TEXT:C284($_t_VolumesMenuTitle; $_t_WebAccessMenuName; $_t_WindowsPalleteTitle; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_DisFile")
$_t_VolumesMenuTitle:=Get localized string:C991("Menu_Volumes")
$_t_FileMenuTitle:=Get localized string:C991("Menu_File")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
//TRACE
If ((<>MENU_l_BarModule=1) | (<>MENU_l_BarModule=30) | (<>Bar=47) | (<>Bar=89) | (<>Bar=90))
	$_l_WPModule:=Module_WPManager  //Module_WPManager")
	Gen_DisableOnly($_l_WPModule; 2; 3; $_t_VolumesMenuTitle; "Silver Word Processing")  //Word Processing
	$_l_JobCostingModule:=Module_JobCosting  //Module_JobCosting")
	Gen_DisableOnly($_l_JobCostingModule; 2; 4; $_t_VolumesMenuTitle; "Silver Job Costing")  //Job Costing
	$_l_DataManagerModuleName:=Module_DataManager  //Module_DataManager")
	Gen_DisableOnly($_l_DataManagerModuleName; 2; 5; $_t_VolumesMenuTitle; "Silver Data Manager")  //Data Manager
	$_t_PurchaseLedgerMenuTitle:=Get localized string:C991("MenuItem_PurchaseLedger")
	$_t_PurchaseLedgerMenuTitle:=Term_SLPLWT($_t_PurchaseLedgerMenuTitle)
	DB_MenuAction($_t_VolumesMenuTitle; $_t_PurchaseLedgerMenuTitle; 2; ""; <>MenuProc; False:C215)  //purchase ledger
	
	
Else 
	If ((DB_GetModuleSettingByNUM(21)>1) & (DB_GetOrganisationOfficeCode="??/"))  //Disable all except DM if Remote User needs to get an Office Code
		Menu_DisFileRA
	Else 
		$_l_DiaryModule:=Module_DiaryManager  //Module_DiaryManager")
		$_t_TImeManagerMenuTitle:=Get localized string:C991("MenuItem_Timemanager")
		Gen_DisableOnly($_l_DiaryModule; 2; 1; $_t_VolumesMenuTitle; $_t_TImeManagerMenuTitle)  //Diary Manager `aMod No;Menu;Item
		
		$_l_WPModule:=Module_WPManager  //Module_WPManager")
		$_t_DocumentsMenuTitle:=Get localized string:C991("MenuItem_DocumentManager")
		Gen_DisableOnly($_l_WPModule; 2; 2; $_t_VolumesMenuTitle; $_t_DocumentsMenuTitle)
		//Word Processing
		
		$_l_ServiceCallModule:=Module_StockControl  //Module_StockControl")
		$_t_StockManagerMenuTItle:=Get localized string:C991("MenuItem_StockManager")
		$_t_StockManagerMenuTItle:=Term_StoWT($_t_StockManagerMenuTItle)
		Gen_DisableOnly($_l_ServiceCallModule; 2; 3; $_t_VolumesMenuTitle; $_t_StockManagerMenuTItle)  //Stock Control
		
		$_l_SalesOrderModule:=Module_SalesOrders  //Module_SalesOrders")
		$_t_SalesOrderMenuTitle:=Get localized string:C991("MenuItem_SalesOrders")
		//$_t_PurchaseLedgerMenuTitle:=Term_SLPLWT ($_t_PurchaseLedgerMenuTitle)
		Gen_DisableOnly($_l_SalesOrderModule; 2; 4; $_t_VolumesMenuTitle; $_t_SalesOrderMenuTitle)  //SOP
		
		$_l_POModule:=Module_PurchaseOrders  //Module_PurchaseOrders")
		$_t_PurchaseOrderMenuTitle:=Get localized string:C991("MenuItem_PurchaseOrders")
		Gen_DisableOnly($_l_POModule; 2; 5; $_t_VolumesMenuTitle; $_t_PurchaseOrderMenuTitle)  //POP
		
		
		$_l_SLModule:=Module_SalesLedger  //Module_SalesLedger")
		$_t_SalesLedgerMenuTitle:=Get localized string:C991("MenuItem_SalesLedger")
		$_t_SalesLedgerMenuTitle:=Term_SLPLWT($_t_SalesLedgerMenuTitle)
		Gen_DisableOnly($_l_SLModule; 2; 6; $_t_VolumesMenuTitle; $_t_SalesLedgerMenuTitle)  //Sales Ledger
		
		$_l_PLModule:=Module_PurchaseLedger
		$_t_PurchaseLedgerMenuTitle:=Get localized string:C991("MenuItem_PurchaseLedger")
		$_t_PurchaseLedgerMenuTitle:=Term_SLPLWT($_t_PurchaseLedgerMenuTitle)
		Gen_DisableOnly($_l_PLModule; 2; 7; $_t_VolumesMenuTitle; $_t_PurchaseLedgerMenuTitle)  //Purchase Ledger
		
		$_l_NLModule:=Module_NominalLedger
		$_t_NominalLedgerMenuTitle:=Get localized string:C991("MenuItem_NominalLedger")
		Gen_DisableOnly($_l_NLModule; 2; 8; $_t_VolumesMenuTitle; $_t_NominalLedgerMenuTitle)  //Nominal Ledger
		
		$_l_ServiceCallModule:=Module_ServiceCentre
		$_t_ServiceMenuTitle:=Get localized string:C991("MenuItem_ServiceManager")
		Gen_DisableOnly($_l_ServiceCallModule; 2; 9; $_t_VolumesMenuTitle; $_t_ServiceMenuTitle)  //Service Control
		
		$_l_JobCostingModule:=Module_JobCosting
		$_t_JobCostingMenuName:=Get localized string:C991("MenuItem_CostManager")
		Gen_DisableOnly($_l_JobCostingModule; 2; 10; $_t_VolumesMenuTitle; $_t_JobCostingMenuName)  //Job Costing
		//Gen_DisableOnly (20;2;18)  `QuarkWriter
		If ((DB_GetModuleSettingByNUM(21)<2) & (DB_GetModuleSettingByNUM(Module_IntServer)<2))  //Communications
			$_t_WebAccessMenuName:=Get localized string:C991("MenuItem_WebAccess")
			DB_MenuAction($_t_VolumesMenuTitle; $_t_WebAccessMenuName; 3; ""; <>MenuProc; False:C215)
			DB_MenuAction($_t_VolumesMenuTitle; "Web Server"; 3; ""; <>MenuProc; False:C215)  //disable the modified name too
			
		End if 
		//DB_MenuAction ($_t_VolumesMenuTitle;DB_GetIndexedString (20000;37);1;"Web Server";◊MenuProc;False)
		
		
		$_l_DataManagerModuleName:=Module_DataManager
		$_t_ConfigurationManagerMenuTitl:=Get localized string:C991("MenuItem_ConfigurationManager")
		Gen_DisableOnly($_l_DataManagerModuleName; 2; 15; $_t_VolumesMenuTitle; $_t_ConfigurationManagerMenuTitl)  //Data Manager"
		
		
		If ((DB_GetModuleSettingByNUM(30))>0)  //IF Silver Plus, disable SOP, POP & Stock functions anyway
			$_l_StockControlModule:=Module_StockControl
			$_t_StockManagerMenuTItle:=Get localized string:C991("MenuItem_StockManager")
			$_t_StockManagerMenuTItle:=Term_StoWT($_t_StockManagerMenuTItle)
			Gen_DisableOnly($_l_StockControlModule; 2; 3; $_t_VolumesMenuTitle; $_t_StockManagerMenuTItle)  //Stock Control
			
			$_l_SalesOrderModule:=Module_SalesOrders
			$_t_SalesOrderMenuTitle:=Get localized string:C991("MenuItem_SalesOrders")
			Gen_DisableOnly($_l_SalesOrderModule; 2; 4; $_t_VolumesMenuTitle; $_t_SalesOrderMenuTitle)  //SOP
			
			$_l_PurchaseOrderModule:=Module_PurchaseOrders
			$_t_PurchaseOrderMenuTitle:=Get localized string:C991("MenuItem_PurchaseOrders")
			Gen_DisableOnly($_l_PurchaseOrderModule; 2; 5; $_t_VolumesMenuTitle; $_t_PurchaseOrderMenuTitle)  //POP
		End if 
		
		If ((DB_GetModuleSettingByNUM(1))=5)  //IF Silver, disable Diary &accs functions anyway
			$_l_DiaryModule:=Module_DiaryManager  //Module_DiaryManager")
			$_t_TImeManagerMenuTitle:=Get localized string:C991("MenuItem_Timemanager")
			Gen_DisableOnly(2; 2; 1; $_t_VolumesMenuTitle; $_t_TImeManagerMenuTitle)
			
			$_l_SLModule:=Module_SalesLedger
			$_t_SalesLedgerMenuTitle:=Get localized string:C991("MenuItem_SalesLedger")
			$_t_SalesLedgerMenuTitle:=Term_SLPLWT($_t_SalesLedgerMenuTitle)
			Gen_DisableOnly($_l_SLModule; 2; 6; $_t_VolumesMenuTitle; $_t_SalesLedgerMenuTitle)  //Sales Ledger
			
			$_l_PLModule:=Module_PurchaseLedger
			$_t_PurchaseLedgerMenuTitle:=Get localized string:C991("MenuItem_PurchaseLedger")
			$_t_PurchaseLedgerMenuTitle:=Term_SLPLWT($_t_PurchaseLedgerMenuTitle)
			Gen_DisableOnly($_l_PLModule; 2; 7; $_t_VolumesMenuTitle; $_t_PurchaseLedgerMenuTitle)  //Purchase Ledger
			
			$_l_NLModule:=Module_NominalLedger
			$_t_NominalLedgerMenuTitle:=Get localized string:C991("MenuItem_NominalLedger")
			Gen_DisableOnly($_l_NLModule; 2; 8; $_t_VolumesMenuTitle; $_t_NominalLedgerMenuTitle)  //Nominal Ledger
		End if 
		
		If (((Not:C34(User in group:C338(Current user:C182; "Designer"))) & (Not:C34(User in group:C338(Current user:C182; "Administrator")))) | ((DB_GetModuleSettingByNUM(1)=5) & (<>MENU_l_BarModule#1) & (<>MENU_l_BarModule#30) & (Not:C34(User in group:C338(Current user:C182; "Designer")))))
			$_t_QuitToUserMenuTitle:=Get localized string:C991("MenuItem_Quittouser")
			DB_MenuAction($_t_FileMenuTitle; $_t_QuitToUserMenuTitle; 3; ""; <>MenuProc; False:C215)
		End if 
		//NG October 2004 the quit menu item causes a 4D clientcrash right at the end so....
		
		
		$_t_PlatformVersion:=DBGetOSVersion
		If (Position:C15("MacOs"; $_t_PlatformVersion)>0) & (False:C215)
			If (Position:C15("10"; $_t_PlatformVersion)>0)
				$_t_QuitMenuTitle:=Get localized string:C991("MenuItem_Quit")
				DB_MenuAction($_t_FileMenuTitle; $_t_QuitMenuTitle; 3; ""; <>MenuProc; False:C215)
			End if 
			
		End if 
	End if 
	
End if 

Menu_DisFile2

$_l_Pallete:=Menu_ModPalSt
If (<>ButtProc>0)  //Buttons Palette
	$_t_FunctionsMenuTitle:=Get localized string:C991("MenuItem_FunctionsPalette")
	DB_MenuAction($_t_VolumesMenuTitle; $_t_FunctionsMenuTitle; 4; "18"; <>MenuProc; False:C215)
End if 
$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
If ($_l_BarProcess>0)  //Modules Palette
	$_t_ModulesMenuTitle:=Get localized string:C991("MenuItem_VolumesPalette")
	DB_MenuAction($_t_VolumesMenuTitle; $_t_ModulesMenuTitle; 4; "18"; <>MenuProc; False:C215)
End if 
//End if
If (<>newSetsProcess>0)
	PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
	If (Not:C34(<>SM_isHidden)) & ($_bo_ProcessVisible)
		$_t_DataListsMenuTitle:=Get localized string:C991("MenuItem_DatListsPal")
		DB_MenuAction($_t_VolumesMenuTitle; $_t_DataListsMenuTitle; 4; "18"; <>MenuProc; False:C215)
	End if 
End if 


If (DB_GetModuleSettingByNUM(Module_Macros)>1)
	If (<>SCPT_l_PaletteWIndow>0)  //Macros Palette
		PROCESS PROPERTIES:C336(<>SCPT_l_PaletteWIndow; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
		
		If ($_bo_ProcessVisible)
			
			$_t_ScriptsMenuTitle:=Get localized string:C991("MenuItem_MacrosPalette")
			DB_MenuAction($_t_VolumesMenuTitle; $_t_ScriptsMenuTitle; 4; "18"; <>MenuProc; False:C215)
			
		End if 
		
		
	End if 
Else 
	$_t_ScriptsMenuTitle:=Get localized string:C991("MenuItem_MacrosPalette")
	DB_MenuAction($_t_VolumesMenuTitle; $_t_ScriptsMenuTitle; 3; ""; <>MenuProc; False:C215)
	
	
End if 
If ((DB_GetModuleSettingByNUM(1))#5)
	Term_MenuMod
End if 

$_t_WindowsPalleteTitle:=Get localized string:C991("MenuItem_WindowsPalette")

If (<>ProcProc>0)
	DB_MenuAction($_t_VolumesMenuTitle; $_t_WindowsPalleteTitle; 4; "18"; <>menuProc; False:C215)
Else 
	DB_MenuAction($_t_VolumesMenuTitle; $_t_WindowsPalleteTitle; 4; ""; <>menuProc; False:C215)
End if 

If (DB_t_CurrentFormUsage#"ModBar")  //Update the Module Palette's button clicking
	$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
	If ($_l_BarProcess#0)
		POST OUTSIDE CALL:C329($_l_BarProcess)
		If (<>SCPT_bo_NoAutoScripts=False:C215)
			$_l_Pallete:=Find in array:C230(<>MOD_al_ModuleBarNum; <>MENU_l_BarModule)
			If ($_l_Pallete>0)
				
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Menu_DisFile"; $_t_oldMethodName)
