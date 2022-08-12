//%attributes = {}
If (False:C215)
	//Project Method Name: 
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 21:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CodeFieldNumber; $_l_TableNumber; $0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_GetCodeFieldNum")
//This method will return the field number of the ID Field(now called from AA_CheckFileID

If (Count parameters:C259>=1)
	$_l_TableNumber:=$1
	$_l_CodeFieldNumber:=0
	If ($_l_TableNumber>0)
		Case of 
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				$_l_CodeFieldNumber:=Field:C253(->[CONTACTS:1]Contact_Code:2)
				
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				$_l_CodeFieldNumber:=Field:C253(->[COMPANIES:2]Company_Code:1)
			: ($_l_TableNumber=Table:C252(->[AREAS:3]))
				$_l_CodeFieldNumber:=Field:C253(->[AREAS:3]Area_Code:1)
			: ($_l_TableNumber=Table:C252(->[STATUS:4]))
				$_l_CodeFieldNumber:=Field:C253(->[STATUS:4]Status_Code:1)
			: ($_l_TableNumber=Table:C252(->[TYPES:5]))
				$_l_CodeFieldNumber:=Field:C253(->[TYPES:5]Type_Code:1)
			: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
				$_l_CodeFieldNumber:=Field:C253(->[SOURCES:6]Source_Code:1)
			: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
				
				$_l_CodeFieldNumber:=Field:C253(->[DOCUMENTS:7]Document_Code:1)
			: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
				$_l_CodeFieldNumber:=Field:C253(->[PRODUCT_BRANDS:8]Brand_Code:1)
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				$_l_CodeFieldNumber:=Field:C253(->[PRODUCTS:9]Product_Code:1)
			: ($_l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
				$_l_CodeFieldNumber:=Field:C253(->[PRODUCT_GROUPS:10]Group_Code:1)
			: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
				$_l_CodeFieldNumber:=Field:C253(->[PERSONNEL:11]Initials:1)
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				$_l_CodeFieldNumber:=Field:C253(->[DIARY:12]Diary_Code:3)
			: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
				$_l_CodeFieldNumber:=Field:C253(->[ACTIONS:13]Action_Code:1)
			: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
				$_l_CodeFieldNumber:=Field:C253(->[RESULTS:14]Result_Code:1)
			: ($_l_TableNumber=Table:C252(->[USER:15]))
				
			: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
				
			: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
				$_l_CodeFieldNumber:=Field:C253(->[CONTRACTS:17]Contract_Code:3)
			: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
				
			: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
				$_l_CodeFieldNumber:=Field:C253(->[CONTRACT_TYPES:19]Contract_Type_Code:1)
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
				$_l_CodeFieldNumber:=Field:C253(->[SERVICE_CALLS:20]Call_Code:4)
			: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
				$_l_CodeFieldNumber:=Field:C253(->[PROBLEMS:22]Problem_Code:1)
			: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
				$_l_CodeFieldNumber:=Field:C253(->[SOLUTIONS:23]Solution_Code:1)
				
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				$_l_CodeFieldNumber:=Field:C253(->[ORDERS:24]Order_Code:3)
				
			: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
				//$_l_CodeFieldNumber:=Field(->[ORDER ITEMS]Item Number)
			: ($_l_TableNumber=Table:C252(->[JOBS:26]))
				$_l_CodeFieldNumber:=Field:C253(->[JOBS:26]Job_Code:1)
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				//$_l_CodeFieldNumber:=Field(->[STOCK ITEMS]x_ID)
			: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
				$_l_CodeFieldNumber:=Field:C253(->[PRICE_TABLE:28]Price_Code:2)
			: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
				//$_l_CodeFieldNumber:=Field(->[TRANSACTIONS]Transaction_ID)
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
				//NG this should have
				//$_l_CodeFieldNumber:=Field(->[TRANS IN]PROBLEM Code)
				//IT IS A NUMERIC FIELD!!
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
				$_l_CodeFieldNumber:=Field:C253(->[TRANSACTION_TYPES:31]Transaction_Type_Code:1)
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
				$_l_CodeFieldNumber:=Field:C253(->[ACCOUNTS:32]Account_Code:2)
			: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
				$_l_CodeFieldNumber:=Field:C253(->[PERIODS:33]Period_Code:1)
			: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
				//$_l_CodeFieldNumber:=Field(->[ACC BALANCES]x_ID)
			: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
				$_l_CodeFieldNumber:=Field:C253(->[TAX_CODES:35]Tax_Code:1)
			: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
				$_l_CodeFieldNumber:=Field:C253(->[ANALYSES:36]Analysis_Code:1)
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				$_l_CodeFieldNumber:=Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1)
			: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
				
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				$_l_CodeFieldNumber:=Field:C253(->[INVOICES:39]Invoice_Number:1)
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
				//NG This should have
				$_l_CodeFieldNumber:=Field:C253(->[STOCK_MOVEMENTS:40]Movement_Code:1)
		End case 
		Case of 
				
				
			: ($_l_TableNumber=Table:C252(->[STAGES:45]))
				$_l_CodeFieldNumber:=Field:C253(->[STAGES:45]Stage_Code:1)
			: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
				$_l_CodeFieldNumber:=Field:C253(->[TIME_BILLING_CATEGORIES:46]Category_Code:1)
			: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
				$_l_CodeFieldNumber:=Field:C253(->[JOB_STAGES:47]Job_Stage_code:52)
			: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
				$_l_CodeFieldNumber:=Field:C253(->[JOB PERSONNEL:48]Job_Personnel_Code:18)
			: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
				
			: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
				
			: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
				$_l_CodeFieldNumber:=Field:C253(->[WORKFLOW_CONTROL:51]WFControl_Code:10)
			: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
				$_l_CodeFieldNumber:=Field:C253(->[PUBLICATIONS:52]Publication_Code:1)
			: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
				$_l_CodeFieldNumber:=Field:C253(->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1)
			: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
				$_l_CodeFieldNumber:=Field:C253(->[CREDIT_STAGES:54]Stage_Code:1)
			: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
				
			: ($_l_TableNumber=Table:C252(->[QUALITY_GROUPS:56]))
				
				
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				$_l_CodeFieldNumber:=Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
			: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
				
			: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
				$_l_CodeFieldNumber:=Field:C253(->[STOCK_TYPES:59]Type_Code:1)
			: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
				$_l_CodeFieldNumber:=Field:C253(->[MOVEMENT_TYPES:60]Type_Code:1)
			: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
				$_l_CodeFieldNumber:=Field:C253(->[LOCATIONS:61]Location_Code:1)
			: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
				
			: ($_l_TableNumber=Table:C252(->[MODULES:63]))
				
				
			: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
				$_l_CodeFieldNumber:=Field:C253(->[JOB_TYPES:65]Type_Code:1)
			: ($_l_TableNumber=Table:C252(->[DELETIONS:66]))
				
				
			: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
				$_l_CodeFieldNumber:=Field:C253(->[CURRENCIES:71]Currency_Code:1)
			: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
				
				
			: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
				$_l_CodeFieldNumber:=Field:C253(->[COUNTRIES:73]COUNTRY_CODE:1)
			: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
				$_l_CodeFieldNumber:=Field:C253(->[ADDRESS_FORMATS:74]Format_Code:1)
			: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
				$_l_CodeFieldNumber:=Field:C253(->[TERMINOLOGY:75]Terminology_Code:1)
			: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
				$_l_CodeFieldNumber:=Field:C253(->[LAYERS:76]Layer_Code:1)
			: ($_l_TableNumber=Table:C252(->[MAILSORT_A:77]))
				
			: ($_l_TableNumber=Table:C252(->[MAILSORT_B:78]))
				
			: ($_l_TableNumber=Table:C252(->[MAILSORT_C:79]))
				
		End case 
		Case of 
			: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
				$_l_CodeFieldNumber:=Field:C253(->[SCRIPTS:80]Script_Code:1)
			: ($_l_TableNumber=Table:C252(->[MAILSORT_D5:81]))
				
			: ($_l_TableNumber=Table:C252(->[MAILSORT_D6:82]))
				
			: ($_l_TableNumber=Table:C252(->[MAILSORT_MAIL:83]))
				
			: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
				$_l_CodeFieldNumber:=Field:C253(->[HEADINGS:84]Heading_Code:1)
			: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
				$_l_CodeFieldNumber:=Field:C253(->[PICTURES:85]Picture_Code:1)
			: ($_l_TableNumber=Table:C252(->[COMPONENTS:86]))
				$_l_CodeFieldNumber:=Field:C253(->[COMPONENTS:86]Component_Code:2)
			: ($_l_TableNumber=Table:C252(->[ROLES:87]))
				$_l_CodeFieldNumber:=Field:C253(->[ROLES:87]Role_Code:1)
			: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
			: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
				$_l_CodeFieldNumber:=Field:C253(->[PROJECTS:89]Project_Code:1)
			: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
				
			: ($_l_TableNumber=Table:C252(->[CODE_USES:91]))
				
			: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
				$_l_CodeFieldNumber:=Field:C253(->[PERSONNEL_GROUPS:92]Group_Code:1)
			: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
				
			: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
				
			: ($_l_TableNumber=Table:C252(->[LIST_ITEMS:95]))
				
			: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
				
			: ($_l_TableNumber=Table:C252(->[LICENCE_UPDATES:97]))
				
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
				
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
				
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
				
			: ($_l_TableNumber=Table:C252(->[X_URL_LInks:101]))
				
			: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
				
			: ($_l_TableNumber=Table:C252(->[EMAIL_ATTACHMENTS:103]))
				
			: ($_l_TableNumber=Table:C252(->[EMAIL_RECIPIENTS:104]))
				
			: ($_l_TableNumber=Table:C252(->[USER_SETS:105]))
				
				
			: ($_l_TableNumber=Table:C252(->[DIARY_ITEMOWNERS:106]))
				
			: ($_l_TableNumber=Table:C252(->[SD_Settings:107]))
				
			: ($_l_TableNumber=Table:C252(->[CATALOGUE:108]))
				
			: ($_l_TableNumber=Table:C252(->[Catalogue_ProductLink:109]))
				
			: ($_l_TableNumber=Table:C252(->[Catalogue_Availability:110]))
				
			: ($_l_TableNumber=Table:C252(->[X_LISTS:111]))
				
			: ($_l_TableNumber=Table:C252(->[x_ListUsage:112]))
				
			: ($_l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
				
			: ($_l_TableNumber=Table:C252(->[SALES_ProjectionLinks:114]))
				
			: ($_l_TableNumber=Table:C252(->[PROCESSES_TO_HANDLE:115]))
				
			: ($_l_TableNumber=Table:C252(->[PREFERENCES:116]))
				
			: ($_l_TableNumber=Table:C252(->[EW_ExportProjects:117]))
				
			: ($_l_TableNumber=Table:C252(->[EW_ExportSteps:118]))
				
			: ($_l_TableNumber=Table:C252(->[EW_StepActions:119]))
				
			: ($_l_TableNumber=Table:C252(->[EW_ExportTables:120]))
			: ($_l_TableNumber=Table:C252(->[EW_BK_FieldMap:121]))
			: ($_l_TableNumber=Table:C252(->[EW_BKFields:122]))
			: ($_l_TableNumber=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
				
			: ($_l_TableNumber=Table:C252(->[SMS_Log:124]))
				
			: ($_l_TableNumber=Table:C252(->[XOrder_revisions:127]))
				
			: ($_l_TableNumber=Table:C252(->[XInvoiceAllocation:126]))
				
			: ($_l_TableNumber=Table:C252(->[AddressRecords:125]))
				
			: ($_l_TableNumber=Table:C252(->[xSynch:139]))
				
			: ($_l_TableNumber=Table:C252(->[x_QUERY_PARAMETERS:134]))
				
			: ($_l_TableNumber=Table:C252(->[XReportsExecutor:135]))
				
			: ($_l_TableNumber=Table:C252(->[xCreditCardDetails:132]))
				
			: ($_l_TableNumber=Table:C252(->[WEB_ACCESS:130]))
				
			: ($_l_TableNumber=Table:C252(->[TRANS_MULTI:128]))
				
		End case 
	End if 
Else 
	$_l_CodeFieldNumber:=0
End if 
$0:=$_l_CodeFieldNumber
ERR_MethodTrackerReturn("AA_GetCodeFieldNum"; $_t_oldMethodName)