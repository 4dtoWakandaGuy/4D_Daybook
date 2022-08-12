//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_SetIDbyTableNum
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 11:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Required; $_bo_SecondID; $_bo_Set; $_bo_UUIDRequired; $2)
	C_LONGINT:C283($_l_FieldNumber; $_l_NextID; $_l_RecordsCount; $_l_TableNumber; $1)
	C_POINTER:C301($_ptr_Field; $_ptr_Field2; $_ptr_Table; $_ptr_UUIDFIeld; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AA_SetIDbyTableNum")

//$_t_oldMethodName:=ERR_MethodTracker ("AA_SetIDbyTableNum";$1)
//AA_SetIDByTableNum
//this can be called in a generic way
//pass a table num
$_bo_SecondID:=False:C215
If (Count parameters:C259>=1)
	$_l_TableNumber:=$1
Else 
	If (Not:C34(Is nil pointer:C315(Current default table:C363)))
		$_l_TableNumber:=Table:C252(Current default table:C363)
	Else 
		$_l_TableNumber:=0
	End if 
End if 
If (Count parameters:C259>=2)
	$_bo_Set:=$2
Else 
	$_bo_Set:=True:C214
End if 
$_bo_Required:=False:C215
If ($_l_TableNumber>0)
	$_l_FieldNumber:=AA_GetIDFieldNum($_l_TableNumber)
	If ($_l_FieldNumber>0)
		$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
		$_bo_Required:=True:C214
	Else 
		
		Case of 
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				$_bo_Required:=True:C214
				
				$_ptr_Field:=->[CONTACTS:1]x_ID:33
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				$_bo_Required:=True:C214
				
				$_ptr_Field:=->[COMPANIES:2]x_ID:63
			: ($_l_TableNumber=Table:C252(->[AREAS:3]))
				
			: ($_l_TableNumber=Table:C252(->[STATUS:4]))
				
			: ($_l_TableNumber=Table:C252(->[TYPES:5]))
				
			: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
				
			: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
				
			: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[PRODUCT_BRANDS:8]X_ID:4
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[PRODUCTS:9]X_ID:43
			: ($_l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
				
			: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[PERSONNEL:11]Personnel_ID:48
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[DIARY:12]x_ID:50
			: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[ACTIONS:13]xID:12
			: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
				
			: ($_l_TableNumber=Table:C252(->[USER:15]))
				
			: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
				$_bo_UUIDRequired:=True:C214
				$_ptr_UUIDFIeld:=->[IDENTIFIERS:16]x_UUID:10
			: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[CONTRACTS:17]x_ID:12
			: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
				
			: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
				
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[SERVICE_CALLS:20]x_ID:27
			: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
				
			: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
				
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[ORDERS:24]x_ID:58
			: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[ORDER_ITEMS:25]x_ID:58
			: ($_l_TableNumber=Table:C252(->[JOBS:26]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[JOBS:26]x_ID:49
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
			: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[PRICE_TABLE:28]x_ID:15
				
			: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[TRANSACTIONS:29]Transaction_ID:31
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
				
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
				
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
				
			: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[PERIODS:33]x_ID:10
			: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[ACCOUNT_BALANCES:34]x_ID:7
			: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
				
			: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
				
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[PURCHASE_INVOICES:37]x_ID:35
				
			: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[RECURRING_JOURNALS:38]x_ID:15
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[INVOICES:39]X_ID:49
				
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[STOCK_MOVEMENTS:40]x_ID:22
			: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
				$_bo_Required:=True:C214
				$_ptr_Field:=->[CURRENT_STOCK:62]X_ID:13
				
		End case 
		
		
		If ($_bo_Required=False:C215)
			Case of 
					
					
					
				: ($_l_TableNumber=Table:C252(->[STAGES:45]))
					
				: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
					
				: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
					
				: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[JOB PERSONNEL:48]X_ID:14
				: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[TIME_BUDGETS:49]X_ID:7
				: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[POSTAL_CODES:50]xRec_ID:5
				: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
					
				: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
				: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
					
				: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
					
				: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[INFORMATION:55]QualityRecordID:16
				: ($_l_TableNumber=Table:C252(->[QUALITY_GROUPS:56]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[QUALITY_GROUPS:56]x_ID:3
				: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
					
				: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[STOCK_LEVELS:58]X_ID:10
				: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
					
				: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
					
				: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
					
				: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[CURRENT_STOCK:62]X_ID:13
				: ($_l_TableNumber=Table:C252(->[MODULES:63]))
					
					
				: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
					
				: ($_l_TableNumber=Table:C252(->[DELETIONS:66]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[DELETIONS:66]xRec_ID:3
					
					
				: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[CURRENCIES:71]X_ID:3
				: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[CURRENCY_RATES:72]X_ID:6
				: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
					
				: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
					
				: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
					
				: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
					
				: ($_l_TableNumber=Table:C252(->[MAILSORT_A:77]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[MAILSORT_A:77]x_ID:5
				: ($_l_TableNumber=Table:C252(->[MAILSORT_B:78]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[MAILSORT_B:78]X_ID:6
				: ($_l_TableNumber=Table:C252(->[MAILSORT_C:79]))
					$_bo_Required:=True:C214
					$_ptr_Field:=->[MAILSORT_C:79]x_ID:3
			End case 
			Case of 
				: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
					$_bo_Required:=True:C214
					
					$_ptr_Field:=->[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
					$_ptr_Field2:=->[TRANSACTION_BATCH_ITEMS:155]ID:30
					$_bo_SecondID:=True:C214
				: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
					$_bo_Required:=True:C214
					
					$_ptr_Field:=->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5
				: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
					$_bo_Required:=True:C214
					
					$_ptr_Field:=->[PURCHASE_ORDERS_ITEMS:169]POitemID:16
				: ($_l_TableNumber=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
					
					$_bo_Required:=True:C214
					
					$_ptr_Field:=->[PRODUCTS_SUPPLIERS:148]ID:7
				: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
					$_bo_Required:=True:C214
					
					$_ptr_Field:=->[SERVICE_CALLS_PRODUCTS:152]SCProductXID:6
				: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
					$_bo_Required:=True:C214
					
					$_ptr_Field:=->[PURCHASE_INVOICE_ITEMS:158]ID:16
				: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
					
					$_bo_Required:=True:C214
					
					$_ptr_Field:=->[PURCHASE_ORDERS_ITEMS:169]ID:17
				: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
					
					$_bo_Required:=True:C214
					
					$_ptr_Field:=->[INVOICES_ITEMS:161]ID:17
				: ($_l_TableNumber=Table:C252(->[INVOICES_ALLOCATIONS:162]))
					
					$_bo_Required:=True:C214
					
					$_ptr_Field:=->[INVOICES_ITEMS:161]ID:17
					
			End case 
			
			If ($_bo_Required=False:C215)
				Case of 
					: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
						
					: ($_l_TableNumber=Table:C252(->[MAILSORT_D5:81]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[MAILSORT_D5:81]X_ID:3
					: ($_l_TableNumber=Table:C252(->[MAILSORT_D6:82]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[MAILSORT_D6:82]X_ID:3
					: ($_l_TableNumber=Table:C252(->[MAILSORT_MAIL:83]))
						
					: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
						
					: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[PICTURES:85]x_ID:5
					: ($_l_TableNumber=Table:C252(->[COMPONENTS:86]))
						
					: ($_l_TableNumber=Table:C252(->[ROLES:87]))
						
					: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
					: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[PROJECTS:89]X_ID:11
					: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
						
					: ($_l_TableNumber=Table:C252(->[CODE_USES:91]))
						
					: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[PERSONNEL_GROUPS:92]x_ID:12
					: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[SUBSCRIPTIONS:93]x_ID:11
					: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
						
					: ($_l_TableNumber=Table:C252(->[LIST_ITEMS:95]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[LIST_ITEMS:95]X_ID:3
					: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
						
					: ($_l_TableNumber=Table:C252(->[LICENCE_UPDATES:97]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[LICENCE_UPDATES:97]X_ID:5
					: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
						
					: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
						
					: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
						
					: ($_l_TableNumber=Table:C252(->[X_URL_LInks:101]))
						
					: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[DATA_AUDITS:102]X_ID:1
					: ($_l_TableNumber=Table:C252(->[EMAIL_ATTACHMENTS:103]))
						
					: ($_l_TableNumber=Table:C252(->[EMAIL_RECIPIENTS:104]))
						
					: ($_l_TableNumber=Table:C252(->[USER_SETS:105]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[USER_SETS:105]x_RecID:1
					: ($_l_TableNumber=Table:C252(->[DIARY_ITEMOWNERS:106]))
						
					: ($_l_TableNumber=Table:C252(->[SD_Settings:107]))
						
					: ($_l_TableNumber=Table:C252(->[CATALOGUE:108]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[CATALOGUE:108]x_ID:1
					: ($_l_TableNumber=Table:C252(->[Catalogue_ProductLink:109]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[Catalogue_ProductLink:109]x_ID:1
					: ($_l_TableNumber=Table:C252(->[Catalogue_Availability:110]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[Catalogue_Availability:110]x_ID:1
					: ($_l_TableNumber=Table:C252(->[X_LISTS:111]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[X_LISTS:111]x_ID:1
					: ($_l_TableNumber=Table:C252(->[x_ListUsage:112]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[x_ListUsage:112]x_ID:1
					: ($_l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[SALES_PROJECTION:113]x_ID:1
					: ($_l_TableNumber=Table:C252(->[SALES_ProjectionLinks:114]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[SALES_ProjectionLinks:114]x_ID:1
					: ($_l_TableNumber=Table:C252(->[PROCESSES_TO_HANDLE:115]))
						
					: ($_l_TableNumber=Table:C252(->[PREFERENCES:116]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[PREFERENCES:116]IDNumber:1
					: ($_l_TableNumber=Table:C252(->[EW_ExportProjects:117]))
					: ($_l_TableNumber=Table:C252(->[EW_ExportSteps:118]))
					: ($_l_TableNumber=Table:C252(->[EW_StepActions:119]))
					: ($_l_TableNumber=Table:C252(->[EW_ExportTables:120]))
					: ($_l_TableNumber=Table:C252(->[EW_BK_FieldMap:121]))
					: ($_l_TableNumber=Table:C252(->[EW_BKFields:122]))
					: ($_l_TableNumber=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
					: ($_l_TableNumber=Table:C252(->[SMS_Log:124]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[SMS_Log:124]X_ID:8
					: ($_l_TableNumber=Table:C252(->[XOrder_revisions:127]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[XOrder_revisions:127]X_ID:1
					: ($_l_TableNumber=Table:C252(->[XInvoiceAllocation:126]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[XInvoiceAllocation:126]x_ID:1
					: ($_l_TableNumber=Table:C252(->[AddressRecords:125]))
						$_bo_Required:=True:C214
						$_ptr_Field:=->[AddressRecords:125]X_ID:1
				End case 
			End if 
		End if 
	End if 
	
	If ($_bo_Required)
		If ($_ptr_Field->=0)
			If ($_bo_Set)
				$_ptr_Table:=Table:C252($_l_TableNumber)
				$_l_RecordsCount:=0
				If ($_l_TableNumber#Table:C252(->[PREFERENCES:116]))
					Repeat 
						$_l_NextID:=AA_GetNextIDinMethod($_ptr_Field)
						
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_RecordsCount)
						QUERY:C277($_ptr_Table->; $_ptr_Field->=$_l_NextID)
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						
					Until ($_l_RecordsCount=0)
				End if 
				$_ptr_Field->:=$_l_NextID
			Else 
				$3->:=$_ptr_Field->
			End if 
		Else 
			If ($_bo_Set)
				DB_TestRecordCodeisUnique($_l_TableNumber)
			Else 
				$3->:=$_ptr_Field->
			End if 
		End if 
		If ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
			$_ptr_Field2:=->[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
			If ($_ptr_Field2->=0)
				
				$_ptr_Table:=Table:C252($_l_TableNumber)
				$_l_RecordsCount:=0
				If ($_l_TableNumber#Table:C252(->[PREFERENCES:116]))
					Repeat 
						$_l_NextID:=AA_GetNextIDinMethod($_ptr_Field)
						
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_RecordsCount)
						QUERY:C277($_ptr_Table->; $_ptr_Field2->=$_l_NextID)
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						
					Until ($_l_RecordsCount=0)
				End if 
				$_ptr_Field2->:=$_l_NextID
				
			Else 
				
				DB_TestRecordCodeisUnique($_l_TableNumber)
				
			End if 
		Else 
			DB_TestRecordCodeisUnique($_l_TableNumber)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("AA_SetIDbyTableNum"; $_t_oldMethodName)
