//%attributes = {}

If (False:C215)
	//Database Method Name:      SRCH_Applyfilterstoselection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/08/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ANAL_abo_Exclude;0)
	//ARRAY BOOLEAN(ANAL_abo_Include;0)
	//ARRAY BOOLEAN(CUR_abo_Exclude;0)
	//ARRAY BOOLEAN(CUR_abo_Include;0)
	//ARRAY BOOLEAN(LAY_ab_ActionExclude;0)
	//ARRAY BOOLEAN(LAY_ab_ActionInclude;0)
	//ARRAY BOOLEAN(LAY_ab_ResulInclude;0)
	//ARRAY BOOLEAN(LAY_ab_ResultExclude;0)
	//ARRAY BOOLEAN(LAY_ab_ResultInclude;0)
	//ARRAY BOOLEAN(LAY_ab_Resultnclude;0)
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
	//ARRAY BOOLEAN(PRD_abo_Expanded;0)
	ARRAY DATE:C224($_ad_PeriodFromDates; 0)
	//ARRAY DATE(ACC_ad_PeriodFromFromDate;0)
	//ARRAY DATE(ACC_ad_PeriodFromToDate;0)
	//ARRAY DATE(ACC_ad_PeriodToFromDate;0)
	//ARRAY DATE(ACC_ad_PeriodToToDate;0)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	ARRAY LONGINT:C221($_al_Exclude; 0)
	ARRAY LONGINT:C221($_al_Include; 0)
	ARRAY LONGINT:C221($_al_PersonnelIDS; 0)
	//ARRAY LONGINT(DB_al_CollectionIDS;0)
	//ARRAY LONGINT(PRD_al_ProductID;0)
	//ARRAY PICTURE(PRD_aPic_Expanded;0)
	ARRAY TEXT:C222($_at_AddtoExclude; 0)
	ARRAY TEXT:C222($_at_AddToInclude; 0)
	ARRAY TEXT:C222($_at_Codes; 0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	ARRAY TEXT:C222($_at_Exclude; 0)
	ARRAY TEXT:C222($_at_ExcludeCountry; 0)
	ARRAY TEXT:C222($_at_ExcludeSalesPerson; 0)
	ARRAY TEXT:C222($_at_Include; 0)
	ARRAY TEXT:C222($_at_IncludeAnal; 0)
	ARRAY TEXT:C222($_at_IncludeCountries; 0)
	ARRAY TEXT:C222($_at_IncludeCurrency; 0)
	ARRAY TEXT:C222($_at_IncludeLayer; 0)
	ARRAY TEXT:C222($_at_IncludeSalesPerson; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	//ARRAY TEXT(ACC_at_BalanceSheetAccounts;0)
	//ARRAY TEXT(ACC_at_PeriodFromCode;0)
	//ARRAY TEXT(ACC_at_PeriodFromName;0)
	//ARRAY TEXT(ACC_at_PeriodToCode;0)
	//ARRAY TEXT(ACC_at_PeriodToName;0)
	//ARRAY TEXT(ACC_at_ProfitSheetAccounts;0)
	//ARRAY TEXT(ANAL_at_analcode;0)
	//ARRAY TEXT(CUR_at_curcode;0)
	//ARRAY TEXT(DB_at_AreaCodes;0)
	//ARRAY TEXT(DB_at_BrandCodes;0)
	//ARRAY TEXT(DB_at_CountryNames;0)
	//ARRAY TEXT(DB_at_CountyNames;0)
	//ARRAY TEXT(DB_at_CredStgCodes;0)
	//ARRAY TEXT(DB_at_GroupCodes;0)
	//ARRAY TEXT(DB_at_HeadingCodes;0)
	//ARRAY TEXT(DB_at_MoveTypeCodes;0)
	//ARRAY TEXT(DB_at_RoleCodes;0)
	//ARRAY TEXT(DB_at_SourceCodes;0)
	//ARRAY TEXT(DB_at_StatesCodes;0)
	//ARRAY TEXT(DB_at_StatusCodes;0)
	//ARRAY TEXT(DB_at_StockLocCodes;0)
	//ARRAY TEXT(DB_at_StockTypesCodes;0)
	//ARRAY TEXT(DB_at_TypesCodes;0)
	//ARRAY TEXT(LAY_at_ActionCodes;0)
	//ARRAY TEXT(LAY_at_laycode;0)
	//ARRAY TEXT(LAY_at_ResultCodes;0)
	//ARRAY TEXT(LAY_at_SPinitials;0)
	//ARRAY TEXT(PRD_at_STKHistoryName;0)
	//ARRAY TEXT(PRD_at_STKHistoryProducts;0)
	C_BOOLEAN:C305($_bo_ExcludeNoCatalogue; $_bo_FiltersActive; $_bo_IncludeNoCatalogue; $_bo_NoCatSetonInclude; $_bo_UseIncludeSet; ACC_bo_BSACCOUNTLOADED; ACC_bo_PSACCOUNTLOADED; CUR_bo_FilterDone; CUR_bo_FilterZeros; DB_bo_FiltersActivated; DB_bo_FiltersTouched)
	C_BOOLEAN:C305(DB_bo_ShowArrayBased; SI_bo_FilterAllocated; SI_bo_FilterZeros)
	C_LONGINT:C283($_l_AccountsLevel; $_l_FoundIndex; $_l_ID; $_l_Index; $_l_Offest; $_l_RecordsinBaseSelection; $_l_RecordsInSelection; $_l_RemovedFromSelection; $_l_TableNumber; ACC_l_BalanceSheet; ACC_l_ContextualFilterFrom)
	C_LONGINT:C283(ACC_l_ContextualFilterTo; ACC_l_ProfitSheet; CO_l_Company; CO_l_PrivateAddress; DB_but_ClearFiltersButton; DB_l_CurrentDisplayedForm; INV_l_Closed; INV_l_Open; vNo)
	C_PICTURE:C286($_Pic_LoadedPicture)
	C_POINTER:C301($1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_OldMethodName; CAT_t_CatViewCurrency; DB_t_CurrentContext; DB_t_FilterMessage)
End if 
//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("SRCH_Applyfilterstoselection")
If (Count parameters:C259>=1)
	If (DB_bo_FiltersActivated)
		
		$_l_TableNumber:=Table:C252($1)
		
		$_l_RecordsinBaseSelection:=Records in selection:C76($1->)
		$_bo_FiltersActive:=False:C215
		Case of 
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				ARRAY TEXT:C222($_at_IncludeSalesPerson; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SPInclude))
					If (LAY_abo_SPInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_IncludeSalesPerson; LAY_at_SPinitials{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_IncludeSalesPerson)>=1) & (Size of array:C274($_at_IncludeSalesPerson)<Size of array:C274(LAY_at_SPinitials))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_IncludeSalesPerson)=1)
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Sales_Person:29=$_at_IncludeSalesPerson{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]Sales_Person:29; $_at_IncludeSalesPerson)
					End if 
				End if 
				ARRAY TEXT:C222($_at_ExcludeSalesPerson; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SPExclude))
					If (LAY_abo_SPExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_ExcludeSalesPerson; LAY_at_SPinitials{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_ExcludeSalesPerson)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_ExcludeSalesPerson)=1)
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Sales_Person:29=$_at_ExcludeSalesPerson{1})
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]Sales_Person:29; $_at_ExcludeSalesPerson)
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//````
				ARRAY TEXT:C222($_at_IncludeCountries; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_CountryInclude))
					If (LAY_abo_CountryInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_IncludeCountries; DB_at_CountryNames{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_IncludeCountries)>=1) & (Size of array:C274($_at_IncludeCountries)<Size of array:C274(DB_at_CountryNames))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_IncludeCountries)=1)
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Country:8=$_at_IncludeCountries{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]Country:8; $_at_IncludeCountries)
					End if 
				End if 
				ARRAY TEXT:C222($_at_ExcludeCountry; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_CountryExclude))
					If (LAY_abo_CountryExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_ExcludeCountry; DB_at_CountryNames{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_ExcludeCountry)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_ExcludeCountry)=1)
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Country:8=$_at_ExcludeCountry{1})
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]Country:8; $_at_ExcludeCountry)
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//``````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_CountyInclude))
					If (LAY_abo_CountyInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_CountyNames{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_CountyNames))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]County_or_State:6=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]County_or_State:6; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_CountyExclude))
					If (LAY_abo_CountyExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_CountyNames{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]County_or_State:6=$_at_Exclude{1})
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]County_or_State:6; $_at_Exclude)
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				
				//``
				
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_AreasInclude))
					If (LAY_abo_AreasInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_AreaCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_AreaCodes))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Area:11=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]Area:11; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_AreasExclude))
					If (LAY_abo_AreasExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_AreaCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Area:11=$_at_Exclude{1})
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]Area:11; $_at_Exclude)
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//```
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_TypesInclude))
					If (LAY_abo_TypesInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_TypesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_abo_TypesInclude))
					$_bo_FiltersActive:=True:C214
					
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Company_Type:13=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]Company_Type:13; $_at_Include)
					End if 
					
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_TypesExclude))
					If (LAY_abo_TypesExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_TypesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Company_Type:13=$_at_Exclude{1})
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]Company_Type:13; $_at_Exclude)
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//```
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StatusInclude))
					If (LAY_abo_StatusInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_StatusCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_StatusCodes))
					$_bo_FiltersActive:=True:C214
					
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Status:12=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]Status:12; $_at_Include)
					End if 
					
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StatusExclude))
					If (LAY_abo_StatusExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_StatusCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Status:12=$_at_Exclude{1})
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]Status:12; $_at_Exclude)
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SourcesInclude))
					If (LAY_abo_SourcesInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_SourceCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_SourceCodes))
					$_bo_FiltersActive:=True:C214
					
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Source:14=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]Source:14; $_at_Include)
					End if 
					
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SourcesExclude))
					If (LAY_abo_SourcesExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_SourceCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Source:14=$_at_Exclude{1})
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([COMPANIES:2]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([COMPANIES:2]Source:14; $_at_Exclude)
						If (Records in selection:C76([COMPANIES:2])>0)
							CREATE SET:C116([COMPANIES:2]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//````
				If (CO_l_Company=1)
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Private:37=False:C215)
					
				End if 
				If (CO_l_PrivateAddress=1)
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Private:37=True:C214)
					
				End if 
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				CREATE SET:C116([DIARY:12]; "$temp")
				ARRAY TEXT:C222($_at_IncludeSalesPerson; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SPInclude))
					If (LAY_abo_SPInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_IncludeSalesPerson; LAY_at_SPinitials{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_IncludeSalesPerson)>=1) & (Size of array:C274($_at_IncludeSalesPerson)<Size of array:C274(LAY_at_SPinitials))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_IncludeSalesPerson)=1)
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_at_IncludeSalesPerson{1})
						QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]Initials:1#"")
						$_l_ID:=[PERSONNEL:11]Personnel_ID:48
						UNLOAD RECORD:C212([PERSONNEL:11])
						SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_Codes)
						QUERY WITH ARRAY:C644([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_Codes)
						QUERY SELECTION:C341([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_ID)
						If (Records in selection:C76([DIARY_ITEMOWNERS:106])>0) & (False:C215)
							DISTINCT VALUES:C339([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_DiaryCodes)
							UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
							CREATE SET:C116([DIARY:12]; "$Set1")
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Diary_Code:3; $_at_DiaryCodes)
							CREATE SET:C116([DIARY:12]; "$Set2")
							USE SET:C118("$set1")
							QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Person:8=$_at_IncludeSalesPerson{1})
							CREATE SET:C116([DIARY:12]; "$Set3")
							UNION:C120("$Set3"; "$Set2"; "$Set1")
							USE SET:C118("$Set1")
							$_bo_UseIncludeSet:=True:C214
							//this has not modified the selection of diary items..
						Else 
							QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Person:8=$_at_IncludeSalesPerson{1})
							CREATE SET:C116([DIARY:12]; "$Set1")
							$_bo_UseIncludeSet:=True:C214
						End if 
					Else 
						QUERY WITH ARRAY:C644([PERSONNEL:11]Initials:1; $_at_IncludeSalesPerson)
						QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]Initials:1#"")
						SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; $_al_PersonnelIDS)
						UNLOAD RECORD:C212([PERSONNEL:11])
						SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_Codes)
						QUERY WITH ARRAY:C644([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_Codes)
						QUERY SELECTION WITH ARRAY:C1050([DIARY_ITEMOWNERS:106]PERSONNEL_ID:2; $_al_PersonnelIDS)
						If (Records in selection:C76([DIARY_ITEMOWNERS:106])>0) & (False:C215)
							DISTINCT VALUES:C339([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_DiaryCodes)
							UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
							CREATE SET:C116([DIARY:12]; "$Set1")
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Diary_Code:3; $_at_DiaryCodes)
							CREATE SET:C116([DIARY:12]; "$Set2")
							USE SET:C118("$set1")
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Person:8; $_at_IncludeSalesPerson)
							CREATE SET:C116([DIARY:12]; "$Set3")
							UNION:C120("$Set3"; "$Set2"; "$Set1")
							USE SET:C118("$Set1")
							$_bo_UseIncludeSet:=True:C214
							//this has not modified the selection of diary items..
						Else 
							
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Person:8; $_at_IncludeSalesPerson)
							CREATE SET:C116([DIARY:12]; "$Set1")
							$_bo_UseIncludeSet:=True:C214
						End if 
					End if 
				End if 
				
				ARRAY TEXT:C222($_at_ExcludeSalesPerson; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SPExclude))
					If (LAY_abo_SPExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_ExcludeSalesPerson; LAY_at_SPinitials{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_ExcludeSalesPerson)>=1)
					$_bo_FiltersActive:=True:C214
					
					If (Size of array:C274($_at_ExcludeSalesPerson)=1)
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_at_ExcludeSalesPerson{1})
						QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]Initials:1#"")
						$_l_ID:=[PERSONNEL:11]Personnel_ID:48
						UNLOAD RECORD:C212([PERSONNEL:11])
						SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_Codes)
						QUERY WITH ARRAY:C644([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_Codes)
						QUERY SELECTION:C341([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_ID)
						If (Records in selection:C76([DIARY_ITEMOWNERS:106])>0) & (False:C215)
							DISTINCT VALUES:C339([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_DiaryCodes)
							UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
							CREATE SET:C116([DIARY:12]; "$Set1")
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Diary_Code:3; $_at_DiaryCodes)
							CREATE SET:C116([DIARY:12]; "$Set2")
							USE SET:C118("$set1")
							QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Person:8=$_at_ExcludeSalesPerson{1})
							
							CREATE SET:C116([DIARY:12]; "$Set3")
							UNION:C120("$Set3"; "$Set2"; "$Set1")  //set 1 is the set to exclude
							
							USE SET:C118("$Set1")
							DIFFERENCE:C122("$Temp"; "$Set1"; "$Temp")
							
							
							USE SET:C118("$temp")
							
							//this has not modified the selection of diary items..
						Else 
							CREATE SET:C116([DIARY:12]; "$temp")
							QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Person:8=$_at_ExcludeSalesPerson{1})
							If (Records in selection:C76([DIARY:12])>0)
								CREATE SET:C116([DIARY:12]; "$_at_Exclude")
								DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
							End if 
							USE SET:C118("$temp")
							
						End if 
						
						////
						
						
						
						
					Else 
						///
						
						QUERY WITH ARRAY:C644([PERSONNEL:11]Initials:1; $_at_ExcludeSalesPerson)
						QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]Initials:1#"")
						SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; $_al_PersonnelIDS)
						UNLOAD RECORD:C212([PERSONNEL:11])
						SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_Codes)
						QUERY WITH ARRAY:C644([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_Codes)
						QUERY SELECTION WITH ARRAY:C1050([DIARY_ITEMOWNERS:106]PERSONNEL_ID:2; $_al_PersonnelIDS)
						QUERY SELECTION:C341([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1#"")
						
						If (Records in selection:C76([DIARY_ITEMOWNERS:106])>0) & (False:C215)
							DISTINCT VALUES:C339([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_DiaryCodes)
							UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
							CREATE SET:C116([DIARY:12]; "$Set1")
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Diary_Code:3; $_at_DiaryCodes)
							CREATE SET:C116([DIARY:12]; "$Set2")
							USE SET:C118("$set1")
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Person:8; $_at_ExcludeSalesPerson)
							CREATE SET:C116([DIARY:12]; "$Set3")
							UNION:C120("$Set3"; "$Set2"; "$Set1")
							USE SET:C118("$Set1")
							DIFFERENCE:C122("$Temp"; "$Set1"; "$Temp")
							USE SET:C118("$temp")
							//this has not modified the selection of diary items..
						Else 
							
							CREATE SET:C116([DIARY:12]; "$temp")
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Person:8; $_at_ExcludeSalesPerson)
							If (Records in selection:C76([DIARY:12])>0)
								CREATE SET:C116([DIARY:12]; "$_at_Exclude")
								DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
							End if 
							USE SET:C118("$temp")
						End if 
						
						
						///
						
					End if 
					
				End if 
				//////
				
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_ab_ActionInclude))
					If (LAY_ab_ActionInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; LAY_at_ActionCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_at_ActionCodes))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Action_Code:9=$_at_Include{1})
						CREATE SET:C116([DIARY:12]; "$Set1")
					Else 
						QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Action_Code:9; $_at_Include)
						CREATE SET:C116([DIARY:12]; "$Set1")
					End if 
				End if 
				
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_ab_ActionExclude))
					If (LAY_ab_ActionExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; LAY_at_ActionCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					
					If (Size of array:C274($_at_Exclude)=1)
						
						CREATE SET:C116([DIARY:12]; "$temp")
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Action_Code:9=$_at_Exclude{1})
						If (Records in selection:C76([DIARY:12])>0)
							CREATE SET:C116([DIARY:12]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
						
						////
						
						
						
						
					Else 
						///
						
						
						CREATE SET:C116([DIARY:12]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Action_Code:9; $_at_Exclude)
						If (Records in selection:C76([DIARY:12])>0)
							CREATE SET:C116([DIARY:12]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
					
					
					///
					
				End if 
				
				////
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_ab_Resultinclude))
					If (LAY_ab_ResultInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; LAY_at_ResultCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_at_ResultCodes))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Result_Code:11=$_at_Include{1})
						CREATE SET:C116([DIARY:12]; "$Set1")
					Else 
						QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Result_Code:11; $_at_Include)
						CREATE SET:C116([DIARY:12]; "$Set1")
					End if 
				End if 
				
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_ab_ResultExclude))
					If (LAY_ab_ResultExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; LAY_at_ResultCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					
					If (Size of array:C274($_at_Exclude)=1)
						
						CREATE SET:C116([DIARY:12]; "$temp")
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Result_Code:11=$_at_Exclude{1})
						If (Records in selection:C76([DIARY:12])>0)
							CREATE SET:C116([DIARY:12]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
						
						////
						
						
						
						
					Else 
						///
						
						
						CREATE SET:C116([DIARY:12]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Result_Code:11; $_at_Exclude)
						If (Records in selection:C76([DIARY:12])>0)
							CREATE SET:C116([DIARY:12]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
					
					
					///
					
				End if 
				
				If (CUR_bo_FilterDone)
					QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Done:14=False:C215)
				End if 
				
				
				
				
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				ARRAY TEXT:C222($_at_IncludeSalesPerson; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SPInclude))
					If (LAY_abo_SPInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_IncludeSalesPerson; LAY_at_SPinitials{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_IncludeSalesPerson)>=1) & (Size of array:C274($_at_IncludeSalesPerson)<Size of array:C274(LAY_at_SPinitials))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_IncludeSalesPerson)=1)
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Sales_Person:25=$_at_IncludeSalesPerson{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([CONTACTS:1]Sales_Person:25; $_at_IncludeSalesPerson)
					End if 
				End if 
				ARRAY TEXT:C222($_at_ExcludeSalesPerson; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SPExclude))
					If (LAY_abo_SPExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_ExcludeSalesPerson; LAY_at_SPinitials{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_ExcludeSalesPerson)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_ExcludeSalesPerson)=1)
						CREATE SET:C116([CONTACTS:1]; "$temp")
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Sales_Person:25=$_at_ExcludeSalesPerson{1})
						If (Records in selection:C76([CONTACTS:1])>0)
							CREATE SET:C116([CONTACTS:1]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([CONTACTS:1]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([CONTACTS:1]Sales_Person:25; $_at_ExcludeSalesPerson)
						If (Records in selection:C76([CONTACTS:1])>0)
							CREATE SET:C116([CONTACTS:1]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//``
				
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_RoleInclude))
					If (LAY_abo_RoleInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_RoleCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_RoleCodes))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Role:11=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([CONTACTS:1]Role:11; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_RoleExclude))
					If (LAY_abo_RoleExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_RoleCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([CONTACTS:1]; "$temp")
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Role:11=$_at_Exclude{1})
						If (Records in selection:C76([CONTACTS:1])>0)
							CREATE SET:C116([CONTACTS:1]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([CONTACTS:1]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([CONTACTS:1]Role:11; $_at_Exclude)
						If (Records in selection:C76([CONTACTS:1])>0)
							CREATE SET:C116([CONTACTS:1]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				
				//````
				
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StatusInclude))
					If (LAY_abo_StatusInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_StatusCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_StatusCodes))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Status:14=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([CONTACTS:1]Status:14; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StatusExclude))
					If (LAY_abo_StatusExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_StatusCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([CONTACTS:1]; "$temp")
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Status:14=$_at_Exclude{1})
						If (Records in selection:C76([CONTACTS:1])>0)
							CREATE SET:C116([CONTACTS:1]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([CONTACTS:1]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([CONTACTS:1]Status:14; $_at_Exclude)
						If (Records in selection:C76([CONTACTS:1])>0)
							CREATE SET:C116([CONTACTS:1]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_TypesInclude))
					If (LAY_abo_TypesInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_TypesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_TypesCodes))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Contact_Type:15=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([CONTACTS:1]Contact_Type:15; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_TypesExclude))
					If (LAY_abo_TypesExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_TypesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([CONTACTS:1]; "$temp")
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Contact_Type:15=$_at_Exclude{1})
						If (Records in selection:C76([CONTACTS:1])>0)
							CREATE SET:C116([CONTACTS:1]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([CONTACTS:1]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([CONTACTS:1]Contact_Type:15; $_at_Exclude)
						If (Records in selection:C76([CONTACTS:1])>0)
							CREATE SET:C116([CONTACTS:1]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SourcesInclude))
					If (LAY_abo_SourcesInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_SourceCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_SourceCodes))
					$_bo_FiltersActive:=True:C214
					
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Source:16=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([CONTACTS:1]Source:16; $_at_Include)
					End if 
					
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SourcesExclude))
					If (LAY_abo_SourcesExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_SourceCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([CONTACTS:1]; "$temp")
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Source:16=$_at_Exclude{1})
						If (Records in selection:C76([CONTACTS:1])>0)
							CREATE SET:C116([CONTACTS:1]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([CONTACTS:1]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([CONTACTS:1]Source:16; $_at_Exclude)
						If (Records in selection:C76([CONTACTS:1])>0)
							CREATE SET:C116([CONTACTS:1]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
				ARRAY TEXT:C222($_at_AddToInclude; 0)
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_HeadingInclude))
					If (LAY_abo_HeadingInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_HeadingCodes{$_l_Index})
					End if 
				End for 
				ALL RECORDS:C47([HEADINGS:84])
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_HeadingCodes))
					$_bo_FiltersActive:=True:C214
					COPY ARRAY:C226($_at_Include; $_at_AddToInclude)
					Repeat 
						QUERY WITH ARRAY:C644([HEADINGS:84]Level_Up_Code:4; $_at_AddToInclude)
						If (Records in selection:C76([HEADINGS:84])>0)
							For ($_l_Index; 1; Size of array:C274($_at_AddToInclude))
								$_l_FoundIndex:=Find in array:C230($_at_Include; $_at_AddToInclude{$_l_Index})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911($_at_Include; $_at_AddToInclude{$_l_Index})
								End if 
							End for 
							SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_AddToInclude)
						Else 
							For ($_l_Index; 1; Size of array:C274($_at_AddToInclude))
								$_l_FoundIndex:=Find in array:C230($_at_Include; $_at_AddToInclude{$_l_Index})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911($_at_Include; $_at_AddToInclude{$_l_Index})
								End if 
							End for 
							ARRAY TEXT:C222($_at_AddToInclude; 0)
						End if 
					Until (Size of array:C274($_at_AddToInclude)=0)
					If (Size of array:C274($_at_Include)=1)
						ALL RECORDS:C47([HEADINGS:84])
						
						QUERY SELECTION:C341([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=$_at_Include{1})
						QUERY SELECTION WITH ARRAY:C1050([HEADINGS:84]Heading_Code:1; $_at_Include)
						
					Else 
						ALL RECORDS:C47([HEADINGS:84])
						QUERY SELECTION WITH ARRAY:C1050([ACCOUNTS:32]Report_Heading:1; $_at_Include)
						QUERY SELECTION WITH ARRAY:C1050([HEADINGS:84]Heading_Code:1; $_at_Include)
					End if 
				End if 
				//now be careful not to exclude any that you have included by heads
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_HeadingExclude))
					If (LAY_abo_HeadingExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_HeadingCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					COPY ARRAY:C226($_at_Exclude; $_at_AddtoExclude)
					Repeat 
						QUERY WITH ARRAY:C644([HEADINGS:84]Level_Up_Code:4; $_at_AddtoExclude)
						If (Records in selection:C76([HEADINGS:84])>0)
							For ($_l_Index; 1; Size of array:C274($_at_AddtoExclude))
								$_l_FoundIndex:=Find in array:C230($_at_Exclude; $_at_AddtoExclude{$_l_Index})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911($_at_Exclude; $_at_AddtoExclude{$_l_Index})
								End if 
							End for 
							SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_AddtoExclude)
						Else 
							For ($_l_Index; 1; Size of array:C274($_at_AddtoExclude))
								$_l_FoundIndex:=Find in array:C230($_at_Include; $_at_AddtoExclude{$_l_Index})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911($_at_Exclude; $_at_AddtoExclude{$_l_Index})
								End if 
							End for 
							ARRAY TEXT:C222($_at_AddtoExclude; 0)
						End if 
					Until (Size of array:C274($_at_AddToInclude)=0)
					If (Size of array:C274($_at_Include)>0)
						For ($_l_Index; 1; Size of array:C274($_at_Include))
							$_l_FoundIndex:=Find in array:C230($_at_Exclude; $_at_Include{$_l_Index})
							If ($_l_FoundIndex>0)
								DELETE FROM ARRAY:C228($_at_Exclude; $_l_FoundIndex)
							End if 
						End for 
						
					End if 
				End if 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([ACCOUNTS:32]; "$temp")
						CREATE SET:C116([HEADINGS:84]; "$TempH")
						QUERY SELECTION:C341([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=$_at_Exclude{1})
						QUERY SELECTION:C341([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$_at_Exclude{1})
						
						If (Records in selection:C76([ACCOUNTS:32])>0)
							CREATE SET:C116([ACCOUNTS:32]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						If (Records in selection:C76([HEADINGS:84])>0)
							CREATE SET:C116([HEADINGS:84]; "$exclude2")
							DIFFERENCE:C122("$TempH"; "$exclude2"; "$TempH")
						End if 
						USE SET:C118("$TempH")
						
					Else 
						CREATE SET:C116([ACCOUNTS:32]; "$temp")
						CREATE SET:C116([HEADINGS:84]; "$TempH")
						QUERY SELECTION WITH ARRAY:C1050([ACCOUNTS:32]Report_Heading:1; $_at_Exclude)
						QUERY SELECTION WITH ARRAY:C1050([HEADINGS:84]Heading_Code:1; $_at_Exclude)
						If (Records in selection:C76([ACCOUNTS:32])>0)
							CREATE SET:C116([ACCOUNTS:32]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						If (Records in selection:C76([HEADINGS:84])>0)
							CREATE SET:C116([HEADINGS:84]; "$exclude2")
							DIFFERENCE:C122("$TempH"; "$exclude2"; "$TempH")
						End if 
						USE SET:C118("$TempH")
					End if 
				End if 
				
				If (ACC_l_ProfitSheet=1)
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="P")
				End if 
				If (ACC_l_BalanceSheet=1)
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="B")
				End if 
				LAY_LoadAccountsArrays(False:C215)
				
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				ARRAY TEXT:C222($_at_IncludeSalesPerson; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SPInclude))
					If (LAY_abo_SPInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_IncludeSalesPerson; LAY_at_SPinitials{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_IncludeSalesPerson)>=1) & (Size of array:C274($_at_IncludeSalesPerson)<Size of array:C274(LAY_at_SPinitials))
					
					
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_IncludeSalesPerson)=1)
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Person:5=$_at_IncludeSalesPerson{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]Person:5; $_at_IncludeSalesPerson)
					End if 
				End if 
				ARRAY TEXT:C222($_at_ExcludeSalesPerson; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SPExclude))
					If (LAY_abo_SPExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_ExcludeSalesPerson; LAY_at_SPinitials{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_ExcludeSalesPerson)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_ExcludeSalesPerson)=1)
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Person:5=$_at_ExcludeSalesPerson{1})
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]Person:5; $_at_ExcludeSalesPerson)
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//```
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_TypesInclude))
					If (LAY_abo_TypesInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_TypesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_TypesCodes))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Type:43=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]Order_Type:43; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_TypesExclude))
					If (LAY_abo_TypesExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_TypesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Type:43=$_at_Exclude{1})
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]Order_Type:43; $_at_Exclude)
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_AreasInclude))
					If (LAY_abo_AreasInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_AreaCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_AreaCodes))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Area_Code:35=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]Area_Code:35; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_AreasExclude))
					If (LAY_abo_AreasExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_AreaCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Area_Code:35=$_at_Exclude{1})
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]Area_Code:35; $_at_Exclude)
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//```
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StatesInclude))
					If (LAY_abo_StatesInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; "024"+DB_at_StatesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_StatesCodes))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StatesExclude))
					If (LAY_abo_StatesExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; "024"+DB_at_StatesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=$_at_Exclude{1})
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_Exclude)
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//``
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SourcesInclude))
					If (LAY_abo_SourcesInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_SourceCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_SourceCodes))
					$_bo_FiltersActive:=True:C214
					
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Source:18=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]Source:18; $_at_Include)
					End if 
					
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SourcesExclude))
					If (LAY_abo_SourcesExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_SourceCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Source:18=$_at_Exclude{1})
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]Source:18; $_at_Exclude)
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//TRACE
				If (ACC_l_ContextualFilterFrom>0)
					$_l_Offest:=ACC_l_ContextualFilterFrom
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							If (Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
								ACC_at_PeriodFromName{1}:=[PERIODS:33]Period_Name:2
								INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
								ACC_at_PeriodFromCode{1}:=[PERIODS:33]Period_Code:1
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]From_Date:3
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]To_Date:4
								ACC_at_PeriodFromCode:=1
							End if 
							
							
						Else 
							ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{1})
						End if 
						ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodToCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode}>ACC_ad_PeriodToFromDate{$_l_FoundIndex})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911(ACC_at_PeriodToName; ACC_at_PeriodFromName{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; ACC_ad_PeriodFromToDate{ACC_at_PeriodFromCode})
									$_l_FoundIndex:=Size of array:C274(ACC_ad_PeriodToToDate)
									
								End if 
								ACC_at_PeriodToCode:=$_l_FoundIndex
								ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
							End if 
						End if 
					End if 
				End if 
				If (ACC_l_ContextualFilterTo>0)
					$_l_Offest:=ACC_l_ContextualFilterTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							
							If (Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								APPEND TO ARRAY:C911(ACC_at_PeriodToName; [PERIODS:33]Period_Name:2)
								APPEND TO ARRAY:C911(ACC_at_PeriodToCode; [PERIODS:33]Period_Code:1)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; [PERIODS:33]From_Date:3)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; [PERIODS:33]To_Date:4)
								ACC_at_PeriodToCode:=Size of array:C274(ACC_ad_PeriodToToDate)
							End if 
							
						Else 
							ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{1})
							
						End if 
						ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{$_l_FoundIndex}>ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodToCode{ACC_at_PeriodToCode})
								If ($_l_FoundIndex<0)
									INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
									ACC_at_PeriodFromName{1}:=ACC_at_PeriodToName{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
									ACC_at_PeriodFromCode{1}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									$_l_FoundIndex:=1
								End if 
								ACC_at_PeriodFromCode:=$_l_FoundIndex
								ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
								
							End if 
						End if 
					End if 
					
				End if 
				
				If (ACC_at_PeriodFromCode{0}#"")
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Period:42>=ACC_at_PeriodFromCode{0})
				End if 
				If (ACC_at_PeriodTOCode{0}#"")
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Period:42<=ACC_at_PeriodTOCode{0})
				End if 
				
				vNo:=Records in selection:C76([ORDERS:24])
			: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
				
				
				ARRAY TEXT:C222($_at_IncludeSalesPerson; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SPInclude))
					If (LAY_abo_SPInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_IncludeSalesPerson; LAY_at_SPinitials{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_IncludeSalesPerson)>=1) & (Size of array:C274($_at_IncludeSalesPerson)<Size of array:C274(LAY_at_SPinitials))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_IncludeSalesPerson)=1)
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Person:14=$_at_IncludeSalesPerson{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Person:14; $_at_IncludeSalesPerson)
					End if 
				End if 
				ARRAY TEXT:C222($_at_ExcludeSalesPerson; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_SPExclude))
					If (LAY_abo_SPExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_ExcludeSalesPerson; LAY_at_SPinitials{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_ExcludeSalesPerson)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_ExcludeSalesPerson)=1)
						CREATE SET:C116([ORDER_ITEMS:25]; "$temp")
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Person:14=$_at_ExcludeSalesPerson{1})
						If (Records in selection:C76([ORDER_ITEMS:25])>0)
							CREATE SET:C116([ORDER_ITEMS:25]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([ORDER_ITEMS:25]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Person:14; $_at_ExcludeSalesPerson)
						If (Records in selection:C76([ORDER_ITEMS:25])>0)
							CREATE SET:C116([ORDER_ITEMS:25]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//```
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_TypesInclude))
					If (LAY_abo_TypesInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_TypesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_TypesCodes))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Type:43=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]Order_Type:43; $_at_Include)
					End if 
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp")
					RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
					INTERSECTION:C121("$temp"; "$Temp2"; "$Temp")
					USE SET:C118("$Temp")
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_TypesExclude))
					If (LAY_abo_TypesExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_TypesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Type:43=$_at_Exclude{1})
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
						RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
						CREATE SET:C116([ORDER_ITEMS:25]; "$Temp3")
						INTERSECTION:C121("$temp2"; "$Temp3"; "$Temp2")
						USE SET:C118("$Temp2")
						
					Else 
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]Order_Type:43; $_at_Exclude)
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
						RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
						CREATE SET:C116([ORDER_ITEMS:25]; "$Temp3")
						INTERSECTION:C121("$temp2"; "$Temp3"; "$Temp2")
						USE SET:C118("$Temp2")
						
						
					End if 
				End if 
				//````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_AreasInclude))
					If (LAY_abo_AreasInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_AreaCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_AreaCodes))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Area_Code:35=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]Area_Code:35; $_at_Include)
					End if 
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
					RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp3")
					INTERSECTION:C121("$temp2"; "$Temp3"; "$Temp2")
					USE SET:C118("$Temp2")
					
					
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_AreasExclude))
					If (LAY_abo_AreasExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_AreaCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Area_Code:35=$_at_Exclude{1})
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
						RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
						CREATE SET:C116([ORDER_ITEMS:25]; "$Temp3")
						INTERSECTION:C121("$temp2"; "$Temp3"; "$Temp2")
						USE SET:C118("$Temp2")
						
					Else 
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]Area_Code:35; $_at_Exclude)
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
						RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
						CREATE SET:C116([ORDER_ITEMS:25]; "$Temp3")
						INTERSECTION:C121("$temp2"; "$Temp3"; "$Temp2")
						USE SET:C118("$Temp2")
						
					End if 
				End if 
				//```
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StatesInclude))
					If (LAY_abo_StatesInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; "024"+DB_at_StatesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_StatesCodes))
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
					RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
					
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_Include)
					End if 
					RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
					
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp3")
					INTERSECTION:C121("$temp2"; "$Temp3"; "$Temp2")
					USE SET:C118("$Temp2")
					
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StatesExclude))
					If (LAY_abo_StatesExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; "024"+DB_at_StatesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=$_at_Exclude{1})
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
						RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
						CREATE SET:C116([ORDER_ITEMS:25]; "$Temp3")
						INTERSECTION:C121("$temp2"; "$Temp3"; "$Temp2")
						USE SET:C118("$Temp2")
						
					Else 
						CREATE SET:C116([ORDERS:24]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_Exclude)
						If (Records in selection:C76([ORDERS:24])>0)
							CREATE SET:C116([ORDERS:24]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
						RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
						CREATE SET:C116([ORDER_ITEMS:25]; "$Temp3")
						INTERSECTION:C121("$temp2"; "$Temp3"; "$Temp2")
						USE SET:C118("$Temp2")
						
					End if 
				End if 
				//``
				//TRACE
				If (ACC_l_ContextualFilterFrom>0)
					$_l_Offest:=ACC_l_ContextualFilterFrom
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							If (Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
								ACC_at_PeriodFromName{1}:=[PERIODS:33]Period_Name:2
								INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
								ACC_at_PeriodFromCode{1}:=[PERIODS:33]Period_Code:1
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]From_Date:3
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]To_Date:4
								ACC_at_PeriodFromCode:=1
							End if 
							
							
						Else 
							ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{1})
						End if 
						ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodToCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode}>ACC_ad_PeriodToFromDate{$_l_FoundIndex})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911(ACC_at_PeriodToName; ACC_at_PeriodFromName{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; ACC_ad_PeriodFromToDate{ACC_at_PeriodFromCode})
									$_l_FoundIndex:=Size of array:C274(ACC_ad_PeriodToToDate)
									
								End if 
								ACC_at_PeriodToCode:=$_l_FoundIndex
								ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
							End if 
						End if 
					End if 
				End if 
				If (ACC_l_ContextualFilterTo>0)
					$_l_Offest:=ACC_l_ContextualFilterTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							
							If (Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								APPEND TO ARRAY:C911(ACC_at_PeriodToName; [PERIODS:33]Period_Name:2)
								APPEND TO ARRAY:C911(ACC_at_PeriodToCode; [PERIODS:33]Period_Code:1)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; [PERIODS:33]From_Date:3)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; [PERIODS:33]To_Date:4)
								ACC_at_PeriodToCode:=Size of array:C274(ACC_ad_PeriodToToDate)
							End if 
							
						Else 
							ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{1})
							
						End if 
						ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{$_l_FoundIndex}>ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodToCode{ACC_at_PeriodToCode})
								If ($_l_FoundIndex<0)
									INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
									ACC_at_PeriodFromName{1}:=ACC_at_PeriodToName{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
									ACC_at_PeriodFromCode{1}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									$_l_FoundIndex:=1
								End if 
								ACC_at_PeriodFromCode:=$_l_FoundIndex
								ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
								
							End if 
						End if 
					End if 
					
				End if 
				
				If (ACC_at_PeriodFromCode{0}#"")
					$_bo_FiltersActive:=True:C214
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Period:42>=ACC_at_PeriodFromCode{0})
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
					RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp3")
					INTERSECTION:C121("$temp2"; "$Temp3"; "$Temp2")
					USE SET:C118("$Temp2")
					
				End if 
				If (ACC_at_PeriodTOCode{0}#"")
					$_bo_FiltersActive:=True:C214
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Period:42<=ACC_at_PeriodTOCode{0})
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
					RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp3")
					INTERSECTION:C121("$temp2"; "$Temp3"; "$Temp2")
					USE SET:C118("$Temp2")
					
				End if 
				
				vNo:=Records in selection:C76([ORDER_ITEMS:25])
				
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_GroupsInclude))
					If (LAY_abo_GroupsInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_GroupCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_GroupCodes))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Group_Code:3=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PRODUCTS:9]Group_Code:3; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_GroupsExclude))
					If (LAY_abo_GroupsExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_GroupCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([PRODUCTS:9]; "$temp")
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Group_Code:3=$_at_Exclude{1})
						If (Records in selection:C76([PRODUCTS:9])>0)
							CREATE SET:C116([PRODUCTS:9]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([PRODUCTS:9]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([PRODUCTS:9]Group_Code:3; $_at_Exclude)
						If (Records in selection:C76([PRODUCTS:9])>0)
							CREATE SET:C116([PRODUCTS:9]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//```````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_BrandsInclude))
					If (LAY_abo_BrandsInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_BrandCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_BrandCodes))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Brand_Code:4=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PRODUCTS:9]Brand_Code:4; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_BrandsExclude))
					If (LAY_abo_BrandsExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_BrandCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([PRODUCTS:9]; "$temp")
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Brand_Code:4=$_at_Exclude{1})
						If (Records in selection:C76([PRODUCTS:9])>0)
							CREATE SET:C116([PRODUCTS:9]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([PRODUCTS:9]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([PRODUCTS:9]Brand_Code:4; $_at_Exclude)
						If (Records in selection:C76([PRODUCTS:9])>0)
							CREATE SET:C116([PRODUCTS:9]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//````
				CREATE SET:C116([PRODUCTS:9]; "$Base")
				CREATE SET:C116([PRODUCTS:9]; "$Base2")
				ARRAY LONGINT:C221($_al_Include; 0)
				$_bo_IncludeNoCatalogue:=False:C215
				$_bo_NoCatSetonInclude:=False:C215
				For ($_l_Index; 1; Size of array:C274(LAY_abo_CollectionsInclude))
					If (LAY_abo_CollectionsInclude{$_l_Index})
						If (DB_al_CollectionIDS{$_l_Index}#0)
							APPEND TO ARRAY:C911($_al_Include; DB_al_CollectionIDS{$_l_Index})
						Else 
							$_bo_IncludeNoCatalogue:=True:C214
						End if 
					End if 
				End for 
				If (Size of array:C274($_al_Include)>=1) & (Size of array:C274($_al_Include)<Size of array:C274(DB_al_CollectionIDS))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_al_Include)=1)
						QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=$_al_Include{1})
					Else 
						QUERY WITH ARRAY:C644([CATALOGUE:108]x_ID:1; $_al_Include)
					End if 
					//now get the Products_In those catalogues
					CAT_t_CatViewCurrency:=<>SYS_t_BaseCurrency
					CREATE EMPTY SET:C140([PRODUCTS:9]; "$_at_Include")
					For ($_l_Index; 1; Records in selection:C76([CATALOGUE:108]))
						CAT_LoadProducts([CATALOGUE:108]x_ID:1; CAT_t_CatViewCurrency; False:C215; [CATALOGUE:108]xCatalogueClass:9; [CATALOGUE:108]xMacroName:12)
						CREATE SET:C116([PRODUCTS:9]; "$includeThisCat")
						UNION:C120("$_at_Include"; "$includeThisCat"; "$_at_Include")
						NEXT RECORD:C51([CATALOGUE:108])
					End for 
					If (Not:C34($_bo_IncludeNoCatalogue))  //we do not want records that are in no catalogue so we have to get all the records that are in catalogues and Exclude any that are in base that arer not in any of them.
						
						$_bo_NoCatSetonInclude:=True:C214
						USE SET:C118("$Base")
						//here would need to get ALL catalogues and exclude any in BASE that are not in one of the catalogues
						QUERY WITH ARRAY:C644([CATALOGUE:108]x_ID:1; DB_al_CollectionIDS)
						CREATE EMPTY SET:C140([PRODUCTS:9]; "$Include2")
						For ($_l_Index; 1; Records in selection:C76([CATALOGUE:108]))
							CAT_LoadProducts([CATALOGUE:108]x_ID:1; CAT_t_CatViewCurrency; False:C215; [CATALOGUE:108]xCatalogueClass:9; [CATALOGUE:108]xMacroName:12)
							CREATE SET:C116([PRODUCTS:9]; "$includeThisCat")
							UNION:C120("$Include2"; "$includeThisCat"; "$Include2")
							NEXT RECORD:C51([CATALOGUE:108])
						End for 
						DIFFERENCE:C122("$Include2"; "$Base"; "$Base")
					End if 
					INTERSECTION:C121("$Base"; "$_at_Include"; "$_at_Include")
					USE SET:C118("$_at_Include")
				Else 
					CREATE SET:C116([PRODUCTS:9]; "$_at_Include")
					
				End if 
				//remember here only to Exclude products if they are not in one if the include catalogues.
				ARRAY LONGINT:C221($_al_Exclude; 0)
				
				$_bo_ExcludeNoCatalogue:=False:C215
				For ($_l_Index; 1; Size of array:C274(LAY_abo_CollectionsExclude))
					If (LAY_abo_CollectionsExclude{$_l_Index})
						If (DB_al_CollectionIDS{$_l_Index}#0)
							APPEND TO ARRAY:C911($_al_Exclude; DB_al_CollectionIDS{$_l_Index})
						Else 
							$_bo_ExcludeNoCatalogue:=True:C214
						End if 
						
					End if 
				End for 
				If (Size of array:C274($_al_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					
					If (Size of array:C274($_al_Exclude)=1)
						QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=$_al_Exclude{1})
					Else 
						QUERY WITH ARRAY:C644([CATALOGUE:108]x_ID:1; $_al_Exclude)
					End if 
					CAT_t_CatViewCurrency:=<>SYS_t_BaseCurrency
					CREATE EMPTY SET:C140([PRODUCTS:9]; "$_at_Exclude")
					For ($_l_Index; 1; Records in selection:C76([CATALOGUE:108]))
						CAT_LoadProducts([CATALOGUE:108]x_ID:1; CAT_t_CatViewCurrency; False:C215; [CATALOGUE:108]xCatalogueClass:9; [CATALOGUE:108]xMacroName:12)
						CREATE SET:C116([PRODUCTS:9]; "$excludeThisCat")
						UNION:C120("$_at_Exclude"; "$excludeThisCat"; "$_at_Exclude")
						NEXT RECORD:C51([CATALOGUE:108])
					End for 
					If ($_bo_ExcludeNoCatalogue) & (Not:C34($_bo_NoCatSetonInclude))  //we do not want records that are in no catalogue so we have to get all the records that are in catalogues and Exclude any that are in base that arer not in any of them.
						
						
						USE SET:C118("$Base")
						//here would need to get ALL catalogues and exclude any in BASE that are not in one of the catalogues
						QUERY WITH ARRAY:C644([CATALOGUE:108]x_ID:1; DB_al_CollectionIDS)
						CREATE EMPTY SET:C140([PRODUCTS:9]; "$exclude2")
						For ($_l_Index; 1; Records in selection:C76([CATALOGUE:108]))
							CAT_LoadProducts([CATALOGUE:108]x_ID:1; CAT_t_CatViewCurrency; False:C215; [CATALOGUE:108]xCatalogueClass:9; [CATALOGUE:108]xMacroName:12)
							CREATE SET:C116([PRODUCTS:9]; "$excludeThisCat")
							UNION:C120("$exclude2"; "$excludeThisCat"; "$exclude2")
							NEXT RECORD:C51([CATALOGUE:108])
						End for 
						UNION:C120("$exclude2"; "$_at_Exclude"; "$_at_Exclude")  //make a set of all the ones to exclude
						
					End if 
					DIFFERENCE:C122("$Base2"; "$_at_Exclude"; "$Base2")  //take out all the excludes from the base set(base2)
					
					//now we dont want to exclude any that are in the $_at_Include
					UNION:C120("$_at_Include"; "$Base2"; "$_at_Include")
					USE SET:C118("$_at_Include")
				End if 
				
				
			: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
				Case of 
					: (DB_t_CurrentContext="BUDGETS")
					Else 
						//TRACE
						If (ACC_l_ContextualFilterFrom>0)
							$_l_Offest:=ACC_l_ContextualFilterFrom
							QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
							If (Records in selection:C76([PERIODS:33])>0)
								SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
								SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
								If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
									If (Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})>0)
										ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})
									Else 
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
										INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
										ACC_at_PeriodFromName{1}:=[PERIODS:33]Period_Name:2
										INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
										ACC_at_PeriodFromCode{1}:=[PERIODS:33]Period_Code:1
										INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
										ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]From_Date:3
										INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
										ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]To_Date:4
										ACC_at_PeriodFromCode:=1
									End if 
									
									
								Else 
									ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{1})
								End if 
								ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
								
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodToCode{0})
								If ($_l_FoundIndex>0)
									If (ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode}>ACC_ad_PeriodToFromDate{$_l_FoundIndex})
										$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
										If ($_l_FoundIndex<0)
											APPEND TO ARRAY:C911(ACC_at_PeriodToName; ACC_at_PeriodFromName{ACC_at_PeriodFromCode})
											APPEND TO ARRAY:C911(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
											APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode})
											APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; ACC_ad_PeriodFromToDate{ACC_at_PeriodFromCode})
											$_l_FoundIndex:=Size of array:C274(ACC_ad_PeriodToToDate)
											
										End if 
										ACC_at_PeriodToCode:=$_l_FoundIndex
										ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
									End if 
								End if 
							End if 
						End if 
						If (ACC_l_ContextualFilterTo>0)
							$_l_Offest:=ACC_l_ContextualFilterTo
							QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
							If (Records in selection:C76([PERIODS:33])>0)
								SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
								SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
								If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
									
									If (Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})>0)
										ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})
									Else 
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
										APPEND TO ARRAY:C911(ACC_at_PeriodToName; [PERIODS:33]Period_Name:2)
										APPEND TO ARRAY:C911(ACC_at_PeriodToCode; [PERIODS:33]Period_Code:1)
										APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; [PERIODS:33]From_Date:3)
										APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; [PERIODS:33]To_Date:4)
										ACC_at_PeriodToCode:=Size of array:C274(ACC_ad_PeriodToToDate)
									End if 
									
								Else 
									ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{1})
									
								End if 
								ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
								
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0})
								If ($_l_FoundIndex>0)
									If (ACC_ad_PeriodFromFromDate{$_l_FoundIndex}>ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode})
										$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodToCode{ACC_at_PeriodToCode})
										If ($_l_FoundIndex<0)
											INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
											ACC_at_PeriodFromName{1}:=ACC_at_PeriodToName{ACC_at_PeriodToCode}
											INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
											ACC_at_PeriodFromCode{1}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
											INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
											ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
											INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
											ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
											$_l_FoundIndex:=1
										End if 
										ACC_at_PeriodFromCode:=$_l_FoundIndex
										ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
										
									End if 
								End if 
							End if 
							
						End if 
						
						If (ACC_at_PeriodFromCode{0}#"")
							$_bo_FiltersActive:=True:C214
							QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4>=ACC_at_PeriodFromCode{0})
						End if 
						If (ACC_at_PeriodTOCode{0}#"")
							$_bo_FiltersActive:=True:C214
							QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4<=ACC_at_PeriodTOCode{0})
						End if 
						ARRAY TEXT:C222($_at_IncludeAnal; 0)
						For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
							If (ANAL_abo_Include{$_l_Index})
								
								APPEND TO ARRAY:C911($_at_IncludeAnal; ANAL_at_analcode{$_l_Index})
							End if 
						End for 
						If (Size of array:C274($_at_IncludeAnal)>=1)
							$_bo_FiltersActive:=True:C214
							If (Size of array:C274($_at_IncludeAnal)=1)
								QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1=$_at_IncludeAnal{1})
							Else 
								QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Analysis_Code:1; $_at_IncludeAnal)
							End if 
						End if 
						ARRAY TEXT:C222($_at_Exclude; 0)
						For ($_l_Index; 1; Size of array:C274(ANAL_at_analcode))
							If (ANAL_abo_Exclude{$_l_Index})
								APPEND TO ARRAY:C911($_at_Exclude; ANAL_at_analcode{$_l_Index})
							End if 
						End for 
						If (Size of array:C274($_at_Exclude)>=1)
							$_bo_FiltersActive:=True:C214
							If (Size of array:C274($_at_Exclude)=1)
								CREATE SET:C116([ACCOUNT_BALANCES:34]; "$temp")
								QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1=$_at_Exclude{1})
								If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
									CREATE SET:C116([ACCOUNT_BALANCES:34]; "$_at_Exclude")
									DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
								End if 
								USE SET:C118("$temp")
								
							Else 
								CREATE SET:C116([ACCOUNT_BALANCES:34]; "$temp")
								QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Analysis_Code:1; $_at_Exclude)
								If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
									CREATE SET:C116([ACCOUNT_BALANCES:34]; "$_at_Exclude")
									DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
								End if 
								USE SET:C118("$temp")
							End if 
						End if 
						
						ARRAY TEXT:C222($_at_IncludeLayer; 0)
						For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
							If (LAY_abo_Include{$_l_Index})
								APPEND TO ARRAY:C911($_at_IncludeLayer; LAY_at_laycode{$_l_Index})
							End if 
						End for 
						If (Size of array:C274($_at_IncludeLayer)>=1)
							$_bo_FiltersActive:=True:C214
							If (Size of array:C274($_at_IncludeLayer)=1)
								QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Layer_Code:5=$_at_IncludeLayer{1})
							Else 
								QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Layer_Code:5; $_at_IncludeLayer)
							End if 
						End if 
						ARRAY TEXT:C222($_at_Exclude; 0)
						For ($_l_Index; 1; Size of array:C274(LAY_at_laycode))
							If (LAY_abo_Exclude{$_l_Index})
								APPEND TO ARRAY:C911($_at_Exclude; LAY_at_laycode{$_l_Index})
							End if 
						End for 
						If (Size of array:C274($_at_Exclude)>=1)
							$_bo_FiltersActive:=True:C214
							If (Size of array:C274($_at_Exclude)=1)
								CREATE SET:C116([ACCOUNT_BALANCES:34]; "$temp")
								QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Layer_Code:5=$_at_Exclude{1})
								If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
									CREATE SET:C116([ACCOUNT_BALANCES:34]; "$_at_Exclude")
									DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
								End if 
								USE SET:C118("$temp")
								
							Else 
								CREATE SET:C116([ACCOUNT_BALANCES:34]; "$temp")
								QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Layer_Code:5; $_at_Exclude)
								If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
									CREATE SET:C116([ACCOUNT_BALANCES:34]; "$_at_Exclude")
									DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
								End if 
								USE SET:C118("$temp")
							End if 
						End if 
						
						ARRAY TEXT:C222($_at_IncludeCurrency; 0)
						For ($_l_Index; 1; Size of array:C274(CUR_at_curcode))
							If (CUR_abo_Include{$_l_Index})
								APPEND TO ARRAY:C911($_at_IncludeCurrency; CUR_at_curcode{$_l_Index})
							End if 
						End for 
						If (Size of array:C274($_at_IncludeCurrency)>=1)
							$_bo_FiltersActive:=True:C214
							If (Size of array:C274($_at_IncludeCurrency)=1)
								QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_at_IncludeCurrency{1})
							Else 
								QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Currency_Code:6; $_at_IncludeCurrency)
							End if 
						End if 
						ARRAY TEXT:C222($_at_Exclude; 0)
						For ($_l_Index; 1; Size of array:C274(CUR_abo_Exclude))
							If (CUR_abo_Exclude{$_l_Index})
								APPEND TO ARRAY:C911($_at_Exclude; CUR_at_curcode{$_l_Index})
							End if 
						End for 
						If (Size of array:C274($_at_Exclude)>=1)
							$_bo_FiltersActive:=True:C214
							If (Size of array:C274($_at_Exclude)=1)
								CREATE SET:C116([ACCOUNT_BALANCES:34]; "$temp")
								QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_at_Exclude{1})
								If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
									CREATE SET:C116([ACCOUNT_BALANCES:34]; "$_at_Exclude")
									DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
								End if 
								USE SET:C118("$temp")
								
							Else 
								CREATE SET:C116([ACCOUNT_BALANCES:34]; "$temp")
								QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Currency_Code:6; $_at_Exclude)
								If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
									CREATE SET:C116([ACCOUNT_BALANCES:34]; "$_at_Exclude")
									DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
								End if 
								USE SET:C118("$temp")
							End if 
						End if 
						
						If (ACC_l_BalanceSheet=1)
							$_bo_FiltersActive:=True:C214
							
							If (Not:C34(ACC_bo_BSACCOUNTLOADED))
								QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="B")
								SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; ACC_at_BalanceSheetAccounts)
								ACC_bo_BSACCOUNTLOADED:=True:C214
							End if 
							QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Account_Code:2; ACC_at_BalanceSheetAccounts)
						End if 
						If (ACC_l_ProfitSheet=1)
							$_bo_FiltersActive:=True:C214
							If (Not:C34(ACC_bo_PSACCOUNTLOADED))
								QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="P")
								SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; ACC_at_ProfitSheetAccounts)
								ACC_bo_PSACCOUNTLOADED:=True:C214
							End if 
							QUERY SELECTION WITH ARRAY:C1050([ACCOUNT_BALANCES:34]Account_Code:2; ACC_at_ProfitSheetAccounts)
						End if 
						//BECAUSE THIS IS ARRAY BASED WE HAVE TO RELOAD THE ARRAYS
						$_l_AccountsLevel:=LAY_LOADACCOUNTBALANCESARRAYS
						
						
						
				End case 
			: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StockTypeInclude))
					If (LAY_abo_StockTypeInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_StockTypesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_StockTypesCodes))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Stock_Type:3; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StockTypeExclude))
					If (LAY_abo_StockTypeExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_StockTypesCodes{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([CURRENT_STOCK:62]; "$temp")
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3=$_at_Exclude{1})
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							CREATE SET:C116([CURRENT_STOCK:62]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([CURRENT_STOCK:62]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Stock_Type:3; $_at_Exclude)
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							CREATE SET:C116([CURRENT_STOCK:62]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//``
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_LocationInclude))
					If (LAY_abo_LocationInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_StockLocCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_StockLocCodes))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Location:8=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Location:8; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_LocationExclude))
					If (LAY_abo_LocationExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_StockLocCodes{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([CURRENT_STOCK:62]; "$temp")
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Location:8=$_at_Exclude{1})
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							CREATE SET:C116([CURRENT_STOCK:62]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([CURRENT_STOCK:62]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Stock_Type:3; $_at_Exclude)
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							CREATE SET:C116([CURRENT_STOCK:62]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//```````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Include))
					If (ANAL_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; ANAL_at_analcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(ANAL_at_analcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Analysis_Code:10=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Analysis_Code:10; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Exclude))
					If (ANAL_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; ANAL_at_analcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([CURRENT_STOCK:62]; "$temp")
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Analysis_Code:10=$_at_Exclude{1})
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							CREATE SET:C116([CURRENT_STOCK:62]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([CURRENT_STOCK:62]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Analysis_Code:10; $_at_Exclude)
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							CREATE SET:C116([CURRENT_STOCK:62]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Include))
					If (LAY_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; LAY_at_laycode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_at_laycode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Layer_Code:12; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Exclude))
					If (LAY_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; LAY_at_laycode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([CURRENT_STOCK:62]; "$temp")
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12=$_at_Exclude{1})
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							CREATE SET:C116([CURRENT_STOCK:62]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([CURRENT_STOCK:62]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Layer_Code:12; $_at_Exclude)
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							CREATE SET:C116([CURRENT_STOCK:62]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				
				//````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Include))
					If (CUR_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(CUR_at_curcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Currency_Code:11; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Exclude))
					If (CUR_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; CUR_at_curcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([CURRENT_STOCK:62]; "$temp")
						QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=$_at_Exclude{1})
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							CREATE SET:C116([CURRENT_STOCK:62]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([CURRENT_STOCK:62]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Currency_Code:11; $_at_Exclude)
						If (Records in selection:C76([CURRENT_STOCK:62])>0)
							CREATE SET:C116([CURRENT_STOCK:62]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				If (CUR_bo_FilterZeros)
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4#0)
				End if 
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_CredStgInclude))
					If (LAY_abo_CredStgInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_CredStgCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_CredStgCodes))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Credit_Stage:22=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Credit_Stage:22; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_CredStgExclude))
					If (LAY_abo_CredStgExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_CredStgCodes{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([INVOICES:39]; "$temp")
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Credit_Stage:22=$_at_Exclude{1})
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						
						CREATE SET:C116([INVOICES:39]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Credit_Stage:22; $_at_Exclude)
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				
				//````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Include))
					If (ANAL_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; ANAL_at_analcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(ANAL_at_analcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Analysis_Code:17=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Analysis_Code:17; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Exclude))
					If (ANAL_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; ANAL_at_analcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([INVOICES:39]; "$temp")
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Analysis_Code:17=$_at_Exclude{1})
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						
						CREATE SET:C116([INVOICES:39]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Analysis_Code:17; $_at_Exclude)
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				
				//````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Include))
					If (LAY_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; LAY_at_laycode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_at_laycode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Layer_Code:38=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Layer_Code:38; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Exclude))
					If (LAY_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; LAY_at_laycode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([INVOICES:39]; "$temp")
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Layer_Code:38=$_at_Exclude{1})
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						
						CREATE SET:C116([INVOICES:39]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Layer_Code:38; $_at_Exclude)
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//```
				//````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Include))
					If (CUR_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(CUR_at_curcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Currency_Code:27; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Exclude))
					If (CUR_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; CUR_at_curcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([INVOICES:39]; "$temp")
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=$_at_Exclude{1})
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						
						CREATE SET:C116([INVOICES:39]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Currency_Code:27; $_at_Exclude)
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_AreasInclude))
					If (LAY_abo_AreasInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_AreaCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_AreaCodes))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Area_Code:29=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Area_Code:29; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_AreasExclude))
					If (LAY_abo_AreasExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_AreaCodes{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([INVOICES:39]; "$temp")
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Area_Code:29=$_at_Exclude{1})
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						
						CREATE SET:C116([INVOICES:39]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Area_Code:29; $_at_Exclude)
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//TRACE
				If (ACC_l_ContextualFilterFrom>0)
					$_l_Offest:=ACC_l_ContextualFilterFrom
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							If (Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
								ACC_at_PeriodFromName{1}:=[PERIODS:33]Period_Name:2
								INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
								ACC_at_PeriodFromCode{1}:=[PERIODS:33]Period_Code:1
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]From_Date:3
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]To_Date:4
								ACC_at_PeriodFromCode:=1
							End if 
							
							
						Else 
							ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{1})
						End if 
						ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodToCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode}>ACC_ad_PeriodToFromDate{$_l_FoundIndex})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911(ACC_at_PeriodToName; ACC_at_PeriodFromName{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; ACC_ad_PeriodFromToDate{ACC_at_PeriodFromCode})
									$_l_FoundIndex:=Size of array:C274(ACC_ad_PeriodToToDate)
									
								End if 
								ACC_at_PeriodToCode:=$_l_FoundIndex
								ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
							End if 
						End if 
					End if 
				End if 
				If (ACC_l_ContextualFilterTo>0)
					$_l_Offest:=ACC_l_ContextualFilterTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							
							If (Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								APPEND TO ARRAY:C911(ACC_at_PeriodToName; [PERIODS:33]Period_Name:2)
								APPEND TO ARRAY:C911(ACC_at_PeriodToCode; [PERIODS:33]Period_Code:1)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; [PERIODS:33]From_Date:3)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; [PERIODS:33]To_Date:4)
								ACC_at_PeriodToCode:=Size of array:C274(ACC_ad_PeriodToToDate)
							End if 
							
						Else 
							ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{1})
							
						End if 
						ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{$_l_FoundIndex}>ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodToCode{ACC_at_PeriodToCode})
								If ($_l_FoundIndex<0)
									INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
									ACC_at_PeriodFromName{1}:=ACC_at_PeriodToName{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
									ACC_at_PeriodFromCode{1}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									$_l_FoundIndex:=1
								End if 
								ACC_at_PeriodFromCode:=$_l_FoundIndex
								ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
								
							End if 
						End if 
					End if 
					
				End if 
				
				If (ACC_at_PeriodFromCode{0}#"")
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Period_Code:13>=ACC_at_PeriodFromCode{0})
				End if 
				If (ACC_at_PeriodTOCode{0}#"")
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Period_Code:13<=ACC_at_PeriodTOCode{0})
				End if 
				If (INV_l_Open=1)  //Total due#0
					
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7#0)
				End if 
				If (INV_l_Closed=1)  //Total due#0
					
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7=0)
				End if 
			: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_CredStgInclude))
					If (LAY_abo_CredStgInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_CredStgCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_CredStgCodes))
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
					RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
					If (Size of array:C274($_at_Include)=1)
						
						
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Credit_Stage:22=$_at_Include{1})
						
					Else 
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Credit_Stage:22; $_at_Include)
					End if 
					RELATE MANY SELECTION:C340([INVOICES:39]Invoice_Number:1)
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp2")
					INTERSECTION:C121("$Temp"; "$Temp2"; "$temp")
					USE SET:C118("$temp")
					
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_CredStgExclude))
					If (LAY_abo_CredStgExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_CredStgCodes{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
					RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
					If (Size of array:C274($_at_Exclude)=1)
						
						CREATE SET:C116([INVOICES:39]; "$temp3")
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Credit_Stage:22=$_at_Exclude{1})
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp3"; "$_at_Exclude"; "$Temp3")
						End if 
						USE SET:C118("$temp3")
						
					Else 
						
						CREATE SET:C116([INVOICES:39]; "$temp3")
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Credit_Stage:22; $_at_Exclude)
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp3"; "$_at_Exclude"; "$Temp3")
						End if 
						USE SET:C118("$temp3")
					End if 
					RELATE MANY SELECTION:C340([INVOICES:39]Invoice_Number:1)
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp2")
					INTERSECTION:C121("$Temp"; "$Temp2"; "$temp")
					USE SET:C118("$temp")
				End if 
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Include))
					If (ANAL_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; ANAL_at_analcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(ANAL_at_analcode))
					$_bo_FiltersActive:=True:C214
					
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Analysis_Code:10=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([INVOICES_ITEMS:161]Analysis_Code:10; $_at_Include)
					End if 
					
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Exclude))
					If (ANAL_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; ANAL_at_analcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([INVOICES_ITEMS:161]; "$temp")
						QUERY SELECTION:C341([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Analysis_Code:10=$_at_Exclude{1})
						If (Records in selection:C76([INVOICES_ITEMS:161])>0)
							CREATE SET:C116([INVOICES_ITEMS:161]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						
						CREATE SET:C116([INVOICES:39]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([INVOICES_ITEMS:161]Analysis_Code:10; $_at_Exclude)
						If (Records in selection:C76([INVOICES_ITEMS:161])>0)
							CREATE SET:C116([INVOICES_ITEMS:161]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
					
				End if 
				
				//````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Include))
					If (LAY_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; LAY_at_laycode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_at_laycode))
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
					RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Layer_Code:38=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Layer_Code:38; $_at_Include)
					End if 
					RELATE MANY SELECTION:C340([INVOICES:39]Invoice_Number:1)
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp2")
					INTERSECTION:C121("$Temp"; "$Temp2"; "$temp")
					USE SET:C118("$temp")
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Exclude))
					If (LAY_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; LAY_at_laycode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
					RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([INVOICES:39]; "$temp3")
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Layer_Code:38=$_at_Exclude{1})
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp3"; "$_at_Exclude"; "$Temp3")
						End if 
						USE SET:C118("$temp3")
						
					Else 
						
						CREATE SET:C116([INVOICES:39]; "$temp3")
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Layer_Code:38; $_at_Exclude)
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp3"; "$_at_Exclude"; "$Temp3")
						End if 
						USE SET:C118("$temp3")
					End if 
					RELATE MANY SELECTION:C340([INVOICES:39]Invoice_Number:1)
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp2")
					INTERSECTION:C121("$Temp"; "$Temp2"; "$temp")
					USE SET:C118("$temp")
				End if 
				
				//````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Include))
					If (CUR_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(CUR_at_curcode))
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
					RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Currency_Code:27; $_at_Include)
					End if 
					RELATE MANY SELECTION:C340([INVOICES:39]Invoice_Number:1)
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp2")
					INTERSECTION:C121("$Temp"; "$Temp2"; "$temp")
					USE SET:C118("$temp")
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Exclude))
					If (CUR_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; CUR_at_curcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
					RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([INVOICES:39]; "$temp3")
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=$_at_Exclude{1})
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp3"; "$exclude3"; "$Temp3")
						End if 
						USE SET:C118("$temp3")
						
					Else 
						
						CREATE SET:C116([INVOICES:39]; "$temp3")
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Currency_Code:27; $_at_Exclude)
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp3"; "$_at_Exclude"; "$Temp3")
						End if 
						USE SET:C118("$temp3")
					End if 
					RELATE MANY SELECTION:C340([INVOICES:39]Invoice_Number:1)
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp2")
					INTERSECTION:C121("$Temp"; "$Temp2"; "$temp")
					USE SET:C118("$temp")
				End if 
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_AreasInclude))
					If (LAY_abo_AreasInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_AreaCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_AreaCodes))
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
					RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Area_Code:29=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Area_Code:29; $_at_Include)
					End if 
					RELATE MANY SELECTION:C340([INVOICES:39]Invoice_Number:1)
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp2")
					INTERSECTION:C121("$Temp"; "$Temp2"; "$temp")
					USE SET:C118("$temp")
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_AreasExclude))
					If (LAY_abo_AreasExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_AreaCodes{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
					RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([INVOICES:39]; "$temp3")
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Area_Code:29=$_at_Exclude{1})
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp3"; "$_at_Exclude"; "$Temp3")
						End if 
						USE SET:C118("$temp3")
						
					Else 
						
						CREATE SET:C116([INVOICES:39]; "$temp3")
						QUERY SELECTION WITH ARRAY:C1050([INVOICES:39]Area_Code:29; $_at_Exclude)
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp3"; "$_at_Exclude"; "$Temp3")
						End if 
						USE SET:C118("$temp3")
					End if 
					RELATE MANY SELECTION:C340([INVOICES:39]Invoice_Number:1)
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp2")
					INTERSECTION:C121("$Temp"; "$Temp2"; "$temp")
					USE SET:C118("$temp")
				End if 
				//TRACE
				If (ACC_l_ContextualFilterFrom>0)
					$_l_Offest:=ACC_l_ContextualFilterFrom
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							If (Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
								ACC_at_PeriodFromName{1}:=[PERIODS:33]Period_Name:2
								INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
								ACC_at_PeriodFromCode{1}:=[PERIODS:33]Period_Code:1
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]From_Date:3
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]To_Date:4
								ACC_at_PeriodFromCode:=1
							End if 
							
							
						Else 
							ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{1})
						End if 
						ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodToCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode}>ACC_ad_PeriodToFromDate{$_l_FoundIndex})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911(ACC_at_PeriodToName; ACC_at_PeriodFromName{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; ACC_ad_PeriodFromToDate{ACC_at_PeriodFromCode})
									$_l_FoundIndex:=Size of array:C274(ACC_ad_PeriodToToDate)
									
								End if 
								ACC_at_PeriodToCode:=$_l_FoundIndex
								ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
							End if 
						End if 
					End if 
				End if 
				If (ACC_l_ContextualFilterTo>0)
					$_l_Offest:=ACC_l_ContextualFilterTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							
							If (Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								APPEND TO ARRAY:C911(ACC_at_PeriodToName; [PERIODS:33]Period_Name:2)
								APPEND TO ARRAY:C911(ACC_at_PeriodToCode; [PERIODS:33]Period_Code:1)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; [PERIODS:33]From_Date:3)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; [PERIODS:33]To_Date:4)
								ACC_at_PeriodToCode:=Size of array:C274(ACC_ad_PeriodToToDate)
							End if 
							
						Else 
							ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{1})
							
						End if 
						ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{$_l_FoundIndex}>ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodToCode{ACC_at_PeriodToCode})
								If ($_l_FoundIndex<0)
									INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
									ACC_at_PeriodFromName{1}:=ACC_at_PeriodToName{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
									ACC_at_PeriodFromCode{1}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									$_l_FoundIndex:=1
								End if 
								ACC_at_PeriodFromCode:=$_l_FoundIndex
								ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
								
							End if 
						End if 
					End if 
					
				End if 
				
				If (ACC_at_PeriodFromCode{0}#"")
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
					RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Period_Code:13>=ACC_at_PeriodFromCode{0})
				End if 
				If (ACC_at_PeriodTOCode{0}#"")
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
					RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Period_Code:13<=ACC_at_PeriodTOCode{0})
					SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
					QUERY WITH ARRAY:C644([INVOICES_ITEMS:161]INVOICES_CODE:18; $_at_InvoiceNumbers)
					//RELATE MANY SELECTION([INVOICES]Invoice No)
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp2")
					INTERSECTION:C121("$Temp"; "$Temp2"; "$temp")
					USE SET:C118("$temp")
				End if 
				If (INV_l_Open=1)  //Total due#0
					
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
					RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7#0)
					RELATE MANY SELECTION:C340([INVOICES:39]Invoice_Number:1)
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp2")
					INTERSECTION:C121("$Temp"; "$Temp2"; "$temp")
					USE SET:C118("$temp")
				End if 
				If (INV_l_Closed=1)  //Total due#0
					
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
					RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7=0)
					RELATE MANY SELECTION:C340([INVOICES:39]Invoice_Number:1)
					CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp2")
					INTERSECTION:C121("$Temp"; "$Temp2"; "$temp")
					USE SET:C118("$temp")
				End if 
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StatesInclude))
					If (LAY_abo_StatesInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; "057"+DB_at_StatesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_StatesCodes))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Record_State:19=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_ORDERS:57]Record_State:19; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StatesExclude))
					If (LAY_abo_StatesExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; "057"+DB_at_StatesCodes{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([PURCHASE_ORDERS:57]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Record_State:19=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_ORDERS:57]Record_State:19; $_at_Exclude)
						
					End if 
					If (Records in selection:C76([PURCHASE_ORDERS:57])>0)
						CREATE SET:C116([PURCHASE_ORDERS:57]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				//```
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Include))
					If (ANAL_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; ANAL_at_analcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(ANAL_at_analcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Analysis_Code:15=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_ORDERS:57]Analysis_Code:15; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Exclude))
					If (ANAL_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; ANAL_at_analcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([PURCHASE_ORDERS:57]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Analysis_Code:15=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_ORDERS:57]Analysis_Code:15; $_at_Exclude)
					End if 
					If (Records in selection:C76([PURCHASE_ORDERS:57])>0)
						CREATE SET:C116([PURCHASE_ORDERS:57]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				//``
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Include))
					If (LAY_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; LAY_at_laycode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_at_laycode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Layer_Code:17=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_ORDERS:57]Layer_Code:17; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Exclude))
					If (LAY_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; LAY_at_laycode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([PURCHASE_ORDERS:57]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Layer_Code:17=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_ORDERS:57]Layer_Code:17; $_at_Exclude)
					End if 
					If (Records in selection:C76([PURCHASE_ORDERS:57])>0)
						CREATE SET:C116([PURCHASE_ORDERS:57]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				
				//``
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Include))
					If (CUR_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(CUR_at_curcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Currency_Code:16=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_ORDERS:57]Currency_Code:16; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Exclude))
					If (CUR_abo_Exclude{$_l_Index})
						APPEND TO ARRAY:C911($_at_Exclude; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([PURCHASE_ORDERS:57]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Currency_Code:16=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Currency_Code:11; $_at_Exclude)
					End if 
					If (Records in selection:C76([PURCHASE_ORDERS:57])>0)
						CREATE SET:C116([PURCHASE_ORDERS:57]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				//TRACE
				If (ACC_l_ContextualFilterFrom>0)
					$_l_Offest:=ACC_l_ContextualFilterFrom
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							If (Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
								ACC_at_PeriodFromName{1}:=[PERIODS:33]Period_Name:2
								INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
								ACC_at_PeriodFromCode{1}:=[PERIODS:33]Period_Code:1
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]From_Date:3
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]To_Date:4
								ACC_at_PeriodFromCode:=1
							End if 
							
							
						Else 
							ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{1})
						End if 
						ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodToCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode}>ACC_ad_PeriodToFromDate{$_l_FoundIndex})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911(ACC_at_PeriodToName; ACC_at_PeriodFromName{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; ACC_ad_PeriodFromToDate{ACC_at_PeriodFromCode})
									$_l_FoundIndex:=Size of array:C274(ACC_ad_PeriodToToDate)
									
								End if 
								ACC_at_PeriodToCode:=$_l_FoundIndex
								ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
							End if 
						End if 
					End if 
				End if 
				If (ACC_l_ContextualFilterTo>0)
					$_l_Offest:=ACC_l_ContextualFilterTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							
							If (Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								APPEND TO ARRAY:C911(ACC_at_PeriodToName; [PERIODS:33]Period_Name:2)
								APPEND TO ARRAY:C911(ACC_at_PeriodToCode; [PERIODS:33]Period_Code:1)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; [PERIODS:33]From_Date:3)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; [PERIODS:33]To_Date:4)
								ACC_at_PeriodToCode:=Size of array:C274(ACC_ad_PeriodToToDate)
							End if 
							
						Else 
							ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{1})
							
						End if 
						ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{$_l_FoundIndex}>ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodToCode{ACC_at_PeriodToCode})
								If ($_l_FoundIndex<0)
									INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
									ACC_at_PeriodFromName{1}:=ACC_at_PeriodToName{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
									ACC_at_PeriodFromCode{1}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									$_l_FoundIndex:=1
								End if 
								ACC_at_PeriodFromCode:=$_l_FoundIndex
								ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
								
							End if 
						End if 
					End if 
					
				End if 
				
				If (ACC_at_PeriodFromCode{0}#"")
					$_bo_FiltersActive:=True:C214
					$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0}; 1)
					QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Date:3>=ACC_ad_PeriodFromFromDate{$_l_FoundIndex})
				End if 
				If (ACC_at_PeriodTOCode{0}#"")
					$_bo_FiltersActive:=True:C214
					$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodTOCode; ACC_at_PeriodTOCode{0}; 1)
					QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Date:3<=ACC_ad_PeriodToToDate{$_l_FoundIndex})
				End if 
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				
				//```
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Include))
					If (ANAL_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; ANAL_at_analcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(ANAL_at_analcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Analysis_Code:15=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_INVOICES:37]Analysis_Code:15; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Exclude))
					If (ANAL_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; ANAL_at_analcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([PURCHASE_INVOICES:37]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Analysis_Code:15=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_INVOICES:37]Analysis_Code:15; $_at_Exclude)
					End if 
					If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
						CREATE SET:C116([PURCHASE_INVOICES:37]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				//``
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Include))
					If (LAY_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; LAY_at_laycode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_at_laycode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Layer_Code:28=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_INVOICES:37]Layer_Code:28; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Exclude))
					If (LAY_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; LAY_at_laycode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([PURCHASE_INVOICES:37]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Layer_Code:28=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_INVOICES:37]Layer_Code:28; $_at_Exclude)
					End if 
					If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
						CREATE SET:C116([PURCHASE_INVOICES:37]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				
				//``
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Include))
					If (CUR_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(CUR_at_curcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Currency_Code:23=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_INVOICES:37]Currency_Code:23; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Exclude))
					If (CUR_abo_Exclude{$_l_Index})
						APPEND TO ARRAY:C911($_at_Exclude; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([PURCHASE_INVOICES:37]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Currency_Code:23=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([PURCHASE_INVOICES:37]Currency_Code:23; $_at_Exclude)
					End if 
					If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
						CREATE SET:C116([PURCHASE_INVOICES:37]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				//TRACE
				If (ACC_l_ContextualFilterFrom>0)
					$_l_Offest:=ACC_l_ContextualFilterFrom
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							If (Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
								ACC_at_PeriodFromName{1}:=[PERIODS:33]Period_Name:2
								INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
								ACC_at_PeriodFromCode{1}:=[PERIODS:33]Period_Code:1
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]From_Date:3
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]To_Date:4
								ACC_at_PeriodFromCode:=1
							End if 
							
							
						Else 
							ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{1})
						End if 
						ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodToCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode}>ACC_ad_PeriodToFromDate{$_l_FoundIndex})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911(ACC_at_PeriodToName; ACC_at_PeriodFromName{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; ACC_ad_PeriodFromToDate{ACC_at_PeriodFromCode})
									$_l_FoundIndex:=Size of array:C274(ACC_ad_PeriodToToDate)
									
								End if 
								ACC_at_PeriodToCode:=$_l_FoundIndex
								ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
							End if 
						End if 
					End if 
				End if 
				If (ACC_l_ContextualFilterTo>0)
					$_l_Offest:=ACC_l_ContextualFilterTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							
							If (Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								APPEND TO ARRAY:C911(ACC_at_PeriodToName; [PERIODS:33]Period_Name:2)
								APPEND TO ARRAY:C911(ACC_at_PeriodToCode; [PERIODS:33]Period_Code:1)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; [PERIODS:33]From_Date:3)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; [PERIODS:33]To_Date:4)
								ACC_at_PeriodToCode:=Size of array:C274(ACC_ad_PeriodToToDate)
							End if 
							
						Else 
							ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{1})
							
						End if 
						ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{$_l_FoundIndex}>ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodToCode{ACC_at_PeriodToCode})
								If ($_l_FoundIndex<0)
									INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
									ACC_at_PeriodFromName{1}:=ACC_at_PeriodToName{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
									ACC_at_PeriodFromCode{1}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									$_l_FoundIndex:=1
								End if 
								ACC_at_PeriodFromCode:=$_l_FoundIndex
								ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
								
							End if 
						End if 
					End if 
					
				End if 
				
				If (ACC_at_PeriodFromCode{0}#"")
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Period_Code:3>=ACC_at_PeriodFromCode{0})
				End if 
				
				If (ACC_at_PeriodTOCode{0}#"")
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Period_Code:3<=ACC_at_PeriodTOCode{0})
				End if 
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_MoveTypesInclude))
					If (LAY_abo_MoveTypesInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_MoveTypeCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_MoveTypeCodes))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=Records in table:C83([STOCK_MOVEMENT_ITEMS:27]))
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=$_at_Include{1})
						Else 
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=$_at_Include{1})
						End if 
					Else 
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=Records in table:C83([STOCK_MOVEMENT_ITEMS:27]))
							QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_Include)
						Else 
							
							QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_Include)
						End if 
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_MoveTypesExclude))
					If (LAY_abo_MoveTypesExclude{$_l_Index})
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_MoveTypeCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_Exclude)
					End if 
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$_at_Exclude")
						
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				
				
				//``
				
				//``
				
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StockTypeInclude))
					If (LAY_abo_StockTypeInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_StockTypesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_StockTypesCodes))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StockTypeExclude))
					If (LAY_abo_StockTypeExclude{$_l_Index})
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_StockTypesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_Exclude)
					End if 
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$_at_Exclude")
						
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Include))
					If (ANAL_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; ANAL_at_analcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(ANAL_at_analcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Exclude))
					If (ANAL_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; ANAL_at_analcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; $_at_Exclude)
					End if 
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Include))
					If (LAY_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; LAY_at_laycode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_at_laycode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Exclude))
					If (LAY_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; LAY_at_laycode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; $_at_Exclude)
					End if 
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				
				//``
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Include))
					If (CUR_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(CUR_at_curcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Exclude))
					If (CUR_abo_Exclude{$_l_Index})
						APPEND TO ARRAY:C911($_at_Exclude; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_Exclude)
					End if 
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				//TRACE
				If (ACC_l_ContextualFilterFrom>0)
					$_l_Offest:=ACC_l_ContextualFilterFrom
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							If (Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
								ACC_at_PeriodFromName{1}:=[PERIODS:33]Period_Name:2
								INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
								ACC_at_PeriodFromCode{1}:=[PERIODS:33]Period_Code:1
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]From_Date:3
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]To_Date:4
								ACC_at_PeriodFromCode:=1
							End if 
							
							
						Else 
							ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{1})
						End if 
						ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodToCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode}>ACC_ad_PeriodToFromDate{$_l_FoundIndex})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911(ACC_at_PeriodToName; ACC_at_PeriodFromName{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; ACC_ad_PeriodFromToDate{ACC_at_PeriodFromCode})
									$_l_FoundIndex:=Size of array:C274(ACC_ad_PeriodToToDate)
									
								End if 
								ACC_at_PeriodToCode:=$_l_FoundIndex
								ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
							End if 
						End if 
					End if 
				End if 
				If (ACC_l_ContextualFilterTo>0)
					$_l_Offest:=ACC_l_ContextualFilterTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							
							If (Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								APPEND TO ARRAY:C911(ACC_at_PeriodToName; [PERIODS:33]Period_Name:2)
								APPEND TO ARRAY:C911(ACC_at_PeriodToCode; [PERIODS:33]Period_Code:1)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; [PERIODS:33]From_Date:3)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; [PERIODS:33]To_Date:4)
								ACC_at_PeriodToCode:=Size of array:C274(ACC_ad_PeriodToToDate)
							End if 
							
						Else 
							ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{1})
							
						End if 
						ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{$_l_FoundIndex}>ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodToCode{ACC_at_PeriodToCode})
								If ($_l_FoundIndex<0)
									INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
									ACC_at_PeriodFromName{1}:=ACC_at_PeriodToName{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
									ACC_at_PeriodFromCode{1}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									$_l_FoundIndex:=1
								End if 
								ACC_at_PeriodFromCode:=$_l_FoundIndex
								ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
								
							End if 
						End if 
					End if 
					
				End if 
				
				If (ACC_at_PeriodFromCode{0}#"")
					$_bo_FiltersActive:=True:C214
					$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0}; 1)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26>=ACC_ad_PeriodFromFromDate{$_l_FoundIndex})
				End if 
				If (ACC_at_PeriodTOCode{0}#"")
					$_bo_FiltersActive:=True:C214
					$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodTOCode; ACC_at_PeriodTOCode{0}; 1)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<=ACC_ad_PeriodToToDate{$_l_FoundIndex})
				End if 
				If (SI_bo_FilterZeros)
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
				End if 
				If (SI_bo_FilterAllocated)
					$_bo_FiltersActive:=True:C214
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
				End if 
			: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StockTypeInclude))
					If (LAY_abo_StockTypeInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_StockTypesCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_StockTypesCodes))
					
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_LEVELS:58]Stock_Type:2; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_StockTypeExclude))
					If (LAY_abo_StockTypeExclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_StockTypesCodes{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([STOCK_LEVELS:58]; "$temp")
						QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2=$_at_Exclude{1})
						If (Records in selection:C76([STOCK_LEVELS:58])>0)
							CREATE SET:C116([STOCK_LEVELS:58]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([STOCK_LEVELS:58]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([STOCK_LEVELS:58]Stock_Type:2; $_at_Exclude)
						If (Records in selection:C76([STOCK_LEVELS:58])>0)
							CREATE SET:C116([STOCK_LEVELS:58]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//``
				
				//```````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Include))
					If (ANAL_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; ANAL_at_analcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(ANAL_at_analcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Analysis_Code:7=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_LEVELS:58]Analysis_Code:7; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Exclude))
					If (ANAL_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; ANAL_at_analcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([STOCK_LEVELS:58]; "$temp")
						QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Analysis_Code:7=$_at_Exclude{1})
						If (Records in selection:C76([STOCK_LEVELS:58])>0)
							CREATE SET:C116([STOCK_LEVELS:58]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([STOCK_LEVELS:58]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([STOCK_LEVELS:58]Analysis_Code:7; $_at_Exclude)
						If (Records in selection:C76([STOCK_LEVELS:58])>0)
							CREATE SET:C116([STOCK_LEVELS:58]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				//````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Include))
					If (LAY_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; LAY_at_laycode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_at_laycode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_LEVELS:58]Layer_Code:9; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Exclude))
					If (LAY_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; LAY_at_laycode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([STOCK_LEVELS:58]; "$temp")
						QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_at_Exclude{1})
						If (Records in selection:C76([STOCK_LEVELS:58])>0)
							CREATE SET:C116([STOCK_LEVELS:58]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([STOCK_LEVELS:58]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([STOCK_LEVELS:58]Layer_Code:9; $_at_Exclude)
						If (Records in selection:C76([STOCK_LEVELS:58])>0)
							CREATE SET:C116([STOCK_LEVELS:58]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				
				//````
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Include))
					If (CUR_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(CUR_at_curcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_LEVELS:58]Currency_Code:8; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Exclude))
					If (CUR_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; CUR_at_curcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Exclude)=1)
						CREATE SET:C116([STOCK_LEVELS:58]; "$temp")
						QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_at_Exclude{1})
						If (Records in selection:C76([STOCK_LEVELS:58])>0)
							CREATE SET:C116([STOCK_LEVELS:58]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
						
					Else 
						CREATE SET:C116([STOCK_LEVELS:58]; "$temp")
						QUERY SELECTION WITH ARRAY:C1050([STOCK_LEVELS:58]Currency_Code:8; $_at_Exclude)
						If (Records in selection:C76([STOCK_LEVELS:58])>0)
							CREATE SET:C116([STOCK_LEVELS:58]; "$_at_Exclude")
							DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
						End if 
						USE SET:C118("$temp")
					End if 
				End if 
				If (DB_bo_ShowArrayBased)
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_ProductCodes)
					QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
					ARRAY BOOLEAN:C223(PRD_abo_Expanded; 0)
					SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; PRD_at_STKHistoryProducts; [PRODUCTS:9]Product_Name:2; PRD_at_STKHistoryName; [PRODUCTS:9]X_ID:43; PRD_al_ProductID)
					ARRAY BOOLEAN:C223(PRD_abo_Expanded; Size of array:C274(PRD_at_STKHistoryProducts))
					//be careful when changing selection to respect the expanded status of items
					ARRAY PICTURE:C279(PRD_aPic_Expanded; 0)
					ARRAY PICTURE:C279(PRD_aPic_Expanded; Size of array:C274(PRD_at_STKHistoryProducts))
					//GET PICTURE FROM LIBRARY(403; $_Pic_LoadedPicture)  //410 for expanded
					$_Pic_LoadedPicture:=Get_Picture(403)
					
					For ($_l_Index; 1; Size of array:C274(PRD_aPic_Expanded))
						PRD_aPic_Expanded{$_l_Index}:=$_Pic_LoadedPicture
					End for 
				End if 
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_MoveTypesInclude))
					If (LAY_abo_MoveTypesInclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; DB_at_MoveTypeCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(DB_at_MoveTypeCodes))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Type:6=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Movement_Type:6; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_MoveTypesExclude))
					If (LAY_abo_MoveTypesExclude{$_l_Index})
						APPEND TO ARRAY:C911($_at_Exclude; DB_at_MoveTypeCodes{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([STOCK_MOVEMENTS:40]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Type:6=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Movement_Type:6; $_at_Exclude)
					End if 
					If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
						CREATE SET:C116([STOCK_MOVEMENTS:40]; "$_at_Exclude")
						
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				
				
				//``
				
				//``
				
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Include))
					If (ANAL_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; ANAL_at_analcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(ANAL_at_analcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Analysis_Code:9=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Analysis_Code:9; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Exclude))
					If (ANAL_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; ANAL_at_analcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([STOCK_MOVEMENTS:40]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Analysis_Code:9=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Analysis_Code:9; $_at_Exclude)
					End if 
					If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
						CREATE SET:C116([STOCK_MOVEMENTS:40]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Include))
					If (LAY_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; LAY_at_laycode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_at_laycode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Layer_Code:11=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Layer_Code:11; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Exclude))
					If (LAY_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; LAY_at_laycode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([STOCK_MOVEMENTS:40]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Layer_Code:11=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Layer_Code:11; $_at_Exclude)
					End if 
					If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
						CREATE SET:C116([STOCK_MOVEMENTS:40]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				
				//``
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Include))
					If (CUR_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(CUR_at_curcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Currency_Code:10=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Currency_Code:10; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Exclude))
					If (CUR_abo_Exclude{$_l_Index})
						APPEND TO ARRAY:C911($_at_Exclude; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([STOCK_MOVEMENTS:40]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Currency_Code:10=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Currency_Code:10; $_at_Exclude)
					End if 
					If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
						CREATE SET:C116([STOCK_MOVEMENTS:40]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				//TRACE
				If (ACC_l_ContextualFilterFrom>0)
					$_l_Offest:=ACC_l_ContextualFilterFrom
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							If (Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
								ACC_at_PeriodFromName{1}:=[PERIODS:33]Period_Name:2
								INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
								ACC_at_PeriodFromCode{1}:=[PERIODS:33]Period_Code:1
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]From_Date:3
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]To_Date:4
								ACC_at_PeriodFromCode:=1
							End if 
							
							
						Else 
							ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{1})
						End if 
						ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodToCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode}>ACC_ad_PeriodToFromDate{$_l_FoundIndex})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911(ACC_at_PeriodToName; ACC_at_PeriodFromName{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; ACC_ad_PeriodFromToDate{ACC_at_PeriodFromCode})
									$_l_FoundIndex:=Size of array:C274(ACC_ad_PeriodToToDate)
									
								End if 
								ACC_at_PeriodToCode:=$_l_FoundIndex
								ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
							End if 
						End if 
					End if 
				End if 
				If (ACC_l_ContextualFilterTo>0)
					$_l_Offest:=ACC_l_ContextualFilterTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							
							If (Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								APPEND TO ARRAY:C911(ACC_at_PeriodToName; [PERIODS:33]Period_Name:2)
								APPEND TO ARRAY:C911(ACC_at_PeriodToCode; [PERIODS:33]Period_Code:1)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; [PERIODS:33]From_Date:3)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; [PERIODS:33]To_Date:4)
								ACC_at_PeriodToCode:=Size of array:C274(ACC_ad_PeriodToToDate)
							End if 
							
						Else 
							ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{1})
							
						End if 
						ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{$_l_FoundIndex}>ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodToCode{ACC_at_PeriodToCode})
								If ($_l_FoundIndex<0)
									INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
									ACC_at_PeriodFromName{1}:=ACC_at_PeriodToName{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
									ACC_at_PeriodFromCode{1}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									$_l_FoundIndex:=1
								End if 
								ACC_at_PeriodFromCode:=$_l_FoundIndex
								ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
								
							End if 
						End if 
					End if 
					
				End if 
				
				If (ACC_at_PeriodFromCode{0}#"")
					$_bo_FiltersActive:=True:C214
					$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0}; 1)
					
					QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Date:5>=ACC_ad_PeriodFromFromDate{$_l_FoundIndex})
				End if 
				
				If (ACC_at_PeriodTOCode{0}#"")
					$_bo_FiltersActive:=True:C214
					$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodTOCode; ACC_at_PeriodTOCode{0}; 1)
					
					QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Date:5<=ACC_ad_PeriodToToDate{$_l_FoundIndex})
				End if 
			: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCHES:30]))
				
				
				SELECTION TO ARRAY:C260([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
				QUERY WITH ARRAY:C644([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
				//TRACE
				If (ACC_l_ContextualFilterFrom>0)
					$_l_Offest:=ACC_l_ContextualFilterFrom
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							If (Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
								ACC_at_PeriodFromName{1}:=[PERIODS:33]Period_Name:2
								INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
								ACC_at_PeriodFromCode{1}:=[PERIODS:33]Period_Code:1
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]From_Date:3
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]To_Date:4
								ACC_at_PeriodFromCode:=1
							End if 
							
							
						Else 
							ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{1})
						End if 
						ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodToCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode}>ACC_ad_PeriodToFromDate{$_l_FoundIndex})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911(ACC_at_PeriodToName; ACC_at_PeriodFromName{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; ACC_ad_PeriodFromToDate{ACC_at_PeriodFromCode})
									$_l_FoundIndex:=Size of array:C274(ACC_ad_PeriodToToDate)
									
								End if 
								ACC_at_PeriodToCode:=$_l_FoundIndex
								ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
							End if 
						End if 
					End if 
				End if 
				If (ACC_l_ContextualFilterTo>0)
					$_l_Offest:=ACC_l_ContextualFilterTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							
							If (Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								APPEND TO ARRAY:C911(ACC_at_PeriodToName; [PERIODS:33]Period_Name:2)
								APPEND TO ARRAY:C911(ACC_at_PeriodToCode; [PERIODS:33]Period_Code:1)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; [PERIODS:33]From_Date:3)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; [PERIODS:33]To_Date:4)
								ACC_at_PeriodToCode:=Size of array:C274(ACC_ad_PeriodToToDate)
							End if 
							
						Else 
							ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{1})
							
						End if 
						ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{$_l_FoundIndex}>ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodToCode{ACC_at_PeriodToCode})
								If ($_l_FoundIndex<0)
									INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
									ACC_at_PeriodFromName{1}:=ACC_at_PeriodToName{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
									ACC_at_PeriodFromCode{1}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									$_l_FoundIndex:=1
								End if 
								ACC_at_PeriodFromCode:=$_l_FoundIndex
								ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
								
							End if 
						End if 
					End if 
					
				End if 
				
				If (ACC_at_PeriodFromCode{0}#"")
					$_bo_FiltersActive:=True:C214
					//$_l_FoundIndex:=Find in array(ACC_at_PeriodFromCode;ACC_at_PeriodFromCode{0};1)
					
					QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Period_Code:11>=ACC_at_PeriodFromCode{0})
				End if 
				
				If (ACC_at_PeriodTOCode{0}#"")
					$_bo_FiltersActive:=True:C214
					//$_l_FoundIndex:=Find in array(ACC_at_PeriodTOCode;ACC_at_PeriodTOCode{0};1)
					
					QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Period_Code:11<=ACC_at_PeriodTOCode{0})
				End if 
				
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Include))
					If (ANAL_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; ANAL_at_analcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(ANAL_at_analcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Exclude))
					If (ANAL_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; ANAL_at_analcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; $_at_Exclude)
					End if 
					If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
						CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Include))
					If (LAY_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; LAY_at_laycode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_at_laycode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Exclude))
					If (LAY_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; LAY_at_laycode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; $_at_Exclude)
					End if 
					If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
						CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				
				//``
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Include))
					If (CUR_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(CUR_at_curcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Exclude))
					If (CUR_abo_Exclude{$_l_Index})
						APPEND TO ARRAY:C911($_at_Exclude; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $_at_Exclude)
					End if 
					If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
						CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
				QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTIONS:29]))
				//TRACE
				If (ACC_l_ContextualFilterFrom>0)
					$_l_Offest:=ACC_l_ContextualFilterFrom
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							If (Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
								ACC_at_PeriodFromName{1}:=[PERIODS:33]Period_Name:2
								INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
								ACC_at_PeriodFromCode{1}:=[PERIODS:33]Period_Code:1
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]From_Date:3
								INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
								ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]To_Date:4
								ACC_at_PeriodFromCode:=1
							End if 
							
							
						Else 
							ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{1})
						End if 
						ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodToCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode}>ACC_ad_PeriodToFromDate{$_l_FoundIndex})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
								If ($_l_FoundIndex<0)
									APPEND TO ARRAY:C911(ACC_at_PeriodToName; ACC_at_PeriodFromName{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode})
									APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; ACC_ad_PeriodFromToDate{ACC_at_PeriodFromCode})
									$_l_FoundIndex:=Size of array:C274(ACC_ad_PeriodToToDate)
									
								End if 
								ACC_at_PeriodToCode:=$_l_FoundIndex
								ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
							End if 
						End if 
					End if 
				End if 
				If (ACC_l_ContextualFilterTo>0)
					$_l_Offest:=ACC_l_ContextualFilterTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates)
						SORT ARRAY:C229($_ad_PeriodFromDates; $_at_PeriodCodes; <)
						If (($_l_Offest+1)<Size of array:C274($_ad_PeriodFromDates))
							
							If (Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})>0)
								ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{$_l_Offest+1})
							Else 
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_Offest+1})
								APPEND TO ARRAY:C911(ACC_at_PeriodToName; [PERIODS:33]Period_Name:2)
								APPEND TO ARRAY:C911(ACC_at_PeriodToCode; [PERIODS:33]Period_Code:1)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; [PERIODS:33]From_Date:3)
								APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; [PERIODS:33]To_Date:4)
								ACC_at_PeriodToCode:=Size of array:C274(ACC_ad_PeriodToToDate)
							End if 
							
						Else 
							ACC_at_PeriodToCode:=Find in array:C230(ACC_at_PeriodToCode; $_at_PeriodCodes{1})
							
						End if 
						ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
						
						$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodFromCode{0})
						If ($_l_FoundIndex>0)
							If (ACC_ad_PeriodFromFromDate{$_l_FoundIndex}>ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode})
								$_l_FoundIndex:=Find in array:C230(ACC_at_PeriodFromCode; ACC_at_PeriodToCode{ACC_at_PeriodToCode})
								If ($_l_FoundIndex<0)
									INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
									ACC_at_PeriodFromName{1}:=ACC_at_PeriodToName{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
									ACC_at_PeriodFromCode{1}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
									ACC_ad_PeriodFromFromDate{1}:=ACC_ad_PeriodToFromDate{ACC_at_PeriodToCode}
									$_l_FoundIndex:=1
								End if 
								ACC_at_PeriodFromCode:=$_l_FoundIndex
								ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
								
							End if 
						End if 
					End if 
					
				End if 
				
				If (ACC_at_PeriodFromCode{0}#"")
					$_bo_FiltersActive:=True:C214
					//$_l_FoundIndex:=Find in array(ACC_at_PeriodFromCode;ACC_at_PeriodFromCode{0};1)
					
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12>=ACC_at_PeriodFromCode{0})
				End if 
				
				If (ACC_at_PeriodTOCode{0}#"")
					$_bo_FiltersActive:=True:C214
					//$_l_FoundIndex:=Find in array(ACC_at_PeriodTOCode;ACC_at_PeriodTOCode{0};1)
					
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12<=ACC_at_PeriodTOCode{0})
				End if 
				
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Include))
					If (ANAL_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; ANAL_at_analcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(ANAL_at_analcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Analysis_Code:2; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(ANAL_abo_Exclude))
					If (ANAL_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; ANAL_at_analcode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([TRANSACTIONS:29]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Analysis_Code:2; $_at_Exclude)
					End if 
					If (Records in selection:C76([TRANSACTIONS:29])>0)
						CREATE SET:C116([TRANSACTIONS:29]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Include))
					If (LAY_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; LAY_at_laycode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(LAY_at_laycode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Layer_Code:23; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(LAY_abo_Exclude))
					If (LAY_abo_Exclude{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Exclude; LAY_at_laycode{$_l_Index})
						
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([TRANSACTIONS:29]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Layer_Code:23; $_at_Exclude)
					End if 
					If (Records in selection:C76([TRANSACTIONS:29])>0)
						CREATE SET:C116([TRANSACTIONS:29]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
				
				//``
				ARRAY TEXT:C222($_at_Include; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Include))
					If (CUR_abo_Include{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_Include; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Include)>=1) & (Size of array:C274($_at_Include)<Size of array:C274(CUR_at_curcode))
					$_bo_FiltersActive:=True:C214
					If (Size of array:C274($_at_Include)=1)
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_at_Include{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Currency_Code:22; $_at_Include)
					End if 
				End if 
				ARRAY TEXT:C222($_at_Exclude; 0)
				For ($_l_Index; 1; Size of array:C274(CUR_abo_Exclude))
					If (CUR_abo_Exclude{$_l_Index})
						APPEND TO ARRAY:C911($_at_Exclude; CUR_at_curcode{$_l_Index})
					End if 
				End for 
				If (Size of array:C274($_at_Exclude)>=1)
					$_bo_FiltersActive:=True:C214
					CREATE SET:C116([TRANSACTIONS:29]; "$temp")
					If (Size of array:C274($_at_Exclude)=1)
						QUERY SELECTION:C341([TRANSACTION_BATCHES:30]; [TRANSACTIONS:29]Currency_Code:22=$_at_Exclude{1})
					Else 
						QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Currency_Code:22; $_at_Exclude)
					End if 
					If (Records in selection:C76([TRANSACTIONS:29])>0)
						CREATE SET:C116([TRANSACTIONS:29]; "$_at_Exclude")
						DIFFERENCE:C122("$Temp"; "$_at_Exclude"; "$Temp")
					End if 
					USE SET:C118("$temp")
				End if 
		End case 
		If ($_bo_FiltersActive)
			OBJECT SET VISIBLE:C603(*; "oFiltersMessage"; True:C214)
			$_l_RecordsInSelection:=Records in selection:C76($1->)
			$_l_RemovedFromSelection:=$_l_RecordsinBaseSelection-$_l_RecordsInSelection
			If ($_l_RemovedFromSelection>0)
				DB_t_FilterMessage:=String:C10($_l_RecordsinBaseSelection)+" Records , "+String:C10($_l_RemovedFromSelection)+" removed by filters"
			Else 
				DB_t_FilterMessage:=""
			End if 
			DB_bo_FiltersTouched:=True:C214
			
			OBJECT SET VISIBLE:C603(*; "oFiltersActiveText"; True:C214)
			OBJECT SET ENABLED:C1123(*; "oClearFilters"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "oFiltersMessage"; False:C215)
			DB_t_FilterMessage:=""
			DB_bo_FiltersTouched:=False:C215
			
			OBJECT SET VISIBLE:C603(*; "oFiltersActiveText"; False:C215)
			OBJECT SET ENABLED:C1123(*; "oClearFilters"; False:C215)
		End if 
	End if 
End if 



///
ERR_MethodTrackerReturn("SRCH_Applyfilterstoselection"; $_t_OldMethodName)
