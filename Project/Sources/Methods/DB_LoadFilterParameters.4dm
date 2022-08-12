//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LoadFilterParameters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/05/2011 09:50 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ANAL_abo_Exclude;0)
	//ARRAY BOOLEAN(ANAL_abo_Include;0)
	//ARRAY BOOLEAN(CUR_abo_Exclude;0)
	//ARRAY BOOLEAN(CUR_abo_Include;0)
	//ARRAY BOOLEAN(LAY_abo_AreasExclude;0)
	//ARRAY BOOLEAN(LAY_abo_AreasInclude;0)
	//ARRAY BOOLEAN(LAY_abo_BrandsExclude;0)
	//ARRAY BOOLEAN(LAY_abo_BrandsInclude;0)
	//ARRAY BOOLEAN(LAY_abo_CollectionsExclude;0)
	//ARRAY BOOLEAN(LAY_abo_CollectionsInclude;0)
	//ARRAY BOOLEAN(LAY_abo_CountryExclude;0)
	//ARRAY BOOLEAN(LAY_abo_CountryInclude;0)
	//ARRAY BOOLEAN(LAY_abo_CountyExclude;0)
	//ARRAY BOOLEAN(LAY_abo_CountyInclude;0)
	//ARRAY BOOLEAN(LAY_abo_CredStgExclude;0)
	//ARRAY BOOLEAN(LAY_abo_CredStgInclude;0)
	//ARRAY BOOLEAN(LAY_abo_Exclude;0)
	//ARRAY BOOLEAN(LAY_abo_GroupsExclude;0)
	//ARRAY BOOLEAN(LAY_abo_GroupsInclude;0)
	//ARRAY BOOLEAN(LAY_abo_HeadingExclude;0)
	//ARRAY BOOLEAN(LAY_abo_HeadingInclude;0)
	//ARRAY BOOLEAN(LAY_abo_Include;0)
	//ARRAY BOOLEAN(LAY_abo_LocationExclude;0)
	//ARRAY BOOLEAN(LAY_abo_LocationInclude;0)
	//ARRAY BOOLEAN(LAY_abo_MoveTypesExclude;0)
	//ARRAY BOOLEAN(LAY_abo_MoveTypesInclude;0)
	//ARRAY BOOLEAN(LAY_abo_RoleExclude;0)
	//ARRAY BOOLEAN(LAY_abo_RoleInclude;0)
	//ARRAY BOOLEAN(LAY_abo_SourcesExclude;0)
	//ARRAY BOOLEAN(LAY_abo_SourcesInclude;0)
	//ARRAY BOOLEAN(LAY_abo_SPExclude;0)
	//ARRAY BOOLEAN(LAY_abo_SPInclude;0)
	//ARRAY BOOLEAN(LAY_abo_StatesExclude;0)
	//ARRAY BOOLEAN(LAY_abo_StatesInclude;0)
	//ARRAY BOOLEAN(LAY_abo_StatusExclude;0)
	//ARRAY BOOLEAN(LAY_abo_StatusInclude;0)
	//ARRAY BOOLEAN(LAY_abo_StockTypeExclude;0)
	//ARRAY BOOLEAN(LAY_abo_StockTypeInclude;0)
	//ARRAY BOOLEAN(LAY_abo_TypesExclude;0)
	//ARRAY BOOLEAN(LAY_abo_TypesInclude;0)
	ARRAY LONGINT:C221($_al_Include; 0)
	//ARRAY LONGINT(DB_al_CollectionIDS;0)
	//ARRAY LONGINT(DB_al_FilterIDs;0)
	ARRAY TEXT:C222($_at_include; 0)
	//ARRAY TEXT(ACC_at_PeriodFromCode;0)
	//ARRAY TEXT(ACC_at_PeriodTOCode;0)
	//ARRAY TEXT(ANAL_at_analcode;0)
	//ARRAY TEXT(ANAL_at_AnalName;0)
	//ARRAY TEXT(CUR_at_curcode;0)
	//ARRAY TEXT(CUR_at_CurName;0)
	//ARRAY TEXT(DB_at_AreaCodes;0)
	//ARRAY TEXT(DB_at_BrandCodes;0)
	//ARRAY TEXT(DB_at_CountryNames;0)
	//ARRAY TEXT(DB_at_CountyNames;0)
	//ARRAY TEXT(DB_at_CredStgCodes;0)
	//ARRAY TEXT(DB_at_FilterNames;0)
	//ARRAY TEXT(DB_at_GroupCodes;0)
	//ARRAY TEXT(DB_at_HeadingCodes;0)
	//ARRAY TEXT(DB_at_HeadingNames;0)
	//ARRAY TEXT(DB_at_MoveTypeCodes;0)
	//ARRAY TEXT(DB_at_RoleCodes;0)
	//ARRAY TEXT(DB_at_SourceCodes;0)
	//ARRAY TEXT(DB_at_StatesCodes;0)
	//ARRAY TEXT(DB_at_StatusCodes;0)
	//ARRAY TEXT(DB_at_StockLocCodes;0)
	//ARRAY TEXT(DB_at_StockTypesCodes;0)
	//ARRAY TEXT(DB_at_TypesCodes;0)
	//ARRAY TEXT(LAY_at_laycode;0)
	//ARRAY TEXT(LAY_at_layName;0)
	//ARRAY TEXT(LAY_at_SPinitials;0)
	C_BOOLEAN:C305(<>StockAnal; $_bo_IncludeNoCatalogue; CO_rb_Both; CUR_bo_FilterZeros; DB_bo_FiltersActivated; LAY_bo_AccTypesSetup; LAY_bo_AreasSetup; LAY_bo_ContStatesSetup; LAY_bo_CoTypesSetup; LAY_bo_InvoiceStateSetup; LAY_bo_InvPeriodsSetup)
	C_BOOLEAN:C305(LAY_bo_LayerSetup; LAY_bo_MoveTypesSetup; LAY_bo_ORDsourcesSetup; LAY_bo_OrdStatesSetup; LAY_bo_PeriodsSetup; LAY_bo_PIPeriodsSetup; LAY_bo_POPeriodsSetup; LAY_bo_POStatesSetup; LAY_bo_STKIPeriodsSetup; LAY_bo_StockTypesSetup; SI_bo_FilterZeros)
	C_LONGINT:C283($_l_CurrenciesTotalWidth; $_l_Index; $_l_IndexD; $_l_IndexRef; $_l_offset; $_l_TableNumber; $_l_ValueRow; ACC_l_BalanceSheet; ACC_l_Both; ACC_l_ContextualFilterFrom; ACC_l_ContextualFilterTo)
	C_LONGINT:C283(ACC_l_ProfitSheet; CO_l_Both; CO_l_Company; CO_l_PrivateAddress; CONT_l_Both; CONT_l_Closed; CONT_l_Open; DB_l_CurrentDisplayedForm; INV_l_Both; INV_l_Closed; INV_l_Open)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_Variable; DB_t_CurrentContext; DB_T_CurrentFilterName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LoadFilterParameters")

If (Count parameters:C259>=2)
	If (Not:C34(DB_bo_FiltersActivated))
		Case of 
			: (DB_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
				DB_SetOutFIlterSalesPersons(->[COMPANIES:2])
				
				DB_SetOutFIlterCountries(->[COMPANIES:2])
				
				DB_SetOutFIlterCounties(->[COMPANIES:2])
				
				DB_SetoutFilterAreas(->[COMPANIES:2])
				
				DB_SetoutFilterCoType(->[COMPANIES:2])
				
				//satus
				DB_SetoutFilterCoStatus(->[COMPANIES:2])
				If (Not:C34(LAY_bo_CoTypesSetup))
					LAY_bo_CoTypesSetup:=True:C214
					CO_l_Both:=1
					CO_l_Company:=0
					CO_l_PrivateAddress:=0
				End if 
				
				//````````
				//source
				DB_SetOutputFiltersSources(->[COMPANIES:2])
				
				
				//size
			: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNT_BALANCES:34]))
				
				DB_SetOutFilterPeriods(->[ACCOUNT_BALANCES:34])
				
				If (Records in table:C83([ANALYSES:36])>0)
					DB_SetOutFiltersAnalysis(->[ACCOUNT_BALANCES:34])
				Else 
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
					
					
					DB_SetoutFilterLayers(->[ACCOUNTS_LAYERS:156])
					
					
				Else 
					ARRAY TEXT:C222(LAY_at_laycode; 0)
					ARRAY TEXT:C222(LAY_at_layName; 0)
					
					ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
				End if 
				If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
					
					$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[ACCOUNT_BALANCES:34])
				Else 
					ARRAY TEXT:C222(CUR_at_curcode; 0)
					ARRAY TEXT:C222(CUR_at_CurName; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
				End if 
				If (Not:C34(LAY_bo_AccTypesSetup))
					LAY_bo_AccTypesSetup:=True:C214
					ACC_l_Both:=1
					ACC_l_ProfitSheet:=0
					ACC_l_BalanceSheet:=0
				End if 
			: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
				
				DB_SetOutFIlterSalesPersons(->[CONTACTS:1])
				
				DB_SetOutFIlterRoles(->[CONTACTS:1])
				
				DB_SetoutFilterCoStatus(->[CONTACTS:1])
				
				//TYPE(SAME AS CO)-BUT POTENTIALLY DIFFERENT LIST
				DB_SetoutFilterCoType(->[CONTACTS:1])
				//source
				DB_SetOutputFiltersSources(->[CONTACTS:1])
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
				
				
				If (Records in table:C83([HEADINGS:84])>0)
					DB_SetOutputFilterHeadings
				Else 
					ARRAY TEXT:C222(DB_at_HeadingNames; 0)
					ARRAY TEXT:C222(DB_at_HeadingCodes; 0)
				End if 
				If (Not:C34(LAY_bo_AccTypesSetup))
					LAY_bo_AccTypesSetup:=True:C214
					ACC_l_Both:=1
					ACC_l_ProfitSheet:=0
					ACC_l_BalanceSheet:=0
				End if 
			: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCTS:9]))
				DB_SetOutFilterGroups
				
				//Groups
				DB_SetOutFIlterBrands
				
				//brands
				DB_setOutFilterCollections
				//catalogue
			: (DB_l_CurrentDisplayedForm=Table:C252(->[ORDERS:24])) | (DB_l_CurrentDisplayedForm=Table:C252(->[ORDER_ITEMS:25]))
				
				//state
				//sales person²
				//type²
				//area²
				//period
				//if are viewing orders we can allow the filter by states-but not include enquiries and quotes-if viewing quotes then no states.
				DB_SetOutFIlterSalesPersons(->[ORDERS:24])
				
				DB_SetoutFilterCoType(->[ORDERS:24])
				
				DB_SetoutFilterAreas(->[ORDERS:24])
				
				DB_SetOutFilterPeriods(->[ORDERS:24])
				
				If (Not:C34(LAY_bo_OrdStatesSetup))
					DB_SetOutFilterRecordStates(->[ORDERS:24])
					
				End if 
				
				If (Not:C34(LAY_bo_ORDsourcesSetup))
					DB_SetOutputFiltersSources(->[ORDERS:24])
				End if 
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTRACTS:17]))
				DB_SetOutFilterContractTypes
				
				If (Not:C34(LAY_bo_ContStatesSetup))
					LAY_bo_ContStatesSetup:=True:C214
					CONT_l_Both:=1
					CONT_l_Open:=0
					CONT_l_Closed:=0
				End if 
				//open closed
			: (DB_l_CurrentDisplayedForm=Table:C252(->[CURRENT_STOCK:62]))
				
				
				DB_SetOutFilterStockTypes(->[CURRENT_STOCK:62])
				
				
				
				
				//location
				DB_SetoutfilterLocations
				//layer
				//anal
				//currency
				If (<>StockAnal)
					DB_SetOutFiltersAnalysis(->[CURRENT_STOCK:62])
					
				Else 
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				
				
				DB_SetoutFilterLayers(->[CURRENT_STOCK:62])
				
				
				$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[CURRENT_STOCK:62])
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[DIARY:12]))  //<<  << <
				DB_SetOutFIlterSalesPersons(->[DIARY:12])
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[DOCUMENTS:7]))  //<< <,
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES:39])) | (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES_ITEMS:161]))
				
				
				
				
				
				
				DB_SetoutfilterCreditStages
				
				DB_SetOutFilterPeriods(->[INVOICES:39])
				
				//analy
				If (Records in table:C83([ANALYSES:36])>0)
					DB_SetOutFiltersAnalysis(->[INVOICES:39])
				Else 
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
					
					
					DB_SetoutFilterLayers(->[INVOICES:39])
					
				Else 
					ARRAY TEXT:C222(LAY_at_laycode; 0)
					ARRAY TEXT:C222(LAY_at_layName; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
				End if 
				If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
					
					$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[INVOICES:39])
				Else 
					ARRAY TEXT:C222(CUR_at_curcode; 0)
					ARRAY TEXT:C222(CUR_at_CurName; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
				End if 
				
				DB_SetoutFilterAreas(->[INVOICES:39])
				
				
				If (Not:C34(LAY_bo_InvoiceStateSetup))
					LAY_bo_InvoiceStateSetup:=True:C214
					INV_l_Both:=1
					INV_l_Open:=0
					INV_l_Closed:=0
				End if 
				
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[JOB PERSONNEL:48]))
				
				//Job type
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[JOB_STAGES:47]))
				
				//type
				//sales person
				//analysis
				
				//layers
				//currency
			: (DB_l_CurrentDisplayedForm=Table:C252(->[JOBS:26]))
				
				//type
				//stage
				//sales person
				//analysis
				If (Records in table:C83([ANALYSES:36])>0)
					DB_SetOutFiltersAnalysis(->[JOBS:26])
				Else 
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				//layers
				//currency
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[PROJECTS:89]))
				
				//state
				//type
				//manager
			: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_ORDERS:57])) | (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				//state
				
				If (Not:C34(LAY_bo_POStatesSetup))
					DB_SetOutFilterRecordStates(->[PURCHASE_ORDERS:57])
				End if 
				
				If (Records in table:C83([ANALYSES:36])>0)
					DB_SetOutFiltersAnalysis(->[PURCHASE_ORDERS:57])
				Else 
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
					
					
					DB_SetoutFilterLayers(->[PURCHASE_ORDERS:57])
					
					
				Else 
					ARRAY TEXT:C222(LAY_at_laycode; 0)
					ARRAY TEXT:C222(LAY_at_layName; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
				End if 
				If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
					
					$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[PURCHASE_ORDERS:57])
				Else 
					ARRAY TEXT:C222(CUR_at_curcode; 0)
					ARRAY TEXT:C222(CUR_at_CurName; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
				End if 
				
				If (Not:C34(LAY_bo_POPeriodsSetup))
					DB_SetOutFilterPeriods(->[PURCHASE_ORDERS:57])
					
					//ACC_ad_PeriodFrom
				End if 
				
				//analysis
				//layers
				//currency
				//periodss
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICES:37])) | (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				
				If (Not:C34(LAY_bo_PIPeriodsSetup))
					DB_SetOutFilterPeriods(->[PURCHASE_INVOICES:37])
					
					//ACC_ad_PeriodFrom
				End if 
				
				//periods
				//analysis
				//layers
				//currency
				If (Records in table:C83([ANALYSES:36])>0)
					DB_SetOutFiltersAnalysis(->[PURCHASE_INVOICES:37])
				Else 
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
					
					DB_SetoutFilterLayers(->[PURCHASE_INVOICES:37])
				Else 
					ARRAY TEXT:C222(LAY_at_laycode; 0)
					ARRAY TEXT:C222(LAY_at_layName; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
				End if 
				If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
					
					$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[PURCHASE_INVOICES:37])
				Else 
					ARRAY TEXT:C222(CUR_at_curcode; 0)
					ARRAY TEXT:C222(CUR_at_CurName; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
				End if 
				
				//deliverred, not delivered- not applicable to payments
				//credit stage
				//not posted, batched, posted
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[SERVICE_CALLS:20]))  //
				
				
				//open closed both
				//contract type
				//problem type
				//solution type
				//call handler
			: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				
				
				If (Not:C34(LAY_bo_MoveTypesSetup))
					DB_SetOutFilterMoveTypes(->[STOCK_MOVEMENT_ITEMS:27])
				End if 
				
				
				//Movement type
				If (Not:C34(LAY_bo_StockTypesSetup))
					DB_SetOutFilterStockTypes(->[STOCK_MOVEMENT_ITEMS:27])
					
				End if 
				
				
				//stock type(add to)
				//analysis
				//layers
				//currency
				If (Records in table:C83([ANALYSES:36])>0)
					DB_SetOutFiltersAnalysis(->[STOCK_MOVEMENT_ITEMS:27])
				Else 
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
					
					DB_SetoutFilterLayers(->[STOCK_MOVEMENTS:40])
					
				Else 
					ARRAY TEXT:C222(LAY_at_laycode; 0)
					ARRAY TEXT:C222(LAY_at_layName; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
				End if 
				If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
					
					$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[STOCK_MOVEMENT_ITEMS:27])
				Else 
					ARRAY TEXT:C222(CUR_at_curcode; 0)
					ARRAY TEXT:C222(CUR_at_CurName; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
				End if 
				
				//periods
				
				If (Not:C34(LAY_bo_STKIPeriodsSetup))
					DB_SetOutFilterPeriods(->[STOCK_MOVEMENTS:40])
					
					
					//ACC_ad_PeriodFrom
				End if 
				//Purchase order
				//Sales order
				//Serial numbered
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_LEVELS:58]))
				
				//type
				If (Not:C34(LAY_bo_StockTypesSetup))
					DB_SetOutFilterStockTypes(->[STOCK_LEVELS:58])
				End if 
				
				If (Records in table:C83([ANALYSES:36])>0)
					DB_SetOutFiltersAnalysis(->[STOCK_LEVELS:58])
				Else 
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
					
					
					DB_SetoutFilterLayers(->[STOCK_LEVELS:58])
					
				Else 
					ARRAY TEXT:C222(LAY_at_laycode; 0)
					ARRAY TEXT:C222(LAY_at_layName; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
				End if 
				If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
					
					$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[STOCK_LEVELS:58])
				Else 
					ARRAY TEXT:C222(CUR_at_curcode; 0)
					ARRAY TEXT:C222(CUR_at_CurName; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
				End if 
				//analysis
				//layers
				//currency
				//show 0 quantitys
			: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENTS:40]))
				
				//type
				If (Not:C34(LAY_bo_MoveTypesSetup))
					DB_SetOutFilterMoveTypes(->[STOCK_MOVEMENTS:40])
				End if 
				If (Records in table:C83([ANALYSES:36])>0)
					DB_SetOutFiltersAnalysis(->[STOCK_MOVEMENTS:40])
				Else 
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
					
					
					DB_SetoutFilterLayers(->[STOCK_MOVEMENTS:40])
					
				Else 
					ARRAY TEXT:C222(LAY_at_laycode; 0)
					ARRAY TEXT:C222(LAY_at_layName; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
				End if 
				If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
					
					$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[STOCK_MOVEMENTS:40])
				Else 
					ARRAY TEXT:C222(CUR_at_curcode; 0)
					ARRAY TEXT:C222(CUR_at_CurName; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
				End if 
				//analysis
				//layers
				//currency
				//periods
				If (Not:C34(LAY_bo_STKIPeriodsSetup))
					DB_SetOutFilterPeriods(->[STOCK_MOVEMENTS:40])
				End if 
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCHES:30]))
				If (Not:C34(LAY_bo_PeriodsSetup))
					DB_SetOutFilterPeriods(->[ACCOUNT_BALANCES:34])
					//ACC_ad_PeriodFrom
				End if 
				
				//periods
				//not posted,batched, posted
				//analysis
				//layers
				//currenty
				If (Records in table:C83([ANALYSES:36])>0)
					DB_SetOutFiltersAnalysis(->[TRANSACTION_BATCHES:30])
				Else 
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
					
					
					DB_SetoutFilterLayers(->[TRANSACTION_BATCHES:30])
					
				Else 
					ARRAY TEXT:C222(LAY_at_laycode; 0)
					ARRAY TEXT:C222(LAY_at_layName; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
				End if 
				If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
					
					$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[TRANSACTION_BATCHES:30])
				Else 
					ARRAY TEXT:C222(CUR_at_curcode; 0)
					ARRAY TEXT:C222(CUR_at_CurName; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
				End if 
				//invoice/purchase/nominal/job
			: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTIONS:29]))
				If (Not:C34(LAY_bo_PeriodsSetup))
					DB_SetOutFilterPeriods(->[ACCOUNT_BALANCES:34])  //Uses the account balances as the filter
					
					
					//ACC_ad_PeriodFrom
				End if 
				
				
				//periods
				//not posted,batched, posted
				//analysis
				//layers
				//currenty
				If (Records in table:C83([ANALYSES:36])>0)
					DB_SetOutFiltersAnalysis(->[TRANSACTIONS:29])
				Else 
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
					
				End if 
				If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
					
					DB_SetoutFilterLayers(->[TRANSACTIONS:29])
				Else 
					ARRAY TEXT:C222(LAY_at_laycode; 0)
					ARRAY TEXT:C222(LAY_at_layName; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
					ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
				End if 
				If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
					
					$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[TRANSACTIONS:29])
				Else 
					ARRAY TEXT:C222(CUR_at_curcode; 0)
					ARRAY TEXT:C222(CUR_at_CurName; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
					ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
				End if 
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[WORKFLOW_CONTROL:51]))
				
		End case 
		DB_bo_FiltersActivated:=True:C214
	End if 
	$_l_IndexD:=$1
	If ($1#0)
		$_l_IndexRef:=Find in array:C230(DB_al_FilterIDs; $1)
		If ($_l_IndexRef>0)
			
			DB_T_CurrentFilterName:=DB_at_FilterNames{Find in array:C230(DB_al_FilterIDs; $1)}
		Else 
			DB_T_CurrentFilterName:=""
		End if 
		
	Else 
		DB_T_CurrentFilterName:=""
	End if 
	
	DB_al_FilterIDs{0}:=$1
	
	$_l_TableNumber:=$2
	If ($_l_IndexD<0)
		
		
		QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$_l_IndexD)
		If (Records in selection:C76([x_QUERY_PARAMETERS:134])>0)
			$_l_offset:=0
			Case of 
				: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
					For ($_l_Index; 1; Size of array:C274(LAY_at_SPinitials))
						LAY_abo_SPInclude{$_l_Index}:=False:C215
						LAY_abo_SPExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(LAY_abo_CountryInclude))
						LAY_abo_CountryInclude{$_l_Index}:=False:C215
						LAY_abo_CountryExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_CountyNames))
						LAY_abo_CountyInclude{$_l_Index}:=False:C215
						LAY_abo_CountyExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_AreaCodes))
						LAY_abo_AreasInclude{$_l_Index}:=False:C215
						LAY_abo_AreasExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_TypesCodes))
						LAY_abo_TypesInclude{$_l_Index}:=False:C215
						LAY_abo_TypesExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_StatusCodes))
						LAY_abo_StatusInclude{$_l_Index}:=False:C215
						LAY_abo_StatusExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_SourceCodes))
						LAY_abo_SourcesInclude{$_l_Index}:=False:C215
						LAY_abo_SourcesExclude{$_l_Index}:=True:C214
					End for 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						ARRAY TEXT:C222($_at_include; 0)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
						For ($_l_Index; 1; Size of array:C274($_at_include))
							$_l_ValueRow:=Find in array:C230(LAY_at_SPinitials; $_at_include{$_l_Index})
							If ($_l_ValueRow>0)
								LAY_abo_SPInclude{$_l_ValueRow}:=True:C214
								LAY_abo_SPExclude{$_l_ValueRow}:=False:C215
							End if 
						End for 
						
						ARRAY TEXT:C222($_at_include; 0)
						If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
							BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
							For ($_l_Index; 1; Size of array:C274($_at_include))
								$_l_ValueRow:=Find in array:C230(DB_at_CountryNames; $_at_include{$_l_Index})
								If ($_l_ValueRow>0)
									LAY_abo_CountryInclude{$_l_ValueRow}:=True:C214
									LAY_abo_CountryExclude{$_l_ValueRow}:=False:C215
								End if 
							End for 
							ARRAY TEXT:C222($_at_include; 0)
							CO_l_Company:=1
							CO_l_PrivateAddress:=0
							If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
								BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
								For ($_l_Index; 1; Size of array:C274($_at_include))
									$_l_ValueRow:=Find in array:C230(DB_at_CountyNames; $_at_include{$_l_Index})
									If ($_l_ValueRow>0)
										LAY_abo_CountyInclude{$_l_ValueRow}:=True:C214
										LAY_abo_CountyExclude{$_l_ValueRow}:=False:C215
									End if 
								End for 
								
								ARRAY TEXT:C222($_at_include; 0)
								If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
									BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
									For ($_l_Index; 1; Size of array:C274($_at_include))
										$_l_ValueRow:=Find in array:C230(DB_at_AreaCodes; $_at_include{$_l_Index})
										If ($_l_ValueRow>0)
											LAY_abo_AreasInclude{$_l_ValueRow}:=True:C214
											LAY_abo_AreasExclude{$_l_ValueRow}:=False:C215
										End if 
									End for 
									
									
									
									
									//```
									ARRAY TEXT:C222($_at_include; 0)
									If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
										BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
										For ($_l_Index; 1; Size of array:C274($_at_include))
											$_l_ValueRow:=Find in array:C230(DB_at_TypesCodes; $_at_include{$_l_Index})
											If ($_l_ValueRow>0)
												LAY_abo_TypesInclude{$_l_ValueRow}:=True:C214
												LAY_abo_TypesExclude{$_l_ValueRow}:=False:C215
											End if 
										End for 
										
										ARRAY TEXT:C222($_at_include; 0)
										If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
											BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
											For ($_l_Index; 1; Size of array:C274($_at_include))
												$_l_ValueRow:=Find in array:C230(DB_at_StatusCodes; $_at_include{$_l_Index})
												If ($_l_ValueRow>0)
													LAY_abo_StatusInclude{$_l_ValueRow}:=True:C214
													LAY_abo_StatusExclude{$_l_ValueRow}:=False:C215
												End if 
											End for 
											
											
											
											
											
											//````
											ARRAY TEXT:C222($_at_include; 0)
											If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
												
												BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
												For ($_l_Index; 1; Size of array:C274($_at_include))
													$_l_ValueRow:=Find in array:C230(DB_at_SourceCodes; $_at_include{$_l_Index})
													If ($_l_ValueRow>0)
														LAY_abo_SourcesInclude{$_l_ValueRow}:=True:C214
														LAY_abo_SourcesExclude{$_l_ValueRow}:=False:C215
													End if 
												End for 
												
												If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
													BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; CO_l_Company; $_l_offset)
													If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
														BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; CO_l_PrivateAddress; $_l_offset)
													End if 
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
					
					
					
				: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
					For ($_l_Index; 1; Size of array:C274(LAY_at_SPinitials))
						LAY_abo_SPInclude{$_l_Index}:=False:C215
						LAY_abo_SPExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_RoleCodes))
						LAY_abo_RoleInclude{$_l_Index}:=False:C215
						LAY_abo_RoleExclude{$_l_Index}:=True:C214
					End for 
					
					
					For ($_l_Index; 1; Size of array:C274(DB_at_TypesCodes))
						LAY_abo_TypesInclude{$_l_Index}:=False:C215
						LAY_abo_TypesExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_StatusCodes))
						LAY_abo_StatusInclude{$_l_Index}:=False:C215
						LAY_abo_StatusExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_SourceCodes))
						LAY_abo_SourcesInclude{$_l_Index}:=False:C215
						LAY_abo_SourcesExclude{$_l_Index}:=True:C214
					End for 
					ARRAY TEXT:C222($_at_include; 0)
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
						For ($_l_Index; 1; Size of array:C274($_at_include))
							$_l_ValueRow:=Find in array:C230(LAY_at_SPinitials; $_at_include{$_l_Index})
							If ($_l_ValueRow>0)
								LAY_abo_SPInclude{$_l_ValueRow}:=True:C214
								LAY_abo_SPExclude{$_l_ValueRow}:=False:C215
							End if 
						End for 
						
						//``
						ARRAY TEXT:C222($_at_include; 0)
						If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
							BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
							For ($_l_Index; 1; Size of array:C274($_at_include))
								$_l_ValueRow:=Find in array:C230(DB_at_RoleCodes; $_at_include{$_l_Index})
								If ($_l_ValueRow>0)
									LAY_abo_RoleInclude{$_l_ValueRow}:=True:C214
									LAY_abo_RoleExclude{$_l_ValueRow}:=False:C215
								End if 
							End for 
							
							
							
							
							//````
							
							ARRAY TEXT:C222($_at_include; 0)
							If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
								BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
								For ($_l_Index; 1; Size of array:C274($_at_include))
									$_l_ValueRow:=Find in array:C230(DB_at_StatusCodes; $_at_include{$_l_Index})
									If ($_l_ValueRow>0)
										LAY_abo_StatusInclude{$_l_ValueRow}:=True:C214
										LAY_abo_StatusExclude{$_l_ValueRow}:=False:C215
									End if 
								End for 
								
								
								
								ARRAY TEXT:C222($_at_include; 0)
								If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
									BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
									For ($_l_Index; 1; Size of array:C274($_at_include))
										$_l_ValueRow:=Find in array:C230(DB_at_TypesCodes; $_at_include{$_l_Index})
										If ($_l_ValueRow>0)
											LAY_abo_TypesInclude{$_l_ValueRow}:=True:C214
											LAY_abo_TypesExclude{$_l_ValueRow}:=False:C215
										End if 
									End for 
									
									
									
									
									
									ARRAY TEXT:C222($_at_include; 0)
									If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
										BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
										For ($_l_Index; 1; Size of array:C274($_at_include))
											$_l_ValueRow:=Find in array:C230(DB_at_SourceCodes; $_at_include{$_l_Index})
											If ($_l_ValueRow>0)
												LAY_abo_SourcesInclude{$_l_ValueRow}:=True:C214
												LAY_abo_SourcesExclude{$_l_ValueRow}:=False:C215
											End if 
										End for 
									End if 
								End if 
							End if 
						End if 
					End if 
					
					
					
					
				: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
					For ($_l_Index; 1; Size of array:C274(DB_at_HeadingCodes))
						LAY_abo_HeadingInclude{$_l_Index}:=False:C215
						LAY_abo_HeadingExclude{$_l_Index}:=True:C214
					End for 
					ACC_l_ProfitSheet:=0
					ACC_l_BalanceSheet:=0
					ACC_l_Both:=1
					
					
					
					
					ARRAY TEXT:C222($_at_include; 0)
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
						For ($_l_Index; 1; Size of array:C274($_at_include))
							$_l_ValueRow:=Find in array:C230(DB_at_HeadingCodes; $_at_include{$_l_Index})
							If ($_l_ValueRow>0)
								LAY_abo_HeadingInclude{$_l_ValueRow}:=True:C214
								LAY_abo_HeadingExclude{$_l_ValueRow}:=False:C215
							End if 
						End for 
						
						//now be careful not to exclude any that you have included by heads
						If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
							BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ProfitSheet; $_l_offset)
							
							If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
								BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_BalanceSheet; $_l_offset)
								
								
							End if 
						End if 
					End if 
					
					
				: ($_l_TableNumber=Table:C252(->[ORDERS:24]))  //zTRACE
					
					For ($_l_Index; 1; Size of array:C274(LAY_at_SPinitials))
						LAY_abo_SPInclude{$_l_Index}:=False:C215
						LAY_abo_SPExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_TypesCodes))
						LAY_abo_TypesInclude{$_l_Index}:=False:C215
						LAY_abo_TypesExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_AreaCodes))
						LAY_abo_AreasInclude{$_l_Index}:=False:C215
						LAY_abo_AreasExclude{$_l_Index}:=True:C214
					End for 
					
					For ($_l_Index; 1; Size of array:C274(DB_at_StatesCodes))
						LAY_abo_StatesInclude{$_l_Index}:=False:C215
						LAY_abo_StatesExclude{$_l_Index}:=True:C214
					End for 
					
					For ($_l_Index; 1; Size of array:C274(DB_at_SourceCodes))
						LAY_abo_SourcesInclude{$_l_Index}:=False:C215
						LAY_abo_SourcesExclude{$_l_Index}:=True:C214
					End for 
					ARRAY TEXT:C222($_at_include; 0)
					ACC_l_ContextualFilterFrom:=0
					ACC_l_ContextualFilterTo:=0
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(LAY_at_SPinitials; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_SPInclude{$_l_ValueRow}:=True:C214
							LAY_abo_SPExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					//```
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_TypesCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_TypesInclude{$_l_ValueRow}:=True:C214
							LAY_abo_TypesExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					//````
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_AreaCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_AreasInclude{$_l_ValueRow}:=True:C214
							LAY_abo_AreasExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					//```
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_StatesCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_StatesInclude{$_l_ValueRow}:=True:C214
							LAY_abo_StatesExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					//``
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_SourceCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_SourcesInclude{$_l_ValueRow}:=True:C214
							LAY_abo_SourcesExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
						ACC_at_PeriodFromCode{0}:=$_t_Variable
					End if 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
						ACC_at_PeriodTOCode{0}:=$_t_Variable
					End if 
					
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterFrom; $_l_offset)
					End if 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterTo; $_l_offset)
					End if 
				: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
					
					For ($_l_Index; 1; Size of array:C274(LAY_at_SPinitials))
						LAY_abo_SPInclude{$_l_Index}:=False:C215
						LAY_abo_SPExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_TypesCodes))
						LAY_abo_TypesInclude{$_l_Index}:=False:C215
						LAY_abo_TypesExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_AreaCodes))
						LAY_abo_AreasInclude{$_l_Index}:=False:C215
						LAY_abo_AreasExclude{$_l_Index}:=True:C214
					End for 
					
					For ($_l_Index; 1; Size of array:C274(DB_at_StatesCodes))
						LAY_abo_StatesInclude{$_l_Index}:=False:C215
						LAY_abo_StatesExclude{$_l_Index}:=True:C214
					End for 
					
					
					ARRAY TEXT:C222($_at_include; 0)
					ACC_l_ContextualFilterFrom:=0
					ACC_l_ContextualFilterTo:=0
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(LAY_at_SPinitials; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_SPInclude{$_l_ValueRow}:=True:C214
							LAY_abo_SPExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					//```
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_TypesCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_TypesInclude{$_l_ValueRow}:=True:C214
							LAY_abo_TypesExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					//````
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_AreaCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_AreasInclude{$_l_ValueRow}:=True:C214
							LAY_abo_AreasExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					//```
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_StatesCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_StatesInclude{$_l_ValueRow}:=True:C214
							LAY_abo_StatesExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
						ACC_at_PeriodFromCode{0}:=$_t_Variable
					End if 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
						ACC_at_PeriodTOCode{0}:=$_t_Variable
					End if 
					//``
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_SourceCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_SourcesInclude{$_l_ValueRow}:=True:C214
							LAY_abo_SourcesExclude{$_l_Index}:=False:C215
						End if 
					End for 
					
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterFrom; $_l_offset)
					End if 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterTo; $_l_offset)
					End if 
					
					
					
				: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
					For ($_l_Index; 1; Size of array:C274(DB_at_GroupCodes))
						LAY_abo_GroupsInclude{$_l_Index}:=False:C215
						LAY_abo_GroupsExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_BrandCodes))
						LAY_abo_BrandsInclude{$_l_Index}:=False:C215
						LAY_abo_BrandsExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_al_CollectionIDS))
						LAY_abo_CollectionsInclude{$_l_Index}:=False:C215
						LAY_abo_CollectionsExclude{$_l_Index}:=True:C214
					End for 
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_GroupCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_GroupsInclude{$_l_ValueRow}:=True:C214
							LAY_abo_GroupsExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					
					//```````
					ARRAY TEXT:C222($_at_include; 0)
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_BrandCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_BrandsInclude{$_l_ValueRow}:=True:C214
							LAY_abo_BrandsExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					//````
					
					ARRAY LONGINT:C221($_al_Include; 0)
					$_bo_IncludeNoCatalogue:=False:C215
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_al_Include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_al_Include))
						$_l_ValueRow:=Find in array:C230(DB_al_CollectionIDS; $_al_Include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_CollectionsInclude{$_l_ValueRow}:=True:C214
							LAY_abo_CollectionsExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_bo_IncludeNoCatalogue; $_l_offset)
					If ($_bo_IncludeNoCatalogue)
						$_l_ValueRow:=Find in array:C230(DB_al_CollectionIDS; 0)
						If ($_l_ValueRow>0)
							LAY_abo_CollectionsInclude{$_l_ValueRow}:=True:C214
							LAY_abo_CollectionsExclude{$_l_ValueRow}:=False:C215
						End if 
					End if 
					
					
					
					
				: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
					Case of 
						: (DB_t_CurrentContext="BUDGETS")
						Else 
							For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
								ANAL_abo_Include{$_l_Index}:=False:C215
								ANAL_abo_Exclude{$_l_Index}:=True:C214
							End for 
							For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
								LAY_abo_Include{$_l_Index}:=False:C215
								LAY_abo_Exclude{$_l_Index}:=True:C214
							End for 
							For ($_l_Index; 1; Size of array:C274(CUR_at_curcode))
								CUR_abo_Include{$_l_Index}:=False:C215
								CUR_abo_Exclude{$_l_Index}:=True:C214
							End for 
							BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
							ACC_at_PeriodFromCode{0}:=$_t_Variable
							BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
							ACC_at_PeriodTOCode{0}:=$_t_Variable
							
							ARRAY TEXT:C222($_at_include; 0)
							BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
							For ($_l_Index; 1; Size of array:C274($_at_include))
								$_l_ValueRow:=Find in array:C230(ANAL_at_analcode; $_at_include{$_l_Index})
								If ($_l_ValueRow>0)
									ANAL_abo_Include{$_l_ValueRow}:=True:C214
									ANAL_abo_Exclude{$_l_ValueRow}:=False:C215
								End if 
							End for 
							
							ARRAY TEXT:C222($_at_include; 0)
							BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
							For ($_l_Index; 1; Size of array:C274($_at_include))
								$_l_ValueRow:=Find in array:C230(LAY_at_laycode; $_at_include{$_l_Index})
								If ($_l_ValueRow>0)
									LAY_abo_Include{$_l_ValueRow}:=True:C214
									LAY_abo_Exclude{$_l_ValueRow}:=False:C215
								End if 
							End for 
							
							
							
							ARRAY TEXT:C222($_at_include; 0)
							BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
							For ($_l_Index; 1; Size of array:C274($_at_include))
								$_l_ValueRow:=Find in array:C230(CUR_at_curcode; $_at_include{$_l_Index})
								If ($_l_ValueRow>0)
									CUR_abo_Include{$_l_ValueRow}:=True:C214
									CUR_abo_Exclude{$_l_ValueRow}:=False:C215
								End if 
							End for 
							ACC_l_BalanceSheet:=0
							ACC_l_ProfitSheet:=0
							ACC_l_Both:=1
							
							
							
							BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_BalanceSheet; $_l_offset)
							BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ProfitSheet; $_l_offset)
							ACC_l_ContextualFilterFrom:=0
							ACC_l_ContextualFilterTo:=0
							
							If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
								BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterFrom; $_l_offset)
							End if 
							If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
								BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterTo; $_l_offset)
							End if 
							
							
					End case 
				: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
					For ($_l_Index; 1; Size of array:C274(DB_at_StockTypesCodes))
						LAY_abo_StockTypeInclude{$_l_Index}:=False:C215
						LAY_abo_StockTypeExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_StockLocCodes))
						LAY_abo_LocationInclude{$_l_Index}:=False:C215
						LAY_abo_LocationExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
						ANAL_abo_Include{$_l_Index}:=False:C215
						ANAL_abo_Exclude{$_l_Index}:=True:C214
					End for 
					
					For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
						LAY_abo_Include{$_l_Index}:=False:C215
						LAY_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(CUR_at_curcode))
						CUR_abo_Include{$_l_Index}:=False:C215
						CUR_abo_Exclude{$_l_Index}:=True:C214
					End for 
					
					ARRAY TEXT:C222($_at_include; 0)
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_StockTypesCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_StockTypeInclude{$_l_ValueRow}:=True:C214
							LAY_abo_StockTypeExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					//``
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_StockLocCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_LocationInclude{$_l_ValueRow}:=True:C214
							LAY_abo_LocationExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					//```````
					ARRAY TEXT:C222($_at_include; 0)
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(ANAL_at_analcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							ANAL_abo_Include{$_l_ValueRow}:=True:C214
							ANAL_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					//````
					ARRAY TEXT:C222($_at_include; 0)
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(LAY_at_laycode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_Include{$_l_ValueRow}:=True:C214
							LAY_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					
					//````
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(CUR_at_curcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							CUR_abo_Include{$_l_ValueRow}:=True:C214
							CUR_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					CUR_bo_FilterZeros:=False:C215
					
					
					
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; CUR_bo_FilterZeros; $_l_offset)
					
					
				: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
					For ($_l_Index; 1; Size of array:C274(DB_at_CredStgCodes))
						LAY_abo_CredStgInclude{$_l_Index}:=False:C215
						LAY_abo_CredStgExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
						ANAL_abo_Include{$_l_Index}:=False:C215
						ANAL_abo_Exclude{$_l_Index}:=True:C214
					End for 
					
					For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
						LAY_abo_Include{$_l_Index}:=False:C215
						LAY_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(CUR_at_curcode))
						CUR_abo_Include{$_l_Index}:=False:C215
						CUR_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_AreaCodes))
						LAY_abo_AreasInclude{$_l_Index}:=False:C215
						LAY_abo_AreasExclude{$_l_Index}:=True:C214
					End for 
					
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_CredStgCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_CredStgInclude{$_l_ValueRow}:=True:C214
							LAY_abo_CredStgExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					//````
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(ANAL_at_analcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							ANAL_abo_Include{$_l_ValueRow}:=True:C214
							ANAL_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					//````
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(LAY_at_laycode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_Include{$_l_ValueRow}:=True:C214
							LAY_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					//```
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(CUR_at_curcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							CUR_abo_Include{$_l_ValueRow}:=True:C214
							CUR_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_AreaCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_AreasInclude{$_l_ValueRow}:=True:C214
							LAY_abo_AreasExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					INV_l_Closed:=0
					INV_l_Open:=0
					INV_l_Both:=1
					
					
					
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodFromCode{0}:=$_t_Variable
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodTOCode{0}:=$_t_Variable
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; INV_l_Open; $_l_offset)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; INV_l_Closed; $_l_offset)
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterFrom; $_l_offset)
					End if 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterTo; $_l_offset)
					End if 
				: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
					For ($_l_Index; 1; Size of array:C274(DB_at_CredStgCodes))
						LAY_abo_CredStgInclude{$_l_Index}:=False:C215
						LAY_abo_CredStgExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
						ANAL_abo_Include{$_l_Index}:=False:C215
						ANAL_abo_Exclude{$_l_Index}:=True:C214
					End for 
					
					For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
						LAY_abo_Include{$_l_Index}:=False:C215
						LAY_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(CUR_at_curcode))
						CUR_abo_Include{$_l_Index}:=False:C215
						CUR_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_AreaCodes))
						LAY_abo_AreasInclude{$_l_Index}:=False:C215
						LAY_abo_AreasExclude{$_l_Index}:=True:C214
					End for 
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_CredStgCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_CredStgInclude{$_l_ValueRow}:=True:C214
							LAY_abo_CredStgExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(ANAL_at_analcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							ANAL_abo_Include{$_l_ValueRow}:=True:C214
							ANAL_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					//````
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(LAY_at_laycode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_Include{$_l_ValueRow}:=True:C214
							LAY_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					
					//````
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(CUR_at_curcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							CUR_abo_Include{$_l_ValueRow}:=True:C214
							CUR_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_AreaCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_AreasInclude{$_l_ValueRow}:=True:C214
							LAY_abo_AreasExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					INV_l_Closed:=0
					INV_l_Open:=0
					INV_l_Both:=1
					
					
					
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodFromCode{0}:=$_t_Variable
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodTOCode{0}:=$_t_Variable
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; INV_l_Open; $_l_offset)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; INV_l_Closed; $_l_offset)
					INV_l_Both:=Num:C11((INV_l_Open=0) & (INV_l_Closed=0))
					
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterFrom; $_l_offset)
					End if 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterTo; $_l_offset)
					End if 
				: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
					
					For ($_l_Index; 1; Size of array:C274(DB_at_StatesCodes))
						LAY_abo_StatesInclude{$_l_Index}:=False:C215
						LAY_abo_StatesExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
						ANAL_abo_Include{$_l_Index}:=False:C215
						ANAL_abo_Exclude{$_l_Index}:=True:C214
					End for 
					
					For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
						LAY_abo_Include{$_l_Index}:=False:C215
						LAY_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(CUR_at_curcode))
						CUR_abo_Include{$_l_Index}:=False:C215
						CUR_abo_Exclude{$_l_Index}:=True:C214
					End for 
					
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_StatesCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_StatesInclude{$_l_ValueRow}:=True:C214
							LAY_abo_StatesExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					//```
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(ANAL_at_analcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							ANAL_abo_Include{$_l_ValueRow}:=True:C214
							ANAL_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					//``
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(LAY_at_laycode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_Include{$_l_ValueRow}:=True:C214
							LAY_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					
					//``
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(CUR_at_curcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							CUR_abo_Include{$_l_ValueRow}:=True:C214
							CUR_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodFromCode{0}:=$_t_Variable
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodTOCode{0}:=$_t_Variable
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterFrom; $_l_offset)
					End if 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterTo; $_l_offset)
					End if 
					
				: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
					For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
						ANAL_abo_Include{$_l_Index}:=False:C215
						ANAL_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
						LAY_abo_Include{$_l_Index}:=False:C215
						LAY_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(CUR_at_curcode))
						CUR_abo_Include{$_l_Index}:=False:C215
						CUR_abo_Exclude{$_l_Index}:=True:C214
					End for 
					
					//```
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(ANAL_at_analcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							ANAL_abo_Include{$_l_ValueRow}:=True:C214
							ANAL_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					//``
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(LAY_at_laycode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_Include{$_l_ValueRow}:=True:C214
							LAY_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					//``
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(CUR_at_curcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							CUR_abo_Include{$_l_ValueRow}:=True:C214
							CUR_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodFromCode{0}:=$_t_Variable
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodTOCode{0}:=$_t_Variable
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterFrom; $_l_offset)
					End if 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterTo; $_l_offset)
					End if 
					
				: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					For ($_l_Index; 1; Size of array:C274(DB_at_MoveTypeCodes))
						LAY_abo_MoveTypesInclude{$_l_Index}:=False:C215
						LAY_abo_MoveTypesExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(DB_at_StockTypesCodes))
						LAY_abo_StockTypeInclude{$_l_Index}:=False:C215
						LAY_abo_StockTypeExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
						ANAL_abo_Include{$_l_Index}:=False:C215
						ANAL_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
						LAY_abo_Include{$_l_Index}:=False:C215
						LAY_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(CUR_at_curcode))
						CUR_abo_Include{$_l_Index}:=False:C215
						CUR_abo_Exclude{$_l_Index}:=True:C214
					End for 
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_MoveTypeCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_MoveTypesInclude{$_l_ValueRow}:=True:C214
							LAY_abo_MoveTypesExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_StockTypesCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_StockTypeInclude{$_l_ValueRow}:=True:C214
							LAY_abo_StockTypeExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(ANAL_at_analcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							ANAL_abo_Include{$_l_ValueRow}:=True:C214
							ANAL_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(LAY_at_laycode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_Include{$_l_ValueRow}:=True:C214
							LAY_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					
					//``
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(CUR_at_curcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							CUR_abo_Include{$_l_ValueRow}:=True:C214
							CUR_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodFromCode{0}:=$_t_Variable
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodTOCode{0}:=$_t_Variable
					SI_bo_FilterZeros:=False:C215
					
					
					
					ACC_l_ContextualFilterFrom:=0
					ACC_l_ContextualFilterTo:=0
					
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; SI_bo_FilterZeros; $_l_offset)
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterFrom; $_l_offset)
					End if 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterTo; $_l_offset)
					End if 
				: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
					
					For ($_l_Index; 1; Size of array:C274(DB_at_StockTypesCodes))
						LAY_abo_StockTypeInclude{$_l_Index}:=False:C215
						LAY_abo_StockTypeExclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
						ANAL_abo_Include{$_l_Index}:=False:C215
						ANAL_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
						LAY_abo_Include{$_l_Index}:=False:C215
						LAY_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(CUR_at_curcode))
						CUR_abo_Include{$_l_Index}:=False:C215
						CUR_abo_Exclude{$_l_Index}:=True:C214
					End for 
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_StockTypesCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_StockTypeInclude{$_l_ValueRow}:=True:C214
							LAY_abo_StockTypeExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					//``
					
					//```````
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(ANAL_at_analcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							ANAL_abo_Include{$_l_ValueRow}:=True:C214
							ANAL_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					//````
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(LAY_at_laycode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_Include{$_l_ValueRow}:=True:C214
							LAY_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					
					//````
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(CUR_at_curcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							CUR_abo_Include{$_l_ValueRow}:=True:C214
							CUR_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
				: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
					For ($_l_Index; 1; Size of array:C274(DB_at_MoveTypeCodes))
						LAY_abo_MoveTypesInclude{$_l_Index}:=False:C215
						LAY_abo_MoveTypesExclude{$_l_Index}:=True:C214
					End for 
					
					For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
						ANAL_abo_Include{$_l_Index}:=False:C215
						ANAL_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
						LAY_abo_Include{$_l_Index}:=False:C215
						LAY_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(CUR_at_curcode))
						CUR_abo_Include{$_l_Index}:=False:C215
						CUR_abo_Exclude{$_l_Index}:=True:C214
					End for 
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(DB_at_MoveTypeCodes; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_MoveTypesInclude{$_l_ValueRow}:=True:C214
							LAY_abo_MoveTypesExclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					
					
					ARRAY TEXT:C222($_at_include; 0)
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(ANAL_at_analcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							ANAL_abo_Include{$_l_ValueRow}:=True:C214
							ANAL_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(LAY_at_laycode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_Include{$_l_ValueRow}:=True:C214
							LAY_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					//``
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(CUR_at_curcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							CUR_abo_Include{$_l_ValueRow}:=True:C214
							CUR_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodFromCode{0}:=$_t_Variable
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodTOCode{0}:=$_t_Variable
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterFrom; $_l_offset)
					End if 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterTo; $_l_offset)
					End if 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCHES:30]))
					For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
						ANAL_abo_Include{$_l_Index}:=False:C215
						ANAL_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
						LAY_abo_Include{$_l_Index}:=False:C215
						LAY_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(CUR_at_curcode))
						CUR_abo_Include{$_l_Index}:=False:C215
						CUR_abo_Exclude{$_l_Index}:=True:C214
					End for 
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodFromCode{0}:=$_t_Variable
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodTOCode{0}:=$_t_Variable
					
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(ANAL_at_analcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							ANAL_abo_Include{$_l_ValueRow}:=True:C214
							ANAL_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(LAY_at_laycode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_Include{$_l_ValueRow}:=True:C214
							LAY_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					
					//``
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(CUR_at_curcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							CUR_abo_Include{$_l_ValueRow}:=True:C214
							CUR_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					ACC_l_ContextualFilterFrom:=0
					ACC_l_ContextualFilterTo:=0
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterFrom; $_l_offset)
					End if 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterTo; $_l_offset)
					End if 
					
				: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTIONS:29]))
					For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
						ANAL_abo_Include{$_l_Index}:=False:C215
						ANAL_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
						LAY_abo_Include{$_l_Index}:=False:C215
						LAY_abo_Exclude{$_l_Index}:=True:C214
					End for 
					For ($_l_Index; 1; Size of array:C274(CUR_at_curcode))
						CUR_abo_Include{$_l_Index}:=False:C215
						CUR_abo_Exclude{$_l_Index}:=True:C214
					End for 
					
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodFromCode{0}:=$_t_Variable
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_t_Variable; $_l_offset)
					ACC_at_PeriodTOCode{0}:=$_t_Variable
					
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(ANAL_at_analcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							ANAL_abo_Include{$_l_ValueRow}:=True:C214
							ANAL_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(LAY_at_laycode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							LAY_abo_Include{$_l_ValueRow}:=True:C214
							LAY_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					
					
					
					//``
					ARRAY TEXT:C222($_at_include; 0)
					BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_at_include; $_l_offset)
					
					For ($_l_Index; 1; Size of array:C274($_at_include))
						$_l_ValueRow:=Find in array:C230(CUR_at_curcode; $_at_include{$_l_Index})
						If ($_l_ValueRow>0)
							CUR_abo_Include{$_l_ValueRow}:=True:C214
							CUR_abo_Exclude{$_l_ValueRow}:=False:C215
						End if 
					End for 
					ACC_l_ContextualFilterFrom:=0
					ACC_l_ContextualFilterTo:=0
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterFrom; $_l_offset)
					End if 
					If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>$_l_offset)
						BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; ACC_l_ContextualFilterTo; $_l_offset)
					End if 
			End case 
		End if 
		
		SRCH_Applyfilterstoselection(Table:C252(DB_l_CurrentDisplayedForm))
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_LoadFilterParameters"; $_t_oldMethodName)