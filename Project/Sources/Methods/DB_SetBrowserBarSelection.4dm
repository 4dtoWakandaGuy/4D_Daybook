//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetBrowserBarSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(DB_al_MenuShortCutsUsed;0)
	//ARRAY LONGINT(DB_al_ModuleMenuShortCuts;0)
	//ARRAY LONGINT(DB_al_TextMenuItemModifier;0;0)
	//ARRAY LONGINT(DB_al_TextSubMenuItemModifier;0;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	//ARRAY TEXT(DB_at_ModuleMenuNames;0)
	//ARRAY TEXT(DB_at_ModuleMenuReferences;0)
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
	//ARRAY TEXT(MOD_at_ModuleName;0)
	C_BOOLEAN:C305(DB_bo_MenusInited; DB_bo_ModuleArrayInited; DB_bo_ModuleMenusInitied; MENU_bo_Overwrite)
	C_LONGINT:C283(<>BUTTPROC; <>MENU_l_BarModule; <>MenuProc; $_l_ButtonClicked; $_l_Index; $_l_ModuleNumber; $_l_ModuleRow; $_l_Retries; $1; $3; vSNo)
	C_PICTURE:C286(BAR_Pic_Logo)
	C_POINTER:C301($_ptr_BarNumber; $_ptr_BarNumberArray; $2; $4)
	C_TEXT:C284(<>EXECUTE; $_t_AccountsMenuName; $_t_AssemblyMenuName; $_t_CallCentreMenuName; $_t_CompaniesMenuName; $_t_CoreMenuName; $_t_DocumentsMenuName; $_t_EnquiriesMenuName; $_t_FinancialsMenuName; $_t_JobsMenuName; $_t_MailingMenuName)
	C_TEXT:C284($_t_MenuReference; $_t_ModuleMenu; $_t_ModuleName; $_t_NomLedgerMenuName; $_t_oldMethodName; $_t_OthersMenuName; $_t_ProductsMenuName; $_t_PurchOrderMenuName; $_t_PurLedgerMenuName; $_t_SalesLedgerMenuName; $_t_SalesOrderMenuName)
	C_TEXT:C284($_t_StockMenuName; $_t_SubsMenuName; $_t_TImeManagerMenuName; $_t_UtilitiesMenuName; $5; Db_t_MenuType)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_SetBrowserBarSelection")


//TRACE
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
$_l_Retries:=0

$_l_Retries:=0
While (Semaphore:C143("$BarMod"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*$_l_Retries)
End while 
If (Count parameters:C259>=2)
	$_ptr_BarNumberArray:=$2
Else 
	$_ptr_BarNumberArray:=-><>MOD_al_ModuleBarNum
	
End if 
If (Count parameters:C259>=3)
	$_l_ModuleNumber:=$3
Else 
	$_l_ModuleNumber:=vSNo
End if 
If (Count parameters:C259>=4)
	$_ptr_BarNumber:=$4
Else 
	$_ptr_BarNumber:=-><>MENU_l_BarModule
End if 
If (Count parameters:C259>=5)
	Db_t_MenuType:=$5
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
Else 
	Db_t_MenuType:="4D menu"
	
	
End if 
$_l_ButtonClicked:=$1
While (Semaphore:C143("$SettingModuleMenus"))
	DelayTicks(2)
End while 
If (DB_bo_ModuleMenusInitied)
	For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
		RELEASE MENU:C978(DB_at_ModuleMenuReferences{$_l_Index})
	End for 
End if 
ARRAY TEXT:C222(DB_at_ModuleMenuReferences; 0)
ARRAY TEXT:C222(DB_at_ModuleMenuNames; 0)

If (Size of array:C274($_ptr_BarNumberArray->)>=$_l_ButtonClicked)
	If ($_ptr_BarNumberArray->{$_l_ButtonClicked}<=Size of array:C274(<>Mod_at_ProcessFunction))
		If (<>Mod_at_ProcessFunction{$_ptr_BarNumberArray->{$_l_ButtonClicked}}#"")
			If (Picture size:C356(BAR_Pic_Logo)>0)
				$_t_ModuleName:=Uppers2(Lowercase:C14(MOD_at_ModuleName{$_l_ButtonClicked}))
			Else 
				$_t_ModuleName:=Uppers2(Lowercase:C14(MOD_at_ModuleName{$_l_ButtonClicked}))+Char:C90(13)+DB_GetOrganisationScreenName
			End if 
			$_l_ModuleRow:=$_ptr_BarNumberArray->{$_l_ButtonClicked}
			$_t_ModuleMenu:=<>Mod_at_ProcessFunction{$_l_ModuleRow}
			//Modules_MenuExe (◊aModProc{$_ptr_BarNumberArray->{$_l_ButtonClicked}})
			ARRAY LONGINT:C221(DB_al_MenuShortCutsUsed; 0)
			ARRAY LONGINT:C221(DB_al_ModuleMenuShortCuts; 0)  //Copied to at the bottom of this method
			DB_bo_MenusInited:=False:C215
			DB_bo_ModuleArrayInited:=True:C214
			
			Case of 
				: ($_t_ModuleMenu="Menu_Main")
					//Menu Main
					//similar to menu bar 1 or 20
					//menu bar 1
					//companies,, enter companies, view companies, enter contacts, view contacts
					//produccts, enter products, view products, enter to price table, view price table
					//time manamgement, enter to calender, enter in workflow, enter completed actions, automated action, work workflow tasks, view calendat, view history, view automated actions
					//enquiry write, enter prospects, view prospects, enter enquireis, enter quotations, enter new orders, view enquiry writer
					
					//menu bar 20
					
					$_t_CompaniesMenuName:=Get localized string:C991("Menu_Companies")
					$_t_MenuReference:=DB_BuildModuleMenu("Companies"; "Enter Companies"; "View Companies"; "Enter Contacts"; "View Contacts")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_CompaniesMenuName)
							
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_CompaniesMenuName)
					End case 
					
					$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products")
					Else 
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products"; "Enter to Price Table"; "View Price Table")
					End if 
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_ProductsMenuName)
							
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_ProductsMenuName)
					End case 
					$_t_TImeManagerMenuName:=Get localized string:C991("Menu_TimeManager")
					$_t_MenuReference:=DB_BuildModuleMenu("TIme Management"; "Enter in Calendar"; "Enter in Workflow"; "Enter Completed Activity"; "Automated Action"; "View Workflow Tasks"; "View Calendar"; "View History"; "View Automated Actions")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_TImeManagerMenuName)
							
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_ProductsMenuName)
					End case 
					
					
					$_t_EnquiriesMenuName:=Get localized string:C991("Menu_Enquiries")
					If ((DB_GetModuleSettingByNUM(Module_Enquiries))>=2)
						If ((DB_GetModuleSettingByNUM(14))<2)  //campaign manager controls Enquirers
							$_t_MenuReference:=DB_BuildModuleMenu("Enquiries"; "Enter Enquiries"; "Enter Quotations"; "Enter New Orders"; "View Enquiry Writer")
							
						Else 
							$_t_MenuReference:=DB_BuildModuleMenu("Enquiries"; "Enter Prospects"; "View Prospects"; "Enter Enquiries"; "Enter New Orders"; "View Enquiry Writer")
						End if 
						Case of 
							: (Db_t_MenuType="4D menu")
								APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
								APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_EnquiriesMenuName)
								
							: (Db_t_MenuType="menu string")
								DB_MenuToArray("Module"; $_t_EnquiriesMenuName)
						End case 
						
					End if 
					
					DB_bo_ModuleMenusInitied:=True:C214
				: ($_t_ModuleMenu="Menu_WP")
					//Menu WP
					$_t_CompaniesMenuName:=Get localized string:C991("Menu_Companies")
					$_t_MenuReference:=DB_BuildModuleMenu("Companies"; "Enter Companies"; "View Companies"; "Enter Contacts"; "View Contacts")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_CompaniesMenuName)
							
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_CompaniesMenuName)
					End case 
					$_t_DocumentsMenuName:=Get localized string:C991("Menu_Documents")
					If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
						
						$_t_MenuReference:=DB_BuildModuleMenu("Documents"; "Enter Letters"; "Enter Quotations"; "Enter E-Mail"; "View Letters & Quotes"; "Enter Letter Templates"; "Enter Report Templates"; "Enter Email Templates"; "View Letter Templates"; "View Report Templates"; "View Email Templates"; "View Other Templates")
						
					Else 
						$_t_MenuReference:=DB_BuildModuleMenu("Documents"; "Enter Letters"; "Enter Quotations"; "Enter E-Mail"; "View Letters & Quotes"; "Enter Letter Templates"; "Enter Report Templates"; "Enter Email Templates"; "View Letter Templates"; "View Report Templates"; "View Email Templates"; "View Other Templates")
						
						
					End if 
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_DocumentsMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_DocumentsMenuName)
					End case 
					
					$_t_MailingMenuName:=Get localized string:C991("Menu_Mailing")
					$_t_MenuReference:=DB_BuildModuleMenu("Mailing"; "Mail_Companies"; "Mail_Contacts"; "Mail_Diary"; "Enquiries"; "Quotations"; "Orders"; "Payments Chasing"; "Statements"; "Contracts")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_MailingMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_MailingMenuName)
					End case 
					DB_bo_ModuleMenusInitied:=True:C214
				: ($_t_ModuleMenu="Menu_Stock")
					//bar 3 or 21
					$_t_CompaniesMenuName:=Get localized string:C991("Menu_Companies")
					$_t_MenuReference:=DB_BuildModuleMenu("Companies"; "Enter Companies"; "View Companies"; "Enter Contacts"; "View Contacts")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_CompaniesMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_CompaniesMenuName)
					End case 
					$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products")
					Else 
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products"; "Enter to Price Table"; "View Price Table")
					End if 
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_ProductsMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_ProductsMenuName)
					End case 
					$_t_StockMenuName:=Get localized string:C991("Menu_Stock")
					$_t_StockMenuName:=Term_StoWT($_t_StockMenuName)
					$_t_MenuReference:=DB_BuildModuleMenu("Inventory"; "Enter Movements"; "View Movements"; "View Inventory Items"; "View Inventory History"; "View Current Inventory"; "View Inventory Levels")
					//only do this menu if assemblies available
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_StockMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_StockMenuName)
					End case 
					If ((DB_GetModuleSettingByNUM(Module_Assemblies))>=2)  //assemblies
						$_t_AssemblyMenuName:=Get localized string:C991("Menu_Assemblies")
						$_t_MenuReference:=DB_BuildModuleMenu("Assemblies"; "Assembly"; "Dissassembly")
						Case of 
							: (Db_t_MenuType="4D menu")
								APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
								APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_AssemblyMenuName)
							: (Db_t_MenuType="menu string")
								DB_MenuToArray("Module"; $_t_AssemblyMenuName)
						End case 
					End if 
					
					
					
					//Menu Stock
					DB_bo_ModuleMenusInitied:=True:C214
				: ($_t_ModuleMenu="Menu_SOP")
					//Menu SOP
					//bar 15
					$_t_CompaniesMenuName:=Get localized string:C991("Menu_Companies")
					$_t_MenuReference:=DB_BuildModuleMenu("Companies"; "Enter Companies"; "View Companies"; "Enter Contacts"; "View Contacts")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_CompaniesMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_CompaniesMenuName)
					End case 
					$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products")
					Else 
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products"; "Enter to Price Table"; "View Price Table")
					End if 
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_ProductsMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_ProductsMenuName)
					End case 
					$_t_SalesOrderMenuName:=Get localized string:C991("Menu_SalesOrders")
					If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>=2)
						
						$_t_MenuReference:=DB_BuildModuleMenu("Sales Orders"; "Enter New Orders"; "View Sales Orders"; "View Order Items")
						
					End if 
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_SalesOrderMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_SalesOrderMenuName)
					End case 
					If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>=2)
						
						$_t_SubsMenuName:=Get localized string:C991("Menu_Subscriptions")
						$_t_MenuReference:=DB_BuildModuleMenu("Subscriptions"; "Issue Deliveries"; "Subscription Billing"; "Renewals Mailing")
						Case of 
							: (Db_t_MenuType="4D menu")
								APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
								APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_SubsMenuName)
							: (Db_t_MenuType="menu string")
								DB_MenuToArray("Module"; $_t_SubsMenuName)
						End case 
						
					End if 
					DB_bo_ModuleMenusInitied:=True:C214
				: ($_t_ModuleMenu="Menu_POP")
					//Menu POP
					$_t_CompaniesMenuName:=Get localized string:C991("Menu_Companies")
					$_t_MenuReference:=DB_BuildModuleMenu("Companies"; "Enter Companies"; "View Companies"; "Enter Contacts"; "View Contacts")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_CompaniesMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_CompaniesMenuName)
					End case 
					$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products")
					Else 
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products"; "Enter to Price Table"; "View Price Table")
					End if 
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_ProductsMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_ProductsMenuName)
					End case 
					//Menu POP
					$_t_PurchOrderMenuName:=Get localized string:C991("Menu_PurchaseOrders")
					If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>=2)
						$_t_MenuReference:=DB_BuildModuleMenu("Purchase Orders"; "Enter Purchase Orders"; "View Purchase Orders")
						Case of 
							: (Db_t_MenuType="4D menu")
								APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
								APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_PurchOrderMenuName)
							: (Db_t_MenuType="menu string")
								DB_MenuToArray("Module"; $_t_PurchOrderMenuName)
						End case 
						
					End if 
					DB_bo_ModuleMenusInitied:=True:C214
				: ($_t_ModuleMenu="Menu_Sales")
					//Menu Sales (Sales ledger) `menu bar 102 or 4
					$_t_CompaniesMenuName:=Get localized string:C991("Menu_Companies")
					$_t_MenuReference:=DB_BuildModuleMenu("Companies"; "Enter Companies"; "View Companies"; "Enter Contacts"; "View Contacts")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_CompaniesMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_CompaniesMenuName)
					End case 
					$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products")
					Else 
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products"; "Enter to Price Table"; "View Price Table")
					End if 
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_ProductsMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_ProductsMenuName)
					End case 
					$_t_SalesLedgerMenuName:=Get localized string:C991("Menu_SalesLedger")
					$_t_SalesLedgerMenuName:=Term_SLPLWT($_t_SalesLedgerMenuName)
					$_t_MenuReference:=DB_BuildModuleMenu("Sales Ledger"; "Enter Proforma"; "Enter Invoice"; "Enter Credit Note"; "View Sales Ledger"; "View Credit Notes"; "View Receipts"; "View Deposits"; "View ProFormas"; "Batch Invoice Orders"; "Batch Print Invoices"; "Batch Post to Ledgers"; "Deposit Receipt"; "Deposit Refund"; "Invoice Receipt"; "Undo Receipt"; "Remittance Receipt Forms"; "Debtors Screen Report"; "Aged Debtors"; "Aged Debtors As at"; "Sales Daybook"; "List Sales Ledger"; "Print Statements of Due Amounts"; "Print Statements of account"; "EU Sales List")
					
					
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_SalesLedgerMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_SalesLedgerMenuName)
					End case 
					DB_bo_ModuleMenusInitied:=True:C214
					
				: ($_t_ModuleMenu="Menu_Purch")
					//Menu Purch  103 or 6
					$_t_CompaniesMenuName:=Get localized string:C991("Menu_Companies")
					$_t_MenuReference:=DB_BuildModuleMenu("Companies"; "Enter Companies"; "View Companies"; "Enter Contacts"; "View Contacts")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_CompaniesMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_CompaniesMenuName)
					End case 
					$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products")
					Else 
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products"; "Enter to Price Table"; "View Price Table")
					End if 
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_ProductsMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_ProductsMenuName)
					End case 
					$_t_PurLedgerMenuName:=Get localized string:C991("Menu_PurchaseLedger")
					$_t_PurLedgerMenuName:=Term_SLPLWT($_t_PurLedgerMenuName)
					$_t_MenuReference:=DB_BuildModuleMenu("Purchase Ledger"; "Enter Invoices"; "Enter Credit Notes"; "View Ledger"; "Batch Post"; "Enter Pre-Payment"; "Enter Payment"; "Undo Payment"; "Remittances & Cheques"; "Autopay List"; "Creditors Screen Report"; "Aged Creditors Report"; "Aged Creditors as at Report")
					
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_PurLedgerMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_PurLedgerMenuName)
					End case 
					DB_bo_ModuleMenusInitied:=True:C214
				: ($_t_ModuleMenu="Menu Nom")
					//Menu Nom
					$_t_NomLedgerMenuName:=Get localized string:C991("Menu_NominalLedger")
					$_t_NomLedgerMenuName:=Term_NLWT($_t_NomLedgerMenuName)
					
					$_t_MenuReference:=DB_BuildModuleMenu("Nominal"; "Enter Transaction Batch"; "View Batches"; "Batch Post to Ledger"; "View Account Balances"; "Set-up-budgets"; "Bank Reconcilliation"; "Recurring Journals"; "Reverse Batches"; "Currency Rates")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_NomLedgerMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_NomLedgerMenuName)
					End case 
					$_t_AccountsMenuName:=Get localized string:C991("Menu_Accounts")
					$_t_MenuReference:=DB_BuildModuleMenu("Accounts"; "Audit Trail"; "Transaction Batches"; "Transactions by Date"; "Transactions by Type"; "Transactions by Account"; "Transactions Report"; "Period Balances List"; "Period Balances Reports"; "Trial Balance"; "Profit & Loss"; "Profit & Loss Vs Budgets"; "Profit & Loss 12 Periods"; "Balance Sheet"; "VAT Return"; "VAT Listing")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_AccountsMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_AccountsMenuName)
					End case 
					DB_bo_ModuleMenusInitied:=True:C214
				: ($_t_ModuleMenu="Menu_Tech")  // service control
					//Menu Tech (menu bar 7)
					$_t_CompaniesMenuName:=Get localized string:C991("Menu_Companies")
					$_t_MenuReference:=DB_BuildModuleMenu("Companies"; "Enter Companies"; "View Companies"; "Enter Contacts"; "View Contacts")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_CompaniesMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_CompaniesMenuName)
					End case 
					$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products")
					Else 
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products"; "Enter to Price Table"; "View Price Table")
					End if 
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_ProductsMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_ProductsMenuName)
					End case 
					$_t_TImeManagerMenuName:=Get localized string:C991("Menu_TimeManager")
					$_t_MenuReference:=DB_BuildModuleMenu("TIme Management"; "Enter in Calendar"; "Enter in Workflow"; "Enter Completed Activity"; "Automated Action"; "View Workflow Tasks"; "View Calendar"; "View History"; "View Automated Actions")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_TImeManagerMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_TImeManagerMenuName)
					End case 
					
					$_t_CallCentreMenuName:=Get localized string:C991("Menu_CallCentre")
					$_t_MenuReference:=DB_BuildModuleMenu("Call Centre"; "Enter Calls"; "VIew Calls"; "Outstanding Calls"; "Start Checking Calls"; "Enter Contracts"; "View Contracts")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_CallCentreMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_CallCentreMenuName)
					End case 
					
					DB_bo_ModuleMenusInitied:=True:C214
					
				: ($_t_ModuleMenu="Menu_Jobs")
					//Menu Jobs  bar 10
					$_t_CompaniesMenuName:=Get localized string:C991("Menu_Companies")
					$_t_MenuReference:=DB_BuildModuleMenu("Companies"; "Enter Companies"; "View Companies"; "Enter Contacts"; "View Contacts")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_CompaniesMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_CompaniesMenuName)
					End case 
					$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products")
					Else 
						$_t_MenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products"; "Enter to Price Table"; "View Price Table")
					End if 
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_ProductsMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_ProductsMenuName)
					End case 
					$_t_JobsMenuName:=Get localized string:C991("Menu_Jobs")
					$_t_MenuReference:=DB_BuildModuleMenu("Jobs"; "Enter Projects"; "View Projects"; "Enter Jobs"; "View Jobs"; "View Job Stages"; "View Job Personnel"; "Enter Time & Costs"; "Enter Time"; "View Time")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_JobsMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_JobsMenuName)
					End case 
					$_t_SalesLedgerMenuName:=Get localized string:C991("Menu_SalesLedger")
					$_t_SalesLedgerMenuName:=Term_SLPLWT($_t_SalesLedgerMenuName)
					
					$_t_MenuReference:=DB_BuildModuleMenu("Sales Ledger"; "Enter Proforma"; "Enter Invoice"; "Enter Credit Note"; "View Sales Ledger"; "View Credit Notes"; "View Receipts"; "View Deposits"; "View ProFormas"; "Batch Print Invoices"; "Remittance Receipt Forms"; "Debtors Screen Report"; "Aged Debtors"; "Aged Debtors As at"; "Sales Daybook"; "List Sales Ledger"; "Print Statements of Due Amounts"; "Print Statements of account"; "EU Sales List")
					
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_SalesLedgerMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_SalesLedgerMenuName)
					End case 
					
					DB_bo_ModuleMenusInitied:=True:C214
					
				: ($_t_ModuleMenu="Menu_SilverP")
					//Menu SilverP ` dont think we need to handle this
				: ($_t_ModuleMenu="Menu_Remote")
					//Menu_Remote dont think we need to handle this
				: ($_t_ModuleMenu="Menu_Lists")
					$_t_CoreMenuName:=Get localized string:C991("Menu_Core")
					$_t_MenuReference:=DB_BuildModuleMenu("Core"; "Areas"; "PostCodes"; "Countries"; "Address Formats"; "Status"; "Types"; "Sources"; "Publications"; "Further Analyses"; "Roles"; "Change Password"; "Personnel Groups"; "Personnel & Resources"; "Collections"; "Groups"; "Brands"; "Price Groups"; "Macros"; "Pictures"; "Terminology"; "Record States"; "Lists"; "Further Fields"; "Update Licence"; "Preferences")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_CoreMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_CoreMenuName)
					End case 
					
					$_t_FinancialsMenuName:=Get localized string:C991("Menu_Financials")
					$_t_MenuReference:=DB_BuildModuleMenu("Financials"; "Stock Types"; "Stock Locations"; "Movement Types"; "Credit Stages"; "Credit Card Provision"; "Accounts"; "Account Headings"; "Years & Periods"; "Transaction Types"; "Analyses"; "Layers"; "Tax Codes"; "Currencies")
					
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_FinancialsMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_FinancialsMenuName)
					End case 
					
					//'"Analyses";"Layers";"Tax Codes";"Currencies")
					$_t_OthersMenuName:=Get localized string:C991("Menu_Others")
					$_t_MenuReference:=DB_BuildModuleMenu("Others"; "Actions"; "Results"; "Workflow Manager"; "Personnel Catagories"; "Job Stages"; "Job Types"; "Problems"; "Solutions"; "Contract Types")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_OthersMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_OthersMenuName)
					End case 
					
					$_t_UtilitiesMenuName:=Get localized string:C991("Menu_Utilities")
					$_t_MenuReference:=DB_BuildModuleMenu("Utilities"; "Recode Companies"; "Recode Contacts"; "De-Duplicate Companies"; "De-Duplicate Contacts"; "Close Period"; "Close Financial Year"; "Reset Data")
					Case of 
						: (Db_t_MenuType="4D menu")
							APPEND TO ARRAY:C911(DB_at_ModuleMenuReferences; $_t_MenuReference)
							APPEND TO ARRAY:C911(DB_at_ModuleMenuNames; $_t_UtilitiesMenuName)
						: (Db_t_MenuType="menu string")
							DB_MenuToArray("Module"; $_t_UtilitiesMenuName)
					End case 
					
					//Menu Lists (data managerr-bar 2
					DB_bo_ModuleMenusInitied:=True:C214
					
				: ($_t_ModuleMenu="Menu_CM")
					//Menu_CM dont think we need to handle this
					// menu sm
					//    "Menu Ad"
					//"Menu Quark"
					//"Menu_Remote"
					
					
				Else 
					//If (MENU_bo_Overwrite)
					//◊Bar:=0
					//MENU_bo_Overwrite:=False
					//End if
					//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$_t_ModuleMenu)
					//EXECUTE FORMULA($_t_ModuleMenu)
			End case 
			
			
			$_l_ModuleNumber:=$_ptr_BarNumber->
			
		End if 
		
	End if 
	
End if 
Db_t_MenuType:=""
CLEAR SEMAPHORE:C144("$SettingModuleMenus")
CLEAR SEMAPHORE:C144("$BarMod")
ERR_MethodTrackerReturn("DB_SetBrowserBarSelection"; $_t_oldMethodName)
