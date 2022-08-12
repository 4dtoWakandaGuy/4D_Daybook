//%attributes = {}
If (False:C215)
	//Project Method Name:      SEL_UpdateRecordCache
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     17/05/2010 10:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_LongintArrays; 0)
	//ARRAY LONGINT(DB_al_CurrentSelectionID;0)
	//ARRAY LONGINT(DB_al_CurrentTableSetsRefs;0)
	//ARRAY LONGINT(DB_al_LATableIDS;0)
	//ARRAY LONGINT(DB_al_LongintArrays;0;0)
	//ARRAY LONGINT(DB_al_TableCurrentSelections;0)
	//ARRAY TEXT(DB_at_CurrentSelectionNames;0)
	C_BOOLEAN:C305(DB_bo_CacheIntited)
	C_LONGINT:C283($_l_CurrentSelectionCount; $_l_Index; $_l_MatchCount; $_l_SizeofArray; $_l_TableRow; $1)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_S1Name; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SEL_UpdateRecordCache")
ARRAY LONGINT:C221($_al_LongintArrays; 0)

Case of 
	: ($1=Table:C252(->[CONTACTS:1]))
		LONGINT ARRAY FROM SELECTION:C647([CONTACTS:1]; $_al_LongintArrays)
	: ($1=Table:C252(->[COMPANIES:2]))
		LONGINT ARRAY FROM SELECTION:C647([COMPANIES:2]; $_al_LongintArrays)
	: ($1=Table:C252(->[AREAS:3]))
		LONGINT ARRAY FROM SELECTION:C647([AREAS:3]; $_al_LongintArrays)
	: ($1=Table:C252(->[STATUS:4]))
		LONGINT ARRAY FROM SELECTION:C647([STATUS:4]; $_al_LongintArrays)
	: ($1=Table:C252(->[TYPES:5]))
		LONGINT ARRAY FROM SELECTION:C647([TYPES:5]; $_al_LongintArrays)
	: ($1=Table:C252(->[SOURCES:6]))
		LONGINT ARRAY FROM SELECTION:C647([SOURCES:6]; $_al_LongintArrays)
	: ($1=Table:C252(->[DOCUMENTS:7]))
		LONGINT ARRAY FROM SELECTION:C647([DOCUMENTS:7]; $_al_LongintArrays)
	: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
		LONGINT ARRAY FROM SELECTION:C647([PRODUCT_BRANDS:8]; $_al_LongintArrays)
	: ($1=Table:C252(->[PRODUCTS:9]))
		LONGINT ARRAY FROM SELECTION:C647([PRODUCTS:9]; $_al_LongintArrays)
	: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
		LONGINT ARRAY FROM SELECTION:C647([PRODUCT_GROUPS:10]; $_al_LongintArrays)
	: ($1=Table:C252(->[PERSONNEL:11]))
		LONGINT ARRAY FROM SELECTION:C647([PERSONNEL:11]; $_al_LongintArrays)
	: ($1=Table:C252(->[DIARY:12]))
		LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; $_al_LongintArrays)
	: ($1=Table:C252(->[ACTIONS:13]))
		LONGINT ARRAY FROM SELECTION:C647([ACTIONS:13]; $_al_LongintArrays)
	: ($1=Table:C252(->[RESULTS:14]))
		LONGINT ARRAY FROM SELECTION:C647([RESULTS:14]; $_al_LongintArrays)
	: ($1=Table:C252(->[USER:15]))
		LONGINT ARRAY FROM SELECTION:C647([USER:15]; $_al_LongintArrays)
	: ($1=Table:C252(->[IDENTIFIERS:16]))
		LONGINT ARRAY FROM SELECTION:C647([IDENTIFIERS:16]; $_al_LongintArrays)
	: ($1=Table:C252(->[CONTRACTS:17]))
		LONGINT ARRAY FROM SELECTION:C647([CONTRACTS:17]; $_al_LongintArrays)
	: ($1=Table:C252(->[PRICE_GROUPS:18]))
		LONGINT ARRAY FROM SELECTION:C647([PRICE_GROUPS:18]; $_al_LongintArrays)
	: ($1=Table:C252(->[CONTRACT_TYPES:19]))
		LONGINT ARRAY FROM SELECTION:C647([CONTRACT_TYPES:19]; $_al_LongintArrays)
	: ($1=Table:C252(->[SERVICE_CALLS:20]))
		LONGINT ARRAY FROM SELECTION:C647([SERVICE_CALLS:20]; $_al_LongintArrays)
		
	Else 
		Case of 
			: ($1=Table:C252(->[PROBLEMS:22]))
				LONGINT ARRAY FROM SELECTION:C647([PROBLEMS:22]; $_al_LongintArrays)
			: ($1=Table:C252(->[SOLUTIONS:23]))
				LONGINT ARRAY FROM SELECTION:C647([SOLUTIONS:23]; $_al_LongintArrays)
			: ($1=Table:C252(->[ORDERS:24]))
				LONGINT ARRAY FROM SELECTION:C647([ORDERS:24]; $_al_LongintArrays)
			: ($1=Table:C252(->[ORDER_ITEMS:25]))
				LONGINT ARRAY FROM SELECTION:C647([ORDER_ITEMS:25]; $_al_LongintArrays)
			: ($1=Table:C252(->[JOBS:26]))
				LONGINT ARRAY FROM SELECTION:C647([JOBS:26]; $_al_LongintArrays)
			: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				LONGINT ARRAY FROM SELECTION:C647([STOCK_MOVEMENT_ITEMS:27]; $_al_LongintArrays)
			: ($1=Table:C252(->[PRICE_TABLE:28]))
				LONGINT ARRAY FROM SELECTION:C647([PRICE_TABLE:28]; $_al_LongintArrays)
			: ($1=Table:C252(->[TRANSACTIONS:29]))
				
				LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; $_al_LongintArrays)
			: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
				LONGINT ARRAY FROM SELECTION:C647([TRANSACTION_BATCHES:30]; $_al_LongintArrays)
			: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
				LONGINT ARRAY FROM SELECTION:C647([TRANSACTION_TYPES:31]; $_al_LongintArrays)
			: ($1=Table:C252(->[ACCOUNTS:32]))
				LONGINT ARRAY FROM SELECTION:C647([ACCOUNTS:32]; $_al_LongintArrays)
			: ($1=Table:C252(->[PERIODS:33]))
				LONGINT ARRAY FROM SELECTION:C647([PERIODS:33]; $_al_LongintArrays)
			: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
				LONGINT ARRAY FROM SELECTION:C647([ACCOUNT_BALANCES:34]; $_al_LongintArrays)
			: ($1=Table:C252(->[TAX_CODES:35]))
				LONGINT ARRAY FROM SELECTION:C647([TAX_CODES:35]; $_al_LongintArrays)
			: ($1=Table:C252(->[ANALYSES:36]))
				LONGINT ARRAY FROM SELECTION:C647([ANALYSES:36]; $_al_LongintArrays)
			: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
				LONGINT ARRAY FROM SELECTION:C647([PURCHASE_INVOICES:37]; $_al_LongintArrays)
			: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
				LONGINT ARRAY FROM SELECTION:C647([RECURRING_JOURNALS:38]; $_al_LongintArrays)
			: ($1=Table:C252(->[INVOICES:39]))
				LONGINT ARRAY FROM SELECTION:C647([INVOICES:39]; $_al_LongintArrays)
				
			Else 
				Case of 
					: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
						LONGINT ARRAY FROM SELECTION:C647([STOCK_MOVEMENTS:40]; $_al_LongintArrays)
					: ($1=Table:C252(->[STAGES:45]))
						LONGINT ARRAY FROM SELECTION:C647([STAGES:45]; $_al_LongintArrays)
					: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
						LONGINT ARRAY FROM SELECTION:C647([TIME_BILLING_CATEGORIES:46]; $_al_LongintArrays)
					: ($1=Table:C252(->[JOB_STAGES:47]))
						LONGINT ARRAY FROM SELECTION:C647([JOB_STAGES:47]; $_al_LongintArrays)
					: ($1=Table:C252(->[JOB PERSONNEL:48]))
						LONGINT ARRAY FROM SELECTION:C647([JOB PERSONNEL:48]; $_al_LongintArrays)
					: ($1=Table:C252(->[TIME_BUDGETS:49]))
						LONGINT ARRAY FROM SELECTION:C647([TIME_BUDGETS:49]; $_al_LongintArrays)
					: ($1=Table:C252(->[POSTAL_CODES:50]))
						LONGINT ARRAY FROM SELECTION:C647([POSTAL_CODES:50]; $_al_LongintArrays)
					: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
						LONGINT ARRAY FROM SELECTION:C647([WORKFLOW_CONTROL:51]; $_al_LongintArrays)
					: ($1=Table:C252(->[PUBLICATIONS:52]))
						LONGINT ARRAY FROM SELECTION:C647([PUBLICATIONS:52]; $_al_LongintArrays)
					: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
						LONGINT ARRAY FROM SELECTION:C647([ADDITIONAL_RECORD_ANALYSIS:53]; $_al_LongintArrays)
					: ($1=Table:C252(->[CREDIT_STAGES:54]))
						LONGINT ARRAY FROM SELECTION:C647([CREDIT_STAGES:54]; $_al_LongintArrays)
					: ($1=Table:C252(->[INFORMATION:55]))
						LONGINT ARRAY FROM SELECTION:C647([INFORMATION:55]; $_al_LongintArrays)
					: ($1=Table:C252(->[QUALITY_GROUPS:56]))
						LONGINT ARRAY FROM SELECTION:C647([QUALITY_GROUPS:56]; $_al_LongintArrays)
					: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
						LONGINT ARRAY FROM SELECTION:C647([PURCHASE_ORDERS:57]; $_al_LongintArrays)
					: ($1=Table:C252(->[STOCK_LEVELS:58]))
						LONGINT ARRAY FROM SELECTION:C647([STOCK_LEVELS:58]; $_al_LongintArrays)
					: ($1=Table:C252(->[STOCK_TYPES:59]))
						LONGINT ARRAY FROM SELECTION:C647([STOCK_TYPES:59]; $_al_LongintArrays)
						
					Else 
						Case of 
							: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
								LONGINT ARRAY FROM SELECTION:C647([MOVEMENT_TYPES:60]; $_al_LongintArrays)
							: ($1=Table:C252(->[LOCATIONS:61]))
								LONGINT ARRAY FROM SELECTION:C647([LOCATIONS:61]; $_al_LongintArrays)
							: ($1=Table:C252(->[CURRENT_STOCK:62]))
								LONGINT ARRAY FROM SELECTION:C647([CURRENT_STOCK:62]; $_al_LongintArrays)
							: ($1=Table:C252(->[MODULES:63]))
								LONGINT ARRAY FROM SELECTION:C647([MODULES:63]; $_al_LongintArrays)
							: ($1=Table:C252(->[JOB_TYPES:65]))
								LONGINT ARRAY FROM SELECTION:C647([JOB_TYPES:65]; $_al_LongintArrays)
							: ($1=Table:C252(->[DELETIONS:66]))
								LONGINT ARRAY FROM SELECTION:C647([DELETIONS:66]; $_al_LongintArrays)
								
							: ($1=Table:C252(->[CURRENCIES:71]))
								LONGINT ARRAY FROM SELECTION:C647([CURRENCIES:71]; $_al_LongintArrays)
							: ($1=Table:C252(->[CURRENCY_RATES:72]))
								LONGINT ARRAY FROM SELECTION:C647([CURRENCY_RATES:72]; $_al_LongintArrays)
							: ($1=Table:C252(->[COUNTRIES:73]))
								LONGINT ARRAY FROM SELECTION:C647([COUNTRIES:73]; $_al_LongintArrays)
							: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
								LONGINT ARRAY FROM SELECTION:C647([ADDRESS_FORMATS:74]; $_al_LongintArrays)
							: ($1=Table:C252(->[TERMINOLOGY:75]))
								LONGINT ARRAY FROM SELECTION:C647([TERMINOLOGY:75]; $_al_LongintArrays)
							: ($1=Table:C252(->[LAYERS:76]))
								LONGINT ARRAY FROM SELECTION:C647([LAYERS:76]; $_al_LongintArrays)
							: ($1=Table:C252(->[MAILSORT_A:77]))
								LONGINT ARRAY FROM SELECTION:C647([MAILSORT_A:77]; $_al_LongintArrays)
							: ($1=Table:C252(->[MAILSORT_B:78]))
								LONGINT ARRAY FROM SELECTION:C647([MAILSORT_B:78]; $_al_LongintArrays)
							: ($1=Table:C252(->[MAILSORT_C:79]))
								LONGINT ARRAY FROM SELECTION:C647([MAILSORT_C:79]; $_al_LongintArrays)
							Else 
								Case of 
									: ($1=Table:C252(->[SCRIPTS:80]))
										LONGINT ARRAY FROM SELECTION:C647([SCRIPTS:80]; $_al_LongintArrays)
									: ($1=Table:C252(->[MAILSORT_D5:81]))
										LONGINT ARRAY FROM SELECTION:C647([MAILSORT_D5:81]; $_al_LongintArrays)
									: ($1=Table:C252(->[MAILSORT_D6:82]))
										LONGINT ARRAY FROM SELECTION:C647([MAILSORT_D6:82]; $_al_LongintArrays)
									: ($1=Table:C252(->[MAILSORT_MAIL:83]))
										LONGINT ARRAY FROM SELECTION:C647([MAILSORT_MAIL:83]; $_al_LongintArrays)
									: ($1=Table:C252(->[HEADINGS:84]))
										LONGINT ARRAY FROM SELECTION:C647([HEADINGS:84]; $_al_LongintArrays)
									: ($1=Table:C252(->[PICTURES:85]))
										LONGINT ARRAY FROM SELECTION:C647([PICTURES:85]; $_al_LongintArrays)
									: ($1=Table:C252(->[COMPONENTS:86]))
										LONGINT ARRAY FROM SELECTION:C647([COMPONENTS:86]; $_al_LongintArrays)
									: ($1=Table:C252(->[ROLES:87]))
										LONGINT ARRAY FROM SELECTION:C647([ROLES:87]; $_al_LongintArrays)
									: ($1=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
										LONGINT ARRAY FROM SELECTION:C647([CONTRACT_RECORD_ANALYSIS:88]; $_al_LongintArrays)
									: ($1=Table:C252(->[PROJECTS:89]))
										LONGINT ARRAY FROM SELECTION:C647([PROJECTS:89]; $_al_LongintArrays)
									: ($1=Table:C252(->[TABLE_RECORD_STATES:90]))
										LONGINT ARRAY FROM SELECTION:C647([TABLE_RECORD_STATES:90]; $_al_LongintArrays)
									: ($1=Table:C252(->[CODE_USES:91]))
										LONGINT ARRAY FROM SELECTION:C647([CODE_USES:91]; $_al_LongintArrays)
									: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
										LONGINT ARRAY FROM SELECTION:C647([PERSONNEL_GROUPS:92]; $_al_LongintArrays)
									: ($1=Table:C252(->[SUBSCRIPTIONS:93]))
										LONGINT ARRAY FROM SELECTION:C647([SUBSCRIPTIONS:93]; $_al_LongintArrays)
									: ($1=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
										LONGINT ARRAY FROM SELECTION:C647([IDENTIFIERS_MULTI_NUMBERS:94]; $_al_LongintArrays)
									: ($1=Table:C252(->[LIST_ITEMS:95]))
										LONGINT ARRAY FROM SELECTION:C647([LIST_ITEMS:95]; $_al_LongintArrays)
									: ($1=Table:C252(->[LIST_LAYOUTS:96]))
										LONGINT ARRAY FROM SELECTION:C647([LIST_LAYOUTS:96]; $_al_LongintArrays)
									: ($1=Table:C252(->[LICENCE_UPDATES:97]))
										LONGINT ARRAY FROM SELECTION:C647([LICENCE_UPDATES:97]; $_al_LongintArrays)
									: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
										LONGINT ARRAY FROM SELECTION:C647([CUSTOM_FIELDS:98]; $_al_LongintArrays)
									: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
										LONGINT ARRAY FROM SELECTION:C647([CUSTOM_FIELD_DEFINITiONS:99]; $_al_LongintArrays)
									Else 
										Case of 
											: ($1=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
												LONGINT ARRAY FROM SELECTION:C647([CUSTOM_FIELDS_PERSONNEL:100]; $_al_LongintArrays)
											: ($1=Table:C252(->[X_URL_LInks:101]))
												LONGINT ARRAY FROM SELECTION:C647([X_URL_LInks:101]; $_al_LongintArrays)
											: ($1=Table:C252(->[DATA_AUDITS:102]))
												LONGINT ARRAY FROM SELECTION:C647([DATA_AUDITS:102]; $_al_LongintArrays)
											: ($1=Table:C252(->[EMAIL_ATTACHMENTS:103]))
												LONGINT ARRAY FROM SELECTION:C647([EMAIL_ATTACHMENTS:103]; $_al_LongintArrays)
											: ($1=Table:C252(->[EMAIL_RECIPIENTS:104]))
												LONGINT ARRAY FROM SELECTION:C647([EMAIL_RECIPIENTS:104]; $_al_LongintArrays)
											: ($1=Table:C252(->[USER_SETS:105]))
												LONGINT ARRAY FROM SELECTION:C647([USER_SETS:105]; $_al_LongintArrays)
											: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
												LONGINT ARRAY FROM SELECTION:C647([PURCHASE_ORDERS_ITEMS:169]; $_al_LongintArrays)
											: ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
												LONGINT ARRAY FROM SELECTION:C647([PURCHASE_INVOICE_ITEMS:158]; $_al_LongintArrays)
											: ($1=Table:C252(->[INVOICES_ITEMS:161]))
												LONGINT ARRAY FROM SELECTION:C647([INVOICES_ITEMS:161]; $_al_LongintArrays)
										End case 
								End case 
						End case 
				End case 
		End case 
End case 
If (Not:C34(DB_bo_CacheIntited))
	ARRAY LONGINT:C221(DB_al_TableCurrentSelections; 0)  //this array give us a reference for any table which is loaded in the window to find the name of the current selection
	ARRAY TEXT:C222(DB_at_CurrentSelectionNames; 0)
	ARRAY LONGINT:C221(DB_al_CurrentSelectionID; 0)  //this array contains the ROW of the current loaded selection-essential for going to next selection
	ARRAY LONGINT:C221(DB_al_CurrentTableSetsRefs; 0)  //this is an array for the current table f the references in the 2D array of the selections so that selectionNavigationcan happen
	ARRAY LONGINT:C221(DB_al_LongintArrays; 0; 0)  //these contain in each row a selection of records loaded using selection to longint array
	ARRAY LONGINT:C221(DB_al_LATableIDS; 0)  //this corresponds to the above giving a table number for the row
	DB_bo_CacheIntited:=True:C214
End if 
$_l_MatchCount:=0
//TRACE
For ($_l_Index; 1; Size of array:C274(DB_al_LongintArrays))
	If (DB_al_LATableIDS{$_l_Index}=$1)  //This is for the correct table
		If (Size of array:C274(DB_al_LongintArrays{$_l_Index})=Size of array:C274($_al_LongintArrays))
			//
			$_Ptr_Table:=Table:C252($1)
			COPY NAMED SELECTION:C331($_Ptr_Table->; "$Temp")
			CREATE SET:C116($_Ptr_Table->; "$TempSet")
			CREATE SET FROM ARRAY:C641($_Ptr_Table->; DB_al_LongintArrays{$_l_Index}; "$TempSet2")
			USE SET:C118("$TempSet2")
			DIFFERENCE:C122("$TempSet"; "$TempSet2"; "$TempSet3")
			If (Records in set:C195("$tempset3")>0)
				//there are some changed records
				$_l_MatchCount:=Size of array:C274(DB_al_LongintArrays{$_l_Index})-Records in set:C195("$Tempset3")
			Else 
				$_l_MatchCount:=Size of array:C274(DB_al_LongintArrays{$_l_Index})
			End if 
			//The number of records is the same
			If ($_l_MatchCount=Size of array:C274(DB_al_LongintArrays{$_l_Index}))
				//its is a match
				$_l_TableRow:=Find in array:C230(DB_al_TableCurrentSelections; $1)
				If ($_l_TableRow<0)
					APPEND TO ARRAY:C911(DB_al_TableCurrentSelections; $1)
					APPEND TO ARRAY:C911(DB_al_CurrentSelectionID; 0)
					$_l_TableRow:=Size of array:C274(DB_al_CurrentSelectionID)
				End if 
				DB_al_CurrentSelectionID{$_l_TableRow}:=$_l_Index  //the row of the current selection
				
				$_l_Index:=Size of array:C274(DB_al_LongintArrays)
			End if 
			USE NAMED SELECTION:C332("$Temp")
		End if 
		
	End if 
End for 
If ($_l_MatchCount#Size of array:C274($_al_LongintArrays))
	//This is a new selection add to the cache
	$_l_SizeofArray:=Size of array:C274(DB_al_LongintArrays)
	INSERT IN ARRAY:C227(DB_al_LongintArrays; $_l_SizeofArray+1; 1)
	$_l_SizeofArray:=Size of array:C274(DB_al_LongintArrays)
	COPY ARRAY:C226($_al_LongintArrays; DB_al_LongintArrays{$_l_SizeofArray})
	$_t_S1Name:=Table name:C256($1)
	If (Count parameters:C259>=2)
		$_t_S1Name:=$2  //may have to coerse this string
	End if 
	$_l_CurrentSelectionCount:=Size of array:C274(DB_al_CurrentTableSetsRefs)
	APPEND TO ARRAY:C911(DB_al_LATableIDS; $1)
	APPEND TO ARRAY:C911(DB_at_CurrentSelectionNames; "Selection "+String:C10($_l_CurrentSelectionCount)+"of "+$_t_S1Name)
	APPEND TO ARRAY:C911(DB_al_CurrentTableSetsRefs; $_l_SizeofArray)
	$_l_TableRow:=Find in array:C230(DB_al_TableCurrentSelections; $1)
	If ($_l_TableRow<0)
		APPEND TO ARRAY:C911(DB_al_TableCurrentSelections; $1)
		APPEND TO ARRAY:C911(DB_al_CurrentSelectionID; 0)
		$_l_TableRow:=Size of array:C274(DB_al_CurrentSelectionID)
	End if 
	DB_al_CurrentSelectionID{$_l_TableRow}:=Size of array:C274(DB_al_CurrentTableSetsRefs)  //the row of the current selection
	
End if 
ERR_MethodTrackerReturn("SEL_UpdateRecordCache"; $_t_oldMethodName)
