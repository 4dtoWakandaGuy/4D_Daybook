//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetFormTabs
	//------------------ Method Notes ------------------
	//this method will set the tabs($2») which are the tables you can nagivate to from the starting point.
	//we dont simply put all tabs-there may be just one
	//------------------ Revision Control ----------------
	//Date Created: 08/04/2010 20:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_DocIncludes;0)
	//ARRAY LONGINT(DB_al_FormIDs;0)
	//ARRAY LONGINT(DB_al_TabIds;0)
	//ARRAY LONGINT(DB_al_TabIncludes;0;0)
	//ARRAY TEXT(DB_at_TabNames;0)
	C_BOOLEAN:C305(<>StatesLoaded; $_bo_AddDocuments; DB_bo_RootTabDefined; DB_bo_TabsDefined)
	C_LONGINT:C283($_l_Index; $_l_ModuleAccess; $_l_OrdersPosition; $_l_RootTabPosition; $_l_TablePosition; $_l_ViewsTypePosition; DB_l_RootTabTable; DB_l_UserFormAccess)
	C_POINTER:C301($_ptr_RootTable; $3; $4; $5)
	C_REAL:C285($1)
	C_TEXT:C284($_t_Accounts; $_t_Analyses; $_t_AreasTableName; $_t_CompaniesTableName; $_t_ContactsTableName; $_t_DocumentsName; $_t_oldMethodName; $_t_TableNameContextual; $_t_TimeManagerName; $_t_ViewType; $_t_ViewValue)
	C_TEXT:C284($2; DB_t_ModifiedTabName; DB_t_RootTabContext; DB_t_RootTabName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetFormTabs")
ARRAY TEXT:C222($3->; 0)
ARRAY LONGINT:C221($4->; 0)
If (Count parameters:C259>=5)
	ARRAY TEXT:C222($5->; 0)
End if 
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (DB_bo_RootTabDefined)
	$_ptr_RootTable:=Table:C252(DB_l_RootTabTable)
	If (DB_t_ModifiedTabName#"")
		APPEND TO ARRAY:C911($3->; DB_t_ModifiedTabName)
	Else 
		$_l_RootTabPosition:=Find in array:C230($3->; DB_t_RootTabName)
		If ($_l_RootTabPosition<0)
			APPEND TO ARRAY:C911($3->; DB_t_RootTabName)
		End if 
	End if 
	APPEND TO ARRAY:C911($4->; DB_l_RootTabTable)
	APPEND TO ARRAY:C911($5->; DB_t_RootTabContext)
End if 

Case of 
	: ($1=Table:C252(->[COMPANIES:2]))
		DB_AddTab($3; $4; ->[COMPANIES:2]; ->[CONTACTS:1])
		
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		
		SD2_LoadActionGroups
		If ($_l_ModuleAccess>1)
			ARRAY TEXT:C222(DB_at_TabNames; 0)
			ARRAY LONGINT:C221(DB_al_TabIds; 0)
			ARRAY LONGINT:C221(DB_al_FormIDs; 0)
			ARRAY LONGINT:C221(DB_al_TabIncludes; 0; 0)
			ARRAY LONGINT:C221(DB_al_DocIncludes; 0)
			DB_bo_TabsDefined:=True:C214
			SD2_LoadTabSetting(True:C214; Table:C252(->[COMPANIES:2]); ->DB_at_TabNames; ->DB_al_TabIncludes; ->DB_al_DocIncludes; ->DB_al_TabIds; ->DB_al_FormIDs)
			If (Size of array:C274(DB_at_TabNames)>0)
				$_bo_AddDocuments:=False:C215
				For ($_l_Index; 1; Size of array:C274(DB_at_TabNames))
					APPEND TO ARRAY:C911($3->; DB_at_TabNames{$_l_Index})
					APPEND TO ARRAY:C911($4->; Table:C252(->[DIARY:12]))
					If (DB_al_DocIncludes{$_l_Index}=0)
						$_bo_AddDocuments:=True:C214
					End if 
				End for 
				If ($_bo_AddDocuments)
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					
					If ($_l_ModuleAccess>1)
						
						$_t_DocumentsName:=Get localized string:C991("Table_Documents")
						APPEND TO ARRAY:C911($3->; "Documents")
						APPEND TO ARRAY:C911($4->; Table:C252(->[DOCUMENTS:7]))
					End if 
				End if 
			Else 
				$_t_TimeManagerName:=Get localized string:C991("Table_Diary")
				APPEND TO ARRAY:C911($3->; $_t_TimeManagerName)
				APPEND TO ARRAY:C911($4->; Table:C252(->[DIARY:12]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
				
				If ($_l_ModuleAccess>1)
					$_t_DocumentsName:=Get localized string:C991("Table_Documents")
					
					APPEND TO ARRAY:C911($3->; $_t_DocumentsName)
					APPEND TO ARRAY:C911($4->; Table:C252(->[DOCUMENTS:7]))
				End if 
			End if 
			ARRAY TEXT:C222($5->; Size of array:C274($3->))
		End if 
		DB_AddTab($3; $4; ->[ORDERS:24]; ->[PURCHASE_ORDERS:57]; ->[INVOICES:39]; ->[PURCHASE_INVOICES:37]; ->[SERVICE_CALLS:20]; ->[JOBS:26])
		//$Ref:=
		ARRAY TEXT:C222($5->; Size of array:C274($3->))
	: ($1=Table:C252(->[CONTACTS:1]))
		DB_AddTab($3; $4; ->[CONTACTS:1]; ->[COMPANIES:2])
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		
		SD2_LoadActionGroups
		If ($_l_ModuleAccess>1)
			ARRAY TEXT:C222(DB_at_TabNames; 0)
			ARRAY LONGINT:C221(DB_al_TabIds; 0)
			ARRAY LONGINT:C221(DB_al_FormIDs; 0)
			ARRAY LONGINT:C221(DB_al_TabIncludes; 0; 0)
			ARRAY LONGINT:C221(DB_al_DocIncludes; 0)
			DB_bo_TabsDefined:=True:C214
			SD2_LoadTabSetting(True:C214; Table:C252(->[CONTACTS:1]); ->DB_at_TabNames; ->DB_al_TabIncludes; ->DB_al_DocIncludes; ->DB_al_TabIds; ->DB_al_FormIDs)
			If (Size of array:C274(DB_at_TabNames)>0)
				$_bo_AddDocuments:=False:C215
				For ($_l_Index; 1; Size of array:C274(DB_at_TabNames))
					APPEND TO ARRAY:C911($3->; DB_at_TabNames{$_l_Index})
					APPEND TO ARRAY:C911($4->; Table:C252(->[DIARY:12]))
					If (DB_al_DocIncludes{$_l_Index}=0)
						$_bo_AddDocuments:=True:C214
					End if 
				End for 
				If ($_bo_AddDocuments)
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					
					If ($_l_ModuleAccess>1)
						$_t_DocumentsName:=Get localized string:C991("Table_Documents")
						APPEND TO ARRAY:C911($3->; "Documents")
						APPEND TO ARRAY:C911($4->; Table:C252(->[DOCUMENTS:7]))
					End if 
				End if 
			Else 
				$_t_TimeManagerName:=Get localized string:C991("Table_Diary")
				APPEND TO ARRAY:C911($3->; $_t_TimeManagerName)
				APPEND TO ARRAY:C911($4->; Table:C252(->[DIARY:12]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
				
				If ($_l_ModuleAccess>1)
					$_t_DocumentsName:=Get localized string:C991("Table_Documents")
					
					APPEND TO ARRAY:C911($3->; $_t_DocumentsName)
					APPEND TO ARRAY:C911($4->; Table:C252(->[DOCUMENTS:7]))
				End if 
			End if 
		End if 
		DB_AddTab($3; $4; ->[ORDERS:24]; ->[PURCHASE_ORDERS:57]; ->[INVOICES:39]; ->[SERVICE_CALLS:20]; ->[JOBS:26])
		
		ARRAY TEXT:C222($5->; Size of array:C274($3->))
		
	: ($1=Table:C252(->[PRODUCTS:9]))
		//companies-suppliers
		//Sales orders
		//Sales order items
		//purchase orders
		//purchase order items
		//sales invoices
		//sales invoice items
		//purchase invoice
		//purchase invoice items
		//Time manager
		//Documents
		
		//price table
		//Brands
		//Product Groups
		//stock movements
		//Current stock
		//stock levels
		//Product Catalogues(Collections)
		//components
		
		//service calls
		//service call products
		DB_AddTab($3; $4; ->[PRODUCTS:9]; ->[COMPANIES:2]; ->[ORDERS:24]; ->[ORDER_ITEMS:25]; ->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS_ITEMS:169]; ->[INVOICES:39]; ->[INVOICES_ITEMS:161]; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICE_ITEMS:158]; ->[PRICE_TABLE:28])
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		
		SD2_LoadActionGroups
		If ($_l_ModuleAccess>1)
			ARRAY TEXT:C222(DB_at_TabNames; 0)
			ARRAY LONGINT:C221(DB_al_TabIds; 0)
			ARRAY LONGINT:C221(DB_al_FormIDs; 0)
			ARRAY LONGINT:C221(DB_al_TabIncludes; 0; 0)
			ARRAY LONGINT:C221(DB_al_DocIncludes; 0)
			DB_bo_TabsDefined:=True:C214
			SD2_LoadTabSetting(True:C214; Table:C252(->[PRODUCTS:9]); ->DB_at_TabNames; ->DB_al_TabIncludes; ->DB_al_DocIncludes; ->DB_al_TabIds; ->DB_al_FormIDs)
			If (Size of array:C274(DB_at_TabNames)>0)
				$_bo_AddDocuments:=False:C215
				For ($_l_Index; 1; Size of array:C274(DB_at_TabNames))
					APPEND TO ARRAY:C911($3->; DB_at_TabNames{$_l_Index})
					APPEND TO ARRAY:C911($4->; Table:C252(->[DIARY:12]))
					If (DB_al_DocIncludes{$_l_Index}=0)
						$_bo_AddDocuments:=True:C214
					End if 
				End for 
				If ($_bo_AddDocuments)
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					
					If ($_l_ModuleAccess>1)
						$_t_DocumentsName:=Get localized string:C991("Table_Documents")
						APPEND TO ARRAY:C911($3->; "Documents")
						APPEND TO ARRAY:C911($4->; Table:C252(->[DOCUMENTS:7]))
					End if 
				End if 
			Else 
				$_t_TimeManagerName:=Get localized string:C991("Table_Diary")
				APPEND TO ARRAY:C911($3->; $_t_TimeManagerName)
				APPEND TO ARRAY:C911($4->; Table:C252(->[DIARY:12]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
				
				If ($_l_ModuleAccess>1)
					$_t_DocumentsName:=Get localized string:C991("Table_Documents")
					
					APPEND TO ARRAY:C911($3->; $_t_DocumentsName)
					APPEND TO ARRAY:C911($4->; Table:C252(->[DOCUMENTS:7]))
				End if 
			End if 
		End if 
		DB_AddTab($3; $4; ->[PRODUCT_BRANDS:8]; ->[PRODUCT_GROUPS:10]; ->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENT_ITEMS:27]; ->[CURRENT_STOCK:62]; ->[STOCK_LEVELS:58]; ->[COMPONENTS:86]; ->[SERVICE_CALLS:20]; ->[SERVICE_CALLS_PRODUCTS:152])
		
		//price table
		//Brands
		//Product Groups
		//stock movements
		//Current stock
		//stock levels
		//Product Catalogues(Collections)
		//components
		
		//service calls
		//service call products
		ARRAY TEXT:C222($5->; Size of array:C274($3->))
	: ($1=Table:C252(->[ORDERS:24]))
		Case of 
			: ($2#"")
				$_t_ViewType:=Replace string:C233($2; Get localized string:C991("MenuItem_View")+" "; "")
				
				If (Not:C34(DB_bo_RootTabDefined))
					
					$_l_ViewsTypePosition:=Find in array:C230($3->; $_t_ViewType)
					If ($_l_ViewsTypePosition<0)
						APPEND TO ARRAY:C911($3->; $_t_ViewType)
						APPEND TO ARRAY:C911($4->; Table:C252(->[ORDERS:24]))
					End if 
					DB_t_RootTabName:="Orders"
					
					DB_t_ModifiedTabName:=$_t_ViewType
					DB_l_RootTabTable:=Table:C252(->[ORDERS:24])
					DB_bo_RootTabDefined:=True:C214
				Else 
					If (DB_l_RootTabTable#Table:C252(->[ORDERS:24]))
						$_t_ViewType:=Replace string:C233($2; Get localized string:C991("MenuItem_View")+" "; "")
						
						$_l_ViewsTypePosition:=Find in array:C230($3->; $_t_ViewType)
						If ($_l_ViewsTypePosition<0)
							APPEND TO ARRAY:C911($3->; $_t_ViewType)
							APPEND TO ARRAY:C911($4->; Table:C252(->[ORDERS:24]))
						End if 
					End if 
				End if 
			Else 
				If (Not:C34(DB_bo_RootTabDefined))
					$_l_OrdersPosition:=Find in array:C230($3->; Get localized string:C991("MenuItem_SalesOrders"))
					If ($_l_OrdersPosition<0)
						APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_SalesOrders"))
						APPEND TO ARRAY:C911($4->; Table:C252(->[ORDERS:24]))
					End if 
					If (Not:C34(DB_bo_RootTabDefined))
						
						DB_t_RootTabName:=Get localized string:C991("MenuItem_SalesOrders")
						
						DB_l_RootTabTable:=Table:C252(->[ORDERS:24])
						DB_bo_RootTabDefined:=True:C214
					End if 
				Else 
					$_l_OrdersPosition:=Find in array:C230($3->; Get localized string:C991("MenuItem_SalesOrders"))
					If ($_l_OrdersPosition<0)
						APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_SalesOrders"))
						APPEND TO ARRAY:C911($4->; Table:C252(->[ORDERS:24]))
					End if 
				End if 
		End case 
		
		DB_AddTab($3; $4; ->[ORDER_ITEMS:25])
		If ($2#"")
			If ($_t_ViewType#"")
				$_t_ViewValue:=$3->{Size of array:C274($3->)}
				$_t_ViewValue:=Replace string:C233($_t_ViewValue; "Order"; $_t_ViewType)
				$3->{Size of array:C274($3->)}:=$_t_ViewValue
				
			End if 
		End if 
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)
		
		SD2_LoadActionGroups
		If ($_l_ModuleAccess>1)
			ARRAY TEXT:C222(DB_at_TabNames; 0)
			ARRAY LONGINT:C221(DB_al_TabIds; 0)
			ARRAY LONGINT:C221(DB_al_FormIDs; 0)
			ARRAY LONGINT:C221(DB_al_TabIncludes; 0; 0)
			ARRAY LONGINT:C221(DB_al_DocIncludes; 0)
			DB_bo_TabsDefined:=True:C214
			SD2_LoadTabSetting(True:C214; Table:C252(->[ORDERS:24]); ->DB_at_TabNames; ->DB_al_TabIncludes; ->DB_al_DocIncludes; ->DB_al_TabIds; ->DB_al_FormIDs)
			If (Size of array:C274(DB_at_TabNames)>0)
				$_bo_AddDocuments:=False:C215
				For ($_l_Index; 1; Size of array:C274(DB_at_TabNames))
					APPEND TO ARRAY:C911($3->; DB_at_TabNames{$_l_Index})
					APPEND TO ARRAY:C911($4->; Table:C252(->[DIARY:12]))
					If (DB_al_DocIncludes{$_l_Index}=0)
						$_bo_AddDocuments:=True:C214
					End if 
				End for 
				If ($_bo_AddDocuments)
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					
					If ($_l_ModuleAccess>1)
						$_t_DocumentsName:=Get localized string:C991("Table_Documents")
						APPEND TO ARRAY:C911($3->; "Documents")
						APPEND TO ARRAY:C911($4->; Table:C252(->[DOCUMENTS:7]))
					End if 
				End if 
			Else 
				$_t_TimeManagerName:=Get localized string:C991("Table_Diary")
				APPEND TO ARRAY:C911($3->; $_t_TimeManagerName)
				APPEND TO ARRAY:C911($4->; Table:C252(->[DIARY:12]))
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
				
				If ($_l_ModuleAccess>1)
					$_t_DocumentsName:=Get localized string:C991("Table_Documents")
					
					APPEND TO ARRAY:C911($3->; $_t_DocumentsName)
					APPEND TO ARRAY:C911($4->; Table:C252(->[DOCUMENTS:7]))
				End if 
			End if 
		End if 
		DB_AddTab($3; $4; ->[PURCHASE_ORDERS:57]; ->[INVOICES:39]; ->[INVOICES_ITEMS:161]; ->[COMPANIES:2]; ->[CONTACTS:1]; ->[PRODUCTS:9]; ->[JOBS:26]; ->[SERVICE_CALLS:20])
		
		
		
		
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)
		
		DB_AddTab($3; $4; ->[ORDER_ITEMS:25])
		If ($2#"")
			$_t_ViewType:=Replace string:C233($2; Get localized string:C991("MenuItem_View")+" "; "")
			If ($_t_ViewType#"")
				$_t_ViewValue:=$3->{Size of array:C274($3->)}
				$_t_ViewValue:=Replace string:C233($_t_ViewValue; "Order"; $_t_ViewType)
				$3->{Size of array:C274($3->)}:=$_t_ViewValue
				
			End if 
		End if 
		//orders
		$_l_OrdersPosition:=Find in array:C230($4->; Table:C252(->[ORDERS:24]))
		If ($_l_OrdersPosition<0)
			APPEND TO ARRAY:C911($3->; Get localized string:C991("MenuItem_SalesOrders"))
			APPEND TO ARRAY:C911($4->; Table:C252(->[ORDERS:24]))
		End if 
		DB_AddTab($3; $4; ->[PURCHASE_ORDERS:57]; ->[INVOICES:39]; ->[INVOICES_ITEMS:161]; ->[COMPANIES:2]; ->[CONTACTS:1]; ->[PRODUCTS:9]; ->[JOBS:26]; ->[SERVICE_CALLS:20]; ->[STOCK_MOVEMENT_ITEMS:27])
		
		
	: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
		
		DB_AddTab($3; $4; ->[ACCOUNT_BALANCES:34]; ->[ACCOUNTS:32]; ->[TRANSACTIONS:29]; ->[TRANSACTION_BATCHES:30])
		
		//accounts
		
		
	: ($1=Table:C252(->[ACCOUNTS:32]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[ACCOUNTS:32]; ->[HEADINGS:84]; ->[ACCOUNT_BALANCES:34]; ->[TRANSACTIONS:29]; ->[TRANSACTION_BATCHES:30])
		
		//account balances
		
		//transactions
		
		
	: ($1=Table:C252(->[ACCOUNTS_ANALYSES:157]))
		
		
		
	: ($1=Table:C252(->[ACCOUNTS_LAYERS:156]))
		
	: ($1=Table:C252(->[ACTIONS:13]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[ACTIONS:13]; ->[WORKFLOW_CONTROL:51])
		
		//workflow
		
		
	: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
		//countries
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		DB_AddTab($3; $4; ->[ADDRESS_FORMATS:74]; ->[COUNTRIES:73])
		
	: ($1=Table:C252(->[ANALYSES:36]))
		//analysies
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		DB_AddTab($3; $4; ->[ANALYSES:36]; ->[ACCOUNTS:32])
		If (False:C215)
			$_t_Analyses:=Get localized string:C991("Table_Analysis")
			APPEND TO ARRAY:C911($3->; $_t_Analyses)
			APPEND TO ARRAY:C911($4->; Table:C252(->[ANALYSES:36]))
			
			//accounts
			$_t_Accounts:=Get localized string:C991("Table_Accounts")
			APPEND TO ARRAY:C911($3->; $_t_Accounts)
			APPEND TO ARRAY:C911($4->; Table:C252(->[ACCOUNTS:32]))
			
		End if 
	: ($1=Table:C252(->[AREAS:3]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		DB_AddTab($3; $4; ->[AREAS:3]; ->[COMPANIES:2]; ->[CONTACTS:1])
		If (False:C215)
			$_t_AreasTableName:=Get localized string:C991("Table_Areas")
			APPEND TO ARRAY:C911($3->; $_t_AreasTableName)
			APPEND TO ARRAY:C911($4->; Table:C252(->[AREAS:3]))
			//companies
			//contacts
			$_t_CompaniesTableName:=Get localized string:C991("Table_Companies")
			APPEND TO ARRAY:C911($3->; $_t_CompaniesTableName)
			APPEND TO ARRAY:C911($4->; Table:C252(->[COMPANIES:2]))
			$_t_ContactsTableName:=Get localized string:C991("Table_Contacts")
			APPEND TO ARRAY:C911($3->; $_t_ContactsTableName)
			APPEND TO ARRAY:C911($4->; Table:C252(->[CONTACTS:1]))
		End if 
	: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[PRODUCT_BRANDS:8]; ->[PRODUCTS:9]; ->[PRICE_TABLE:28])
		
		
		
	: ($1=Table:C252(->[X_URL_LInks:101]))
		//dont show this table
	: ($1=Table:C252(->[CATALOGUE:108]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[CATALOGUE:108]; ->[PRODUCTS:9]; ->[PRICE_TABLE:28])
		
		
		
	: ($1=Table:C252(->[Catalogue_Availability:110]))
		
		
	: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[TIME_BILLING_CATEGORIES:46]; ->[PERSONNEL:11])
		
		
	: ($1=Table:C252(->[CC_OrderAuths:133]))
	: ($1=Table:C252(->[CCM_PSPTransaction:136]))
	: ($1=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
	: ($1=Table:C252(->[CODE_USES:91]))
	: ($1=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
		
	: ($1=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
		
	: ($1=Table:C252(->[CONTRACT_TYPES:19]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[CONTRACT_TYPES:19]; ->[SERVICE_CALLS:20]; ->[CONTRACTS:17])
		
		//contracts
		
		
	: ($1=Table:C252(->[CONTRACTS:17]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)
		
		
		DB_AddTab($3; $4; ->[CONTRACTS:17]; ->[COMPANIES:2]; ->[CONTACTS:1]; ->[CONTRACT_TYPES:19]; ->[SERVICE_CALLS:20])
		
		
		//service calls
		
		
	: ($1=Table:C252(->[CONTRACTS_CONTACTS:151]))
		
	: ($1=Table:C252(->[COUNTRIES:73]))
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		DB_AddTab($3; $4; ->[COUNTRIES:73]; ->[TAX_CODES:35])
		
		
		//address formats
	: ($1=Table:C252(->[CREDIT_STAGES:54]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[CREDIT_STAGES:54]; ->[DOCUMENTS:7])
		
		
	: ($1=Table:C252(->[CURRENCIES:71]))
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		DB_AddTab($3; $4; ->[CURRENCIES:71])
		
		
	: ($1=Table:C252(->[CURRENCY_RATES:72]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		DB_AddTab($3; $4; ->[CURRENCY_RATES:72]; ->[CURRENCIES:71])
		
		
		
	: ($1=Table:C252(->[CURRENT_STOCK:62]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
		
		
		DB_AddTab($3; $4; ->[CURRENT_STOCK:62]; ->[PRODUCTS:9]; ->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENTS:40]; ->[STOCK_LEVELS:58]; ->[PURCHASE_ORDERS:57]; ->[ORDER_ITEMS:25])
		
		
		//products
		//stock items
		
		//stock movements
		//stock levels
		//purchase orders
		//purchase order items
		
		//orders
		
		//order items
		
	: ($1=Table:C252(->[DATA_AUDITS:102]))
		
	: ($1=Table:C252(->[DELETIONS:66]))
	: ($1=Table:C252(->[DIARY:12]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		If (False:C215)
			
			
			
			
			DB_AddTab($3; $4; ->[DIARY:12]; ->[COMPANIES:2]; ->[CONTACTS:1]; ->[ORDERS:24]; ->[ORDER_ITEMS:25]; ->[PRODUCTS:9]; ->[PURCHASE_ORDERS:57]; ->[JOBS:26])
			
			
			//companies
			
			//contacts
			//orders
			//order items
			
			//products
			
			//purchase orders
			//purchase order items
			
			//jobs
		Else 
			//in the diary we will handle the tabs differently. Here we will get the 'groups' of diary actions.
			//these groups are set up the same way they are in input forms
			If (Not:C34(DB_bo_TabsDefined))
				ARRAY TEXT:C222(DB_at_TabNames; 0)
				ARRAY LONGINT:C221(DB_al_TabIds; 0)
				ARRAY LONGINT:C221(DB_al_FormIDs; 0)
				ARRAY LONGINT:C221(DB_al_TabIncludes; 0; 0)
				ARRAY LONGINT:C221(DB_al_DocIncludes; 0)
				DB_bo_TabsDefined:=True:C214
			End if 
			
			
			Case of 
				: ($2="Documents")
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					
					DB_AddTab($3; $4; ->[DIARY:12]; ->[COMPANIES:2]; ->[CONTACTS:1])
					$3->{1}:="Letters"
				: ($2="Mailing Diary")
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
					
					DB_AddTab($3; $4; ->[DIARY:12]; ->[COMPANIES:2]; ->[CONTACTS:1])
					$3->{1}:="Diary"
					
				Else 
					TRACE:C157
					DB_AddTab($3; $4; ->[DIARY:12]; ->[COMPANIES:2]; ->[CONTACTS:1]; ->[ORDERS:24]; ->[ORDER_ITEMS:25]; ->[PRODUCTS:9]; ->[PURCHASE_ORDERS:57]; ->[JOBS:26])
					
			End case 
		End if 
	: ($1=Table:C252(->[DIARY_ITEMOWNERS:106]))
	: ($1=Table:C252(->[DOCUMENTS:7]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
		
		
		DB_AddTab($3; $4; ->[DOCUMENTS:7]; ->[COMPANIES:2]; ->[CONTACTS:1])
		
		//several types of doc window
		//if we are viewing the context of templates then this should allow naviagation to the letters-this usage of the template
		//if it is a letter view then we can nav to related companies/contacts etc because that is really the diary.
		
		//
	: ($1=Table:C252(->[EMAIL_ATTACHMENTS:103]))
	: ($1=Table:C252(->[EMAIL_RECIPIENTS:104]))
		
	: ($1=Table:C252(->[EW_BK_FieldMap:121]))
	: ($1=Table:C252(->[EW_BKFields:122]))
	: ($1=Table:C252(->[EW_ExportProjects:117]))
	: ($1=Table:C252(->[EW_ExportSteps:118]))
	: ($1=Table:C252(->[EW_ExportTables:120]))
	: ($1=Table:C252(->[EW_StepActions:119]))
	: ($1=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
		
	: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		DB_AddTab($3; $4; ->[CUSTOM_FIELD_DEFINITiONS:99])
	: ($1=Table:C252(->[TABLE_RECORD_STATES:90]))
	: ($1=Table:C252(->[IDENTIFIERS:16]))
	: ($1=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
	: ($1=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
	: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
	: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		DB_AddTab($3; $4; ->[ADDITIONAL_RECORD_ANALYSIS:53]; ->[COMPANIES:2]; ->[CONTACTS:1])
		
		
		
		
		//Companies
		//contacts
	: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[PRODUCT_GROUPS:10]; ->[PRODUCTS:9]; ->[PRICE_TABLE:28])
		
	: ($1=Table:C252(->[HEADINGS:84]))
		//accounts
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[HEADINGS:84]; ->[ACCOUNTS:32])
		
		
	: ($1=Table:C252(->[INFORMATION:55]))
	: ($1=Table:C252(->[INVOICES:39]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)
		
		Case of 
			: ($2="View Receipts") | ($2="View Deposits")
				DB_AddTab($3; $4; ->[INVOICES:39]; ->[COMPANIES:2]; ->[CONTACTS:1]; ->[ORDER_ITEMS:25]; ->[TRANSACTION_BATCHES:30]; ->[TRANSACTIONS:29])
				ARRAY TEXT:C222($5->; Size of array:C274($3->))
			Else 
				If ($2#"")
					DB_AddTab($3; $4; ->[INVOICES:39]; ->[INVOICES_ITEMS:161]; ->[COMPANIES:2]; ->[CONTACTS:1]; ->[ORDER_ITEMS:25]; ->[TRANSACTION_BATCHES:30]; ->[TRANSACTIONS:29])
					ARRAY TEXT:C222($5->; Size of array:C274($3->))
				Else 
					DB_AddTab($3; $4; ->[INVOICES:39])
					ARRAY TEXT:C222($5->; Size of array:C274($3->))
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)  //Sales Invoices
					
					If ($_l_ModuleAccess>1)
						$_t_TableNameContextual:=Term_SLPLWT("Invoices")
						APPEND TO ARRAY:C911($3->; $_t_TableNameContextual)
						APPEND TO ARRAY:C911($4->; Table:C252(->[INVOICES:39]))
						APPEND TO ARRAY:C911($5->; "View Invoices")
						$_t_TableNameContextual:=Term_SLPLWT("Receipts")
						APPEND TO ARRAY:C911($3->; $_t_TableNameContextual)
						APPEND TO ARRAY:C911($4->; Table:C252(->[INVOICES:39]))
						APPEND TO ARRAY:C911($5->; "View Receipts")
						$_t_TableNameContextual:=Term_SLPLWT("Deposits")
						APPEND TO ARRAY:C911($3->; $_t_TableNameContextual)
						APPEND TO ARRAY:C911($4->; Table:C252(->[INVOICES:39]))
						APPEND TO ARRAY:C911($5->; "View Deposits")
						
						
						
						$_t_TableNameContextual:=Term_SLPLWT("Credit Notes")
						APPEND TO ARRAY:C911($3->; $_t_TableNameContextual)
						APPEND TO ARRAY:C911($4->; Table:C252(->[INVOICES:39]))
						APPEND TO ARRAY:C911($5->; "View Credit Notes")
						
						$_t_TableNameContextual:=Term_SLPLWT("ProFormas")
						APPEND TO ARRAY:C911($3->; $_t_TableNameContextual)
						APPEND TO ARRAY:C911($4->; Table:C252(->[INVOICES:39]))
						APPEND TO ARRAY:C911($5->; "View Proformas")
						
					End if 
					DB_AddTab($3; $4; ->[INVOICES_ITEMS:161]; ->[COMPANIES:2]; ->[CONTACTS:1]; ->[ORDER_ITEMS:25]; ->[TRANSACTION_BATCHES:30]; ->[TRANSACTIONS:29])
					ARRAY TEXT:C222($5->; Size of array:C274($3->))
				End if 
		End case 
		Case of 
			: ($2="ViewCreditnotes") | ($2="View Credit notes")
				$_l_TablePosition:=Find in array:C230($4->; Table:C252(->[INVOICES:39]))
				If ($_l_TablePosition>0)
					$3->{$_l_TablePosition}:=Term_SLPLWT("Credit Notes")
					// ///////
					
					
					
					// ///////
					If (Not:C34(DB_bo_RootTabDefined))
						DB_t_ModifiedTabName:=$3->{$_l_TablePosition}
					End if 
					
					$_l_TablePosition:=Find in array:C230($4->; Table:C252(->[INVOICES_ITEMS:161]))
					If ($_l_TablePosition>0)
						$3->{$_l_TablePosition}:=Term_SLPLWT("Credit Note Items")
						
					End if 
				End if 
			: ($2="ViewReceipts") | ($2="View Receipts")
				$_l_TablePosition:=Find in array:C230($4->; Table:C252(->[INVOICES:39]))
				If ($_l_TablePosition>0)
					
					$3->{$_l_TablePosition}:=Term_SLPLWT("Receipts")
					If (Not:C34(DB_bo_RootTabDefined))
						DB_t_ModifiedTabName:=$3->{$_l_TablePosition}
						
					End if 
				End if 
			: ($2="ViewDeposits") | ($2="View Deposits")
				$_l_TablePosition:=Find in array:C230($4->; Table:C252(->[INVOICES:39]))
				If ($_l_TablePosition>0)
					$3->{$_l_TablePosition}:=Term_SLPLWT("Deposits")
					If (Not:C34(DB_bo_RootTabDefined))
						DB_t_ModifiedTabName:=$3->{$_l_TablePosition}
						
					End if 
				End if 
			: ($2="Proformas") | ($2="View Proformas")
				$_l_TablePosition:=Find in array:C230($4->; Table:C252(->[INVOICES:39]))
				If ($_l_TablePosition>0)
					$3->{$_l_TablePosition}:=Term_SLPLWT("ProFormas")
					If (Not:C34(DB_bo_RootTabDefined))
						DB_t_ModifiedTabName:=$3->{$_l_TablePosition}
					End if 
					
					$_l_TablePosition:=Find in array:C230($4->; Table:C252(->[INVOICES_ITEMS:161]))
					If ($_l_TablePosition>0)
						$3->{$_l_TablePosition}:=Term_SLPLWT("ProForma Items")
						
					End if 
				End if 
			Else 
				If ($2="")
					$_l_TablePosition:=Find in array:C230($4->; Table:C252(->[INVOICES:39]))
					If ($_l_TablePosition>0)
						$3->{$_l_TablePosition}:=Term_SLPLWT("All Sales")
						If (Not:C34(DB_bo_RootTabDefined))
							DB_t_ModifiedTabName:=$3->{$_l_TablePosition}
						End if 
						
						$_l_TablePosition:=Find in array:C230($4->; Table:C252(->[INVOICES_ITEMS:161]))
						If ($_l_TablePosition>0)
							$3->{$_l_TablePosition}:=Term_SLPLWT("Sales items")
						End if 
					End if 
				End if 
				
		End case 
		//invoice items
		
	: ($1=Table:C252(->[INVOICES_ALLOCATIONS:162]))
	: ($1=Table:C252(->[INVOICES_ITEMS:161]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)
		
		DB_AddTab($3; $4; ->[INVOICES_ITEMS:161]; ->[INVOICES:39]; ->[COMPANIES:2]; ->[CONTACTS:1]; ->[ORDER_ITEMS:25]; ->[TRANSACTION_BATCHES:30]; ->[TRANSACTIONS:29])
		
		
	: ($1=Table:C252(->[JOB PERSONNEL:48]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
		
		DB_AddTab($3; $4; ->[JOB PERSONNEL:48]; ->[JOBS:26]; ->[JOB_STAGES:47]; ->[CONTACTS:1]; ->[PERSONNEL:11])
		
		
		
		
		//Contacts
		
		
	: ($1=Table:C252(->[JOB_STAGES:47]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
		
		DB_AddTab($3; $4; ->[JOB_STAGES:47]; ->[JOBS:26]; ->[PROJECTS:89])
		//Jobs
		
	: ($1=Table:C252(->[JOB_TYPES:65]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)
		
		If ($_l_ModuleAccess=0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
			
		End if 
		DB_AddTab($3; $4; ->[JOB_TYPES:65]; ->[JOBS:26]; ->[ORDERS:24])
		
		
		//Jobs
	: ($1=Table:C252(->[JOBS:26]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
		
		DB_AddTab($3; $4; ->[JOBS:26]; ->[PROJECTS:89]; ->[COMPANIES:2]; ->[CONTACTS:1]; ->[ORDERS:24]; ->[ORDER_ITEMS:25]; ->[PURCHASE_ORDERS:57]; ->[INVOICES:39]; ->[TRANSACTION_BATCHES:30])
		//Projects
		//companies
		//contacts
		
		//sales orders and items
		//sales order items and orders
		//purchase orders and items
		
		//nominal ledger entries
		
	: ($1=Table:C252(->[LAYERS:76]))
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		DB_AddTab($3; $4; ->[LAYERS:76]; ->[ACCOUNTS:32]; ->[ACCOUNT_BALANCES:34]; ->[TRANSACTIONS:29]; ->[TRANSACTION_BATCHES:30]; ->[INVOICES:39]; ->[PURCHASE_INVOICES:37]; ->[ORDERS:24]; ->[PURCHASE_ORDERS:57])
		//Accounts
		//transacitons
		
		//companies(where posting is to layer)
		
	: ($1=Table:C252(->[LICENCE_UPDATES:97]))
	: ($1=Table:C252(->[LIST_LAYOUTS:96]))
		
	: ($1=Table:C252(->[LIST_ITEMS:95]))
		
	: ($1=Table:C252(->[LOCATIONS:61]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		
		DB_AddTab($3; $4; ->[LOCATIONS:61]; ->[CURRENT_STOCK:62]; ->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENT_ITEMS:27])
		
		
	: ($1=Table:C252(->[SCRIPTS:80]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Macros)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		
		
		DB_AddTab($3; $4; ->[SCRIPTS:80])
		
		
	: ($1=Table:C252(->[MAILSORT_A:77]))
	: ($1=Table:C252(->[MAILSORT_B:78]))
	: ($1=Table:C252(->[MAILSORT_C:79]))
	: ($1=Table:C252(->[MAILSORT_D5:81]))
	: ($1=Table:C252(->[MAILSORT_D6:82]))
	: ($1=Table:C252(->[MAILSORT_MAIL:83]))
		
	: ($1=Table:C252(->[MODULES:63]))
	: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		
		DB_AddTab($3; $4; ->[MOVEMENT_TYPES:60]; ->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENT_ITEMS:27])
		
		
		//Stock movements
		
		
		
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		//see earlier
	: ($1=Table:C252(->[ORDERS:24]))
		//order see earlier
	: ($1=Table:C252(->[PERIODS:33]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		
		DB_AddTab($3; $4; ->[PERIODS:33]; ->[ACCOUNT_BALANCES:34]; ->[TRANSACTIONS:29]; ->[TRANSACTION_BATCHES:30]; ->[INVOICES:39]; ->[PURCHASE_INVOICES:37]; ->[ORDERS:24]; ->[PURCHASE_ORDERS:57]; ->[STOCK_MOVEMENTS:40])
		
		
		//transactions
		
		
		//invoices
		
		//purchase invoices
		
		//orders
		
		//purchase orders
		
		//ztock movemvents
		
	: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		
		DB_AddTab($3; $4; ->[PERSONNEL_GROUPS:92]; ->[PERSONNEL:11])
		//personnel
		
	: ($1=Table:C252(->[PERSONNEL:11]))
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		
		DB_AddTab($3; $4; ->[PERSONNEL:11]; ->[PERSONNEL_GROUPS:92])
		
		
		//Personel groups
		
	: ($1=Table:C252(->[PERSONNEL_DIARY_ACCESS:149]))
		
	: ($1=Table:C252(->[PICTURES:85]))
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		DB_AddTab($3; $4; ->[PICTURES:85])
		
	: ($1=Table:C252(->[POSTAL_CODES:50]))
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		
		DB_AddTab($3; $4; ->[POSTAL_CODES:50])
	: ($1=Table:C252(->[PREFERENCES:116]))
	: ($1=Table:C252(->[PRICE_GROUPS:18]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PriceTable)
			
			If ($_l_ModuleAccess>0)
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
			End if 
		End if 
		
		DB_AddTab($3; $4; ->[PRICE_GROUPS:18]; ->[PRICE_TABLE:28]; ->[COMPANIES:2]; ->[PRODUCTS:9])  //price table
		
		//companies
		
		
		
	: ($1=Table:C252(->[PRICE_TABLE:28]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PriceTable)
			
		End if 
		DB_AddTab($3; $4; ->[PRICE_TABLE:28]; ->[COMPANIES:2]; ->[PRODUCTS:9])
		
		
		//products
		
		
	: ($1=Table:C252(->[PROBLEMS:22]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)
		
		
		DB_AddTab($3; $4; ->[PROBLEMS:22]; ->[SERVICE_CALLS:20])
		//service calls
		
	: ($1=Table:C252(->[PROCESSES_TO_HANDLE:115]))
	: ($1=Table:C252(->[PRODUCTS:9]))
		//see earlier
		
	: ($1=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
	: ($1=Table:C252(->[PROJECTS:89]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
		
		
		DB_AddTab($3; $4; ->[PROJECTS:89]; ->[JOBS:26]; ->[COMPANIES:2])
		
		//Jobs
		//companies
	: ($1=Table:C252(->[PUBLICATIONS:52]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		DB_AddTab($3; $4; ->[PUBLICATIONS:52])
		
		
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)
		
		
		DB_AddTab($3; $4; ->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS_ITEMS:169]; ->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENT_ITEMS:27]; ->[ORDERS:24]; ->[ORDER_ITEMS:25]; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICE_ITEMS:158])
		
		
		//purchase order items
		//stock movements
		//sales orders and items
		//purchase invoices and items
	: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)
		
		
		DB_AddTab($3; $4; ->[PURCHASE_ORDERS_ITEMS:169]; ->[PURCHASE_ORDERS:57]; ->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENT_ITEMS:27]; ->[ORDERS:24]; ->[ORDER_ITEMS:25]; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICE_ITEMS:158])
		
		
		//purchase orders
		//stock movements
		//sales orders and items
		//purchase invoices and items
		
	: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)
		
		
		DB_AddTab($3; $4; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICE_ITEMS:158]; ->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS_ITEMS:169]; ->[COMPANIES:2]; ->[TRANSACTION_BATCHES:30]; ->[TRANSACTIONS:29])
		//Purchase Invoice items
		//Purchase orders and items
		//companies
	: ($1=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
	: ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)
		
		
		DB_AddTab($3; $4; ->[PURCHASE_INVOICE_ITEMS:158]; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS_ITEMS:169]; ->[COMPANIES:2])
		
		
		//Purchase Invoices
		//Purchase orders and items
		//companies
		
	: ($1=Table:C252(->[QUALITY_GROUPS:56]))
	: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
		
		
		If (False:C215)  //dont think we can currently..need to store rec journal id on the trans in
			
			
			DB_AddTab($3; $4; ->[RECURRING_JOURNALS:38]; ->[TRANSACTION_BATCHES:30]; ->[TRANSACTIONS:29]; ->[TRANSACTION_BATCHES:30]; ->[ACCOUNTS:32])
			//transaction batches
		Else 
			DB_AddTab($3; $4; ->[RECURRING_JOURNALS:38])
		End if 
		//transactions
		//accounts
		
	: ($1=Table:C252(->[REC_JOURNALS_DATES:160]))
	: ($1=Table:C252(->[RESULTS:14]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[RESULTS:14]; ->[WORKFLOW_CONTROL:51]; ->[DIARY:12])
		
		//workflow
		//diary
	: ($1=Table:C252(->[ROLES:87]))
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		//contacts
		DB_AddTab($3; $4; ->[ROLES:87]; ->[CONTACTS:1])
		
	: ($1=Table:C252(->[SALES_PROJECTION:113]))
	: ($1=Table:C252(->[SALES_ProjectionLinks:114]))
	: ($1=Table:C252(->[SD_Settings:107]))
	: ($1=Table:C252(->[SERVICE_CALLS:20]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)
		
		
		DB_AddTab($3; $4; ->[SERVICE_CALLS:20]; ->[ORDERS:24]; ->[CONTRACTS:17]; ->[COMPANIES:2]; ->[CONTACTS:1]; ->[DIARY:12])
		//sales orders
		//companies
		//contacts
		//diary
	: ($1=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
	: ($1=Table:C252(->[SMS_Log:124]))
	: ($1=Table:C252(->[SOLUTIONS:23]))
		//service calls
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[SOLUTIONS:23]; ->[SERVICE_CALLS:20])
		
	: ($1=Table:C252(->[SOURCES:6]))
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		DB_AddTab($3; $4; ->[SOURCES:6]; ->[CONTACTS:1]; ->[COMPANIES:2]; ->[ORDERS:24])
		
		//contacts
		//companies
		//orders
	: ($1=Table:C252(->[STAGES:45]))
		//companies
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
		
		If ($_l_ModuleAccess=0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)
			
		End if 
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[STAGES:45]; ->[JOB_STAGES:47]; ->[JOBS:26]; ->[JOB PERSONNEL:48]; ->[DIARY:12]; ->[ORDERS:24]; ->[ORDER_ITEMS:25])
		
	: ($1=Table:C252(->[STATUS:4]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		DB_AddTab($3; $4; ->[STATUS:4])
		
	: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
		
		DB_AddTab($3; $4; ->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENTS:40]; ->[CURRENT_STOCK:62]; ->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS_ITEMS:169]; ->[ORDERS:24]; ->[ORDER_ITEMS:25])
		//current stock
		//purchase orders and items
		//sales orders and items
		
	: ($1=Table:C252(->[STOCK_LEVELS:58]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
		
		DB_AddTab($3; $4; ->[STOCK_LEVELS:58]; ->[CURRENT_STOCK:62])
		
		//current stock
		//stock movements
	: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
		
		
		DB_AddTab($3; $4; ->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENT_ITEMS:27]; ->[CURRENT_STOCK:62]; ->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS_ITEMS:169]; ->[ORDERS:24]; ->[ORDER_ITEMS:25])
		
		//stock items
		//current stock
		//purchase orders and items
		//sales orders and items
		
	: ($1=Table:C252(->[STOCK_TYPES:59]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		DB_AddTab($3; $4; ->[STOCK_TYPES:59]; ->[CURRENT_STOCK:62]; ->[STOCK_LEVELS:58])
		
		
	: ($1=Table:C252(->[Stock_Thread:143]))
	: ($1=Table:C252(->[SUBSCRIPTIONS:93]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Subscriptions)
		
		
		DB_AddTab($3; $4; ->[SUBSCRIPTIONS:93]; ->[PRODUCTS:9])
		
	: ($1=Table:C252(->[SYS_LISTS:167]))
	: ($1=Table:C252(->[TAX_CODES:35]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		
		DB_AddTab($3; $4; ->[TAX_CODES:35]; ->[AREAS:3]; ->[COUNTRIES:73])
		
		//areas
		//countries
	: ($1=Table:C252(->[TERMINOLOGY:75]))
		//TRACE
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		DB_AddTab($3; $4; ->[TERMINOLOGY:75])
		
	: ($1=Table:C252(->[TIME_BUDGETS:49]))
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
		
		DB_AddTab($3; $4; ->[TRANSACTION_BATCHES:30]; ->[ACCOUNTS:32]; ->[INVOICES:39]; ->[STOCK_MOVEMENTS:40]; ->[PURCHASE_INVOICES:37]; ->[TRANSACTIONS:29])
		
		
		
		//accounts
		//invoices
		//stock movements
		//purchase invoices
		//transacitons
	: ($1=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
	: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		
		DB_AddTab($3; $4; ->[TRANSACTION_TYPES:31]; ->[TRANSACTIONS:29]; ->[TRANSACTION_BATCHES:30]; ->[ACCOUNTS:32])
		
		
		//accounts
	: ($1=Table:C252(->[TRANS_MULTI:128]))
	: ($1=Table:C252(->[TRANSACTIONS:29]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
		
		
		DB_AddTab($3; $4; ->[TRANSACTIONS:29]; ->[ACCOUNTS:32]; ->[TRANSACTION_BATCHES:30])
		//accounts
		//transaction batches
	: ($1=Table:C252(->[TYPES:5]))  //
		
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		
		
		
		DB_AddTab($3; $4; ->[TYPES:5]; ->[COMPANIES:2]; ->[CONTACTS:1])  //companies
		
		//contacts
		//jobs
		//orders
		
	: ($1=Table:C252(->[USER_SETS:105]))
		//not shown
	: ($1=Table:C252(->[WEB_ACCESS:130]))
		
		//not shown
	: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		
		DB_AddTab($3; $4; ->[WORKFLOW_CONTROL:51]; ->[ACTIONS:13]; ->[RESULTS:14]; ->[WORKFLOW_Campaign:209])
		
	: ($1=Table:C252(->[WORKFLOW_Campaign:209]))
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		
		If ($_l_ModuleAccess>0)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		End if 
		
		DB_AddTab($3; $4; ->[WORKFLOW_Campaign:209]; ->[ACTIONS:13]; ->[RESULTS:14]; ->[WORKFLOW_CONTROL:51])
		
		
		
		//actions
		//results
End case 
DB_l_UserFormAccess:=$_l_ModuleAccess
ARRAY TEXT:C222($5->; Size of array:C274($3->))  //Note that this only needs to be set if you create a tab that is actually a context

$_l_TablePosition:=Find in array:C230($4->; $1)
If ($_l_TablePosition>0)
	$3->:=$_l_TablePosition
Else 
	$3->:=0
	
End if 
ERR_MethodTrackerReturn("DB_SetFormTabs"; $_t_oldMethodName)