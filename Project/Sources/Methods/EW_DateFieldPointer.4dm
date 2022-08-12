//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_DateFieldPointer
	//------------------ Method Notes ------------------
	// EW_DateFieldPointer
	// Returns a pointer to the field that contains the date and time
	// last modified data
	// Example: DateFldPtr:=EW_DateFieldpointer(TablePtr)
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 21:31:47If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_DateFieldPointer")


// parameters: $1=pointer to the table

Case of 
	: (Table:C252($1)=Table:C252(->[CONTACTS:1]))
		$0:=->[CONTACTS:1]Export:18
	: (Table:C252($1)=Table:C252(->[COMPANIES:2]))
		$0:=->[COMPANIES:2]Export:33
	: (Table:C252($1)=Table:C252(->[AREAS:3]))
		$0:=->[AREAS:3]Export:3
	: (Table:C252($1)=Table:C252(->[STATUS:4]))
		$0:=->[STATUS:4]Export:3
	: (Table:C252($1)=Table:C252(->[TYPES:5]))
		$0:=->[TYPES:5]Export:3
	: (Table:C252($1)=Table:C252(->[SOURCES:6]))
		$0:=->[SOURCES:6]Export:13
	: (Table:C252($1)=Table:C252(->[DOCUMENTS:7]))
		$0:=->[DOCUMENTS:7]Export:6
	: (Table:C252($1)=Table:C252(->[PRODUCT_BRANDS:8]))
		$0:=->[PRODUCT_BRANDS:8]Export:3
	: (Table:C252($1)=Table:C252(->[PRODUCTS:9]))
		$0:=->[PRODUCTS:9]Export:22
	: (Table:C252($1)=Table:C252(->[PRODUCT_GROUPS:10]))
		$0:=->[PRODUCT_GROUPS:10]Export:7
	: (Table:C252($1)=Table:C252(->[PERSONNEL:11]))
		//   $0:=->[PERSONNEL]Last Export  ` Is this right?
	: (Table:C252($1)=Table:C252(->[DIARY:12]))
		$0:=->[DIARY:12]Export:24
	: (Table:C252($1)=Table:C252(->[ACTIONS:13]))
		$0:=->[ACTIONS:13]Export:3
	: (Table:C252($1)=Table:C252(->[RESULTS:14]))
		$0:=->[RESULTS:14]Export:4
	: (Table:C252($1)=Table:C252(->[USER:15]))
		//    $0:=-> •[USER]Export•
	: (Table:C252($1)=Table:C252(->[IDENTIFIERS:16]))
		//   $0:=-> •[FILES]Export•
	: (Table:C252($1)=Table:C252(->[CONTRACTS:17]))
		//   $0:=-> •[CONTRACTS]Export•
	: (Table:C252($1)=Table:C252(->[PRICE_GROUPS:18]))
		$0:=->[PRICE_GROUPS:18]Export:7
	: (Table:C252($1)=Table:C252(->[CONTRACT_TYPES:19]))
		//    $0:=-> •[CONTRACT TYPES]Export•
	: (Table:C252($1)=Table:C252(->[SERVICE_CALLS:20]))
		//   $0:=-> •[SERVICE CALLS]Export•
	: (Table:C252($1)=Table:C252(->[PROBLEMS:22]))
		//    $0:=->[PROBLEMS]Export
	: (Table:C252($1)=Table:C252(->[SOLUTIONS:23]))
		//   $0:=-> •[SOLUTIONS]Export•
	: (Table:C252($1)=Table:C252(->[ORDERS:24]))
		$0:=->[ORDERS:24]Export:24
	: (Table:C252($1)=Table:C252(->[ORDER_ITEMS:25]))
		//    $0:=-> •[ORDER ITEMS]Export•
	: (Table:C252($1)=Table:C252(->[JOBS:26]))
		//    $0:=-> •[JOBS]Export•
	: (Table:C252($1)=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		//    $0:=-> •[STOCK ITEMS]Export•
	: (Table:C252($1)=Table:C252(->[PRICE_TABLE:28]))
		$0:=->[PRICE_TABLE:28]Export:11
	: (Table:C252($1)=Table:C252(->[TRANSACTIONS:29]))
		//    $0:=-> •[TRANSACTIONS]Export•
	: (Table:C252($1)=Table:C252(->[TRANSACTION_BATCHES:30]))
		//   $0:=-> •[TRANS IN]Export•
	: (Table:C252($1)=Table:C252(->[TRANSACTION_TYPES:31]))
		//    $0:=-> •[Trans_Types]Export•
	: (Table:C252($1)=Table:C252(->[ACCOUNTS:32]))
		//    $0:=-> •[ACCOUNTS]Export•
	: (Table:C252($1)=Table:C252(->[PERIODS:33]))
		//    $0:=-> •[PERIODS]Export•
	: (Table:C252($1)=Table:C252(->[ACCOUNT_BALANCES:34]))
		//    $0:=-> •[ACC BALANCES]Export•
	: (Table:C252($1)=Table:C252(->[TAX_CODES:35]))
		//    $0:=-> •[TAX CODES]Export•
	: (Table:C252($1)=Table:C252(->[ANALYSES:36]))
		//    $0:=-> •[ANALYSES]Export•
	: (Table:C252($1)=Table:C252(->[PURCHASE_INVOICES:37]))
		//    $0:=-> •[PURCHASES]Export•
	: (Table:C252($1)=Table:C252(->[RECURRING_JOURNALS:38]))
		//    $0:=-> •[REC JOURNALS]Export•
	: (Table:C252($1)=Table:C252(->[INVOICES:39]))
		//    $0:=-> •[INVOICES]Export•
	: (Table:C252($1)=Table:C252(->[STOCK_MOVEMENTS:40]))
		//   $0:=-> •[STOCK MOVEMENTS]Export•
	: (Table:C252($1)=Table:C252(->[STAGES:45]))
		//   $0:=-> •[STAGES]Export•
	: (Table:C252($1)=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		//   $0:=-> •[CATEGORIES]Export•
	: (Table:C252($1)=Table:C252(->[JOB_STAGES:47]))
		//   $0:=-> •[JOB STAGES]Export•
	: (Table:C252($1)=Table:C252(->[JOB PERSONNEL:48]))
		//  $0:=-> •[JOB PERSONNEL]Export•
	: (Table:C252($1)=Table:C252(->[TIME_BUDGETS:49]))
		//   $0:=-> •[TIME BUDGETS]Export•
	: (Table:C252($1)=Table:C252(->[POSTAL_CODES:50]))
		$0:=->[POSTAL_CODES:50]Export:3
	: (Table:C252($1)=Table:C252(->[WORKFLOW_CONTROL:51]))
		$0:=->[WORKFLOW_CONTROL:51]Export:9
	: (Table:C252($1)=Table:C252(->[PUBLICATIONS:52]))
		//   $0:=-> •[PUBLICATIONS]Export•
	: (Table:C252($1)=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		$0:=->[ADDITIONAL_RECORD_ANALYSIS:53]Export:3
	: (Table:C252($1)=Table:C252(->[CREDIT_STAGES:54]))
		//   $0:=-> •[CREDIT STAGES]Export•
	: (Table:C252($1)=Table:C252(->[INFORMATION:55]))
		//  $0:=-> •[INFORMATION]Export•
	: (Table:C252($1)=Table:C252(->[QUALITY_GROUPS:56]))
		//   $0:=-> •[QUALITY GROUPS]Export•
	: (Table:C252($1)=Table:C252(->[PURCHASE_ORDERS:57]))
		//  $0:=-> •[PURCHASE ORDERS]Export•
	: (Table:C252($1)=Table:C252(->[STOCK_LEVELS:58]))
		//   $0:=-> •[STOCK LEVELS]Export•
	: (Table:C252($1)=Table:C252(->[STOCK_TYPES:59]))
		//   $0:=-> •[STOCK TYPES]Export•
	: (Table:C252($1)=Table:C252(->[MOVEMENT_TYPES:60]))
		//  $0:=-> •[MOVEMENT TYPES]Export•
	: (Table:C252($1)=Table:C252(->[LOCATIONS:61]))
		//   $0:=-> •[LOCATIONS]Export•
	: (Table:C252($1)=Table:C252(->[CURRENT_STOCK:62]))
		//  $0:=-> •[CURRENT STOCK]Export•
	: (Table:C252($1)=Table:C252(->[MODULES:63]))
		//  $0:=-> •[MODULES]Export•
		
	: (Table:C252($1)=Table:C252(->[JOB_TYPES:65]))
		//   $0:=-> •[JOB TYPES]Export•
	: (Table:C252($1)=Table:C252(->[DELETIONS:66]))
		$0:=->[DELETIONS:66]Export:2
		
		
	: (Table:C252($1)=Table:C252(->[CURRENCIES:71]))
		//    $0:=-> •[CURRENCIES]Export•
	: (Table:C252($1)=Table:C252(->[CURRENCY_RATES:72]))
		//  $0:=-> •[CURRENCY RATES]Export•
	: (Table:C252($1)=Table:C252(->[COUNTRIES:73]))
		$0:=->[COUNTRIES:73]Export:3
	: (Table:C252($1)=Table:C252(->[ADDRESS_FORMATS:74]))
		$0:=->[ADDRESS_FORMATS:74]Export:10
	: (Table:C252($1)=Table:C252(->[TERMINOLOGY:75]))
		//  $0:=-> •[TERMINOLOGY]Export•
	: (Table:C252($1)=Table:C252(->[LAYERS:76]))
		//   $0:=-> •[LAYERS]Export•
	: (Table:C252($1)=Table:C252(->[MAILSORT_A:77]))
		//    $0:=-> •[MAILSORT A]Export•
	: (Table:C252($1)=Table:C252(->[MAILSORT_B:78]))
		//   $0:=-> •[MAILSORT B]Export•
	: (Table:C252($1)=Table:C252(->[MAILSORT_C:79]))
		// $0:=-> •[MAILSORT C]Export•
	: (Table:C252($1)=Table:C252(->[SCRIPTS:80]))
		//   $0:=-> •[MACROS]Export•
	: (Table:C252($1)=Table:C252(->[MAILSORT_D5:81]))
		//    $0:=-> •[MAILSORT D5]Export•
	: (Table:C252($1)=Table:C252(->[MAILSORT_D6:82]))
		//   $0:=-> •[MAILSORT D6]Export•
	: (Table:C252($1)=Table:C252(->[MAILSORT_MAIL:83]))
		//   $0:=-> •[MAILSORT MAIL]Export•
	: (Table:C252($1)=Table:C252(->[HEADINGS:84]))
		//  $0:=-> •[HEADINGS]Export•
	: (Table:C252($1)=Table:C252(->[PICTURES:85]))
		//   $0:=-> •[PICTURES]Export•
	: (Table:C252($1)=Table:C252(->[COMPONENTS:86]))
		//   $0:=-> •[COMPONENTS]Export•
	: (Table:C252($1)=Table:C252(->[ROLES:87]))
		//   $0:=-> •[ROLES]Export•
	: (Table:C252($1)=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
		//  $0:=-> •[FURTHER CODES]Export•
	: (Table:C252($1)=Table:C252(->[PROJECTS:89]))
		//   $0:=-> •[PROJECTS]Export•
	: (Table:C252($1)=Table:C252(->[TABLE_RECORD_STATES:90]))
		//  $0:=-> •[FILE STATES]Export•
	: (Table:C252($1)=Table:C252(->[CODE_USES:91]))
		//   $0:=-> •[CODE USES]Export•
	: (Table:C252($1)=Table:C252(->[PERSONNEL_GROUPS:92]))
		//   $0:=-> •[PERSON GROUPS]Export•
	: (Table:C252($1)=Table:C252(->[SUBSCRIPTIONS:93]))
		//    $0:=-> •[SUBSCRIPTIONS]Export•
	: (Table:C252($1)=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
		//  $0:=-> •[FILES NOS]Export•
	: (Table:C252($1)=Table:C252(->[LIST_ITEMS:95]))
		//   $0:=-> •[LIST_ITEMS]Export•
	: (Table:C252($1)=Table:C252(->[LIST_LAYOUTS:96]))
		// $0:=-> •[LIST LAYOUTS]Export•
	: (Table:C252($1)=Table:C252(->[LICENCE_UPDATES:97]))
		//    $0:=-> •[LICENCE UPDATES]Export•
	: (Table:C252($1)=Table:C252(->[CUSTOM_FIELDS:98]))
		//    $0:=-> •[FURTHER FIELDS]Export•
	: (Table:C252($1)=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		//    $0:=-> •[FIELD DEFS]Export•
	: (Table:C252($1)=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
		//   $0:=-> •[FIELD DEF PERS]Export•
	: (Table:C252($1)=Table:C252(->[X_URL_LInks:101]))
		//  $0:=-> •[CARD RANGES]Export•
	: (Table:C252($1)=Table:C252(->[DATA_AUDITS:102]))
		//    $0:=-> •[DATA_AUDITS]Export•
	: (Table:C252($1)=Table:C252(->[EMAIL_ATTACHMENTS:103]))
		//   $0:=-> •[EMAIL_ATTACHMENTS]Export•
	: (Table:C252($1)=Table:C252(->[EMAIL_RECIPIENTS:104]))
		//    $0:=-> •[EMAIL_RECIPIENTS]Export•
	: (Table:C252($1)=Table:C252(->[USER_SETS:105]))
		//   $0:=-> •[USER_SETS]Export•
	: (Table:C252($1)=Table:C252(->[DIARY_ITEMOWNERS:106]))
		//  $0:=-> •[DIARY_ITEMOWNERS]Export•
	: (Table:C252($1)=Table:C252(->[SD_Settings:107]))
		//   $0:=-> •[SD_Settings]Export•
	: (Table:C252($1)=Table:C252(->[CATALOGUE:108]))
		//  $0:=-> •[Catalogue]Export•
	: (Table:C252($1)=Table:C252(->[Catalogue_ProductLink:109]))
		//   $0:=-> •[Catalogue_ProductLink]Export•
	: (Table:C252($1)=Table:C252(->[Catalogue_Availability:110]))
		//  $0:=-> •[Catalogue_Availability]Export•
	: (Table:C252($1)=Table:C252(->[X_LISTS:111]))
		//  $0:=-> •[x_Lists]Export•
	: (Table:C252($1)=Table:C252(->[x_ListUsage:112]))
		//   $0:=-> •[x_ListUsage]Export•
	: (Table:C252($1)=Table:C252(->[SALES_PROJECTION:113]))
		//    $0:=-> •[SALES_PROJECTION]Export•
	: (Table:C252($1)=Table:C252(->[SALES_ProjectionLinks:114]))
		//    $0:=-> •[SALES_ProjectionLinks]Export•
	: (Table:C252($1)=Table:C252(->[PROCESSES_TO_HANDLE:115]))
		//   $0:=-> •[ProcessesToHandle]Export•
	: (Table:C252($1)=Table:C252(->[PREFERENCES:116]))
		// $0:=-> •[Preferences]Export•
	: (Table:C252($1)=Table:C252(->[EW_ExportProjects:117]))
		// $0:=-> •[EW_ExportProjects]Export•
	: (Table:C252($1)=Table:C252(->[EW_ExportSteps:118]))
		//  $0:=-> •[EW_ExportSteps]Export•
	: (Table:C252($1)=Table:C252(->[EW_StepActions:119]))
		//  $0:=-> •[EW_StepActions]Export•
	: (Table:C252($1)=Table:C252(->[EW_ExportTables:120]))
		//   $0:=-> •[EW_ExportTables]Export•
	: (Table:C252($1)=Table:C252(->[EW_BK_FieldMap:121]DayBookTableNumber:1))
		//  $0:=-> •[EW_BK_FieldMap]Export•
	: (Table:C252($1)=Table:C252(->[EW_BKFields:122]))
		//  $0:=-> •[EW_BKFields]Export•
		
	Else 
		
End case 
ERR_MethodTrackerReturn("EW_DateFieldPointer"; $_t_oldMethodName)