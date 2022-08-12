//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_GetIdField
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: QV_GetIdField
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($b_RecordIDMandatory)
	C_LONGINT:C283($1; $l_TableNumber)
	C_POINTER:C301($0; $p_FieldPtr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_GetIdField")
//$1 table number must be pass
//$0 pointer to the ID field for the table number passed


If (Count parameters:C259>=1)
	$l_TableNumber:=$1
Else 
	
	$l_TableNumber:=0
End if 


$b_RecordIDMandatory:=False:C215

If ($l_TableNumber>0)
	Case of 
		: ($l_TableNumber=Table:C252(->[CONTACTS:1]))
			$b_RecordIDMandatory:=True:C214
			
			$p_FieldPtr:=->[CONTACTS:1]x_ID:33
		: ($l_TableNumber=Table:C252(->[COMPANIES:2]))
			$b_RecordIDMandatory:=True:C214
			
			$p_FieldPtr:=->[COMPANIES:2]x_ID:63
		: ($l_TableNumber=Table:C252(->[AREAS:3]))
			
		: ($l_TableNumber=Table:C252(->[STATUS:4]))
			
		: ($l_TableNumber=Table:C252(->[TYPES:5]))
			
		: ($l_TableNumber=Table:C252(->[SOURCES:6]))
			
		: ($l_TableNumber=Table:C252(->[DOCUMENTS:7]))
			
		: ($l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
			
		: ($l_TableNumber=Table:C252(->[PRODUCTS:9]))
			$b_RecordIDMandatory:=True:C214
			$p_FieldPtr:=->[PRODUCTS:9]X_ID:43
		: ($l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
			
		: ($l_TableNumber=Table:C252(->[PERSONNEL:11]))
			$b_RecordIDMandatory:=True:C214
			$p_FieldPtr:=->[PERSONNEL:11]Personnel_ID:48
		: ($l_TableNumber=Table:C252(->[DIARY:12]))
			$b_RecordIDMandatory:=True:C214
			$p_FieldPtr:=->[DIARY:12]x_ID:50
		: ($l_TableNumber=Table:C252(->[ACTIONS:13]))
			
		: ($l_TableNumber=Table:C252(->[RESULTS:14]))
			
		: ($l_TableNumber=Table:C252(->[USER:15]))
			
		: ($l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
			
		: ($l_TableNumber=Table:C252(->[CONTRACTS:17]))
			$b_RecordIDMandatory:=True:C214
			$p_FieldPtr:=->[CONTRACTS:17]x_ID:12
		: ($l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
			
		: ($l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
			
		: ($l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
			
			
			
		: ($l_TableNumber=Table:C252(->[PROBLEMS:22]))
			
		: ($l_TableNumber=Table:C252(->[SOLUTIONS:23]))
			
		: ($l_TableNumber=Table:C252(->[ORDERS:24]))
			$b_RecordIDMandatory:=True:C214
			$p_FieldPtr:=->[ORDERS:24]x_ID:58
		: ($l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
			$b_RecordIDMandatory:=True:C214
			$p_FieldPtr:=->[ORDER_ITEMS:25]x_ID:58
		: ($l_TableNumber=Table:C252(->[JOBS:26]))
			$b_RecordIDMandatory:=True:C214
			$p_FieldPtr:=->[JOBS:26]x_ID:49
		: ($l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			$b_RecordIDMandatory:=True:C214
			$p_FieldPtr:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
		: ($l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
			
		: ($l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
			$b_RecordIDMandatory:=True:C214
			$p_FieldPtr:=->[TRANSACTIONS:29]Transaction_ID:31
		: ($l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
			
		: ($l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
			
		: ($l_TableNumber=Table:C252(->[ACCOUNTS:32]))
			
		: ($l_TableNumber=Table:C252(->[PERIODS:33]))
			$b_RecordIDMandatory:=True:C214
			$p_FieldPtr:=->[PERIODS:33]x_ID:10
		: ($l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
			$b_RecordIDMandatory:=True:C214
			$p_FieldPtr:=->[ACCOUNT_BALANCES:34]x_ID:7
		: ($l_TableNumber=Table:C252(->[TAX_CODES:35]))
			
		: ($l_TableNumber=Table:C252(->[ANALYSES:36]))
			
		: ($l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
			
		: ($l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
			$b_RecordIDMandatory:=True:C214
			$p_FieldPtr:=->[RECURRING_JOURNALS:38]x_ID:15
		: ($l_TableNumber=Table:C252(->[INVOICES:39]))
			
		: ($l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
			$p_FieldPtr:=->[STOCK_MOVEMENTS:40]x_ID:22
	End case 
	
	If ($b_RecordIDMandatory=False:C215)
		Case of 
				
			: ($l_TableNumber=Table:C252(->[STAGES:45]))
				
			: ($l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
				
			: ($l_TableNumber=Table:C252(->[JOB_STAGES:47]))
				
			: ($l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
				
			: ($l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
				$b_RecordIDMandatory:=True:C214
				$p_FieldPtr:=->[TIME_BUDGETS:49]X_ID:7
			: ($l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
				$b_RecordIDMandatory:=True:C214
				$p_FieldPtr:=->[POSTAL_CODES:50]xRec_ID:5
			: ($l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
				
			: ($l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
			: ($l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
				
			: ($l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
				
			: ($l_TableNumber=Table:C252(->[INFORMATION:55]))
				$b_RecordIDMandatory:=True:C214
				$p_FieldPtr:=->[INFORMATION:55]QualityRecordID:16
			: ($l_TableNumber=Table:C252(->[QUALITY_GROUPS:56]))
				$b_RecordIDMandatory:=True:C214
				$p_FieldPtr:=->[QUALITY_GROUPS:56]x_ID:3
			: ($l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				
			: ($l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
				$b_RecordIDMandatory:=True:C214
				$p_FieldPtr:=->[STOCK_LEVELS:58]X_ID:10
			: ($l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
				
			: ($l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
				
			: ($l_TableNumber=Table:C252(->[LOCATIONS:61]))
				
			: ($l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
				$b_RecordIDMandatory:=True:C214
				$p_FieldPtr:=->[CURRENT_STOCK:62]X_ID:13
			: ($l_TableNumber=Table:C252(->[MODULES:63]))
				
			: ($l_TableNumber=Table:C252(->[JOB_TYPES:65]))
				
			: ($l_TableNumber=Table:C252(->[DELETIONS:66]))
				$b_RecordIDMandatory:=True:C214
				$p_FieldPtr:=->[DELETIONS:66]xRec_ID:3
				
			: ($l_TableNumber=Table:C252(->[CURRENCIES:71]))
				$b_RecordIDMandatory:=True:C214
				$p_FieldPtr:=->[CURRENCIES:71]X_ID:3
			: ($l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
				$b_RecordIDMandatory:=True:C214
				$p_FieldPtr:=->[CURRENCY_RATES:72]X_ID:6
			: ($l_TableNumber=Table:C252(->[COUNTRIES:73]))
				
			: ($l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
				
			: ($l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
				
			: ($l_TableNumber=Table:C252(->[LAYERS:76]))
				
			: ($l_TableNumber=Table:C252(->[MAILSORT_A:77]))
				$b_RecordIDMandatory:=True:C214
				$p_FieldPtr:=->[MAILSORT_A:77]x_ID:5
			: ($l_TableNumber=Table:C252(->[MAILSORT_B:78]))
				$b_RecordIDMandatory:=True:C214
				$p_FieldPtr:=->[MAILSORT_B:78]X_ID:6
			: ($l_TableNumber=Table:C252(->[MAILSORT_C:79]))
				$b_RecordIDMandatory:=True:C214
				$p_FieldPtr:=->[MAILSORT_C:79]x_ID:3
		End case 
		If ($b_RecordIDMandatory=False:C215)
			Case of 
				: ($l_TableNumber=Table:C252(->[SCRIPTS:80]))
					
				: ($l_TableNumber=Table:C252(->[MAILSORT_D5:81]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[MAILSORT_D5:81]X_ID:3
				: ($l_TableNumber=Table:C252(->[MAILSORT_D6:82]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[MAILSORT_D6:82]X_ID:3
				: ($l_TableNumber=Table:C252(->[MAILSORT_MAIL:83]))
					
				: ($l_TableNumber=Table:C252(->[HEADINGS:84]))
					
				: ($l_TableNumber=Table:C252(->[PICTURES:85]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[PICTURES:85]x_ID:5
				: ($l_TableNumber=Table:C252(->[COMPONENTS:86]))
					
				: ($l_TableNumber=Table:C252(->[ROLES:87]))
					
				: ($l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
				: ($l_TableNumber=Table:C252(->[PROJECTS:89]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[PROJECTS:89]X_ID:11
				: ($l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
					
				: ($l_TableNumber=Table:C252(->[CODE_USES:91]))
					
				: ($l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[PERSONNEL_GROUPS:92]x_ID:12
				: ($l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[SUBSCRIPTIONS:93]x_ID:11
				: ($l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
					
				: ($l_TableNumber=Table:C252(->[LIST_ITEMS:95]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[LIST_ITEMS:95]X_ID:3
				: ($l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
					
				: ($l_TableNumber=Table:C252(->[LICENCE_UPDATES:97]))
					
				: ($l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
					
				: ($l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
					
				: ($l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
					
				: ($l_TableNumber=Table:C252(->[X_URL_LInks:101]))
					
				: ($l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[DATA_AUDITS:102]X_ID:1
				: ($l_TableNumber=Table:C252(->[EMAIL_ATTACHMENTS:103]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[EMAIL_ATTACHMENTS:103]FileNo:5
				: ($l_TableNumber=Table:C252(->[EMAIL_RECIPIENTS:104]))
					
				: ($l_TableNumber=Table:C252(->[USER_SETS:105]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[USER_SETS:105]x_RecID:1
				: ($l_TableNumber=Table:C252(->[DIARY_ITEMOWNERS:106]))
					
				: ($l_TableNumber=Table:C252(->[SD_Settings:107]))
					
				: ($l_TableNumber=Table:C252(->[CATALOGUE:108]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[CATALOGUE:108]x_ID:1
				: ($l_TableNumber=Table:C252(->[Catalogue_ProductLink:109]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[Catalogue_ProductLink:109]x_ID:1
				: ($l_TableNumber=Table:C252(->[Catalogue_Availability:110]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[Catalogue_Availability:110]x_ID:1
				: ($l_TableNumber=Table:C252(->[X_LISTS:111]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[X_LISTS:111]x_ID:1
				: ($l_TableNumber=Table:C252(->[x_ListUsage:112]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[x_ListUsage:112]x_ID:1
				: ($l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[SALES_PROJECTION:113]x_ID:1
				: ($l_TableNumber=Table:C252(->[SALES_ProjectionLinks:114]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[SALES_ProjectionLinks:114]x_ID:1
				: ($l_TableNumber=Table:C252(->[PROCESSES_TO_HANDLE:115]))
					
				: ($l_TableNumber=Table:C252(->[PREFERENCES:116]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[PREFERENCES:116]IDNumber:1
				: ($l_TableNumber=Table:C252(->[EW_ExportProjects:117]))
				: ($l_TableNumber=Table:C252(->[EW_ExportSteps:118]))
				: ($l_TableNumber=Table:C252(->[EW_StepActions:119]))
				: ($l_TableNumber=Table:C252(->[EW_ExportTables:120]))
				: ($l_TableNumber=Table:C252(->[EW_BK_FieldMap:121]))
				: ($l_TableNumber=Table:C252(->[EW_BKFields:122]))
				: ($l_TableNumber=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
				: ($l_TableNumber=Table:C252(->[SMS_Log:124]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[SMS_Log:124]X_ID:8
				: ($l_TableNumber=Table:C252(->[XOrder_revisions:127]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[XOrder_revisions:127]X_ID:1
				: ($l_TableNumber=Table:C252(->[XInvoiceAllocation:126]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[XInvoiceAllocation:126]x_ID:1
				: ($l_TableNumber=Table:C252(->[AddressRecords:125]))
					$b_RecordIDMandatory:=True:C214
					$p_FieldPtr:=->[AddressRecords:125]X_ID:1
			End case 
		End if 
		
	End if 
End if 

$0:=$p_FieldPtr
ERR_MethodTrackerReturn("QV_GetIdField"; $_t_oldMethodName)