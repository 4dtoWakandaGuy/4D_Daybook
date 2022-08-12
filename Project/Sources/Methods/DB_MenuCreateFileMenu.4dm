//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuCreateFileMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/04/2010 17:41
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
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_REAL:C285($1)
	C_TEXT:C284($_t_AcceptMenuName; $_t_BrowserMenuName; $_t_CloseMenuName; $_t_DebugMenuName; $_t_DeleteMenuName; $_t_MenuContext; $_t_MenuReference; $_t_MenusMenuName; $_t_MenuType; $_t_ModifyMenuName; $_t_NewMenuName)
	C_TEXT:C284($_t_NextMenuName; $_t_oldMethodName; $_t_PreviousMenuName; $_t_ProcessMenuName; $_t_QuitToUserMenuName; $_t_RemoveMenuName; $_t_ReportBugMenuName; $_t_RunScriptMenuName; $_t_SubArea; $_t_TableName; $_t_TableSubArea)
	C_TEXT:C284($0; $2; $3; $4)
End if 

//Code Starts Here
//TRACE

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuCreateFileMenu")
If ($_t_MenuReference#"")
	RELEASE MENU:C978($_t_MenuReference)
End if 
If (Count parameters:C259>=2)
	$_t_MenuContext:=$2
End if 
If (Count parameters:C259>=4)
	$_t_MenuType:=$4
Else 
	$_t_MenuType:="4D menu"
End if 
If ($_t_MenuType="menu string")
	//Return the menu into arrays-this can then be passed to the web as a JSON string after some filtering
	//Note these arrays are used on each 'build' of a menu-file-edit-reports-etc etc etc.
	//and on the build of the module menus. they have to be passed into a 2D array which represents the whole menu bar.ARRAY TEXT(DB_at_menuitem;0)
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
End if 
$_t_TableName:=""
$_t_TableSubArea:=""
Case of 
	: ($1=Table:C252(->[COMPANIES:2]))
		
		//File message
		$_t_TableName:=Get localized string:C991("Table_Companies")
		$_t_TableSubArea:=Get localized string:C991("Table_Contacts")
		//this is the default Companies_Output file mennu
	: ($1=Table:C252(->[CONTACTS:1]))
		$_t_TableSubArea:=Get localized string:C991("Table_Companies")
		$_t_TableName:=Get localized string:C991("Table_Contacts")
		//this is the default Companies_Output file mennu
	: ($1=Table:C252(->[COMPONENTS:86]))
		//$_t_TableSubArea:="Components"
		$_t_TableName:="Components"
		//this is the default Companies_Output file mennu
	: ($1=Table:C252(->[ACC_Bank_Statements:198]))
		//$_t_TableSubArea:="Components"
		$_t_TableName:="Bank Statements"
		//this is the default Companies_Output file mennu
	: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
		$_t_TableName:=Get localized string:C991("Table_Balances")
		
	: ($1=Table:C252(->[ACCOUNTS:32]))
		$_t_TableName:=Get localized string:C991("Table_Accounts")
	: ($1=Table:C252(->[ACCOUNTS_ANALYSES:157]))
		//$_t_TableName:=Get localized string("Table_AccountsAnalyses")
	: ($1=Table:C252(->[ACCOUNTS_LAYERS:156]))
		
	: ($1=Table:C252(->[ACTIONS:13]))
		$_t_TableName:=Get localized string:C991("Table_Actions")
	: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
		$_t_TableName:=Get localized string:C991("Table_AddressFormats")
	: ($1=Table:C252(->[AddressRecords:125]))
	: ($1=Table:C252(->[ANALYSES:36]))
		$_t_TableName:=Get localized string:C991("Table_Analyses")
	: ($1=Table:C252(->[AREAS:3]))
		$_t_TableName:=Get localized string:C991("Table_Areas")
	: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
		$_t_TableName:=Get localized string:C991("Table_Brands")
	: ($1=Table:C252(->[CATALOGUE:108]))
		$_t_TableName:=Get localized string:C991("Table_Catalogue")
	: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		$_t_TableName:=Get localized string:C991("Table_Categories")
	: ($1=Table:C252(->[CONTRACT_TYPES:19]))
		$_t_TableName:=Get localized string:C991("Table_ContractTypes")
	: ($1=Table:C252(->[CONTRACTS:17]))
		$_t_TableName:=Get localized string:C991("Table_Contracts")
	: ($1=Table:C252(->[COUNTRIES:73]))
		$_t_TableName:=Get localized string:C991("Table_Countries")
	: ($1=Table:C252(->[CREDIT_STAGES:54]))
		$_t_TableName:=Get localized string:C991("Table_CreditStages")
	: ($1=Table:C252(->[CURRENCIES:71]))
		$_t_TableName:=Get localized string:C991("Table_Currencies")
	: ($1=Table:C252(->[CURRENCY_RATES:72]))
		$_t_TableName:=Get localized string:C991("Table_CurrencyRates")
	: ($1=Table:C252(->[CURRENT_STOCK:62]))
		$_t_TableName:=Get localized string:C991("Table_CurrentStock")
	: ($1=Table:C252(->[DATA_AUDITS:102]))
		
	: ($1=Table:C252(->[DIARY:12]))
		$_t_TableName:=Get localized string:C991("Table_Diary")
	: ($1=Table:C252(->[DOCUMENTS:7]))
		$_t_TableName:=Get localized string:C991("Table_Documents")
	: ($1=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
		$_t_TableName:=Get localized string:C991("Table_FieldDefPers")
	: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		$_t_TableName:=Get localized string:C991("Table_FieldDefintions")
	: ($1=Table:C252(->[TABLE_RECORD_STATES:90]))
	: ($1=Table:C252(->[IDENTIFIERS:16]))
	: ($1=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
	: ($1=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
		
	: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
		$_t_TableName:="Further FIelds"
	: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		$_t_TableName:=Get localized string:C991("Table_Furthers")
	: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
		$_t_TableName:=Get localized string:C991("Table_Groups")
	: ($1=Table:C252(->[HEADINGS:84]))
		$_t_TableName:=Get localized string:C991("Table_Headings")
	: ($1=Table:C252(->[INFORMATION:55]))
		
	: ($1=Table:C252(->[INVOICES:39]))
		$_t_TableName:=Get localized string:C991("Table_Invoices")
	: ($1=Table:C252(->[INVOICES_ITEMS:161]))
		$_t_TableName:=Get localized string:C991("Table_InvoiceItems")
	: ($1=Table:C252(->[JOB PERSONNEL:48]))
		$_t_TableName:=Get localized string:C991("Table_JobPersonnel")
	: ($1=Table:C252(->[JOB_STAGES:47]))
		$_t_TableName:=Get localized string:C991("Table_JobStages")
	: ($1=Table:C252(->[JOB_TYPES:65]))
		$_t_TableName:=Get localized string:C991("Table_JobTypes")
	: ($1=Table:C252(->[JOBS:26]))
		$_t_TableName:=Get localized string:C991("Table_Jobs")
	: ($1=Table:C252(->[LAYERS:76]))
		$_t_TableName:=Get localized string:C991("Table_Layers")
	: ($1=Table:C252(->[LIST_LAYOUTS:96]))
	: ($1=Table:C252(->[LOCATIONS:61]))
		$_t_TableName:=Get localized string:C991("Table_Locations")
	: ($1=Table:C252(->[SCRIPTS:80]))
		$_t_TableName:=Get localized string:C991("Table_Macros")
	: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
		$_t_TableName:=Get localized string:C991("Table_MovementTypes")
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		$_t_TableName:=Get localized string:C991("Table_OrderItems")
	: ($1=Table:C252(->[ORDERS:24]))
		$_t_TableName:=Get localized string:C991("Table_Orders")
	: ($1=Table:C252(->[PERIODS:33]))
		$_t_TableName:=Get localized string:C991("Table_Periods")
	: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
		$_t_TableName:=Get localized string:C991("Table_PersonnelGroups")
	: ($1=Table:C252(->[PERSONNEL:11]))
		$_t_TableName:=Get localized string:C991("Table_Personnel")
	: ($1=Table:C252(->[PICTURES:85]))
		$_t_TableName:=Get localized string:C991("Table_Pictures")
	: ($1=Table:C252(->[POSTAL_CODES:50]))
		$_t_TableName:=Get localized string:C991("Table_Postcodes")
		
	: ($1=Table:C252(->[PRICE_GROUPS:18]))
		$_t_TableName:=Get localized string:C991("Table_PriceGroups")
	: ($1=Table:C252(->[PRICE_TABLE:28]))
		$_t_TableName:=Get localized string:C991("Table_Pricetable")
	: ($1=Table:C252(->[PROBLEMS:22]))
		$_t_TableName:=Get localized string:C991("Table_Problems")
	: ($1=Table:C252(->[PRODUCTS:9]))
		$_t_TableName:=Get localized string:C991("Table_Products")
	: ($1=Table:C252(->[PROJECTS:89]))
		$_t_TableName:=Get localized string:C991("Table_Projects")
	: ($1=Table:C252(->[PUBLICATIONS:52]))
		$_t_TableName:=Get localized string:C991("Table_Publications")
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
		$_t_TableName:=Get localized string:C991("Table_PurchaseOrders")
	: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		$_t_TableName:=Get localized string:C991("Table_PurchaseOrderItems")
		
	: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
		$_t_TableName:=Get localized string:C991("Table_PurchaseInvoices")
	: ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
		$_t_TableName:=Get localized string:C991("Table_PurchaseInvoiceItems")
	: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
		$_t_TableName:=Get localized string:C991("Table_RecurringJournals")
	: ($1=Table:C252(->[RESULTS:14]))
		$_t_TableName:=Get localized string:C991("Table_Results")
	: ($1=Table:C252(->[ROLES:87]))
		$_t_TableName:=Get localized string:C991("Table_Roles")
	: ($1=Table:C252(->[SALES_PROJECTION:113]))
	: ($1=Table:C252(->[SERVICE_CALLS:20]))
		$_t_TableName:=Get localized string:C991("Table_ServiceCalls")
	: ($1=Table:C252(->[SOLUTIONS:23]))
		$_t_TableName:=Get localized string:C991("Table_Solutions")
	: ($1=Table:C252(->[SOURCES:6]))
		$_t_TableName:=Get localized string:C991("Table_Sources")
	: ($1=Table:C252(->[STAGES:45]))
		$_t_TableName:=Get localized string:C991("Table_Stages")
	: ($1=Table:C252(->[STATUS:4]))
		$_t_TableName:=Get localized string:C991("Table_Status")
	: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		$_t_TableName:=Get localized string:C991("Table_StockItems")
	: ($1=Table:C252(->[STOCK_LEVELS:58]))
		$_t_TableName:=Get localized string:C991("Table_StockLevels")
	: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
		$_t_TableName:=Get localized string:C991("Table_StockMovements")
	: ($1=Table:C252(->[STOCK_TYPES:59]))
		$_t_TableName:=Get localized string:C991("Table_StockTypes")
	: ($1=Table:C252(->[SUBSCRIPTIONS:93]))
		$_t_TableName:=Get localized string:C991("Table_Subscriptions")
	: ($1=Table:C252(->[TAX_CODES:35]))
		$_t_TableName:=Get localized string:C991("Table_TaxCodes")
	: ($1=Table:C252(->[TERMINOLOGY:75]))
		$_t_TableName:=Get localized string:C991("Table_Terminology")
	: ($1=Table:C252(->[TIME_BUDGETS:49]))
		$_t_TableName:=Get localized string:C991("Table_TimeBudgets")
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
		$_t_TableName:=Get localized string:C991("Table_Batches")
		
	: ($1=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
		$_t_TableName:=Get localized string:C991("Table_BatchesItems")
	: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
		$_t_TableName:=Get localized string:C991("Table_TransTypes")
	: ($1=Table:C252(->[TRANSACTIONS:29]))
		$_t_TableName:=Get localized string:C991("Table_Transactions")
	: ($1=Table:C252(->[TYPES:5]))
		$_t_TableName:=Get localized string:C991("Table_Types")
	: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
		$_t_TableName:=Get localized string:C991("Table_Workflow")
		
End case 
If (Count parameters:C259<=3)
	If ($_t_MenuContext#"")
		If ($_t_MenuContext#"Input")
			$_t_AcceptMenuName:=Get localized string:C991("Menuitem_Accept")+" "+$_t_TableName
			$_t_CloseMenuName:=Get localized string:C991("MenuItem_CloseSelection")+" "+$_t_TableName
			Case of 
				: ($_t_MenuType="4D menu")
					$_t_MenuReference:=Create menu:C408  // This will be the file menu reference
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_CloseMenuName)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; Character code:C91("W"))
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_WindowCallBack")
					SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(2))
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
					//INSERT MENU ITEM($_t_MenuReference;-1;"(-")
					//INSERT MENU ITEM($_t_MenuReference;-1;Get localized string("MenuItem_WindowsPalette"))
					//SET MENU ITEM METHOD($_t_MenuReference;-1;"ProcessesP")
					//$_l_processpalleteproc:=Process number("$_t_ProcessMenuName")
					//If ($_l_processpalleteproc>0)
					//SET MENU ITEM MARK($_t_MenuReference;-1;Char(18))
					//Else
					//SET MENU ITEM MARK($_t_MenuReference;-1;"")
					//End if
					//INSERT MENU ITEM($_t_MenuReference;-1;"(-")
					
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "Report an issue...")
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "ERR_ReporterTool")
					
					SET MENU ITEM MARK:C208($_t_MenuReference; -1; "")
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "Debug Window")
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "ErrorDebugInit")
					
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
					If (Current user:C182="Administrator") | (Current user:C182="Designer")
						$_t_QuitToUserMenuName:=Get localized string:C991("MenuItem_Quittouser")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_QuitToUserMenuName)
						
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_WindowCallBack")
						SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(99))  // Need to check this is going to work
						// Need to check this is going to work
						SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
					End if 
					//
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_QuitToUserMenuName)
					SET MENU ITEM PROPERTY:C973($_t_MenuReference; -1; Associated standard action name:K28:8; ak quit:K76:61)
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "Q")
					
					
					
				: ($_t_MenuType="menu string")
					If (False:C215)
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
					End if 
					APPEND TO ARRAY:C911(DB_at_menuitem; $_t_CloseMenuName)
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "W")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_WindowCallBack")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10(2))
					//
					APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					//
					APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_WindowsPalette"))
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "ProcessesP")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					
					
					
					
					//
					APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					
					//
					APPEND TO ARRAY:C911(DB_at_menuitem; "Report an issue...")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "ERR_ReporterTool")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					
					//
					APPEND TO ARRAY:C911(DB_at_menuitem; "Debug Window")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "ErrorDebugInit")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					
					
					
					
					
					
					If (Current user:C182="Administrator") | (Current user:C182="Designer")
						
						//
						$_t_QuitToUserMenuName:=Get localized string:C991("MenuItem_Quittouser")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_QuitToUserMenuName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_WindowCallBack")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "99")
						
						
						
					End if 
			End case 
		Else 
			$_t_AcceptMenuName:=Get localized string:C991("Menuitem_Accept")+" "+$_t_TableName
			$_t_CloseMenuName:=Get localized string:C991("MenuItem_CloseSelection")+" "+$_t_TableName
			$_t_DeleteMenuName:=Get localized string:C991("Menuitem_DeleteRecord")+" "+$_t_TableName
			If (Count parameters:C259>=3)
				$_t_SubArea:=$3
			Else 
				$_t_SubArea:=""
			End if 
			$_t_NewMenuName:=""
			$_t_ModifyMenuName:=""
			$_t_RemoveMenuName:=""
			If ($_t_SubArea#"")
				If ($_t_SubArea#"NUL")
					$_t_NewMenuName:=Get localized string:C991("Menuitem_New")+" "+$_t_SubArea
					$_t_ModifyMenuName:=Get localized string:C991("Menuitem_Modify")+" "+$_t_SubArea
					$_t_RemoveMenuName:=Get localized string:C991("Menuitem_RemoveLine")+" "+$_t_SubArea
				End if 
			Else 
				$_t_NewMenuName:=Get localized string:C991("Menuitem_New")
				$_t_ModifyMenuName:=Get localized string:C991("Menuitem_Modify")
				$_t_RemoveMenuName:=Get localized string:C991("Menuitem_RemoveLine")
			End if 
			
			$_t_NextMenuName:=Get localized string:C991("Menuitem_NextRecord")
			$_t_PreviousMenuName:=Get localized string:C991("Menuitem_PreviousRecord")
			//$Select:=Get localized string("Menuitem_SelectRecords")
			//$Sort:=Get localized string("Menuitem_SortRecords")
			//$_r_Total:=Get localized string("Menuitem_TotalRecords")
			//$Report:=Get localized string("MenuItem_Report")
			//$Graphs:=Get localized string("Menuitem_Graphs")
			//$Apply:=Get localized string("MenuItem_ApplytoSelection")
			$_t_RunScriptMenuName:=Get localized string:C991("MenuItem_RunScript")
			$_t_ReportBugMenuName:=Get localized string:C991("MenuItem_Reportabug")
			$_t_DebugMenuName:=Get localized string:C991("MenuItem_Debugwindow")
			$_t_MenusMenuName:=Get localized string:C991("MenuItem_Menus")
			$_t_ProcessMenuName:=Get localized string:C991("MenuItem_Processes")
			//$CloseWindow:=Get localized string("MenuItem_CloseWindow")
			Case of 
				: ($_t_MenuType="4D menu")
					$_t_MenuReference:=Create menu:C408  // This will be the file menu reference
					
					//$Select:=Get localized string("Menuitem_SelectRecords")
					//$Sort:=Get localized string("Menuitem_SortRecords")
					//$_r_Total:=Get localized string("Menuitem_TotalRecords")
					//$Report:=Get localized string("MenuItem_Report")
					//$Graphs:=Get localized string("Menuitem_Graphs")
					//$Apply:=Get localized string("MenuItem_ApplytoSelection")
					//$CloseWindow:=Get localized string("MenuItem_CloseWindow")
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_AcceptMenuName)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;Enter Key )
					
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_WindowCallBack")
					SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(1))
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
					//```
					INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_CloseMenuName)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;Character code("."))
					
					
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_WindowCallBack")
					SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(2))
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
					
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_DeleteMenuName)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;Character code("W"))
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_WindowCallBack")
					SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(3))
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
					If ($_t_NewMenuName#"") | ($_t_ModifyMenuName#"") | ($_t_RemoveMenuName#"")
						
						INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						If ($_t_NewMenuName#"")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_NewMenuName)
							SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; Character code:C91("N"))
							SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_WindowCallBack")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(5))
							SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
						End if 
						If ($_t_ModifyMenuName#"")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_ModifyMenuName)
							//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;Character code("W"))
							SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_WindowCallBack")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(6))
							SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
						End if 
						If ($_t_RemoveMenuName#"")
							
							INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_RemoveMenuName)
							//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;Character code("W"))
							SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_WindowCallBack")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(7))
							SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
						End if 
					End if 
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_NextMenuName)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;Character code("W"))
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_WindowCallBack")
					SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(9))
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_PreviousMenuName)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;Character code("W"))
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_WindowCallBack")
					SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(10))
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_RunScriptMenuName)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;Character code("W"))
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "Macro_MenuFile")
					SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(DB_l_CurrentDisplayedForm))
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_ReportBugMenuName)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;Character code("W"))
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "ERR_ReporterTool")
					//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String(15))
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_DebugMenuName)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;Character code("W"))
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "ErrorDebugInit")
					//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String(15))
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
					
					INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenusMenuName)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;Character code("W"))
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "Menus")
					//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String(15))
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
					
					//INSERT MENU ITEM($_t_MenuReference;-1;$_t_ProcessMenuName)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;Character code("W"))
					//SET MENU ITEM METHOD($_t_MenuReference;-1;"Menus")
					//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String(15))
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
				: ($_t_MenuType="Menu String")
					
					If (False:C215)
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
					End if 
					
					
					
					APPEND TO ARRAY:C911(DB_at_menuitem; $_t_AcceptMenuName)
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_WindowCallBack")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10(1))
					
					
					
					//```
					APPEND TO ARRAY:C911(DB_at_menuitem; $_t_CloseMenuName)
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_WindowCallBack")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10(2))
					
					//```
					APPEND TO ARRAY:C911(DB_at_menuitem; $_t_DeleteMenuName)
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_WindowCallBack")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10(3))
					
					
					
					
					If ($_t_NewMenuName#"") | ($_t_ModifyMenuName#"") | ($_t_RemoveMenuName#"")
						
						
						APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
						
						If ($_t_NewMenuName#"")
							
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_NewMenuName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "N")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_WindowCallBack")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "5")
							
							
						End if 
						If ($_t_ModifyMenuName#"")
							
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ModifyMenuName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_WindowCallBack")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "6")
							
						End if 
						If ($_t_RemoveMenuName#"")
							
							
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_RemoveMenuName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_WindowCallBack")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "7")
						End if 
					End if 
					
					
					APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					
					
					
					APPEND TO ARRAY:C911(DB_at_menuitem; $_t_NextMenuName)
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_WindowCallBack")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "9")
					
					
					APPEND TO ARRAY:C911(DB_at_menuitem; $_t_PreviousMenuName)
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_WindowCallBack")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "10")
					
					APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					
					
					APPEND TO ARRAY:C911(DB_at_menuitem; $_t_RunScriptMenuName)
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Macro_MenuFile")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					
					
					APPEND TO ARRAY:C911(DB_at_menuitem; $_t_ReportBugMenuName)
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "ERR_ReporterTool")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					
					
					
					APPEND TO ARRAY:C911(DB_at_menuitem; $_t_DebugMenuName)
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "ErrorDebugInit")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					
					
					
					APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					
					
					
					APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenusMenuName)
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "Menus")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					
					//APPEND TO ARRAY(DB_at_menuitem;$_t_ProcessMenuName)
					//APPEND TO ARRAY(DB_at_MenuShortCut;"")
					//APPEND TO ARRAY(DB_al_MenuShortCutModifier;0)
					//APPEND TO ARRAY(DB_at_MenuItem4DFunction;"Menus")
					//APPEND TO ARRAY(DB_at_MenuItemParameter;"")
					
					
			End case 
		End if 
		
	Else 
		$_t_AcceptMenuName:=Get localized string:C991("Menuitem_Accept")+" "+$_t_TableName
		$_t_CloseMenuName:=Get localized string:C991("MenuItem_CloseSelection")+" "+$_t_TableName
		$_t_BrowserMenuName:=Get localized string:C991("MenuItem_NewDataBrowser")
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
				
				INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_BrowserMenuName)
				SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_NewDatabrowser")
				SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10($1))
				SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
				
				INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_CloseMenuName)
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; Character code:C91("W"))
				SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_WindowCallBack")
				SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(2))
				SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
				//INSERT MENU ITEM($_t_MenuReference;-1;"(-")
				//INSERT MENU ITEM($_t_MenuReference;-1;Get localized string("MenuItem_WindowsPalette"))
				//SET MENU ITEM METHOD($_t_MenuReference;-1;"ProcessesP")
				//$_l_processpalleteproc:=Process number("$_t_ProcessMenuName")
				//If ($_l_processpalleteproc>0)
				//SET MENU ITEM MARK($_t_MenuReference;-1;Char(18))
				//Else
				//SET MENU ITEM MARK($_t_MenuReference;-1;"")
				//End if
				//INSERT MENU ITEM($_t_MenuReference;-1;"(-")
				
				
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "Report an issue...")
				SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "ERR_ReporterTool")
				
				SET MENU ITEM MARK:C208($_t_MenuReference; -1; "")
				
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "Debug Window")
				SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "ErrorDebugInit")
				
				SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
				If (Current user:C182="Administrator") | (Current user:C182="Designer")
					$_t_QuitToUserMenuName:=Get localized string:C991("MenuItem_Quittouser")
					INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_QuitToUserMenuName)
					
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_WindowCallBack")
					SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(99))
					SET MENU ITEM MARK:C208($_t_MenuReference; 1; "")
				End if 
				
			: ($_t_MenuType="Menu String")
				
				
				APPEND TO ARRAY:C911(DB_at_menuitem; $_t_BrowserMenuName)
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_NewDatabrowser")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10(1))
				
				
				
				
				APPEND TO ARRAY:C911(DB_at_menuitem; $_t_CloseMenuName)
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "W")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_WindowCallBack")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; String:C10(2))
				
				
				
				
				APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
				
				
				
				APPEND TO ARRAY:C911(DB_at_menuitem; Get localized string:C991("MenuItem_WindowsPalette"))
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "ProcessesP")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
				
				
				
				APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
				
				
				
				APPEND TO ARRAY:C911(DB_at_menuitem; "Report an issue...")
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "ERR_ReporterTool")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
				
				
				
				
				APPEND TO ARRAY:C911(DB_at_menuitem; "Debug Window")
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "ErrorDebugInit")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
				
				
				If (Current user:C182="Administrator") | (Current user:C182="Designer")
					
					APPEND TO ARRAY:C911(DB_at_menuitem; "MenuItem_Quittouser")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_WindowCallBack")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "99")
				End if 
		End case 
	End if 
	
End if 


$0:=$_t_MenuReference
ERR_MethodTrackerReturn("DB_MenuCreateFileMenu"; $_t_oldMethodName)