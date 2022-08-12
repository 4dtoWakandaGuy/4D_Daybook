//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetKeyField
	//------------------ Method Notes ------------------
	//This method will return a POINTER to the key field in the table.
	//Note that all new tables starting SF_ the key field is the First_Field in the table
	//------------------ Revision Control ----------------
	//Date Created: 27/11/2009 09:06`Method: DB_GetKeyField
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301($_ptr_Field; $_ptr_NulValue; $0; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName; DB_t_NulString)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetKeyField")

DB_t_NulString:=""
$_ptr_NulValue:=->DB_t_NulString
//This method is called by DB_Datachecker
//this will check for pseudo unique
//put in here any fields we want to treat as unique
//without setting the field parameter


$_l_TableNumber:=Table:C252($1)
If (Count parameters:C259>=1)
	$_t_TableName:=Table name:C256($1)
	
	Case of 
		: (Substring:C12($_t_TableName; 1; 4)="SYS_")
			$0:=$_ptr_NulValue
		: (Substring:C12($_t_TableName; 1; 3)="SF_")
			$_l_TableNumber:=$_l_TableNumber
			$_ptr_Field:=Field:C253($_l_TableNumber; 1)
			$0:=$_ptr_Field
		: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
			$0:=->[ACCOUNT_BALANCES:34]x_ID:7
		: ($_l_TableNumber=Table:C252(->[ACCOUNTS_ANALYSES:157]))
			$0:=->[ACCOUNTS_ANALYSES:157]ID:2
		: ($_l_TableNumber=Table:C252(->[ACCOUNTS_LAYERS:156]))
			$0:=->[ACCOUNTS_LAYERS:156]ID:2
		: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
			$0:=->[ACCOUNTS:32]Account_Code:2
		: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
			$0:=->[ACTIONS:13]Action_Code:1
		: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
			$0:=->[ADDRESS_FORMATS:74]Format_Code:1
		: ($_l_TableNumber=Table:C252(->[AddressRecords:125]))
			$0:=->[AddressRecords:125]X_ID:1
		: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
			$0:=->[ANALYSES:36]Analysis_Code:1
		: ($_l_TableNumber=Table:C252(->[AREAS:3]))
			$0:=->[AREAS:3]Area_Code:1
		: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
			$0:=->[PRODUCT_BRANDS:8]Brand_Code:1
		: ($_l_TableNumber=Table:C252(->[X_URL_LInks:101]))
			$0:=->[X_URL_LInks:101]Parent_Context:1
		: ($_l_TableNumber=Table:C252(->[Catalogue_Availability:110]))
			$0:=->[Catalogue_Availability:110]x_ID:1
		: ($_l_TableNumber=Table:C252(->[Catalogue_ProductLink:109]))
			$0:=->[Catalogue_ProductLink:109]x_ID:1
		: ($_l_TableNumber=Table:C252(->[CATALOGUE:108]))
			$0:=->[CATALOGUE:108]x_ID:1
		: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
			$0:=->[TIME_BILLING_CATEGORIES:46]Category_Code:1
		: ($_l_TableNumber=Table:C252(->[CC_OrderAuths:133]))
			$0:=->[CC_OrderAuths:133]x_ID:1
		: ($_l_TableNumber=Table:C252(->[CCM_PSPTransaction:136]))
			$0:=->[CCM_PSPTransaction:136]x_ID:1
		: ($_l_TableNumber=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
			$0:=->[CLIENT_SERVERMESSAGES:123]USER_ID:1
		: ($_l_TableNumber=Table:C252(->[CODE_USES:91]))
			$0:=$_ptr_NulValue
		: ($_l_TableNumber=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
			$0:=->[COMPANIES_RECORD_ANALYSIS:146]ID:2
		: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			$0:=->[CONTACTS:1]Company_Code:1
		Else 
			Case of 
				: ($_l_TableNumber=Table:C252(->[COMPONENTS:86]))
					$0:=->[COMPONENTS:86]UniqueValue:4
				: ($_l_TableNumber=Table:C252(->[CONTACTS_COMPANIES:145]))
					$0:=->[CONTACTS_COMPANIES:145]ID:3
				: ($_l_TableNumber=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
					$0:=->[CONTACTS_RECORD_ANALYSIS:144]ID:2
				: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
					$0:=->[CONTACTS:1]Contact_Code:2
				: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
					$0:=->[CONTRACT_TYPES:19]Contract_Type_Code:1
				: ($_l_TableNumber=Table:C252(->[CONTRACTS_CONTACTS:151]))
					$0:=->[CONTRACTS_CONTACTS:151]ID:2
				: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
					$0:=->[CONTRACTS:17]Contract_Code:3
				: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
					$0:=->[COUNTRIES:73]COUNTRY_CODE:1
				: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
					$0:=->[CREDIT_STAGES:54]Stage_Code:1
				: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
					$0:=->[CURRENCIES:71]Currency_Code:1
				: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
					$0:=->[CURRENCY_RATES:72]X_ID:6
				: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
					$0:=->[CURRENT_STOCK:62]X_ID:13
				: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
					$0:=->[DATA_AUDITS:102]X_ID:1
				: ($_l_TableNumber=Table:C252(->[DELETIONS:66]))
					$0:=->[DELETIONS:66]xRec_ID:3
				: ($_l_TableNumber=Table:C252(->[DIARY_ITEMOWNERS:106]))
					$0:=$_ptr_NulValue
				: ($_l_TableNumber=Table:C252(->[DIARY:12]))
					$0:=->[DIARY:12]Diary_Code:3
				: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
					$0:=->[DOCUMENTS:7]Document_Code:1
				: ($_l_TableNumber=Table:C252(->[EMAIL_ATTACHMENTS:103]))
					$0:=$_ptr_NulValue
				: ($_l_TableNumber=Table:C252(->[EMAIL_RECIPIENTS:104]))
					$0:=$_ptr_NulValue
				: ($_l_TableNumber=Table:C252(->[EW_BK_FieldMap:121]))
					$0:=->[EW_BK_FieldMap:121]x_RecID:9
				: ($_l_TableNumber=Table:C252(->[EW_BKFields:122]))
					$0:=$_ptr_NulValue
				: ($_l_TableNumber=Table:C252(->[EW_ExportProjects:117]))
					$0:=->[EW_ExportProjects:117]RecordNumber:2
				: ($_l_TableNumber=Table:C252(->[EW_ExportSteps:118]))
					$0:=->[EW_ExportSteps:118]RecordNumber:6
				: ($_l_TableNumber=Table:C252(->[EW_ExportTables:120]))
					$0:=->[EW_ExportTables:120]RecordNumber:2
				: ($_l_TableNumber=Table:C252(->[EW_StepActions:119]))
					$0:=->[EW_StepActions:119]RecordNumber:2
				: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
					$0:=->[CUSTOM_FIELDS_PERSONNEL:100]FD_Code:2
				: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
					$0:=->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1
				: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
					$0:=->[PROJECTS:89]Project_Code:1
				: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
					$0:=->[TABLE_RECORD_STATES:90]State_Code:1
				: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
					$0:=$_ptr_NulValue
				: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
					$0:=$_ptr_NulValue
				: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
					$0:=->[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1
				: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
					$0:=->[CUSTOM_FIELDS:98]Unique_Code:2
				: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
					$0:=->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1
				: ($_l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
					$0:=->[PRODUCT_GROUPS:10]Group_Code:1
				: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
					$0:=->[HEADINGS:84]Heading_Code:1
				: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
					$0:=->[INFORMATION:55]QualityRecordID:16
				: ($_l_TableNumber=Table:C252(->[INVOICES_ALLOCATIONS:162]))
					$0:=->[INVOICES_ALLOCATIONS:162]ID:5
				: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
					$0:=->[INVOICES_ITEMS:161]ID:17
				: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
					$0:=->[INVOICES:39]Invoice_Number:1
				: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
					$0:=->[JOB PERSONNEL:48]X_ID:14
				: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
					$0:=->[JOB_STAGES:47]Job_Stage_code:52
				: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
					$0:=->[JOB_TYPES:65]Type_Code:1
				: ($_l_TableNumber=Table:C252(->[JOBS:26]))
					$0:=->[JOBS:26]Job_Code:1
				: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
					$0:=->[LAYERS:76]Layer_Code:1
				: ($_l_TableNumber=Table:C252(->[LICENCE_UPDATES:97]))
					$0:=->[LICENCE_UPDATES:97]X_ID:5
				: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
					$0:=$_ptr_NulValue
				: ($_l_TableNumber=Table:C252(->[LIST_ITEMS:95]))
					$0:=->[LIST_ITEMS:95]X_ID:3
				Else 
					Case of 
						: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
							$0:=->[LOCATIONS:61]Location_Code:1
						: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
							$0:=->[SCRIPTS:80]Script_Code:1
						: ($_l_TableNumber=Table:C252(->[MAILSORT_A:77]))
							$0:=->[MAILSORT_A:77]x_ID:5
						: ($_l_TableNumber=Table:C252(->[MAILSORT_B:78]))
							$0:=->[MAILSORT_B:78]X_ID:6
						: ($_l_TableNumber=Table:C252(->[MAILSORT_C:79]))
							$0:=->[MAILSORT_C:79]x_ID:3
						: ($_l_TableNumber=Table:C252(->[MAILSORT_D5:81]))
							$0:=->[MAILSORT_D5:81]X_ID:3
						: ($_l_TableNumber=Table:C252(->[MAILSORT_D6:82]))
							$0:=->[MAILSORT_D6:82]X_ID:3
						: ($_l_TableNumber=Table:C252(->[MAILSORT_MAIL:83]))
							$0:=$_ptr_NulValue
						: ($_l_TableNumber=Table:C252(->[MODULES:63]))
							$0:=->[MODULES:63]Code:1
						: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
							$0:=->[MOVEMENT_TYPES:60]Type_Code:1
						: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
							$0:=->[ORDER_ITEMS:25]Item_Number:27
						: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
							$0:=->[ORDERS:24]Order_Code:3
						: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
							$0:=->[PERIODS:33]x_ID:10
						: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
							$0:=->[PERSONNEL_GROUPS:92]Group_Code:1
						: ($_l_TableNumber=Table:C252(->[PERSONNEL_DIARY_ACCESS:149]))
							$0:=->[PERSONNEL_DIARY_ACCESS:149]ID:3
						: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
							$0:=->[PERSONNEL:11]Personnel_ID:48
						: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
							$0:=->[PICTURES:85]x_ID:5
						: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
							$0:=->[POSTAL_CODES:50]xRec_ID:5
						: ($_l_TableNumber=Table:C252(->[PREFERENCES:116]))
							$0:=->[PREFERENCES:116]IDNumber:1
						: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
							$0:=->[PRICE_GROUPS:18]Price_Code:1
						: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
							$0:=->[PRICE_TABLE:28]Table_Code:12
						: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
							$0:=->[PROBLEMS:22]Problem_Code:1
						: ($_l_TableNumber=Table:C252(->[PROCESSES_TO_HANDLE:115]))
							$0:=$_ptr_NulValue
						: ($_l_TableNumber=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
							$0:=->[PRODUCTS_SUPPLIERS:148]ID:7
						: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
							$0:=->[PRODUCTS:9]Product_Code:1
						: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
							$0:=->[PUBLICATIONS:52]Publication_Code:1
							
						: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
							$0:=->[PURCHASE_ORDERS_ITEMS:169]ID:17
						: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
							$0:=->[PURCHASE_ORDERS:57]Purchase_Order_Number:2
						: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
							$0:=->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5
						: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
							$0:=->[PURCHASE_INVOICE_ITEMS:158]ID:16
						: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
							$0:=->[PURCHASE_INVOICES:37]Purchase_Code:1
						: ($_l_TableNumber=Table:C252(->[QUALITY_GROUPS:56]))
							$0:=->[QUALITY_GROUPS:56]x_ID:3
						: ($_l_TableNumber=Table:C252(->[REC_JOURNALS_DATES:160]))
							$0:=->[REC_JOURNALS_DATES:160]ID:3
						: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
							$0:=->[RECURRING_JOURNALS:38]x_ID:15
						: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
							$0:=->[RESULTS:14]Result_Code:1
						: ($_l_TableNumber=Table:C252(->[ROLES:87]))
							$0:=->[ROLES:87]Role_Code:1
						: ($_l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
							$0:=->[SALES_PROJECTION:113]x_ID:1
						: ($_l_TableNumber=Table:C252(->[SALES_ProjectionLinks:114]))
							$0:=->[SALES_ProjectionLinks:114]UniqueReference:5
						: ($_l_TableNumber=Table:C252(->[SD_Settings:107]))
							$0:=->[SD_Settings:107]x_OwnerID:1
						: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
							$0:=->[SERVICE_CALLS_PRODUCTS:152]ID:7
						: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
							$0:=->[SERVICE_CALLS:20]Call_Code:4
						: ($_l_TableNumber=Table:C252(->[SMS_Log:124]))
							$0:=->[SMS_Log:124]X_ID:8
						: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
							$0:=->[SOLUTIONS:23]Solution_Code:1
						: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
							$0:=->[SOURCES:6]Source_Code:1
						: ($_l_TableNumber=Table:C252(->[STAGES:45]))
							$0:=->[STATUS:4]Status_Code:1
						: ($_l_TableNumber=Table:C252(->[STATUS:4]))
							$0:=->[STATUS:4]Status_Code:1
						: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
							$0:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
						: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
							$0:=->[STOCK_LEVELS:58]X_ID:10
						: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
							$0:=->[STOCK_MOVEMENTS:40]Movement_Code:1
						: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
							$0:=->[STOCK_TYPES:59]Type_Code:1
						: ($_l_TableNumber=Table:C252(->[Stock_Thread:143]))
							$0:=->[Stock_Thread:143]Thread_ID:1
						: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
							$0:=->[SUBSCRIPTIONS:93]x_ID:11
						Else 
							Case of 
								: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
									$0:=->[TAX_CODES:35]Tax_Code:1
								: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
									$0:=->[TERMINOLOGY:75]Terminology_Code:1
								: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
									$0:=->[TIME_BUDGETS:49]X_ID:7
								: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
									$0:=->[TRANSACTION_BATCH_ITEMS:155]ID:30
								: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
									$0:=->[TRANSACTION_BATCHES:30]Batch_Number:10
								: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
									$0:=->[TRANSACTION_TYPES:31]Tax_Code:6
								: ($_l_TableNumber=Table:C252(->[TRANS_MULTI:128]))
									$0:=->[TRANS_MULTI:128]x_ID:1
								: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
									$0:=->[TRANSACTIONS:29]Transaction_ID:31
								: ($_l_TableNumber=Table:C252(->[TYPES:5]))
									$0:=->[TYPES:5]Type_Code:1
								: ($_l_TableNumber=Table:C252(->[USER_SETS:105]))
									$0:=->[USER_SETS:105]x_RecID:1
								: ($_l_TableNumber=Table:C252(->[USER:15]))
									$0:=$_ptr_NulValue
								: ($_l_TableNumber=Table:C252(->[WEB_ACCESS:130]))
									$0:=->[WEB_ACCESS:130]x_ID:13
								: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
									$0:=->[WORKFLOW_CONTROL:51]WFControl_Code:10
									
								: ($_l_TableNumber=Table:C252(->[X_DIaryDisplay:142]))
									$0:=$_ptr_NulValue
								: ($_l_TableNumber=Table:C252(->[X_LISTS:111]))
									$0:=->[X_LISTS:111]x_ID:1
								: ($_l_TableNumber=Table:C252(->[x_ListUsage:112]))
									$0:=->[x_ListUsage:112]x_ID:1
								: ($_l_TableNumber=Table:C252(->[xBatchItemRelations:140]))
									$0:=->[xBatchItemRelations:140]xRecordID:4
								: ($_l_TableNumber=Table:C252(->[xCreditCardDetails:132]))
									$0:=->[xCreditCardDetails:132]x_ID:1
								: ($_l_TableNumber=Table:C252(->[xDiaryRelations:137]))
									$0:=->[xDiaryRelations:137]xRecordID:4
								: ($_l_TableNumber=Table:C252(->[XInvoiceAllocation:126]))
									$0:=->[XInvoiceAllocation:126]x_ID:1
								: ($_l_TableNumber=Table:C252(->[XOrder_revisions:127]))
									$0:=->[XOrder_revisions:127]X_ID:1
								: ($_l_TableNumber=Table:C252(->[xOtherRelations:138]))
									$0:=$_ptr_NulValue
								: ($_l_TableNumber=Table:C252(->[XReportsExecutor:135]))
									$0:=->[XReportsExecutor:135]x_ID:1
								: ($_l_TableNumber=Table:C252(->[x_QUERY_PARAMETERS:134]))
									$0:=->[x_QUERY_PARAMETERS:134]X_ID:1
								: ($_l_TableNumber=Table:C252(->[xSynch:139]))
									
									$0:=->[xSynch:139]x_SynchID:1
								: ($_l_TableNumber=Table:C252(->[WEBSETUP_4D:129]))
									
									$0:=$_ptr_NulValue
								: ($_l_TableNumber=Table:C252(->[xServiceSalesItemLink:186]))
									
									$0:=$_ptr_NulValue
								Else 
									//TRACE
									
							End case 
					End case 
			End case 
	End case 
End if 
ERR_MethodTrackerReturn("DB_GetKeyField"; $_t_oldMethodName)