//%attributes = {}

If (False:C215)
	//Database Method Name:      temp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LAY_abo_ObjectExists;0)
	ARRAY LONGINT:C221($_al_LBSizes; 0)
	ARRAY TEXT:C222($_at_ObjectsToDisplay; 0)
	//ARRAY TEXT(Lay_at_ObjectName;0)
	//ARRAY TEXT(LAY_at_ObjectNamed;0)
	C_BOOLEAN:C305($_bo_DisplayCollections; $_bo_DisplayContractTypes; $_bo_DisplayCreditStages; $_bo_DisplayCurrencies; $_bo_DisplayLayers; $_bo_DisplayLocations; $_bo_DisplayMovementTypes; $_bo_DisplayProdBrands; $_bo_DisplaySalesPersons; $_bo_DisplaySalesSources; $_bo_DisplayStates)
	C_BOOLEAN:C305($_bo_DisplayStockTypes)
	C_LONGINT:C283($_l_analysesWidth; $_l_BrandsWidth; $_l_CollectionsWidth; $_l_ContractTypesWidth; $_l_CRStagesWidth; $_l_CurrenciesTotalWidth; $_l_GroupsWidth; $_l_HeadingsWidth; $_l_LayersWidth; $_l_LisboxSize; $_l_ListboxesToDisplay)
	C_LONGINT:C283($_l_LocationsWidth; $_l_MaxLBWidth; $_l_MovementTypeWidths; $_l_MoveTypesWidth; $_l_RecordStatesWidth; $_l_RolesWidth; $_l_StockTypeWidth)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("temp")
$_l_LayersWidth:=DB_SetoutFilterLayers(->[ACCOUNTS_LAYERS:156]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayLayers; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
$_l_CurrenciesTotalWidth:=DB_SetoutFilterCurrencies(->[ACCOUNT_BALANCES:34]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCurrencies; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
$_l_RolesWidth:=DB_SetOutFIlterRoles(->[CONTACTS:1]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesPersons; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
$_l_HeadingsWidth:=DB_SetOutputFilterHeadings(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesSources; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
$_l_GroupsWidth:=DB_SetOutFilterGroups(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplaySalesSources; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
$_l_BrandsWidth:=DB_SetOutFIlterBrands(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayProdBrands; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
$_l_CollectionsWidth:=DB_setOutFilterCollections(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCollections; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
$_l_RecordStatesWidth:=DB_SetOutFilterRecordStates(->[ORDERS:24]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayStates; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
$_l_ContractTypesWidth:=DB_SetOutFilterContractTypes(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayContractTypes; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
$_l_LocationsWidth:=DB_SetoutfilterLocations(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayLocations; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
$_l_CRStagesWidth:=DB_SetoutfilterCreditStages(->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayCreditStages; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
$_l_MovementTypeWidths:=DB_SetOutFilterMoveTypes(->[STOCK_MOVEMENT_ITEMS:27]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayMovementTypes; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
$_l_StockTypeWidth:=DB_SetOutFilterStockTypes(->[STOCK_MOVEMENT_ITEMS:27]; ->LAY_at_ObjectNamed; ->LAY_abo_ObjectExists; ->Lay_at_ObjectName; ->$_at_ObjectsToDisplay; ->$_bo_DisplayStockTypes; ->$_l_MaxLBWidth; ->$_l_ListboxesToDisplay; ->$_l_LisboxSize; ->$_al_LBSizes)
ERR_MethodTrackerReturn("temp"; $_t_oldMethodName)