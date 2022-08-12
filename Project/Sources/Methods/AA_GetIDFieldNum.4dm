//%attributes = {}
If (False:C215)
	//Project Method Name: 
	//------------------ Method Notes ------------------
	//This method will return the field number of the ID Field(now called from AA_CheckFileID
	
	//------------------ Revision Control ----------------
	//Date Created: 17/02/2011 07:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_IDFIeldNumber; $_l_TableNumber; $0; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AA_GetIDFieldNum")

$_l_IDFIeldNumber:=0
If (Count parameters:C259>=1)
	$_l_TableNumber:=$1
	If ($_l_TableNumber>0)
		Case of 
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				$_l_IDFIeldNumber:=Field:C253(->[CONTACTS:1]x_ID:33)
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				$_l_IDFIeldNumber:=Field:C253(->[COMPANIES:2]x_ID:63)
			: ($_l_TableNumber=Table:C252(->[AREAS:3]))
				
			: ($_l_TableNumber=Table:C252(->[STATUS:4]))
				
			: ($_l_TableNumber=Table:C252(->[TYPES:5]))
				
			: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
				
			: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
				//NG THIS SHOULD HAVE
				
			: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
				
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				$_l_IDFIeldNumber:=Field:C253(->[PRODUCTS:9]X_ID:43)
			: ($_l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
				
			: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
				$_l_IDFIeldNumber:=Field:C253(->[PERSONNEL:11]Personnel_ID:48)
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				$_l_IDFIeldNumber:=Field:C253(->[DIARY:12]x_ID:50)
			: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
				$_l_IDFIeldNumber:=Field:C253(->[ACTIONS:13]xID:12)
			: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
				
			: ($_l_TableNumber=Table:C252(->[USER:15]))
				
			: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
				
			: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
				$_l_IDFIeldNumber:=Field:C253(->[CONTRACTS:17]x_ID:12)
			: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
				
			: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
				
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
				$_l_IDFIeldNumber:=Field:C253(->[SERVICE_CALLS:20]x_ID:27)
			: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
				
			: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
				
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				$_l_IDFIeldNumber:=Field:C253(->[ORDERS:24]x_ID:58)
				
			: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
				$_l_IDFIeldNumber:=Field:C253(->[ORDER_ITEMS:25]x_ID:58)
			: ($_l_TableNumber=Table:C252(->[JOBS:26]))
				$_l_IDFIeldNumber:=Field:C253(->[JOBS:26]x_ID:49)
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				$_l_IDFIeldNumber:=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
				$_l_IDFIeldNumber:=Field:C253(->[PRICE_TABLE:28]x_ID:15)
			: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
				$_l_IDFIeldNumber:=Field:C253(->[TRANSACTIONS:29]Transaction_ID:31)
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
				//NG this should have
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
				
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
				
			: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
				$_l_IDFIeldNumber:=Field:C253(->[PERIODS:33]x_ID:10)
			: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
				$_l_IDFIeldNumber:=Field:C253(->[ACCOUNT_BALANCES:34]x_ID:7)
			: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
				
			: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
				
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				$_l_IDFIeldNumber:=Field:C253(->[PURCHASE_INVOICES:37]x_ID:35)
			: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
				$_l_IDFIeldNumber:=Field:C253(->[RECURRING_JOURNALS:38]x_ID:15)
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				//NG this should have
				$_l_IDFIeldNumber:=Field:C253(->[INVOICES:39]X_ID:49)
				
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
				//NG This should have
				$_l_IDFIeldNumber:=Field:C253(->[STOCK_MOVEMENTS:40]x_ID:22)
				
				
		End case 
		If ($_l_IDFIeldNumber=0)
			Case of 
					
				: ($_l_TableNumber=Table:C252(->[STAGES:45]))
					
				: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
					
				: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
					$_l_IDFIeldNumber:=Field:C253(->[JOB_STAGES:47]x_ID:54)
				: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
					$_l_IDFIeldNumber:=Field:C253(->[JOB PERSONNEL:48]X_ID:14)
				: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
					$_l_IDFIeldNumber:=Field:C253(->[TIME_BUDGETS:49]X_ID:7)
				: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
					$_l_IDFIeldNumber:=Field:C253(->[POSTAL_CODES:50]xRec_ID:5)
				: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
					
				: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
				: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
					
				: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
					
				: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
					$_l_IDFIeldNumber:=Field:C253(->[INFORMATION:55]QualityRecordID:16)
				: ($_l_TableNumber=Table:C252(->[QUALITY_GROUPS:56]))
					$_l_IDFIeldNumber:=Field:C253(->[QUALITY_GROUPS:56]x_ID:3)
					
				: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
					$_l_IDFIeldNumber:=Field:C253(->[PURCHASE_ORDERS:57]x_ID:21)
				: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
					$_l_IDFIeldNumber:=Field:C253(->[STOCK_LEVELS:58]X_ID:10)
				: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
					
				: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
					
				: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
					
				: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
					$_l_IDFIeldNumber:=Field:C253(->[CURRENT_STOCK:62]X_ID:13)
				: ($_l_TableNumber=Table:C252(->[MODULES:63]))
					
					
				: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
					
				: ($_l_TableNumber=Table:C252(->[DELETIONS:66]))
					$_l_IDFIeldNumber:=Field:C253(->[DELETIONS:66]xRec_ID:3)
					
				: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
					$_l_IDFIeldNumber:=Field:C253(->[CURRENCIES:71]X_ID:3)
				: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
					
					$_l_IDFIeldNumber:=Field:C253(->[CURRENCY_RATES:72]X_ID:6)
				: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
					
				: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
					
				: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
					
				: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
					
				: ($_l_TableNumber=Table:C252(->[MAILSORT_A:77]))
					
				: ($_l_TableNumber=Table:C252(->[MAILSORT_B:78]))
					
				: ($_l_TableNumber=Table:C252(->[MAILSORT_C:79]))
					$_l_IDFIeldNumber:=Field:C253(->[MAILSORT_C:79]x_ID:3)
			End case 
			If ($_l_IDFIeldNumber=0)
				Case of 
					: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
						
					: ($_l_TableNumber=Table:C252(->[MAILSORT_D5:81]))
						$_l_IDFIeldNumber:=Field:C253(->[MAILSORT_D5:81]X_ID:3)
					: ($_l_TableNumber=Table:C252(->[MAILSORT_D6:82]))
						$_l_IDFIeldNumber:=Field:C253(->[MAILSORT_D6:82]X_ID:3)
					: ($_l_TableNumber=Table:C252(->[MAILSORT_MAIL:83]))
						
					: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
						
					: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
						$_l_IDFIeldNumber:=Field:C253(->[PICTURES:85]x_ID:5)
					: ($_l_TableNumber=Table:C252(->[COMPONENTS:86]))
						
					: ($_l_TableNumber=Table:C252(->[ROLES:87]))
						
					: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
					: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
						$_l_IDFIeldNumber:=Field:C253(->[PROJECTS:89]X_ID:11)
					: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
						
					: ($_l_TableNumber=Table:C252(->[CODE_USES:91]))
						
					: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
						$_l_IDFIeldNumber:=Field:C253(->[PERSONNEL_GROUPS:92]x_ID:12)
					: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
						$_l_IDFIeldNumber:=Field:C253(->[SUBSCRIPTIONS:93]x_ID:11)
					: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
						
					: ($_l_TableNumber=Table:C252(->[LIST_ITEMS:95]))
						$_l_IDFIeldNumber:=Field:C253(->[LIST_ITEMS:95]X_ID:3)
					: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
						
					: ($_l_TableNumber=Table:C252(->[LICENCE_UPDATES:97]))
						$_l_IDFIeldNumber:=Field:C253(->[LICENCE_UPDATES:97]X_ID:5)
					: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
						
					: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
						
					: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
						
					: ($_l_TableNumber=Table:C252(->[X_URL_LInks:101]))
						
					: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
						$_l_IDFIeldNumber:=Field:C253(->[DATA_AUDITS:102]X_ID:1)
					: ($_l_TableNumber=Table:C252(->[EMAIL_ATTACHMENTS:103]))
						$_l_IDFIeldNumber:=Field:C253(->[EMAIL_ATTACHMENTS:103]FileNo:5)
					: ($_l_TableNumber=Table:C252(->[EMAIL_RECIPIENTS:104]))
						
					: ($_l_TableNumber=Table:C252(->[USER_SETS:105]))
						
						$_l_IDFIeldNumber:=Field:C253(->[USER_SETS:105]x_RecID:1)
					: ($_l_TableNumber=Table:C252(->[DIARY_ITEMOWNERS:106]))
						
					: ($_l_TableNumber=Table:C252(->[SD_Settings:107]))
						
					: ($_l_TableNumber=Table:C252(->[CATALOGUE:108]))
						$_l_IDFIeldNumber:=Field:C253(->[CATALOGUE:108]x_ID:1)
					: ($_l_TableNumber=Table:C252(->[Catalogue_ProductLink:109]))
						$_l_IDFIeldNumber:=Field:C253(->[Catalogue_ProductLink:109]x_ID:1)
					: ($_l_TableNumber=Table:C252(->[Catalogue_Availability:110]))
						$_l_IDFIeldNumber:=Field:C253(->[Catalogue_Availability:110]x_ID:1)
					: ($_l_TableNumber=Table:C252(->[X_LISTS:111]))
						$_l_IDFIeldNumber:=Field:C253(->[X_LISTS:111]x_ID:1)
					: ($_l_TableNumber=Table:C252(->[x_ListUsage:112]))
						$_l_IDFIeldNumber:=Field:C253(->[x_ListUsage:112]x_ID:1)
					: ($_l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
						$_l_IDFIeldNumber:=Field:C253(->[SALES_PROJECTION:113]x_ID:1)
					: ($_l_TableNumber=Table:C252(->[SALES_ProjectionLinks:114]))
						$_l_IDFIeldNumber:=Field:C253(->[SALES_ProjectionLinks:114]x_ID:1)
					: ($_l_TableNumber=Table:C252(->[PROCESSES_TO_HANDLE:115]))
						
					: ($_l_TableNumber=Table:C252(->[PREFERENCES:116]))
						$_l_IDFIeldNumber:=Field:C253(->[PREFERENCES:116]IDNumber:1)
					: ($_l_TableNumber=Table:C252(->[EW_ExportProjects:117]))
						$_l_IDFIeldNumber:=Field:C253(->[EW_ExportProjects:117]RecordNumber:2)
					: ($_l_TableNumber=Table:C252(->[EW_ExportSteps:118]))
						$_l_IDFIeldNumber:=Field:C253(->[EW_ExportSteps:118]RecordNumber:6)
					: ($_l_TableNumber=Table:C252(->[EW_StepActions:119]))
						$_l_IDFIeldNumber:=Field:C253(->[EW_StepActions:119]RecordNumber:2)
					: ($_l_TableNumber=Table:C252(->[EW_ExportTables:120]))
					: ($_l_TableNumber=Table:C252(->[EW_BK_FieldMap:121]))
					: ($_l_TableNumber=Table:C252(->[EW_BKFields:122]))
					: ($_l_TableNumber=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
						
					: ($_l_TableNumber=Table:C252(->[SMS_Log:124]))
						$_l_IDFIeldNumber:=Field:C253(->[SMS_Log:124]X_ID:8)
					: ($_l_TableNumber=Table:C252(->[XOrder_revisions:127]))
						$_l_IDFIeldNumber:=Field:C253(->[XOrder_revisions:127]X_ID:1)
					: ($_l_TableNumber=Table:C252(->[XInvoiceAllocation:126]))
						$_l_IDFIeldNumber:=Field:C253(->[XInvoiceAllocation:126]x_ID:1)
					: ($_l_TableNumber=Table:C252(->[AddressRecords:125]))
						$_l_IDFIeldNumber:=Field:C253(->[AddressRecords:125]X_ID:1)
					: ($_l_TableNumber=Table:C252(->[xSynch:139]))
						$_l_IDFIeldNumber:=Field:C253(->[xSynch:139]x_SynchID:1)
					: ($_l_TableNumber=Table:C252(->[x_QUERY_PARAMETERS:134]))
						$_l_IDFIeldNumber:=Field:C253(->[x_QUERY_PARAMETERS:134]X_ID:1)
					: ($_l_TableNumber=Table:C252(->[XReportsExecutor:135]))
						$_l_IDFIeldNumber:=Field:C253(->[XReportsExecutor:135]x_ID:1)
					: ($_l_TableNumber=Table:C252(->[xCreditCardDetails:132]))
						$_l_IDFIeldNumber:=Field:C253(->[xCreditCardDetails:132]x_ID:1)
					: ($_l_TableNumber=Table:C252(->[WEB_ACCESS:130]))
						$_l_IDFIeldNumber:=Field:C253(->[WEB_ACCESS:130]x_ID:13)
					: ($_l_TableNumber=Table:C252(->[TRANS_MULTI:128]))
						$_l_IDFIeldNumber:=Field:C253(->[TRANS_MULTI:128]x_ID:1)
				End case 
				If ($_l_IDFIeldNumber=0)
					Case of 
						: ($_l_TableNumber=Table:C252(->[CC_OrderAuths:133]))
							$_l_IDFIeldNumber:=Field:C253(->[CC_OrderAuths:133]x_ID:1)
						: ($_l_TableNumber=Table:C252(->[CCM_PSPTransaction:136]))
							$_l_IDFIeldNumber:=Field:C253(->[CCM_PSPTransaction:136]x_ID:1)
						: ($_l_TableNumber=Table:C252(->[x_QUERY_PARAMETERS:134]))
							$_l_IDFIeldNumber:=Field:C253(->[x_QUERY_PARAMETERS:134]X_ID:1)
						: ($_l_TableNumber=Table:C252(->[XReportsExecutor:135]))
							$_l_IDFIeldNumber:=Field:C253(->[XReportsExecutor:135]x_ID:1)
						: ($_l_TableNumber=Table:C252(->[xDiaryRelations:137]))
						: ($_l_TableNumber=Table:C252(->[xOtherRelations:138]))
						: ($_l_TableNumber=Table:C252(->[xSynch:139]))
							$_l_IDFIeldNumber:=Field:C253(->[xSynch:139]x_SynchID:1)
						: ($_l_TableNumber=Table:C252(->[xBatchItemRelations:140]))
							
						: ($_l_TableNumber=Table:C252(->[X_DIaryDisplay:142]))
						: ($_l_TableNumber=Table:C252(->[Stock_Thread:143]))
							$_l_IDFIeldNumber:=Field:C253(->[Stock_Thread:143]Thread_ID:1)
						: ($_l_TableNumber=Table:C252(->[INVOICES_ALLOCATIONS:162]))
							$_l_IDFIeldNumber:=Field:C253(->[INVOICES_ALLOCATIONS:162]ID:5)
						: ($_l_TableNumber=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
							
							$_l_IDFIeldNumber:=Field:C253(->[CONTACTS_RECORD_ANALYSIS:144]ID:2)
						: ($_l_TableNumber=Table:C252(->[CONTACTS_COMPANIES:145]))
							$_l_IDFIeldNumber:=Field:C253(->[CONTACTS_COMPANIES:145]ID:3)
						: ($_l_TableNumber=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
							$_l_IDFIeldNumber:=Field:C253(->[COMPANIES_RECORD_ANALYSIS:146]ID:2)
						: ($_l_TableNumber=Table:C252(->[CONTRACTS_CONTACTS:151]))
							$_l_IDFIeldNumber:=Field:C253(->[CONTRACTS_CONTACTS:151]ID:2)
						: ($_l_TableNumber=Table:C252(->[ACCOUNTS_ANALYSES:157]))
							$_l_IDFIeldNumber:=Field:C253(->[ACCOUNTS_ANALYSES:157]ID:2)
						: ($_l_TableNumber=Table:C252(->[ACCOUNTS_LAYERS:156]))
							$_l_IDFIeldNumber:=Field:C253(->[ACCOUNTS_LAYERS:156]ID:2)
						: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
							$_l_IDFIeldNumber:=Field:C253(->[INVOICES_ITEMS:161]ID:17)
						: ($_l_TableNumber=Table:C252(->[PERSONNEL_DIARY_ACCESS:149]))
							$_l_IDFIeldNumber:=Field:C253(->[PERSONNEL_DIARY_ACCESS:149]ID:3)
						: ($_l_TableNumber=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
							$_l_IDFIeldNumber:=Field:C253(->[PRODUCTS_SUPPLIERS:148]ID:7)
						: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
							$_l_IDFIeldNumber:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]ID:17)
						: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
							$_l_IDFIeldNumber:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]ID:16)
						: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
							$_l_IDFIeldNumber:=Field:C253(->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5)
						: ($_l_TableNumber=Table:C252(->[REC_JOURNALS_DATES:160]))
							$_l_IDFIeldNumber:=Field:C253(->[REC_JOURNALS_DATES:160]ID:3)
						: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
							$_l_IDFIeldNumber:=Field:C253(->[SERVICE_CALLS_PRODUCTS:152]ID:7)
						: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
							$_l_IDFIeldNumber:=Field:C253(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
					End case 
				End if 
			End if 
		End if 
	End if 
End if 
$0:=$_l_IDFIeldNumber
ERR_MethodTrackerReturn("AA_GetIDFieldNum"; $_t_oldMethodName)