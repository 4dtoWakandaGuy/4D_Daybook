//%attributes = {}
If (False:C215)
	//Project Method Name:      Cache_Update
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/02/2010 15:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WS_al_CachedSelection;0)
	//ARRAY TEXT(WS_at_CachedSelectionName;0)
	C_DATE:C307($2; $3)
	C_LONGINT:C283($_l_CacheTable; $_l_TableNumber; $1; CAC_l_Table; WS_l_CachedSelectionName; WS_l_CachedSelectionNUmber)
	C_POINTER:C301($_ptr_Table; $5; $6; $7; $8)
	C_TEXT:C284($_t_oldMethodName; $4)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Cache_Update")

//Cache_Update
$_l_CacheTable:=0
If (CAC_l_Table>0)
	$_l_CacheTable:=CAC_l_Table
Else 
	//$_l_CacheTable:=Table(Current default table)
End if 
CAC_l_Table:=0  //has to be reset on each call-sorry
If ($_l_CacheTable>0)
	$_ptr_Table:=Table:C252($_l_CacheTable)
	$_t_oldMethodName:=ERR_MethodTracker("Cache_Update"; 0; String:C10($_l_CacheTable))
	
	If (Records in selection:C76($_ptr_Table->)>0)
		
		
		If (Size of array:C274(WS_al_CachedSelection)=50)
			DELETE FROM ARRAY:C228(WS_al_CachedSelection; 1; 1)
			DELETE FROM ARRAY:C228(WS_at_CachedSelectionName; 1; 1)
			If (Count parameters:C259>=1)
				//we want some additional information
				//this is used in the superdiary at the moment
				//  $1=page number
				//$2=Start date
				//$3=Finish date
				// $4=Pointer to where to put page
				//$5=pointer to where to put start date
				//$5=pointer to where to put end date
				DELETE FROM ARRAY:C228($8->; 1; 1)
				DELETE FROM ARRAY:C228($5->; 1; 1)
				DELETE FROM ARRAY:C228($6->; 1; 1)
				DELETE FROM ARRAY:C228($7->; 1; 1)
			End if 
			//$LASTNUM:=1
		End if 
		WS_l_CachedSelectionNUmber:=WS_l_CachedSelectionNUmber+1
		
		INSERT IN ARRAY:C227(WS_al_CachedSelection; 9999; 1)
		//INSERT IN ARRAY(WS_at_CachedSelectionName;9999;1)
		
		APPEND TO ARRAY:C911(WS_at_CachedSelectionName; "Selection Nº"+String:C10(WS_l_CachedSelectionNUmber))
		//WS_at_CachedSelectionName{Size of array(WS_at_CachedSelectionName)}:="Selection Nº"+String(WS_l_CachedSelectionNUmber)
		WS_l_CachedSelectionName:=Size of array:C274(WS_at_CachedSelectionName)
		//$_Ptr_Table:=Current default table
		$_l_TableNumber:=$_l_CacheTable
		//Table($_ptr_Table)
		//```cant do the next bit generically
		
		Case of 
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				LONGINT ARRAY FROM SELECTION:C647([CONTACTS:1]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				LONGINT ARRAY FROM SELECTION:C647([COMPANIES:2]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[AREAS:3]))
				LONGINT ARRAY FROM SELECTION:C647([AREAS:3]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[STATUS:4]))
				LONGINT ARRAY FROM SELECTION:C647([STATUS:4]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[TYPES:5]))
				LONGINT ARRAY FROM SELECTION:C647([TYPES:5]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
				LONGINT ARRAY FROM SELECTION:C647([SOURCES:6]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
				LONGINT ARRAY FROM SELECTION:C647([DOCUMENTS:7]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
				LONGINT ARRAY FROM SELECTION:C647([PRODUCT_BRANDS:8]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
				LONGINT ARRAY FROM SELECTION:C647([PRODUCTS:9]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
				LONGINT ARRAY FROM SELECTION:C647([PRODUCT_GROUPS:10]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
				LONGINT ARRAY FROM SELECTION:C647([PERSONNEL:11]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
				LONGINT ARRAY FROM SELECTION:C647([ACTIONS:13]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
				LONGINT ARRAY FROM SELECTION:C647([RESULTS:14]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[USER:15]))
				LONGINT ARRAY FROM SELECTION:C647([USER:15]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
				LONGINT ARRAY FROM SELECTION:C647([IDENTIFIERS:16]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
				LONGINT ARRAY FROM SELECTION:C647([CONTRACTS:17]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
				LONGINT ARRAY FROM SELECTION:C647([PRICE_GROUPS:18]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
				LONGINT ARRAY FROM SELECTION:C647([CONTRACT_TYPES:19]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
				LONGINT ARRAY FROM SELECTION:C647([SERVICE_CALLS:20]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
				
			Else 
				Case of 
					: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
						LONGINT ARRAY FROM SELECTION:C647([PROBLEMS:22]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
						LONGINT ARRAY FROM SELECTION:C647([SOLUTIONS:23]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
						LONGINT ARRAY FROM SELECTION:C647([ORDERS:24]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
						LONGINT ARRAY FROM SELECTION:C647([ORDER_ITEMS:25]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[JOBS:26]))
						LONGINT ARRAY FROM SELECTION:C647([JOBS:26]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
						LONGINT ARRAY FROM SELECTION:C647([STOCK_MOVEMENT_ITEMS:27]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
						LONGINT ARRAY FROM SELECTION:C647([PRICE_TABLE:28]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
						
						LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
						LONGINT ARRAY FROM SELECTION:C647([TRANSACTION_BATCHES:30]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
						LONGINT ARRAY FROM SELECTION:C647([TRANSACTION_TYPES:31]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
						LONGINT ARRAY FROM SELECTION:C647([ACCOUNTS:32]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
						LONGINT ARRAY FROM SELECTION:C647([PERIODS:33]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
						LONGINT ARRAY FROM SELECTION:C647([ACCOUNT_BALANCES:34]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
						LONGINT ARRAY FROM SELECTION:C647([TAX_CODES:35]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
						LONGINT ARRAY FROM SELECTION:C647([ANALYSES:36]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
						LONGINT ARRAY FROM SELECTION:C647([PURCHASE_INVOICES:37]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
						LONGINT ARRAY FROM SELECTION:C647([RECURRING_JOURNALS:38]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
					: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
						LONGINT ARRAY FROM SELECTION:C647([INVOICES:39]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
						
					Else 
						Case of 
							: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
								LONGINT ARRAY FROM SELECTION:C647([STOCK_MOVEMENTS:40]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[STAGES:45]))
								LONGINT ARRAY FROM SELECTION:C647([STAGES:45]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
								LONGINT ARRAY FROM SELECTION:C647([TIME_BILLING_CATEGORIES:46]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
								LONGINT ARRAY FROM SELECTION:C647([JOB_STAGES:47]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
								LONGINT ARRAY FROM SELECTION:C647([JOB PERSONNEL:48]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
								LONGINT ARRAY FROM SELECTION:C647([TIME_BUDGETS:49]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
								LONGINT ARRAY FROM SELECTION:C647([POSTAL_CODES:50]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
								LONGINT ARRAY FROM SELECTION:C647([WORKFLOW_CONTROL:51]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
								LONGINT ARRAY FROM SELECTION:C647([PUBLICATIONS:52]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
								LONGINT ARRAY FROM SELECTION:C647([ADDITIONAL_RECORD_ANALYSIS:53]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
								LONGINT ARRAY FROM SELECTION:C647([CREDIT_STAGES:54]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
								LONGINT ARRAY FROM SELECTION:C647([INFORMATION:55]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[QUALITY_GROUPS:56]))
								LONGINT ARRAY FROM SELECTION:C647([QUALITY_GROUPS:56]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
								LONGINT ARRAY FROM SELECTION:C647([PURCHASE_ORDERS:57]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
								LONGINT ARRAY FROM SELECTION:C647([STOCK_LEVELS:58]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
							: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
								LONGINT ARRAY FROM SELECTION:C647([STOCK_TYPES:59]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
								
							Else 
								Case of 
									: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
										LONGINT ARRAY FROM SELECTION:C647([MOVEMENT_TYPES:60]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
										LONGINT ARRAY FROM SELECTION:C647([LOCATIONS:61]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
										LONGINT ARRAY FROM SELECTION:C647([CURRENT_STOCK:62]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[MODULES:63]))
										LONGINT ARRAY FROM SELECTION:C647([MODULES:63]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
										LONGINT ARRAY FROM SELECTION:C647([JOB_TYPES:65]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[DELETIONS:66]))
										LONGINT ARRAY FROM SELECTION:C647([DELETIONS:66]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
										
									: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
										LONGINT ARRAY FROM SELECTION:C647([CURRENCIES:71]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
										LONGINT ARRAY FROM SELECTION:C647([CURRENCY_RATES:72]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
										LONGINT ARRAY FROM SELECTION:C647([COUNTRIES:73]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
										LONGINT ARRAY FROM SELECTION:C647([ADDRESS_FORMATS:74]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
										LONGINT ARRAY FROM SELECTION:C647([TERMINOLOGY:75]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
										LONGINT ARRAY FROM SELECTION:C647([LAYERS:76]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[MAILSORT_A:77]))
										LONGINT ARRAY FROM SELECTION:C647([MAILSORT_A:77]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[MAILSORT_B:78]))
										LONGINT ARRAY FROM SELECTION:C647([MAILSORT_B:78]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									: ($_l_TableNumber=Table:C252(->[MAILSORT_C:79]))
										LONGINT ARRAY FROM SELECTION:C647([MAILSORT_C:79]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
									Else 
										Case of 
											: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
												LONGINT ARRAY FROM SELECTION:C647([SCRIPTS:80]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[MAILSORT_D5:81]))
												LONGINT ARRAY FROM SELECTION:C647([MAILSORT_D5:81]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[MAILSORT_D6:82]))
												LONGINT ARRAY FROM SELECTION:C647([MAILSORT_D6:82]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[MAILSORT_MAIL:83]))
												LONGINT ARRAY FROM SELECTION:C647([MAILSORT_MAIL:83]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
												LONGINT ARRAY FROM SELECTION:C647([HEADINGS:84]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
												LONGINT ARRAY FROM SELECTION:C647([PICTURES:85]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[COMPONENTS:86]))
												LONGINT ARRAY FROM SELECTION:C647([COMPONENTS:86]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[ROLES:87]))
												LONGINT ARRAY FROM SELECTION:C647([ROLES:87]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
												LONGINT ARRAY FROM SELECTION:C647([CONTRACT_RECORD_ANALYSIS:88]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
												LONGINT ARRAY FROM SELECTION:C647([PROJECTS:89]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
												LONGINT ARRAY FROM SELECTION:C647([TABLE_RECORD_STATES:90]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[CODE_USES:91]))
												LONGINT ARRAY FROM SELECTION:C647([CODE_USES:91]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
												LONGINT ARRAY FROM SELECTION:C647([PERSONNEL_GROUPS:92]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
												LONGINT ARRAY FROM SELECTION:C647([SUBSCRIPTIONS:93]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
												LONGINT ARRAY FROM SELECTION:C647([IDENTIFIERS_MULTI_NUMBERS:94]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[LIST_ITEMS:95]))
												LONGINT ARRAY FROM SELECTION:C647([LIST_ITEMS:95]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
												LONGINT ARRAY FROM SELECTION:C647([LIST_LAYOUTS:96]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[LICENCE_UPDATES:97]))
												LONGINT ARRAY FROM SELECTION:C647([LICENCE_UPDATES:97]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
												LONGINT ARRAY FROM SELECTION:C647([CUSTOM_FIELDS:98]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
												LONGINT ARRAY FROM SELECTION:C647([CUSTOM_FIELD_DEFINITiONS:99]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
											Else 
												Case of 
													: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
														LONGINT ARRAY FROM SELECTION:C647([CUSTOM_FIELDS_PERSONNEL:100]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
													: ($_l_TableNumber=Table:C252(->[X_URL_LInks:101]))
														LONGINT ARRAY FROM SELECTION:C647([X_URL_LInks:101]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
													: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
														LONGINT ARRAY FROM SELECTION:C647([DATA_AUDITS:102]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
													: ($_l_TableNumber=Table:C252(->[EMAIL_ATTACHMENTS:103]))
														LONGINT ARRAY FROM SELECTION:C647([EMAIL_ATTACHMENTS:103]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
													: ($_l_TableNumber=Table:C252(->[EMAIL_RECIPIENTS:104]))
														LONGINT ARRAY FROM SELECTION:C647([EMAIL_RECIPIENTS:104]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
													: ($_l_TableNumber=Table:C252(->[USER_SETS:105]))
														LONGINT ARRAY FROM SELECTION:C647([USER_SETS:105]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
													: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
														LONGINT ARRAY FROM SELECTION:C647([PURCHASE_ORDERS_ITEMS:169]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
													: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
														LONGINT ARRAY FROM SELECTION:C647([PURCHASE_INVOICE_ITEMS:158]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
													: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
														LONGINT ARRAY FROM SELECTION:C647([INVOICES_ITEMS:161]; WS_al_CachedSelection{Size of array:C274(WS_al_CachedSelection)})
												End case 
										End case 
								End case 
						End case 
				End case 
		End case 
		If (Count parameters:C259>=8)
			//we want some additional information
			//this is used in the superdiary at the moment
			//  $1=page number
			//$2=Start date
			//$3=Finish date
			//$4=person
			// $5=Pointer to where to put page
			//$6=pointer to where to put start date
			//$7=pointer to where to put end date
			//$8:=pointer to where to put person
			INSERT IN ARRAY:C227($8->; 9999; 1)
			INSERT IN ARRAY:C227($5->; 9999; 1)
			INSERT IN ARRAY:C227($6->; 9999; 1)
			INSERT IN ARRAY:C227($7->; 9999; 1)
			$5->{Size of array:C274($5->)}:=$1
			$6->{Size of array:C274($6->)}:=$2
			$7->{Size of array:C274($7->)}:=$3
			$8->{Size of array:C274($8->)}:=$4
		End if 
		
	Else 
		//ARRAY LONGINT(WS_al_CachedSelection;0)
		//ARRAY STRING(55;WS_at_CachedSelectionName;0)
	End if 
	
End if 
ERR_MethodTrackerReturn("Cache_Update"; $_t_oldMethodName)
