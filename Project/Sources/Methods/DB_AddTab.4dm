//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_AddTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:                                       21/05/2010 22:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	C_BOOLEAN:C305($_bo_Add; DB_bo_RootTabDefined)
	C_LONGINT:C283($_l_Index; $_l_ModuleAccess; $_l_TableNumber; DB_l_RootTabTable)
	C_POINTER:C301($_Ptr_TabArray; $_Ptr_TabIDArray; $_ptr_Table; $1; $2)
	C_TEXT:C284($_t_ComponentsTableName; $_t_ContactsTableName; $_t_oldMethodName; $_t_TableStateName; $_t_TableString3; DB_t_RootTabName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_AddTab")
If (Count parameters:C259>=3)
	$_Ptr_TabArray:=$1
	$_Ptr_TabIDArray:=$2
	For ($_l_Index; 3; Count parameters:C259)
		$_ptr_Table:=${$_l_Index}
		$_l_TableNumber:=Table:C252(${$_l_Index})
		
		$_t_ContactsTableName:=""
		$_t_TableStateName:=""
		$_t_TableString3:=""
		Case of 
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Companies")
			: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Balances")
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Accounts")
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS_ANALYSES:157]))
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS_LAYERS:156]))
			: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Actions")
				
			: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
				$_t_ContactsTableName:=Get localized string:C991("Table_AddressFormats")
			: ($_l_TableNumber=Table:C252(->[AddressRecords:125]))
			: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Analyses")
			: ($_l_TableNumber=Table:C252(->[AREAS:3]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Areas")
			: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Brands")
			: ($_l_TableNumber=Table:C252(->[X_URL_LInks:101]))
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS_LAYERS:156]))
			: ($_l_TableNumber=Table:C252(->[CATALOGUE:108]))
				If (Records in table:C83([CATALOGUE:108])>0)
					$_t_ContactsTableName:=Get localized string:C991("Table_Catalogue")
				End if 
			: ($_l_TableNumber=Table:C252(->[Catalogue_Availability:110]))
			: ($_l_TableNumber=Table:C252(->[Catalogue_ProductLink:109]))
			: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Categories")
			: ($_l_TableNumber=Table:C252(->[CC_OrderAuths:133]))
			: ($_l_TableNumber=Table:C252(->[CCM_PSPTransaction:136]))
			: ($_l_TableNumber=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
			: ($_l_TableNumber=Table:C252(->[CODE_USES:91]))
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			: ($_l_TableNumber=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
			: ($_l_TableNumber=Table:C252(->[COMPONENTS:86]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Assemblies)  //Purchase Invoices
				If ($_l_ModuleAccess>1)
					$_t_ComponentsTableName:=Get localized string:C991("Table_Components")
				End if 
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Contacts")
			: ($_l_TableNumber=Table:C252(->[CONTACTS_COMPANIES:145]))
			: ($_l_TableNumber=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
			: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
				$_t_ContactsTableName:=Get localized string:C991("Table_ContractTypes")
			: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Contracts")
			: ($_l_TableNumber=Table:C252(->[CONTRACTS_CONTACTS:151]))
			: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
				
				$_t_ContactsTableName:=Get localized string:C991("Table_Countries")
			: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
				$_t_ContactsTableName:=Get localized string:C991("Table_CreditStages")
			: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Currencies")
			: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
				$_t_ContactsTableName:=Get localized string:C991("Table_CurrencyRates")
			: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
				$_t_ContactsTableName:=Get localized string:C991("Table_CurrentStock")
				$_t_ContactsTableName:=Term_StoWT($_t_ContactsTableName)
			: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
			: ($_l_TableNumber=Table:C252(->[DELETIONS:66]))
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Diary")
				
			: ($_l_TableNumber=Table:C252(->[DIARY_ITEMOWNERS:106]))
			: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Documents")
			: ($_l_TableNumber=Table:C252(->[EMAIL_ATTACHMENTS:103]))
			: ($_l_TableNumber=Table:C252(->[EMAIL_RECIPIENTS:104]))
				
			: ($_l_TableNumber=Table:C252(->[EW_BK_FieldMap:121]))
			: ($_l_TableNumber=Table:C252(->[EW_BKFields:122]))
			: ($_l_TableNumber=Table:C252(->[EW_ExportProjects:117]))
			: ($_l_TableNumber=Table:C252(->[EW_ExportSteps:118]))
				
			: ($_l_TableNumber=Table:C252(->[EW_ExportTables:120]))
			: ($_l_TableNumber=Table:C252(->[EW_StepActions:119]))
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
				$_t_ContactsTableName:=Get localized string:C991("Table_FieldDefintions")
			: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
			: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
			: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
			: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
			: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Furthers")
			: ($_l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Groups")
			: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Headings")
			: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)  //Sales Invoices
				If ($_l_ModuleAccess>1)
					$_t_ContactsTableName:=Get localized string:C991("Table_Invoices")
					$_t_ContactsTableName:=Term_SLPLWT($_t_ContactsTableName)
				End if 
			: ($_l_TableNumber=Table:C252(->[INVOICES_ALLOCATIONS:162]))
				
			: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)  //Sales Invoices
				If ($_l_ModuleAccess>1)
					$_t_ContactsTableName:=Get localized string:C991("Table_InvoiceItems")
					$_t_ContactsTableName:=Term_SLPLWT($_t_ContactsTableName)
				End if 
				
			: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
				$_t_ContactsTableName:=Get localized string:C991("Table_JobPersonnel")
			: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
				$_t_ContactsTableName:=Get localized string:C991("Table_JobStages")
			: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
				$_t_ContactsTableName:=Get localized string:C991("Table_JobTypes")
			: ($_l_TableNumber=Table:C252(->[JOBS:26]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)  //Jobs????(Jobs and stages"
				If ($_l_ModuleAccess>1)
					$_t_ContactsTableName:=Get localized string:C991("Table_Jobs")
				End if 
			: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Layers")
			: ($_l_TableNumber=Table:C252(->[LICENCE_UPDATES:97]))
			: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
			: ($_l_TableNumber=Table:C252(->[LIST_ITEMS:95]))
			: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Locations")
			: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Macros")
			: ($_l_TableNumber=Table:C252(->[MODULES:63]))
			: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
				$_t_ContactsTableName:=Get localized string:C991("Table_MovementTypes")
			: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)  //Sales Orders"
				If ($_l_ModuleAccess>1)
					$_t_ContactsTableName:=Get localized string:C991("Table_OrderItems")
				End if 
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Enquiries)  //enquiries"
				If ($_l_ModuleAccess>1)
					If (Size of array:C274(<>SYS_at_RecStateCodes{24})>1)
						$_t_ContactsTableName:=Substring:C12(<>SYS_at_RecStateNames{24}{1}; 1; 25)
						
					Else 
						$_t_ContactsTableName:=Get localized string:C991("MenuItem_Enquiries")
						
					End if 
					
				End if 
				
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)  //Sales Orders"
				If ($_l_ModuleAccess>1)
					If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
						$_t_TableStateName:=Substring:C12(<>SYS_at_RecStateNames{24}{2}; 1; 25)
					Else 
						$_t_TableStateName:=Get localized string:C991("MenuItem_Quotations")
					End if 
					
					$_t_TableString3:=Get localized string:C991("MenuItem_SalesOrders")
					
					
				End if 
			: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Periods")
			: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
				$_t_ContactsTableName:=Get localized string:C991("Table_PersonnelGroups")
			: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
				If (User in group:C338(Current user:C182; "Administrator"))
					$_t_ContactsTableName:=Get localized string:C991("Table_Personnel")
				End if 
			: ($_l_TableNumber=Table:C252(->[PERSONNEL_DIARY_ACCESS:149]))
			: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Pictures")
			: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
				$_t_ContactsTableName:=Get localized string:C991("Table_PostCodes")
			: ($_l_TableNumber=Table:C252(->[PREFERENCES:116]))
			: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
				$_t_ContactsTableName:=Get localized string:C991("Table_PriceGroups")
			: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PriceTable)  //Purchase Invoices
				If ($_l_ModuleAccess>1)
					
					$_t_ContactsTableName:=Get localized string:C991("Table_Pricetable")
				End if 
			: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Problems")
			: ($_l_TableNumber=Table:C252(->[PROCESSES_TO_HANDLE:115]))
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)  //Products"
				
				If ($_l_ModuleAccess>1)
					$_t_ContactsTableName:=Get localized string:C991("Table_Products")
				End if 
			: ($_l_TableNumber=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
			: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Projects")
			: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
				$_t_ContactsTableName:="Publications"
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)  //Purchase orders"
				If ($_l_ModuleAccess>1)
					$_t_ContactsTableName:=Get localized string:C991("Table_PurchaseOrders")
				End if 
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				$_t_ContactsTableName:=Get localized string:C991("Table_PurchaseOrderItems")
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)  //Purchase Invoices"
				If ($_l_ModuleAccess>1)
					$_t_ContactsTableName:=Get localized string:C991("Table_PurchaseInvoices")
					$_t_ContactsTableName:=Term_SLPLWT($_t_ContactsTableName)
				End if 
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				$_t_ContactsTableName:=Get localized string:C991("Table_PurchaseInvoiceItems")
			: ($_l_TableNumber=Table:C252(->[QUALITY_GROUPS:56]))
			: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
				$_t_ContactsTableName:=Get localized string:C991("Table_RecurringJournals")
			: ($_l_TableNumber=Table:C252(->[REC_JOURNALS_DATES:160]))
			: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Results")
			: ($_l_TableNumber=Table:C252(->[ROLES:87]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Roles")
			: ($_l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
			: ($_l_TableNumber=Table:C252(->[SALES_ProjectionLinks:114]))
			: ($_l_TableNumber=Table:C252(->[SD_Settings:107]))
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
				If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
					$_t_ContactsTableName:=Get localized string:C991("Table_ServiceCalls")
				End if 
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
			: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Solutions")
			: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Sources")
			: ($_l_TableNumber=Table:C252(->[STAGES:45]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Stages")
			: ($_l_TableNumber=Table:C252(->[STATUS:4]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Status")
				
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				If ((DB_GetModuleSettingByNUM(Module_StockControl))>=2)  //"
					$_t_ContactsTableName:=Get localized string:C991("Table_StockItems")
					$_t_ContactsTableName:=Term_StoWT($_t_ContactsTableName)
				End if 
			: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
				If ((DB_GetModuleSettingByNUM(Module_StockControl))>=2)
					$_t_ContactsTableName:=Get localized string:C991("Table_StockLevels")
					$_t_ContactsTableName:=Term_StoWT($_t_ContactsTableName)
				End if 
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
				If ((DB_GetModuleSettingByNUM(Module_StockControl))>=2)  //"
					$_t_ContactsTableName:=Get localized string:C991("Table_StockMovements")
					
					$_t_ContactsTableName:=Term_StoWT($_t_ContactsTableName)
				End if 
			: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
				$_t_ContactsTableName:=Get localized string:C991("Table_StockTypes")
			: ($_l_TableNumber=Table:C252(->[Stock_Thread:143]))
			: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Subscriptions")
			: ($_l_TableNumber=Table:C252(->[SYS_LISTS:167]))
			: ($_l_TableNumber=Table:C252(->[SYS_ManualSequences:64]))
			: ($_l_TableNumber=Table:C252(->[SYS_RELATEDSequences:44]))
			: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
				$_t_ContactsTableName:=Get localized string:C991("Table_TaxCodes")
			: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
				$_t_ContactsTableName:="Terminology"
			: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Batches")
				
				
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
				$_t_ContactsTableName:=Get localized string:C991("Table_TransTypes")
			: ($_l_TableNumber=Table:C252(->[TRANS_MULTI:128]))
			: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Transactions")
				
			: ($_l_TableNumber=Table:C252(->[TYPES:5]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Types")
			: ($_l_TableNumber=Table:C252(->[USER:15]))
				$_t_ContactsTableName:=Get localized string:C991("Table_User")
			: ($_l_TableNumber=Table:C252(->[USER_SETS:105]))
			: ($_l_TableNumber=Table:C252(->[WEB_ACCESS:130]))
			: ($_l_TableNumber=Table:C252(->[WEBSETUP_4D:129]))
			: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
				$_t_ContactsTableName:=Get localized string:C991("Table_Workflow")
				
			: ($_l_TableNumber=Table:C252(->[WORKFLOW_Campaign:209]))
				$_t_ContactsTableName:="Campaign"
				
			: ($_l_TableNumber=Table:C252(->[X_DIaryDisplay:142]))
				
				
				
		End case 
		If ($_t_ContactsTableName#"")
			$_bo_Add:=True:C214
			If (DB_bo_RootTabDefined)
				
				If (DB_t_RootTabName=$_t_ContactsTableName) & (DB_l_RootTabTable=$_l_TableNumber)
					$_bo_Add:=False:C215
				End if 
			End if 
			//`  `07714 339040 martin bennet
			
			If ($_bo_Add)
				APPEND TO ARRAY:C911($_Ptr_TabArray->; $_t_ContactsTableName)
				APPEND TO ARRAY:C911($_Ptr_TabIDArray->; $_l_TableNumber)
			End if 
			If (Not:C34(DB_bo_RootTabDefined))
				DB_t_RootTabName:=$_t_ContactsTableName
				DB_l_RootTabTable:=$_l_TableNumber
				DB_bo_RootTabDefined:=True:C214
			End if 
		End if 
		If ($_t_TableStateName#"")
			$_bo_Add:=True:C214
			If (DB_bo_RootTabDefined)
				If (DB_t_RootTabName=$_t_TableStateName) & (DB_l_RootTabTable=$_l_TableNumber)
					$_bo_Add:=False:C215
				End if 
			End if 
			If ($_bo_Add)
				APPEND TO ARRAY:C911($_Ptr_TabArray->; $_t_TableStateName)
				APPEND TO ARRAY:C911($_Ptr_TabIDArray->; $_l_TableNumber)
			End if 
			If (Not:C34(DB_bo_RootTabDefined))
				DB_t_RootTabName:=$_t_TableStateName
				DB_l_RootTabTable:=$_l_TableNumber
				DB_bo_RootTabDefined:=True:C214
			End if 
		End if 
		If ($_t_TableString3#"")
			$_bo_Add:=True:C214
			If (DB_bo_RootTabDefined)
				If (DB_t_RootTabName=$_t_TableString3) & (DB_l_RootTabTable=$_l_TableNumber)
					$_bo_Add:=False:C215
				End if 
			End if 
			If ($_bo_Add)
				APPEND TO ARRAY:C911($_Ptr_TabArray->; $_t_TableString3)
				APPEND TO ARRAY:C911($_Ptr_TabIDArray->; $_l_TableNumber)
			End if 
			If (Not:C34(DB_bo_RootTabDefined))
				DB_t_RootTabName:=$_t_TableString3
				DB_l_RootTabTable:=$_l_TableNumber
				DB_bo_RootTabDefined:=True:C214
			End if 
		End if 
		
		
	End for 
	
End if 
ERR_MethodTrackerReturn("DB_AddTab"; $_t_oldMethodName)