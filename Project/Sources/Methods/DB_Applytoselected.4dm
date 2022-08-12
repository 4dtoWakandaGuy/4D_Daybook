//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Applytoselected
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     15/05/2010 19:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_TableNumber; DB_l_CurrentDisplayedForm; DB_l_UserFormAccess)
	C_POINTER:C301($_ptr_Table; $IDPointer)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Applytoselected")
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
$_l_TableNumber:=Num:C11($_t_MenuItemParameter)
$_bo_Continue:=False:C215
If ($_l_TableNumber>0)
	$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
	CREATE SET:C116($_ptr_Table->; "$temp")
	If (Records in set:C195("ListboxSet0")>0)
		USE SET:C118("ListboxSet0")
	End if 
	
	Case of 
		: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			
			$IDPointer:=->[COMPANIES:2]Company_Code:1
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
			$_bo_Continue:=False:C215
		: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
			$_bo_Continue:=True:C214
			$IDPointer:=->[ACCOUNTS:32]Account_Code:2
		: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
			$_bo_Continue:=True:C214
			$IDPointer:=->[DOCUMENTS:7]Document_Code:1
			
			
		: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
			$IDPointer:=->[CONTACTS:1]Contact_Code:2
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
			$IDPointer:=->[PRODUCTS:9]Product_Code:1
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			$IDPointer:=->[ORDERS:24]Order_Code:3
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
			$IDPointer:=->[ORDERS:24]Order_Code:3
			$_bo_Continue:=True:C214
			
			
			
		: ($_l_TableNumber=Table:C252(->[ACCOUNTS_ANALYSES:157]))
			
			
			
		: ($_l_TableNumber=Table:C252(->[ACCOUNTS_LAYERS:156]))
			
		: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
			$IDPointer:=->[ACTIONS:13]Action_Code:1
			$_bo_Continue:=True:C214
			
			
		: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
			$IDPointer:=->[ADDRESS_FORMATS:74]Format_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
			$IDPointer:=->[ANALYSES:36]Analysis_Code:1
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[AREAS:3]))
			$IDPointer:=->[AREAS:3]Area_Code:1
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
			$IDPointer:=->[PRODUCT_BRANDS:8]Brand_Code:1
			$_bo_Continue:=True:C214
			
			
		: ($_l_TableNumber=Table:C252(->[X_URL_LInks:101]))
			//dont show this table
		: ($_l_TableNumber=Table:C252(->[CATALOGUE:108]))
			$IDPointer:=->[CATALOGUE:108]x_ID:1
			$_bo_Continue:=True:C214
			
			
			
			
		: ($_l_TableNumber=Table:C252(->[Catalogue_Availability:110]))
			
			
		: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
			$IDPointer:=->[TIME_BILLING_CATEGORIES:46]Category_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[CC_OrderAuths:133]))
		: ($_l_TableNumber=Table:C252(->[CCM_PSPTransaction:136]))
		: ($_l_TableNumber=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
		: ($_l_TableNumber=Table:C252(->[CODE_USES:91]))
		: ($_l_TableNumber=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
			
		: ($_l_TableNumber=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
			
		: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
			$IDPointer:=->[CONTRACT_TYPES:19]Contract_Type_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
			$IDPointer:=->[CONTRACTS:17]Contract_Code:3
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[CONTRACTS_CONTACTS:151]))
			
		: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
			$IDPointer:=->[COUNTRIES:73]COUNTRY_CODE:1
			$_bo_Continue:=True:C214
			//address formats
		: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
			$IDPointer:=->[CREDIT_STAGES:54]Stage_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
			$IDPointer:=->[CURRENCIES:71]Currency_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
			
			$_bo_Continue:=False:C215
		: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
			$IDPointer:=->[CURRENT_STOCK:62]X_ID:13
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
			
		: ($_l_TableNumber=Table:C252(->[DELETIONS:66]))
		: ($_l_TableNumber=Table:C252(->[DIARY:12]))
			$IDPointer:=->[DIARY:12]Diary_Code:3
			$_bo_Continue:=True:C214
			
			
		: ($_l_TableNumber=Table:C252(->[DIARY_ITEMOWNERS:106]))
		: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
			$IDPointer:=->[DOCUMENTS:7]Document_Code:1
			$_bo_Continue:=True:C214
			
			//several types of doc window
			//if we are viewing the context of templates then this should allow naviagation to the letters-this usage of the template
			//if it is a letter view then we can nav to related companies/contacts etc because that is really the diary.
			
			//
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
			
			$IDPointer:=->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
		: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
		: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
		: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
		: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
		: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
			
			$IDPointer:=->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1
			$_bo_Continue:=True:C214
			
			
		: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
			$IDPointer:=->[HEADINGS:84]Heading_Code:1
			$_bo_Continue:=True:C214
			
			
		: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
		: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
			$IDPointer:=->[INVOICES:39]Invoice_Number:1
			$_bo_Continue:=True:C214
			//invoice items
			
		: ($_l_TableNumber=Table:C252(->[INVOICES_ALLOCATIONS:162]))
		: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
			$IDPointer:=->[INVOICES_ITEMS:161]ID:17
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
			$IDPointer:=->[JOB PERSONNEL:48]Job_Personnel_Code:18
			$_bo_Continue:=True:C214
			
			
			//Contacts
			
			
		: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
			$IDPointer:=->[JOB_STAGES:47]Job_Stage_code:52
			$_bo_Continue:=True:C214
			
			
		: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
			$IDPointer:=->[JOB_TYPES:65]Type_Code:1
			$_bo_Continue:=True:C214
			
			
			//Jobs
		: ($_l_TableNumber=Table:C252(->[JOBS:26]))
			$IDPointer:=->[JOBS:26]Job_Code:1
			$_bo_Continue:=True:C214
			
			
		: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
			$IDPointer:=->[LAYERS:76]Layer_Code:1
			$_bo_Continue:=True:C214
			
			
		: ($_l_TableNumber=Table:C252(->[LICENCE_UPDATES:97]))
		: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
			
		: ($_l_TableNumber=Table:C252(->[LIST_ITEMS:95]))
			
		: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
			$IDPointer:=->[LOCATIONS:61]Location_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
			$IDPointer:=->[SCRIPTS:80]Script_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[MAILSORT_A:77]))
		: ($_l_TableNumber=Table:C252(->[MAILSORT_B:78]))
		: ($_l_TableNumber=Table:C252(->[MAILSORT_C:79]))
		: ($_l_TableNumber=Table:C252(->[MAILSORT_D5:81]))
		: ($_l_TableNumber=Table:C252(->[MAILSORT_D6:82]))
		: ($_l_TableNumber=Table:C252(->[MAILSORT_MAIL:83]))
			
		: ($_l_TableNumber=Table:C252(->[MODULES:63]))
		: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
			$IDPointer:=->[MOVEMENT_TYPES:60]Type_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
			//see earlier
		: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			//order see earlier
		: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
			$IDPointer:=->[PERIODS:33]Period_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
			
			$IDPointer:=->[PERSONNEL_GROUPS:92]Group_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
			
			$IDPointer:=->[PERSONNEL:11]Initials:1
			$_bo_Continue:=True:C214
			
			//Personel groups
			
		: ($_l_TableNumber=Table:C252(->[PERSONNEL_DIARY_ACCESS:149]))
			
		: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
			$IDPointer:=->[PICTURES:85]Picture_Code:1
			$_bo_Continue:=True:C214
			
			
		: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
			
			$IDPointer:=->[POSTAL_CODES:50]xRec_ID:5
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[PREFERENCES:116]))
		: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
			$IDPointer:=->[PRICE_GROUPS:18]Price_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
			$IDPointer:=->[PRICE_TABLE:28]Table_Code:12
			$_bo_Continue:=True:C214
			//products
			
			
		: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
			$IDPointer:=->[PROBLEMS:22]Problem_Code:1
			$_bo_Continue:=True:C214
			//service calls
			
		: ($_l_TableNumber=Table:C252(->[PROCESSES_TO_HANDLE:115]))
		: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
			//see earlier
			
		: ($_l_TableNumber=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
		: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
			$IDPointer:=->[PROJECTS:89]Project_Code:1
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
			$IDPointer:=->[PUBLICATIONS:52]Publication_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
			$IDPointer:=->[PURCHASE_ORDERS:57]Purchase_Order_Number:2
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
			$IDPointer:=->[PURCHASE_ORDERS_ITEMS:169]POitemID:16
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
			$IDPointer:=->[PURCHASE_INVOICES:37]Purchase_Code:1
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
		: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
			$IDPointer:=->[PURCHASE_INVOICE_ITEMS:158]ID:16
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[QUALITY_GROUPS:56]))
		: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
			$IDPointer:=->[RECURRING_JOURNALS:38]x_ID:15
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[REC_JOURNALS_DATES:160]))
		: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
			$IDPointer:=->[RESULTS:14]Result_Code:1
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[ROLES:87]))
			$IDPointer:=->[ROLES:87]Role_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
		: ($_l_TableNumber=Table:C252(->[SALES_ProjectionLinks:114]))
		: ($_l_TableNumber=Table:C252(->[SD_Settings:107]))
		: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
			$IDPointer:=->[SERVICE_CALLS:20]Call_Code:4
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
		: ($_l_TableNumber=Table:C252(->[SMS_Log:124]))
		: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
			$IDPointer:=->[SOLUTIONS:23]Solution_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
			$IDPointer:=->[SOURCES:6]Source_Code:1
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[STAGES:45]))
			$IDPointer:=->[STAGES:45]Stage_Code:1
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[STATUS:4]))
			$IDPointer:=->[STATUS:4]Status_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			$IDPointer:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
			$IDPointer:=->[STOCK_LEVELS:58]X_ID:10
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
			$IDPointer:=->[STOCK_MOVEMENTS:40]Movement_Code:1
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
			$IDPointer:=->[STOCK_TYPES:59]Type_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[Stock_Thread:143]))
		: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
			$IDPointer:=->[SUBSCRIPTIONS:93]x_ID:11
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[SYS_LISTS:167]))
		: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
			$IDPointer:=->[TAX_CODES:35]Tax_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
			
			$IDPointer:=->[TERMINOLOGY:75]Terminology_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
		: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
			$IDPointer:=->[TRANSACTION_BATCHES:30]Batch_Number:10
			$_bo_Continue:=True:C214
		: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
		: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
			$IDPointer:=->[TRANSACTION_TYPES:31]Transaction_Type_Code:1
			$_bo_Continue:=True:C214
			//accounts
		: ($_l_TableNumber=Table:C252(->[TRANS_MULTI:128]))
		: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
			
			$_bo_Continue:=False:C215
			//accounts
			//transaction batches
		: ($_l_TableNumber=Table:C252(->[TYPES:5]))  //
			$IDPointer:=->[TYPES:5]Type_Code:1
			$_bo_Continue:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[USER_SETS:105]))
			//not shown
		: ($_l_TableNumber=Table:C252(->[WEB_ACCESS:130]))
			
			//not shown
		: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
			$IDPointer:=->[WORKFLOW_CONTROL:51]WFControl_Code:10
			$_bo_Continue:=True:C214
	End case 
	If ($_bo_Continue)
		Gen_ListApply($_l_TableNumber; $IDPointer; DB_l_UserFormAccess)
	End if 
	USE SET:C118("$Temp")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
	DB_SetFormMenuoptions
	
	
End if 
ERR_MethodTrackerReturn("DB_Applytoselected"; $_t_oldMethodName)