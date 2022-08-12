//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_Jobs
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
	C_LONGINT:C283(<>BAR; <>BarPos; <>MENU_l_BarModule; <>MenuProc; $_l_MenuProc; $1; ModuleNumber)
	C_TEXT:C284($_t_CompaniesMenuName; $_t_CompaniesMenuReference; $_t_EditMenuName; $_t_EditMenuReference; $_t_EnquiriesMenuReference; $_t_FileMenuName; $_t_FileMenuReference; $_t_JobsMenuName; $_t_JobsMenuReference; $_t_oldMethodName; $_t_ProductsMenuName)
	C_TEXT:C284($_t_ProductsMenuReference; $_t_SalesLedgerMenuName; $_t_SalesLedgerMenuReference; $_t_TimeMenuReference; $_t_VolumesMenuName; $_t_VolumesMenuReference; DB_t_MainMenuBar)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_Jobs")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>1)
	$_l_MenuProc:=$1
Else 
	$_l_MenuProc:=<>MenuProc
End if 

Check_Mod(Module_JobCosting; "Job Costing")
If (False:C215)
	If (OK=1)
		If ((<>Bar#10) & (<>Bar#89)) | (MENU_bo_Overwrite)
			Menu_ModEnable
			If ((DB_GetModuleSettingByNUM(1))=5)
				<>Bar:=89
				<>BarPos:=4
			Else 
				<>Bar:=10
				<>BarPos:=10  //12
			End if 
			<>MENU_l_BarModule:=9
			DB_SetMenuBar(""; <>Bar; $_l_MenuProc)
			Menu_DisComp
			
			Menu_DisFile
			If ((DB_GetModuleSettingByNUM(1))#5)
				If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) | (DB_GetModuleSettingByNUM(1)=5))
					$_t_SalesLedgerMenuName:=Get localized string:C991("Menu_SalesLedger")
					$_t_SalesLedgerMenuName:=Term_SLPLWT($_t_SalesLedgerMenuName)
					DB_MenuAction($_t_SalesLedgerMenuName; ""; 3; ""; $_l_MenuProc; False:C215)
				End if 
				$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
				If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table
					DB_MenuAction($_t_ProductsMenuName; Get localized string:C991("MenuItem_EnterPricetable"); 3; ""; $_l_MenuProc; False:C215)
					DB_MenuAction($_t_ProductsMenuName; Get localized string:C991("MenuItem_ViewPricetable"); 3; ""; $_l_MenuProc; False:C215)
					
				End if 
			End if 
		End if 
		BRING TO FRONT:C326($_l_MenuProc)
	End if 
Else 
	Menu_ModEnable
	If ((DB_GetModuleSettingByNUM(1))=5)
		<>Bar:=89
		<>BarPos:=4
	Else 
		<>Bar:=10
		<>BarPos:=10  //12
	End if 
	<>MENU_l_BarModule:=9
	ModuleNumber:=Module_JobCosting
	DB_t_MainMenuBar:=Get menu bar reference:C979($_l_MenuProc)
	If (DB_t_MainMenuBar#"")
		RELEASE MENU:C978(DB_t_MainMenuBar)
	End if 
	
	$_t_EnquiriesMenuReference:=""
	$_t_TimeMenuReference:=""
	$_t_ProductsMenuReference:=""
	$_t_CompaniesMenuReference:=""
	$_t_FileMenuName:=Get localized string:C991("Menu_File")
	ARRAY LONGINT:C221(DB_al_MenuShortCutsUsed; 0)
	ARRAY LONGINT:C221(DB_al_ModuleMenuShortCuts; 0)  //Copied to at the bottom of this method
	DB_bo_MenusInited:=False:C215
	DB_bo_ModuleArrayInited:=True:C214
	
	$_t_FileMenuReference:=DB_CreateFilemenu
	$_t_EditMenuName:=Get localized string:C991("Menu_Edit")
	$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
	$_t_VolumesMenuReference:=DB_BuildVolumesMenu
	$_t_EditMenuReference:=DB_CreateEditMenu
	
	$_t_CompaniesMenuName:=Get localized string:C991("Menu_Companies")
	$_t_CompaniesMenuReference:=DB_BuildModuleMenu("Companies"; "Enter Companies"; "View Companies"; "Enter Contacts"; "View Contacts")
	$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
	If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
		$_t_ProductsMenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products")
	Else 
		$_t_ProductsMenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products"; "Enter to Price Table"; "View Price Table")
		
	End if 
	$_t_JobsMenuName:=Get localized string:C991("Menu_Jobs")
	$_t_JobsMenuReference:=DB_BuildModuleMenu("Jobs"; "Enter Projects"; "View Projects"; "Enter Jobs"; "View Jobs"; "View Job Stages"; "View Job Personnel"; "Enter Time & Costs"; "Enter Time"; "View Time")
	$_t_SalesLedgerMenuName:=Get localized string:C991("Menu_SalesLedger")
	
	$_t_SalesLedgerMenuName:=Term_SLPLWT($_t_SalesLedgerMenuName)
	
	$_t_SalesLedgerMenuReference:=DB_BuildModuleMenu("Sales Ledger"; "Enter Proforma"; "Enter Invoice"; "Enter Credit Note"; "View Sales Ledger"; "View Credit Notes"; "View Receipts"; "View Deposits"; "View ProFormas"; "Remittance Receipt Forms"; "Debtors Screen Report"; "Aged Debtors"; "Aged Debtors As at"; "Batch Print Invoices"; "Sales Daybook"; "List Sales Ledger"; "Print Statements of Due Amounts"; "Print Statements of account"; "EU Sales List")
	
	
	
	DB_t_MainMenuBar:=Create menu:C408
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; Get indexed string:C510(79; 1); $_t_FileMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; Get indexed string:C510(79; 5); $_t_EditMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_VolumesMenuName; $_t_VolumesMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_CompaniesMenuName; $_t_CompaniesMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_ProductsMenuName; $_t_ProductsMenuReference)
	
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_JobsMenuName; $_t_JobsMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_SalesLedgerMenuName; $_t_SalesLedgerMenuReference)
	
	SET MENU BAR:C67(DB_t_MainMenuBar; $_l_MenuProc)
	SET MENU BAR:C67(DB_t_MainMenuBar)
	Menu_DisComp
	Menu_DisFile
	If ((DB_GetModuleSettingByNUM(1))#5)
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) | (DB_GetModuleSettingByNUM(1)=5))
			$_t_SalesLedgerMenuName:=Get localized string:C991("Menu_SalesLedger")
			$_t_SalesLedgerMenuName:=Term_SLPLWT($_t_SalesLedgerMenuName)
			DB_MenuAction($_t_SalesLedgerMenuName; ""; 3; ""; $_l_MenuProc; False:C215)
		End if 
		$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
		If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table
			DB_MenuAction($_t_ProductsMenuName; Get localized string:C991("MenuItem_EnterPricetable"); 3; ""; $_l_MenuProc; False:C215)
			DB_MenuAction($_t_ProductsMenuName; Get localized string:C991("MenuItem_ViewPricetable"); 3; ""; $_l_MenuProc; False:C215)
			
		End if 
	End if 
	BRING TO FRONT:C326($_l_MenuProc)
	
	
	
End if 
MENU_bo_Overwrite:=False:C215
ERR_MethodTrackerReturn("Menu_Jobs"; $_t_oldMethodName)
