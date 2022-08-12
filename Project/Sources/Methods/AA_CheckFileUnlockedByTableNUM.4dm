//%attributes = {}
If (False:C215)
	//Project Method Name: AA_CheckFileUnlockedByTableNUM
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:22`Method: AA_CheckFileUnlockedByTableNUM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_TableNumber; $1)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName; Sem_t_SemaphoreName; Sem_t_SemaphoreName2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_CheckFileUnlockedByTableNUM")
//this can be called in a generic way
//pass a table num


If (Not:C34(In transaction:C397))
	
	If (Count parameters:C259>=1)
		$_l_TableNumber:=$1
	Else 
		If (Not:C34(Is nil pointer:C315(Current default table:C363)))
			$_Ptr_Table:=Current default table:C363
			$_l_TableNumber:=Table:C252($_Ptr_Table)
		Else 
			$_l_TableNumber:=0
		End if 
	End if 
	If ($_l_TableNumber>0)
		$_l_FieldNumber:=AA_GetIDFieldNum($_l_TableNumber)
		If ($_l_FieldNumber>0)
			$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
			AA_CheckFileUnlocked($_ptr_Field)
			
		Else 
			
			Case of 
				: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
					AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
				: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
					AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
				: ($_l_TableNumber=Table:C252(->[AREAS:3]))
					
				: ($_l_TableNumber=Table:C252(->[STATUS:4]))
					
				: ($_l_TableNumber=Table:C252(->[TYPES:5]))
					
				: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
					
				: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
					
				: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
					
				: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
					AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
				: ($_l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
					
				: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
					AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
				: ($_l_TableNumber=Table:C252(->[DIARY:12]))
					AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
				: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
					
				: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
					
				: ($_l_TableNumber=Table:C252(->[USER:15]))
					
				: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
					
				: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
					AA_CheckFileUnlocked(->[CONTRACTS:17]x_ID:12)
				: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
					
				: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
					
				: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
					
				: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
					
				: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
					
				: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
					AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
				: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				: ($_l_TableNumber=Table:C252(->[JOBS:26]))
					AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
				: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
					
				: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
					AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
				: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
					
				: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
					
				: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
					
				: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
					AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
				: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
					AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
				: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
					
				: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
					
				: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
					
				: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
					AA_CheckFileUnlocked(->[RECURRING_JOURNALS:38]x_ID:15)
				: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
					AA_CheckFileUnlocked(->[INVOICES:39]X_ID:49)
				: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
					AA_CheckFileUnlocked(->[STOCK_MOVEMENTS:40]x_ID:22)
					
					
			End case 
			Case of 
					
				: ($_l_TableNumber=Table:C252(->[STAGES:45]))
					
				: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
					
				: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
					
				: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
					
				: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
					AA_CheckFileUnlocked(->[TIME_BUDGETS:49]X_ID:7)
				: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
					AA_CheckFileUnlocked(->[POSTAL_CODES:50]xRec_ID:5)
				: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
					
				: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
				: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
					
				: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
					
				: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
					AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
				: ($_l_TableNumber=Table:C252(->[QUALITY_GROUPS:56]))
					AA_CheckFileUnlocked(->[QUALITY_GROUPS:56]x_ID:3)
				: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
					AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
				: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
					
				: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
					AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
				: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
					
				: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
					
				: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
					
				: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
					AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
				: ($_l_TableNumber=Table:C252(->[MODULES:63]))
					
					
				: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
					
				: ($_l_TableNumber=Table:C252(->[DELETIONS:66]))
					AA_CheckFileUnlocked(->[DELETIONS:66]xRec_ID:3)
					
					
				: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
					AA_CheckFileUnlocked(->[CURRENCIES:71]X_ID:3)
				: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
					AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
				: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
					
				: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
					
				: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
					
				: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
					
				: ($_l_TableNumber=Table:C252(->[MAILSORT_A:77]))
					AA_CheckFileUnlocked(->[MAILSORT_A:77]x_ID:5)
				: ($_l_TableNumber=Table:C252(->[MAILSORT_B:78]))
					AA_CheckFileUnlocked(->[MAILSORT_B:78]X_ID:6)
				: ($_l_TableNumber=Table:C252(->[MAILSORT_C:79]))
					AA_CheckFileUnlocked(->[MAILSORT_C:79]x_ID:3)
			End case 
			Case of 
				: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
					
				: ($_l_TableNumber=Table:C252(->[MAILSORT_D5:81]))
					AA_CheckFileUnlocked(->[MAILSORT_D5:81]X_ID:3)
				: ($_l_TableNumber=Table:C252(->[MAILSORT_D6:82]))
					AA_CheckFileUnlocked(->[MAILSORT_D6:82]X_ID:3)
				: ($_l_TableNumber=Table:C252(->[MAILSORT_MAIL:83]))
					
				: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
					
				: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
					AA_CheckFileUnlocked(->[PICTURES:85]x_ID:5)
				: ($_l_TableNumber=Table:C252(->[COMPONENTS:86]))
					
				: ($_l_TableNumber=Table:C252(->[ROLES:87]))
					
				: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
				: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
					AA_CheckFileUnlocked(->[PROJECTS:89]X_ID:11)
				: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
					
				: ($_l_TableNumber=Table:C252(->[CODE_USES:91]))
					
				: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
					AA_CheckFileUnlocked(->[PERSONNEL_GROUPS:92]x_ID:12)
				: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
					AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
				: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
					
				: ($_l_TableNumber=Table:C252(->[LIST_ITEMS:95]))
					AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
				: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
					
				: ($_l_TableNumber=Table:C252(->[LICENCE_UPDATES:97]))
					
				: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
					
				: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
					
				: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
					
				: ($_l_TableNumber=Table:C252(->[X_URL_LInks:101]))
					
				: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
					AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
				: ($_l_TableNumber=Table:C252(->[EMAIL_ATTACHMENTS:103]))
					AA_CheckFileUnlocked(->[EMAIL_ATTACHMENTS:103]FileNo:5)
					
				: ($_l_TableNumber=Table:C252(->[EMAIL_RECIPIENTS:104]))
					
				: ($_l_TableNumber=Table:C252(->[USER_SETS:105]))
					AA_CheckFileUnlocked(->[USER_SETS:105]x_RecID:1)
				: ($_l_TableNumber=Table:C252(->[DIARY_ITEMOWNERS:106]))
					
				: ($_l_TableNumber=Table:C252(->[SD_Settings:107]))
					
				: ($_l_TableNumber=Table:C252(->[CATALOGUE:108]))
					AA_CheckFileUnlocked(->[CATALOGUE:108]x_ID:1)
				: ($_l_TableNumber=Table:C252(->[Catalogue_ProductLink:109]))
					AA_CheckFileUnlocked(->[Catalogue_ProductLink:109]x_ID:1)
				: ($_l_TableNumber=Table:C252(->[Catalogue_Availability:110]))
					AA_CheckFileUnlocked(->[Catalogue_Availability:110]x_ID:1)
				: ($_l_TableNumber=Table:C252(->[X_LISTS:111]))
					AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
				: ($_l_TableNumber=Table:C252(->[x_ListUsage:112]))
					AA_CheckFileUnlocked(->[x_ListUsage:112]x_ID:1)
				: ($_l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
					AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
				: ($_l_TableNumber=Table:C252(->[SALES_ProjectionLinks:114]))
					AA_CheckFileUnlocked(->[SALES_ProjectionLinks:114]x_ID:1)
				: ($_l_TableNumber=Table:C252(->[PROCESSES_TO_HANDLE:115]))
					
				: ($_l_TableNumber=Table:C252(->[PREFERENCES:116]))
					AA_CheckFileUnlocked(->[PREFERENCES:116]IDNumber:1)
				: ($_l_TableNumber=Table:C252(->[EW_ExportProjects:117]))
					
				: ($_l_TableNumber=Table:C252(->[EW_ExportSteps:118]))
					
				: ($_l_TableNumber=Table:C252(->[EW_StepActions:119]))
				: ($_l_TableNumber=Table:C252(->[EW_ExportTables:120]))
				: ($_l_TableNumber=Table:C252(->[EW_BK_FieldMap:121]))
				: ($_l_TableNumber=Table:C252(->[EW_BKFields:122]))
				: ($_l_TableNumber=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
					
					
				: ($_l_TableNumber=Table:C252(->[SMS_Log:124]))
					AA_CheckFileUnlocked(->[SMS_Log:124]X_ID:8)
				: ($_l_TableNumber=Table:C252(->[XOrder_revisions:127]))
					AA_CheckFileUnlocked(->[XOrder_revisions:127]X_ID:1)
				: ($_l_TableNumber=Table:C252(->[XInvoiceAllocation:126]))
					AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
				: ($_l_TableNumber=Table:C252(->[AddressRecords:125]))
					AA_CheckFileUnlocked(->[AddressRecords:125]X_ID:1)
					
			End case 
		End if 
		If (Sem_t_SemaphoreName2#"")
			CLEAR SEMAPHORE:C144(Sem_t_SemaphoreName2)
		End if 
		If (Sem_t_SemaphoreName#"")
			CLEAR SEMAPHORE:C144(Sem_t_SemaphoreName)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("AA_CheckFileUnlockedByTableNUM"; $_t_oldMethodName)
