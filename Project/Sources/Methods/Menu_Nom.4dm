//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_Nom
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    10/05/2010 18:28
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
	C_TEXT:C284($_t_AccountsMenuName; $_t_AccountsMenuReference; $_t_CompaniesMenuReference; $_t_EditMenuName; $_t_EditMenuReference; $_t_EnquiriesMenuReference; $_t_FileMenuName; $_t_FileMenuReference; $_t_NominalMenuName; $_t_NominalMenuReference; $_t_oldMethodName)
	C_TEXT:C284($_t_ProductsMenuReference; $_t_ProfitlossMenuItem; $_t_TaxMenuItem; $_t_TaxReturnName; $_t_TimeMenuReference; $_t_VolumesMenuName; $_t_VolumesMenuReference; DB_t_MainMenuBar)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_Nom")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>1)
	$_l_MenuProc:=$1
Else 
	$_l_MenuProc:=<>MenuProc
End if 
Check_Mod(Module_NominalLedger; "General Ledger")
If (False:C215)
	If (OK=1)
		If (<>Bar#5) | (MENU_bo_Overwrite)
			Menu_ModEnable
			<>Bar:=5
			<>MENU_l_BarModule:=6
			<>BarPos:=8  //10
			DB_SetMenuBar(""; <>Bar; $_l_MenuProc)
			Menu_DisFile
			
			$_t_ProfitlossMenuItem:=DB_GetTranslatedTerminology(Table:C252(->[TRANSACTION_BATCHES:30]); "Profit & Loss")
			If ($_t_ProfitlossMenuItem#"Profit & Loss")
				DB_MenuAction("Reports"; "Profit & Loss"; 1; $_t_ProfitlossMenuItem; $_l_MenuProc; False:C215)
			End if 
			$_t_ProfitlossMenuItem:=DB_GetTranslatedTerminology(Table:C252(->[TRANSACTION_BATCHES:30]); "Profit & Loss v Budgets")
			If ($_t_ProfitlossMenuItem#"Profit & Loss v Budgets")
				DB_MenuAction("Reports"; "Profit & Loss v Budgets "; 1; $_t_ProfitlossMenuItem; $_l_MenuProc; False:C215)
			End if 
			$_t_ProfitlossMenuItem:=DB_GetTranslatedTerminology(Table:C252(->[TRANSACTION_BATCHES:30]); "Profit & Loss 12 Periods")
			If ($_t_ProfitlossMenuItem#"Profit & Loss 12 Periods")
				DB_MenuAction("Reports"; "Profit & Loss 12 Periods"; 1; $_t_ProfitlossMenuItem; $_l_MenuProc; False:C215)
				
			End if 
			$_t_TaxReturnName:=Term_VATWT("VAT Return")
			If ($_t_TaxReturnName#"VAT Return")
				DB_MenuAction("Reports"; "VAT Return"; 3; ""; $_l_MenuProc; False:C215)
				DB_MenuAction("Reports"; "VAT Return"; 1; $_t_TaxReturnName; $_l_MenuProc; False:C215)
			End if 
			$_t_TaxReturnName:=Term_VATWT("VAT Listing")
			If ($_t_TaxReturnName#"VAT Listing")
				DB_MenuAction("Reports"; "VAT Listing"; 3; ""; $_l_MenuProc; False:C215)
				DB_MenuAction("Reports"; "VAT Listing"; 1; $_t_TaxReturnName; $_l_MenuProc; False:C215)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)  //Currency"
				DB_MenuAction("Nominal"; "Currency Rates"; 3; ""; $_l_MenuProc; False:C215)
			End if 
			If (DB_GetLedgerCheckJournals)
				ZStanding_Check
			End if 
		End if 
		BRING TO FRONT:C326($_l_MenuProc)
	End if 
Else 
	Menu_ModEnable
	<>Bar:=5
	<>MENU_l_BarModule:=6
	<>BarPos:=8  //10
	ModuleNumber:=Module_NominalLedger
	DB_t_MainMenuBar:=Get menu bar reference:C979($_l_MenuProc)
	If (DB_t_MainMenuBar#"")
		RELEASE MENU:C978(DB_t_MainMenuBar)
	End if 
	
	$_t_EnquiriesMenuReference:=""
	$_t_TimeMenuReference:=""
	$_t_ProductsMenuReference:=""
	$_t_CompaniesMenuReference:=""
	$_t_FileMenuName:=Get localized string:C991("Menu_File")
	
	$_t_FileMenuReference:=DB_CreateFilemenu
	$_t_EditMenuName:=Get localized string:C991("Menu_Edit")
	$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
	$_t_VolumesMenuReference:=DB_BuildVolumesMenu
	$_t_EditMenuReference:=DB_CreateEditMenu
	$_t_NominalMenuName:=Get localized string:C991("Menu_NominalLedger")
	$_t_NominalMenuName:=Term_NLWT($_t_NominalMenuName)
	ARRAY LONGINT:C221(DB_al_MenuShortCutsUsed; 0)
	ARRAY LONGINT:C221(DB_al_ModuleMenuShortCuts; 0)  //Copied to at the bottom of this method
	DB_bo_MenusInited:=False:C215
	DB_bo_ModuleArrayInited:=True:C214
	
	$_t_NominalMenuReference:=DB_BuildModuleMenu("Nominal"; "Enter Transaction Batch"; "View Batches"; "Batch Post to Ledger"; "View Account Balances"; "Set-up-budgets"; "Bank Reconcilliation"; "Recurring Journals"; "Reverse Batches"; "Currency Rates")
	$_t_AccountsMenuName:=Get localized string:C991("Menu_Accounts")
	$_t_AccountsMenuReference:=DB_BuildModuleMenu("Accounts"; "Audit Trail"; "Transaction Batches"; "Transactions by Date"; "Transactions by Type"; "Transactions by Account"; "Transactions Report"; "Period Balances List"; "Period Balances Reports"; "Trial Balance"; "Profit & Loss"; "Profit & Loss Vs Budgets"; "Profit & Loss 12 Periods"; "Balance Sheet"; "VAT Return"; "VAT Listing")
	
	DB_t_MainMenuBar:=Create menu:C408
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; Get indexed string:C510(79; 1); $_t_FileMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; Get indexed string:C510(79; 5); $_t_EditMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_VolumesMenuName; $_t_VolumesMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_NominalMenuName; $_t_NominalMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_AccountsMenuName; $_t_AccountsMenuReference)
	SET MENU BAR:C67(DB_t_MainMenuBar; $_l_MenuProc)
	DB_t_MainMenuBar:=Get menu bar reference:C979($_l_MenuProc)
	SET MENU BAR:C67(DB_t_MainMenuBar)
	Menu_DisFile
	
	$_t_ProfitlossMenuItem:=DB_GetTranslatedTerminology(Table:C252(->[TRANSACTION_BATCHES:30]); "Profit & Loss")
	If ($_t_ProfitlossMenuItem#"Profit & Loss")
		DB_MenuAction("Reports"; "Profit & Loss"; 1; $_t_ProfitlossMenuItem; $_l_MenuProc; False:C215)
	End if 
	$_t_ProfitlossMenuItem:=DB_GetTranslatedTerminology(Table:C252(->[TRANSACTION_BATCHES:30]); "Profit & Loss v Budgets ")
	If ($_t_ProfitlossMenuItem#"Profit & Loss v Budgets ")
		DB_MenuAction("Reports"; "Profit & Loss v Budgets "; 1; $_t_ProfitlossMenuItem; $_l_MenuProc; False:C215)
	End if 
	$_t_ProfitlossMenuItem:=DB_GetTranslatedTerminology(Table:C252(->[TRANSACTION_BATCHES:30]); "Profit & Loss 12 Periods")
	If ($_t_ProfitlossMenuItem#"Profit & Loss 12 Periods")
		DB_MenuAction("Reports"; "Profit & Loss 12 Periods"; 1; $_t_ProfitlossMenuItem; $_l_MenuProc; False:C215)
		
	End if 
	
	$_t_TaxMenuItem:=DB_GetTranslatedTerminology(Table:C252(->[ACCOUNTS:32]); "VAT Return")
	
	If ($_t_TaxMenuItem#"VAT Return")
		DB_MenuAction("Reports"; "VAT Return"; 3; ""; $_l_MenuProc; False:C215)
		DB_MenuAction("Reports"; "VAT Return"; 1; $_t_TaxMenuItem; $_l_MenuProc; False:C215)
	End if 
	$_t_TaxMenuItem:=DB_GetTranslatedTerminology(Table:C252(->[ACCOUNTS:32]); "VAT Listing")
	
	If ($_t_TaxMenuItem#"VAT Listing")
		DB_MenuAction("Reports"; "VAT Listing"; 3; ""; $_l_MenuProc; False:C215)
		DB_MenuAction("Reports"; "VAT Listing"; 1; $_t_TaxMenuItem; $_l_MenuProc; False:C215)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)  //Currency"
		DB_MenuAction("Nominal"; "Currency Rates"; 3; ""; $_l_MenuProc; False:C215)
	End if 
	If (DB_GetLedgerCheckJournals)
		ZStanding_Check
	End if 
	//◊Bar:=DB_t_MainMenuBar
	BRING TO FRONT:C326($_l_MenuProc)
	
End if 
MENU_bo_Overwrite:=False:C215
ERR_MethodTrackerReturn("Menu_Nom"; $_t_oldMethodName)
