//%attributes = {}
If (False:C215)
	//Project Method Name:      SEL_CurrentRecordSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  23/05/2010 15:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_CurrentSelectionID;0)
	//ARRAY LONGINT(DB_al_CurrentTableSetsRefs;0)
	//ARRAY LONGINT(DB_al_LongintArrays;0)
	//ARRAY LONGINT(DB_al_TableCurrentSelections;0)
	C_BOOLEAN:C305($_bo_AllowRecall; $1)
	C_LONGINT:C283($_l_CurrentSelectionRow; $_l_RowNumber; $_l_SelectionRow; $_l_SelectionRow2; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SEL_CurrentRecordSelection")
If (Count parameters:C259>=1)
	$_bo_AllowRecall:=$1
Else 
	$_bo_AllowRecall:=True:C214
End if 
$_l_SelectionRow:=Find in array:C230(DB_al_TableCurrentSelections; DB_l_CurrentDisplayedForm)
If ($_l_SelectionRow>0)  //if not there is a problem
	$_l_CurrentSelectionRow:=DB_al_CurrentSelectionID{$_l_SelectionRow}
	$_l_SelectionRow2:=Find in array:C230(DB_al_CurrentTableSetsRefs; $_l_CurrentSelectionRow)
	$_l_RowNumber:=0
	If ($_l_SelectionRow2>0)
		
		If ($_l_CurrentSelectionRow>0)
			$_l_RowNumber:=DB_al_CurrentSelectionID{$_l_SelectionRow}
			Case of 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
					CREATE SELECTION FROM ARRAY:C640([CONTACTS:1]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
					CREATE SELECTION FROM ARRAY:C640([COMPANIES:2]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[AREAS:3]))
					CREATE SELECTION FROM ARRAY:C640([AREAS:3]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[STATUS:4]))
					CREATE SELECTION FROM ARRAY:C640([STATUS:4]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[TYPES:5]))
					CREATE SELECTION FROM ARRAY:C640([TYPES:5]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[SOURCES:6]))
					CREATE SELECTION FROM ARRAY:C640([SOURCES:6]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[DOCUMENTS:7]))
					CREATE SELECTION FROM ARRAY:C640([DOCUMENTS:7]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCT_BRANDS:8]))
					CREATE SELECTION FROM ARRAY:C640([PRODUCT_BRANDS:8]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCTS:9]))
					CREATE SELECTION FROM ARRAY:C640([PRODUCTS:9]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCT_GROUPS:10]))
					CREATE SELECTION FROM ARRAY:C640([PRODUCT_GROUPS:10]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[PERSONNEL:11]))
					CREATE SELECTION FROM ARRAY:C640([PERSONNEL:11]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[DIARY:12]))
					CREATE SELECTION FROM ARRAY:C640([DIARY:12]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[ACTIONS:13]))
					CREATE SELECTION FROM ARRAY:C640([ACTIONS:13]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[RESULTS:14]))
					CREATE SELECTION FROM ARRAY:C640([RESULTS:14]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[USER:15]))
					CREATE SELECTION FROM ARRAY:C640([USER:15]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[IDENTIFIERS:16]))
					CREATE SELECTION FROM ARRAY:C640([IDENTIFIERS:16]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTRACTS:17]))
					CREATE SELECTION FROM ARRAY:C640([CONTRACTS:17]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[PRICE_GROUPS:18]))
					CREATE SELECTION FROM ARRAY:C640([PRICE_GROUPS:18]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTRACT_TYPES:19]))
					CREATE SELECTION FROM ARRAY:C640([CONTRACT_TYPES:19]; DB_al_LongintArrays{$_l_RowNumber})
				: (DB_l_CurrentDisplayedForm=Table:C252(->[SERVICE_CALLS:20]))
					CREATE SELECTION FROM ARRAY:C640([SERVICE_CALLS:20]; DB_al_LongintArrays{$_l_RowNumber})
					
				Else 
					Case of 
						: (DB_l_CurrentDisplayedForm=Table:C252(->[PROBLEMS:22]))
							CREATE SELECTION FROM ARRAY:C640([PROBLEMS:22]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[SOLUTIONS:23]))
							CREATE SELECTION FROM ARRAY:C640([SOLUTIONS:23]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[ORDERS:24]))
							CREATE SELECTION FROM ARRAY:C640([ORDERS:24]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[ORDER_ITEMS:25]))
							CREATE SELECTION FROM ARRAY:C640([ORDER_ITEMS:25]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[JOBS:26]))
							CREATE SELECTION FROM ARRAY:C640([JOBS:26]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
							CREATE SELECTION FROM ARRAY:C640([STOCK_MOVEMENT_ITEMS:27]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[PRICE_TABLE:28]))
							CREATE SELECTION FROM ARRAY:C640([PRICE_TABLE:28]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTIONS:29]))
							
							CREATE SELECTION FROM ARRAY:C640([TRANSACTIONS:29]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCHES:30]))
							CREATE SELECTION FROM ARRAY:C640([TRANSACTION_BATCHES:30]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_TYPES:31]))
							CREATE SELECTION FROM ARRAY:C640([TRANSACTION_TYPES:31]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
							CREATE SELECTION FROM ARRAY:C640([ACCOUNTS:32]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[PERIODS:33]))
							CREATE SELECTION FROM ARRAY:C640([PERIODS:33]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNT_BALANCES:34]))
							CREATE SELECTION FROM ARRAY:C640([ACCOUNT_BALANCES:34]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[TAX_CODES:35]))
							CREATE SELECTION FROM ARRAY:C640([TAX_CODES:35]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[ANALYSES:36]))
							CREATE SELECTION FROM ARRAY:C640([ANALYSES:36]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICES:37]))
							CREATE SELECTION FROM ARRAY:C640([PURCHASE_INVOICES:37]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[RECURRING_JOURNALS:38]))
							CREATE SELECTION FROM ARRAY:C640([RECURRING_JOURNALS:38]; DB_al_LongintArrays{$_l_RowNumber})
						: (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES:39]))
							CREATE SELECTION FROM ARRAY:C640([INVOICES:39]; DB_al_LongintArrays{$_l_RowNumber})
							
						Else 
							Case of 
								: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENTS:40]))
									CREATE SELECTION FROM ARRAY:C640([STOCK_MOVEMENTS:40]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[STAGES:45]))
									CREATE SELECTION FROM ARRAY:C640([STAGES:45]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
									CREATE SELECTION FROM ARRAY:C640([TIME_BILLING_CATEGORIES:46]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[JOB_STAGES:47]))
									CREATE SELECTION FROM ARRAY:C640([JOB_STAGES:47]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[JOB PERSONNEL:48]))
									CREATE SELECTION FROM ARRAY:C640([JOB PERSONNEL:48]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[TIME_BUDGETS:49]))
									CREATE SELECTION FROM ARRAY:C640([TIME_BUDGETS:49]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[POSTAL_CODES:50]))
									CREATE SELECTION FROM ARRAY:C640([POSTAL_CODES:50]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[WORKFLOW_CONTROL:51]))
									CREATE SELECTION FROM ARRAY:C640([WORKFLOW_CONTROL:51]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[PUBLICATIONS:52]))
									CREATE SELECTION FROM ARRAY:C640([PUBLICATIONS:52]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
									CREATE SELECTION FROM ARRAY:C640([ADDITIONAL_RECORD_ANALYSIS:53]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[CREDIT_STAGES:54]))
									CREATE SELECTION FROM ARRAY:C640([CREDIT_STAGES:54]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[INFORMATION:55]))
									CREATE SELECTION FROM ARRAY:C640([INFORMATION:55]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[QUALITY_GROUPS:56]))
									CREATE SELECTION FROM ARRAY:C640([QUALITY_GROUPS:56]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_ORDERS:57]))
									CREATE SELECTION FROM ARRAY:C640([PURCHASE_ORDERS:57]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_LEVELS:58]))
									CREATE SELECTION FROM ARRAY:C640([STOCK_LEVELS:58]; DB_al_LongintArrays{$_l_RowNumber})
								: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_TYPES:59]))
									CREATE SELECTION FROM ARRAY:C640([STOCK_TYPES:59]; DB_al_LongintArrays{$_l_RowNumber})
									
								Else 
									Case of 
										: (DB_l_CurrentDisplayedForm=Table:C252(->[MOVEMENT_TYPES:60]))
											CREATE SELECTION FROM ARRAY:C640([MOVEMENT_TYPES:60]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[LOCATIONS:61]))
											CREATE SELECTION FROM ARRAY:C640([LOCATIONS:61]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[CURRENT_STOCK:62]))
											CREATE SELECTION FROM ARRAY:C640([CURRENT_STOCK:62]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[MODULES:63]))
											CREATE SELECTION FROM ARRAY:C640([MODULES:63]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[JOB_TYPES:65]))
											CREATE SELECTION FROM ARRAY:C640([JOB_TYPES:65]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[DELETIONS:66]))
											CREATE SELECTION FROM ARRAY:C640([DELETIONS:66]; DB_al_LongintArrays{$_l_RowNumber})
											
										: (DB_l_CurrentDisplayedForm=Table:C252(->[CURRENCIES:71]))
											CREATE SELECTION FROM ARRAY:C640([CURRENCIES:71]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[CURRENCY_RATES:72]))
											CREATE SELECTION FROM ARRAY:C640([CURRENCY_RATES:72]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[COUNTRIES:73]))
											CREATE SELECTION FROM ARRAY:C640([COUNTRIES:73]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[ADDRESS_FORMATS:74]))
											CREATE SELECTION FROM ARRAY:C640([ADDRESS_FORMATS:74]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[TERMINOLOGY:75]))
											CREATE SELECTION FROM ARRAY:C640([TERMINOLOGY:75]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[LAYERS:76]))
											CREATE SELECTION FROM ARRAY:C640([LAYERS:76]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[MAILSORT_A:77]))
											CREATE SELECTION FROM ARRAY:C640([MAILSORT_A:77]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[MAILSORT_B:78]))
											CREATE SELECTION FROM ARRAY:C640([MAILSORT_B:78]; DB_al_LongintArrays{$_l_RowNumber})
										: (DB_l_CurrentDisplayedForm=Table:C252(->[MAILSORT_C:79]))
											CREATE SELECTION FROM ARRAY:C640([MAILSORT_C:79]; DB_al_LongintArrays{$_l_RowNumber})
										Else 
											Case of 
												: (DB_l_CurrentDisplayedForm=Table:C252(->[SCRIPTS:80]))
													CREATE SELECTION FROM ARRAY:C640([SCRIPTS:80]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[MAILSORT_D5:81]))
													CREATE SELECTION FROM ARRAY:C640([MAILSORT_D5:81]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[MAILSORT_D6:82]))
													CREATE SELECTION FROM ARRAY:C640([MAILSORT_D6:82]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[MAILSORT_MAIL:83]))
													CREATE SELECTION FROM ARRAY:C640([MAILSORT_MAIL:83]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[HEADINGS:84]))
													CREATE SELECTION FROM ARRAY:C640([HEADINGS:84]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[PICTURES:85]))
													CREATE SELECTION FROM ARRAY:C640([PICTURES:85]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[COMPONENTS:86]))
													CREATE SELECTION FROM ARRAY:C640([COMPONENTS:86]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[ROLES:87]))
													CREATE SELECTION FROM ARRAY:C640([ROLES:87]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
													CREATE SELECTION FROM ARRAY:C640([CONTRACT_RECORD_ANALYSIS:88]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[PROJECTS:89]))
													CREATE SELECTION FROM ARRAY:C640([PROJECTS:89]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[TABLE_RECORD_STATES:90]))
													CREATE SELECTION FROM ARRAY:C640([TABLE_RECORD_STATES:90]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[CODE_USES:91]))
													CREATE SELECTION FROM ARRAY:C640([CODE_USES:91]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[PERSONNEL_GROUPS:92]))
													CREATE SELECTION FROM ARRAY:C640([PERSONNEL_GROUPS:92]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[SUBSCRIPTIONS:93]))
													CREATE SELECTION FROM ARRAY:C640([SUBSCRIPTIONS:93]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
													CREATE SELECTION FROM ARRAY:C640([IDENTIFIERS_MULTI_NUMBERS:94]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[LIST_ITEMS:95]))
													CREATE SELECTION FROM ARRAY:C640([LIST_ITEMS:95]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[LIST_LAYOUTS:96]))
													CREATE SELECTION FROM ARRAY:C640([LIST_LAYOUTS:96]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[LICENCE_UPDATES:97]))
													CREATE SELECTION FROM ARRAY:C640([LICENCE_UPDATES:97]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[CUSTOM_FIELDS:98]))
													CREATE SELECTION FROM ARRAY:C640([CUSTOM_FIELDS:98]; DB_al_LongintArrays{$_l_RowNumber})
												: (DB_l_CurrentDisplayedForm=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
													CREATE SELECTION FROM ARRAY:C640([CUSTOM_FIELD_DEFINITiONS:99]; DB_al_LongintArrays{$_l_RowNumber})
												Else 
													Case of 
														: (DB_l_CurrentDisplayedForm=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
															CREATE SELECTION FROM ARRAY:C640([CUSTOM_FIELDS_PERSONNEL:100]; DB_al_LongintArrays{$_l_RowNumber})
														: (DB_l_CurrentDisplayedForm=Table:C252(->[X_URL_LInks:101]))
															CREATE SELECTION FROM ARRAY:C640([X_URL_LInks:101]; DB_al_LongintArrays{$_l_RowNumber})
														: (DB_l_CurrentDisplayedForm=Table:C252(->[DATA_AUDITS:102]))
															CREATE SELECTION FROM ARRAY:C640([DATA_AUDITS:102]; DB_al_LongintArrays{$_l_RowNumber})
														: (DB_l_CurrentDisplayedForm=Table:C252(->[EMAIL_ATTACHMENTS:103]))
															CREATE SELECTION FROM ARRAY:C640([EMAIL_ATTACHMENTS:103]; DB_al_LongintArrays{$_l_RowNumber})
														: (DB_l_CurrentDisplayedForm=Table:C252(->[EMAIL_RECIPIENTS:104]))
															CREATE SELECTION FROM ARRAY:C640([EMAIL_RECIPIENTS:104]; DB_al_LongintArrays{$_l_RowNumber})
														: (DB_l_CurrentDisplayedForm=Table:C252(->[USER_SETS:105]))
															CREATE SELECTION FROM ARRAY:C640([USER_SETS:105]; DB_al_LongintArrays{$_l_RowNumber})
														: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
															CREATE SELECTION FROM ARRAY:C640([PURCHASE_ORDERS_ITEMS:169]; DB_al_LongintArrays{$_l_RowNumber})
														: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
															CREATE SELECTION FROM ARRAY:C640([PURCHASE_INVOICE_ITEMS:158]; DB_al_LongintArrays{$_l_RowNumber})
														: (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES_ITEMS:161]))
															CREATE SELECTION FROM ARRAY:C640([INVOICES_ITEMS:161]; DB_al_LongintArrays{$_l_RowNumber})
													End case 
											End case 
									End case 
							End case 
					End case 
					
			End case 
		End if 
	Else 
		If ($_bo_AllowRecall)
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
			SEL_CurrentRecordSelection(False:C215)
		End if 
	End if 
	
	DB_SetFormMenuoptions
Else 
	
End if 
ERR_MethodTrackerReturn("SEL_CurrentRecordSelection"; $_t_oldMethodName)
