If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oFilterNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/08/2011 19:16
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_FilterIDs;0)
	//ARRAY TEXT(DB_at_FilterNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_FiltersActive; DB_bo_DisplayFilters; DB_bo_FiltersActivated; DB_bo_FiltersTouched; DB_bo_ResetFilters; LAY_bo_AccTypesSetup; LAY_bo_AnalSetup; LAY_bo_AreasSetup; LAY_bo_BCAnalSetup; LAY_bo_BCLayerSetup; LAY_bo_CONsourcesSetup)
	C_BOOLEAN:C305(LAY_bo_CONStatusSetup; LAY_bo_ContractTypesSetup; LAY_bo_ConTypeSetup; LAY_bo_COsourcesSetup; LAY_bo_COStatusSetup; LAY_bo_CoTypesSetup; LAY_bo_CountiesSetup; LAY_bo_CountriesReady; LAY_bo_CountriesSetup; LAY_bo_CreditStatesSetup; LAY_bo_CSAnalSetup)
	C_BOOLEAN:C305(LAY_bo_CSLayerSetup; LAY_bo_CurrenciesSetup; LAY_bo_FiltersActive; LAY_bo_HeadingsSetup; LAY_bo_INVAnalSetup; LAY_bo_INVLayerSetup; LAY_bo_InvPeriodsSetup; LAY_bo_JBAnalSetup; LAY_bo_LayerSetup; LAY_bo_MoveTypesSetup; LAY_bo_OrderAreasSetup)
	C_BOOLEAN:C305(LAY_bo_OrdPeriodsSetup; LAY_bo_ORDsourcesSetup; LAY_bo_OrdStatesSetup; LAY_bo_OrdTypeSetup; LAY_bo_pBrandsSetup; LAY_bo_pCollectionsSetup; LAY_bo_PeriodsSetup; LAY_bo_pGroupsSetup; LAY_bo_PIAnalSetup; LAY_bo_PILayerSetup; LAY_bo_PIPeriodsSetup)
	C_BOOLEAN:C305(LAY_bo_POAnalSetup; LAY_bo_POLayerSetup; LAY_bo_POPeriodsSetup; LAY_bo_POStatesSetup; LAY_bo_RolesSetup; LAY_bo_SalesPersonSetup; LAY_bo_SLAnalSetup; LAY_bo_SLLayerSetup; LAY_bo_SMAnalSetup; LAY_bo_SMLayerSetup; LAY_bo_StatusSetup)
	C_BOOLEAN:C305(LAY_bo_STKIPeriodsSetup; LAY_bo_StockLocationsSetup; LAY_bo_StockTypesSetup; LAY_bo_TRAnalSetup; LAY_bo_TRLayerSetup; Lay_bo_UpdateFilters; SI_bo_FilterZeros)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_CurrentFilterID; $_l_event; $_l_FilterRow; $_l_FilterRow4; $_l_TableNumber; ACC_l_BalanceSheet; ACC_l_Both; ACC_l_ContextualFilterFrom; ACC_l_ContextualFilterTo; ACC_l_ProfitSheet)
	C_LONGINT:C283(CO_l_Both; CO_l_Company; CO_l_PrivateAddress; DB_l_CurrentDisplayedForm; DB_l_SelectedFilterRef; INV_l_Both; INV_l_Closed; INV_l_Open)
	C_TEXT:C284($_t_FilterName; $_t_NewFilterName; $_t_oldMethodName; DB_T_CurrentFilterName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oFilterNames"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_TableNumber:=DB_l_CurrentDisplayedForm
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		If (DB_at_FilterNames>0)
			Case of 
				: (DB_at_FilterNames{DB_at_FilterNames}=Get localized string:C991("Save_Filter"))
					//name the search parameters
					$_t_NewFilterName:=Gen_Request("Name This Filter"; "")
					If ($_t_NewFilterName#"")
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						DB_SaveFilterSettings(0; $_t_NewFilterName; $_l_TableNumber; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
						DB_LoadFilters($_l_TableNumber)
						$_l_FilterRow:=Find in array:C230(DB_at_FilterNames; $_t_NewFilterName)
						If ($_l_FilterRow>0)
							$_l_FilterRow:=Find in array:C230(DB_at_FilterNames; Get localized string:C991("Resave filter"))
							If ($_l_FilterRow<0)
								$_l_FilterRow4:=Find in array:C230(DB_at_FilterNames; "Remove Filters")
								If ($_l_FilterRow4>0)
									DELETE FROM ARRAY:C228(DB_at_FilterNames; $_l_FilterRow4)
									DELETE FROM ARRAY:C228(DB_al_FilterIDs; $_l_FilterRow4)
								End if 
								$_l_FilterRow:=Find in array:C230(DB_at_FilterNames; Get localized string:C991("DeleteFilter"))
								If ($_l_FilterRow<0)
									APPEND TO ARRAY:C911(DB_at_FilterNames; Get localized string:C991("DeleteFilter"))
									APPEND TO ARRAY:C911(DB_al_FilterIDs; 99999)
								End if 
								APPEND TO ARRAY:C911(DB_at_FilterNames; Get localized string:C991("Resave filter"))
								APPEND TO ARRAY:C911(DB_al_FilterIDs; 0)
								
								//$_l_FilterRow:=Find in array(DB_at_FilterNames;Get localized string("Resave filter"))
								//DB_al_FilterIDs{$_l_FilterRow}:=Abs(DB_al_FilterIDs{$_l_FilterRow})
								
								
							End if 
						End if 
						$_l_FilterRow4:=Find in array:C230(DB_at_FilterNames; "Remove Filters")
						If ($_l_FilterRow4<0)
							APPEND TO ARRAY:C911(DB_at_FilterNames; "Remove Filters")
							APPEND TO ARRAY:C911(DB_al_FilterIDs; 99998)
							
						End if 
						DB_at_FilterNames:=$_l_FilterRow
						DB_T_CurrentFilterName:=DB_at_FilterNames{DB_at_FilterNames}
						DB_al_FilterIDs{0}:=DB_al_FilterIDs{$_l_FilterRow}
						
					Else 
						DB_at_FilterNames:=0
						
					End if 
					
				: (DB_al_FilterIDs{DB_at_FilterNames}<0)  //Load a filter
					
					
					$_l_FilterRow:=Find in array:C230(DB_at_FilterNames; Get localized string:C991("Resave filter"))
					If ($_l_FilterRow<0)
						$_l_FilterRow:=Find in array:C230(DB_at_FilterNames; "Remove Filters")
						If ($_l_FilterRow>0)
							DELETE FROM ARRAY:C228(DB_at_FilterNames; $_l_FilterRow)
							DELETE FROM ARRAY:C228(DB_al_FilterIDs; $_l_FilterRow)
							
						End if 
						
						$_l_FilterRow:=Find in array:C230(DB_at_FilterNames; Get localized string:C991("DeleteFilter"))
						If ($_l_FilterRow<0)
							APPEND TO ARRAY:C911(DB_at_FilterNames; Get localized string:C991("DeleteFilter"))
							APPEND TO ARRAY:C911(DB_al_FilterIDs; 99999)
						End if 
						APPEND TO ARRAY:C911(DB_at_FilterNames; Get localized string:C991("Resave filter"))
						APPEND TO ARRAY:C911(DB_al_FilterIDs; 0)
						$_l_FilterRow:=Find in array:C230(DB_at_FilterNames; "Remove Filters")
						If ($_l_FilterRow<0)
							APPEND TO ARRAY:C911(DB_at_FilterNames; "Remove Filters")
							APPEND TO ARRAY:C911(DB_al_FilterIDs; 99998)
							
							
							
							
							
						End if 
					End if 
					$_l_FilterRow:=Find in array:C230(DB_at_FilterNames; "Remove Filters")
					If ($_l_FilterRow<0)
						APPEND TO ARRAY:C911(DB_at_FilterNames; "Remove Filters")
						APPEND TO ARRAY:C911(DB_al_FilterIDs; 99998)
						
					End if 
					//DB_al_FilterIDs{$_l_FilterRow}:=Abs(DB_al_FilterIDs{DB_at_FilterNames})
					DB_LoadFilterParameters(DB_al_FilterIDs{DB_at_FilterNames}; $_l_TableNumber)
					Lay_bo_UpdateFilters:=True:C214
					LAY_bo_FiltersActive:=True:C214
					DB_al_FilterIDs{0}:=DB_al_FilterIDs{DB_at_FilterNames}
				: (DB_al_FilterIDs{DB_at_FilterNames}=99999)  //Delete
					
					If (DB_al_FilterIDs{0}>0)
						$_l_FilterRow:=Find in array:C230(DB_al_FilterIDs; (DB_al_FilterIDs{0}))
						
						
						
						
						
						If ($_l_FilterRow>0)
							$_t_FilterName:=DB_at_FilterNames{$_l_FilterRow}
							Gen_Confirm("Delete Filter"+$_t_FilterName+"?")
							If (OK=1)
								READ WRITE:C146([x_QUERY_PARAMETERS:134])
								QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=DB_al_FilterIDs{$_l_FilterRow})
								
								If ([x_QUERY_PARAMETERS:134]X_OwnerID:2=0) & Not:C34((User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer")))
									Gen_Alert("This filter can only be deleted by the administrator")
								Else 
									DB_DeletionControl(->[x_QUERY_PARAMETERS:134])
									DELETE RECORD:C58([x_QUERY_PARAMETERS:134])
									READ ONLY:C145([x_QUERY_PARAMETERS:134])
									//and reload--note not generic
									DB_LoadFilters($_l_TableNumber)
									If (Size of array:C274(DB_at_FilterNames)>0)
										DB_at_FilterNames:=0
									End if 
								End if 
								
								
							End if 
						End if 
					End if 
					
					
					DB_at_FilterNames:=0
					DB_al_FilterIDs{0}:=0
					DB_T_CurrentFilterName:=""
				: (DB_al_FilterIDs{DB_at_FilterNames}=99997)  //SEPERATOR
					
					DB_at_FilterNames:=0
				: (DB_al_FilterIDs{DB_at_FilterNames}=99998)
					DB_at_FilterNames:=0
					DB_T_CurrentFilterName:=""
					DB_bo_FiltersActivated:=False:C215
					
					//SEL_CurrentRecordSelection
					
					
					$_l_TableNumber:=DB_l_CurrentDisplayedForm
					$_bo_FiltersActive:=False:C215
					If (DB_bo_DisplayFilters)
						DB_bo_DisplayFilters:=False:C215
						
						
						DB_bo_ResetFilters:=True:C214  //some filters need this to reset to defaults
						ACC_l_ContextualFilterFrom:=0
						ACC_l_ContextualFilterTo:=0
						SI_bo_FilterZeros:=False:C215
						INV_l_Closed:=0
						INV_l_Open:=0
						INV_l_Both:=0
						ACC_l_BalanceSheet:=0
						ACC_l_ProfitSheet:=0
						ACC_l_Both:=1
						CO_l_Both:=0
						CO_l_Company:=0
						CO_l_PrivateAddress:=0
						LAY_bo_CreditStatesSetup:=False:C215
						LAY_bo_StockLocationsSetup:=False:C215
						LAY_bo_StockTypesSetup:=False:C215
						LAY_bo_MoveTypesSetup:=False:C215
						LAY_bo_POStatesSetup:=False:C215
						LAY_bo_OrdStatesSetup:=False:C215
						LAY_bo_ContractTypesSetup:=False:C215
						
						LAY_bo_CountriesReady:=False:C215
						LAY_bo_SalesPersonSetup:=False:C215
						LAY_bo_CountriesSetup:=False:C215
						
						
						LAY_bo_CountiesSetup:=False:C215
						LAY_bo_AreasSetup:=False:C215
						LAY_bo_CoTypesSetup:=False:C215
						LAY_bo_ConTypeSetup:=False:C215
						LAY_bo_OrdTypeSetup:=False:C215
						LAY_bo_COStatusSetup:=False:C215
						LAY_bo_CONStatusSetup:=False:C215
						LAY_bo_COsourcesSetup:=False:C215
						LAY_bo_CONsourcesSetup:=False:C215
						LAY_bo_ORDsourcesSetup:=False:C215
						LAY_bo_AnalSetup:=False:C215
						LAY_bo_AccTypesSetup:=False:C215
						LAY_bo_TRAnalSetup:=False:C215
						LAY_bo_BCAnalSetup:=False:C215
						LAY_bo_SMAnalSetup:=False:C215
						LAY_bo_SLAnalSetup:=False:C215
						LAY_bo_StatusSetup:=False:C215
						LAY_bo_PIAnalSetup:=False:C215
						LAY_bo_POPeriodsSetup:=False:C215
						LAY_bo_PIPeriodsSetup:=False:C215
						LAY_bo_POAnalSetup:=False:C215
						LAY_bo_JBAnalSetup:=False:C215
						LAY_bo_INVAnalSetup:=False:C215
						LAY_bo_CSAnalSetup:=False:C215
						LAY_bo_LayerSetup:=False:C215
						LAY_bo_TRLayerSetup:=False:C215
						LAY_bo_BCLayerSetup:=False:C215
						LAY_bo_PeriodsSetup:=False:C215
						LAY_bo_InvPeriodsSetup:=False:C215
						LAY_bo_STKIPeriodsSetup:=False:C215
						LAY_bo_OrderAreasSetup:=False:C215
						LAY_bo_OrdPeriodsSetup:=False:C215
						LAY_bo_SLLayerSetup:=False:C215
						LAY_bo_SMLayerSetup:=False:C215
						LAY_bo_PILayerSetup:=False:C215
						LAY_bo_POLayerSetup:=False:C215
						LAY_bo_INVLayerSetup:=False:C215
						LAY_bo_CSLayerSetup:=False:C215
						LAY_bo_CurrenciesSetup:=False:C215
						LAY_bo_RolesSetup:=False:C215
						LAY_bo_HeadingsSetup:=False:C215
						LAY_bo_pGroupsSetup:=False:C215
						LAY_bo_pBrandsSetup:=False:C215
						LAY_bo_pCollectionsSetup:=False:C215
						
						
						
						
						DB_SetFilters
						DB_bo_ResetFilters:=False:C215
						
					End if 
					
					//If ($_bo_FiltersActive)
					//OBJECT SET VISIBLE(*;"oFiltersActiveText";False)
					//OBJECT SET VISIBLE(*;"oFiltersMessage";False)
					
					
					
					
					DB_T_CurrentFilterName:=""
					//DISABLE BUTTON(DB_but_ClearFiltersButton)
					
					
					DB_bo_FiltersTouched:=False:C215
					DB_at_FilterNames:=0
					//DB_SetFilters
					
					
					DB_al_FilterIDs{0}:=0
					LAY_bo_FiltersActive:=True:C214
					Lay_bo_UpdateFilters:=True:C214
				: (DB_al_FilterIDs{DB_at_FilterNames}=0)  //Resave
					
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					$_l_CurrentFilterID:=DB_al_FilterIDs{0}
					
					
					$_l_FilterRow:=Find in array:C230(DB_al_FilterIDs; $_l_CurrentFilterID)
					If ($_l_FilterRow>0)
						DB_SaveFilterSettings($_l_CurrentFilterID; ""; $_l_TableNumber; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
						DB_at_FilterNames:=Find in array:C230(DB_al_FilterIDs; DB_al_FilterIDs{0})
						DB_T_CurrentFilterName:=DB_at_FilterNames{DB_at_FilterNames}
						
						
					End if 
					
				Else 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oFilterNames"; $_t_oldMethodName)
