//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetFormCache
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/04/2010 18:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_CurrentSelectionID;0)
	//ARRAY LONGINT(DB_al_CurrentTableSetsRefs;0)
	//ARRAY LONGINT(DB_al_LATableIDS;0)
	//ARRAY LONGINT(DB_al_LongintArrays;0)
	//ARRAY LONGINT(DB_al_TableCurrentSelections;0)
	//ARRAY TEXT(DB_at_CurrentSelectionNames;0)
	C_BOOLEAN:C305(DB_bo_CacheIntited; DB_bo_FromTest; DB_bo_UNITTEST)
	C_LONGINT:C283($_l_CurrentSelectionCount; $_l_FirstReference; $_l_Index; $_l_LastTableNumber; $_l_RecordsinTable; $_l_Reference; $_l_Sequence; $_l_SizeofArray; $_l_TableNumber; $_l_tableRow; $1)
	C_POINTER:C301($_Ptr_Table)
	C_REAL:C285($_r_Random; $_r_Random2)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName; $2)
	C_TIME:C306(DB_ti_UTDOC)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetFormCache")


If (DB_bo_UNITTEST) & (Not:C34(DB_bo_FromTest))
	DB_ti_UTDOC:=?00:00:00?
	If (DB_ti_UTDOC=?00:00:00?)
		DB_ti_UTDOC:=Create document:C266("DB_SetFormCache"; "TEXT")
		
	End if 
	$_l_LastTableNumber:=Get last table number:C254
	DB_bo_FromTest:=True:C214
	For ($_l_Index; 1; 100000)
		
		$_r_Random:=(Random:C100%($_l_LastTableNumber-1+1))+1
		If (Is table number valid:C999($_r_Random))
			$_Ptr_Table:=Table:C252($_r_Random)
			
			$_l_RecordsinTable:=Records in table:C83($_Ptr_Table->)
			
			If ($_l_RecordsinTable>1)
				
				$_r_Random2:=(Random:C100%($_l_RecordsinTable-1+1))+1
				MESSAGE:C88(String:C10($_l_Index)+" of "+String:C10(100000)+"Table selected equals table number"+String:C10($_r_Random)+" Number of records"+String:C10($_r_Random2))
				
				SEND PACKET:C103(DB_ti_UTDOC; "Table selected equals table number"+String:C10($_r_Random)+" Number of records"+String:C10($_r_Random2)+Char:C90(9))
				ALL RECORDS:C47($_Ptr_Table->)
				REDUCE SELECTION:C351($_Ptr_Table->; $_r_Random2)
				
				DB_SetFormCache($_r_Random; "")
				SEND PACKET:C103(DB_ti_UTDOC; "Rows in Main array="+String:C10(Size of array:C274(DB_al_LongintArrays))+Char:C90(9))
				SEND PACKET:C103(DB_ti_UTDOC; "Rows in This table array="+String:C10(Size of array:C274(DB_al_CurrentTableSetsRefs))+Char:C90(9))
				$_l_Reference:=DB_al_CurrentTableSetsRefs{Size of array:C274(DB_al_CurrentTableSetsRefs)}
				
				CREATE SET FROM ARRAY:C641($_Ptr_Table->; DB_al_LongintArrays{$_l_Reference}; "$TempSet")
				USE SET:C118("$TempSet")
				SEND PACKET:C103(DB_ti_UTDOC; "Record Retreived= "+String:C10(Records in selection:C76($_Ptr_Table->))+Char:C90(9))
				If ($_r_Random2#Records in selection:C76($_Ptr_Table->))
					SEND PACKET:C103(DB_ti_UTDOC; "ERROR")
				End if 
				SEND PACKET:C103(DB_ti_UTDOC; Char:C90(13))
				
			End if 
			
		End if 
		
	End for 
	CLOSE DOCUMENT:C267(DB_ti_UTDOC)
	
	Gen_Alert("Unit Test Complete")
	
	
Else 
	If (Not:C34(DB_bo_CacheIntited))
		ARRAY LONGINT:C221(DB_al_TableCurrentSelections; 0)  //this array give us a reference for any table which is loaded in the window to find the name of the current selection
		ARRAY TEXT:C222(DB_at_CurrentSelectionNames; 0)
		ARRAY LONGINT:C221(DB_al_CurrentSelectionID; 0)  //this array contains the ROW of the current loaded selection-essential for going to next selection
		ARRAY LONGINT:C221(DB_al_CurrentTableSetsRefs; 0)  //this is an array for the current table f the references in the 2D array of the selections so that selectionNavigationcan happen
		ARRAY LONGINT:C221(DB_al_LongintArrays; 0; 0)  //these contain in each row a selection of records loaded using selection to longint array
		ARRAY LONGINT:C221(DB_al_LATableIDS; 0)  //this corresponds to the above giving a table number for the row
		DB_bo_CacheIntited:=True:C214
	End if 
	If (Size of array:C274(DB_al_CurrentTableSetsRefs)>0)
		$_l_FirstReference:=DB_al_CurrentTableSetsRefs{1}
		$_l_TableNumber:=DB_al_LATableIDS{$_l_FirstReference}
		If ($_l_TableNumber#$1)
			ARRAY LONGINT:C221(DB_al_CurrentTableSetsRefs; 0)  //this is an array for the current table f the references in the 2D array of the selections so that selectionNavigationcan happen
			$_l_Sequence:=1
			For ($_l_Index; 1; Size of array:C274(DB_al_LATableIDS))
				If (DB_al_LATableIDS{$_l_Index}=$1)
					APPEND TO ARRAY:C911(DB_al_CurrentTableSetsRefs; $_l_Index)
				End if 
			End for 
		End if 
	End if 
	
	$_l_RecordsinTable:=Records in selection:C76(Table:C252($1)->)
	If ($_l_RecordsinTable>0)
		$_l_SizeofArray:=Size of array:C274(DB_al_LongintArrays)
		INSERT IN ARRAY:C227(DB_al_LongintArrays; $_l_SizeofArray+1; 1)
		$_l_SizeofArray:=Size of array:C274(DB_al_LongintArrays)
		Case of 
			: ($1=Table:C252(->[CONTACTS:1]))
				LONGINT ARRAY FROM SELECTION:C647([CONTACTS:1]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[COMPANIES:2]))
				LONGINT ARRAY FROM SELECTION:C647([COMPANIES:2]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[AREAS:3]))
				LONGINT ARRAY FROM SELECTION:C647([AREAS:3]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[STATUS:4]))
				LONGINT ARRAY FROM SELECTION:C647([STATUS:4]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[TYPES:5]))
				LONGINT ARRAY FROM SELECTION:C647([TYPES:5]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[SOURCES:6]))
				LONGINT ARRAY FROM SELECTION:C647([SOURCES:6]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[DOCUMENTS:7]))
				LONGINT ARRAY FROM SELECTION:C647([DOCUMENTS:7]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
				LONGINT ARRAY FROM SELECTION:C647([PRODUCT_BRANDS:8]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[PRODUCTS:9]))
				LONGINT ARRAY FROM SELECTION:C647([PRODUCTS:9]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
				LONGINT ARRAY FROM SELECTION:C647([PRODUCT_GROUPS:10]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[PERSONNEL:11]))
				LONGINT ARRAY FROM SELECTION:C647([PERSONNEL:11]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[DIARY:12]))
				LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[ACTIONS:13]))
				LONGINT ARRAY FROM SELECTION:C647([ACTIONS:13]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[RESULTS:14]))
				LONGINT ARRAY FROM SELECTION:C647([RESULTS:14]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[USER:15]))
				LONGINT ARRAY FROM SELECTION:C647([USER:15]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[IDENTIFIERS:16]))
				LONGINT ARRAY FROM SELECTION:C647([IDENTIFIERS:16]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[CONTRACTS:17]))
				LONGINT ARRAY FROM SELECTION:C647([CONTRACTS:17]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[PRICE_GROUPS:18]))
				LONGINT ARRAY FROM SELECTION:C647([PRICE_GROUPS:18]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[CONTRACT_TYPES:19]))
				LONGINT ARRAY FROM SELECTION:C647([CONTRACT_TYPES:19]; DB_al_LongintArrays{$_l_SizeofArray})
			: ($1=Table:C252(->[SERVICE_CALLS:20]))
				LONGINT ARRAY FROM SELECTION:C647([SERVICE_CALLS:20]; DB_al_LongintArrays{$_l_SizeofArray})
				
			Else 
				Case of 
					: ($1=Table:C252(->[PROBLEMS:22]))
						LONGINT ARRAY FROM SELECTION:C647([PROBLEMS:22]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[SOLUTIONS:23]))
						LONGINT ARRAY FROM SELECTION:C647([SOLUTIONS:23]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[ORDERS:24]))
						LONGINT ARRAY FROM SELECTION:C647([ORDERS:24]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[ORDER_ITEMS:25]))
						LONGINT ARRAY FROM SELECTION:C647([ORDER_ITEMS:25]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[JOBS:26]))
						LONGINT ARRAY FROM SELECTION:C647([JOBS:26]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
						LONGINT ARRAY FROM SELECTION:C647([STOCK_MOVEMENT_ITEMS:27]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[PRICE_TABLE:28]))
						LONGINT ARRAY FROM SELECTION:C647([PRICE_TABLE:28]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[TRANSACTIONS:29]))
						
						LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
						LONGINT ARRAY FROM SELECTION:C647([TRANSACTION_BATCHES:30]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
						LONGINT ARRAY FROM SELECTION:C647([TRANSACTION_TYPES:31]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[ACCOUNTS:32]))
						LONGINT ARRAY FROM SELECTION:C647([ACCOUNTS:32]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[PERIODS:33]))
						LONGINT ARRAY FROM SELECTION:C647([PERIODS:33]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
						LONGINT ARRAY FROM SELECTION:C647([ACCOUNT_BALANCES:34]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[TAX_CODES:35]))
						LONGINT ARRAY FROM SELECTION:C647([TAX_CODES:35]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[ANALYSES:36]))
						LONGINT ARRAY FROM SELECTION:C647([ANALYSES:36]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
						LONGINT ARRAY FROM SELECTION:C647([PURCHASE_INVOICES:37]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
						LONGINT ARRAY FROM SELECTION:C647([RECURRING_JOURNALS:38]; DB_al_LongintArrays{$_l_SizeofArray})
					: ($1=Table:C252(->[INVOICES:39]))
						LONGINT ARRAY FROM SELECTION:C647([INVOICES:39]; DB_al_LongintArrays{$_l_SizeofArray})
						
					Else 
						Case of 
							: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
								LONGINT ARRAY FROM SELECTION:C647([STOCK_MOVEMENTS:40]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[STAGES:45]))
								LONGINT ARRAY FROM SELECTION:C647([STAGES:45]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
								LONGINT ARRAY FROM SELECTION:C647([TIME_BILLING_CATEGORIES:46]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[JOB_STAGES:47]))
								LONGINT ARRAY FROM SELECTION:C647([JOB_STAGES:47]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[JOB PERSONNEL:48]))
								LONGINT ARRAY FROM SELECTION:C647([JOB PERSONNEL:48]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[TIME_BUDGETS:49]))
								LONGINT ARRAY FROM SELECTION:C647([TIME_BUDGETS:49]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[POSTAL_CODES:50]))
								LONGINT ARRAY FROM SELECTION:C647([POSTAL_CODES:50]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
								LONGINT ARRAY FROM SELECTION:C647([WORKFLOW_CONTROL:51]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[PUBLICATIONS:52]))
								LONGINT ARRAY FROM SELECTION:C647([PUBLICATIONS:52]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
								LONGINT ARRAY FROM SELECTION:C647([ADDITIONAL_RECORD_ANALYSIS:53]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[CREDIT_STAGES:54]))
								LONGINT ARRAY FROM SELECTION:C647([CREDIT_STAGES:54]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[INFORMATION:55]))
								LONGINT ARRAY FROM SELECTION:C647([INFORMATION:55]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[QUALITY_GROUPS:56]))
								LONGINT ARRAY FROM SELECTION:C647([QUALITY_GROUPS:56]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
								LONGINT ARRAY FROM SELECTION:C647([PURCHASE_ORDERS:57]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[STOCK_LEVELS:58]))
								LONGINT ARRAY FROM SELECTION:C647([STOCK_LEVELS:58]; DB_al_LongintArrays{$_l_SizeofArray})
							: ($1=Table:C252(->[STOCK_TYPES:59]))
								LONGINT ARRAY FROM SELECTION:C647([STOCK_TYPES:59]; DB_al_LongintArrays{$_l_SizeofArray})
								
							Else 
								Case of 
									: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
										LONGINT ARRAY FROM SELECTION:C647([MOVEMENT_TYPES:60]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[LOCATIONS:61]))
										LONGINT ARRAY FROM SELECTION:C647([LOCATIONS:61]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[CURRENT_STOCK:62]))
										LONGINT ARRAY FROM SELECTION:C647([CURRENT_STOCK:62]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[MODULES:63]))
										LONGINT ARRAY FROM SELECTION:C647([MODULES:63]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[JOB_TYPES:65]))
										LONGINT ARRAY FROM SELECTION:C647([JOB_TYPES:65]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[DELETIONS:66]))
										LONGINT ARRAY FROM SELECTION:C647([DELETIONS:66]; DB_al_LongintArrays{$_l_SizeofArray})
										
									: ($1=Table:C252(->[CURRENCIES:71]))
										LONGINT ARRAY FROM SELECTION:C647([CURRENCIES:71]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[CURRENCY_RATES:72]))
										LONGINT ARRAY FROM SELECTION:C647([CURRENCY_RATES:72]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[COUNTRIES:73]))
										LONGINT ARRAY FROM SELECTION:C647([COUNTRIES:73]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
										LONGINT ARRAY FROM SELECTION:C647([ADDRESS_FORMATS:74]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[TERMINOLOGY:75]))
										LONGINT ARRAY FROM SELECTION:C647([TERMINOLOGY:75]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[LAYERS:76]))
										LONGINT ARRAY FROM SELECTION:C647([LAYERS:76]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[MAILSORT_A:77]))
										LONGINT ARRAY FROM SELECTION:C647([MAILSORT_A:77]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[MAILSORT_B:78]))
										LONGINT ARRAY FROM SELECTION:C647([MAILSORT_B:78]; DB_al_LongintArrays{$_l_SizeofArray})
									: ($1=Table:C252(->[MAILSORT_C:79]))
										LONGINT ARRAY FROM SELECTION:C647([MAILSORT_C:79]; DB_al_LongintArrays{$_l_SizeofArray})
									Else 
										Case of 
											: ($1=Table:C252(->[SCRIPTS:80]))
												LONGINT ARRAY FROM SELECTION:C647([SCRIPTS:80]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[MAILSORT_D5:81]))
												LONGINT ARRAY FROM SELECTION:C647([MAILSORT_D5:81]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[MAILSORT_D6:82]))
												LONGINT ARRAY FROM SELECTION:C647([MAILSORT_D6:82]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[MAILSORT_MAIL:83]))
												LONGINT ARRAY FROM SELECTION:C647([MAILSORT_MAIL:83]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[HEADINGS:84]))
												LONGINT ARRAY FROM SELECTION:C647([HEADINGS:84]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[PICTURES:85]))
												LONGINT ARRAY FROM SELECTION:C647([PICTURES:85]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[COMPONENTS:86]))
												LONGINT ARRAY FROM SELECTION:C647([COMPONENTS:86]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[ROLES:87]))
												LONGINT ARRAY FROM SELECTION:C647([ROLES:87]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
												LONGINT ARRAY FROM SELECTION:C647([CONTRACT_RECORD_ANALYSIS:88]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[PROJECTS:89]))
												LONGINT ARRAY FROM SELECTION:C647([PROJECTS:89]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[TABLE_RECORD_STATES:90]))
												LONGINT ARRAY FROM SELECTION:C647([TABLE_RECORD_STATES:90]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[CODE_USES:91]))
												LONGINT ARRAY FROM SELECTION:C647([CODE_USES:91]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
												LONGINT ARRAY FROM SELECTION:C647([PERSONNEL_GROUPS:92]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[SUBSCRIPTIONS:93]))
												LONGINT ARRAY FROM SELECTION:C647([SUBSCRIPTIONS:93]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
												LONGINT ARRAY FROM SELECTION:C647([IDENTIFIERS_MULTI_NUMBERS:94]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[LIST_ITEMS:95]))
												LONGINT ARRAY FROM SELECTION:C647([LIST_ITEMS:95]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[LIST_LAYOUTS:96]))
												LONGINT ARRAY FROM SELECTION:C647([LIST_LAYOUTS:96]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[LICENCE_UPDATES:97]))
												LONGINT ARRAY FROM SELECTION:C647([LICENCE_UPDATES:97]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
												LONGINT ARRAY FROM SELECTION:C647([CUSTOM_FIELDS:98]; DB_al_LongintArrays{$_l_SizeofArray})
											: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
												LONGINT ARRAY FROM SELECTION:C647([CUSTOM_FIELD_DEFINITiONS:99]; DB_al_LongintArrays{$_l_SizeofArray})
											Else 
												Case of 
													: ($1=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
														LONGINT ARRAY FROM SELECTION:C647([CUSTOM_FIELDS_PERSONNEL:100]; DB_al_LongintArrays{$_l_SizeofArray})
													: ($1=Table:C252(->[X_URL_LInks:101]))
														LONGINT ARRAY FROM SELECTION:C647([X_URL_LInks:101]; DB_al_LongintArrays{$_l_SizeofArray})
													: ($1=Table:C252(->[DATA_AUDITS:102]))
														LONGINT ARRAY FROM SELECTION:C647([DATA_AUDITS:102]; DB_al_LongintArrays{$_l_SizeofArray})
													: ($1=Table:C252(->[EMAIL_ATTACHMENTS:103]))
														LONGINT ARRAY FROM SELECTION:C647([EMAIL_ATTACHMENTS:103]; DB_al_LongintArrays{$_l_SizeofArray})
													: ($1=Table:C252(->[EMAIL_RECIPIENTS:104]))
														LONGINT ARRAY FROM SELECTION:C647([EMAIL_RECIPIENTS:104]; DB_al_LongintArrays{$_l_SizeofArray})
													: ($1=Table:C252(->[USER_SETS:105]))
														LONGINT ARRAY FROM SELECTION:C647([USER_SETS:105]; DB_al_LongintArrays{$_l_SizeofArray})
													: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
														LONGINT ARRAY FROM SELECTION:C647([PURCHASE_ORDERS_ITEMS:169]; DB_al_LongintArrays{$_l_SizeofArray})
													: ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
														LONGINT ARRAY FROM SELECTION:C647([PURCHASE_INVOICE_ITEMS:158]; DB_al_LongintArrays{$_l_SizeofArray})
													: ($1=Table:C252(->[INVOICES_ITEMS:161]))
														LONGINT ARRAY FROM SELECTION:C647([INVOICES_ITEMS:161]; DB_al_LongintArrays{$_l_SizeofArray})
													Else 
														//TRACE
														$_Ptr_Table:=Table:C252($1)
														LONGINT ARRAY FROM SELECTION:C647($_Ptr_Table->; DB_al_LongintArrays{$_l_SizeofArray})
														
														//TRACE
												End case 
										End case 
								End case 
						End case 
				End case 
		End case 
		$_t_TableName:=Table name:C256($1)
		If (Count parameters:C259>=2)
			If ($2#"")
				$_t_TableName:=$2  //may have to coerse this string
			End if 
		End if 
		
		$_l_CurrentSelectionCount:=Size of array:C274(DB_al_CurrentTableSetsRefs)
		APPEND TO ARRAY:C911(DB_al_LATableIDS; $1)
		APPEND TO ARRAY:C911(DB_at_CurrentSelectionNames; "Selection "+String:C10($_l_CurrentSelectionCount)+"of "+$_t_TableName)
		APPEND TO ARRAY:C911(DB_al_CurrentTableSetsRefs; $_l_SizeofArray)
		$_l_tableRow:=Find in array:C230(DB_al_TableCurrentSelections; $1)
		If ($_l_tableRow<0)
			APPEND TO ARRAY:C911(DB_al_TableCurrentSelections; $1)
			APPEND TO ARRAY:C911(DB_al_CurrentSelectionID; 0)
			$_l_tableRow:=Size of array:C274(DB_al_CurrentSelectionID)
		End if 
		DB_al_CurrentSelectionID{$_l_tableRow}:=Size of array:C274(DB_al_CurrentTableSetsRefs)  //the row of the current selection
	End if 
	
	
End if 
ERR_MethodTrackerReturn("DB_SetFormCache"; $_t_oldMethodName)