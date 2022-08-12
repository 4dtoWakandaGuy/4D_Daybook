//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetOutPutFilters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2013 06:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ANAL_abo_Exclude;0)
	//ARRAY BOOLEAN(ANAL_abo_Include;0)
	//ARRAY BOOLEAN(COM_lb_stats;0)
	//ARRAY BOOLEAN(CUR_abo_Exclude;0)
	//ARRAY BOOLEAN(CUR_abo_Include;0)
	//ARRAY BOOLEAN(LAY_abo_ContrTypeExclude;0)
	//ARRAY BOOLEAN(LAY_abo_Exclude;0)
	//ARRAY BOOLEAN(LAY_abo_Include;0)
	ARRAY LONGINT:C221($_al_LBSizes; 0)
	ARRAY LONGINT:C221($_al_ListBoxSize; 0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodF;0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodT;0)
	ARRAY REAL:C219($_ar_ListBoxPercent; 0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_ObjectsToDisplay; 0)
	//ARRAY TEXT(ACC_at_ContextualPeriodF;0)
	//ARRAY TEXT(ACC_at_ContextualPeriodT;0)
	//ARRAY TEXT(ANAL_at_analcode;0)
	//ARRAY TEXT(ANAL_at_AnalName;0)
	//ARRAY TEXT(aSVN1;0)
	//ARRAY TEXT(CUR_at_curcode;0)
	//ARRAY TEXT(CUR_At_CurName;0)
	//ARRAY TEXT(DB_at_AreaNames;0)
	//ARRAY TEXT(DB_at_BrandNames;0)
	//ARRAY TEXT(DB_at_CollectionNames;0)
	//ARRAY TEXT(DB_at_CountryNames;0)
	//ARRAY TEXT(DB_at_CountyNames;0)
	//ARRAY TEXT(DB_at_CredStgNames;0)
	//ARRAY TEXT(DB_at_GroupNames;0)
	//ARRAY TEXT(DB_at_HeadingCodes;0)
	//ARRAY TEXT(DB_at_HeadingNames;0)
	//ARRAY TEXT(DB_at_MoveTypeNames;0)
	//ARRAY TEXT(DB_at_RoleNames;0)
	//ARRAY TEXT(DB_at_SourceCodes;0)
	//ARRAY TEXT(DB_at_StatesNames;0)
	//ARRAY TEXT(DB_at_StatusCodes;0)
	//ARRAY TEXT(DB_at_StatusNames;0)
	//ARRAY TEXT(DB_at_StockLocNames;0)
	//ARRAY TEXT(DB_at_StockTypesNames;0)
	//ARRAY TEXT(DB_at_TypesCodes;0)
	//ARRAY TEXT(DB_at_TypesNames;0)
	//ARRAY TEXT(LAY_at_laycode;0)
	//ARRAY TEXT(LAY_at_layName;0)
	//ARRAY TEXT(LAY_at_SPName;0)
	C_BOOLEAN:C305(<>StockAnal; $_bo_DisplayAnalysis; $_bo_DisplayAreas; $_bo_DisplayCollections; $_bo_DisplayContractTypes; $_bo_DisplayCounties; $_bo_DisplayCountries; $_bo_DisplayCreditStages; $_bo_DisplayCurrencies; $_bo_DisplayFilters; $_bo_DisplayHeadings)
	C_BOOLEAN:C305($_bo_DisplayLayers; $_bo_DisplayLocations; $_bo_DisplayMovementTypes; $_bo_DisplayOrderAreas; $_bo_DisplayOrderSources; $_bo_DisplayOrderStates; $_bo_DisplayOrderTypes; $_bo_DisplayPeriods; $_bo_DisplayProdBrands; $_bo_DisplayProdGroups; $_bo_DisplayRecordStates)
	C_BOOLEAN:C305($_bo_DisplaySalesPersons; $_bo_DisplaySalesRoles; $_bo_DisplaySources; $_bo_DisplayStates; $_bo_DisplayStatus; $_bo_DisplayStockTypes; $_bo_Displaytypes; $_bo_FIltersAvailable; $_bo_NoChange; $_bo_Repeats; $_bo_ShowCreditStage)
	C_BOOLEAN:C305($_bo_ShowProfitCBs; $_bo_ShowStates; $1; ACC_bo_Both; CONT_bo_Both; CUR_bo_FilterZeros; DB_bo_AreasReady; DB_bo_CountiesReady; DB_bo_DisplayFilters; DB_bo_DisplaySelections; DB_bo_DisplayStats)
	C_BOOLEAN:C305(DB_bo_FiltersActivated; DB_bo_ShowArrayBased; DB_bo_SPReady; DB_bo_TypesReady; LAY_bo_AccTypesSetup; LAY_bo_AreasSetup; LAY_bo_ContractTypesSetup; LAY_bo_ContStatesSetup; LAY_bo_ConTypeSetup; LAY_bo_COsourcesSetup; LAY_bo_COStatusSetup)
	C_BOOLEAN:C305(LAY_bo_CoTypesSetup; LAY_bo_CountiesSetup; LAY_bo_CountriesReady; LAY_bo_CountriesSetup; LAY_bo_CreditStatesSetup; LAY_bo_CurrenciesSetup; LAY_bo_HeadingsSetup; LAY_bo_InvoiceStateSetup; LAY_bo_InvPeriodsSetup; LAY_bo_LayerSetup; LAY_bo_MoveTypesSetup)
	C_BOOLEAN:C305(LAY_bo_OrderAreasSetup; LAY_bo_OrdPeriodsSetup; LAY_bo_ORDsourcesSetup; LAY_bo_OrdStatesSetup; LAY_bo_OrdTypeSetup; LAY_bo_pBrandsSetup; LAY_bo_pCollectionsSetup; LAY_bo_PeriodsSetup; LAY_bo_pGroupsSetup; LAY_bo_PIPeriodsSetup; LAY_bo_POPeriodsSetup)
	C_BOOLEAN:C305(LAY_bo_POStatesSetup; LAY_bo_RolesSetup; LAY_bo_SalesPersonSetup; LAY_bo_StatusSetup; LAY_bo_STKIPeriodsSetup; LAY_bo_StockLocationsSetup; LAY_bo_StockTypesSetup; SI_bo_FilterZeros)
	C_LONGINT:C283($_l_AlignLeft; $_l_analysesWidth; $_l_aObjectBottom; $_l_aObjectLeft; $_l_aObjectRight; $_l_aObjectTop; $_l_AreaBottom; $_l_areaLeft; $_l_areaRight; $_l_areasWidth; $_l_areasWidthDB_SetoutFilterAre)
	C_LONGINT:C283($_l_areaTop; $_l_ArrayBottom; $_l_ArrayLeft; $_l_ArrayRight; $_l_ArrayTop; $_l_BestHeight; $_l_BestWidth; $_l_BestWidth2; $_l_BrandsWidth; $_l_ButtonsHeight; $_l_ButtonsWidth)
	C_LONGINT:C283($_l_BX; $_l_CalcSize; $_l_CalcsizeFrom; $_l_CNTWIdth; $_l_CollectionsWidth; $_l_ContractTypesWidth; $_l_CoTypeWidth; $_l_CoTypeWidths; $_l_CountiesWidth; $_l_CRStagesWidth; $_l_CurrenciesTotalWidth)
	C_LONGINT:C283($_l_CurrenciesWidth; $_l_DropDownsToDisplay; $_l_Element; $_l_FIlterBoxSize; $_l_FiltersBoxBottom; $_l_FiltersBoxLeft; $_l_FiltersBoxRight; $_l_FiltersBoxTop; $_l_FullHeight; $_l_GroupsWidth; $_l_HeadingsWidth)
	C_LONGINT:C283($_l_Index; $_l_InputNavigationRIght; $_l_LabelMaxWidth; $_l_LabelWidth; $_l_LastLeft; $_l_LastRight; $_l_LastTop; $_l_LayersWidth; $_l_LBBoxBottom; $_l_LbBoxLeft; $_l_LBBoxRight)
	C_LONGINT:C283($_l_LbBoxTop; $_l_LBLeft; $_l_LBRight; $_l_LBTop; $_l_LisboxSize; $_l_ListBoxBottom; $_l_ListboxesToDisplay; $_l_ListBoxLeft; $_l_ListBoxRight; $_l_LocationsWidth; $_l_Maximum)
	C_LONGINT:C283($_l_MaxLBWidth; $_l_MaxSizeAllocated; $_l_MaxSizeForLB; $_l_MaxSpacePerListbox; $_l_MBottom; $_l_MinimumObjectTop; $_l_MovementTypeWidths; $_l_MTop; $_l_MTop2; $_l_NavigationBottom; $_l_NavigationLeft)
	C_LONGINT:C283($_l_NavigationRight; $_l_NavigationTop; $_l_NavigatorBottom; $_l_NavigatorLeft; $_l_NavigatorRight; $_l_NavigatorTop; $_l_NewFiltersLeft; $_l_NewFormWidth; $_l_NewWIndowHeight; $_l_NewWinRight; $_l_NextLeft)
	C_LONGINT:C283($_l_NumberofRowsAvailable; $_l_ObjectBottom; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectWidth; $_l_oBottom; $_l_Offset; $_l_oldNextTop; $_l_oLeft)
	C_LONGINT:C283($_l_oRight; $_l_otherLBMinSIze; $_l_oTop; $_l_Percentage; $_l_PercentageForthisLB; $_l_RadioButtonsToDisplay; $_l_RecordStatesWidth; $_l_RectBottom; $_l_Reduce; $_l_RemaingingRB; $_l_RemainingDropDowns)
	C_LONGINT:C283($_l_RemainingLBS; $_l_RemainingListboxMin; $_l_RemainingSizeForListboxes; $_l_Repeats; $_l_Resize; $_l_RolesWidth; $_l_RowsToDisplay; $_l_ScrollBoxLeft; $_l_SearchAreaBottom; $_l_SearchAreaLeft; $_l_SearchAreaRight)
	C_LONGINT:C283($_l_SearchAreaTop; $_l_SelectionLBBottom; $_l_SelectionLBLeft; $_l_SelectionLBRight; $_l_SelectionLBTop; $_l_SetManagerRight; $_l_SetSizes; $_l_Size; $_l_SizeAllocated; $_l_SizeForListbox; $_l_SizeForListboxes)
	C_LONGINT:C283($_l_SIzeForListNotBoxes; $_l_SizePerListbox; $_l_sizesSet; $_l_SizethisLB; $_l_SMallestSize; $_l_SourcesWidth; $_l_SpaceBetween; $_l_SPWidth; $_l_StatusWidth; $_l_StockTypeWidth; $_l_StrapBottom)
	C_LONGINT:C283($_l_StrapLeft; $_l_StrapRight; $_l_StrapTop; $_l_TableNumber; $_l_TopofStats; $_l_Total; $_l_TotalRows; $_l_TotalSize; $_l_TX; $_l_ViewedStateRow; $2)
	C_LONGINT:C283($3; $4; $5; $6; $7; $8; $DB_l_RememberListBoxTop; ACC_l_BalanceSheet; ACC_l_Both; ACC_l_ProfitSheet; CO_l_Both)
	C_LONGINT:C283(CO_l_Company; CO_l_PrivateAddress; CONT_l_Both; CONT_l_Closed; CONT_l_Open; DB_l_CurrentDisplayedForm; DB_l_RememberListBoxTop; DB_l_RememberNavBarTop; INV_l_Both; INV_l_Closed; INV_l_Open)
	C_REAL:C285($_R_average; $_r_MaxRange; $_r_MinRange; $_r_PercentageThisLB; $_r_Subtract)
	C_TEXT:C284($_t_Context; $_t_oldMethodName; $_t_ViewedStateType; DB_t_CurrentContext)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetOutPutFilters")
$_bo_FIltersAvailable:=$1

$_l_ButtonsWidth:=35
$_l_ButtonsHeight:=35
If (DB_bo_DisplaySelections)
	OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_SelectionLBLeft; $_l_SelectionLBTop; $_l_SelectionLBRight; $_l_SelectionLBBottom)
	If ($_l_SelectionLBRight<250)
		$_l_SelectionLBRight:=250
	End if 
	$_l_ListBoxLeft:=6+$_l_SelectionLBRight
	$_l_NavigationLeft:=5+$_l_SelectionLBRight
Else 
	$_l_ListBoxLeft:=4
	$_l_NavigationLeft:=3
End if 
$_l_NavigationLeft:=Abs:C99($2)
$_l_InputNavigationRIght:=Abs:C99($3)
$_l_RectBottom:=$4
$_l_ListBoxRight:=$5
$_l_NewWinRight:=$6
$_l_NewFormWidth:=$7
$_l_NewWIndowHeight:=$8
OBJECT GET COORDINATES:C663(*; "oStrapHeader1"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapRight; $_l_StrapBottom)
If ($_l_StrapBottom>0)
	$_l_MinimumObjectTop:=$_l_StrapTop
Else 
	$_l_MinimumObjectTop:=5
End if 

If (DB_bo_DisplayFilters) & ($_bo_FIltersAvailable)
	//object created for
	//1) Period code from
	//2) period code to
	//3) Analysis codes
	//4) layer codes
	//5) currency codes
	//6 sales person
	//7 countries
	//8 County/state
	//9 areas
	//10 typs
	//ALERT("SIZE3")
	
	//ALERT("SIZE4")
	OBJECT GET COORDINATES:C663(*; "oSearchvalue"; $_l_SearchAreaLeft; $_l_SearchAreaTop; $_l_SearchAreaRight; $_l_SearchAreaBottom)
	If ($_l_MinimumObjectTop>($_l_SearchAreaTop-3))
		$_l_SearchAreaBottom:=($_l_SearchAreaBottom-$_l_SearchAreaTop)+3
		$_l_SearchAreaTop:=$_l_MinimumObjectTop+3
	End if 
	OBJECT GET COORDINATES:C663(*; "oNavigator"; $_l_NavigationLeft; $_l_NavigationTop; $_l_NavigationRight; $_l_NavigationBottom)
	If ($_l_MinimumObjectTop>($_l_NavigationTop-19))
		$_l_NavigationTop:=$_l_MinimumObjectTop+19
		DB_l_RememberNavBarTop:=$_l_NavigationTop
	End if 
	If (DB_l_RememberNavBarTop=0)
		DB_l_RememberNavBarTop:=$_l_NavigationTop
	End if 
	If ($_l_NavigationTop<$_l_SearchAreaBottom)
		$_l_NavigationTop:=$_l_SearchAreaBottom+5
		DB_l_RememberNavBarTop:=$_l_NavigationTop
	End if 
	OBJECT SET COORDINATES:C1248(*; "oNavigator"; $_l_NavigationLeft; DB_l_RememberNavBarTop; $_l_InputNavigationRIght; $_l_RectBottom)
	OBJECT SET COORDINATES:C1248(*; "oFiltersBox"; ($_l_InputNavigationRIght+5); $_l_NavigationTop+5; ($_l_NewWinRight-5); $_l_RectBottom)
	If (DB_bo_ShowArrayBased)
		OBJECT GET COORDINATES:C663(*; "oListboxOutputArrays"; $_l_LBTop; $_l_LBTop; $_l_LBRight; $_l_ListBoxBottom)
		If (DB_l_RememberNavBarTop=0)
			DB_l_RememberNavBarTop:=$_l_LBTop
		End if 
	Else 
		OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_LBTop; $_l_LBTop; $_l_LBRight; $_l_ListBoxBottom)
		If (DB_l_RememberListBoxTop=0)
			DB_l_RememberListBoxTop:=$_l_LBTop
		End if 
	End if 
	$_l_ListboxesToDisplay:=0
	If (DB_bo_DisplayStats)
		//Get object
		If (False:C215)
			$_l_FullHeight:=($_l_RectBottom-5)-$_l_LBTop
			$_l_ListBoxBottom:=$_l_FullHeight/2
			
			OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_ListBoxBottom-5; *)
			OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_ListBoxBottom-5; *)
			OBJECT GET COORDINATES:C663(*; "oStatsColumnBreakDown"; $_l_ArrayLeft; $_l_ArrayTop; $_l_ArrayRight; $_l_ArrayBottom)
			$_l_ObjectWidth:=$_l_ArrayRight-$_l_ArrayLeft
			$_l_ObjectHeight:=$_l_ArrayBottom-$_l_ArrayTop
		End if 
		$_l_Size:=Size of array:C274(aSVN1)*14
		If ($_l_Size<14)
			$_l_Size:=14
		End if 
		
		$_l_FullHeight:=($_l_RectBottom-5)-$_l_LBTop
		$_l_ListBoxBottom:=$_l_FullHeight/2
		OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_LBTop+$_l_ListBoxBottom-5; *)
		OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_LBTop+$_l_ListBoxBottom-5; *)
		OBJECT GET COORDINATES:C663(*; "oStatsColumnBreakDown"; $_l_ArrayLeft; $_l_ArrayTop; $_l_ArrayRight; $_l_ArrayBottom)
		$_l_ObjectWidth:=$_l_ArrayRight-$_l_ArrayLeft
		$_l_ObjectHeight:=$_l_ArrayBottom-$_l_ArrayTop
		$_l_BX:=$_l_LBTop+$_l_ListBoxBottom+5+$_l_ObjectHeight+5
		$_l_TX:=(($_l_RectBottom-5)-12)
		
		If ($_l_Size>-($_l_TX-$_l_BX))
			
			
			
			$_l_Size:=(($_l_RectBottom-5)-12)-($_l_LBTop+$_l_ListBoxBottom+5+$_l_ObjectHeight+5)
		End if 
		If ($_l_Size<20)
			LB_SetScroll(->COM_lb_stats; -3; -3)
		End if 
		OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_LBTop+$_l_FullHeight-($_l_Size+28+15); *)
		OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_LBTop+$_l_FullHeight-($_l_Size+28+15); *)
		$_l_TopofStats:=(($_l_RectBottom-5)-14)-$_l_Size
		OBJECT MOVE:C664(*; "oStatsListbox1"; $_l_ListBoxLeft; $_l_TopofStats-14; $_l_ListBoxRight; $_l_TopofStats; *)
		OBJECT MOVE:C664(*; "oStatsListbox"; $_l_ListBoxLeft; $_l_TopofStats; $_l_ListBoxRight; ($_l_RectBottom-5)-14; *)
		OBJECT MOVE:C664(*; "oStatsListbox2"; $_l_ListBoxLeft; ($_l_RectBottom-5)-14; $_l_ListBoxRight; $_l_RectBottom-5; *)
		//MOVE OBJECT(*;"oStatsColumnBreakDown";$_l_ListBoxLeft+5;$_l_ListBoxBottom+5;$_l_ListBoxLeft+5+$_l_ObjectWidth;$_l_ListBoxBottom+5+$_l_ObjectHeight;*)
	Else 
		OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_RectBottom-5; *)
		OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_RectBottom-5; *)
		
	End if 
	//MOVE OBJECT(*;"oListboxOutputForm";$_l_ListBoxLeft;$_l_LBTop;$_l_ListBoxRight;$_l_RectBottom-5;*)
	//MOVE OBJECT(*;"oListboxOutputArrays";$_l_ListBoxLeft;$_l_LBTop;$_l_ListBoxRight;$_l_RectBottom-5;*)
	OBJECT SET VISIBLE:C603(*; "oAccDateFromBox"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccDateFromContextualPeriods"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccDateToBox"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccDateToContextualPeriods"; False:C215)
	
	OBJECT SET VISIBLE:C603(*; "oFilterNames"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccDate@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccLayers@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccAnal@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccProfBal@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccCur@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSalesPerson@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCountry@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCounty@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAreas@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oType@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStatus@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCoTypes@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRoles@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oHeading@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oGroup@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oBrand@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCollection@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oContractStates@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oContrTypes@"; False:C215)  //contract types
	
	OBJECT SET VISIBLE:C603(*; "oStockTypes@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStockLocs@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "ocredStage@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oInvoicePaid@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oMoves@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oContractStates@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStates@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "OcsFilterZeros@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "OSiFilterZeros@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "OSIFilterAllocated@"; False:C215)
	
	OBJECT SET VISIBLE:C603(*; "oSources@"; False:C215)
	OBJECT MOVE:C664(*; "oFiltersBox"; ($_l_InputNavigationRIght+5); $_l_NavigationTop+8; ($_l_InputNavigationRIght+5)+65+2+228+10; $_l_RectBottom; *)
	OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
	$_l_FIlterBoxSize:=$_l_FiltersBoxBottom-$_l_FiltersBoxTop
	$_l_ScrollBoxLeft:=$_l_FiltersBoxLeft+72
	$_l_AlignLeft:=$_l_FiltersBoxLeft+6
	$_l_ListboxesToDisplay:=0
	$_l_DropDownsToDisplay:=0
	$_l_RadioButtonsToDisplay:=0
	
	$_bo_DisplaySalesPersons:=False:C215
	$_bo_DisplayOrderTypes:=False:C215
	$_bo_DisplayOrderAreas:=False:C215
	$_bo_DisplayOrderStates:=False:C215
	$_bo_DisplayOrderSources:=False:C215
	$_bo_DisplayCounties:=False:C215  //``3/5/2013
	$_bo_DisplayCountries:=False:C215  //3/5/2013
	$_bo_DisplayAreas:=False:C215  //3/5/2013--might be same as Order areas??
	$_bo_Displaytypes:=False:C215  //3/5/2013 might be same as order types
	$_bo_DisplayPeriods:=False:C215  // /10/5/2013
	$_bo_DisplayAnalysis:=False:C215  //10/5/2013
	$_bo_DisplayLayers:=False:C215  //10/5/2013
	$_bo_DisplayCurrencies:=False:C215  //10/5/2013
	
	
	
	
	
	
	
	
	$_bo_DisplaySalesRoles:=False:C215
	$_bo_DisplayHeadings:=False:C215
	$_bo_DisplayProdGroups:=False:C215
	$_bo_ShowProfitCBs:=False:C215
	$_bo_DisplayProdBrands:=False:C215
	$_bo_DisplayMovementTypes:=False:C215
	$_bo_DisplayStockTypes:=False:C215
	$_bo_DisplayRecordStates:=False:C215
	$_bo_DisplayCreditStages:=False:C215
	$_bo_DisplayLocations:=False:C215
	$_bo_DisplayContractTypes:=False:C215
	$_bo_DisplayCollections:=False:C215
	
	ARRAY TEXT:C222($_at_ObjectsToDisplay; 0)
	ARRAY LONGINT:C221($_al_LBSizes; 0)
	$_l_MaxLBWidth:=0
	$_l_MaxLBWidth:=0  //this will be set to the largest calculation of column width for listbox areas to display.
	Case of 
		: (DB_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
			//OBJECT MOVE(*;"oFiltersBox";($_l_InputNavigationRIght+5);$_l_NavigationTop+8;($_l_InputNavigationRIght+5)+65+2+228+10;$_l_RectBottom;*)
			//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
			//$MaxSIze:=(($_l_RectBottom-$_l_FiltersBoxTop)-((10*5)+28+32))/7
			$_l_SPWidth:=DB_SetOutFIlterSalesPersons(->[COMPANIES:2])
			If (Size of array:C274(LAY_at_SPName)>1)
				If ($_l_SPWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_SPWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_SPName)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_SPName))
				$_bo_DisplaySalesPersons:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Sales Person")
				
			End if 
			$_l_CNTWIdth:=DB_SetOutFIlterCountries(->[COMPANIES:2])
			//If (Size of array(DB_at_CountryNames)>1)
			
			If ($_l_CNTWIdth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_CNTWIdth
			End if 
			$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
			$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_CountryNames)*20)+20
			APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_CountryNames))
			
			$_bo_DisplayCountries:=True:C214
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Countries")
			//End if 
			
			$_l_CountiesWidth:=DB_SetOutFIlterCounties(->[COMPANIES:2])
			If (Size of array:C274(DB_at_CountyNames)>1)
				If ($_l_CountiesWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_CountiesWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_bo_DisplayCounties:=True:C214
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_CountyNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_CountyNames))
				
				
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Counties")
			End if 
			
			$_l_areasWidth:=DB_SetoutFilterAreas(->[COMPANIES:2])
			If (Size of array:C274(DB_at_AreaNames)>1)
				If ($_l_areasWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_areasWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_AreaNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_AreaNames))
				
				$_bo_DisplayAreas:=True:C214
				
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Areas")
			End if 
			$_l_CoTypeWidth:=DB_SetoutFilterCoType(->[COMPANIES:2])
			If (Size of array:C274(DB_at_TypesCodes)>1)
				If ($_l_CoTypeWidths>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_CoTypeWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_TypesCodes)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_TypesCodes))
				
				$_bo_Displaytypes:=True:C214
				
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "CompanyTypes")
			End if 
			
			//satus
			$_l_StatusWidth:=DB_SetoutFilterCoStatus(->[COMPANIES:2])
			
			If (Size of array:C274(DB_at_StatusCodes)>1)
				If ($_l_StatusWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_StatusWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_StatusCodes)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_StatusCodes))
				
				$_bo_DisplayStatus:=True:C214
				
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Status")
			End if 
			//````````
			//source
			$_l_SourcesWidth:=DB_SetOutputFiltersSources(->[COMPANIES:2])
			
			If (Size of array:C274(DB_at_SourceCodes)>1)
				If ($_l_SourcesWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_SourcesWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_SourceCodes)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_SourceCodes))
				
				$_bo_DisplaySources:=True:C214
				
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Sources")
			End if 
			
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "COADDRESSTYPES")
			If (Not:C34(LAY_bo_CoTypesSetup))
				LAY_bo_CoTypesSetup:=True:C214
				CO_l_Both:=1
				CO_l_Company:=0
				CO_l_PrivateAddress:=0
			End if 
			
			
			//size
		: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNT_BALANCES:34]))
			//TRACE
			
			//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
			
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			
			
			DB_SetOutFilterPeriods(->[ACCOUNT_BALANCES:34])
			$_bo_DisplayPeriods:=True:C214
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Periods")
			
			
			If (Records in table:C83([ANALYSES:36])>0)
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[ACCOUNT_BALANCES:34])
				If (Size of array:C274(ANAL_at_analcode)>1)
					If ($_l_analysesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_analysesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(ANAL_at_analcode)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(ANAL_at_analcode))
					
					$_bo_DisplayAnalysis:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Analysis")
				End if 
				
			Else 
				ARRAY TEXT:C222(ANAL_at_analcode; 0)
				ARRAY TEXT:C222(ANAL_at_AnalName; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
			End if 
			If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[ACCOUNTS_LAYERS:156])
				
				If (Size of array:C274(LAY_at_layName)>1)
					If ($_l_LayersWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_LayersWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_layName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_layName))
					
					$_bo_DisplayLayers:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Layers")
					
				End if 
			Else 
				ARRAY TEXT:C222(LAY_at_laycode; 0)
				ARRAY TEXT:C222(LAY_at_layName; 0)
				
				ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
			End if 
			If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
				
				$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[ACCOUNT_BALANCES:34])
				If (Size of array:C274(CUR_At_CurName)>1)
					If ($_l_CurrenciesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_CurrenciesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(CUR_At_CurName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(CUR_At_CurName))
					
					$_bo_DisplayCurrencies:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Currencies")
				End if 
				
			Else 
				ARRAY TEXT:C222(CUR_at_curcode; 0)
				ARRAY TEXT:C222(CUR_at_CurName; 0)
				ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
				ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
			End if 
			$_bo_ShowProfitCBs:=True:C214
			$_l_RadioButtonsToDisplay:=$_l_RadioButtonsToDisplay+1  //note this is one because its one line
			
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Profit CheckBoxes")
			//APPEND TO ARRAY($_at_ObjectsToDisplay;"ProfitBalance")
			
			If (Not:C34(LAY_bo_AccTypesSetup))
				LAY_bo_AccTypesSetup:=True:C214
				ACC_l_Both:=1
				ACC_l_ProfitSheet:=0
				ACC_l_BalanceSheet:=0
			End if 
		: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
			// SALES PERSON(SAME AS CO)
			$_l_SPWidth:=DB_SetOutFIlterSalesPersons(->[CONTACTS:1])
			If (Size of array:C274(LAY_at_SPName)>1)
				If ($_l_SPWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_SPWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_SPName)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_SPName))
				
				$_bo_DisplaySalesPersons:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Sales Person")
			End if 
			
			//ROLES
			$_l_RolesWidth:=DB_SetOutFIlterRoles(->[CONTACTS:1])
			If (Size of array:C274(DB_at_RoleNames)>1)
				If ($_l_RolesWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_RolesWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_RoleNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_SPName))
				
				$_bo_DisplaySalesRoles:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Roles")
			End if 
			//STATUS(SAME AS CO)
			$_l_StatusWidth:=DB_SetoutFilterCoStatus(->[CONTACTS:1])
			If (Size of array:C274(DB_at_StatusNames)>1)
				If ($_l_StatusWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_StatusWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_StatusNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_StatusNames))
				
				$_bo_DisplayStatus:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Status")
			End if 
			
			//TYPE(SAME AS CO)-BUT POTENTIALLY DIFFERENT LIST
			$_l_CoTypeWidth:=DB_SetoutFilterCoType(->[CONTACTS:1])
			If (Size of array:C274(DB_at_TypesNames)>1)
				If ($_l_CoTypeWidths>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_CoTypeWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_TypesNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_TypesNames))
				
				$_bo_Displaytypes:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Co Types")
			End if 
			$_l_SourcesWidth:=DB_SetOutputFiltersSources(->[CONTACTS:1])
			//source
			If (Size of array:C274(DB_at_SourceCodes)>1)
				If ($_l_SourcesWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_SourcesWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_SourceCodes)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_SourceCodes))
				
				$_bo_DisplaySources:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Sources")
			End if 
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
			
			
			If (Records in table:C83([HEADINGS:84])>0)
				$_l_HeadingsWidth:=DB_SetOutputFilterHeadings
				
				If (Size of array:C274(DB_at_HeadingNames)>1)
					If ($_l_HeadingsWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_HeadingsWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_HeadingNames)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_HeadingNames))
					
					$_bo_DisplayHeadings:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Headings")
					
				End if 
				
			Else 
				ARRAY TEXT:C222(DB_at_HeadingNames; 0)
				ARRAY TEXT:C222(DB_at_HeadingCodes; 0)
			End if 
			$_bo_ShowProfitCBs:=True:C214
			$_l_RadioButtonsToDisplay:=$_l_RadioButtonsToDisplay+1  //note this is one because its one line
			
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Profit CheckBoxes")
			
			
			If (Not:C34(LAY_bo_AccTypesSetup))
				LAY_bo_AccTypesSetup:=True:C214
				ACC_l_Both:=1
				ACC_l_ProfitSheet:=0
				ACC_l_BalanceSheet:=0
			End if 
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCTS:9]))
			$_l_GroupsWidth:=DB_SetOutFilterGroups
			If (Size of array:C274(DB_at_GroupNames)>1)
				If ($_l_GroupsWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_GroupsWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_GroupNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_GroupNames))
				
				$_bo_DisplayProdGroups:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Product Groups")
			End if 
			//Groups
			$_l_BrandsWidth:=DB_SetOutFIlterBrands
			If (Size of array:C274(DB_at_BrandNames)>1)
				If ($_l_BrandsWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_BrandsWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_BrandNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_BrandNames))
				
				$_bo_DisplayProdBrands:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Brands")
			End if 
			$_l_CollectionsWidth:=DB_setOutFilterCollections
			If (Size of array:C274(DB_at_CollectionNames)>1)
				If ($_l_CollectionsWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_CollectionsWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_CollectionNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_CollectionNames))
				
				$_bo_DisplayCollections:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Collections")
			End if 
			//catalogue
		: (DB_l_CurrentDisplayedForm=Table:C252(->[ORDERS:24])) | (DB_l_CurrentDisplayedForm=Table:C252(->[ORDER_ITEMS:25]))
			//OBJECT MOVE(*;"oFiltersBox";($_l_InputNavigationRIght+5);$_l_NavigationTop+8;($_l_InputNavigationRIght+5)+65+2+228+10;$_l_RectBottom;*)
			//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
			//$_l_FIlterBoxSize:=$_l_FiltersBoxBottom-$_l_FiltersBoxTop
			//$_l_ScrollBoxLeft:=$_l_FiltersBoxLeft+72
			//$_l_AlignLeft:=$_l_FiltersBoxLeft+6
			//$_l_ListboxesToDisplay:=0
			//$_l_DropDownsToDisplay:=0
			//$_l_RadioButtonsToDisplay:=0
			//$_bo_DisplaySalesPersons:=False
			//$_bo_DisplayOrderTypes:=False
			//$_bo_DisplayOrderAreas:=False
			//$_bo_DisplayOrderStates:=False
			//$_bo_DisplayOrderSources:=False
			//state
			//sales person²
			//type²
			//area²
			//period
			//if are viewing orders we can allow the filter by states-but not include enquiries and quotes-if viewing quotes then no states.
			
			If (DB_t_CurrentContext="")
				$_bo_ShowStates:=True:C214
			Else 
				Case of 
					: (DB_t_CurrentContext="Subscription@")
						//Subs dates
						//types
						$_bo_ShowStates:=True:C214
					Else 
						$_t_ViewedStateType:=Replace string:C233($_t_Context; Get localized string:C991("MenuItem_View")+" "; "")
						$_l_ViewedStateRow:=Find in array:C230(<>SYS_at_RecStateNames{24}; $_t_ViewedStateType)
						Case of 
							: ($_l_ViewedStateRow=1)  //Enquiries
								
								$_bo_ShowStates:=False:C215
							: ($_l_ViewedStateRow=2)  //Quotations
								
								$_bo_ShowStates:=False:C215
							Else 
								$_bo_ShowStates:=True:C214
						End case 
				End case 
			End if 
			
			$_l_SPWidth:=DB_SetOutFIlterSalesPersons(->[ORDERS:24])
			If (Size of array:C274(LAY_at_SPName)>1)
				If ($_l_SPWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_SPWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_SPName)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_SPName))
				
				$_bo_DisplaySalesPersons:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Sales Person")
			End if 
			$_l_CoTypeWidth:=DB_SetoutFilterCoType(->[ORDERS:24])
			If (Size of array:C274(DB_at_TypesNames)>1)
				If ($_l_CoTypeWidths>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_CoTypeWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_TypesNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_TypesNames))
				
				$_bo_DisplayOrderTypes:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Order Types")
			End if 
			$_l_areasWidth:=DB_SetoutFilterAreas(->[ORDERS:24])
			
			
			If (Size of array:C274(DB_at_AreaNames)>1)
				If ($_l_areasWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_areasWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_AreaNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_AreaNames))
				
				$_bo_DisplayOrderAreas:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Areas")
			End if 
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Periods")
			
			DB_SetOutFilterPeriods(->[ORDERS:24])
			$_bo_DisplayPeriods:=True:C214
			
			
			$_l_RecordStatesWidth:=DB_SetOutFilterRecordStates(->[ORDERS:24])
			
			
			
			If (Size of array:C274(DB_at_StatesNames)>1)
				If ($_l_RecordStatesWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_RecordStatesWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_StatesNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_StatesNames))
				
				$_bo_DisplayStates:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Record States")
			End if 
			//source
			
			
			$_l_SourcesWidth:=DB_SetOutputFiltersSources(->[ORDERS:24])
			
			If (Size of array:C274(DB_at_SourceCodes)>1)
				If ($_l_SourcesWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_SourcesWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_SourceCodes)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_SourceCodes))
				
				$_bo_DisplayOrderSources:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Sources")
			End if 
			//$_l_SizeForListboxes:=$_l_FIlterBoxSize-(($_l_DropDownsToDisplay*(18+5)+($_l_RadioButtonsToDisplay*(18+5))))
			
			
			//$_l_SizePerListbox:=($_l_SizeForListboxes-28)/$_l_ListboxesToDisplay
			//$_l_LastTop:=28
			
			
			
			
			
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTRACTS:17]))
			//OBJECT MOVE(*;"oFiltersBox";($_l_InputNavigationRIght+5);$_l_NavigationTop+8;($_l_InputNavigationRIght+5)+65+2+228+10;$_l_RectBottom;*)
			//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
			//$MaxSIze:=(($_l_RectBottom-$_l_FiltersBoxTop)-((10*0)+32+28))/1
			//zcontract type
			$_l_ContractTypesWidth:=DB_SetOutFilterContractTypes
			If (Size of array:C274(LAY_abo_ContrTypeExclude)>1)
				If ($_l_ContractTypesWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_ContractTypesWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_abo_ContrTypeExclude)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_abo_ContrTypeExclude))
				
				$_bo_DisplayContractTypes:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Contract Types")
			End if 
			
			$_l_RadioButtonsToDisplay:=$_l_RadioButtonsToDisplay+1
			$_l_RadioButtonsToDisplay:=$_l_RadioButtonsToDisplay+1
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Contract States")
			
			If (Not:C34(LAY_bo_ContStatesSetup))
				LAY_bo_ContStatesSetup:=True:C214
				CONT_l_Both:=1
				CONT_l_Open:=0
				CONT_l_Closed:=0
			End if 
			
			//open closed
		: (DB_l_CurrentDisplayedForm=Table:C252(->[CURRENT_STOCK:62]))
			
			
			$_l_StockTypeWidth:=DB_SetOutFilterStockTypes(->[CURRENT_STOCK:62])
			
			If (Size of array:C274(DB_at_StockTypesNames)>1)
				If ($_l_StockTypeWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_StockTypeWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_StockTypesNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_StockTypesNames))
				
				$_bo_DisplayStockTypes:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Stock Types")
			End if 
			//location
			$_l_LocationsWidth:=DB_SetoutfilterLocations
			If (Size of array:C274(DB_at_StockLocNames)>1)
				If ($_l_LocationsWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_LocationsWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_StockLocNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_StockLocNames))
				
				$_bo_DisplayLocations:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Locations")
			End if 
			//layer
			//anal
			//currency
			If (Records in table:C83([ANALYSES:36])>0) & (<>StockAnal)
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[CURRENT_STOCK:62])
				If (Size of array:C274(ANAL_at_analcode)>1)
					If ($_l_analysesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_analysesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(ANAL_at_analcode)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(ANAL_at_analcode))
					
					$_bo_DisplayAnalysis:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Analysis")
				End if 
			Else 
				ARRAY TEXT:C222(ANAL_at_analcode; 0)
				ARRAY TEXT:C222(ANAL_at_AnalName; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
			End if 
			If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[CURRENT_STOCK:62])
				
				If (Size of array:C274(LAY_at_layName)>1)
					If ($_l_LayersWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_LayersWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_layName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_layName))
					
					$_bo_DisplayLayers:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Layers")
				End if 
			Else 
				ARRAY TEXT:C222(LAY_at_laycode; 0)
				ARRAY TEXT:C222(LAY_at_layName; 0)
				
				ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
			End if 
			If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
				
				$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[CURRENT_STOCK:62])
				If (Size of array:C274(CUR_At_CurName)>1)
					If ($_l_CurrenciesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_CurrenciesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(CUR_At_CurName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(CUR_At_CurName))
					
					$_bo_DisplayCurrencies:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Currencies")
				End if 
			Else 
				ARRAY TEXT:C222(CUR_at_curcode; 0)
				ARRAY TEXT:C222(CUR_at_CurName; 0)
				ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
				ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
			End if 
			
			$_l_RadioButtonsToDisplay:=$_l_RadioButtonsToDisplay+1
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Filter Zeros")
			
			//$_l_RadioButtonsToDisplay:=$_l_RadioButtonsToDisplay+1  //note this is one because its one line
			//APPEND TO ARRAY($_at_ObjectsToDisplay;"OSIFilter Zeros")
			
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[DIARY:12]))  //<<  << <
		: (DB_l_CurrentDisplayedForm=Table:C252(->[DOCUMENTS:7]))  //<< <,
			
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES:39])) | (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES_ITEMS:161]))
			
			
			
			$_t_Context:=DB_t_CurrentContext
			$_bo_ShowCreditStage:=True:C214
			Case of 
				: ($_t_Context="ViewCreditnotes") | ($_t_Context="View Credit notes")
					$_bo_ShowCreditStage:=False:C215
					
				: ($_t_Context="ViewReceipts") | ($_t_Context="View Receipts")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="ViewDeposits") | ($_t_Context="View Deposits")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Proformas") | ($_t_Context="View Proformas")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Invoices") | ($_t_Context="View Invoices")  // View invoices only
					
					$_bo_ShowCreditStage:=True:C214
				: ($_t_Context="Refund Deposit")  // View invoices only
					
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Invoice Receipt")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Undo Receipt")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Batch Print Created Invoices")
					$_bo_ShowCreditStage:=False:C215
					//dont change the selection.. ..this is used from a view of orders
					
				: ($_t_Context="Batch Print Invoices")
					$_bo_ShowCreditStage:=False:C215
					
				: ($_t_Context="Batch Post Invoices")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Send Statements")
					$_bo_ShowCreditStage:=False:C215
				: ($_t_Context="Print Remittance Receipts")  // Print remittances and
					
					$_bo_ShowCreditStage:=False:C215
					
				Else   //all sales ledger items
					
					$_bo_ShowCreditStage:=True:C214
			End case 
			//OBJECT MOVE(*;"oFiltersBox";($_l_InputNavigationRIght+5);$_l_NavigationTop+8;($_l_InputNavigationRIght+5)+65+2+228+10;$_l_RectBottom;*)
			
			If ($_bo_ShowCreditStage)
				//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
				//$MaxSIze:=(($_l_RectBottom-$_l_FiltersBoxTop)-((10*5)+32+28))/6
			Else 
				//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
				//$MaxSIze:=(($_l_RectBottom-$_l_FiltersBoxTop)-((10*4)+32+28))/5
			End if 
			
			
			
			//credit stage-not applicable to payments
			$_l_CRStagesWidth:=DB_SetoutfilterCreditStages
			If (Size of array:C274(DB_at_CredStgNames)>1) & ($_bo_ShowCreditStage)
				If ($_l_CRStagesWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_CRStagesWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_CredStgNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_CredStgNames))
				
				$_bo_DisplayCreditStages:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Credit Stages")
			End if 
			
			//Period
			
			//TRACE
			If (Not:C34(LAY_bo_InvPeriodsSetup))
				DB_SetOutFilterPeriods(->[INVOICES:39])
			End if 
			$_bo_DisplayPeriods:=True:C214
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Periods")
			//ACC_ad_PeriodFrom
			
			//$_l_LastTop:=$_l_LastTop+18+10
			//analy
			If (Records in table:C83([ANALYSES:36])>0)
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[INVOICES:39])
				If (Size of array:C274(ANAL_at_analcode)>1)
					If ($_l_analysesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_analysesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(ANAL_at_analcode)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(ANAL_at_analcode))
					
					$_bo_DisplayAnalysis:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Analysis")
				End if 
				
			Else 
				ARRAY TEXT:C222(ANAL_at_analcode; 0)
				ARRAY TEXT:C222(ANAL_at_AnalName; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
			End if 
			If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[INVOICES:39])
				
				If (Size of array:C274(LAY_at_layName)>1)
					If ($_l_LayersWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_LayersWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_layName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_layName))
					
					$_bo_DisplayLayers:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Layers")
				End if 
				
			Else 
				ARRAY TEXT:C222(LAY_at_laycode; 0)
				ARRAY TEXT:C222(LAY_at_layName; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
			End if 
			If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
				
				$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[INVOICES:39])
				If (Size of array:C274(CUR_At_CurName)>1)
					If ($_l_CurrenciesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_CurrenciesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(CUR_At_CurName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(CUR_At_CurName))
					
					$_bo_DisplayCurrencies:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Currencies")
				End if 
				
			Else 
				ARRAY TEXT:C222(CUR_at_curcode; 0)
				ARRAY TEXT:C222(CUR_at_CurName; 0)
				ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
				ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
			End if 
			
			$_l_areasWidth:=DB_SetoutFilterAreas(->[INVOICES:39])
			
			If (Size of array:C274(DB_at_AreaNames)>1)
				If ($_l_areasWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_areasWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_AreaNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_AreaNames))
				
				$_bo_DisplayAreas:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Areas")
			End if 
			//area
			$_l_RadioButtonsToDisplay:=$_l_RadioButtonsToDisplay+1
			$_l_RadioButtonsToDisplay:=$_l_RadioButtonsToDisplay+1
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Invoice Paid")
			
			
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
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[JOBS:26])
				If (Size of array:C274(ANAL_at_analcode)>1)
					If ($_l_analysesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_analysesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(ANAL_at_analcode)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(ANAL_at_analcode))
					
					$_bo_DisplayAnalysis:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Analysis")
				End if 
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
			
			
			$_l_RecordStatesWidth:=DB_SetOutFilterRecordStates(->[PURCHASE_ORDERS:57])
			
			If (Size of array:C274(DB_at_StatesNames)>1)
				If ($_l_RecordStatesWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_RecordStatesWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_StatesNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_StatesNames))
				
				$_bo_DisplayStates:=True:C214
				$_bo_ShowStates:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Record States")
			End if 
			
			If (Records in table:C83([ANALYSES:36])>0)
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[PURCHASE_ORDERS:57])
				If (Size of array:C274(ANAL_at_analcode)>1)
					If ($_l_analysesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_analysesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(ANAL_at_analcode)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(ANAL_at_analcode))
					
					$_bo_DisplayAnalysis:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Analysis")
				End if 
			Else 
				ARRAY TEXT:C222(ANAL_at_analcode; 0)
				ARRAY TEXT:C222(ANAL_at_AnalName; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
			End if 
			If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[PURCHASE_ORDERS:57])
				
				If (Size of array:C274(LAY_at_layName)>1)
					If ($_l_LayersWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_LayersWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_layName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_layName))
					
					$_bo_DisplayLayers:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Layers")
				End if 
				
			Else 
				ARRAY TEXT:C222(LAY_at_laycode; 0)
				ARRAY TEXT:C222(LAY_at_layName; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
			End if 
			If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
				
				$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[PURCHASE_ORDERS:57])
				If (Size of array:C274(CUR_At_CurName)>1)
					If ($_l_CurrenciesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_CurrenciesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(CUR_At_CurName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(CUR_At_CurName))
					
					$_bo_DisplayCurrencies:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Currencies")
				End if 
			Else 
				ARRAY TEXT:C222(CUR_at_curcode; 0)
				ARRAY TEXT:C222(CUR_at_CurName; 0)
				ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
				ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
			End if 
			
			If (Not:C34(LAY_bo_POPeriodsSetup))
				DB_SetOutFilterPeriods(->[PURCHASE_ORDERS:57])
			End if 
			$_bo_DisplayPeriods:=True:C214
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Periods")
			
			//analysis
			//layers
			//currency
			//periodss
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICES:37])) | (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
			//OBJECT MOVE(*;"oFiltersBox";($_l_InputNavigationRIght+5);$_l_NavigationTop+8;($_l_InputNavigationRIght+5)+65+2+228+10;$_l_RectBottom;*)
			//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
			//$MaxSIze:=(($_l_RectBottom-$_l_FiltersBoxTop)-((10*3)+96+28))/4
			//$_l_AlignLeft:=$_l_FiltersBoxLeft+2
			//$_l_LastTop:=$_l_FiltersBoxTop+20
			$_bo_DisplayPeriods:=True:C214
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Periods")
			
			If (Not:C34(LAY_bo_PIPeriodsSetup))
				DB_SetOutFilterPeriods(->[PURCHASE_INVOICES:37])
			End if 
			//$_l_LastTop:=$_l_LastTop+18+10
			
			//periods
			//analysis
			//layers
			//currency
			If (Records in table:C83([ANALYSES:36])>0)
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[PURCHASE_INVOICES:37])
				If (Size of array:C274(ANAL_at_analcode)>1)
					If ($_l_analysesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_analysesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(ANAL_at_analcode)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(ANAL_at_analcode))
					
					$_bo_DisplayAnalysis:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Analysis")
				End if 
			Else 
				ARRAY TEXT:C222(ANAL_at_analcode; 0)
				ARRAY TEXT:C222(ANAL_at_AnalName; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
			End if 
			If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[PURCHASE_INVOICES:37])
				
				If (Size of array:C274(LAY_at_layName)>1)
					If ($_l_LayersWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_LayersWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_layName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_layName))
					
					$_bo_DisplayLayers:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Stock Types")
				End if 
			Else 
				ARRAY TEXT:C222(LAY_at_laycode; 0)
				ARRAY TEXT:C222(LAY_at_layName; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
			End if 
			If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
				
				$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[PURCHASE_INVOICES:37])
				If (Size of array:C274(CUR_At_CurName)>1)
					If ($_l_CurrenciesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_CurrenciesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(CUR_At_CurName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(CUR_At_CurName))
					
					$_bo_DisplayCurrencies:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Currencies")
				End if 
				
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
			
			//OBJECT MOVE(*;"oFiltersBox";($_l_InputNavigationRIght+5);$_l_NavigationTop+8;($_l_InputNavigationRIght+5)+65+2+228+10;$_l_RectBottom;*)
			//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
			//$MaxSIze:=(($_l_RectBottom-$_l_FiltersBoxTop)-((10*3)+32+28))/4
			//$_l_AlignLeft:=$_l_FiltersBoxLeft+2
			//$_l_LastTop:=$_l_FiltersBoxTop+20
			
			//open closed both
			//contract type
			//problem type
			//solution type
			//call handler
		: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			
			//OBJECT MOVE(*;"oFiltersBox";($_l_InputNavigationRIght+5);$_l_NavigationTop+8;($_l_InputNavigationRIght+5)+65+2+228+10;$_l_RectBottom;*)
			//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
			//$MaxSIze:=(($_l_RectBottom-$_l_FiltersBoxTop)-((10*3)+96+32+28))/4
			//$_l_AlignLeft:=$_l_FiltersBoxLeft+2
			//$_l_LastTop:=$_l_FiltersBoxTop+28
			If (Not:C34(LAY_bo_MoveTypesSetup))
				DB_SetOutFilterMoveTypes(->[STOCK_MOVEMENT_ITEMS:27])
				
			End if 
			If (Size of array:C274(DB_at_MoveTypeNames)>1)
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_MoveTypeNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_MoveTypeNames))
				$_bo_DisplayMovementTypes:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Movement Types")
			End if 
			//Movement type
			
			$_l_StockTypeWidth:=DB_SetOutFilterStockTypes(->[STOCK_MOVEMENT_ITEMS:27])
			
			
			
			If (Size of array:C274(DB_at_StockTypesNames)>1)
				If ($_l_StockTypeWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_StockTypeWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_StockTypesNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_StockTypesNames))
				
				$_bo_DisplayStockTypes:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Stock Types")
			End if 
			//stock type(add to)
			//analysis
			//layers
			//currency
			If (Records in table:C83([ANALYSES:36])>0)
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[STOCK_MOVEMENT_ITEMS:27])
				If (Size of array:C274(ANAL_at_analcode)>1)
					If ($_l_analysesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_analysesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(ANAL_at_analcode)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(ANAL_at_analcode))
					
					$_bo_DisplayAnalysis:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Analysis")
				End if 
			Else 
				ARRAY TEXT:C222(ANAL_at_analcode; 0)
				ARRAY TEXT:C222(ANAL_at_AnalName; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
			End if 
			If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[STOCK_MOVEMENTS:40])
				
				If (Size of array:C274(LAY_at_layName)>1)
					If ($_l_LayersWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_LayersWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_layName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_layName))
					
					$_bo_DisplayLayers:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Layers")
				End if 
			Else 
				ARRAY TEXT:C222(LAY_at_laycode; 0)
				ARRAY TEXT:C222(LAY_at_layName; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
			End if 
			If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
				
				$_l_CurrenciesWidth:=DB_SetoutFilterCurrencies(->[STOCK_MOVEMENT_ITEMS:27])
				If (Size of array:C274(CUR_At_CurName)>1)
					If ($_l_CurrenciesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_CurrenciesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(CUR_At_CurName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(CUR_At_CurName))
					
					$_bo_DisplayCurrencies:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "CUrrencies")
				End if 
			Else 
				ARRAY TEXT:C222(CUR_at_curcode; 0)
				ARRAY TEXT:C222(CUR_at_CurName; 0)
				ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
				ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
			End if 
			
			//periods
			
			
			
			
			If (Not:C34(LAY_bo_STKIPeriodsSetup))
				DB_SetOutFilterPeriods(->[STOCK_MOVEMENTS:40])
				
			End if 
			//TRACE
			//test this-the
			
			$_bo_DisplayPeriods:=True:C214
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Periods")
			
			$_bo_DisplayFilters:=True:C214
			$_l_RadioButtonsToDisplay:=$_l_RadioButtonsToDisplay+2  //note this is one because its one line
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "OSIFilter Zeros")
			//APPEND TO ARRAY($_at_ObjectsToDisplay;"Filter Zeros")
			
			//$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			//$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			
			//Purchase order
			//Sales order
			//Serial numberedf
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_LEVELS:58]))
			//OBJECT MOVE(*;"oFiltersBox";($_l_InputNavigationRIght+5);$_l_NavigationTop+8;($_l_InputNavigationRIght+5)+65+2+228+10;$_l_RectBottom;*)
			//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
			//$MaxSIze:=(($_l_RectBottom-$_l_FiltersBoxTop)-((10*4)+32+28))/5
			//$_l_AlignLeft:=$_l_FiltersBoxLeft+2
			//$_l_LastTop:=$_l_FiltersBoxTop+28
			//type
			
			$_l_StockTypeWidth:=DB_SetOutFilterStockTypes(->[STOCK_LEVELS:58])
			
			If (Size of array:C274(DB_at_StockTypesNames)>1)
				If ($_l_StockTypeWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_StockTypeWidth
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_StockTypesNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_StockTypesNames))
				
				$_bo_DisplayStockTypes:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Stock Types")
			End if 
			If (Records in table:C83([ANALYSES:36])>0)
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[STOCK_LEVELS:58])
				If (Size of array:C274(ANAL_at_analcode)>1)
					If ($_l_analysesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_analysesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(ANAL_at_analcode)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(ANAL_at_analcode))
					
					$_bo_DisplayAnalysis:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Analysis")
				End if 
			Else 
				ARRAY TEXT:C222(ANAL_at_analcode; 0)
				ARRAY TEXT:C222(ANAL_at_AnalName; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
			End if 
			If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[STOCK_LEVELS:58])
				
				If (Size of array:C274(LAY_at_layName)>1)
					If ($_l_LayersWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_LayersWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_layName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_layName))
					
					$_bo_DisplayLayers:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Layers")
				End if 
				
				ARRAY TEXT:C222(LAY_at_laycode; 0)
				ARRAY TEXT:C222(LAY_at_layName; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
			End if 
			If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
				
				$_l_CurrenciesWidth:=DB_SetoutFilterCurrencies(->[STOCK_LEVELS:58])
				
				If (Size of array:C274(CUR_At_CurName)>1)
					If ($_l_CurrenciesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_CurrenciesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(CUR_At_CurName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(CUR_At_CurName))
					
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Currencies")
				End if 
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
			//OBJECT MOVE(*;"oFiltersBox";($_l_InputNavigationRIght+5);$_l_NavigationTop+8;($_l_InputNavigationRIght+5)+65+2+228+10;$_l_RectBottom;*)
			//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
			//$MaxSIze:=(($_l_RectBottom-$_l_FiltersBoxTop)-((10*4)+32+28))/5
			//OBJECT SET VISIBLE(*;"oAccDate@";True)
			//$_l_AlignLeft:=$_l_FiltersBoxLeft+2
			//$_l_LastTop:=$_l_FiltersBoxTop+20
			
			//type
			
			$_l_MovementTypeWidths:=DB_SetOutFilterMoveTypes(->[STOCK_MOVEMENTS:40])
			
			If (Size of array:C274(DB_at_MoveTypeNames)>1)
				If ($_l_MovementTypeWidths>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_MovementTypeWidths
				End if 
				$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
				$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(DB_at_MoveTypeNames)*20)+20
				APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(DB_at_MoveTypeNames))
				
				$_bo_DisplayMovementTypes:=True:C214
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Movement Types")
			End if 
			If (Records in table:C83([ANALYSES:36])>0)
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[STOCK_MOVEMENTS:40])
				If (Size of array:C274(ANAL_at_analcode)>1)
					If ($_l_analysesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_analysesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(ANAL_at_analcode)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(ANAL_at_analcode))
					
					$_bo_DisplayAnalysis:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Analysis")
				End if 
			Else 
				ARRAY TEXT:C222(ANAL_at_analcode; 0)
				ARRAY TEXT:C222(ANAL_at_AnalName; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
			End if 
			If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[STOCK_MOVEMENTS:40])
				
				If (Size of array:C274(LAY_at_layName)>1)
					If ($_l_LayersWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_LayersWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_layName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_layName))
					
					$_bo_DisplayLayers:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Layers")
				End if 
			Else 
				ARRAY TEXT:C222(LAY_at_laycode; 0)
				ARRAY TEXT:C222(LAY_at_layName; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
			End if 
			If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
				
				$_l_CurrenciesWidth:=DB_SetoutFilterCurrencies(->[STOCK_MOVEMENTS:40])
				If (Size of array:C274(CUR_At_CurName)>1)
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(CUR_At_CurName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(CUR_At_CurName))
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Currencies")  //
					
					//CUR_at_CurName;->CUR_at_curcode;->CUR_abo_Include;->CUR_abo_Exclude
					
					//LB_SetColumnWidths (->CUR_lb_CurCodes;"L_S55";1;60;40;35;35)
					// //dbtabText:=""
					
					
					
					//OBJECT GET BEST SIZE(dbtabText;$_l_BestWidth;$_l_BestHeight)
					If ($_l_CurrenciesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_CurrenciesWidth
					End if 
				End if 
				
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
			
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Periods")
			
			
			If (Not:C34(LAY_bo_STKIPeriodsSetup))
				DB_SetOutFilterPeriods(->[STOCK_MOVEMENTS:40])
			End if 
			$_bo_DisplayPeriods:=True:C214
			
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCHES:30]))
			//OBJECT MOVE(*;"oFiltersBox";($_l_InputNavigationRIght+5);$_l_NavigationTop+8;($_l_InputNavigationRIght+5)+65+2+228+10;$_l_RectBottom;*)
			//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
			//$MaxSIze:=(($_l_RectBottom-$_l_FiltersBoxTop)-((10*3)+64+28))/4
			//$_l_AlignLeft:=$_l_FiltersBoxLeft+2
			//$_l_LastTop:=$_l_FiltersBoxTop+20
			
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Periods")
			
			
			If (Not:C34(LAY_bo_PeriodsSetup))
				DB_SetOutFilterPeriods(->[ACCOUNT_BALANCES:34])
			End if 
			$_bo_DisplayPeriods:=True:C214
			
			//$_l_LastTop:=$_l_LastTop+18+10
			If (Records in table:C83([ANALYSES:36])>0)
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[TRANSACTION_BATCHES:30])
				If (Size of array:C274(ANAL_at_analcode)>1)
					If ($_l_analysesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_analysesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(ANAL_at_analcode)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(ANAL_at_analcode))
					
					$_bo_DisplayAnalysis:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Analysis")
				End if 
			Else 
				ARRAY TEXT:C222(ANAL_at_analcode; 0)
				ARRAY TEXT:C222(ANAL_at_AnalName; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
			End if 
			If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[TRANSACTION_BATCHES:30])
				
				If (Size of array:C274(LAY_at_layName)>1)
					If ($_l_LayersWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_LayersWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_layName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_layName))
					
					$_bo_DisplayLayers:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Layers")
				End if 
			Else 
				ARRAY TEXT:C222(LAY_at_laycode; 0)
				ARRAY TEXT:C222(LAY_at_layName; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
			End if 
			If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
				
				$_l_CurrenciesWidth:=DB_SetoutFilterCurrencies(->[TRANSACTION_BATCHES:30])
				If (Size of array:C274(CUR_At_CurName)>1)
					If ($_l_CurrenciesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_CurrenciesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(CUR_At_CurName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(CUR_At_CurName))
					
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Currencies")
				End if 
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
			End if 
			$_bo_DisplayPeriods:=True:C214
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			$_l_DropDownsToDisplay:=$_l_DropDownsToDisplay+1
			APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Periods")
			
			//$_l_LastTop:=$_l_LastTop+18+10
			
			
			If (Records in table:C83([ANALYSES:36])>0)
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[TRANSACTIONS:29])
				If (Size of array:C274(ANAL_at_analcode)>1)
					If ($_l_analysesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_analysesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(ANAL_at_analcode)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(ANAL_at_analcode))
					
					$_bo_DisplayAnalysis:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Analysis")
				End if 
			Else 
				ARRAY TEXT:C222(ANAL_at_analcode; 0)
				ARRAY TEXT:C222(ANAL_at_AnalName; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
				ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				
			End if 
			If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[TRANSACTIONS:29])
				If (Size of array:C274(LAY_at_layName)>1)
					If ($_l_LayersWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_LayersWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(LAY_at_layName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(LAY_at_layName))
					
					$_bo_DisplayLayers:=True:C214
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Layers")
				End if 
			Else 
				ARRAY TEXT:C222(LAY_at_laycode; 0)
				ARRAY TEXT:C222(LAY_at_layName; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
				ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
			End if 
			If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
				
				$_l_CurrenciesWidth:=DB_SetoutFilterCurrencies(->[TRANSACTIONS:29])
				If (Size of array:C274(CUR_At_CurName)>1)
					If ($_l_CurrenciesWidth>$_l_MaxLBWidth)
						$_l_MaxLBWidth:=$_l_CurrenciesWidth
					End if 
					$_l_ListboxesToDisplay:=$_l_ListboxesToDisplay+1
					$_l_LisboxSize:=$_l_LisboxSize+(Size of array:C274(CUR_At_CurName)*20)+20
					APPEND TO ARRAY:C911($_al_LBSizes; Size of array:C274(CUR_At_CurName))
					
					APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Currencies")
				End if 
			Else 
				ARRAY TEXT:C222(CUR_at_curcode; 0)
				ARRAY TEXT:C222(CUR_at_CurName; 0)
				ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
				ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
			End if 
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[WORKFLOW_CONTROL:51]))
			
	End case 
	//$_l_MaxLBWidth
	//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
	
	$_l_LastTop:=45
	OBJECT MOVE:C664(*; "oFiltersBox"; ($_l_InputNavigationRIght+5); $_l_NavigationTop+8; ($_l_InputNavigationRIght+5)+65+2+228+10; $_l_RectBottom; *)
	OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
	$_l_FIlterBoxSize:=$_l_FiltersBoxBottom-$_l_FiltersBoxTop
	$_l_ScrollBoxLeft:=$_l_FiltersBoxRight-6-$_l_MaxLBWidth  //+72
	$_l_AlignLeft:=$_l_FiltersBoxLeft+6
	$_l_SIzeForListNotBoxes:=$_l_LastTop+(((($_l_DropDownsToDisplay*(18+5)+($_l_RadioButtonsToDisplay*(18+5))))+$_l_DropDownsToDisplay+$_l_RadioButtonsToDisplay))
	
	$_l_SizeForListboxes:=$_l_FIlterBoxSize-(($_l_SIzeForListNotBoxes)+((20*$_l_ListboxesToDisplay)+(5*$_l_ListboxesToDisplay)))
	
	
	//this is the size for the rows of the listboxes(above we have counted 18 per header and 5 for spaces between the boxes
	$_l_NumberofRowsAvailable:=$_l_SizeForListboxes/18  //this is the number of rows of listboxes we can display
	
	ARRAY LONGINT:C221($_al_ListBoxSize; 0)
	ARRAY LONGINT:C221($_al_ListBoxSize; Size of array:C274($_al_LBSizes))  //$_al_LBSizes is the number of rows $_al_ListBoxSize is going to be the calculated size
	ARRAY REAL:C219($_ar_ListBoxPercent; 0)
	ARRAY REAL:C219($_ar_ListBoxPercent; Size of array:C274($_al_LBSizes))  //$_al_LBSizes is the number of rows $_al_ListBoxSize is going to be the calculated size
	
	$_l_MaxSpacePerListbox:=$_l_SizeForListboxes/$_l_ListboxesToDisplay
	$_l_SpaceBetween:=($_l_ListboxesToDisplay-1)*10
	//TRACE
	$_l_sizesSet:=0
	$_l_SMallestSize:=1
	//Repeat 
	$_l_CalcsizeFrom:=$_l_FIlterBoxSize-$_l_SIzeForListNotBoxes
	$_l_TotalRows:=0
	For ($_l_CalcSize; 1; Size of array:C274($_al_LBSizes))
		$_l_TotalRows:=$_l_TotalRows+$_al_LBSizes{$_l_CalcSize}
	End for 
	$_l_Repeats:=0
	Repeat 
		$_l_Repeats:=$_l_Repeats+1
		$_r_MinRange:=100
		$_r_MaxRange:=0
		For ($_l_CalcSize; 1; Size of array:C274($_al_LBSizes))
			If ($_l_Repeats=1)
				$_ar_ListBoxPercent{$_l_CalcSize}:=($_al_LBSizes{$_l_CalcSize}/$_l_TotalRows)*100  //this is the percentage of the available area the will be allocated to this list box!
			End if 
			If ($_r_MinRange>$_ar_ListBoxPercent{$_l_CalcSize})
				$_r_MinRange:=$_ar_ListBoxPercent{$_l_CalcSize}
			End if 
			If ($_r_MaxRange<$_ar_ListBoxPercent{$_l_CalcSize})
				$_r_MaxRange:=$_ar_ListBoxPercent{$_l_CalcSize}
			End if 
		End for 
		$_bo_NoChange:=True:C214
		$_r_Subtract:=0
		If (($_r_MaxRange/$_r_MinRange)>3)
			$_R_average:=Average:C2($_ar_ListBoxPercent)
			//($_r_MaxRange/$_r_MinRange)/Size of array($_al_LBSizes)
			For ($_l_CalcSize; 1; Size of array:C274($_al_LBSizes))
				If ($_ar_ListBoxPercent{$_l_CalcSize}<$_R_average)
					//we can make it bigger but do we want to
					$_l_MaxSizeAllocated:=($_al_LBSizes{$_l_CalcSize}*18)
					$_l_SizethisLB:=(($_l_CalcsizeFrom/100)*$_ar_ListBoxPercent{$_l_CalcSize})
					If ($_l_SizethisLB<$_l_MaxSizeAllocated)  //increase the percentage
						$_ar_ListBoxPercent{$_l_CalcSize}:=$_ar_ListBoxPercent{$_l_CalcSize}+1
						$_r_Subtract:=$_r_Subtract+1
						$_bo_NoChange:=False:C215
					End if 
				End if 
				If ($_ar_ListBoxPercent{$_l_CalcSize}>$_R_average)
					$_ar_ListBoxPercent{$_l_CalcSize}:=$_ar_ListBoxPercent{$_l_CalcSize}-1
				End if 
			End for 
		End if 
	Until (($_r_MaxRange/$_r_MinRange)<=3) | ($_bo_NoChange)
	$_l_Total:=Sum:C1($_ar_ListBoxPercent)
	$_l_Repeats:=0
	If ($_l_Total>100)
		//TRACE
		
		Repeat 
			$_l_Maximum:=Max:C3($_ar_ListBoxPercent)
			For ($_l_Reduce; 1; Size of array:C274($_ar_ListBoxPercent))
				If ($_ar_ListBoxPercent{$_l_Reduce}>($_l_Maximum-2))
					$_ar_ListBoxPercent{$_l_Reduce}:=$_ar_ListBoxPercent{$_l_Reduce}-1
				End if 
			End for 
			$_l_Total:=Sum:C1($_ar_ListBoxPercent)
			$_l_Repeats:=$_l_Repeats+1
		Until ($_l_Total<=100) | ($_l_Repeats>100)
		
	End if 
	//the idea is that we should balance the sizes around an average so bigger ones become smaller and smaller ones get bigger-but only to the size big enough to show all rows
	
	
	
	
	For ($_l_CalcSize; 1; Size of array:C274($_al_LBSizes))
		$_r_PercentageThisLB:=$_ar_ListBoxPercent{$_l_CalcSize}  //($_al_LBSizes{$_l_CalcSize}/$_l_TotalRows)*100  //this is the percentage of the available area the will be allocated to this list box!
		$_l_SizethisLB:=($_l_CalcsizeFrom/100)*$_r_PercentageThisLB
		$_l_SizethisLB:=$_l_SizethisLB+18
		$_al_ListBoxSize{$_l_CalcSize}:=$_l_SizethisLB
	End for 
	$_l_TotalSize:=Sum:C1($_al_ListBoxSize)
	If ($_l_TotalSize>($_l_CalcsizeFrom-(5*Size of array:C274($_al_LBSizes))))
		//the area is too big still
		Repeat 
			
			$_l_Maximum:=Max:C3($_al_ListBoxSize)
			For ($_l_Reduce; 1; Size of array:C274($_ar_ListBoxPercent))
				If ($_al_ListBoxSize{$_l_Reduce}>($_l_Maximum-2))
					$_al_ListBoxSize{$_l_Reduce}:=$_al_ListBoxSize{$_l_Reduce}-1
				End if 
			End for 
			$_l_TotalSize:=Sum:C1($_al_ListBoxSize)
		Until ($_l_TotalSize<=($_l_CalcsizeFrom-(5*Size of array:C274($_al_LBSizes))))
	End if 
	
	Case of 
		: ($_l_LisboxSize>($_l_SizeForListboxes+$_l_SpaceBetween))
			$_l_Percentage:=($_l_SizeForListboxes/$_l_LisboxSize)*100
		: ($_l_LisboxSize<($_l_SizeForListboxes+$_l_SpaceBetween))
			$_l_Percentage:=($_l_SizeForListboxes/$_l_LisboxSize)*100
			
	End case 
	//$SizeForListbox:=($_l_SizeForListboxes-(28+$_l_SpaceBetween))/$_l_ListboxesToDisplay
	
	$_l_SizePerListbox:=($_l_SizeForListboxes-(28+$_l_SpaceBetween))/$_l_ListboxesToDisplay
	
	//$_l_LisboxSize:=$_l_LisboxSize+(Size of array(CUR_At_CurName)*20)+20
	$_l_RemainingLBS:=$_l_ListboxesToDisplay
	$_l_RemainingDropDowns:=$_l_DropDownsToDisplay
	$_l_RemaingingRB:=$_l_RadioButtonsToDisplay
	$_l_SizeForListboxes:=$_l_FIlterBoxSize-(($_l_DropDownsToDisplay*(18+5)+($_l_RadioButtonsToDisplay*(18+5))))
	
	//``
	
	
	//````
	
	
	For ($_l_Index; 1; Size of array:C274($_at_ObjectsToDisplay))
		Case of 
			: ($_at_ObjectsToDisplay{$_l_Index}="Stock Types")
				
				If (Size of array:C274(DB_at_StockTypesNames)>1)
					
					
					OBJECT SET VISIBLE:C603(*; "oStockTypes@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oStockTypes"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oStockTypes"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oStockTypes"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
					
					
				End if 
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Status")
				
				If (Size of array:C274(DB_at_StatusNames)>1)
					
					OBJECT SET VISIBLE:C603(*; "oStatus@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oStatus"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oStatus"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oStatus"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
					
				End if 
			: ($_at_ObjectsToDisplay{$_l_Index}="Sources")
				
				If ($_bo_DisplayOrderSources) | ($_bo_DisplaySources)
					
					
					OBJECT SET VISIBLE:C603(*; "oSources@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oSources"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oSources"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oSources"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
					
				End if 
			: ($_at_ObjectsToDisplay{$_l_Index}="Sales Person")
				If ($_bo_DisplaySalesPersons)
					
					OBJECT SET VISIBLE:C603(*; "oSalesPerson@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oSalesPerson"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oSalesPerson"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_FiltersBoxTop+$_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oSalesPerson"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_FiltersBoxTop+$_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
				End if 
			: ($_at_ObjectsToDisplay{$_l_Index}="Roles")
				
				If (Size of array:C274(DB_at_RoleNames)>1)
					
					OBJECT SET VISIBLE:C603(*; "oRoles@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oRoles"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oRoles"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oRoles"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
					
				End if 
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Record States")
				If ($_bo_DisplayStates) & ($_bo_ShowStates)
					
					OBJECT SET VISIBLE:C603(*; "oStates@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oStates"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oStates"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oStates"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
					End if 
					
					
					
				End if 
			: ($_at_ObjectsToDisplay{$_l_Index}="ProfitBalance")
				OBJECT SET VISIBLE:C603(*; "oAccProfBal@"; True:C214)
				OBJECT GET BEST SIZE:C717(*; "oAccProfBalLabel"; $_l_BestWidth; $_l_BestHeight)
				
				OBJECT MOVE:C664(*; "oAccProfBalLabel"; $_l_AlignLeft; $_l_LastTop; $_l_AlignLeft+$_l_BestWidth; $_l_LastTop+14; *)
				OBJECT MOVE:C664(*; "oAccProfBalCB1"; $_l_AlignLeft+$_l_BestWidth+2; $_l_LastTop; $_l_AlignLeft+$_l_BestWidth+2+47; $_l_LastTop+14; *)
				OBJECT MOVE:C664(*; "oAccProfBalCB2"; $_l_AlignLeft+$_l_BestWidth+49+2; $_l_LastTop; $_l_AlignLeft+$_l_BestWidth+2+49+89; $_l_LastTop+14; *)
				OBJECT MOVE:C664(*; "oAccProfBalCB3"; $_l_AlignLeft+$_l_BestWidth+2+49+91; $_l_LastTop; $_l_AlignLeft+$_l_BestWidth+2+49+91+91; $_l_LastTop+14; *)
				$_l_LastTop:=($_l_LastTop+14)+10
				OBJECT GET COORDINATES:C663(*; "oAccProfBalCB3"; $_l_oLeft; $_l_oTop; $_l_oRight; $_l_oBottom)
				$_l_LastTop:=(($_l_oBottom+1)+5)-$_l_FiltersBoxTop
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Product Groups")
				
				If (Size of array:C274(DB_at_GroupNames)>1)
					OBJECT SET VISIBLE:C603(*; "oGroup@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oGroup"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oGroup"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oGroup"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
				End if 
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Periods")
				ARRAY TEXT:C222(ACC_at_ContextualPeriodF; 0)
				ARRAY LONGINT:C221(ACC_al_ContextualPeriodF; 0)
				ARRAY TEXT:C222(ACC_at_ContextualPeriodT; 0)
				ARRAY LONGINT:C221(ACC_al_ContextualPeriodT; 0)
				SRCH_SetupContextualPeriods(->ACC_at_ContextualPeriodF; ->ACC_al_ContextualPeriodF)
				SRCH_SetupContextualPeriods(->ACC_at_ContextualPeriodT; ->ACC_al_ContextualPeriodT)
				//SORT ARRAY(ACC_at_ContextualPeriodF;ACC_al_ContextualPeriodF;<)
				$_l_RemainingDropDowns:=$_l_RemainingDropDowns-1
				
				$_l_AlignLeft:=$_l_FiltersBoxLeft+6
				OBJECT SET VISIBLE:C603(*; "oAccDateFromBox"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oAccDateFromContextualPeriods"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oAccDateToBox"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oAccDateToContextualPeriods"; True:C214)
				
				OBJECT SET VISIBLE:C603(*; "oAccDateFromLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oAccDateFrom"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oAccDateToLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oAccDateTo"; True:C214)
				$_l_LastTop:=DB_SetFilterObject($_l_LastTop; 18; "oAccDateFrom"; $_l_MaxLBWidth; ->$_l_LabelWidth)+5
				OBJECT GET COORDINATES:C663(*; "oAccDateFrom"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oAccDateFrom"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight-21; $_l_ObjectBottom; *)
				$_l_ObjectRight:=$_l_ObjectRight-19
				//OBJECT MOVE(*;"oAccDateFromBox";$_l_ObjectRight;$_l_ObjectTop;$_l_ObjectRight+21;$_l_ObjectBottom;*)
				OBJECT MOVE:C664(*; "oAccDateFromContextualPeriods"; $_l_ObjectRight; $_l_ObjectTop+1; $_l_ObjectRight+18; $_l_ObjectBottom+1; *)
				$_l_LastTop:=(($_l_ObjectBottom+1)+5)-$_l_FiltersBoxTop
				$_l_LastTop:=DB_SetFilterObject($_l_LastTop; 18; "oAccDateTo"; $_l_MaxLBWidth; ->$_l_LabelWidth)+5
				OBJECT GET COORDINATES:C663(*; "oAccDateTo"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oAccDateTo"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight-21; $_l_ObjectBottom; *)
				$_l_ObjectRight:=$_l_ObjectRight-19
				//OBJECT MOVE(*;"oAccDateToBox";$_l_ObjectRight;$_l_ObjectTop;$_l_ObjectRight+20;$_l_ObjectBottom;*)
				OBJECT MOVE:C664(*; "oAccDateToContextualPeriods"; $_l_ObjectRight; $_l_ObjectTop+1; $_l_ObjectRight+18; $_l_ObjectBottom+1; *)
				$_l_LastTop:=(($_l_ObjectBottom+1)+5)-$_l_FiltersBoxTop
				$_l_RemainingDropDowns:=$_l_RemainingDropDowns-1
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Order Types")
				If ($_bo_DisplayOrderTypes)
					
					OBJECT SET VISIBLE:C603(*; "oType@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oType"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oType"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oType"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
				End if 
			: ($_at_ObjectsToDisplay{$_l_Index}="Movement Types")
				
				If (Size of array:C274(DB_at_MoveTypeNames)>1)
					OBJECT SET VISIBLE:C603(*; "oMoves@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oMoves"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oMoves"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oMoves"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
					
				End if 
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Locations")
				
				If (Size of array:C274(DB_at_StockLocNames)>1)
					OBJECT SET VISIBLE:C603(*; "oStockLocs@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oStockLocs"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oStockLocs"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oStockLocs"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
					
				End if 
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Layers")
				If (Size of array:C274(LAY_at_layName)>1)
					OBJECT SET VISIBLE:C603(*; "oAccLayers@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oAccLayers"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oAccLayers"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oAccLayers"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
				End if 
			: ($_at_ObjectsToDisplay{$_l_Index}="Headings")
				
				If (Size of array:C274(DB_at_HeadingNames)>1)
					OBJECT SET VISIBLE:C603(*; "oHeading@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oHeading"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oHeading"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oHeading"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
				End if 
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Currencies")
				If (Size of array:C274(CUR_At_CurName)>1)
					OBJECT SET VISIBLE:C603(*; "oAccCur@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oAccCur"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oAccCur"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oAccCur"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
				End if 
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Credit Stages")
				If (Size of array:C274(DB_at_CredStgNames)>0) & ($_bo_ShowCreditStage)
					
					OBJECT SET VISIBLE:C603(*; "ocredStage@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "ocredStage"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "ocredStage"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "ocredStage"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
					
					
				End if 
			: ($_at_ObjectsToDisplay{$_l_Index}="Countries")
				
				If (Size of array:C274(DB_at_CountryNames)>1)
					
					OBJECT SET VISIBLE:C603(*; "oCountry@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oCountry"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oCountry"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oCountry"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
				End if 
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Counties")
				
				If (Size of array:C274(DB_at_CountyNames)>1)
					
					
					OBJECT SET VISIBLE:C603(*; "oCounty@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oCounty"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oCounty"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oCounty"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
				End if 
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Contract Types")
				
				If (Size of array:C274(LAY_abo_ContrTypeExclude)>1)
					
					OBJECT SET VISIBLE:C603(*; "oContrTypes@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oContrTypes"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oContrTypes"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oContrTypes"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
				End if 
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="CompanyTypes")
				
				If (Size of array:C274(DB_at_TypesNames)>1)
					
					
					
					OBJECT SET VISIBLE:C603(*; "oType@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oType"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oType"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oType"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
					
					
				End if 
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Collections")
				
				
				If (Size of array:C274(DB_at_CollectionNames)>1)
					
					OBJECT SET VISIBLE:C603(*; "oCollection@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oCollection"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oCollection"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oCollection"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
					
				End if 
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Co Types")
				
				If (Size of array:C274(DB_at_TypesNames)>1)
					
					OBJECT SET VISIBLE:C603(*; "oType@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oType"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oType"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oType"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
				End if 
				
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Brands")
				
				If (Size of array:C274(DB_at_BrandNames)>1)
					OBJECT SET VISIBLE:C603(*; "oBrand@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oBrand"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oBrand"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oBrand"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
					
				End if 
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Areas")
				If ($_bo_DisplayOrderAreas) | ($_bo_DisplayAreas)
					
					
					OBJECT SET VISIBLE:C603(*; "oAreas@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oAreas"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oAreas"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oAreas"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
					End if 
				End if 
			: ($_at_ObjectsToDisplay{$_l_Index}="Analysis")
				If (Size of array:C274(ANAL_at_AnalName)>1)
					OBJECT SET VISIBLE:C603(*; "oAccAnal@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_Size:=$_al_ListBoxSize{$_l_Element}  //Size of array(ANAL_at_AnalName)+1
					$_l_oldNextTop:=$_l_LastTop
					$_l_LastTop:=DB_SetFilterObject($_l_LastTop; $_al_ListBoxSize{$_l_Element}-5; "oAccAnal"; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					OBJECT GET COORDINATES:C663(*; "oAccAnal"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; "oAccAnal"; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; ($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_LastTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
						
					End if 
				End if 
			: ($_at_ObjectsToDisplay{$_l_Index}="Profit CheckBoxes")
				OBJECT SET VISIBLE:C603(*; "oAccProfBal@"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
				
				$_l_ScrollBoxLeft:=($_l_FiltersBoxRight-6)-$_l_MaxLBWidth  //+72
				$_l_AlignLeft:=$_l_FiltersBoxLeft+2
				$_l_Offset:=$_l_LastTop
				
				OBJECT GET BEST SIZE:C717(*; "oAccProfBalLabel"; $_l_BestWidth; $_l_BestHeight)
				
				OBJECT MOVE:C664(*; "oAccProfBalLabel"; $_l_AlignLeft; $_l_LastTop+$_l_FiltersBoxTop; $_l_AlignLeft+$_l_BestWidth; $_l_LastTop+14+$_l_FiltersBoxTop; *)
				OBJECT MOVE:C664(*; "oAccProfBalCB1"; $_l_AlignLeft+$_l_BestWidth+2; $_l_LastTop+$_l_FiltersBoxTop; $_l_AlignLeft+$_l_BestWidth+2+47; $_l_LastTop+14+$_l_FiltersBoxTop; *)
				OBJECT MOVE:C664(*; "oAccProfBalCB2"; $_l_AlignLeft+$_l_BestWidth+49+2; $_l_LastTop+$_l_FiltersBoxTop; $_l_AlignLeft+$_l_BestWidth+2+49+89; $_l_LastTop+14+$_l_FiltersBoxTop; *)
				OBJECT MOVE:C664(*; "oAccProfBalCB3"; $_l_AlignLeft+$_l_BestWidth+2+49+91; $_l_LastTop+$_l_FiltersBoxTop; $_l_AlignLeft+$_l_BestWidth+2+49+91+91; $_l_LastTop+14+$_l_FiltersBoxTop; *)
				$_l_LastTop:=$_l_LastTop+14+5
				
			: ($_at_ObjectsToDisplay{$_l_Index}="Invoice Paid")
				
				OBJECT SET VISIBLE:C603(*; "oInvoicePaid@"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
				
				$_l_ScrollBoxLeft:=($_l_FiltersBoxRight-6)-$_l_MaxLBWidth  //+72
				$_l_AlignLeft:=$_l_FiltersBoxLeft+2
				$_l_Offset:=$_l_LastTop
				OBJECT GET BEST SIZE:C717(*; "oInvoicePaidLabel"; $_l_BestWidth; $_l_BestHeight)
				
				OBJECT MOVE:C664(*; "oInvoicePaidLabel"; $_l_AlignLeft; $_l_LastTop+$_l_FiltersBoxTop; $_l_AlignLeft+$_l_BestWidth; $_l_LastTop+$_l_FiltersBoxTop+14; *)
				OBJECT MOVE:C664(*; "oInvoicePaidCB1"; $_l_AlignLeft+$_l_BestWidth+2; $_l_LastTop+$_l_FiltersBoxTop; $_l_AlignLeft+$_l_BestWidth2+47; $_l_LastTop+$_l_FiltersBoxTop+14; *)
				OBJECT MOVE:C664(*; "oInvoicePaidCB2"; $_l_AlignLeft+$_l_BestWidth+49+2; $_l_LastTop+$_l_FiltersBoxTop; $_l_FiltersBoxRight-5; $_l_LastTop+$_l_FiltersBoxTop+14; *)
				$_l_LastTop:=$_l_LastTop+14+5
				OBJECT MOVE:C664(*; "oInvoicePaidCB3"; $_l_AlignLeft+$_l_BestWidth+2+49; $_l_LastTop+$_l_FiltersBoxTop; $_l_FiltersBoxRight-5; $_l_LastTop+$_l_FiltersBoxTop+14; *)
				$_l_LastTop:=$_l_LastTop+14+5
			: ($_at_ObjectsToDisplay{$_l_Index}="Filter Zeros")
				OBJECT SET VISIBLE:C603(*; "OcsFilterZeros@"; True:C214)
				OBJECT GET BEST SIZE:C717(*; "OcsFilterZeros"; $_l_BestWidth; $_l_BestHeight)
				OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
				$_l_ScrollBoxLeft:=($_l_FiltersBoxRight-6)-$_l_MaxLBWidth  //+72
				$_l_AlignLeft:=$_l_FiltersBoxLeft+2
				$_l_Offset:=$_l_LastTop
				OBJECT MOVE:C664(*; "OcsFilterZeros"; $_l_ScrollBoxLeft; $_l_LastTop+$_l_FiltersBoxTop; $_l_ScrollBoxLeft+$_l_BestWidth; $_l_FiltersBoxTop+$_l_LastTop+$_l_BestHeight; *)
				$_l_LastTop:=$_l_LastTop+$_l_BestHeight+5
				
				
			: ($_at_ObjectsToDisplay{$_l_Index}="OSIFilter Zeros")
				OBJECT GET BEST SIZE:C717(*; "OSIFilterZeros"; $_l_BestWidth; $_l_BestHeight)
				OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
				//$_l_LastTop:=$_l_LastTop-25
				$_l_ScrollBoxLeft:=($_l_FiltersBoxRight-6)-$_l_MaxLBWidth  //+72
				$_l_AlignLeft:=$_l_FiltersBoxLeft+2
				$_l_Offset:=$_l_LastTop
				
				OBJECT SET VISIBLE:C603(*; "OSIFilterZeros@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "OSIFilterAllocated@"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
				
				OBJECT MOVE:C664(*; "OSiFilterZeros"; $_l_ScrollBoxLeft; $_l_LastTop+$_l_FiltersBoxTop; $_l_ScrollBoxLeft+$_l_BestWidth; $_l_FiltersBoxTop+$_l_LastTop+$_l_BestHeight; *)
				$_l_LastTop:=$_l_LastTop+$_l_BestHeight+5
				OBJECT GET BEST SIZE:C717(*; "OSIFilterAllocated"; $_l_BestWidth; $_l_BestHeight)
				OBJECT MOVE:C664(*; "OSIFilterAllocated"; $_l_ScrollBoxLeft; $_l_LastTop+$_l_FiltersBoxTop; $_l_ScrollBoxLeft+$_l_BestWidth; $_l_FiltersBoxTop+$_l_LastTop+$_l_BestHeight; *)
				$_l_LastTop:=$_l_LastTop+18+5
			: ($_at_ObjectsToDisplay{$_l_Index}="Contract States")
				
				OBJECT SET VISIBLE:C603(*; "oContractStates@"; True:C214)
				OBJECT GET BEST SIZE:C717(*; "oContractStatesLabel"; $_l_BestWidth; $_l_BestHeight)
				If ($_l_BestWidth>$_l_LabelMaxWidth)
					$_l_LabelMaxWidth:=$_l_BestWidth
				End if 
				OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
				$_l_ScrollBoxLeft:=($_l_FiltersBoxRight-6)-$_l_MaxLBWidth  //+72
				$_l_AlignLeft:=$_l_FiltersBoxLeft+6
				$_l_Offset:=$_l_LastTop
				//OBJECT MOVE(*;"oContractStatesLabel";($_l_ScrollBoxLeft-5)-$_l_BestWidth;$_l_FiltersBoxTop+$_l_Offset;$_l_ScrollBoxLeft-5;$_l_FiltersBoxTop+$_l_Offset+14;*)
				OBJECT MOVE:C664(*; "oContractStatesLabel"; $_l_AlignLeft; $_l_LastTop; $_l_AlignLeft+$_l_BestWidth; $_l_LastTop+14; *)
				OBJECT MOVE:C664(*; "oContractStatesCB1"; $_l_AlignLeft+$_l_BestWidth+2; $_l_LastTop; $_l_AlignLeft+$_l_BestWidth+2+47; $_l_LastTop+14; *)
				$_l_LastTop:=$_l_LastTop+18+2
				OBJECT MOVE:C664(*; "oContractStatesCB2"; $_l_AlignLeft+$_l_BestWidth+49+2; $_l_LastTop; $_l_AlignLeft+$_l_BestWidth+2+49+89; $_l_LastTop+14; *)
				OBJECT MOVE:C664(*; "oContractStatesCB3"; $_l_AlignLeft+$_l_BestWidth+2+49+91; $_l_LastTop; $_l_AlignLeft+$_l_BestWidth+2+49+91+91; $_l_LastTop+14; *)
				$_l_LastTop:=$_l_LastTop+18+5
				
			: ($_at_ObjectsToDisplay{$_l_Index}="COADDRESSTYPES")
				OBJECT SET VISIBLE:C603(*; "oCoTypes@"; True:C214)
				OBJECT GET BEST SIZE:C717(*; "oCoTypesLabel"; $_l_BestWidth; $_l_BestHeight)
				OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
				$_l_ScrollBoxLeft:=($_l_FiltersBoxRight-6)-$_l_MaxLBWidth  //+72
				$_l_AlignLeft:=$_l_FiltersBoxLeft+6
				$_l_Offset:=$_l_LastTop
				//If ($_l_BestWidth<($_l_ScrollBoxLeft-$_l_AlignLeft))
				OBJECT MOVE:C664(*; "oCoTypesLabel"; ($_l_ScrollBoxLeft-5)-$_l_BestWidth; $_l_FiltersBoxTop+$_l_Offset; $_l_ScrollBoxLeft-5; $_l_FiltersBoxTop+$_l_Offset+14; *)
				$_l_LabelWidth:=(($_l_ScrollBoxLeft-5)-(($_l_ScrollBoxLeft-5)-$_l_BestWidth))
				If ($_l_LabelWidth>$_l_LabelMaxWidth)
					$_l_LabelMaxWidth:=$_l_LabelWidth
				End if 
				//OBJECT MOVE(*;"oCoTypesLabel";($_l_ScrollBoxLeft-5)-($_l_BestWidth/2);$_l_FiltersBoxTop+$_l_Offset;$_l_ScrollBoxLeft-5;$_l_FiltersBoxTop+$_l_Offset+28;*)
				//End if 
				OBJECT GET BEST SIZE:C717(*; "oCoTypesCB4"; $_l_BestWidth; $_l_BestHeight)
				$_l_BestWidth:=100
				OBJECT MOVE:C664(*; "oCoTypesCB4"; ($_l_ScrollBoxLeft); $_l_FiltersBoxTop+$_l_Offset; $_l_ScrollBoxLeft+$_l_BestWidth; $_l_FiltersBoxTop+$_l_Offset+14; *)
				$_l_NextLeft:=$_l_ScrollBoxLeft+$_l_BestWidth+5
				OBJECT GET BEST SIZE:C717(*; "oCoTypesCB5"; $_l_BestWidth; $_l_BestHeight)
				OBJECT MOVE:C664(*; "oCoTypesCB5"; $_l_NextLeft; $_l_FiltersBoxTop+$_l_Offset; $_l_NextLeft+$_l_BestWidth; $_l_FiltersBoxTop+$_l_Offset+14; *)
				$_l_NextLeft:=$_l_NextLeft+$_l_BestWidth+5
				OBJECT GET COORDINATES:C663(*; "oCoTypesCB5"; $_l_LastLeft; $_l_LastTop; $_l_LastRight; $_l_LastTop)
				$_l_LastTop:=$_l_LastTop+14+2
				$_l_Offset:=$_l_LastTop
				OBJECT GET BEST SIZE:C717(*; "oCoTypesCB6"; $_l_BestWidth; $_l_BestHeight)
				OBJECT MOVE:C664(*; "oCoTypesCB6"; ($_l_ScrollBoxLeft); $_l_FiltersBoxTop+$_l_Offset; $_l_ScrollBoxLeft+$_l_BestWidth; $_l_FiltersBoxTop+$_l_Offset+14; *)
				OBJECT GET COORDINATES:C663(*; "oCoTypesCB6"; $_l_LastLeft; $_l_LastTop; $_l_LastRight; $_l_LastTop)
				$_l_LastTop:=$_l_LastTop+14+5
		End case 
	End for 
	//here we can resize the list box group area and the other objects
	OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
	$_l_NewFiltersLeft:=$_l_FiltersBoxRight-(6+$_l_MaxLBWidth+$_l_LabelMaxWidth+5)-10
	OBJECT SET COORDINATES:C1248(*; "oFiltersBox"; $_l_NewFiltersLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
	OBJECT SET VISIBLE:C603(*; "oFilterNames"; True:C214)
	OBJECT SET COORDINATES:C1248(*; "oFilterNames"; ($_l_FiltersBoxLeft+5); $_l_FiltersBoxTop+18; $_l_FiltersBoxRight-5; $_l_FiltersBoxTop+14+18)
	// /
	OBJECT GET COORDINATES:C663(*; "oNavigator"; $_l_NavigatorLeft; $_l_NavigatorTop; $_l_NavigatorRight; $_l_NavigatorBottom)
	OBJECT SET COORDINATES:C1248(*; "oNavigator"; $_l_NavigationLeft; DB_l_RememberNavBarTop; $_l_NewFiltersLeft-5; $_l_NavigatorBottom)
	
	If (DB_bo_DisplayStats)
		//Get object
		
		
		OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
		OBJECT SET COORDINATES:C1248(*; "oListboxOutputForm"; $_l_areaLeft; DB_l_RememberListBoxTop; $_l_NewFiltersLeft-10; $_l_AreaBottom)
		
		OBJECT GET COORDINATES:C663(*; "oListboxOutputArrays"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
		OBJECT SET COORDINATES:C1248(*; "oListboxOutputArrays"; $_l_areaLeft; DB_l_RememberListBoxTop; $_l_NewFiltersLeft-10; $_l_AreaBottom)
		
		OBJECT GET COORDINATES:C663(*; "oStatsColumnBreakDown"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
		OBJECT SET COORDINATES:C1248(*; "oStatsColumnBreakDown"; $_l_areaLeft; $_l_areaTop; $_l_NewFiltersLeft-5; $_l_AreaBottom)
		
		
		
		OBJECT GET COORDINATES:C663(*; "oStatsListbox1"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
		OBJECT SET COORDINATES:C1248(*; "oStatsListbox1"; $_l_areaLeft; $_l_FiltersBoxTop+10; $_l_NewFiltersLeft-5; $_l_AreaBottom)
		OBJECT GET COORDINATES:C663(*; "oStatsListbox"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
		OBJECT SET COORDINATES:C1248(*; "oStatsListbox"; $_l_areaLeft; $_l_areaTop; $_l_NewFiltersLeft-5; $_l_AreaBottom)
		
		OBJECT GET COORDINATES:C663(*; "oStatsListbox2"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
		OBJECT SET COORDINATES:C1248(*; "oStatsListbox2"; $_l_areaLeft; $_l_areaTop; $_l_NewFiltersLeft-5; $_l_AreaBottom)
		
		
		//MOVE OBJECT(*;"oStatsColumnBreakDown";$_l_ListBoxLeft+5;$_l_ListBoxBottom+5;$_l_ListBoxLeft+5+$_l_ObjectWidth;$_l_ListBoxBottom+5+$_l_ObjectHeight;*)
	Else 
		OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
		OBJECT SET COORDINATES:C1248(*; "oListboxOutputForm"; $_l_areaLeft; $DB_l_RememberListBoxTop; $_l_NewFiltersLeft-10; $_l_AreaBottom)
		
		OBJECT GET COORDINATES:C663(*; "oListboxOutputArrays"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
		OBJECT SET COORDINATES:C1248(*; "oListboxOutputArrays"; $_l_areaLeft; DB_l_RememberListBoxTop; $_l_NewFiltersLeft-10; $_l_AreaBottom)
		
	End if 
	
	
	// /
	DB_bo_FiltersActivated:=True:C214  //this is set so we know that arrays are inited. if we change views with filters hidden the arrays for that view wont be set until we go to view filters
	
	
	If (DB_bo_DisplaySelections)
		OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
		$_l_SetManagerRight:=$_l_ListBoxLeft-5
		OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_SelectionLBLeft; $_l_SelectionLBTop; $_l_SelectionLBRight; $_l_SelectionLBBottom)
		//OBJECT SET COORDINATES(*;"oSelectionsGroupBox";3;$_l_FiltersBoxTop;$_l_SetManagerRight;$_l_RectBottom-5)
		OBJECT MOVE:C664(*; "oSelectionsListbox"; 8; $_l_FiltersBoxTop+18; $_l_SetManagerRight-5; $_l_RectBottom-(5+23); *)
	End if 
	
Else 
	
	OBJECT SET VISIBLE:C603(*; "oFilterNames"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccDate@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccLayers@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccAnal@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccProfBal@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccCur@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSalesPerson@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCountry@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCounty@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAreas@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oType@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStatus@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCoTypes@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRoles@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oHeading@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oGroup@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oBrand@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCollection@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oContractStates@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oContrTypes@"; False:C215)  //contract types
	
	OBJECT SET VISIBLE:C603(*; "oStockTypes@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStockLocs@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "ocredStage@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oInvoicePaid@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oMoves@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oContractStates@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStates@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSources@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "OcsFilterZeros@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "OSiFilterZeros@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "OSIFilterAllocated@"; False:C215)
	
	
	OBJECT GET COORDINATES:C663(*; "oNavigator"; $_l_NavigationLeft; $_l_NavigationTop; $_l_NavigationRight; $_l_NavigationBottom)
	OBJECT SET COORDINATES:C1248(*; "oNavigator"; $_l_NavigationLeft; DB_l_RememberNavBarTop; $_l_InputNavigationRIght; $_l_RectBottom)
	
	If (DB_bo_ShowArrayBased)
		OBJECT GET COORDINATES:C663(*; "oListboxOutputArrays"; $_l_LBLeft; $_l_LBTop; $_l_LBRight; $_l_ListBoxBottom)
	Else 
		OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_LBLeft; $_l_LBTop; $_l_LBRight; $_l_ListBoxBottom)
	End if 
	If (DB_bo_DisplayStats)
		//Get object-
		// /////
		If (False:C215)
			If (DB_bo_DisplayStats)
				//Get object
				If (False:C215)
					$_l_FullHeight:=($_l_RectBottom-5)-$_l_LBTop
					$_l_ListBoxBottom:=$_l_FullHeight/2
					
					OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_ListBoxBottom-5; *)
					OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_ListBoxBottom-5; *)
					OBJECT GET COORDINATES:C663(*; "oStatsColumnBreakDown"; $_l_ArrayLeft; $_l_ArrayTop; $_l_ArrayRight; $_l_ArrayBottom)
					$_l_ObjectWidth:=$_l_ArrayRight-$_l_ArrayLeft
					$_l_ObjectHeight:=$_l_ArrayBottom-$_l_ArrayTop
				End if 
				$_l_Size:=Size of array:C274(aSVN1)*14
				If ($_l_Size<14)
					$_l_Size:=14
				End if 
				
				$_l_FullHeight:=($_l_RectBottom-5)-$_l_LBTop
				$_l_ListBoxBottom:=$_l_FullHeight/2
				OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_LBTop+$_l_ListBoxBottom-5; *)
				OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_LBTop+$_l_ListBoxBottom-5; *)
				OBJECT GET COORDINATES:C663(*; "oStatsColumnBreakDown"; $_l_ArrayLeft; $_l_ArrayTop; $_l_ArrayRight; $_l_ArrayBottom)
				$_l_ObjectWidth:=$_l_ArrayRight-$_l_ArrayLeft
				$_l_ObjectHeight:=$_l_ArrayBottom-$_l_ArrayTop
				$_l_BX:=$_l_LBTop+$_l_ListBoxBottom+5+$_l_ObjectHeight+5
				$_l_TX:=(($_l_RectBottom-5)-12)
				
				If ($_l_Size>-($_l_TX-$_l_BX))
					
					
					
					$_l_Size:=(($_l_RectBottom-5)-12)-($_l_LBTop+$_l_ListBoxBottom+5+$_l_ObjectHeight+5)
				End if 
				If ($_l_Size<20)
					LB_SetScroll(->COM_lb_stats; -3; -3)
				End if 
				OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_LBTop+$_l_FullHeight-($_l_Size+28+15); *)
				OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_LBTop+$_l_FullHeight-($_l_Size+28+15); *)
				$_l_TopofStats:=(($_l_RectBottom-5)-14)-$_l_Size
				OBJECT MOVE:C664(*; "oStatsListbox1"; $_l_ListBoxLeft; $_l_TopofStats-14; $_l_ListBoxRight; $_l_TopofStats; *)
				OBJECT MOVE:C664(*; "oStatsListbox"; $_l_ListBoxLeft; $_l_TopofStats; $_l_ListBoxRight; ($_l_RectBottom-5)-14; *)
				OBJECT MOVE:C664(*; "oStatsListbox2"; $_l_ListBoxLeft; ($_l_RectBottom-5)-14; $_l_ListBoxRight; $_l_RectBottom-5; *)
				//MOVE OBJECT(*;"oStatsColumnBreakDown";$_l_ListBoxLeft+5;$_l_ListBoxBottom+5;$_l_ListBoxLeft+5+$_l_ObjectWidth;$_l_ListBoxBottom+5+$_l_ObjectHeight;*)
			Else 
				OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_RectBottom-5; *)
				OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_RectBottom-5; *)
				
			End if 
		End if 
		//........../
		$_l_Size:=Size of array:C274(aSVN1)*14
		If ($_l_Size<14)
			$_l_Size:=14
		End if 
		
		$_l_FullHeight:=($_l_RectBottom-5)-$_l_LBTop
		$_l_ListBoxBottom:=$_l_FullHeight/2
		OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_LBTop+$_l_ListBoxBottom-5; *)
		OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_LBTop+$_l_ListBoxBottom-5; *)
		OBJECT GET COORDINATES:C663(*; "oStatsColumnBreakDown"; $_l_ArrayLeft; $_l_ArrayTop; $_l_ArrayRight; $_l_ArrayBottom)
		$_l_ObjectWidth:=$_l_ArrayRight-$_l_ArrayLeft
		$_l_ObjectHeight:=$_l_ArrayBottom-$_l_ArrayTop
		//MOVE OBJECT(*;"oStatsColumnBreakDown";$_l_ListBoxLeft+5;$_l_LBTop+$_l_ListBoxBottom+5;$_l_ListBoxLeft+5+$_l_ObjectWidth;$_l_LBTop+$_l_ListBoxBottom+5+$_l_ObjectHeight;*)
		$_l_BX:=$_l_LBTop+$_l_ListBoxBottom+5+$_l_ObjectHeight+5
		$_l_TX:=(($_l_RectBottom-5)-12)
		
		If ($_l_Size>-($_l_TX-$_l_BX))
			
			
			
			$_l_Size:=(($_l_RectBottom-5)-12)-($_l_LBTop+$_l_ListBoxBottom+5+$_l_ObjectHeight+5)
		End if 
		If ($_l_Size<20)
			LB_SetScroll(->COM_lb_stats; -3; -3)
		End if 
		OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_LBTop+$_l_FullHeight-($_l_Size+28+15); *)
		OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_LBTop+$_l_FullHeight-($_l_Size+28+15); *)
		$_l_TopofStats:=(($_l_RectBottom-5)-14)-$_l_Size
		OBJECT SET VISIBLE:C603(*; "oStats@"; True:C214)
		
		OBJECT MOVE:C664(*; "oStatsListbox1"; $_l_ListBoxLeft; ($_l_TopofStats-14); $_l_ListBoxRight; $_l_TopofStats; *)
		OBJECT MOVE:C664(*; "oStatsListbox"; $_l_ListBoxLeft; $_l_TopofStats; $_l_ListBoxRight; ($_l_RectBottom-5)-14; *)
		OBJECT MOVE:C664(*; "oStatsListbox2"; $_l_ListBoxLeft; ($_l_RectBottom-5)-14; $_l_ListBoxRight; $_l_RectBottom-5; *)
		
		
	Else 
		OBJECT SET VISIBLE:C603(*; "oStats@"; False:C215)
		OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_RectBottom-5; *)
		OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_ListBoxLeft; DB_l_RememberListBoxTop; $_l_ListBoxRight; $_l_RectBottom-5; *)
		
	End if 
	
	
End if 
OBJECT MOVE:C664(*; "oOutSheenBlue"; 0; $_l_NavigationTop; $_l_NewFormWidth; $_l_RectBottom; *)
OBJECT MOVE:C664(*; "oWhiteness"; 0; $_l_RectBottom; $_l_NewFormWidth; $_l_NewWIndowHeight; *)
If (DB_bo_DisplaySelections)
	$_l_SetManagerRight:=$_l_ListBoxLeft-5
	OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_SelectionLBLeft; $_l_SelectionLBTop; $_l_SelectionLBRight; $_l_SelectionLBBottom)
	OBJECT MOVE:C664(*; "oSelectionsGroupBox"; 3; DB_l_RememberNavBarTop; $_l_SetManagerRight; $_l_RectBottom-5; *)
	OBJECT MOVE:C664(*; "oSelectionsListbox"; 8; DB_l_RememberNavBarTop+18; $_l_SetManagerRight-5; $_l_RectBottom-(5+23); *)
	$_l_MBottom:=$_l_RectBottom-8
	$_l_MTop:=$_l_MBottom-14
	$_l_MTop2:=$_l_MTop-7
	OBJECT GET COORDINATES:C663(*; "oSelectionsAdd1"; $_l_aObjectLeft; $_l_aObjectTop; $_l_aObjectRight; $_l_aObjectBottom)
	OBJECT MOVE:C664(*; "oSelectionsAdd1"; $_l_aObjectLeft; $_l_MTop; $_l_aObjectRight; $_l_MBottom; *)
	OBJECT GET COORDINATES:C663(*; "oSelectionsdel"; $_l_aObjectLeft; $_l_aObjectTop; $_l_aObjectRight; $_l_aObjectBottom)
	OBJECT MOVE:C664(*; "oSelectionsdel"; $_l_aObjectLeft; $_l_MTop; $_l_aObjectRight; $_l_MBottom; *)
	OBJECT GET COORDINATES:C663(*; "oSelectionsAccess"; $_l_aObjectLeft; $_l_aObjectTop; $_l_aObjectRight; $_l_aObjectBottom)
	OBJECT MOVE:C664(*; "oSelectionsAccess"; $_l_aObjectLeft; $_l_MTop; $_l_aObjectRight; $_l_MBottom; *)
	
	OBJECT GET COORDINATES:C663(*; "oSelectionsconfig"; $_l_aObjectLeft; $_l_aObjectTop; $_l_aObjectRight; $_l_aObjectBottom)
	OBJECT MOVE:C664(*; "oSelectionsconfig"; $_l_aObjectLeft; $_l_MTop; $_l_aObjectRight; $_l_MBottom; *)
	OBJECT GET COORDINATES:C663(*; "oSelectionsshareBox"; $_l_aObjectLeft; $_l_aObjectTop; $_l_aObjectRight; $_l_aObjectBottom)
	OBJECT MOVE:C664(*; "oSelectionsshareBox"; $_l_aObjectLeft; $_l_MBottom-11; $_l_aObjectRight; $_l_MBottom; *)
	OBJECT GET COORDINATES:C663(*; "oSelectionsOptions"; $_l_aObjectLeft; $_l_aObjectTop; $_l_aObjectRight; $_l_aObjectBottom)
	OBJECT MOVE:C664(*; "oSelectionsOptions"; $_l_aObjectLeft; $_l_MTop2; $_l_aObjectRight; $_l_MTop2+22; *)
End if 
ERR_MethodTrackerReturn("DB_SetOutPutFilters"; $_t_oldMethodName)
