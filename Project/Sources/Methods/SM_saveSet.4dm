//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_saveSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    19/01/2011 17:17 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_RecordNumbers;0)
	//ARRAY LONGINT(SM_al_SetContextItemContextID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	//ARRAY TEXT(SM_at_SetContextitemOwnerIDs;0)
	C_LONGINT:C283(<>newSetsProcess; $_l_SettingsRow; $_l_TableContext; $_l_TableNumber; $0; $2)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_saveSet")
//this method will write a set back to [USER_SETS]
//note that this will not do anything to a MACRO associated with a set
//and  it does not verify if the set is of the correct class
USE SET:C118($1)
$0:=0
If (Count parameters:C259>=2)
	$_l_SettingsRow:=Find in array:C230(SM_al_SetitemsID; $2)
	If ($_l_SettingsRow>0)
		$_l_TableContext:=SM_al_SetContextItemContextID{$_l_SettingsRow}
		$_l_TableNumber:=SM_TableFromContextID($_l_TableContext)
		$0:=$_l_TableNumber
		$_Ptr_Table:=Table:C252($_l_TableNumber)
		ARRAY LONGINT:C221(SM_al_RecordNumbers; 0)
		//longint array from selection will not accept a pointer to the table!
		Case of 
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				LONGINT ARRAY FROM SELECTION:C647([CONTACTS:1]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				LONGINT ARRAY FROM SELECTION:C647([COMPANIES:2]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[AREAS:3]))
				LONGINT ARRAY FROM SELECTION:C647([AREAS:3]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				LONGINT ARRAY FROM SELECTION:C647([STATUS:4]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[TYPES:5]))
				LONGINT ARRAY FROM SELECTION:C647([TYPES:5]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
				LONGINT ARRAY FROM SELECTION:C647([SOURCES:6]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
				LONGINT ARRAY FROM SELECTION:C647([DOCUMENTS:7]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
				LONGINT ARRAY FROM SELECTION:C647([PRODUCT_BRANDS:8]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				LONGINT ARRAY FROM SELECTION:C647([PRODUCTS:9]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
				LONGINT ARRAY FROM SELECTION:C647([PRODUCT_GROUPS:10]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
				LONGINT ARRAY FROM SELECTION:C647([PERSONNEL:11]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
				LONGINT ARRAY FROM SELECTION:C647([ACTIONS:13]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
				LONGINT ARRAY FROM SELECTION:C647([RESULTS:14]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[USER:15]))
				LONGINT ARRAY FROM SELECTION:C647([USER:15]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
				LONGINT ARRAY FROM SELECTION:C647([IDENTIFIERS:16]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
				LONGINT ARRAY FROM SELECTION:C647([CONTRACTS:17]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
				LONGINT ARRAY FROM SELECTION:C647([PRICE_GROUPS:18]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
				LONGINT ARRAY FROM SELECTION:C647([CONTRACT_TYPES:19]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
				LONGINT ARRAY FROM SELECTION:C647([SERVICE_CALLS:20]; SM_al_RecordNumbers)
		End case 
		Case of 
				
			: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
				LONGINT ARRAY FROM SELECTION:C647([PROBLEMS:22]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
				LONGINT ARRAY FROM SELECTION:C647([SOLUTIONS:23]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				LONGINT ARRAY FROM SELECTION:C647([ORDERS:24]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
				LONGINT ARRAY FROM SELECTION:C647([ORDER_ITEMS:25]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[JOBS:26]))
				LONGINT ARRAY FROM SELECTION:C647([JOBS:26]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				LONGINT ARRAY FROM SELECTION:C647([STOCK_MOVEMENT_ITEMS:27]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
				LONGINT ARRAY FROM SELECTION:C647([PRICE_TABLE:28]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
				
				LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
				LONGINT ARRAY FROM SELECTION:C647([TRANSACTION_BATCHES:30]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
				LONGINT ARRAY FROM SELECTION:C647([TRANSACTION_BATCH_ITEMS:155]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
				LONGINT ARRAY FROM SELECTION:C647([TRANSACTION_TYPES:31]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
				LONGINT ARRAY FROM SELECTION:C647([ACCOUNTS:32]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
				LONGINT ARRAY FROM SELECTION:C647([PERIODS:33]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
				LONGINT ARRAY FROM SELECTION:C647([ACCOUNT_BALANCES:34]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
				LONGINT ARRAY FROM SELECTION:C647([TAX_CODES:35]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
				LONGINT ARRAY FROM SELECTION:C647([ANALYSES:36]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				LONGINT ARRAY FROM SELECTION:C647([PURCHASE_INVOICES:37]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				LONGINT ARRAY FROM SELECTION:C647([PURCHASE_INVOICE_ITEMS:158]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
				LONGINT ARRAY FROM SELECTION:C647([RECURRING_JOURNALS:38]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				LONGINT ARRAY FROM SELECTION:C647([INVOICES:39]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
				LONGINT ARRAY FROM SELECTION:C647([INVOICES:39]; SM_al_RecordNumbers)
		End case 
		Case of 
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
				LONGINT ARRAY FROM SELECTION:C647([STOCK_MOVEMENTS:40]; SM_al_RecordNumbers)
				
			: ($_l_TableNumber=Table:C252(->[STAGES:45]))
				LONGINT ARRAY FROM SELECTION:C647([STAGES:45]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
				LONGINT ARRAY FROM SELECTION:C647([TIME_BILLING_CATEGORIES:46]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
				LONGINT ARRAY FROM SELECTION:C647([JOB_STAGES:47]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
				LONGINT ARRAY FROM SELECTION:C647([JOB PERSONNEL:48]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
				LONGINT ARRAY FROM SELECTION:C647([TIME_BUDGETS:49]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
				LONGINT ARRAY FROM SELECTION:C647([POSTAL_CODES:50]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
				LONGINT ARRAY FROM SELECTION:C647([WORKFLOW_CONTROL:51]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
				LONGINT ARRAY FROM SELECTION:C647([PUBLICATIONS:52]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
				LONGINT ARRAY FROM SELECTION:C647([ADDITIONAL_RECORD_ANALYSIS:53]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
				LONGINT ARRAY FROM SELECTION:C647([CREDIT_STAGES:54]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
				LONGINT ARRAY FROM SELECTION:C647([INFORMATION:55]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[QUALITY_GROUPS:56]))
				LONGINT ARRAY FROM SELECTION:C647([QUALITY_GROUPS:56]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				LONGINT ARRAY FROM SELECTION:C647([PURCHASE_ORDERS:57]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				LONGINT ARRAY FROM SELECTION:C647([PURCHASE_ORDERS_ITEMS:169]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
				LONGINT ARRAY FROM SELECTION:C647([STOCK_LEVELS:58]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
				LONGINT ARRAY FROM SELECTION:C647([STOCK_TYPES:59]; SM_al_RecordNumbers)
		End case 
		Case of 
			: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
				LONGINT ARRAY FROM SELECTION:C647([MOVEMENT_TYPES:60]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
				LONGINT ARRAY FROM SELECTION:C647([LOCATIONS:61]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
				LONGINT ARRAY FROM SELECTION:C647([CURRENT_STOCK:62]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[MODULES:63]))
				
				LONGINT ARRAY FROM SELECTION:C647([MODULES:63]; SM_al_RecordNumbers)
				
			: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
				LONGINT ARRAY FROM SELECTION:C647([JOB_TYPES:65]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[DELETIONS:66]))
				LONGINT ARRAY FROM SELECTION:C647([DELETIONS:66]; SM_al_RecordNumbers)
				
				
			: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
				LONGINT ARRAY FROM SELECTION:C647([CURRENCIES:71]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
				LONGINT ARRAY FROM SELECTION:C647([CURRENCY_RATES:72]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
				LONGINT ARRAY FROM SELECTION:C647([COUNTRIES:73]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
				LONGINT ARRAY FROM SELECTION:C647([ADDRESS_FORMATS:74]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
				LONGINT ARRAY FROM SELECTION:C647([TERMINOLOGY:75]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
				LONGINT ARRAY FROM SELECTION:C647([LAYERS:76]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[MAILSORT_A:77]))
				LONGINT ARRAY FROM SELECTION:C647([MAILSORT_A:77]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[MAILSORT_B:78]))
				LONGINT ARRAY FROM SELECTION:C647([MAILSORT_B:78]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[MAILSORT_C:79]))
				LONGINT ARRAY FROM SELECTION:C647([MAILSORT_C:79]; SM_al_RecordNumbers)
		End case 
		Case of 
			: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
				LONGINT ARRAY FROM SELECTION:C647([SCRIPTS:80]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[MAILSORT_D5:81]))
				LONGINT ARRAY FROM SELECTION:C647([MAILSORT_D5:81]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[MAILSORT_D6:82]))
				LONGINT ARRAY FROM SELECTION:C647([MAILSORT_D6:82]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[MAILSORT_MAIL:83]))
				LONGINT ARRAY FROM SELECTION:C647([MAILSORT_MAIL:83]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
				LONGINT ARRAY FROM SELECTION:C647([HEADINGS:84]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
				LONGINT ARRAY FROM SELECTION:C647([PICTURES:85]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[COMPONENTS:86]))
				LONGINT ARRAY FROM SELECTION:C647([COMPONENTS:86]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[ROLES:87]))
				LONGINT ARRAY FROM SELECTION:C647([ROLES:87]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
				LONGINT ARRAY FROM SELECTION:C647([CONTRACT_RECORD_ANALYSIS:88]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
				LONGINT ARRAY FROM SELECTION:C647([PROJECTS:89]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
				LONGINT ARRAY FROM SELECTION:C647([TABLE_RECORD_STATES:90]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[CODE_USES:91]))
				LONGINT ARRAY FROM SELECTION:C647([CODE_USES:91]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
				LONGINT ARRAY FROM SELECTION:C647([PERSONNEL_GROUPS:92]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
				LONGINT ARRAY FROM SELECTION:C647([SUBSCRIPTIONS:93]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
				LONGINT ARRAY FROM SELECTION:C647([IDENTIFIERS_MULTI_NUMBERS:94]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[LIST_ITEMS:95]))
				LONGINT ARRAY FROM SELECTION:C647([LIST_ITEMS:95]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
				LONGINT ARRAY FROM SELECTION:C647([LIST_LAYOUTS:96]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[LICENCE_UPDATES:97]))
				LONGINT ARRAY FROM SELECTION:C647([LICENCE_UPDATES:97]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
				LONGINT ARRAY FROM SELECTION:C647([CUSTOM_FIELDS:98]; SM_al_RecordNumbers)
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
				LONGINT ARRAY FROM SELECTION:C647([CUSTOM_FIELD_DEFINITiONS:99]; SM_al_RecordNumbers)
		End case 
		Case of 
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
				LONGINT ARRAY FROM SELECTION:C647([CUSTOM_FIELDS_PERSONNEL:100]; SM_al_RecordNumbers)
			: ($_l_TableNumber=102)
				LONGINT ARRAY FROM SELECTION:C647([DATA_AUDITS:102]; SM_al_RecordNumbers)
			: ($_l_TableNumber=103)
				LONGINT ARRAY FROM SELECTION:C647([EMAIL_ATTACHMENTS:103]; SM_al_RecordNumbers)
			: ($_l_TableNumber=104)
				LONGINT ARRAY FROM SELECTION:C647([EMAIL_RECIPIENTS:104]; SM_al_RecordNumbers)
			: ($_l_TableNumber=105)
				LONGINT ARRAY FROM SELECTION:C647([USER_SETS:105]; SM_al_RecordNumbers)
		End case 
		READ WRITE:C146([USER_SETS:105])
		QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$2)
		If (Records in selection:C76([USER_SETS:105])=0)
			CREATE RECORD:C68([USER_SETS:105])
			[USER_SETS:105]SET_ID:3:=$2
			[USER_SETS:105]USER_INITIALS:2:=SM_at_SetContextitemOwnerIDs{$_l_SettingsRow}
		End if 
		SET BLOB SIZE:C606([USER_SETS:105]SET_BLOB:4; 0)
		VARIABLE TO BLOB:C532(SM_al_RecordNumbers; [USER_SETS:105]SET_BLOB:4)
		
		DB_SaveRecord(->[USER_SETS:105])
		UNLOAD RECORD:C212([USER_SETS:105])
		READ ONLY:C145([USER_SETS:105])
		
	End if 
	If (<>newSetsProcess>0)
		SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_MonitorCall; -2)
		POST OUTSIDE CALL:C329(<>newSetsProcess)
		
	End if 
End if 
ERR_MethodTrackerReturn("SM_saveSet"; $_t_oldMethodName)