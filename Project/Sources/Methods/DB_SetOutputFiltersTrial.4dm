//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_SetOutputFiltersTrial
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
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
	//ARRAY BOOLEAN(LAY_abo_ObjectExists;0)
	ARRAY LONGINT:C221($_al_LBSizes; 0)
	ARRAY LONGINT:C221($_al_ListBoxSize; 0)
	ARRAY LONGINT:C221($_al_ScreenBottom; 0)
	ARRAY LONGINT:C221($_al_ScreenLeft; 0)
	ARRAY LONGINT:C221($_al_ScreenRight; 0)
	ARRAY LONGINT:C221($_al_ScreenTop; 0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodF;0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodT;0)
	//ARRAY LONGINT(Lay_al_ObjectSequence;0)
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
	//ARRAY TEXT(Lay_at_ObjectName;0)
	//ARRAY TEXT(LAY_at_ObjectNamed;0)
	//ARRAY TEXT(LAY_at_SPName;0)
	C_BOOLEAN:C305(<>StockAnal; $_bo_DisplayAnalysis; $_bo_DisplayAreas; $_bo_DisplayCollections; $_bo_DisplayContractTypes; $_bo_DisplayCounties; $_bo_DisplayCountries; $_bo_DisplayCreditStages; $_bo_DisplayCurrencies; $_bo_DisplayFIlters; $_bo_DisplayHeadings)
	C_BOOLEAN:C305($_bo_DisplayLayers; $_bo_DisplayLocations; $_bo_DisplayMovementTypes; $_bo_DisplayOrderAreas; $_bo_DisplayOrderSources; $_bo_DisplayOrderStates; $_bo_DisplayOrderTypes; $_bo_DisplayPeriods; $_bo_DisplayProdBrands; $_bo_DisplayProdGroups; $_bo_DisplayRecordStates)
	C_BOOLEAN:C305($_bo_DisplaySalesPersons; $_bo_DisplaySalesRoles; $_bo_DisplaySalesSources; $_bo_DisplayStates; $_bo_DisplayStatus; $_bo_DisplayStockTypes; $_bo_DisplayTypes; $_bo_FiltersAvailable; $_bo_NoChange; $_bo_ObjectExists; $_bo_Repeats)
	C_BOOLEAN:C305($_bo_ShowContractStates; $_bo_ShowContractTypes; $_bo_ShowCreditStage; $_bo_ShowInvoiceStates; $_bo_ShowProfitCBs; $_bo_ShowStates; $1; ACC_bo_Both; CONT_bo_Both; CONT_bo_TypesSetup; CUR_bo_FilterDone)
	C_BOOLEAN:C305(CUR_bo_FilterZeros; DB_bo_AreasReady; DB_bo_CountiesReady; DB_bo_DisplayFilters; DB_bo_DisplaySelections; DB_bo_DisplayStats; DB_bo_FiltersActivated; DB_bo_InOutputFilters; DB_bo_ShowArrayBased; DB_bo_SPReady; DB_bo_TypesReady)
	C_BOOLEAN:C305(LAY_bo_AccTypesSetup; LAY_bo_AnalSetup; LAY_bo_AreasSetup; LAY_bo_BCAnalSetup; LAY_bo_ContractTypesSetup; LAY_bo_ContStatesSetup; LAY_bo_ConTypeSetup; LAY_bo_COsourcesSetup; LAY_bo_COStatusSetup; LAY_bo_CoTypesSetup; LAY_bo_CountiesSetup)
	C_BOOLEAN:C305(LAY_bo_CountriesReady; LAY_bo_CountriesSetup; LAY_bo_CreditStatesSetup; LAY_bo_CSAnalSetup; LAY_bo_CurrenciesSetup; LAY_bo_FiltersExist; LAY_bo_FiltersInited; LAY_bo_HeadingsSetup; LAY_bo_INVAnalSetup; LAY_bo_InvoiceStateSetup; LAY_bo_InvPeriodsSetup)
	C_BOOLEAN:C305(LAY_bo_JBAnalSetup; LAY_bo_LayerSetup; LAY_bo_MoveTypesSetup; LAY_bo_OrderAreasSetup; LAY_bo_OrdPeriodsSetup; LAY_bo_ORDsourcesSetup; LAY_bo_OrdStatesSetup; LAY_bo_OrdTypeSetup; LAY_bo_pBrandsSetup; LAY_bo_pCollectionsSetup; LAY_bo_PeriodsSetup)
	C_BOOLEAN:C305(LAY_bo_pGroupsSetup; LAY_bo_PIAnalSetup; LAY_bo_PIPeriodsSetup; LAY_bo_POAnalSetup; LAY_bo_POPeriodsSetup; LAY_bo_POStatesSetup; LAY_bo_RolesSetup; LAY_bo_SalesPersonSetup; LAY_bo_SLAnalSetup; LAY_bo_SMAnalSetup; LAY_bo_StatusSetup)
	C_BOOLEAN:C305(LAY_bo_STKIPeriodsSetup; LAY_bo_StockLocationsSetup; LAY_bo_StockTypesSetup; LAY_bo_TRAnalSetup; SI_bo_FilterAllocated; SI_bo_FilterZeros)
	C_LONGINT:C283($_l_ActionsWidth; $_l_AlignLeft; $_l_analysesWidth; $_l_aObjectBottom; $_l_aObjectLeft; $_l_aObjectRight; $_l_aObjectTop; $_l_AreaBottom; $_l_areaLeft; $_l_areaRight; $_l_areasWidth)
	C_LONGINT:C283($_l_areasWidthDB_SetoutFilterAre; $_l_areaTop; $_l_BestCB1Height; $_l_BestCB1Width; $_l_BestCB2Height; $_l_BestCB2Width; $_l_BestCB3Height; $_l_BestCB3Width; $_l_BestHeight; $_l_BestWidth; $_l_BestWidth2)
	C_LONGINT:C283($_l_bottom; $_l_BottomofStatsBoxCalc; $_l_BrandsWidth; $_l_buttonBottom; $_l_ButtonLeft; $_l_ButtonRight; $_l_ButtonsHeight; $_l_ButtonsWidth; $_l_ButtonTop; $_l_CalcSize; $_l_CalcsizeFrom)
	C_LONGINT:C283($_l_CBLeft; $_l_CheckBoxLeft; $_l_CNTWIdth; $_l_CollectionsWidth; $_l_ContractTypesWidth; $_l_CoTypeWidth; $_l_CoTypeWidths; $_l_CountiesWidth; $_l_CRStagesWidth; $_l_CurrenciesTotalWidth; $_l_CurrenciesWidth)
	C_LONGINT:C283($_l_CurWindowBottom; $_l_CUrWindowHeight; $_l_curWindowLeft; $_l_CUrWindowRight; $_l_CurWindowTop; $_l_CurWindowWidth; $_l_Difference; $_l_DockLB; $_l_DockLL; $_l_DockLR; $_l_DockPosition)
	C_LONGINT:C283($_l_DropDownsToDisplay; $_l_Element; $_l_FilterboxFromBottom; $_l_FilterboxFromRIght; $_l_FiltersBoxBottom; $_l_FiltersBoxHeight; $_l_FiltersBoxLeft; $_l_FiltersBoxRight; $_l_FiltersBoxTop; $_l_FiltersBoxWidth; $_l_FiltersWidthRequired)
	C_LONGINT:C283($_l_GetSizes; $_l_GroupsWidth; $_l_HeadingsWidth; $_l_HeightForStatsBox1; $_l_Hide; $_l_Index; $_l_LabelMaxWidth; $_l_LabelsWidth; $_l_LabelWidth; $_l_LastObjectBottom; $_l_LastObjectLeft)
	C_LONGINT:C283($_l_LastObjectRight; $_l_LastObjectTop; $_l_LayersWidth; $_l_LBBoxBottom; $_l_LbBoxLeft; $_l_LBBoxRight; $_l_LbBoxTop; $_l_left; $_l_LisboxSize; $_l_ListBoxAreaRight; $_l_ListboxesToDisplay)
	C_LONGINT:C283($_l_ListboxHeight; $_l_ListBoxLeft; $_l_ListboxTotalRows; $_l_ListBoxWidth; $_l_ListingPositionBottom; $_l_ListingPositionHeight; $_l_ListingPositionLeft; $_l_ListingPositionRight; $_l_ListingPositionTop; $_l_LocationsWidth; $_l_Maximum)
	C_LONGINT:C283($_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_MaxSizeAllocated; $_l_MaxSizeForLB; $_l_MaxSpacePerListbox; $_l_MaxWidthCBS; $_l_MaxWindowHeight; $_l_MaxWindowWidth; $_l_MinimumObjectTop; $_l_MinWidthFilters; $_l_MovementTypeWidths)
	C_LONGINT:C283($_l_MoveTypesWidth; $_l_NavigationCurrentBottom; $_l_NavigationCurrentLeft; $_l_NavigationCurrentRight; $_l_NavigationCurrentTop; $_l_NavigationLeft; $_l_NavigationRight; $_l_NavigatorBottom; $_l_NavigatorLeft; $_l_NavigatorRight; $_l_NavigatorTop)
	C_LONGINT:C283($_l_NewFiltersLeft; $_l_NewFormWidth; $_l_NewWIndowHeight; $_l_NewWindowLeft; $_l_NewWindowRight; $_l_NewWindowTop; $_l_NextLeft; $_l_NextObjectLeft; $_l_NextObjectTop; $_l_NumberOfMonitors; $_l_NumberofRowsAvailable)
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectExists; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectsWidth; $_l_ObjectTop; $_l_oBottom; $_l_Offset; $_l_OldNextObjectLeft; $_l_oldNextTop; $_l_oLeft)
	C_LONGINT:C283($_l_oRight; $_l_otherLBMinSIze; $_l_oTop; $_l_Percentage; $_l_PercentageForthisLB; $_l_PreferredSize; $_l_PreferredWidth; $_l_PReviousObject; $_l_PreviousObjectBottom; $_l_RadioButtonstoDisplay; $_l_RecordStatesWidth)
	C_LONGINT:C283($_l_RectBottom; $_l_Reduce; $_l_Ref; $_l_RemaingingRB; $_l_RemainingDropDowns; $_l_RemainingLBS; $_l_RemainingListboxMin; $_l_RemainingSizeForListboxes; $_l_Repeats; $_l_Resize; $_l_ResulsWidth)
	C_LONGINT:C283($_l_right; $_l_RolesWidth; $_l_RowCount; $_l_RowsToDisplay; $_l_ScrollBoxLeft; $_l_SearchAreaBottom; $_l_SearchAreaLeft; $_l_SearchAreaRight; $_l_SearchAreaTop; $_l_SelectionLBBottom; $_l_SelectionLBLeft)
	C_LONGINT:C283($_l_SelectionLBRight; $_l_SelectionLBTop; $_l_SetManagerBottomCalc; $_l_SetManagerRight; $_l_SetManagerTopCalc; $_l_SetManagerTopCalc2; $_l_SetSizes; $_l_SizeAllocated; $_l_SizeForListbox; $_l_SizeForListBoxes; $_l_SizeNotForListbox)
	C_LONGINT:C283($_l_SizePerListbox; $_l_sizesSet; $_l_SizethisLB; $_l_SMallestSize; $_l_SourcesWidth; $_l_SpaceBetween; $_l_SPWidth; $_l_StatesArraySize1; $_l_StatsBreakDownBottom; $_l_StatsBreakDownHeight; $_l_StatsBreakDownLeft)
	C_LONGINT:C283($_l_StatsBreakDownRight; $_l_StatsBreakDownTop; $_l_StatsBreakDownWidth; $_l_StatusWidth; $_l_StockTypeWidth; $_l_StrapBottom; $_l_StrapLeft; $_l_StrapRight; $_l_StrapTop; $_l_TableNumber; $_l_top)
	C_LONGINT:C283($_l_TopofStatsBox; $_l_TopofStatsBoxCalc; $_l_Total; $_l_TotalHeight; $_l_TotalRows; $_l_TotalSize; $_l_ViewedStateRow; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_LONGINT:C283($2; $3; $4; $5; $6; $7; $8; ACC_l_BalanceSheet; ACC_l_Both; ACC_l_ProfitSheet; ALL_l_Both)
	C_LONGINT:C283(CO_l_Both; CO_l_Company; CO_l_PrivateAddress; CONT_l_Both; CONT_l_Closed; CONT_l_Open; DB_l_CurrentDisplayedForm; DB_l_RememberNavBarTop; INV_l_Both; INV_l_Closed; INV_l_Open)
	C_LONGINT:C283(LAY_l_)
	C_POINTER:C301($_ptr_ObjectExists)
	C_REAL:C285($_R_average; $_r_MaxRange; $_r_MinRange; $_r_PercentageThisLB; $_r_Subtract)
	C_TEXT:C284($_t_Context; $_t_objectName; $_t_OldMethodName; $_t_ViewedStateType; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetOutPutFilters")
If (Not:C34(DB_bo_InOutputFilters))
	$_bo_FiltersAvailable:=$1
	DB_bo_InOutputFilters:=True:C214
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
	$_l_NavigationRight:=Abs:C99($3)
	$_l_RectBottom:=$4
	$_l_ListBoxAreaRight:=$5
	$_l_NewWindowRight:=$6
	$_l_NewFormWidth:=$7
	$_l_NewWIndowHeight:=$8
	OBJECT GET COORDINATES:C663(*; "oStrapHeader1"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapRight; $_l_StrapBottom)
	If ($_l_StrapBottom>0)
		$_l_MinimumObjectTop:=$_l_StrapTop
	Else 
		$_l_MinimumObjectTop:=5
	End if 
	If (DB_bo_DisplayFilters) & ($_bo_FiltersAvailable)
		OBJECT GET COORDINATES:C663(*; "oSearchvalue"; $_l_SearchAreaLeft; $_l_SearchAreaTop; $_l_SearchAreaRight; $_l_SearchAreaBottom)
		If ($_l_MinimumObjectTop>($_l_SearchAreaTop-3))
			$_l_SearchAreaBottom:=($_l_SearchAreaBottom-$_l_SearchAreaTop)+3
			$_l_SearchAreaTop:=$_l_MinimumObjectTop+3
		End if 
		OBJECT GET COORDINATES:C663(*; "oNavigator"; $_l_NavigationCurrentLeft; $_l_NavigationCurrentTop; $_l_NavigationCurrentRight; $_l_NavigationCurrentBottom)
		If ($_l_NavigationCurrentTop<($_l_MinimumObjectTop+19))
			$_l_NavigationCurrentTop:=$_l_MinimumObjectTop+19
			DB_l_RememberNavBarTop:=$_l_NavigationCurrentTop
		End if 
		If (DB_l_RememberNavBarTop=0)
			DB_l_RememberNavBarTop:=$_l_NavigationCurrentTop
		Else 
			$_l_NavigationCurrentTop:=DB_l_RememberNavBarTop
		End if 
		OBJECT SET COORDINATES:C1248(*; "oNavigator"; $_l_NavigationLeft; $_l_NavigationCurrentTop; $_l_NavigationRight; $_l_RectBottom)
		OBJECT SET COORDINATES:C1248(*; "oFiltersBox"; ($_l_NavigationRight+5); $_l_NavigationCurrentTop+5; ($_l_NewWindowRight-5); $_l_RectBottom)
		If (DB_bo_ShowArrayBased)
			OBJECT GET COORDINATES:C663(*; "oListboxOutputArrays"; $_l_ListingPositionLeft; $_l_ListingPositionTop; $_l_ListingPositionRight; $_l_ListingPositionBottom)
		Else 
			OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_ListingPositionLeft; $_l_ListingPositionTop; $_l_ListingPositionRight; $_l_ListingPositionBottom)
		End if 
		$_l_ListboxesToDisplay:=0
		If (DB_bo_DisplayStats)
			//Get object
			$_l_StatesArraySize1:=Size of array:C274(aSVN1)*14
			If ($_l_StatesArraySize1<14)
				$_l_HeightForStatsBox1:=14
			End if 
			
			$_l_ListingPositionHeight:=($_l_RectBottom-5)-$_l_ListingPositionTop
			$_l_ListingPositionBottom:=$_l_ListingPositionHeight/2
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputForm"; $_l_ListBoxLeft; $_l_ListingPositionTop; $_l_ListBoxAreaRight; $_l_ListingPositionTop+$_l_ListingPositionBottom-5)
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputArrays"; $_l_ListBoxLeft; $_l_ListingPositionTop; $_l_ListBoxAreaRight; $_l_ListingPositionTop+$_l_ListingPositionBottom-5)
			OBJECT GET COORDINATES:C663(*; "oStatsColumnBreakDown"; $_l_StatsBreakDownLeft; $_l_StatsBreakDownTop; $_l_StatsBreakDownRight; $_l_StatsBreakDownBottom)
			$_l_StatsBreakDownWidth:=$_l_StatsBreakDownRight-$_l_StatsBreakDownLeft
			$_l_StatsBreakDownHeight:=$_l_StatsBreakDownBottom-$_l_StatsBreakDownTop
			$_l_BottomofStatsBoxCalc:=$_l_ListingPositionTop+$_l_ListingPositionBottom+5+$_l_StatsBreakDownHeight+5
			$_l_TopofStatsBoxCalc:=(($_l_RectBottom-5)-12)
			
			If ($_l_HeightForStatsBox1>-($_l_TopofStatsBoxCalc-$_l_BottomofStatsBoxCalc))
				
				
				
				$_l_HeightForStatsBox1:=(($_l_RectBottom-5)-12)-($_l_ListingPositionTop+$_l_ListingPositionBottom+5+$_l_StatsBreakDownHeight+5)
			End if 
			If ($_l_HeightForStatsBox1<20)
				LB_SetScroll(->COM_lb_stats; -3; -3)
			End if 
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputForm"; $_l_ListBoxLeft; $_l_ListingPositionTop; $_l_ListBoxAreaRight; $_l_ListingPositionTop+$_l_ListingPositionHeight-($_l_HeightForStatsBox1+28+15))
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputArrays"; $_l_ListBoxLeft; $_l_ListingPositionTop; $_l_ListBoxAreaRight; $_l_ListingPositionTop+$_l_ListingPositionHeight-($_l_HeightForStatsBox1+28+15))
			$_l_TopofStatsBox:=(($_l_RectBottom-5)-14)-$_l_HeightForStatsBox1
			OBJECT SET COORDINATES:C1248(*; "oStatsListbox1"; $_l_ListBoxLeft; $_l_TopofStatsBox-14; $_l_ListBoxAreaRight; $_l_TopofStatsBox)
			OBJECT SET COORDINATES:C1248(*; "oStatsListbox"; $_l_ListBoxLeft; $_l_TopofStatsBox; $_l_ListBoxAreaRight; ($_l_RectBottom-5)-14)
			OBJECT SET COORDINATES:C1248(*; "oStatsListbox2"; $_l_ListBoxLeft; ($_l_RectBottom-5)-14; $_l_ListBoxAreaRight; $_l_RectBottom-5)
			//MOVE OBJECT(*;"oStatsColumnBreakDown";$_l_ListBoxLeft+5;$_l_ListingPositionBottom+5;$_l_ListBoxLeft+5+$_l_StatsBreakDownWidth;$_l_ListingPositionBottom+5+$_l_StatsBreakDownHeight;*)
		Else 
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputForm"; $_l_ListBoxLeft; $_l_ListingPositionTop; $_l_ListBoxAreaRight; $_l_RectBottom-5)
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputArrays"; $_l_ListBoxLeft; $_l_ListingPositionTop; $_l_ListBoxAreaRight; $_l_RectBottom-5)
			
		End if 
		//MOVE OBJECT(*;"oListboxOutputForm";$_l_ListBoxLeft;$_l_ListingPositionTop;$_l_ListBoxAreaRight;$_l_RectBottom-5;*)
		//MOVE OBJECT(*;"oListboxOutputArrays";$_l_ListBoxLeft;$_l_ListingPositionTop;$_l_ListBoxAreaRight;$_l_RectBottom-5;*)
		//OBJECT SET VISIBLE(*;"oAccDateFromBox";False)
		//OBJECT SET VISIBLE(*;"oAccDateFromContextualPeriods";False)
		//OBJECT SET VISIBLE(*;"oAccDateToBox";False)
		//OBJECT SET VISIBLE(*;"oAccDateToContextualPeriods";False)
		
		//OBJECT SET VISIBLE(*;"oFilterNames";False)
		//OBJECT SET VISIBLE(*;"oAccDate@";False)
		//OBJECT SET VISIBLE(*;"oAccLayers@";False)
		//OBJECT SET VISIBLE(*;"oAccAnal@";False)
		//OBJECT SET VISIBLE(*;"oAccProfBal@";False)
		//OBJECT SET VISIBLE(*;"oAccCur@";False)
		//OBJECT SET VISIBLE(*;"oSalesPerson@";False)
		//OBJECT SET VISIBLE(*;"oCountry@";False)
		//OBJECT SET VISIBLE(*;"oCounty@";False)
		//OBJECT SET VISIBLE(*;"oAreas@";False)
		//OBJECT SET VISIBLE(*;"oType@";False)
		//OBJECT SET VISIBLE(*;"oStatus@";False)
		//OBJECT SET VISIBLE(*;"oCoTypes@";False)
		//OBJECT SET VISIBLE(*;"oRoles@";False)
		//OBJECT SET VISIBLE(*;"oHeading@";False)
		//OBJECT SET VISIBLE(*;"oGroup@";False)
		//OBJECT SET VISIBLE(*;"oBrand@";False)
		//OBJECT SET VISIBLE(*;"oCollection@";False)
		//OBJECT SET VISIBLE(*;"oContractStates@";False)
		//OBJECT SET VISIBLE(*;"oContrTypes@";False)  //contract types
		
		//OBJECT SET VISIBLE(*;"oStockTypes@";False)
		//OBJECT SET VISIBLE(*;"oStockLocs@";False)
		//OBJECT SET VISIBLE(*;"ocredStage@";False)
		//OBJECT SET VISIBLE(*;"oInvoicePaid@";False)
		//OBJECT SET VISIBLE(*;"oMoves@";False)
		//OBJECT SET VISIBLE(*;"oContractStates@";False)
		//OBJECT SET VISIBLE(*;"oStates@";False)
		//OBJECT SET VISIBLE(*;"OcsFilterZeros@";False)
		//OBJECT SET VISIBLE(*;"OSiFilterZeros@";False)
		//OBJECT SET VISIBLE(*;"OSIFilterAllocated@";False)
		
		//OBJECT SET VISIBLE(*;"oSources@";False)
		OBJECT SET COORDINATES:C1248(*; "oFiltersBox"; ($_l_NavigationRight+5); $_l_NavigationCurrentTop+8; ($_l_NavigationRight+5)+65+2+228+10; $_l_RectBottom)
		OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
		$_l_FiltersBoxHeight:=$_l_FiltersBoxBottom-$_l_FiltersBoxTop
		$_l_ScrollBoxLeft:=$_l_FiltersBoxLeft+72
		$_l_AlignLeft:=$_l_FiltersBoxLeft+6
		$_l_ListboxesToDisplay:=0
		$_l_DropDownsToDisplay:=0
		$_l_RadioButtonstoDisplay:=0
		
		$_bo_DisplaySalesPersons:=False:C215
		$_bo_DisplayOrderTypes:=False:C215
		$_bo_DisplayOrderAreas:=False:C215
		$_bo_DisplayOrderStates:=False:C215
		$_bo_DisplayOrderSources:=False:C215
		$_bo_DisplayCounties:=False:C215  //``3/5/2013
		$_bo_DisplayCountries:=False:C215  //3/5/2013
		$_bo_DisplayAreas:=False:C215  //3/5/2013--might be same as Order areas??
		$_bo_DisplayTypes:=False:C215  //3/5/2013 might be same as order types
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
		
		ARRAY LONGINT:C221($_al_LBSizes; 0)
		//TRACE
		
		If (Not:C34(LAY_bo_FiltersInited))
			ARRAY BOOLEAN:C223(LAY_abo_ObjectExists; 0)
			ARRAY TEXT:C222(LAY_at_ObjectNamed; 0)
			ARRAY TEXT:C222(Lay_at_ObjectName; 0)
			LAY_bo_FiltersInited:=True:C214
		End if 
		$_l_MaxLBWidth:=0  //this will be set to the largest calculation of column width for listbox areas to display.
		Case of 
			: (DB_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
				
				$_l_SPWidth:=DB_SetOutFIlterSalesPersons(->[COMPANIES:2]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesPersons; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
				$_l_CNTWIdth:=DB_SetOutFIlterCountries(->[COMPANIES:2]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCountries; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_CountiesWidth:=DB_SetOutFIlterCounties(->[COMPANIES:2]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCounties; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_areasWidth:=DB_SetoutFilterAreas(->[COMPANIES:2]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAreas; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
				$_l_CoTypeWidth:=DB_SetoutFilterCoType(->[COMPANIES:2]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayTypes; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_StatusWidth:=DB_SetoutFilterCoStatus(->[COMPANIES:2]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayStatus; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_SourcesWidth:=DB_SetOutputFiltersSources(->[COMPANIES:2]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesSources; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				//oFilterRBObject
				$_l_ObjectExists:=Find in array:C230(LAY_at_ObjectNamed; "CoAddressTypes")  //this is not the name of the on screen object just a reference for this method
				If ($_l_ObjectExists<0)
					APPEND TO ARRAY:C911(LAY_abo_ObjectExists; False:C215)
					APPEND TO ARRAY:C911(LAY_at_ObjectNamed; "CoAddressTypes")
					APPEND TO ARRAY:C911(Lay_at_ObjectName; "oCoTypes")
					$_bo_ObjectExists:=False:C215
					$_l_ObjectExists:=Size of array:C274(LAY_abo_ObjectExists)
				Else 
					$_bo_ObjectExists:=LAY_abo_ObjectExists{$_l_ObjectExists}
				End if 
				If (Not:C34($_bo_ObjectExists))
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oCoTypesCB4"; ->CO_l_Both)
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oCoTypesCB5"; ->CO_l_Company; "oCoTypesCB4")
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oCoTypesCB6"; ->CO_l_PrivateAddress; "oCoTypesCB5")
					OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oCoTypesLabel")
					
					OBJECT SET TITLE:C194(*; "oCoTypesLabel"; "Showing :")
					OBJECT SET TITLE:C194(*; "oCoTypesCB4"; "Both")
					OBJECT SET TITLE:C194(*; "oCoTypesCB5"; "Company Address")
					OBJECT SET TITLE:C194(*; "oCoTypesCB6"; "Private Address")
					LAY_abo_ObjectExists{$_l_ObjectExists}:=True:C214
					
					
				End if 
				$_l_RadioButtonstoDisplay:=$_l_RadioButtonstoDisplay+2
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "CoAddressTypes")
				If (Not:C34(LAY_bo_CoTypesSetup))
					LAY_bo_CoTypesSetup:=True:C214
					CO_l_Both:=1
					CO_l_Company:=0
					CO_l_PrivateAddress:=0
				End if 
				
				
				//size
			: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNT_BALANCES:34]))
				//TRACE
				
				DB_SetOutFilterPeriods(->[ACCOUNT_BALANCES:34]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayPeriods; ->$_l_DropDownsToDisplay)
				
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[ACCOUNT_BALANCES:34]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAnalysis; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[ACCOUNT_BALANCES:34]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCurrencies; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_ObjectExists:=Find in array:C230(LAY_at_ObjectNamed; "ProfitCheckBoxes")  //this is not the name of the on screen object just a reference for this method
				If ($_l_ObjectExists<0)
					APPEND TO ARRAY:C911(LAY_abo_ObjectExists; False:C215)
					APPEND TO ARRAY:C911(LAY_at_ObjectNamed; "ProfitCheckBoxes")
					APPEND TO ARRAY:C911(Lay_at_ObjectName; "oAccProfBalCB1")
					$_bo_ObjectExists:=False:C215
					$_l_ObjectExists:=Size of array:C274(LAY_abo_ObjectExists)
				Else 
					$_bo_ObjectExists:=LAY_abo_ObjectExists{$_l_ObjectExists}
				End if 
				If (Not:C34($_bo_ObjectExists))
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oAccProfBalCB1"; ->ALL_l_Both)
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oAccProfBalCB3"; ->ACC_l_ProfitSheet; "oAccProfBalCB2")
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oAccProfBalCB2"; ->ACC_l_BalanceSheet; "oAccProfBalCB1")
					OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oAccProfBalLabel")
					
					OBJECT SET TITLE:C194(*; "oAccProfBalLabel"; "Showing :")
					OBJECT SET TITLE:C194(*; "oAccProfBalCB1"; "Both")
					OBJECT SET TITLE:C194(*; "oAccProfBalCB3"; "Profit & Loss")
					OBJECT SET TITLE:C194(*; "oAccProfBalCB2"; "Balance Sheet")
					LAY_abo_ObjectExists{$_l_ObjectExists}:=True:C214
					
					
				End if 
				$_bo_ShowProfitCBs:=True:C214
				$_l_RadioButtonstoDisplay:=$_l_RadioButtonstoDisplay+1  //note this is one because its one line
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "ProfitCheckBoxes")
				If (Not:C34(LAY_bo_AccTypesSetup))
					LAY_bo_AccTypesSetup:=True:C214
					ALL_l_Both:=1
					ACC_l_ProfitSheet:=0
					ACC_l_BalanceSheet:=0
				End if 
				
				
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
				// SALES PERSON(SAME AS CO)
				$_l_SPWidth:=DB_SetOutFIlterSalesPersons(->[CONTACTS:1]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesPersons; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				//ROLES
				$_l_RolesWidth:=DB_SetOutFIlterRoles(->[CONTACTS:1]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesRoles; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				//STATUS(SAME AS CO)
				$_l_StatusWidth:=DB_SetoutFilterCoStatus(->[CONTACTS:1]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayStatus; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				//TYPE(SAME AS CO)-BUT POTENTIALLY DIFFERENT LIST
				$_l_CoTypeWidth:=DB_SetoutFilterCoType(->[CONTACTS:1]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayTypes; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_SourcesWidth:=DB_SetOutputFiltersSources(->[CONTACTS:1]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesSources; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
				
				
				
				$_l_HeadingsWidth:=DB_SetOutputFilterHeadings(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayHeadings; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_ObjectExists:=Find in array:C230(LAY_at_ObjectNamed; "ProfitCheckBoxes")  //this is not the name of the on screen object just a reference for this method
				If ($_l_ObjectExists<0)
					APPEND TO ARRAY:C911(LAY_abo_ObjectExists; False:C215)
					APPEND TO ARRAY:C911(LAY_at_ObjectNamed; "ProfitCheckBoxes")
					APPEND TO ARRAY:C911(Lay_at_ObjectName; "oAccProfBal")
					
					$_bo_ObjectExists:=False:C215
					$_l_ObjectExists:=Size of array:C274(LAY_abo_ObjectExists)
				Else 
					$_bo_ObjectExists:=LAY_abo_ObjectExists{$_l_ObjectExists}
				End if 
				If (Not:C34($_bo_ObjectExists))
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oAccProfBalCB1"; ->ALL_l_Both)
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oAccProfBalCB3"; ->ACC_l_ProfitSheet; "oAccProfBalCB2")
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oAccProfBalCB2"; ->ACC_l_BalanceSheet; "oAccProfBalCB1")
					OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oAccProfBalLabel")
					
					OBJECT SET TITLE:C194(*; "oAccProfBalLabel"; "Showing :")
					OBJECT SET TITLE:C194(*; "oAccProfBalCB1"; "Both")
					OBJECT SET TITLE:C194(*; "oAccProfBalCB3"; "Profit & Loss")
					OBJECT SET TITLE:C194(*; "oAccProfBalCB2"; "Balance Sheet")
					LAY_abo_ObjectExists{$_l_ObjectExists}:=True:C214
					
					
				End if 
				$_bo_ShowProfitCBs:=True:C214
				$_l_RadioButtonstoDisplay:=$_l_RadioButtonstoDisplay+1  //note this is one because its one line
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "ProfitCheckBoxes")
				If (Not:C34(LAY_bo_AccTypesSetup))
					LAY_bo_AccTypesSetup:=True:C214
					ALL_l_Both:=1
					ACC_l_ProfitSheet:=0
					ACC_l_BalanceSheet:=0
				End if 
				
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCTS:9]))
				$_l_GroupsWidth:=DB_SetOutFilterGroups(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayProdGroups; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				//Groups
				$_l_BrandsWidth:=DB_SetOutFIlterBrands(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayProdBrands; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				//catalogue
				$_l_CollectionsWidth:=DB_setOutFilterCollections(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCollections; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[ORDERS:24])) | (DB_l_CurrentDisplayedForm=Table:C252(->[ORDER_ITEMS:25]))
				DB_SetOutFilterPeriods(->[ORDERS:24]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayPeriods; ->$_l_DropDownsToDisplay)
				
				
				
				$_l_SPWidth:=DB_SetOutFIlterSalesPersons(->[ORDERS:24]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesPersons; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_CoTypeWidth:=DB_SetoutFilterCoType(->[ORDERS:24]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayOrderTypes; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_areasWidth:=DB_SetoutFilterAreas(->[ORDERS:24]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayOrderAreas; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				//source
				
				$_l_SourcesWidth:=DB_SetOutputFiltersSources(->[ORDERS:24]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesSources; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
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
							$_t_ViewedStateType:=Replace string:C233(DB_t_CurrentContext; Get localized string:C991("MenuItem_View")+" "; "")
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
				
				
				If ($_bo_ShowStates)
					$_l_RecordStatesWidth:=DB_SetOutFilterRecordStates(->[ORDERS:24]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayStates; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				End if 
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTRACTS:17]))
				$_l_ContractTypesWidth:=DB_SetOutFilterContractTypes(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayContractTypes; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
				
				
				
				//open closed
				
				$_l_ObjectExists:=Find in array:C230(LAY_at_ObjectNamed; "Contract States")  //this is not the name of the on screen object just a reference for this method
				If ($_l_ObjectExists<0)
					APPEND TO ARRAY:C911(LAY_abo_ObjectExists; False:C215)
					APPEND TO ARRAY:C911(LAY_at_ObjectNamed; "Contract States")
					APPEND TO ARRAY:C911(Lay_at_ObjectName; "oContractStates")
					$_bo_ObjectExists:=False:C215
					$_l_ObjectExists:=Size of array:C274(LAY_abo_ObjectExists)
				Else 
					$_bo_ObjectExists:=LAY_abo_ObjectExists{$_l_ObjectExists}
				End if 
				If (Not:C34($_bo_ObjectExists))
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oContractStatesCB1"; ->CONT_l_Both)
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oContractStatesCB2"; ->CONT_l_Open; "oContractStatesCB1")
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oContractStatesCB3"; ->CONT_l_Closed; "oContractStatesCB2")
					OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oContractStatesLabel")
					
					OBJECT SET TITLE:C194(*; "oContractStatesLabel"; "Showing :")
					OBJECT SET TITLE:C194(*; "oContractStatesCB1"; "Both")
					OBJECT SET TITLE:C194(*; "oContractStatesCB2"; "Open Contracts")
					OBJECT SET TITLE:C194(*; "oContractStatesCB2"; "Closed Contracts")
					LAY_abo_ObjectExists{$_l_ObjectExists}:=True:C214
					
					
				End if 
				$_bo_ShowContractStates:=True:C214
				$_l_RadioButtonstoDisplay:=$_l_RadioButtonstoDisplay+2
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Contract States")
				If (Not:C34(LAY_bo_ContStatesSetup))
					LAY_bo_ContStatesSetup:=True:C214
					CONT_l_Both:=1
					CONT_l_Open:=0
					CONT_l_Closed:=0
				End if 
				
				
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[CURRENT_STOCK:62]))
				
				
				$_l_StockTypeWidth:=DB_SetOutFilterStockTypes(->[CURRENT_STOCK:62]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayStockTypes; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				//location
				$_l_LocationsWidth:=DB_SetoutfilterLocations(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayLocations; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				//layer
				//anal
				//currency
				If (<>StockAnal)
					$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[CURRENT_STOCK:62]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAnalysis; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				Else 
					LAY_bo_AnalSetup:=False:C215
					LAY_bo_TRAnalSetup:=False:C215
					LAY_bo_BCAnalSetup:=False:C215
					LAY_bo_SMAnalSetup:=False:C215
					LAY_bo_SLAnalSetup:=False:C215
					LAY_bo_PIAnalSetup:=False:C215
					LAY_bo_POAnalSetup:=False:C215
					LAY_bo_JBAnalSetup:=False:C215
					LAY_bo_INVAnalSetup:=False:C215
					LAY_bo_CSAnalSetup:=False:C215
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[CURRENT_STOCK:62]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayLayers; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
				$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[CURRENT_STOCK:62]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCurrencies; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
				
				$_l_ObjectExists:=Find in array:C230(LAY_at_ObjectNamed; "Filter Zeros")  //this is not the name of the on screen object just a reference for this method
				If ($_l_ObjectExists<0)
					APPEND TO ARRAY:C911(LAY_abo_ObjectExists; False:C215)
					APPEND TO ARRAY:C911(LAY_at_ObjectNamed; "Filter Zeros")
					APPEND TO ARRAY:C911(Lay_at_ObjectName; "OcsFilter")
					$_bo_ObjectExists:=False:C215
					$_l_ObjectExists:=Size of array:C274(LAY_abo_ObjectExists)
					$_l_RadioButtonstoDisplay:=$_l_RadioButtonstoDisplay+1
				Else 
					$_bo_ObjectExists:=LAY_abo_ObjectExists{$_l_ObjectExists}
				End if 
				If (Not:C34($_bo_ObjectExists))
					OBJECT DUPLICATE:C1111(*; "oFilterCBObject"; "OcsFilterZeros"; ->CUR_bo_FilterZeros)
					OBJECT SET TITLE:C194(*; "OcsFilterZeros"; "Exclude Zero Quantities")
					LAY_abo_ObjectExists{$_l_ObjectExists}:=True:C214
				End if 
				$_l_RadioButtonstoDisplay:=$_l_RadioButtonstoDisplay+1
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Filter Zeros")
				
				
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[DIARY:12]))  //<<  << <
				$_l_SPWidth:=DB_SetOutFIlterSalesPersons(->[DIARY:12]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesPersons; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				//action
				$_l_ActionsWidth:=DB_SetOutFIlterDiaryActions(->[DIARY:12]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesPersons; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				//result
				$_l_ResulsWidth:=DB_SetOutFIlterDiaryResults(->[DIARY:12]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesPersons; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				//done
				//date range
				//type(workflow)
				$_l_ObjectExists:=Find in array:C230(LAY_at_ObjectNamed; "Filter Done")  //this is not the name of the on screen object just a reference for this method
				If ($_l_ObjectExists<0)
					APPEND TO ARRAY:C911(LAY_abo_ObjectExists; False:C215)
					APPEND TO ARRAY:C911(LAY_at_ObjectNamed; "Filter Done")
					APPEND TO ARRAY:C911(Lay_at_ObjectName; "oDoneFilter")
					$_bo_ObjectExists:=False:C215
					$_l_ObjectExists:=Size of array:C274(LAY_abo_ObjectExists)
					$_l_RadioButtonstoDisplay:=$_l_RadioButtonstoDisplay+1
				Else 
					$_bo_ObjectExists:=LAY_abo_ObjectExists{$_l_ObjectExists}
				End if 
				If (Not:C34($_bo_ObjectExists))
					OBJECT DUPLICATE:C1111(*; "oFilterCBObject"; "oDoneFilter"; ->CUR_bo_FilterDone)
					OBJECT SET TITLE:C194(*; "oDoneFilter"; "Exclude Completed")
					LAY_abo_ObjectExists{$_l_ObjectExists}:=True:C214
				End if 
				$_l_RadioButtonstoDisplay:=$_l_RadioButtonstoDisplay+1
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "Filter Done")
				
				
				
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
				If ($_bo_ShowCreditStage)
					//credit stage-not applicable to payments
					$_l_CRStagesWidth:=DB_SetoutfilterCreditStages(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCreditStages; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				End if 
				//Period
				DB_SetOutFilterPeriods(->[INVOICES:39]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayPeriods; ->$_l_DropDownsToDisplay)
				
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[INVOICES:39]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAnalysis; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[INVOICES:39]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayLayers; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[INVOICES:39]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCurrencies; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_areasWidth:=DB_SetoutFilterAreas(->[INVOICES:39]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAreas; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				//area
				$_l_ObjectExists:=Find in array:C230(LAY_at_ObjectNamed; "Invoice Paid")  //this is not the name of the on screen object just a reference for this method
				If ($_l_ObjectExists<0)
					APPEND TO ARRAY:C911(LAY_abo_ObjectExists; False:C215)
					APPEND TO ARRAY:C911(LAY_at_ObjectNamed; "Invoice Paid")
					APPEND TO ARRAY:C911(Lay_at_ObjectName; "oInvoicePaid")
					$_bo_ObjectExists:=False:C215
					$_l_ObjectExists:=Size of array:C274(LAY_abo_ObjectExists)
				Else 
					$_bo_ObjectExists:=LAY_abo_ObjectExists{$_l_ObjectExists}
				End if 
				If (Not:C34($_bo_ObjectExists))
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oInvoicePaidCB1"; ->INV_l_Both)
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oInvoicePaidCB2"; ->INV_l_Open; "oInvoicePaidCB1")
					OBJECT DUPLICATE:C1111(*; "oFilterRBObject"; "oInvoicePaidCB3"; ->INV_l_Closed; "oInvoicePaidCB2")
					OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oInvoicePaidLabel")
					
					OBJECT SET TITLE:C194(*; "oInvoicePaidLabel"; "Showing :")
					OBJECT SET TITLE:C194(*; "oInvoicePaidCB1"; "Both")
					OBJECT SET TITLE:C194(*; "oInvoicePaidCB2"; "Amount Due Not Zero")
					OBJECT SET TITLE:C194(*; "oInvoicePaidCB3"; "Amount Due Zero")
					LAY_abo_ObjectExists{$_l_ObjectExists}:=True:C214
					
					
				End if 
				$_bo_ShowInvoiceStates:=True:C214
				$_l_RadioButtonstoDisplay:=$_l_RadioButtonstoDisplay+2
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
				
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[JOBS:26]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAnalysis; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
				//layers
				//currency
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[PROJECTS:89]))
				
				//state
				//type
				//manager
			: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_ORDERS:57])) | (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				//state
				
				$_l_RecordStatesWidth:=DB_SetOutFilterRecordStates(->[PURCHASE_ORDERS:57]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayStates; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[PURCHASE_ORDERS:57]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAnalysis; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[PURCHASE_ORDERS:57]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayLayers; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[PURCHASE_ORDERS:57]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCurrencies; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				DB_SetOutFilterPeriods(->[PURCHASE_ORDERS:57]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayPeriods; ->$_l_DropDownsToDisplay)
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICES:37])) | (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				
				DB_SetOutFilterPeriods(->[PURCHASE_INVOICES:37]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayPeriods; ->$_l_DropDownsToDisplay)
				
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[PURCHASE_INVOICES:37]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAnalysis; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[PURCHASE_INVOICES:37]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayLayers; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[PURCHASE_INVOICES:37]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCurrencies; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
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
				
				$_l_MoveTypesWidth:=DB_SetOutFilterMoveTypes(->[STOCK_MOVEMENT_ITEMS:27]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayMovementTypes; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				$_l_StockTypeWidth:=DB_SetOutFilterStockTypes(->[STOCK_MOVEMENT_ITEMS:27]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayStockTypes; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				If (<>StockAnal)
					$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[STOCK_MOVEMENT_ITEMS:27]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAnalysis; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				Else 
					LAY_bo_AnalSetup:=False:C215
					LAY_bo_TRAnalSetup:=False:C215
					LAY_bo_BCAnalSetup:=False:C215
					LAY_bo_SMAnalSetup:=False:C215
					LAY_bo_SLAnalSetup:=False:C215
					LAY_bo_PIAnalSetup:=False:C215
					LAY_bo_POAnalSetup:=False:C215
					LAY_bo_JBAnalSetup:=False:C215
					LAY_bo_INVAnalSetup:=False:C215
					LAY_bo_CSAnalSetup:=False:C215
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[STOCK_MOVEMENTS:40]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayLayers; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_CurrenciesWidth:=DB_SetoutFilterCurrencies(->[STOCK_MOVEMENT_ITEMS:27]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCurrencies; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				//periods
				DB_SetOutFilterPeriods(->[STOCK_MOVEMENTS:40]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayPeriods; ->$_l_DropDownsToDisplay)
				
				$_bo_DisplayFIlters:=True:C214
				$_l_RadioButtonstoDisplay:=$_l_RadioButtonstoDisplay+2  //note this is one because its one line
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "OSIFilter Zeros")
				
				$_l_ObjectExists:=Find in array:C230(LAY_at_ObjectNamed; "OSIFilter Zeros")  //this is not the name of the on screen object just a reference for this method
				If ($_l_ObjectExists<0)
					APPEND TO ARRAY:C911(LAY_abo_ObjectExists; False:C215)
					APPEND TO ARRAY:C911(LAY_at_ObjectNamed; "OSIFilter Zeros")
					APPEND TO ARRAY:C911(Lay_at_ObjectName; "OSIFilter")
					$_bo_ObjectExists:=False:C215
					$_l_ObjectExists:=Size of array:C274(LAY_abo_ObjectExists)
					$_l_RadioButtonstoDisplay:=$_l_RadioButtonstoDisplay+1
				Else 
					$_bo_ObjectExists:=LAY_abo_ObjectExists{$_l_ObjectExists}
				End if 
				If (Not:C34($_bo_ObjectExists))
					OBJECT DUPLICATE:C1111(*; "oFilterCBObject"; "OSiFilterZeros"; ->SI_bo_FilterZeros)
					OBJECT SET TITLE:C194(*; "OSiFilterZeros"; "Exclude Fully Called off Stock items")
					OBJECT DUPLICATE:C1111(*; "oFilterCBObject"; "OSIFilterAllocated"; ->SI_bo_FilterAllocated)
					OBJECT SET TITLE:C194(*; "OSIFilterAllocated"; "Exclude Allocated")
					LAY_abo_ObjectExists{$_l_ObjectExists}:=True:C214
				End if 
				$_l_RadioButtonstoDisplay:=$_l_RadioButtonstoDisplay+2
				APPEND TO ARRAY:C911($_at_ObjectsToDisplay; "OSIFilter Zeros")
				
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_LEVELS:58]))
				
				$_l_StockTypeWidth:=DB_SetOutFilterStockTypes(->[STOCK_LEVELS:58]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayStockTypes; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				If (<>StockAnal)
					$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[STOCK_LEVELS:58]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAnalysis; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				Else 
					LAY_bo_AnalSetup:=False:C215
					LAY_bo_TRAnalSetup:=False:C215
					LAY_bo_BCAnalSetup:=False:C215
					LAY_bo_SMAnalSetup:=False:C215
					LAY_bo_SLAnalSetup:=False:C215
					LAY_bo_PIAnalSetup:=False:C215
					LAY_bo_POAnalSetup:=False:C215
					LAY_bo_JBAnalSetup:=False:C215
					LAY_bo_INVAnalSetup:=False:C215
					LAY_bo_CSAnalSetup:=False:C215
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[STOCK_LEVELS:58]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayLayers; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
				$_l_CurrenciesWidth:=DB_SetoutFilterCurrencies(->[STOCK_LEVELS:58]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCurrencies; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENTS:40]))
				
				$_l_MovementTypeWidths:=DB_SetOutFilterMoveTypes(->[STOCK_MOVEMENTS:40]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayMovementTypes; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				If (<>StockAnal)
					$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[STOCK_MOVEMENTS:40]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAnalysis; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
					
				Else 
					LAY_bo_AnalSetup:=False:C215
					LAY_bo_TRAnalSetup:=False:C215
					LAY_bo_BCAnalSetup:=False:C215
					LAY_bo_SMAnalSetup:=False:C215
					LAY_bo_SLAnalSetup:=False:C215
					LAY_bo_PIAnalSetup:=False:C215
					LAY_bo_POAnalSetup:=False:C215
					LAY_bo_JBAnalSetup:=False:C215
					LAY_bo_INVAnalSetup:=False:C215
					LAY_bo_CSAnalSetup:=False:C215
					ARRAY TEXT:C222(ANAL_at_analcode; 0)
					ARRAY TEXT:C222(ANAL_at_AnalName; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
					ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
				End if 
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[STOCK_MOVEMENTS:40]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayLayers; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
				$_l_CurrenciesWidth:=DB_SetoutFilterCurrencies(->[STOCK_MOVEMENTS:40]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCurrencies; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				DB_SetOutFilterPeriods(->[STOCK_MOVEMENTS:40]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayPeriods; ->$_l_DropDownsToDisplay)
				
				
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCHES:30]))
				
				DB_SetOutFilterPeriods(->[ACCOUNT_BALANCES:34]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayPeriods; ->$_l_DropDownsToDisplay)
				
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[TRANSACTION_BATCHES:30]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAnalysis; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[TRANSACTION_BATCHES:30]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayLayers; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				$_l_CurrenciesWidth:=DB_SetoutFilterCurrencies(->[TRANSACTION_BATCHES:30]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCurrencies; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				//invoice/purchase/nominal/job
			: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTIONS:29]))
				
				
				
				
				DB_SetOutFilterPeriods(->[ACCOUNT_BALANCES:34]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayPeriods; ->$_l_DropDownsToDisplay)
				
				$_l_analysesWidth:=DB_SetOutFiltersAnalysis(->[TRANSACTIONS:29]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayAnalysis; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
				
				$_l_LayersWidth:=DB_SetoutFilterLayers(->[TRANSACTIONS:29]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayLayers; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
				$_l_CurrenciesWidth:=DB_SetoutFilterCurrencies(->[TRANSACTIONS:29]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCurrencies; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes; ->$_l_MaxLabelWidth)
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[WORKFLOW_CONTROL:51]))
				
		End case 
		//TRACE
		
		
		$_l_ObjectsWidth:=$_l_MaxLBWidth
		If ($_l_MaxLabelWidth<97)
			$_l_LabelsWidth:=97
		Else 
			$_l_LabelsWidth:=$_l_MaxLabelWidth
		End if 
		
		If (Find in array:C230($_at_ObjectsToDisplay; "ProfitBalance")>0) | (Find in array:C230($_at_ObjectsToDisplay; "ProfitBalance")>0)
			OBJECT SET VISIBLE:C603(*; "oAccProfBal@"; True:C214)
			OBJECT GET BEST SIZE:C717(*; "oAccProfBalLabel"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_LabelsWidth)
				$_l_LabelsWidth:=$_l_BestWidth
			End if 
			OBJECT GET BEST SIZE:C717(*; "oAccProfBalCB1"; $_l_BestCB1Width; $_l_BestHeight)
			
			OBJECT GET BEST SIZE:C717(*; "oAccProfBalCB2"; $_l_BestCB2Width; $_l_BestHeight)
			If ($_l_BestCB1Width+5+$_l_BestCB2Width>$_l_ObjectsWidth)
				$_l_ObjectsWidth:=$_l_BestCB1Width+5+$_l_BestCB2Width
			End if 
			OBJECT GET BEST SIZE:C717(*; "oAccProfBalCB3"; $_l_BestCB3Width; $_l_BestHeight)
			
		End if 
		If (Find in array:C230($_at_ObjectsToDisplay; "Periods")>0)
			OBJECT SET VISIBLE:C603(*; "oPeriods@"; True:C214)
			OBJECT GET BEST SIZE:C717(*; "oAccDateFromLabel"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_LabelsWidth)
				$_l_LabelsWidth:=$_l_BestWidth
			End if 
			OBJECT GET BEST SIZE:C717(*; "oAccDateToLabel"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_LabelsWidth)
				$_l_LabelsWidth:=$_l_BestWidth
			End if 
			OBJECT GET BEST SIZE:C717(*; "oAccDateFrom"; $_l_BestCB1Width; $_l_BestCB1Height)
			OBJECT GET BEST SIZE:C717(*; "oAccDateFrom"; $_l_BestCB2Width; $_l_BestCB2Height)
			If (($_l_BestCB1Width+5+21)>$_l_ObjectsWidth)
				$_l_ObjectsWidth:=$_l_BestCB1Width+5+21
			End if 
			If (($_l_BestCB2Width+5+21)>$_l_ObjectsWidth)
				$_l_ObjectsWidth:=$_l_BestCB2Width+5+21
			End if 
		End if 
		
		If (Find in array:C230($_at_ObjectsToDisplay; "Invoice Paid")>0)
			OBJECT SET VISIBLE:C603(*; "oInvoicePaid@"; True:C214)
			OBJECT GET BEST SIZE:C717(*; "oInvoicePaidLabel"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_LabelsWidth)
				$_l_LabelsWidth:=$_l_BestWidth
			End if 
			OBJECT GET BEST SIZE:C717(*; "oInvoicePaidCB1"; $_l_BestCB1Width; $_l_BestHeight)
			
			OBJECT GET BEST SIZE:C717(*; "oInvoicePaidCB2"; $_l_BestCB2Width; $_l_BestHeight)
			If (($_l_BestCB1Width+5+$_l_BestCB2Width)>$_l_ObjectsWidth)
				$_l_ObjectsWidth:=$_l_BestCB1Width+5+$_l_BestCB2Width
			End if 
			OBJECT GET BEST SIZE:C717(*; "oInvoicePaidCB3"; $_l_BestCB3Width; $_l_BestHeight)
		End if 
		If (Find in array:C230($_at_ObjectsToDisplay; "Filter Zeros")>0)  //no label here?
			OBJECT SET VISIBLE:C603(*; "OcsFilterZeros@"; True:C214)
			OBJECT GET BEST SIZE:C717(*; "OcsFilterZeros"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_ObjectsWidth)
				$_l_ObjectsWidth:=$_l_BestWidth
			End if 
		End if 
		If (Find in array:C230($_at_ObjectsToDisplay; "OSIFilter Zeros")>0)  //no label here?
			OBJECT SET VISIBLE:C603(*; "OSIFilterZeros@"; True:C214)
			OBJECT GET BEST SIZE:C717(*; "OSIFilterZeros"; $_l_BestCB1Width; $_l_BestCB1Height)
			If ($_l_BestCB1Width>$_l_ObjectsWidth)
				$_l_ObjectsWidth:=$_l_BestCB1Width
			End if 
			OBJECT SET VISIBLE:C603(*; "OSIFilterAllocated@"; True:C214)
			OBJECT GET BEST SIZE:C717(*; "OSIFilterAllocated"; $_l_BestCB1Width; $_l_BestCB1Height)
			If ($_l_BestCB1Width>$_l_ObjectsWidth)
				$_l_ObjectsWidth:=$_l_BestCB1Width
			End if 
		End if 
		If (Find in array:C230($_at_ObjectsToDisplay; "Contract States")>0)
			OBJECT SET VISIBLE:C603(*; "oContractStates@"; True:C214)
			OBJECT GET BEST SIZE:C717(*; "oContractStatesLabel"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_LabelsWidth)
				$_l_LabelsWidth:=$_l_BestWidth
			End if 
			OBJECT GET BEST SIZE:C717(*; "oContractStatesCB1"; $_l_BestCB1Width; $_l_BestCB1Height)
			OBJECT GET BEST SIZE:C717(*; "oContractStatesCB2"; $_l_BestCB2Width; $_l_BestCB2Height)
			If (($_l_BestCB1Width+5+$_l_BestCB2Width)>$_l_ObjectsWidth)
				$_l_ObjectsWidth:=$_l_BestCB1Width+5+$_l_BestCB2Width
			End if 
			
			OBJECT GET BEST SIZE:C717(*; "oContractStatesCB3"; $_l_BestCB3Width; $_l_BestCB3Height)
		End if 
		If (Find in array:C230($_at_ObjectsToDisplay; "CoAddressTypes")>0)
			OBJECT SET VISIBLE:C603(*; "oCoTypes@"; True:C214)
			OBJECT GET BEST SIZE:C717(*; "oCoTypesLabel"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_LabelsWidth)
				$_l_LabelsWidth:=$_l_BestWidth
			End if 
			OBJECT GET BEST SIZE:C717(*; "oCoTypesCB4"; $_l_BestCB1Width; $_l_BestCB1Height)
			OBJECT GET BEST SIZE:C717(*; "oCoTypesCB5"; $_l_BestCB2Width; $_l_BestCB2Height)
			If (($_l_BestCB1Width+5+$_l_BestCB2Width)>$_l_ObjectsWidth)
				$_l_ObjectsWidth:=$_l_BestCB1Width+5+$_l_BestCB2Width
			End if 
			OBJECT GET BEST SIZE:C717(*; "oCoTypesCB6"; $_l_BestCB3Width; $_l_BestCB3Height)
		End if 
		$_l_FiltersWidthRequired:=5+$_l_LabelsWidth+5+$_l_ObjectsWidth+5
		
		//$_l_MaxLBWidth
		//OBJECT GET COORDINATES(*;"oFiltersBox";$_l_FiltersBoxLeft;$_l_FiltersBoxTop;$_l_FiltersBoxRight;$_l_FiltersBoxBottom)
		
		$_l_NextObjectTop:=45
		GET WINDOW RECT:C443($_l_curWindowLeft; $_l_CurWindowTop; $_l_CUrWindowRight; $_l_CurWindowBottom)
		$_l_CUrWindowHeight:=($_l_CurWindowBottom-$_l_CurWindowTop)
		$_l_CurWindowWidth:=$_l_CUrWindowRight-$_l_curWindowLeft
		//TRACE
		OBJECT SET COORDINATES:C1248(*; "oFiltersBox"; ($_l_CurWindowWidth-5)-$_l_FiltersWidthRequired; $_l_NavigationCurrentTop+8; ($_l_CurWindowWidth-5); $_l_RectBottom)
		$_l_FilterboxFromRIght:=5  //$_l_CurWindowWidth-($_l_NavigationRight+5)+$_l_LabelsWidth+2+$_l_MaxLBWidth+10
		$_l_FilterboxFromBottom:=$_l_CUrWindowHeight-$_l_RectBottom
		If (False:C215)
			If (((($_l_NavigationRight+5)+$_l_LabelsWidth+2+$_l_MaxLBWidth+10))>$_l_CurWindowWidth)
				//TRACE
				
				SET WINDOW RECT:C444($_l_curWindowLeft; $_l_CurWindowTop; $_l_curWindowLeft+((($_l_NavigationRight+5)+$_l_LabelsWidth+2+$_l_MaxLBWidth+10))+5; $_l_CurWindowBottom)
				GET WINDOW RECT:C443($_l_curWindowLeft; $_l_CurWindowTop; $_l_CUrWindowRight; $_l_CurWindowBottom)
				$_l_CUrWindowHeight:=($_l_CurWindowBottom-$_l_CurWindowTop)
				$_l_CurWindowWidth:=$_l_CUrWindowRight-$_l_curWindowLeft
				OBJECT SET COORDINATES:C1248(*; "oFiltersBox"; ($_l_NavigationRight+5); $_l_NavigationCurrentTop+8; ($_l_NavigationRight+5)+$_l_LabelsWidth+2+$_l_MaxLBWidth+10; $_l_RectBottom)
				
			Else 
				OBJECT SET COORDINATES:C1248(*; "oFiltersBox"; ($_l_NavigationRight+5); $_l_NavigationCurrentTop+8; ($_l_NavigationRight+5)+$_l_LabelsWidth+2+$_l_MaxLBWidth+10; $_l_RectBottom)
			End if 
		End if 
		OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
		$_l_FiltersBoxHeight:=$_l_FiltersBoxBottom-$_l_FiltersBoxTop
		//TRACE
		$_l_ScrollBoxLeft:=$_l_FiltersBoxRight-6-$_l_MaxLBWidth  //+72
		$_l_AlignLeft:=$_l_FiltersBoxLeft+6
		$_l_SizeNotForListbox:=$_l_NextObjectTop+(((($_l_DropDownsToDisplay*(18+5)+($_l_RadioButtonstoDisplay*(18+5))))+$_l_DropDownsToDisplay+$_l_RadioButtonstoDisplay))
		//TRACE
		$_l_ListboxTotalRows:=Sum:C1($_al_LBSizes)+($_l_ListboxesToDisplay)
		If (($_l_ListboxTotalRows/Size of array:C274($_al_LBSizes))<6)  //less than 6 rows per lb-probably make it a bit bigger i think
			$_l_ListboxTotalRows:=($_l_ListboxesToDisplay)+(6*$_l_ListboxesToDisplay)
		End if 
		//$_l_SizeForListBoxes:=($_l_FiltersBoxHeight-(($_l_SizeNotForListbox))  //+((20*$_l_ListboxTotalRows)+(5*$_l_ListboxesToDisplay)))
		
		$_l_PreferredSize:=($_l_NewWIndowHeight-$_l_FiltersBoxHeight)+($_l_ListboxTotalRows*18)+(((($_l_DropDownsToDisplay*(18+5)+($_l_RadioButtonstoDisplay*(18+5))))+$_l_DropDownsToDisplay+$_l_RadioButtonstoDisplay))
		$_l_PreferredWidth:=$_l_NavigationRight+$_l_FiltersWidthRequired+10
		
		If ($_l_PreferredSize>$_l_CUrWindowHeight) | ($_l_PreferredWidth>$_l_CurWindowWidth)
			
			ARRAY LONGINT:C221($_al_ScreenLeft; 0)
			ARRAY LONGINT:C221($_al_ScreenTop; 0)
			ARRAY LONGINT:C221($_al_ScreenRight; 0)
			ARRAY LONGINT:C221($_al_ScreenBottom; 0)
			
			$_l_NumberOfMonitors:=Count screens:C437
			For ($_l_GetSizes; 1; $_l_NumberOfMonitors)
				SCREEN COORDINATES:C438($_l_left; $_l_top; $_l_right; $_l_bottom; $_l_GetSizes)
				APPEND TO ARRAY:C911($_al_ScreenLeft; $_l_left)
				APPEND TO ARRAY:C911($_al_ScreenTop; $_l_top)
				APPEND TO ARRAY:C911($_al_ScreenRight; $_l_right)
				APPEND TO ARRAY:C911($_al_ScreenBottom; $_l_bottom)
				If ($_l_curWindowLeft>=$_l_left) & ($_l_curWindowLeft<$_l_right) & ($_l_CurWindowTop>$_l_top) & ($_l_CurWindowTop<$_l_bottom)
					//we are on this screen
					//generally we dont want to move the top of the window from where it it
					$_l_DockPosition:=INT_GetDock("A"; ->$_l_DockLB; ->$_l_DockLR; ->$_l_DockLL)
					
					$_l_bottom:=($_l_bottom-$_l_DockLB)-10
					If ($_l_CurWindowTop>$_l_top)
						$_l_MaxWindowHeight:=($_l_bottom-$_l_CurWindowTop)
					Else 
						$_l_MaxWindowHeight:=($_l_bottom-$_l_top)-(Menu bar height:C440+1)
					End if 
					$_l_MaxWindowWidth:=($_l_right-$_l_DockLR)-($_l_left+$_l_DockLL)
					$_l_GetSizes:=99
				End if 
				
			End for 
			If ($_l_MaxWindowHeight>$_l_CUrWindowHeight)
				//we could make the window taller
				
				If ($_l_MaxWindowHeight>$_l_PreferredSize)
					$_l_MaxWindowHeight:=$_l_PreferredSize
				End if 
			Else 
				$_l_MaxWindowHeight:=$_l_CUrWindowHeight
			End if 
			$_l_MaxWindowWidth:=$_l_CurWindowWidth
			If (False:C215)
				If ($_l_MaxWindowWidth>($_l_CurWindowWidth+10))
					//we could make the window wider
					//TRACE
					If ($_l_MaxWindowWidth>($_l_PreferredWidth))
						$_l_MaxWindowWidth:=$_l_PreferredWidth  //limit it
					End if 
				Else 
					$_l_MaxWindowWidth:=$_l_CurWindowWidth
				End if 
			End if 
			//GET WINDOW RECT($_l_curWindowLeft;$_l_CurWindowTop;$_l_CUrWindowRight;$_l_CurWindowBottom)
			If (($_l_CurWindowTop+$_l_MaxWindowHeight)>$_l_bottom)  //this will go beyond the bottom of the screen
				//TRACE
				//RESIZE FORM WINDOW($_l_MaxWindowWidth;$_l_MaxWindowHeight)
				
				$_l_NewWindowTop:=($_l_bottom-$_l_MaxWindowHeight)-5
				
				If (($_l_curWindowLeft+$_l_MaxWindowWidth)>$_l_right)
					$_l_NewWindowLeft:=($_l_right-5)-$_l_MaxWindowWidth
				Else 
					$_l_NewWindowLeft:=$_l_curWindowLeft
				End if 
				//SET WINDOW RECT($_l_NewWindowLeft;$_l_NewWindowTop;$_l_NewWindowLeft+$_l_MaxWindowWidth;$_l_NewWindowTop+$_l_MaxWindowHeight)
				SET WINDOW RECT:C444($_l_NewWindowLeft; $_l_CurWindowTop; $_l_CUrWindowRight; $_l_CurWindowTop+$_l_MaxWindowHeight)
				
			Else 
				//we can resize down
				If (($_l_curWindowLeft+$_l_MaxWindowWidth)>$_l_right)
					//TRACE
					//RESIZE FORM WINDOW($_l_MaxWindowWidth;$_l_MaxWindowHeight)
					
					$_l_NewWindowLeft:=($_l_right-5)-$_l_MaxWindowWidth
					//SET WINDOW RECT($_l_NewWindowLeft;$_l_CurWindowTop;$_l_NewWindowLeft+$_l_MaxWindowWidth;$_l_CurWindowTop+$_l_MaxWindowHeight)
					SET WINDOW RECT:C444($_l_NewWindowLeft; $_l_CurWindowTop; $_l_CUrWindowRight; $_l_CurWindowTop+$_l_MaxWindowHeight)
					
				Else 
					//TRACE
					//GET WINDOW RECT($_l_curWindowLeft;$_l_CurWindowTop;$_l_CUrWindowRight;$_l_CurWindowBottom)
					If (($_l_MaxWindowHeight)>($_l_CurWindowBottom-$_l_CurWindowTop))
						RESIZE FORM WINDOW:C890(($_l_CUrWindowRight-$_l_curWindowLeft); $_l_MaxWindowHeight)
						SET WINDOW RECT:C444($_l_curWindowLeft; $_l_CurWindowTop; $_l_CUrWindowRight; $_l_CurWindowTop+$_l_MaxWindowHeight)
					End if 
				End if 
			End if 
			
		End if 
		//TRACE
		OBJECT SET COORDINATES:C1248(*; "oFiltersBox"; (($_l_CUrWindowRight-$_l_curWindowLeft)-5)-($_l_FiltersWidthRequired); $_l_NavigationCurrentTop+8; ($_l_CUrWindowRight-$_l_curWindowLeft)-5; $_l_RectBottom)
		//OBJECT SET COORDINATES(*;"oFiltersBox";(($_l_CUrWindowRight-$_l_curWindowLeft)-5)-($_l_LabelsWidth+2+$_l_MaxLBWidth+10);$_l_NavigationCurrentTop+8;($_l_CUrWindowRight-$_l_curWindowLeft)-5;$_l_RectBottom)
		//OBJECT SET COORDINATES(*;"oFiltersBox";($_l_CurWindowWidth-5)-$_l_FiltersWidthRequired;$_l_NavigationCurrentTop+8;($_l_CurWindowWidth-5);$_l_RectBottom)
		
		//OBJECT SET COORDINATES(*;"oFiltersBox";(($_l_CUrWindowRight-$_l_curWindowLeft)-$_l_FilterboxFromRIght)-($_l_LabelsWidth+2+$_l_MaxLBWidth+10);$_l_NavigationCurrentTop+8;($_l_CUrWindowRight-$_l_curWindowLeft)-$_l_FilterboxFromRIght);$_l_RectBottom)
		//$_l_FilterboxFromRIght:=$_l_CurWindowWidth-($_l_NavigationRight+5)+$_l_LabelsWidth+2+$_l_MaxLBWidth+10
		//$_l_FilterboxFromBottom:=$_l_CUrWindowHeight-$_l_RectBottom
		
		//this is the size for the rows of the listboxes(above we have counted 18 per header and 5 for spaces between the boxes
		$_l_NumberofRowsAvailable:=$_l_SizeForListBoxes/18  //this is the number of rows of listboxes we can display
		
		ARRAY LONGINT:C221($_al_ListBoxSize; 0)
		ARRAY LONGINT:C221($_al_ListBoxSize; Size of array:C274($_al_LBSizes))  //$_al_LBSizes is the number of rows $_al_ListBoxSize is going to be the calculated size
		ARRAY REAL:C219($_ar_ListBoxPercent; 0)
		ARRAY REAL:C219($_ar_ListBoxPercent; Size of array:C274($_al_LBSizes))  //$_al_LBSizes is the number of rows $_al_ListBoxSize is going to be the calculated size
		
		$_l_MaxSpacePerListbox:=$_l_SizeForListBoxes/$_l_ListboxesToDisplay
		$_l_SpaceBetween:=($_l_ListboxesToDisplay-1)*2
		//TRACE
		$_l_sizesSet:=0
		$_l_SMallestSize:=1
		//Repeat 
		$_l_CalcsizeFrom:=$_l_FiltersBoxHeight-$_l_SizeNotForListbox
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
			: ($_l_LisboxSize>($_l_SizeForListBoxes+$_l_SpaceBetween))
				$_l_Percentage:=($_l_SizeForListBoxes/$_l_LisboxSize)*100
			: ($_l_LisboxSize<($_l_SizeForListBoxes+$_l_SpaceBetween))
				$_l_Percentage:=($_l_SizeForListBoxes/$_l_LisboxSize)*100
				
		End case 
		//$SizeForListbox:=($_l_SizeForListBoxes-(28+$_l_SpaceBetween))/$_l_ListboxesToDisplay
		
		$_l_SizePerListbox:=($_l_SizeForListBoxes-(28+$_l_SpaceBetween))/$_l_ListboxesToDisplay
		
		//$_l_LisboxSize:=$_l_LisboxSize+(Size of array(CUR_At_CurName)*20)+20
		$_l_RemainingLBS:=$_l_ListboxesToDisplay
		$_l_RemainingDropDowns:=$_l_DropDownsToDisplay
		$_l_RemaingingRB:=$_l_RadioButtonstoDisplay
		$_l_SizeForListBoxes:=$_l_FiltersBoxHeight-(($_l_DropDownsToDisplay*(18+5)+($_l_RadioButtonstoDisplay*(18+5))))
		
		//``
		
		
		//````
		
		//APPEND TO ARRAY(LAY_abo_ObjectExists;False)
		//APPEND TO ARRAY(LAY_at_ObjectNamed;"Sales Person")
		If (LAY_bo_FiltersExist)
			
			//this means we have drawn filter objects.
			//we will therfore hide all objects here and show only the ones we want
			If (Size of array:C274(Lay_at_ObjectName)>0)
				For ($_l_Hide; 1; Size of array:C274(Lay_at_ObjectName))
					If (Lay_at_ObjectName{$_l_Hide}#"")
						OBJECT SET VISIBLE:C603(*; Lay_at_ObjectName{$_l_Hide}+"@"; False:C215)
					End if 
				End for 
			End if 
		End if 
		//ARRAY TEXT(Lay_at_ObjectName;0)  //the actual object name created by object duplicate.
		ARRAY LONGINT:C221(Lay_al_ObjectSequence; 0)  //the sequence-this is now used to get the position of the previous object
		//ARRAY TEXT(Lay_at_ObjectName;Size of array($_at_ObjectsToDisplay))  //the actual object name created by object duplicate.
		ARRAY LONGINT:C221(Lay_al_ObjectSequence; Size of array:C274(LAY_at_ObjectNamed))  //the sequence-this is now used to get the position of the previous object
		LAY_bo_FiltersExist:=True:C214  //the order the objects exist in the above array is fluid-the order they are displayed in does not follow the same sequence. so for each displayed item we set the sequential number each time
		//this allows us to get the name of the previous item in the sequence and therefore get its position.
		//we store also the base object name for the item(as created when we duplicate object, This allows to to hide and show the objects.
		//TRACE
		//$_l_Ref:=Find in array(LAY_at_ObjectNamed;$_at_ObjectsToDisplay{$_l_Index})
		//Lay_al_ObjectSequence{$_l_Ref}:=$_l_Index
		$_l_ObjectsWidth:=0
		For ($_l_Index; 1; Size of array:C274($_at_ObjectsToDisplay))
			If ($_l_Index=1)  //this is the first object in the sequence
				$_l_PreviousObjectBottom:=($_l_NextObjectTop-5)+$_l_FiltersBoxTop
				
			Else 
				$_l_PReviousObject:=$_l_Index-1
				$_l_Ref:=Find in array:C230(Lay_al_ObjectSequence; $_l_PReviousObject)
				$_t_objectName:=Lay_at_ObjectName{$_l_Ref}
				Case of 
					: ($_t_objectName="oAccDate")
						$_t_objectName:="oAccDateTo"
					: ($_t_objectName="oAccProfBal")
						
						$_t_objectName:="oAccProfBalCB3"
					: ($_t_objectName="oContractStates")
						$_t_objectName:="oContractStatesCB3"
					: ($_t_objectName="OSIFilter")
						$_t_objectName:="OSIFilterAllocated"
					: ($_t_objectName="oInvoicePaid")
						$_t_objectName:="oInvoicePaidCB3"
					: ($_t_objectName="OcsFilter")
						$_t_objectName:="OcsFilterCB3"
						
				End case 
				//OBJECT DUPLICATE(*;"oFilterCMObject";"oAccDateFrom";->ACC_at_PeriodFromCode)
				//OBJECT DUPLICATE(*;"oFilterCMObject";"oAccDateTo";->ACC_at_PeriodToCode)
				
				
				OBJECT GET COORDINATES:C663(*; $_t_objectName; $_l_LastObjectLeft; $_l_LastObjectTop; $_l_LastObjectRight; $_l_LastObjectBottom)
				$_l_PreviousObjectBottom:=$_l_LastObjectBottom
				
				
			End if 
			$_l_LabelMaxWidth:=$_l_LabelWidth
			
			Case of 
					
					
				: ($_at_ObjectsToDisplay{$_l_Index}="ProfitBalance") | ($_at_ObjectsToDisplay{$_l_Index}="ProfitCheckBoxes")
					
					OBJECT SET VISIBLE:C603(*; "oAccProfBal@"; True:C214)
					OBJECT GET BEST SIZE:C717(*; "oAccProfBalLabel"; $_l_BestWidth; $_l_BestHeight)
					$_l_NextObjectTop:=($_l_PreviousObjectBottom+5)-$_l_FiltersBoxTop
					$_l_oldNextTop:=$_l_NextObjectTop
					$_l_Ref:=Find in array:C230(LAY_at_ObjectNamed; $_at_ObjectsToDisplay{$_l_Index})
					Lay_al_ObjectSequence{$_l_Ref}:=$_l_Index
					
					OBJECT SET COORDINATES:C1248(*; "oAccProfBalLabel"; $_l_AlignLeft; $_l_NextObjectTop; $_l_AlignLeft+$_l_BestWidth; $_l_NextObjectTop+14)
					
					OBJECT GET BEST SIZE:C717(*; "oAccProfBalCB1"; $_l_BestCB1Width; $_l_BestHeight)
					OBJECT GET BEST SIZE:C717(*; "oAccProfBalCB2"; $_l_BestCB2Width; $_l_BestHeight)
					OBJECT GET BEST SIZE:C717(*; "oAccProfBalCB3"; $_l_BestCB3Width; $_l_BestHeight)
					If ($_l_BestCB3Width>$_l_BestCB1Width)  //set to the widest
						$_l_BestCB1Width:=$_l_BestCB3Width
					Else 
						$_l_BestCB3Width:=$_l_BestCB1Width
					End if 
					If ($_l_BestCB3Width>$_l_BestCB2Width)  //set to the widest
						$_l_BestCB2Width:=$_l_BestCB3Width
					Else 
						$_l_BestCB3Width:=$_l_BestCB2Width
						$_l_BestCB1Width:=$_l_BestCB2Width
					End if 
					OBJECT SET COORDINATES:C1248(*; "oAccProfBalCB1"; $_l_AlignLeft+$_l_BestWidth+2; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_AlignLeft+$_l_BestWidth+2+$_l_BestCB1Width; $_l_NextObjectTop+$_l_FiltersBoxTop+14)
					
					OBJECT SET COORDINATES:C1248(*; "oAccProfBalCB2"; $_l_AlignLeft+$_l_BestWidth+$_l_BestCB1Width+2; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_AlignLeft+$_l_BestWidth+2+$_l_BestCB1Width+$_l_BestCB2Width; $_l_NextObjectTop+$_l_FiltersBoxTop+14)
					OBJECT SET COORDINATES:C1248(*; "oAccProfBalCB3"; $_l_AlignLeft+$_l_BestWidth+2+$_l_BestCB1Width+2+$_l_BestCB2Width; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_AlignLeft+$_l_BestWidth+2+$_l_BestCB1Width+2+$_l_BestCB2Width+$_l_BestCB3Width; $_l_NextObjectTop+$_l_FiltersBoxTop+14)
					If ($_l_BestCB3Width>$_l_ObjectsWidth)
						$_l_ObjectsWidth:=$_l_BestCB3Width
					End if 
					
				: ($_at_ObjectsToDisplay{$_l_Index}="Invoice Paid")
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					$_l_CBLeft:=($_l_FiltersBoxRight-6)-$_l_MaxLBWidth  //$_l_FiltersBoxLeft+72
					
					OBJECT SET VISIBLE:C603(*; "oInvoicePaid@"; True:C214)
					$_l_NextObjectTop:=($_l_PreviousObjectBottom+5)-$_l_FiltersBoxTop
					$_l_oldNextTop:=$_l_NextObjectTop
					$_l_Ref:=Find in array:C230(LAY_at_ObjectNamed; $_at_ObjectsToDisplay{$_l_Index})
					Lay_al_ObjectSequence{$_l_Ref}:=$_l_Index
					
					OBJECT GET BEST SIZE:C717(*; "oInvoicePaidLabel"; $_l_BestWidth; $_l_BestHeight)
					OBJECT GET BEST SIZE:C717(*; "oInvoicePaidCB1"; $_l_BestCB1Width; $_l_BestHeight)
					OBJECT GET BEST SIZE:C717(*; "oInvoicePaidCB2"; $_l_BestCB2Width; $_l_BestHeight)
					OBJECT GET BEST SIZE:C717(*; "oInvoicePaidCB3"; $_l_BestCB3Width; $_l_BestHeight)
					If ($_l_BestCB3Width>$_l_BestCB1Width)  //set to the -don't include 1 in this
						//$_l_BestCB1Width:=$_l_BestCB3Width
					Else 
						//$_l_BestCB3Width:=$_l_BestCB1Width
					End if 
					If ($_l_BestCB3Width>$_l_BestCB2Width)  //set to the widest
						$_l_BestCB2Width:=$_l_BestCB3Width
					Else 
						$_l_BestCB3Width:=$_l_BestCB2Width
						$_l_BestCB1Width:=$_l_BestCB2Width
					End if 
					OBJECT SET COORDINATES:C1248(*; "oInvoicePaidLabel"; $_l_AlignLeft; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_CBLeft-5; $_l_NextObjectTop+$_l_FiltersBoxTop+14)
					OBJECT SET COORDINATES:C1248(*; "oInvoicePaidCB1"; $_l_CBLeft; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_CBLeft+$_l_BestCB1Width; $_l_NextObjectTop+$_l_FiltersBoxTop+14)
					$_l_NextLeft:=$_l_CBLeft+$_l_BestCB1Width+5
					If ($_l_NextLeft+$_l_BestCB2Width<$_l_FiltersBoxRight)
						OBJECT SET COORDINATES:C1248(*; "oInvoicePaidCB2"; $_l_NextLeft; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_NextLeft+$_l_BestCB2Width; $_l_NextObjectTop+$_l_FiltersBoxTop+14)
						$_l_NextLeft:=$_l_NextLeft+$_l_BestCB2Width+5
					Else 
						$_l_NextObjectTop:=$_l_NextObjectTop+14+5
						OBJECT SET COORDINATES:C1248(*; "oInvoicePaidCB2"; $_l_CBLeft; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_CBLeft+$_l_BestCB2Width; $_l_NextObjectTop+$_l_FiltersBoxTop+14)
						$_l_NextLeft:=$_l_CBLeft+$_l_BestCB2Width+5
					End if 
					If ($_l_NextLeft+$_l_BestCB3Width<$_l_FiltersBoxRight)
						OBJECT SET COORDINATES:C1248(*; "oInvoicePaidCB3"; $_l_NextLeft; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_NextLeft+$_l_BestCB3Width; $_l_NextObjectTop+$_l_FiltersBoxTop+14)
					Else 
						$_l_NextLeft:=$_l_NextLeft-($_l_BestCB2Width+5)
						$_l_NextObjectTop:=$_l_NextObjectTop+14+5
						OBJECT SET COORDINATES:C1248(*; "oInvoicePaidCB3"; $_l_NextLeft; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_NextLeft+$_l_BestCB3Width; $_l_NextObjectTop+$_l_FiltersBoxTop+14)
						$_l_NextLeft:=$_l_CBLeft+$_l_BestCB2Width+5
					End if 
					
					//OBJECT SET COORDINATES(*;"oInvoicePaidCB3";$_l_AlignLeft+$_l_BestWidth+2;$_l_NextObjectTop+$_l_FiltersBoxTop;$_l_AlignLeft+$_l_BestWidth+2+$_l_BestCB3Width;$_l_NextObjectTop+$_l_FiltersBoxTop+14)
					If ($_l_BestCB3Width>$_l_ObjectsWidth)
						$_l_ObjectsWidth:=$_l_BestCB3Width
					End if 
					
				: ($_at_ObjectsToDisplay{$_l_Index}="Filter Zeros")
					OBJECT SET VISIBLE:C603(*; "OcsFilterZeros@"; True:C214)
					OBJECT GET BEST SIZE:C717(*; "OcsFilterZeros"; $_l_BestWidth; $_l_BestHeight)
					$_l_NextObjectTop:=($_l_PreviousObjectBottom+5)-$_l_FiltersBoxTop
					$_l_oldNextTop:=$_l_NextObjectTop
					$_l_Ref:=Find in array:C230(LAY_at_ObjectNamed; $_at_ObjectsToDisplay{$_l_Index})
					Lay_al_ObjectSequence{$_l_Ref}:=$_l_Index
					
					OBJECT SET COORDINATES:C1248(*; "OcsFilterZeros"; $_l_ScrollBoxLeft; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_ScrollBoxLeft+$_l_BestWidth; $_l_FiltersBoxTop+$_l_NextObjectTop+$_l_BestHeight)
					If ($_l_BestWidth>$_l_ObjectsWidth)
						$_l_ObjectsWidth:=$_l_BestWidth
					End if 
					
				: ($_at_ObjectsToDisplay{$_l_Index}="Filter Done")
					////
					
					///
					OBJECT SET VISIBLE:C603(*; "oDoneFilter@"; True:C214)
					
					OBJECT GET BEST SIZE:C717(*; "oDoneFilter"; $_l_BestWidth; $_l_BestHeight)
					
					
					$_l_NextObjectTop:=($_l_PreviousObjectBottom+5)-$_l_FiltersBoxTop
					$_l_oldNextTop:=$_l_NextObjectTop
					$_l_Ref:=Find in array:C230(LAY_at_ObjectNamed; "Filter Done")
					Lay_al_ObjectSequence{$_l_Ref}:=$_l_Index
					
					
					OBJECT SET COORDINATES:C1248(*; "oDoneFilter"; $_l_ScrollBoxLeft; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_ScrollBoxLeft+$_l_BestWidth; $_l_FiltersBoxTop+$_l_NextObjectTop+$_l_BestHeight)
					$_l_NextObjectTop:=$_l_NextObjectTop+$_l_BestHeight+5
					
				: ($_at_ObjectsToDisplay{$_l_Index}="OSIFilter Zeros")
					OBJECT SET VISIBLE:C603(*; "OSIFilterZeros@"; True:C214)
					OBJECT SET VISIBLE:C603(*; "OSIFilterAllocated@"; True:C214)
					OBJECT GET BEST SIZE:C717(*; "OSIFilterAllocated"; $_l_BestWidth; $_l_BestHeight)
					
					OBJECT GET BEST SIZE:C717(*; "OSIFilterZeros"; $_l_BestWidth; $_l_BestHeight)
					$_l_NextObjectTop:=($_l_PreviousObjectBottom+5)-$_l_FiltersBoxTop
					$_l_oldNextTop:=$_l_NextObjectTop
					$_l_Ref:=Find in array:C230(LAY_at_ObjectNamed; "OSIFilter Zeros")
					Lay_al_ObjectSequence{$_l_Ref}:=$_l_Index
					
					
					OBJECT SET COORDINATES:C1248(*; "OSiFilterZeros"; $_l_ScrollBoxLeft; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_ScrollBoxLeft+$_l_BestWidth; $_l_FiltersBoxTop+$_l_NextObjectTop+$_l_BestHeight)
					$_l_NextObjectTop:=$_l_NextObjectTop+$_l_BestHeight+5
					OBJECT GET BEST SIZE:C717(*; "OSIFilterAllocated"; $_l_BestWidth; $_l_BestHeight)
					OBJECT SET COORDINATES:C1248(*; "OSIFilterAllocated"; $_l_ScrollBoxLeft; $_l_NextObjectTop+$_l_FiltersBoxTop; $_l_ScrollBoxLeft+$_l_BestWidth; $_l_FiltersBoxTop+$_l_NextObjectTop+$_l_BestHeight)
					If ($_l_BestWidth>$_l_ObjectsWidth)
						$_l_ObjectsWidth:=$_l_BestWidth
					End if 
				: ($_at_ObjectsToDisplay{$_l_Index}="Contract States")
					
					$_l_Ref:=Find in array:C230(LAY_at_ObjectNamed; $_at_ObjectsToDisplay{$_l_Index})
					Lay_al_ObjectSequence{$_l_Ref}:=$_l_Index
					
					OBJECT SET VISIBLE:C603(*; "oContractStates@"; True:C214)
					OBJECT GET BEST SIZE:C717(*; "oContractStatesLabel"; $_l_BestWidth; $_l_BestHeight)
					If ($_l_BestWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_BestWidth
					End if 
					$_l_NextObjectTop:=($_l_PreviousObjectBottom+5)-$_l_FiltersBoxTop
					$_l_oldNextTop:=$_l_NextObjectTop
					OBJECT SET COORDINATES:C1248(*; "oContractStatesLabel"; $_l_AlignLeft; $_l_NextObjectTop; $_l_AlignLeft+$_l_BestWidth; $_l_NextObjectTop+14)
					OBJECT SET COORDINATES:C1248(*; "oContractStatesCB1"; $_l_AlignLeft+$_l_BestWidth+2; $_l_NextObjectTop; $_l_AlignLeft+$_l_BestWidth+2+47; $_l_NextObjectTop+14)
					$_l_NextObjectTop:=$_l_NextObjectTop+18+2
					OBJECT SET COORDINATES:C1248(*; "oContractStatesCB2"; $_l_AlignLeft+$_l_BestWidth+49+2; $_l_NextObjectTop; $_l_AlignLeft+$_l_BestWidth+2+49+89; $_l_NextObjectTop+14)
					OBJECT SET COORDINATES:C1248(*; "oContractStatesCB3"; $_l_AlignLeft+$_l_BestWidth+2+49+91; $_l_NextObjectTop; $_l_AlignLeft+$_l_BestWidth+2+49+91+91; $_l_NextObjectTop+14)
					$_l_NextObjectTop:=$_l_NextObjectTop+18+5
					If ((($_l_AlignLeft+$_l_BestWidth+2+49+91+91)-($_l_AlignLeft+$_l_BestWidth+49+2))>$_l_ObjectsWidth)
						$_l_ObjectsWidth:=(($_l_AlignLeft+$_l_BestWidth+2+49+91+91)-($_l_AlignLeft+$_l_BestWidth+49+2))
					End if 
				: ($_at_ObjectsToDisplay{$_l_Index}="CoAddressTypes")
					
					$_l_Ref:=Find in array:C230(LAY_at_ObjectNamed; $_at_ObjectsToDisplay{$_l_Index})
					Lay_al_ObjectSequence{$_l_Ref}:=$_l_Index
					
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					$_l_FiltersBoxWidth:=$_l_FiltersBoxRight-$_l_FiltersBoxLeft
					$_l_CheckBoxLeft:=($_l_FiltersBoxRight-6)-$_l_MaxLBWidth  //$_l_FiltersBoxLeft+72
					
					OBJECT SET VISIBLE:C603(*; "oCoTypes@"; True:C214)
					OBJECT GET BEST SIZE:C717(*; "oCoTypesLabel"; $_l_BestWidth; $_l_BestHeight)
					$_l_NextObjectTop:=($_l_PreviousObjectBottom+5)-$_l_FiltersBoxTop
					$_l_oldNextTop:=$_l_NextObjectTop
					$_l_Offset:=$_l_NextObjectTop
					OBJECT SET COORDINATES:C1248(*; "oCoTypesLabel"; ($_l_FiltersBoxLeft+5); $_l_FiltersBoxTop+$_l_NextObjectTop; $_l_CheckBoxLeft-5; $_l_FiltersBoxTop+$_l_NextObjectTop+14)
					$_l_LabelWidth:=(($_l_ScrollBoxLeft-5)-(($_l_ScrollBoxLeft-5)-$_l_BestWidth))
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_MaxWidthCBS:=$_l_FiltersBoxRight-($_l_ScrollBoxLeft)
					OBJECT GET BEST SIZE:C717(*; "oCoTypesCB4"; $_l_BestWidth; $_l_BestHeight)
					OBJECT GET BEST SIZE:C717(*; "oCoTypesCB5"; $_l_BestWidth2; $_l_BestHeight)
					
					If ($_l_BestWidth+$_l_BestWidth2>$_l_MaxWidthCBS)
						//TRACE
					End if 
					OBJECT SET COORDINATES:C1248(*; "oCoTypesCB4"; ($_l_CheckBoxLeft); $_l_FiltersBoxTop+$_l_NextObjectTop; $_l_CheckBoxLeft+$_l_BestWidth; $_l_FiltersBoxTop+$_l_NextObjectTop+14)
					$_l_NextObjectLeft:=$_l_CheckBoxLeft+$_l_BestWidth+5
					OBJECT SET COORDINATES:C1248(*; "oCoTypesCB5"; $_l_NextObjectLeft; $_l_FiltersBoxTop+$_l_NextObjectTop; $_l_NextObjectLeft+$_l_BestWidth2; $_l_FiltersBoxTop+$_l_NextObjectTop+14)
					$_l_OldNextObjectLeft:=$_l_NextObjectLeft
					$_l_NextObjectLeft:=$_l_NextObjectLeft+$_l_BestWidth+5
					//TRACE  //$_l_NextObjectTop:=$_l_NextObjectTop+
					OBJECT GET BEST SIZE:C717(*; "oCoTypesCB6"; $_l_BestWidth; $_l_BestHeight)
					If (($_l_FiltersBoxRight-$_l_BestWidth)<($_l_CheckBoxLeft+$_l_BestWidth2))
						
						OBJECT SET COORDINATES:C1248(*; "oCoTypesCB6"; ($_l_NextObjectLeft+$_l_BestWidth2)+2; $_l_FiltersBoxTop+$_l_NextObjectTop; (($_l_NextObjectLeft+$_l_BestWidth2)+2)+$_l_BestWidth; $_l_FiltersBoxTop+$_l_NextObjectTop+14)
						
					Else 
						$_l_NextObjectTop:=$_l_NextObjectTop+6+14
						OBJECT SET COORDINATES:C1248(*; "oCoTypesCB6"; ($_l_OldNextObjectLeft); $_l_FiltersBoxTop+$_l_NextObjectTop; $_l_OldNextObjectLeft+$_l_BestWidth; $_l_FiltersBoxTop+$_l_NextObjectTop+14)
					End if 
					
				: ($_at_ObjectsToDisplay{$_l_Index}="Periods")
					$_l_Ref:=Find in array:C230(LAY_at_ObjectNamed; $_at_ObjectsToDisplay{$_l_Index})
					Lay_al_ObjectSequence{$_l_Ref}:=$_l_Index
					
					$_l_NextObjectTop:=($_l_PreviousObjectBottom+5)-$_l_FiltersBoxTop
					$_l_oldNextTop:=$_l_NextObjectTop
					
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
					$_l_NextObjectTop:=DB_SetFilterObject($_l_NextObjectTop; 18; "oAccDateFrom"; $_l_MaxLBWidth; ->$_l_LabelWidth)+5
					OBJECT GET COORDINATES:C663(*; "oAccDateFrom"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					OBJECT SET COORDINATES:C1248(*; "oAccDateFrom"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight-21; $_l_ObjectBottom)
					$_l_ObjectRight:=$_l_ObjectRight-19
					OBJECT SET COORDINATES:C1248(*; "oAccDateFromBox"; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectRight+21; $_l_ObjectBottom)
					OBJECT SET COORDINATES:C1248(*; "oAccDateFromContextualPeriods"; $_l_ObjectRight; $_l_ObjectTop+1; $_l_ObjectRight+18; $_l_ObjectBottom+1)
					$_l_NextObjectTop:=(($_l_ObjectBottom+1)+5)-$_l_FiltersBoxTop
					$_l_NextObjectTop:=DB_SetFilterObject($_l_NextObjectTop; 18; "oAccDateTo"; $_l_MaxLBWidth; ->$_l_LabelWidth)+5
					OBJECT GET COORDINATES:C663(*; "oAccDateTo"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					OBJECT SET COORDINATES:C1248(*; "oAccDateTo"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight-21; $_l_ObjectBottom)
					$_l_ObjectRight:=$_l_ObjectRight-19
					OBJECT SET COORDINATES:C1248(*; "oAccDateToBox"; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectRight+21; $_l_ObjectBottom)
					OBJECT SET COORDINATES:C1248(*; "oAccDateToContextualPeriods"; $_l_ObjectRight; $_l_ObjectTop+1; $_l_ObjectRight+18; $_l_ObjectBottom+1)
					$_l_NextObjectTop:=(($_l_ObjectBottom+1)+5)-$_l_FiltersBoxTop
					$_l_RemainingDropDowns:=$_l_RemainingDropDowns-1
				Else   //listbox area
					
					OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
					//$_l_ScrollBoxLeft:=($_l_FiltersBoxRight-6)-$_l_MaxLBWidth  //$_l_FiltersBoxLeft+72
					
					$_l_Ref:=Find in array:C230(LAY_at_ObjectNamed; $_at_ObjectsToDisplay{$_l_Index})
					Lay_al_ObjectSequence{$_l_Ref}:=$_l_Index
					OBJECT SET VISIBLE:C603(*; Lay_at_ObjectName{$_l_Ref}+"@"; True:C214)
					$_l_Element:=Size of array:C274($_al_ListBoxSize)-($_l_RemainingLBS-1)
					$_l_NextObjectTop:=($_l_PreviousObjectBottom+5)-$_l_FiltersBoxTop
					$_l_oldNextTop:=$_l_NextObjectTop
					$_l_NextObjectTop:=DB_SetFilterObject($_l_NextObjectTop; $_al_ListBoxSize{$_l_Element}-5; Lay_at_ObjectName{$_l_Ref}; $_l_MaxLBWidth; ->$_l_LabelWidth)+10
					If ($_l_LabelWidth>$_l_LabelMaxWidth)
						$_l_LabelMaxWidth:=$_l_LabelWidth
					End if 
					$_l_RemainingLBS:=$_l_RemainingLBS-1
					OBJECT GET COORDINATES:C663(*; Lay_at_ObjectName{$_l_Ref}; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
					If ($_l_LBBoxBottom#($_l_FiltersBoxTop+$_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						OBJECT SET COORDINATES:C1248(*; Lay_at_ObjectName{$_l_Ref}; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_FiltersBoxTop+($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}-5)))
						$_l_NextObjectTop:=($_l_oldNextTop+($_al_ListBoxSize{$_l_Element}))-($_l_FiltersBoxTop-20)
						OBJECT GET COORDINATES:C663(*; Lay_at_ObjectName{$_l_Ref}; $_l_LbBoxLeft; $_l_LbBoxTop; $_l_LBBoxRight; $_l_LBBoxBottom)
						
					Else 
					End if 
					$_l_ListboxHeight:=$_l_LBBoxBottom-$_l_LbBoxTop
					
					$_l_RowCount:=LISTBOX Get number of rows:C915(*; Lay_at_ObjectName{$_l_Ref})
					$_l_TotalHeight:=(LISTBOX Get row height:C1408(*; Lay_at_ObjectName{$_l_Ref}; 1)*$_l_RowCount)+LISTBOX Get headers height:C1144(*; Lay_at_ObjectName{$_l_Ref})
					If ($_l_TotalHeight<$_l_ListboxHeight)
						LB_SetScrollByObjectName(Lay_at_ObjectName{$_l_Ref}; -3; -3)
					Else 
						LB_SetScrollByObjectName(Lay_at_ObjectName{$_l_Ref}; -3; -2)
					End if 
					
					
					
					
					
			End case 
		End for 
		// /$_l_FiltersWidthRequired:=$_l_LabelsWidth+5+$_l_ObjectsWidth
		
		//here we can resize the list box group area and the other objects
		OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
		$_l_NewFiltersLeft:=$_l_FiltersBoxRight-$_l_FiltersWidthRequired
		
		OBJECT SET COORDINATES:C1248(*; "oFiltersBox"; $_l_NewFiltersLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
		OBJECT SET VISIBLE:C603(*; "oFilterNames"; True:C214)
		OBJECT SET COORDINATES:C1248(*; "oFilterNames"; ($_l_FiltersBoxLeft+5); $_l_FiltersBoxTop+18; $_l_FiltersBoxRight-5; $_l_FiltersBoxTop+14+18)
		// /
		OBJECT GET COORDINATES:C663(*; "oNavigator"; $_l_NavigatorLeft; $_l_NavigatorTop; $_l_NavigatorRight; $_l_NavigatorBottom)
		OBJECT SET COORDINATES:C1248(*; "oNavigator"; $_l_NavigationLeft; $_l_FiltersBoxTop-18; $_l_NewFiltersLeft-5; $_l_FiltersBoxBottom)
		//TRACE
		If (DB_bo_DisplayStats)
			//Get object
			
			
			OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputForm"; $_l_areaLeft; $_l_FiltersBoxTop+10; $_l_NewFiltersLeft-10; $_l_AreaBottom)
			
			OBJECT GET COORDINATES:C663(*; "oListboxOutputArrays"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputArrays"; $_l_areaLeft; $_l_FiltersBoxTop+10; $_l_NewFiltersLeft-10; $_l_AreaBottom)
			
			OBJECT GET COORDINATES:C663(*; "oStatsColumnBreakDown"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
			OBJECT SET COORDINATES:C1248(*; "oStatsColumnBreakDown"; $_l_areaLeft; $_l_areaTop; $_l_NewFiltersLeft-5; $_l_AreaBottom)
			
			
			
			OBJECT GET COORDINATES:C663(*; "oStatsListbox1"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
			OBJECT SET COORDINATES:C1248(*; "oStatsListbox1"; $_l_areaLeft; $_l_FiltersBoxTop+10; $_l_NewFiltersLeft-5; $_l_AreaBottom)
			OBJECT GET COORDINATES:C663(*; "oStatsListbox"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
			OBJECT SET COORDINATES:C1248(*; "oStatsListbox"; $_l_areaLeft; $_l_areaTop; $_l_NewFiltersLeft-5; $_l_AreaBottom)
			
			OBJECT GET COORDINATES:C663(*; "oStatsListbox2"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
			OBJECT SET COORDINATES:C1248(*; "oStatsListbox2"; $_l_areaLeft; $_l_areaTop; $_l_NewFiltersLeft-5; $_l_AreaBottom)
			
			
			//MOVE OBJECT(*;"oStatsColumnBreakDown";$_l_ListBoxLeft+5;$_l_ListingPositionBottom+5;$_l_ListBoxLeft+5+$_l_StatsBreakDownWidth;$_l_ListingPositionBottom+5+$_l_StatsBreakDownHeight;*)
		Else 
			OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
			If (($_l_FiltersBoxTop+10)#$_l_areaTop) | (($_l_NewFiltersLeft-10)#$_l_areaRight)
				If ($_l_FiltersBoxBottom#0)
					OBJECT SET COORDINATES:C1248(*; "oListboxOutputForm"; $_l_areaLeft; $_l_FiltersBoxTop+10; $_l_NewFiltersLeft-10; $_l_FiltersBoxBottom)
				Else 
					OBJECT SET COORDINATES:C1248(*; "oListboxOutputForm"; $_l_areaLeft; $_l_FiltersBoxTop+10; $_l_NewFiltersLeft-10; $_l_AreaBottom)
					
				End if 
			End if 
			OBJECT GET COORDINATES:C663(*; "oListboxOutputArrays"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
			If (($_l_FiltersBoxTop+10)#$_l_areaTop) | (($_l_NewFiltersLeft-10)#$_l_areaRight)
				If ($_l_FiltersBoxBottom#0)
					OBJECT SET COORDINATES:C1248(*; "oListboxOutputArrays"; $_l_areaLeft; $_l_FiltersBoxTop+10; $_l_NewFiltersLeft-10; $_l_FiltersBoxBottom)
				Else 
					OBJECT SET COORDINATES:C1248(*; "oListboxOutputArrays"; $_l_areaLeft; $_l_FiltersBoxTop+10; $_l_NewFiltersLeft-10; $_l_AreaBottom)
					
				End if 
			End if 
		End if 
		
		// /
		DB_bo_FiltersActivated:=True:C214  //this is set so we know that arrays are inited. if we change views with filters hidden the arrays for that view wont be set until we go to view filters
		
		
		If (DB_bo_DisplaySelections)
			OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_areaLeft; $_l_areaTop; $_l_areaRight; $_l_AreaBottom)
			$_l_SetManagerRight:=$_l_ListBoxLeft-5
			OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_SelectionLBLeft; $_l_SelectionLBTop; $_l_SelectionLBRight; $_l_SelectionLBBottom)
			OBJECT SET COORDINATES:C1248(*; "oSelectionsGroupBox"; 3; $_l_FiltersBoxTop; $_l_SetManagerRight; $_l_RectBottom-5)
			OBJECT SET COORDINATES:C1248(*; "oSelectionsListbox"; 8; $_l_FiltersBoxTop+18; $_l_SetManagerRight-5; $_l_RectBottom-(5+23))
		End if 
		
	Else 
		If (LAY_bo_FiltersExist)
			//this means we have drawn filter objects.
			//we will therfore hide all objects here and show only the ones we want
			If (Size of array:C274(Lay_at_ObjectName)>0)
				For ($_l_Hide; 1; Size of array:C274(Lay_at_ObjectName))
					If (Lay_at_ObjectName{$_l_Hide}#"")
						OBJECT SET VISIBLE:C603(*; Lay_at_ObjectName{$_l_Hide}+"@"; False:C215)
					End if 
				End for 
			End if 
		End if 
		
		
		OBJECT GET COORDINATES:C663(*; "oNavigator"; $_l_NavigationCurrentLeft; $_l_NavigationCurrentTop; $_l_NavigationCurrentRight; $_l_NavigationCurrentBottom)
		OBJECT SET COORDINATES:C1248(*; "oNavigator"; $_l_NavigationLeft; $_l_NavigationCurrentTop; $_l_NavigationRight; $_l_RectBottom)
		
		If (DB_bo_ShowArrayBased)
			OBJECT GET COORDINATES:C663(*; "oListboxOutputArrays"; $_l_ListingPositionLeft; $_l_ListingPositionTop; $_l_ListingPositionRight; $_l_ListingPositionBottom)
		Else 
			OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_ListingPositionLeft; $_l_ListingPositionTop; $_l_ListingPositionRight; $_l_ListingPositionBottom)
		End if 
		If ($_l_ListingPositionTop<($_l_NavigationCurrentTop+30))
			$_l_ListingPositionTop:=$_l_NavigationCurrentTop+30
		End if 
		//$_l_CurWindowHeight
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		OBJECT GET COORDINATES:C663(*; "oButtonAccept"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		If ($_l_ListingPositionBottom>($_l_ButtonTop-10))
			$_l_ListingPositionBottom:=($_l_ButtonTop-10)
			$_l_RectBottom:=($_l_ButtonTop-10)
		End if 
		
		If (DB_bo_DisplayStats)
			//Get object-
			// /////
			//........../
			$_l_HeightForStatsBox1:=Size of array:C274(aSVN1)*14
			If ($_l_HeightForStatsBox1<14)
				$_l_HeightForStatsBox1:=14
			End if 
			
			$_l_ListingPositionHeight:=($_l_RectBottom-5)-$_l_ListingPositionTop
			$_l_ListingPositionBottom:=$_l_ListingPositionHeight/2
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputForm"; $_l_ListBoxLeft; $_l_ListingPositionTop; $_l_ListBoxAreaRight; $_l_ListingPositionTop+$_l_ListingPositionBottom-5)
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputArrays"; $_l_ListBoxLeft; $_l_ListingPositionTop; $_l_ListBoxAreaRight; $_l_ListingPositionTop+$_l_ListingPositionBottom-5)
			OBJECT GET COORDINATES:C663(*; "oStatsColumnBreakDown"; $_l_StatsBreakDownLeft; $_l_StatsBreakDownTop; $_l_StatsBreakDownRight; $_l_StatsBreakDownBottom)
			$_l_StatsBreakDownWidth:=$_l_StatsBreakDownRight-$_l_StatsBreakDownLeft
			$_l_StatsBreakDownHeight:=$_l_StatsBreakDownBottom-$_l_StatsBreakDownTop
			//MOVE OBJECT(*;"oStatsColumnBreakDown";$_l_ListBoxLeft+5;$_l_ListingPositionTop+$_l_ListingPositionBottom+5;$_l_ListBoxLeft+5+$_l_StatsBreakDownWidth;$_l_ListingPositionTop+$_l_ListingPositionBottom+5+$_l_StatsBreakDownHeight;*)
			$_l_BottomofStatsBoxCalc:=$_l_ListingPositionTop+$_l_ListingPositionBottom+5+$_l_StatsBreakDownHeight+5
			$_l_TopofStatsBoxCalc:=(($_l_RectBottom-5)-12)
			
			If ($_l_HeightForStatsBox1>-($_l_TopofStatsBoxCalc-$_l_BottomofStatsBoxCalc))
				
				
				
				$_l_HeightForStatsBox1:=(($_l_RectBottom-5)-12)-($_l_ListingPositionTop+$_l_ListingPositionBottom+5+$_l_StatsBreakDownHeight+5)
			End if 
			If ($_l_HeightForStatsBox1<20)
				LB_SetScroll(->COM_lb_stats; -3; -3)
			End if 
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputForm"; $_l_ListBoxLeft; $_l_ListingPositionTop; $_l_ListBoxAreaRight; $_l_ListingPositionTop+$_l_ListingPositionHeight-($_l_HeightForStatsBox1+28+15))
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputArrays"; $_l_ListBoxLeft; $_l_ListingPositionTop; $_l_ListBoxAreaRight; $_l_ListingPositionTop+$_l_ListingPositionHeight-($_l_HeightForStatsBox1+28+15))
			$_l_TopofStatsBox:=(($_l_RectBottom-5)-14)-$_l_HeightForStatsBox1
			OBJECT SET VISIBLE:C603(*; "oStats@"; True:C214)
			
			OBJECT SET COORDINATES:C1248(*; "oStatsListbox1"; $_l_ListBoxLeft; ($_l_TopofStatsBox-14); $_l_ListBoxAreaRight; $_l_TopofStatsBox)
			OBJECT SET COORDINATES:C1248(*; "oStatsListbox"; $_l_ListBoxLeft; $_l_TopofStatsBox; $_l_ListBoxAreaRight; ($_l_RectBottom-5)-14)
			OBJECT SET COORDINATES:C1248(*; "oStatsListbox2"; $_l_ListBoxLeft; ($_l_RectBottom-5)-14; $_l_ListBoxAreaRight; $_l_RectBottom-5)
			
			
		Else 
			OBJECT SET VISIBLE:C603(*; "oStats@"; False:C215)
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputForm"; $_l_ListBoxLeft; $_l_ListingPositionTop; $_l_ListBoxAreaRight; $_l_RectBottom-5)
			OBJECT SET COORDINATES:C1248(*; "oListboxOutputArrays"; $_l_ListBoxLeft; $_l_ListingPositionTop; $_l_ListBoxAreaRight; $_l_RectBottom-5)
			
		End if 
	End if 
	OBJECT SET COORDINATES:C1248(*; "oinSheen@"; 0; $_l_NavigationCurrentTop; $_l_NewFormWidth; $_l_RectBottom)
	OBJECT SET COORDINATES:C1248(*; "oWhiteness"; 0; $_l_RectBottom; $_l_NewFormWidth; $_l_NewWIndowHeight)
	If (DB_bo_DisplaySelections)
		$_l_SetManagerRight:=$_l_ListBoxLeft-5
		OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_SelectionLBLeft; $_l_SelectionLBTop; $_l_SelectionLBRight; $_l_SelectionLBBottom)
		OBJECT SET COORDINATES:C1248(*; "oSelectionsGroupBox"; 3; $_l_ListingPositionTop-23; $_l_SetManagerRight; $_l_RectBottom-5)
		OBJECT SET COORDINATES:C1248(*; "oSelectionsListbox"; 8; $_l_ListingPositionTop; $_l_SetManagerRight-5; $_l_RectBottom-(5+23))
		$_l_SetManagerBottomCalc:=$_l_RectBottom-8
		$_l_SetManagerTopCalc:=$_l_SetManagerBottomCalc-14
		$_l_SetManagerTopCalc2:=$_l_SetManagerTopCalc-7
		OBJECT GET COORDINATES:C663(*; "oSelectionsAdd1"; $_l_aObjectLeft; $_l_aObjectTop; $_l_aObjectRight; $_l_aObjectBottom)
		OBJECT SET COORDINATES:C1248(*; "oSelectionsAdd1"; $_l_aObjectLeft; $_l_SetManagerTopCalc; $_l_aObjectRight; $_l_SetManagerBottomCalc)
		OBJECT GET COORDINATES:C663(*; "oSelectionsdel"; $_l_aObjectLeft; $_l_aObjectTop; $_l_aObjectRight; $_l_aObjectBottom)
		OBJECT SET COORDINATES:C1248(*; "oSelectionsdel"; $_l_aObjectLeft; $_l_SetManagerTopCalc; $_l_aObjectRight; $_l_SetManagerBottomCalc)
		OBJECT GET COORDINATES:C663(*; "oSelectionsAccess"; $_l_aObjectLeft; $_l_aObjectTop; $_l_aObjectRight; $_l_aObjectBottom)
		OBJECT SET COORDINATES:C1248(*; "oSelectionsAccess"; $_l_aObjectLeft; $_l_SetManagerTopCalc; $_l_aObjectRight; $_l_SetManagerBottomCalc)
		
		OBJECT GET COORDINATES:C663(*; "oSelectionsconfig"; $_l_aObjectLeft; $_l_aObjectTop; $_l_aObjectRight; $_l_aObjectBottom)
		OBJECT SET COORDINATES:C1248(*; "oSelectionsconfig"; $_l_aObjectLeft; $_l_SetManagerTopCalc; $_l_aObjectRight; $_l_SetManagerBottomCalc)
		OBJECT GET COORDINATES:C663(*; "oSelectionsshareBox"; $_l_aObjectLeft; $_l_aObjectTop; $_l_aObjectRight; $_l_aObjectBottom)
		OBJECT SET COORDINATES:C1248(*; "oSelectionsshareBox"; $_l_aObjectLeft; $_l_SetManagerBottomCalc-11; $_l_aObjectRight; $_l_SetManagerBottomCalc)
		OBJECT GET COORDINATES:C663(*; "oSelectionsOptions"; $_l_aObjectLeft; $_l_aObjectTop; $_l_aObjectRight; $_l_aObjectBottom)
		OBJECT SET COORDINATES:C1248(*; "oSelectionsOptions"; $_l_aObjectLeft; $_l_SetManagerTopCalc2; $_l_aObjectRight; $_l_SetManagerTopCalc2+22)
	End if 
	
End if 
DB_bo_InOutputFilters:=False:C215
ERR_MethodTrackerReturn("DB_SetOutPutFilters"; $_t_OldMethodName)