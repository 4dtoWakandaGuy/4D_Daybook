//%attributes = {}
If (False:C215)
	//Project Method Name:      LAY_SetKeyField
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    16/11/2010 20:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Nul)
	C_POINTER:C301($_Ptr_KeyField; $0)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LAY_SetKeyField")
$_l_Nul:=0
$0:=->$_l_Nul
Case of 
	: ($1=Table:C252(->[AREAS:3]))
		$_Ptr_KeyField:=->[AREAS:3]Area_Code:1
	: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
		$_Ptr_KeyField:=->[ACCOUNT_BALANCES:34]x_ID:7
	: ($1=Table:C252(->[ACCOUNTS:32]))
		$_Ptr_KeyField:=->[ACCOUNTS:32]Account_Code:2
	: ($1=Table:C252(->[ACTIONS:13]))
		$_Ptr_KeyField:=->[ACTIONS:13]Action_Code:1
	: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
		$_Ptr_KeyField:=->[ADDRESS_FORMATS:74]Format_Code:1
	: ($1=Table:C252(->[ANALYSES:36]))
		$_Ptr_KeyField:=->[ANALYSES:36]Analysis_Code:1
	: ($1=Table:C252(->[AREAS:3]))
		$_Ptr_KeyField:=->[AREAS:3]Area_Code:1
	: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
		$_Ptr_KeyField:=->[PRODUCT_BRANDS:8]Brand_Code:1
	: ($1=Table:C252(->[CATALOGUE:108]))
		$_Ptr_KeyField:=->[CATALOGUE:108]x_ID:1
	: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		$_Ptr_KeyField:=->[TIME_BILLING_CATEGORIES:46]Category_Code:1
	: ($1=Table:C252(->[COMPANIES:2]))
		$_Ptr_KeyField:=->[COMPANIES:2]Company_Code:1
	: ($1=Table:C252(->[COMPONENTS:86]))
		$_Ptr_KeyField:=->[COMPONENTS:86]Component_Code:2
	: ($1=Table:C252(->[CONTACTS:1]))
		$_Ptr_KeyField:=->[CONTACTS:1]Contact_Code:2
	: ($1=Table:C252(->[CONTRACT_TYPES:19]))
		$_Ptr_KeyField:=->[CONTRACT_TYPES:19]Contract_Type_Code:1
	: ($1=Table:C252(->[CONTRACTS:17]Contract_Code:3))
		$_Ptr_KeyField:=->[CONTRACTS:17]Contract_Code:3
	: ($1=Table:C252(->[COUNTRIES:73]))
		$_Ptr_KeyField:=->[COUNTRIES:73]COUNTRY_CODE:1
	: ($1=Table:C252(->[CREDIT_STAGES:54]))
		$_Ptr_KeyField:=->[CREDIT_STAGES:54]Stage_Code:1
	: ($1=Table:C252(->[CURRENCIES:71]))
		$_Ptr_KeyField:=->[CURRENCIES:71]Currency_Code:1
	: ($1=Table:C252(->[CURRENCY_RATES:72]))
		$_Ptr_KeyField:=->[CURRENCY_RATES:72]X_ID:6
	: ($1=Table:C252(->[CURRENT_STOCK:62]))
		$_Ptr_KeyField:=->[CURRENT_STOCK:62]X_ID:13
	: ($1=Table:C252(->[DIARY:12]))
		$_Ptr_KeyField:=->[DIARY:12]Diary_Code:3
	: ($1=Table:C252(->[DOCUMENTS:7]))
		$_Ptr_KeyField:=->[DOCUMENTS:7]Document_Code:1
	: ($1=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
		$_Ptr_KeyField:=->[CUSTOM_FIELDS_PERSONNEL:100]FD_Code:2
	: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		$_Ptr_KeyField:=->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1
	: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
		$_Ptr_KeyField:=->[CUSTOM_FIELDS:98]Unique_Code:2
	: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		$_Ptr_KeyField:=->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1
		
		
	: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
		$_Ptr_KeyField:=->[PRODUCT_GROUPS:10]Group_Code:1
	: ($1=Table:C252(->[HEADINGS:84]))
		$_Ptr_KeyField:=->[HEADINGS:84]Heading_Code:1
	: ($1=Table:C252(->[INVOICES:39]))
		$_Ptr_KeyField:=->[INVOICES:39]Invoice_Number:1
	: ($1=Table:C252(->[INVOICES_ITEMS:161]))
		$_Ptr_KeyField:=->[INVOICES_ITEMS:161]ID:17
	: ($1=Table:C252(->[JOB PERSONNEL:48]))
		$_Ptr_KeyField:=->[JOB PERSONNEL:48]Job_Personnel_Code:18
	: ($1=Table:C252(->[JOB_STAGES:47]))
		$_Ptr_KeyField:=->[JOB_STAGES:47]Job_Stage_code:52
	: ($1=Table:C252(->[JOB_TYPES:65]))
		$_Ptr_KeyField:=->[JOB_TYPES:65]Type_Code:1
	: ($1=Table:C252(->[JOBS:26]))
		$_Ptr_KeyField:=->[JOBS:26]Job_Code:1
	: ($1=Table:C252(->[LAYERS:76]))
		$_Ptr_KeyField:=->[LAYERS:76]Layer_Code:1
	: ($1=Table:C252(->[LOCATIONS:61]))
		$_Ptr_KeyField:=->[LOCATIONS:61]Location_Code:1
	: ($1=Table:C252(->[SCRIPTS:80]))
		$_Ptr_KeyField:=->[SCRIPTS:80]Script_Code:1
	: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
		$_Ptr_KeyField:=->[MOVEMENT_TYPES:60]Type_Code:1
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		$_Ptr_KeyField:=->[ORDER_ITEMS:25]Item_Number:27
	: ($1=Table:C252(->[ORDERS:24]))
		$_Ptr_KeyField:=->[ORDERS:24]Order_Code:3
		
	: ($1=Table:C252(->[PERIODS:33]))
		$_Ptr_KeyField:=->[PERIODS:33]Period_Code:1
	: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
		$_Ptr_KeyField:=->[PERSONNEL_GROUPS:92]Group_Code:1
	: ($1=Table:C252(->[PERSONNEL:11]))
		$_Ptr_KeyField:=->[PERSONNEL:11]Initials:1
	: ($1=Table:C252(->[PICTURES:85]))
		$_Ptr_KeyField:=->[PICTURES:85]Picture_Code:1
	: ($1=Table:C252(->[POSTAL_CODES:50]))
		$_Ptr_KeyField:=->[POSTAL_CODES:50]xRec_ID:5
	: ($1=Table:C252(->[PRICE_GROUPS:18]))
		$_Ptr_KeyField:=->[PRICE_GROUPS:18]Price_Code:1
	: ($1=Table:C252(->[PRICE_TABLE:28]))
		$_Ptr_KeyField:=->[PRICE_TABLE:28]Price_Code:2
	: ($1=Table:C252(->[PROBLEMS:22]))
		$_Ptr_KeyField:=->[PROBLEMS:22]Problem_Code:1
	: ($1=Table:C252(->[PRODUCTS:9]))
		$_Ptr_KeyField:=->[PRODUCTS:9]Product_Code:1
	: ($1=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
		$_Ptr_KeyField:=->[PRODUCTS_SUPPLIERS:148]Product_Code:8
	: ($1=Table:C252(->[PROJECTS:89]))
		$_Ptr_KeyField:=->[PROJECTS:89]Project_Code:1
	: ($1=Table:C252(->[PUBLICATIONS:52]))
		$_Ptr_KeyField:=->[PUBLICATIONS:52]Publication_Code:1
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
		$_Ptr_KeyField:=->[PURCHASE_ORDERS:57]Purchase_Order_Number:2
	: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		$_Ptr_KeyField:=->[PURCHASE_ORDERS_ITEMS:169]ID:17
	: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
		$_Ptr_KeyField:=->[PURCHASE_INVOICES:37]Purchase_Code:1
	: ($1=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
		$_Ptr_KeyField:=->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5
	: ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
		$_Ptr_KeyField:=->[PURCHASE_INVOICE_ITEMS:158]ID:16
	: ($1=Table:C252(->[QUALITY_GROUPS:56]))
		$_Ptr_KeyField:=->[QUALITY_GROUPS:56]x_ID:3
	: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
		$_Ptr_KeyField:=->[RECURRING_JOURNALS:38]x_ID:15
	: ($1=Table:C252(->[REC_JOURNALS_DATES:160]))
		$_Ptr_KeyField:=->[REC_JOURNALS_DATES:160]ID:3
	: ($1=Table:C252(->[RESULTS:14]))
		$_Ptr_KeyField:=->[RESULTS:14]Result_Code:1
	: ($1=Table:C252(->[ROLES:87]))
		$_Ptr_KeyField:=->[ROLES:87]Role_Code:1
	: ($1=Table:C252(->[SALES_PROJECTION:113]))
		$_Ptr_KeyField:=->[SALES_PROJECTION:113]x_ID:1
	: ($1=Table:C252(->[SERVICE_CALLS:20]))
		$_Ptr_KeyField:=->[SERVICE_CALLS:20]Call_Code:4
		
	: ($1=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
		$_Ptr_KeyField:=->[SERVICE_CALLS_PRODUCTS:152]ID:7
	: ($1=Table:C252(->[SOLUTIONS:23]))
		$_Ptr_KeyField:=->[SOLUTIONS:23]Solution_Code:1
	: ($1=Table:C252(->[SOURCES:6]))
		$_Ptr_KeyField:=->[SOURCES:6]Source_Code:1
	: ($1=Table:C252(->[STAGES:45]))
		$_Ptr_KeyField:=->[STAGES:45]Stage_Code:1
	: ($1=Table:C252(->[STATUS:4]))
		$_Ptr_KeyField:=->[STATUS:4]Status_Code:1
	: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		$_Ptr_KeyField:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
	: ($1=Table:C252(->[STOCK_LEVELS:58]))
		$_Ptr_KeyField:=->[STOCK_LEVELS:58]X_ID:10
	: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
		$_Ptr_KeyField:=->[STOCK_MOVEMENTS:40]Movement_Code:1
	: ($1=Table:C252(->[STOCK_TYPES:59]))
		$_Ptr_KeyField:=->[STOCK_TYPES:59]Type_Code:1
	: ($1=Table:C252(->[SUBSCRIPTIONS:93]))
		$_Ptr_KeyField:=->[SUBSCRIPTIONS:93]x_ID:11
	: ($1=Table:C252(->[TAX_CODES:35]))
		$_Ptr_KeyField:=->[TAX_CODES:35]Tax_Code:1
		
	: ($1=Table:C252(->[TERMINOLOGY:75]))
		$_Ptr_KeyField:=->[TERMINOLOGY:75]Terminology_Code:1
	: ($1=Table:C252(->[TIME_BUDGETS:49]))
		$_Ptr_KeyField:=->[TIME_BUDGETS:49]X_ID:7
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
		$_Ptr_KeyField:=->[TRANSACTION_BATCHES:30]Batch_Number:10
	: ($1=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
		$_Ptr_KeyField:=->[TRANSACTION_BATCH_ITEMS:155]ID:30
	: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
		$_Ptr_KeyField:=->[TRANSACTION_TYPES:31]Transaction_Type_Code:1
	: ($1=Table:C252(->[TRANSACTIONS:29]))
		$_Ptr_KeyField:=->[TRANSACTIONS:29]Transaction_Type_Code:1
		
	: ($1=Table:C252(->[TYPES:5]))
		$_Ptr_KeyField:=->[TYPES:5]Type_Code:1
	: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
		$_Ptr_KeyField:=->[WORKFLOW_CONTROL:51]WFControl_Code:10
End case 
$0:=$_Ptr_KeyField
ERR_MethodTrackerReturn("LAY_SetKeyField"; $_t_oldMethodName)