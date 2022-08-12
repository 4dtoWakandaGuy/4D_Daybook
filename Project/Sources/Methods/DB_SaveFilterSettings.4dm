//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SaveFilterSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  05/05/2011 21:06 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ANAL_abo_Include;0)
	//ARRAY BOOLEAN(CUR_abo_Exclude;0)
	//ARRAY BOOLEAN(CUR_abo_Include;0)
	//ARRAY BOOLEAN(LAY_abo_CountyInclude;0)
	//ARRAY BOOLEAN(LAY_abo_AreasInclude;0)
	//ARRAY BOOLEAN(LAY_abo_BrandsInclude;0)
	//ARRAY BOOLEAN(LAY_abo_CollectionsInclude;0)
	//ARRAY BOOLEAN(LAY_abo_CountryInclude;0)
	//ARRAY BOOLEAN(LAY_abo_CredStgInclude;0)
	//ARRAY BOOLEAN(LAY_abo_GroupsInclude;0)
	//ARRAY BOOLEAN(LAY_abo_HeadingInclude;0)
	//ARRAY BOOLEAN(LAY_abo_Include;0)
	//ARRAY BOOLEAN(LAY_abo_LocationInclude;0)
	//ARRAY BOOLEAN(LAY_abo_MoveTypesInclude;0)
	//ARRAY BOOLEAN(LAY_abo_RoleInclude;0)
	//ARRAY BOOLEAN(LAY_abo_SourcesInclude;0)
	//ARRAY BOOLEAN(LAY_abo_SPInclude;0)
	//ARRAY BOOLEAN(LAY_abo_StatesInclude;0)
	//ARRAY BOOLEAN(LAY_abo_StatusInclude;0)
	//ARRAY BOOLEAN(LAY_abo_StockTypeInclude;0)
	//ARRAY BOOLEAN(LAY_abo_TypesInclude;0)
	ARRAY LONGINT:C221($_al_IncludeID; 0)
	//ARRAY LONGINT(DB_al_CollectionIDS;0)
	ARRAY TEXT:C222($_at_ExcludeCode; 0)
	ARRAY TEXT:C222($_at_IncludeCode; 0)
	//ARRAY TEXT(ACC_at_PeriodFromCode;0)
	//ARRAY TEXT(ACC_at_PeriodTOCode;0)
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
	//ARRAY TEXT(LAY_at_laycode;0)
	//ARRAY TEXT(LAY_at_SPinitials;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_Continue; $_bo_IncludeNoCatalogue; CUR_bo_FilterZeros; SI_bo_FilterZeros)
	C_LONGINT:C283($_l_index; $_l_SelectedFilterFrom; $_l_SelectedFilterTo; $_l_TableNumber; $0; $1; $3; $4; $6; ACC_l_BalanceSheet; ACC_l_ContextualFilterFrom)
	C_LONGINT:C283(ACC_l_ContextualFilterTo; ACC_l_ProfitSheet; CO_l_Company; CO_l_PrivateAddress; DB_l_CurrentDisplayedForm; DB_l_FilterNumber; INV_l_Closed; INV_l_Open)
	C_POINTER:C301($5)
	C_TEXT:C284($_t_oldMethodName; $_t_SearchName; $_t_SelectedPeriodFrom; $_t_SelectedPeriodFromCode; $_t_SelectedPeriodTo; $_t_SelectedPeriodToCode; $2; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SaveFilterSettings")

SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
If (Count parameters:C259>=3)
	READ WRITE:C146([x_QUERY_PARAMETERS:134])
	$_l_TableNumber:=$3
	Case of 
		: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_SPInclude))
				If (LAY_abo_SPInclude{$_l_index})
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_SPinitials{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_CountryInclude))
				If (LAY_abo_CountryInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_CountryNames{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//``````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_CountyInclude))
				If (LAY_abo_CountyInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_CountyNames{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//``
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_AreasInclude))
				If (LAY_abo_AreasInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_AreaCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//```
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_TypesInclude))
				If (LAY_abo_TypesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_TypesCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//```
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_StatusInclude))
				If (LAY_abo_StatusInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_StatusCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_SourcesInclude))
				If (LAY_abo_SourcesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_SourceCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//````
			VARIABLE TO BLOB:C532(CO_l_Company; SM_blb_SearchBlob; *)
			VARIABLE TO BLOB:C532(CO_l_PrivateAddress; SM_blb_SearchBlob; *)
			
			
		: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_SPInclude))
				If (LAY_abo_SPInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_SPinitials{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//``
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_RoleInclude))
				If (LAY_abo_RoleInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_RoleCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//````
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_StatusInclude))
				If (LAY_abo_StatusInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_StatusCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_TypesInclude))
				If (LAY_abo_TypesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_TypesCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_SourcesInclude))
				If (LAY_abo_SourcesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_SourceCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
		: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_HeadingInclude))
				If (LAY_abo_HeadingInclude{$_l_index})
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_HeadingCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			
			VARIABLE TO BLOB:C532(ACC_l_ProfitSheet; SM_blb_SearchBlob; *)
			VARIABLE TO BLOB:C532(ACC_l_BalanceSheet; SM_blb_SearchBlob; *)
			
			
			
		: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_SPInclude))
				If (LAY_abo_SPInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_SPinitials{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//```
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_TypesInclude))
				If (LAY_abo_TypesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_TypesCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_AreasInclude))
				If (LAY_abo_AreasInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_AreaCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//```
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_StatesInclude))
				If (LAY_abo_StatesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_StatesCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//``
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_SourcesInclude))
				If (LAY_abo_SourcesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_SourceCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			$_t_SelectedPeriodFromCode:=ACC_at_PeriodFromCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodFromCode; SM_blb_SearchBlob; *)
			$_t_SelectedPeriodToCode:=ACC_at_PeriodTOCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodFromCode; SM_blb_SearchBlob; *)
			$_l_SelectedFilterFrom:=ACC_l_ContextualFilterFrom
			VARIABLE TO BLOB:C532($_l_SelectedFilterFrom; SM_blb_SearchBlob; *)
			$_l_SelectedFilterTo:=ACC_l_ContextualFilterTo
			VARIABLE TO BLOB:C532($_l_SelectedFilterFrom; SM_blb_SearchBlob; *)
		: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
			
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_SPInclude))
				If (LAY_abo_SPInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_SPinitials{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//```
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_TypesInclude))
				If (LAY_abo_TypesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_TypesCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_AreasInclude))
				If (LAY_abo_AreasInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_AreaCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//```
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_StatesInclude))
				If (LAY_abo_StatesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_StatesCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//``
			$_t_SelectedPeriodFrom:=ACC_at_PeriodFromCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodFrom; SM_blb_SearchBlob; *)
			$_t_SelectedPeriodTo:=ACC_at_PeriodTOCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodFrom; SM_blb_SearchBlob; *)
			//note that contextuals are added at the end of the existing blob structure
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_SourcesInclude))
				If (LAY_abo_SourcesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_SourceCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			$_l_SelectedFilterFrom:=ACC_l_ContextualFilterFrom
			VARIABLE TO BLOB:C532($_l_SelectedFilterFrom; SM_blb_SearchBlob; *)
			$_l_SelectedFilterTo:=ACC_l_ContextualFilterTo
			VARIABLE TO BLOB:C532($_l_SelectedFilterTo; SM_blb_SearchBlob; *)
		: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_GroupsInclude))
				If (LAY_abo_GroupsInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_GroupCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//```````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_BrandsInclude))
				If (LAY_abo_BrandsInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_BrandCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//````
			
			ARRAY LONGINT:C221($_al_IncludeID; 0)
			$_bo_IncludeNoCatalogue:=False:C215
			For ($_l_index; 1; Size of array:C274(LAY_abo_CollectionsInclude))
				If (LAY_abo_CollectionsInclude{$_l_index})
					If (DB_al_CollectionIDS{$_l_index}#0)
						APPEND TO ARRAY:C911($_al_IncludeID; DB_al_CollectionIDS{$_l_index})
					Else 
						$_bo_IncludeNoCatalogue:=True:C214
					End if 
				End if 
			End for 
			VARIABLE TO BLOB:C532($_al_IncludeID; SM_blb_SearchBlob; *)
			VARIABLE TO BLOB:C532($_bo_IncludeNoCatalogue; SM_blb_SearchBlob; *)
			
			
			
			
			
		: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
			Case of 
				: (DB_t_CurrentContext="BUDGETS")
				Else 
					$_t_SelectedPeriodFrom:=ACC_at_PeriodFromCode{0}
					VARIABLE TO BLOB:C532($_t_SelectedPeriodFrom; SM_blb_SearchBlob; *)
					$_t_SelectedPeriodTo:=ACC_at_PeriodTOCode{0}
					VARIABLE TO BLOB:C532($_t_SelectedPeriodTo; SM_blb_SearchBlob; *)
					//Note that contextuals are added at the end of the existing blob
					ARRAY TEXT:C222($_at_IncludeCode; 0)
					For ($_l_index; 1; Size of array:C274(ANAL_at_analcode))
						If (ANAL_abo_Include{$_l_index})
							
							APPEND TO ARRAY:C911($_at_IncludeCode; ANAL_at_analcode{$_l_index})
						End if 
					End for 
					VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
					
					
					ARRAY TEXT:C222($_at_IncludeCode; 0)
					For ($_l_index; 1; Size of array:C274(LAY_at_laycode))
						If (LAY_abo_Include{$_l_index})
							APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_laycode{$_l_index})
						End if 
					End for 
					VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
					
					
					
					
					ARRAY TEXT:C222($_at_IncludeCode; 0)
					For ($_l_index; 1; Size of array:C274(CUR_at_curcode))
						If (CUR_abo_Include{$_l_index})
							APPEND TO ARRAY:C911($_at_IncludeCode; CUR_at_curcode{$_l_index})
						End if 
					End for 
					VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
					
					
					VARIABLE TO BLOB:C532(ACC_l_BalanceSheet; SM_blb_SearchBlob; *)
					VARIABLE TO BLOB:C532(ACC_l_ProfitSheet; SM_blb_SearchBlob; *)
					
					$_l_SelectedFilterFrom:=ACC_l_ContextualFilterFrom
					VARIABLE TO BLOB:C532($_l_SelectedFilterFrom; SM_blb_SearchBlob; *)
					$_l_SelectedFilterTo:=ACC_l_ContextualFilterTo
					VARIABLE TO BLOB:C532($_l_SelectedFilterTo; SM_blb_SearchBlob; *)
					
					
			End case 
		: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_StockTypeInclude))
				If (LAY_abo_StockTypeInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_StockTypesCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//``
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_LocationInclude))
				If (LAY_abo_LocationInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_StockLocCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//```````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(ANAL_abo_Include))
				If (ANAL_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; ANAL_at_analcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_Include))
				If (LAY_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_laycode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(CUR_abo_Include))
				If (CUR_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; CUR_at_curcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			VARIABLE TO BLOB:C532(CUR_bo_FilterZeros; SM_blb_SearchBlob; *)
			
		: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_CredStgInclude))
				If (LAY_abo_CredStgInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_CredStgCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(ANAL_abo_Include))
				If (ANAL_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; ANAL_at_analcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_Include))
				If (LAY_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_laycode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			//```
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(CUR_abo_Include))
				If (CUR_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; CUR_at_curcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_AreasInclude))
				If (LAY_abo_AreasInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_AreaCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			$_t_SelectedPeriodFrom:=ACC_at_PeriodFromCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodFrom; SM_blb_SearchBlob; *)
			$_t_SelectedPeriodTo:=ACC_at_PeriodTOCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodTo; SM_blb_SearchBlob; *)
			//Note that contextuals are added at the end of the existing blob
			VARIABLE TO BLOB:C532(INV_l_Open; SM_blb_SearchBlob; *)
			VARIABLE TO BLOB:C532(INV_l_Closed; SM_blb_SearchBlob; *)
			$_l_SelectedFilterFrom:=ACC_l_ContextualFilterFrom
			VARIABLE TO BLOB:C532($_l_SelectedFilterFrom; SM_blb_SearchBlob; *)
			$_l_SelectedFilterTo:=ACC_l_ContextualFilterTo
			VARIABLE TO BLOB:C532($_l_SelectedFilterTo; SM_blb_SearchBlob; *)
		: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_CredStgInclude))
				If (LAY_abo_CredStgInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_CredStgCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(ANAL_abo_Include))
				If (ANAL_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; ANAL_at_analcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_Include))
				If (LAY_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_laycode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(CUR_abo_Include))
				If (CUR_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; CUR_at_curcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_AreasInclude))
				If (LAY_abo_AreasInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_AreaCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			$_t_SelectedPeriodFrom:=ACC_at_PeriodFromCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodFrom; SM_blb_SearchBlob; *)
			$_t_SelectedPeriodTo:=ACC_at_PeriodTOCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodTo; SM_blb_SearchBlob; *)
			//Note that contextuals are added at the end of the existing blob structure
			VARIABLE TO BLOB:C532(INV_l_Open; SM_blb_SearchBlob; *)
			VARIABLE TO BLOB:C532(INV_l_Closed; SM_blb_SearchBlob; *)
			$_l_SelectedFilterFrom:=ACC_l_ContextualFilterFrom
			VARIABLE TO BLOB:C532($_l_SelectedFilterFrom; SM_blb_SearchBlob; *)
			$_l_SelectedFilterTo:=ACC_l_ContextualFilterTo
			VARIABLE TO BLOB:C532($_l_SelectedFilterTo; SM_blb_SearchBlob; *)
		: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_StatesInclude))
				If (LAY_abo_StatesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_StatesCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			//```
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(ANAL_abo_Include))
				If (ANAL_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; ANAL_at_analcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//``
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_Include))
				If (LAY_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_laycode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			
			//``
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(CUR_abo_Include))
				If (CUR_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; CUR_at_curcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			$_t_SelectedPeriodFrom:=ACC_at_PeriodFromCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodFrom; SM_blb_SearchBlob; *)
			$_t_SelectedPeriodTo:=ACC_at_PeriodTOCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodTo; SM_blb_SearchBlob; *)
			$_l_SelectedFilterFrom:=ACC_l_ContextualFilterFrom
			VARIABLE TO BLOB:C532($_l_SelectedFilterFrom; SM_blb_SearchBlob; *)
			$_l_SelectedFilterTo:=ACC_l_ContextualFilterTo
			VARIABLE TO BLOB:C532($_l_SelectedFilterTo; SM_blb_SearchBlob; *)
		: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
			
			//```
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(ANAL_abo_Include))
				If (ANAL_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; ANAL_at_analcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//``
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_Include))
				If (LAY_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_laycode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			
			//``
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(CUR_abo_Include))
				If (CUR_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; CUR_at_curcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			$_t_SelectedPeriodFrom:=ACC_at_PeriodFromCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodFrom; SM_blb_SearchBlob; *)
			$_t_SelectedPeriodTo:=ACC_at_PeriodTOCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodTo; SM_blb_SearchBlob; *)
			$_l_SelectedFilterFrom:=ACC_l_ContextualFilterFrom
			VARIABLE TO BLOB:C532($_l_SelectedFilterFrom; SM_blb_SearchBlob; *)
			$_l_SelectedFilterTo:=ACC_l_ContextualFilterTo
			VARIABLE TO BLOB:C532($_l_SelectedFilterTo; SM_blb_SearchBlob; *)
		: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_MoveTypesInclude))
				If (LAY_abo_MoveTypesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_MoveTypeCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			
			
			//``
			
			//``
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_StockTypeInclude))
				If (LAY_abo_StockTypeInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_StockTypesCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(ANAL_abo_Include))
				If (ANAL_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; ANAL_at_analcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_Include))
				If (LAY_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_laycode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//``
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(CUR_abo_Include))
				If (CUR_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; CUR_at_curcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			$_t_SelectedPeriodFrom:=ACC_at_PeriodFromCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodFrom; SM_blb_SearchBlob; *)
			$_t_SelectedPeriodTo:=ACC_at_PeriodTOCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodTo; SM_blb_SearchBlob; *)
			VARIABLE TO BLOB:C532(SI_bo_FilterZeros; SM_blb_SearchBlob; *)
			$_l_SelectedFilterFrom:=ACC_l_ContextualFilterFrom
			VARIABLE TO BLOB:C532($_l_SelectedFilterFrom; SM_blb_SearchBlob; *)
			$_l_SelectedFilterTo:=ACC_l_ContextualFilterTo
			VARIABLE TO BLOB:C532($_l_SelectedFilterTo; SM_blb_SearchBlob; *)
			
		: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_StockTypeInclude))
				If (LAY_abo_StockTypeInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_StockTypesCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//``
			
			//```````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(ANAL_abo_Include))
				If (ANAL_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; ANAL_at_analcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_Include))
				If (LAY_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_laycode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//````
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(CUR_abo_Include))
				If (CUR_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; CUR_at_curcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
		: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_MoveTypesInclude))
				If (LAY_abo_MoveTypesInclude{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; DB_at_MoveTypeCodes{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(ANAL_abo_Include))
				If (ANAL_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; ANAL_at_analcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_Include))
				If (LAY_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_laycode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			
			//``
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(CUR_abo_Include))
				If (CUR_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; CUR_at_curcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			$_t_SelectedPeriodFrom:=ACC_at_PeriodFromCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodFrom; SM_blb_SearchBlob; *)
			$_t_SelectedPeriodTo:=ACC_at_PeriodTOCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodTo; SM_blb_SearchBlob; *)
			$_l_SelectedFilterFrom:=ACC_l_ContextualFilterFrom
			VARIABLE TO BLOB:C532($_l_SelectedFilterFrom; SM_blb_SearchBlob; *)
			$_l_SelectedFilterTo:=ACC_l_ContextualFilterTo
			VARIABLE TO BLOB:C532($_l_SelectedFilterTo; SM_blb_SearchBlob; *)
		: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCHES:30]))
			
			$_t_SelectedPeriodFrom:=ACC_at_PeriodFromCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodFrom; SM_blb_SearchBlob; *)
			$_t_SelectedPeriodTo:=ACC_at_PeriodTOCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodTo; SM_blb_SearchBlob; *)
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(ANAL_abo_Include))
				If (ANAL_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; ANAL_at_analcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_Include))
				If (LAY_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_laycode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			
			//``
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(CUR_abo_Include))
				If (CUR_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; CUR_at_curcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			ARRAY TEXT:C222($_at_ExcludeCode; 0)
			For ($_l_index; 1; Size of array:C274(CUR_abo_Exclude))
				If (CUR_abo_Exclude{$_l_index})
					APPEND TO ARRAY:C911($_at_ExcludeCode; CUR_at_curcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_ExcludeCode; SM_blb_SearchBlob; *)
			
			$_l_SelectedFilterFrom:=ACC_l_ContextualFilterFrom
			VARIABLE TO BLOB:C532($_l_SelectedFilterFrom; SM_blb_SearchBlob; *)
			$_l_SelectedFilterTo:=ACC_l_ContextualFilterTo
			VARIABLE TO BLOB:C532($_l_SelectedFilterTo; SM_blb_SearchBlob; *)
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTIONS:29]))
			$_t_SelectedPeriodFrom:=ACC_at_PeriodFromCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodFrom; SM_blb_SearchBlob; *)
			$_t_SelectedPeriodTo:=ACC_at_PeriodTOCode{0}
			VARIABLE TO BLOB:C532($_t_SelectedPeriodTo; SM_blb_SearchBlob; *)
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(ANAL_abo_Include))
				If (ANAL_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; ANAL_at_analcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(LAY_abo_Include))
				If (LAY_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; LAY_at_laycode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			
			
			
			
			//``
			ARRAY TEXT:C222($_at_IncludeCode; 0)
			For ($_l_index; 1; Size of array:C274(CUR_abo_Include))
				If (CUR_abo_Include{$_l_index})
					
					APPEND TO ARRAY:C911($_at_IncludeCode; CUR_at_curcode{$_l_index})
				End if 
			End for 
			VARIABLE TO BLOB:C532($_at_IncludeCode; SM_blb_SearchBlob; *)
			$_l_SelectedFilterFrom:=ACC_l_ContextualFilterFrom
			VARIABLE TO BLOB:C532($_l_SelectedFilterFrom; SM_blb_SearchBlob; *)
			$_l_SelectedFilterTo:=ACC_l_ContextualFilterTo
			VARIABLE TO BLOB:C532($_l_SelectedFilterTo; SM_blb_SearchBlob; *)
			
	End case 
	$_bo_Continue:=False:C215
	If ($1=0)
		If ($2#"") & (DB_l_FilterNumber#0)
			$_t_SearchName:=$2
			Repeat 
				QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]Search_Name:4=$_t_SearchName; *)
				QUERY:C277([x_QUERY_PARAMETERS:134];  | [x_QUERY_PARAMETERS:134]X_ID:1=DB_l_FilterNumber)
				If (Records in selection:C76([x_QUERY_PARAMETERS:134])>=1)
					DB_l_FilterNumber:=-AA_GetNextID(->DB_l_FilterNumber)
				End if 
				
			Until (Records in selection:C76([x_QUERY_PARAMETERS:134])=0)
			
			CREATE RECORD:C68([x_QUERY_PARAMETERS:134])
			[x_QUERY_PARAMETERS:134]X_ID:1:=DB_l_FilterNumber
			[x_QUERY_PARAMETERS:134]Search_Name:4:=$_t_SearchName
			If ($4#-999)
				[x_QUERY_PARAMETERS:134]X_OwnerID:2:=$4
			End if 
			$_bo_Continue:=True:C214
		Else 
			$_bo_Continue:=True:C214
			DB_l_FilterNumber:=-AA_GetNextID(->DB_l_FilterNumber)
		End if 
		QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=DB_l_FilterNumber)
		$_bo_Continue:=True:C214
		If (Records in selection:C76([x_QUERY_PARAMETERS:134])=0)
			$_bo_Continue:=False:C215
			If ($2#"")
				CREATE RECORD:C68([x_QUERY_PARAMETERS:134])
				[x_QUERY_PARAMETERS:134]X_ID:1:=DB_l_FilterNumber
				[x_QUERY_PARAMETERS:134]Search_Name:4:=$2
				If ($4#-999)
					[x_QUERY_PARAMETERS:134]X_OwnerID:2:=$4
				Else 
					[x_QUERY_PARAMETERS:134]X_OwnerID:2:=$4
				End if 
				$_bo_Continue:=True:C214
			End if 
		End if 
		
		
		If ($_bo_Continue)
			If (Count parameters:C259>=6)
				If ($6>0)
					[x_QUERY_PARAMETERS:134]X_ContextID:3:=($3*255)+$6  //This gives up to 255 contexts per table!
				Else 
					[x_QUERY_PARAMETERS:134]X_ContextID:3:=$3
				End if 
			Else 
				[x_QUERY_PARAMETERS:134]X_ContextID:3:=$3
			End if 
			
			COPY BLOB:C558($5->; [x_QUERY_PARAMETERS:134]X_SearchValues:5; 0; 0; BLOB size:C605($5->))
			
			DB_SaveRecord(->[x_QUERY_PARAMETERS:134])
			
		End if 
		If ($4=-1)
			$0:=[x_QUERY_PARAMETERS:134]X_ID:1
		End if 
		UNLOAD RECORD:C212([x_QUERY_PARAMETERS:134])
		READ ONLY:C145([x_QUERY_PARAMETERS:134])
		//$_l_DefaultFilterID:=DB_GetdefaultFilterID (DB_l_CurrentDisplayedForm)
		//If ($_l_DefaultFilterID#0)
		//DB_LoadFilterParameters ($_l_DefaultFilterID;DB_l_CurrentDisplayedForm)
		//End if
	Else 
		QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$1)
		$_bo_Continue:=True:C214
		If (Records in selection:C76([x_QUERY_PARAMETERS:134])=0)
			$_bo_Continue:=False:C215
		End if 
		
		
		If ($_bo_Continue)
			COPY BLOB:C558($5->; [x_QUERY_PARAMETERS:134]X_SearchValues:5; 0; 0; BLOB size:C605($5->))
			
			DB_SaveRecord(->[x_QUERY_PARAMETERS:134])
			
		End if 
		If ($4=-1)
			$0:=[x_QUERY_PARAMETERS:134]X_ID:1
		End if 
		UNLOAD RECORD:C212([x_QUERY_PARAMETERS:134])
		READ ONLY:C145([x_QUERY_PARAMETERS:134])
		
		
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_SaveFilterSettings"; $_t_oldMethodName)