//%attributes = {}
If (False:C215)
	//Project Method Name: AA_CheckFileID
	//------------------ Method Notes ------------------
	//this only checks if we have a numeric id
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:22`Method: AA_CheckFileID
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_HasFileID; $0)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_CheckFileID")

If (Count parameters:C259>=1)
	$_l_TableNumber:=$1
Else 
	If (Not:C34(Is nil pointer:C315(Current default table:C363)))
		$_l_TableNumber:=Table:C252(Current default table:C363)
		
	Else 
		$_l_TableNumber:=0
	End if 
End if 

If ($_l_TableNumber>0)
	$_l_FieldNumber:=AA_GetIDFieldNum($_l_TableNumber)
	
	If ($_l_FieldNumber=0)
		Case of 
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[AREAS:3]))
				
			: ($_l_TableNumber=Table:C252(->[STATUS:4]))
				
			: ($_l_TableNumber=Table:C252(->[TYPES:5]))
				
			: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
				
			: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
				
			: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
				
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
				
			: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
				
			: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
				
			: ($_l_TableNumber=Table:C252(->[USER:15]))
				
			: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
				
			: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
				
			: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
				
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
				
			: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
				
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[JOBS:26]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
				
			: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
				
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
				
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
				
			: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
				
			: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
				
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
				$_bo_HasFileID:=True:C214
		End case 
		Case of 
				
			: ($_l_TableNumber=Table:C252(->[STAGES:45]))
				
			: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
				
			: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
				
			: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
				
			: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
				
			: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
			: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
				
			: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
				
			: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[QUALITY_GROUPS:56]))
				$_bo_HasFileID:=True:C214
				
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				
			: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
				
			: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
				
			: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
				
			: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[MODULES:63]))
				
				
			: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
				
			: ($_l_TableNumber=Table:C252(->[DELETIONS:66]))
				$_bo_HasFileID:=True:C214
				
			: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
				
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
				
			: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
				
			: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
				
			: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
				
			: ($_l_TableNumber=Table:C252(->[MAILSORT_A:77]))
				
			: ($_l_TableNumber=Table:C252(->[MAILSORT_B:78]))
				
			: ($_l_TableNumber=Table:C252(->[MAILSORT_C:79]))
				$_bo_HasFileID:=True:C214
		End case 
		Case of 
			: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
				
			: ($_l_TableNumber=Table:C252(->[MAILSORT_D5:81]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[MAILSORT_D6:82]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[MAILSORT_MAIL:83]))
				
			: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
				
			: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[COMPONENTS:86]))
				
			: ($_l_TableNumber=Table:C252(->[ROLES:87]))
				
			: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
			: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
				
			: ($_l_TableNumber=Table:C252(->[CODE_USES:91]))
				
			: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
				
			: ($_l_TableNumber=Table:C252(->[LIST_ITEMS:95]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
				
			: ($_l_TableNumber=Table:C252(->[LICENCE_UPDATES:97]))
				
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
				
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
				
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
				
			: ($_l_TableNumber=Table:C252(->[X_URL_LInks:101]))
				
			: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[EMAIL_ATTACHMENTS:103]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[EMAIL_RECIPIENTS:104]))
				
			: ($_l_TableNumber=Table:C252(->[USER_SETS:105]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[DIARY_ITEMOWNERS:106]))
				
			: ($_l_TableNumber=Table:C252(->[SD_Settings:107]))
				
			: ($_l_TableNumber=Table:C252(->[CATALOGUE:108]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[Catalogue_ProductLink:109]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[Catalogue_Availability:110]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[X_LISTS:111]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[x_ListUsage:112]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[SALES_ProjectionLinks:114]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[PROCESSES_TO_HANDLE:115]))
				
			: ($_l_TableNumber=Table:C252(->[PREFERENCES:116]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[EW_ExportProjects:117]))
				
			: ($_l_TableNumber=Table:C252(->[EW_ExportSteps:118]))
				
			: ($_l_TableNumber=Table:C252(->[EW_StepActions:119]))
			: ($_l_TableNumber=Table:C252(->[EW_ExportTables:120]))
			: ($_l_TableNumber=Table:C252(->[EW_BK_FieldMap:121]))
			: ($_l_TableNumber=Table:C252(->[EW_BKFields:122]))
			: ($_l_TableNumber=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
				
			: ($_l_TableNumber=Table:C252(->[SMS_Log:124]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[XOrder_revisions:127]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[XInvoiceAllocation:126]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[AddressRecords:125]))
				$_bo_HasFileID:=True:C214
				
		End case 
		Case of 
			: ($_l_TableNumber=Table:C252(->[WEBSETUP_4D:129]))
			: ($_l_TableNumber=Table:C252(->[WEB_ACCESS:130]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[xCreditCardDetails:132]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[CC_OrderAuths:133]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[CCM_PSPTransaction:136]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[x_QUERY_PARAMETERS:134]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[XReportsExecutor:135]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[xDiaryRelations:137]))
			: ($_l_TableNumber=Table:C252(->[xOtherRelations:138]))
			: ($_l_TableNumber=Table:C252(->[xSynch:139]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[xBatchItemRelations:140]))
				
			: ($_l_TableNumber=Table:C252(->[X_DIaryDisplay:142]))
			: ($_l_TableNumber=Table:C252(->[Stock_Thread:143]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[INVOICES_ALLOCATIONS:162]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[CONTACTS_COMPANIES:145]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[CONTRACTS_CONTACTS:151]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS_ANALYSES:157]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS_LAYERS:156]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[PERSONNEL_DIARY_ACCESS:149]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[REC_JOURNALS_DATES:160]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
				$_bo_HasFileID:=True:C214
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
				//
				$_bo_HasFileID:=True:C214
		End case 
	Else 
		$_bo_HasFileID:=True:C214
	End if 
	
End if 

$0:=$_bo_HasFileID
ERR_MethodTrackerReturn("AA_CheckFileID"; $_t_oldMethodName)
