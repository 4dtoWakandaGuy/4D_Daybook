If (False:C215)
	//Project Form Method Name:      TABLESPALLETE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2014 18:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(LB_al_TableNumbers;0)
	//ARRAY TEXT(LB_at_TableNames;0)
	C_BOOLEAN:C305($_bo_include)
	C_LONGINT:C283($_l_Event; $_l_TableCount; $_l_TableIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM TABLESPALLETE")
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1)
		$_l_TableCount:=Get last table number:C254
		ARRAY TEXT:C222(LB_at_TableNames; 0)
		ARRAY LONGINT:C221(LB_al_TableNumbers; 0)
		For ($_l_TableIndex; 1; $_l_TableCount)
			If (Is table number valid:C999($_l_TableIndex))
				$_bo_include:=True:C214
				If (User in group:C338(Current user:C182; "Designer"))
					$_bo_include:=True:C214
				Else 
					Case of 
						: ($_l_TableIndex=Table:C252(->[ACC_Bank_Statements:198]))
							If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ACCOUNT_BALANCES:34]))
							If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ACCOUNTS_ANALYSES:157]))
							If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ACCOUNTS_LAYERS:156]))
							If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ACCOUNTS:32]))
							If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ACTIONS_DEFAULTDIARIES:200]))
							If (DB_GetModuleSettingByNUM(Module_DiaryManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ACTIONS_MACROS:202]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ACTIONS_RELATIONRESTRICTIONS:205]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DiaryManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ACTIONS_RESTRICTABLES:201]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DiaryManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ACTIONS_RESULTSLINK:203]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DiaryManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ACTIONS_STATICRELATIONS:204]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DiaryManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ACTIONS:13]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DiaryManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ADDRESS_FORMATS:74]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[AddressRecords:125]))
							If (DB_GetModuleSettingByNUM(Module_Companies)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ANALYSES:36]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[AREAS:3]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[Bank_Reconcile:199]))
							If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[BUILT_CODE_FORMAT_SECTION:188]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CALCULATED DATA:190]))
							
						: ($_l_TableIndex=Table:C252(->[Catalogue_Availability:110]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[Catalogue_ProductLink:109]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CATALOGUE:108]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) | (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CC_OrderAuths:133]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CCM_PSPTransaction:136]))
							
						: ($_l_TableIndex=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
						: ($_l_TableIndex=Table:C252(->[CODE_USES:91]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_Companies)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[COMPANIES:2]))
							If (DB_GetModuleSettingByNUM(Module_Companies)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[COMPONENTS:86]))
							If (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CONTACTS_COMPANIES:145]))
							If (DB_GetModuleSettingByNUM(Module_Companies)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_Companies)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CONTACTS:1]))
							If (DB_GetModuleSettingByNUM(Module_Companies)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
							
						: ($_l_TableIndex=Table:C252(->[Contract_Type_Products:191]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CONTRACT_TYPES:19]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CONTRACTS_CONTACTS:151]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2) & (DB_GetModuleSettingByNUM(Module_Companies)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CONTRACTS:17]))
							If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[COUNTRIES:73]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CREDIT_STAGES:54]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CURRENCIES:71]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_MultiCurrency)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CURRENCY_RATES:72]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_MultiCurrency)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CURRENT_STOCK:62]))
							If (DB_GetModuleSettingByNUM(Module_StockControl)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[CUSTOM_FIELDS:98]))
							$_bo_include:=True:C214
						: ($_l_TableIndex=Table:C252(->[DATA_AUDITS:102]))
						: ($_l_TableIndex=Table:C252(->[DELETIONS:66]))
						: ($_l_TableIndex=Table:C252(->[DIARY_ITEMOWNERS:106]))
							If (DB_GetModuleSettingByNUM(Module_DiaryManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[DIARY:12]))
							If (DB_GetModuleSettingByNUM(Module_DiaryManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[DOCUMENTS:7]))
							If (DB_GetModuleSettingByNUM(Module_WPManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[EMAIL_ATTACHMENTS:103]))
							If (DB_GetModuleSettingByNUM(Module_DiaryManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[EMAIL_RECIPIENTS:104]))
							If (DB_GetModuleSettingByNUM(Module_DiaryManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[EW_BK_FieldMap:121]))
						: ($_l_TableIndex=Table:C252(->[EW_BKFields:122]))
						: ($_l_TableIndex=Table:C252(->[EW_ExportProjects:117]))
						: ($_l_TableIndex=Table:C252(->[EW_ExportSteps:118]))
						: ($_l_TableIndex=Table:C252(->[EW_ExportTables:120]))
						: ($_l_TableIndex=Table:C252(->[EW_StepActions:119]))
						: ($_l_TableIndex=Table:C252(->[HEADINGS:84]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
						: ($_l_TableIndex=Table:C252(->[IDENTIFIERS:16]))
						: ($_l_TableIndex=Table:C252(->[INFORMATION:55]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[INVOICES_ALLOCATIONS:162]))
							If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[INVOICES_ITEMS:161]))
							If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[INVOICES:39]))
							If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[JOB PERSONNEL:48]))
							If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[JOB_STAGES:47]))
							If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[JOB_TYPES:65]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[JOBS:26]))
							If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[LAYERS:76]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[LICENCE_UPDATES:97]))
						: ($_l_TableIndex=Table:C252(->[LIST_ITEMS:95]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[LIST_LAYOUTS:96]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[LOCATIONS:61]))
							If (DB_GetModuleSettingByNUM(Module_StockControl)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[MAILSORT_A:77]))
						: ($_l_TableIndex=Table:C252(->[MAILSORT_B:78]))
						: ($_l_TableIndex=Table:C252(->[MAILSORT_C:79]))
						: ($_l_TableIndex=Table:C252(->[MAILSORT_D5:81]))
						: ($_l_TableIndex=Table:C252(->[MAILSORT_D6:82]))
						: ($_l_TableIndex=Table:C252(->[MAILSORT_MAIL:83]))
						: ($_l_TableIndex=Table:C252(->[MODULES:63]))
						: ($_l_TableIndex=Table:C252(->[MOVEMENT_TYPES:60]))
							If (DB_GetModuleSettingByNUM(Module_StockControl)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ORDER_ITEMS:25]))
							If (DB_GetModuleSettingByNUM(Module_SalesOrders)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ORDERS:24]))
							If (DB_GetModuleSettingByNUM(Module_SalesOrders)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PERIODS:33]))
							If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PERSONNEL_DIARY_ACCESS:149]))
							If (DB_GetModuleSettingByNUM(Module_DiaryManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PERSONNEL_GROUPS:92]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (User in group:C338(Current user:C182; "Administrator"))
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PERSONNEL:11]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (User in group:C338(Current user:C182; "Administrator"))
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PICTURES:85]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[POSTAL_CODES:50]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PREFERENCES:116]))
						: ($_l_TableIndex=Table:C252(->[PRICE_GROUPS:18]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PRICE_TABLE:28]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
							
						: ($_l_TableIndex=Table:C252(->[PROBLEMS:22]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PROCESSES_TO_HANDLE:115]))
						: ($_l_TableIndex=Table:C252(->[PRODUCT_BRANDS:8]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PRODUCT_BUILT_CODE_FORMAT:189]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PRODUCT_GROUPS:10]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
							If (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PRODUCTS:9]))
							If (DB_GetModuleSettingByNUM(Module_Products)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PROJECTS:89]))
							If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PUBLICATIONS:52]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
							
						: ($_l_TableIndex=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
							If (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
							If (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PURCHASE_INVOICES:37]))
							If (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
							If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[PURCHASE_ORDERS:57]))
							If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[QUALITY_GROUPS:56]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
							
						: ($_l_TableIndex=Table:C252(->[REC_JOURNALS_DATES:160]))
							If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
								$_bo_include:=True:C214
							End if 
							
						: ($_l_TableIndex=Table:C252(->[RECURRING_JOURNALS:38]))
							If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[RESULTS:14]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[ROLES:87]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[SALES_PROJECTION:113]))
							
						: ($_l_TableIndex=Table:C252(->[SALES_ProjectionLinks:114]))
						: ($_l_TableIndex=Table:C252(->[SCRIPTS:80]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[SD_Settings:107]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[SERVICE_CALLS:20]))
							If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[SF_ADDRESS_FORMAT:164]))
						: ($_l_TableIndex=Table:C252(->[SF_ADDRESS:166]))
						: ($_l_TableIndex=Table:C252(->[SF_ADDRESSRELATIONS:70]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_ADDRESS_FORMAT:163]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_ADDRESS:165]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_ADDRESSRELATIONS:69]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_COMMS:153]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_COMMSRELATIONS:131]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_CONTACT:147]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_CP_LINK:181]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_PRICE_TABLE:182]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_PRICEGROUPS:187]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_PRODUCT_COLLECTIONS:178]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_PRODUCT_COMPONENTS:174]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_PRODUCT_SUPPLIER:175]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_PRODUCTS:172]))
						: ($_l_TableIndex=Table:C252(->[SF_ARCHIVE_PURCHASE_ORDER:42]))
						: ($_l_TableIndex=Table:C252(->[SF_COLLECTION_PRODUCT_LINK:179]))
						: ($_l_TableIndex=Table:C252(->[SF_COMMS:154]))
						: ($_l_TableIndex=Table:C252(->[SF_COMMSRELATIONS:141]))
						: ($_l_TableIndex=Table:C252(->[SF_CONTACT:150]))
						: ($_l_TableIndex=Table:C252(->[SF_DiaryView:184]))
						: ($_l_TableIndex=Table:C252(->[SF_LicenceSettings:170]))
						: ($_l_TableIndex=Table:C252(->[SF_LOGIN_USERS:68]))
						: ($_l_TableIndex=Table:C252(->[SF_PRiCE_TABLE:180]))
						: ($_l_TableIndex=Table:C252(->[SF_PRICEGROUPS:183]))
						: ($_l_TableIndex=Table:C252(->[SF_PRODUCT_COLLECTIONS:177]))
						: ($_l_TableIndex=Table:C252(->[SF_PRODUCT_COMPONENTS:176]))
						: ($_l_TableIndex=Table:C252(->[SF_PRODUCT_SUPPLIER:173]))
						: ($_l_TableIndex=Table:C252(->[SF_PRODUCTS:67]))
						: ($_l_TableIndex=Table:C252(->[SF_PURCHASE_INVOICE:41]))
						: ($_l_TableIndex=Table:C252(->[SF_PURCHASE_ITEM:21]))
						: ($_l_TableIndex=Table:C252(->[SF_PURCHASE_ORDER:43]))
						: ($_l_TableIndex=Table:C252(->[SF_SMITEM_Relations:195]))
						: ($_l_TableIndex=Table:C252(->[SF_STOCK_SUMMARY:196]))
						: ($_l_TableIndex=Table:C252(->[SF_STOCKMOVEMENT_ITEMS:194]))
						: ($_l_TableIndex=Table:C252(->[SF_STOCKMOVEMENTS:193]))
						: ($_l_TableIndex=Table:C252(->[SF_SYSTEMOWNER:168]))
						: ($_l_TableIndex=Table:C252(->[SF_UserPreferences:171]))
						: ($_l_TableIndex=Table:C252(->[SMS_Log:124]))
						: ($_l_TableIndex=Table:C252(->[SOLUTIONS:23]))
							If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[SOURCES:6]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[STAGES:45]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[STATUS:4]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[STK_TransactionHolds:192]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_StockControl)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[STOCK_LEVELS:58]))
							If (DB_GetModuleSettingByNUM(Module_StockControl)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
							If (DB_GetModuleSettingByNUM(Module_StockControl)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[STOCK_MOVEMENTS:40]))
							If (DB_GetModuleSettingByNUM(Module_StockControl)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[Stock_Thread:143]))
						: ($_l_TableIndex=Table:C252(->[STOCK_TYPES:59]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_StockControl)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[SUBSCRIPTIONS:93]))
							
						: ($_l_TableIndex=Table:C252(->[SYS_LISTS:167]))
						: ($_l_TableIndex=Table:C252(->[SYS_ManualSequences:64]))
						: ($_l_TableIndex=Table:C252(->[SYS_RELATEDSequences:44]))
						: ($_l_TableIndex=Table:C252(->[TABLE_RECORD_STATES:90]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[TAX_CODES:35]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[TERMINOLOGY:75]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
						: ($_l_TableIndex=Table:C252(->[TIME_BUDGETS:49]))
						: ($_l_TableIndex=Table:C252(->[TRANS_MULTI:128]))
						: ($_l_TableIndex=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[TRANSACTION_BATCHES:30]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[TRANSACTION_TYPES:31]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[TRANSACTIONS:29]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[TYPES:5]))
							If (DB_GetModuleSettingByNUM(Module_DataManager)>=2)
								$_bo_include:=True:C214
							End if 
						: ($_l_TableIndex=Table:C252(->[USER_SETS:105]))
						: ($_l_TableIndex=Table:C252(->[USER:15]))
						: ($_l_TableIndex=Table:C252(->[WEB_ACCESS:130]))
						: ($_l_TableIndex=Table:C252(->[WEB_CONNECTIONS:197]))
						: ($_l_TableIndex=Table:C252(->[WEBSETUP_4D:129]))
						: ($_l_TableIndex=Table:C252(->[WORKFLOW_CONTROL:51]))
						: ($_l_TableIndex=Table:C252(->[X_DIaryDisplay:142]))
						: ($_l_TableIndex=Table:C252(->[X_LISTS:111]))
						: ($_l_TableIndex=Table:C252(->[x_ListUsage:112]))
						: ($_l_TableIndex=Table:C252(->[x_ProductLocations:185]))
						: ($_l_TableIndex=Table:C252(->[x_QUERY_PARAMETERS:134]))
						: ($_l_TableIndex=Table:C252(->[X_URL_LInks:101]))
						: ($_l_TableIndex=Table:C252(->[xBatchItemRelations:140]))
						: ($_l_TableIndex=Table:C252(->[xCreditCardDetails:132]))
						: ($_l_TableIndex=Table:C252(->[xDiaryRelations:137]))
						: ($_l_TableIndex=Table:C252(->[XInvoiceAllocation:126]))
						: ($_l_TableIndex=Table:C252(->[XOrder_revisions:127]))
						: ($_l_TableIndex=Table:C252(->[xOtherRelations:138]))
						: ($_l_TableIndex=Table:C252(->[XReportsExecutor:135]))
						: ($_l_TableIndex=Table:C252(->[xServiceSalesItemLink:186]))
						: ($_l_TableIndex=Table:C252(->[xSynch:139]))
							
							
					End case 
				End if 
				If ($_bo_include)
					APPEND TO ARRAY:C911(LB_at_TableNames; Table name:C256($_l_TableIndex))
					APPEND TO ARRAY:C911(LB_al_TableNumbers; $_l_TableIndex)
				End if 
			End if 
		End for 
		
End case 
ERR_MethodTrackerReturn("FM TABLESPALLETE"; $_t_oldMethodName)
