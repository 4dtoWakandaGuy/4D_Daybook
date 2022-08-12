//%attributes = {}
If (False:C215)
	//Project Method Name:      SRCH_loadSearchFilters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SRCH_loadSearchFilters
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(CAT_aI_CatalogueDF;0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(ORD_al_StatePos;0)
	//ARRAY LONGINT(PROD_al_CatalogueIDs;0)
	//ARRAY LONGINT(PROD_al_SelectedCatalogues;0)
	//ARRAY LONGINT(WS_al_RecordStatesID;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	//ARRAY TEXT(COM_at_AreaCodes;0)
	//ARRAY TEXT(COM_at_AreaNames;0)
	//ARRAY TEXT(COM_at_FurtherAnalcode;0)
	//ARRAY TEXT(COM_at_furtherAnalName;0)
	//ARRAY TEXT(COM_at_SalesInitials;0)
	//ARRAY TEXT(COM_at_SalesName;0)
	//ARRAY TEXT(ORD_at_AnalysisCodes;0)
	//ARRAY TEXT(ORD_at_AnalysisNames;0)
	//ARRAY TEXT(ORD_at_CurrencyCodes;0)
	//ARRAY TEXT(ORD_at_CurrencyNames;0)
	//ARRAY TEXT(ORD_at_SalesInitials;0)
	//ARRAY TEXT(ORD_at_SalesName;0)
	//ARRAY TEXT(ORD_at_SalesNames;0)
	//ARRAY TEXT(ORD_at_SourceCodes;0)
	//ARRAY TEXT(ORD_at_SourceNames;0)
	//ARRAY TEXT(ORD_at_StateNames;0)
	//ARRAY TEXT(ORD_at_TypeCodes;0)
	//ARRAY TEXT(ORD_at_TypeNames;0)
	//ARRAY TEXT(PRO_at_AnalysisNames;0)
	//ARRAY TEXT(PROD_at_AnalysisCodes;0)
	//ARRAY TEXT(PROD_at_BRANDCodes;0)
	//ARRAY TEXT(PROD_at_BRANDNames;0)
	//ARRAY TEXT(PROD_at_CatalogueNames;0)
	//ARRAY TEXT(PROD_at_CurrencyCodes;0)
	//ARRAY TEXT(PROD_at_CurrencyNames;0)
	//ARRAY TEXT(PROD_at_FurtherAnalcode;0)
	//ARRAY TEXT(PROD_at_furtherAnalName;0)
	//ARRAY TEXT(PROD_at_GroupCodes;0)
	//ARRAY TEXT(PROD_at_GroupNames;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	//ARRAY TEXT(WS_at_RecordStateProperties;0)
	//ARRAY TEXT(WS_at_RecordStates;0)
	C_LONGINT:C283($_l_AppendRow; $_l_DefaultCatalogueRow; $_l_Index; $_l_ListID; $1; PROD_l_DisplayedCatalogue; VrStateL)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; ORD_t_SelectedStates; Prod_t_DisplayCurrency; vrstate)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SRCH_loadSearchFilters")
Case of 
	: ($1=Table:C252(->[COMPANIES:2]))
		ARRAY TEXT:C222(COM_at_FurtherAnalcode; 0)
		ARRAY TEXT:C222(COM_at_furtherAnalName; 0)
		ARRAY TEXT:C222(COM_at_SalesName; 0)
		ARRAY TEXT:C222(COM_at_SalesInitials; 0)
		ARRAY TEXT:C222(COM_at_AreaNames; 0)
		ARRAY TEXT:C222(COM_at_AreaCodes; 0)
		ARRAY TEXT:C222(WS_at_RecordStateProperties; 0)
		ARRAY TEXT:C222(WS_at_RecordStates; 0)
		ARRAY LONGINT:C221(WS_al_RecordStatesID; 0)
		$_l_ListID:=AA_LoadList(->[COMPANIES:2]Record_State:62; ->WS_at_RecordStates; ->WS_al_RecordStatesID; False:C215; ->WS_at_RecordStateProperties)
		WS_at_RecordStates:=0
		ALL RECORDS:C47([AREAS:3])
		SELECTION TO ARRAY:C260([AREAS:3]Area_Code:1; COM_at_AreaCodes; [AREAS:3]Area_Name:2; COM_at_AreaNames)
		SORT ARRAY:C229(COM_at_AreaNames; COM_at_AreaCodes)
		//APPEND TO ARRAY(COM_at_AreaCodes;"")
		//APPEND TO ARRAY(COM_at_AreaNames;"-")
		//APPEND TO ARRAY(COM_at_AreaCodes;"")
		//APPEND TO ARRAY(COM_at_AreaNames;"Multiple")
		ALL RECORDS:C47([PERSONNEL:11])
		QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
		QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]Global_Access:47=False:C215)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; COM_at_SalesInitials; [PERSONNEL:11]Name:2; COM_at_SalesName)
		SORT ARRAY:C229(COM_at_SalesName; COM_at_SalesInitials)
		//APPEND TO ARRAY(COM_at_SalesInitials;"")
		//APPEND TO ARRAY(COM_aS20_SalesName;"-")
		//APPEND TO ARRAY(COM_at_SalesInitials;"")
		//APPEND TO ARRAY(COM_aS20_SalesName;"Multiple")
		ALL RECORDS:C47([ADDITIONAL_RECORD_ANALYSIS:53])
		SELECTION TO ARRAY:C260([ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; COM_at_FurtherAnalcode; [ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2; COM_at_furtherAnalName)
		SORT ARRAY:C229(COM_at_furtherAnalName; COM_at_FurtherAnalcode)
		APPEND TO ARRAY:C911(COM_at_FurtherAnalcode; "")
		APPEND TO ARRAY:C911(COM_at_furtherAnalName; "-")
		APPEND TO ARRAY:C911(COM_at_FurtherAnalcode; "")
		APPEND TO ARRAY:C911(COM_at_furtherAnalName; "Multiple")
		//And load the default set for this user.....
	: ($1=Table:C252(->[ORDERS:24]))
		ARRAY TEXT:C222(ORD_at_SourceNames; 0)
		ARRAY TEXT:C222(ORD_at_SourceCodes; 0)
		ARRAY TEXT:C222(ORD_at_TypeNames; 0)
		ARRAY TEXT:C222(ORD_at_TypeCodes; 0)
		ARRAY TEXT:C222(ORD_at_SalesName; 0)
		ARRAY TEXT:C222(ORD_at_SalesInitials; 0)
		
		CREATE SET:C116([ORDERS:24]; "$Temp")
		
		QUERY:C277([CODE_USES:91]Use:2=1)
		ALL RECORDS:C47([JOB_TYPES:65])
		If (Records in selection:C76([JOB_TYPES:65])>0)
			Project_SelCU(->[JOB_TYPES:65]; ->[JOB_TYPES:65]Type_Code:1; "1")  //Link the records to Code Uses
		End if 
		If (Records in selection:C76([CODE_USES:91])=0)
			REDUCE SELECTION:C351([JOB_TYPES:65]; 0)
		Else 
			Join_SelCU(->[JOB_TYPES:65]; ->[JOB_TYPES:65]Type_Code:1)
		End if 
		SELECTION TO ARRAY:C260([JOB_TYPES:65]Type_Code:1; ORD_at_TypeCodes; [JOB_TYPES:65]Type_Name:2; ORD_at_TypeNames)
		ALL RECORDS:C47([SOURCES:6])
		If (Records in selection:C76([SOURCES:6])>0)
			Project_SelCU(->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; "4")  //Link the records to Code Uses
		End if 
		If (Records in selection:C76([CODE_USES:91])=0)
			REDUCE SELECTION:C351([JOB_TYPES:65]; 0)
		Else 
			Join_SelCU(->[SOURCES:6]; ->[SOURCES:6]Source_Code:1)
		End if 
		SELECTION TO ARRAY:C260([SOURCES:6]Source_Code:1; ORD_at_SourceCodes; [SOURCES:6]Source_Name:2; ORD_at_SourceNames)
		ALL RECORDS:C47([PERSONNEL:11])
		QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
		QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]Global_Access:47=False:C215)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; ORD_at_SalesInitials; [PERSONNEL:11]Name:2; ORD_at_SalesNames)
		ALL RECORDS:C47([ANALYSES:36])
		SELECTION TO ARRAY:C260([ANALYSES:36]Analysis_Code:1; ORD_at_AnalysisCodes; [ANALYSES:36]Analysis_Name:2; ORD_at_AnalysisNames)
		
		ALL RECORDS:C47([CURRENCIES:71])
		
		ARRAY TEXT:C222(ORD_at_CurrencyNames; 0)
		ARRAY TEXT:C222(ORD_at_CurrencyCodes; 0)
		SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; ORD_at_CurrencyCodes; [CURRENCIES:71]Currency_Name:2; ORD_at_CurrencyNames)
		Sel_BegArr(Table:C252(->[ORDERS:24]))
		ARRAY TEXT:C222(ORD_at_StateNames; 0)
		ARRAY LONGINT:C221(ORD_al_StatePos; 0)
		ORD_t_SelectedStates:=""
		For ($_l_Index; 1; Size of array:C274(SYS_at_RecordStateNames))
			APPEND TO ARRAY:C911(ORD_at_StateNames; "Select "+SYS_at_RecordStateNames{$_l_Index})
			APPEND TO ARRAY:C911(ORD_al_StatePos; $_l_Index)
			If (MOD_al_ModuleAccessStatus{$_l_Index}=0)
				APPEND TO ARRAY:C911(ORD_at_StateNames; "Add "+SYS_at_RecordStateNames{$_l_Index})
				APPEND TO ARRAY:C911(ORD_al_StatePos; $_l_Index)
			Else 
				APPEND TO ARRAY:C911(ORD_at_StateNames; "Subtract "+SYS_at_RecordStateNames{$_l_Index})
				APPEND TO ARRAY:C911(ORD_al_StatePos; $_l_Index)
				If (ORD_t_SelectedStates="")
					ORD_t_SelectedStates:=SYS_at_RecordStateNames{$_l_Index}
				Else 
					ORD_t_SelectedStates:=ORD_t_SelectedStates+", "+SYS_at_RecordStateNames{$_l_Index}
				End if 
			End if 
			
		End for 
		APPEND TO ARRAY:C911(ORD_at_StateNames; "Clear All States ")
		APPEND TO ARRAY:C911(ORD_al_StatePos; 0)
		USE SET:C118("$Temp")
	: ($1=Table:C252(->[PRODUCTS:9]))
		//Groups
		ARRAY TEXT:C222(PROD_at_GroupCodes; 0)
		ARRAY TEXT:C222(PROD_at_GroupNames; 0)
		ARRAY TEXT:C222(PROD_at_FurtherAnalcode; 0)
		ARRAY TEXT:C222(COM_at_furtherAnalName; 0)
		ARRAY TEXT:C222(PROD_at_AnalysisCodes; 0)
		ARRAY TEXT:C222(PROD_at_furtherAnalName; 0)
		
		ALL RECORDS:C47([PRODUCT_GROUPS:10])
		SELECTION TO ARRAY:C260([PRODUCT_BRANDS:8]Brand_Code:1; PROD_at_BRANDCodes; [PRODUCT_BRANDS:8]Brand_Name:2; PROD_at_BRANDNames)
		ARRAY TEXT:C222(PROD_at_BRANDCodes; 0)
		ARRAY TEXT:C222(PROD_at_BRANDNames; 0)
		ALL RECORDS:C47([PRODUCT_BRANDS:8])
		SELECTION TO ARRAY:C260([PRODUCT_BRANDS:8]Brand_Code:1; PROD_at_BRANDCodes; [PRODUCT_BRANDS:8]Brand_Name:2; PROD_at_BRANDNames)
		ALL RECORDS:C47([ADDITIONAL_RECORD_ANALYSIS:53])
		If (False:C215)  //Wierd this..on the product more choices an 'analysis' search searches further analysis which is displayed on the product..but there is not a way on there to search by default analyis
			
			SELECTION TO ARRAY:C260([ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; PROD_at_FurtherAnalcode; [ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2; PROD_at_furtherAnalName)
		Else 
			ALL RECORDS:C47([ANALYSES:36])
			SELECTION TO ARRAY:C260([ANALYSES:36]Analysis_Code:1; PROD_at_AnalysisCodes; [ANALYSES:36]Analysis_Name:2; PRO_at_AnalysisNames)
		End if 
		//`
		//The following is not used as a filter but rather as a display control
		ARRAY TEXT:C222(PROD_at_CurrencyNames; 0)
		ARRAY TEXT:C222(PROD_at_CurrencyCodes; 0)
		ALL RECORDS:C47([CURRENCIES:71])
		SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; PROD_at_CurrencyCodes; [CURRENCIES:71]Currency_Name:2; PROD_at_CurrencyNames)
		If (Prod_t_DisplayCurrency="")
			Prod_t_DisplayCurrency:=<>SYS_t_BaseCurrency
		End if 
		SORT ARRAY:C229(PROD_at_CurrencyNames; PROD_at_CurrencyCodes)
		
		//``
		//PROD_t_SelectedCatalogues:=""
		
		ARRAY TEXT:C222(PROD_at_CatalogueNames; 0)
		ARRAY LONGINT:C221(PROD_al_CatalogueIDs; 0)
		ARRAY LONGINT:C221(PROD_al_SelectedCatalogues; 0)
		ARRAY LONGINT:C221(PROD_al_Selectedcatalogues; Size of array:C274(CAT_at_CatalogueNames))
		If (Size of array:C274(CAT_al_CatalogueID)>0)
			For ($_l_Index; 1; Size of array:C274(CAT_al_CatalogueID))
				APPEND TO ARRAY:C911(PROD_at_CatalogueNames; "Select Catalogue "+CAT_at_CatalogueNames{$_l_Index})
				APPEND TO ARRAY:C911(PROD_al_CatalogueIDs; CAT_al_CatalogueID{$_l_Index})
				If (False:C215)
					APPEND TO ARRAY:C911(PROD_at_CatalogueNames; "Append Catalogue "+CAT_at_CatalogueNames{$_l_Index})
					APPEND TO ARRAY:C911(PROD_al_CatalogueIDs; CAT_al_CatalogueID{$_l_Index})
				End if 
			End for 
			$_l_DefaultCatalogueRow:=Find in array:C230(CAT_aI_CatalogueDF; 1)
			If ($_l_DefaultCatalogueRow>0)
				PROD_al_Selectedcatalogues{$_l_DefaultCatalogueRow}:=1
				$_l_AppendRow:=Find in array:C230(PROD_at_CatalogueNames; "Append Catalogue "+CAT_at_CatalogueNames{$_l_DefaultCatalogueRow})
				If ($_l_AppendRow>0)  // it should be
					PROD_at_CatalogueNames{$_l_AppendRow}:="Deselect Catalogue "+CAT_at_CatalogueNames{$_l_DefaultCatalogueRow}
					Catalogue_Prices(CAT_al_CatalogueID{$_l_AppendRow})
					
				End if 
			End if 
			
		End if 
		
End case 
ERR_MethodTrackerReturn("SRCH_loadSearchFilters"; $_t_oldMethodName)