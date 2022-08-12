If (False:C215)
	//object Name: [USER]STK_LocationsEditor.oButtonEditSub10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 09:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY LONGINT:C221($_al_ProductIDS; 0)
	ARRAY LONGINT:C221($_al_ProductsXID; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(STK_at_RelProdCodes;0)
	//ARRAY TEXT(STK_at_RelProdNames;0)
	C_BOOLEAN:C305(STK_bo_ProductFound)
	C_LONGINT:C283($_l_CurrentLevel; $_l_FillArray; $_l_HeaderLevel; $_l_Index; $_l_NextLevel; $_l_NextLevelHeader; $_l_oBottom; $_l_oLeft; $_l_oRight; $_l_oTop; $_l_ProductID)
	C_LONGINT:C283($_l_ProductPosition; $_l_ProductsCount; $_l_SelectedRow; $_l_SizeofArray; $_l_ThisLocationID; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; STK_l_Subid; xNext)
	C_POINTER:C301($_Ptr_addProductButton; $_Ptr_addSubLevelButton; $_ptr_Array10; $_ptr_Array2; $_ptr_Array4; $_ptr_Array5; $_ptr_Array6; $_ptr_Array7; $_ptr_Array8; $_ptr_Array9; $_ptr_CurrentLocation)
	C_POINTER:C301($_ptr_CurrentLocationCode; $_ptr_CurrentLocationCount; $_ptr_CurrentLocationID; $_ptr_CurrentLocationSubLevName; $_ptr_ListBoxArea; $_Ptr_LocationCodesArray; $_Ptr_LocationNamesArray; $_Ptr_NextAddPrdl; $_Ptr_NextAddSubLevel; $_Ptr_NEXTCurrentLocation; $_Ptr_NEXTCurrentLocationCode)
	C_POINTER:C301($_Ptr_NEXTCurrentLocationcount; $_Ptr_NEXTCurrentLocationID; $_ptr_NextCurrentLocSubLevel; $_Ptr_NEXTProdAddPrd; $_Ptr_NEXTProdDelPrd; $_Ptr_NEXTProdSelected; $_Ptr_NEXTProductCode; $_ptr_NextProductCodeArray; $_Ptr_NEXTProductCount; $_ptr_NextProductCountArray; $_Ptr_NEXTProductID)
	C_POINTER:C301($_ptr_NextProductIDArray; $_Ptr_NEXTProductListPointer; $_Ptr_NEXTProductName; $_ptr_NextProductNameArray; $_Ptr_NEXTSubLevelAdd; $_Ptr_NEXTSubLevelAddfurther; $_Ptr_NEXTSubLevelCount; $_Ptr_NextSublevelData; $_Ptr_NEXTSubLevelDelete; $_Ptr_NEXTSubLevelEdit; $_Ptr_NEXTSubLevelSelect)
	C_POINTER:C301($_ptr_ProdSelected; $_ptr_ProductAdd; $_ptr_ProductCode; $_ptr_ProductCodes; $_ptr_ProductCount; $_ptr_ProductCounts; $_ptr_ProductDelete; $_ptr_ProductID; $_ptr_ProductIDS; $_ptr_ProductList; $_ptr_ProductName)
	C_POINTER:C301($_ptr_ProductNames; $_ptr_Self; $_ptr_SubLevelAdd; $_ptr_SubLevelAddFurther; $_Ptr_SubLevelCount; $_ptr_SubLevelDelete; $_ptr_SubLevelEdit; $_Ptr_SubLevelLBArea; $_ptr_SubLevelSelect; $_Ptr_SubLocationCodes; $_ptr_SubLocationHolds)
	C_POINTER:C301($_ptr_SubLocationIDS; $_ptr_SubLocationModified; $_ptr_SubLocationNames; $_ptr_SubLocationNextConfig; $_ptr_SubLocationNextLabel; $_ptr_SubLocationParentID; $_ptr_SubLocationPrdCd; $_Ptr_SubLocationPrdNm; $_ptr_SubLocationStkCount; $_Ptr_ThisLocationName)
	C_REAL:C285($_r_StockAtLocation)
	C_TEXT:C284($_t_ButtonsName; $_t_CountNextSubLevelsSTR; $_t_Label; $_t_LevelName; $_t_LocationName; $_t_LocationSubdivisionName; $_t_NEXTProdCodeLabelName; $_t_NEXTProdCountLabelName; $_t_NEXTProdNameLabelName; $_t_NextSublevelLabel; $_t_NEXTSubLevelLabelName)
	C_TEXT:C284($_t_NextSublevelNamed; $_t_NextSubLocationCode; $_t_oldMethodName; $_t_ProdCodeLabelName; $_t_ProdCountLabelName; $_t_ProdNameLabelName; $_t_ProductCode; $_t_SelectedOption; $_t_Singular; $_t_SublevelLabel; $_t_SubLevelLabelName)
	C_TEXT:C284($_t_SubLocationDefault; STK_t_ProductCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_LocationsEditor.oButtonEditSub10"; Form event code:C388)

$_l_CurrentLevel:=FORM Get current page:C276
$_l_HeaderLevel:=$_l_CurrentLevel-1
$_Ptr_addSubLevelButton:=Get pointer:C304("STK_but_AddSub"+String:C10($_l_HeaderLevel))  //Add the first sub level..hidden if a location or has already got a sublevel or product assigned"
$_Ptr_addProductButton:=Get pointer:C304("STK_but_AddProd"+String:C10($_l_HeaderLevel))  //assign a  first Product..hidden if a location or has already got a sublevel or product assigned
$_Ptr_SubLevelLBArea:=Get pointer:C304("STK_lb_Sublevels"+String:C10($_l_HeaderLevel))  //List of next level locations
$_Ptr_SubLevelCount:=Get pointer:C304("STK_l_CountSublevel"+String:C10($_l_HeaderLevel))  //Count of next level locations


$_t_SubLevelLabelName:="oSubLocationCountLabel"+String:C10($_l_HeaderLevel)
$_t_ProdCodeLabelName:="oProductCodeLabel"+String:C10($_l_HeaderLevel)
$_t_ProdNameLabelName:="oProductNameLabel"+String:C10($_l_HeaderLevel)
$_t_ProdCountLabelName:="oProductCountLabel"+String:C10($_l_HeaderLevel)
$_ptr_SubLevelAddFurther:=Get pointer:C304("STK_but_AddFurther"+String:C10($_l_HeaderLevel))  //Button to populate the next range of sublevels
$_ptr_SubLevelEdit:=Get pointer:C304("STK_but_EditSub"+String:C10($_l_HeaderLevel))  //Button to edit a sublevel
$_ptr_SubLevelDelete:=Get pointer:C304("STK_but_DeleteSub"+String:C10($_l_HeaderLevel))  //Button to delete a sublevel
$_ptr_SubLevelAdd:=Get pointer:C304("STK_but_AddSub"+String:C10($_l_HeaderLevel))  //Button to add more sublevel records

$_ptr_ProductDelete:=Get pointer:C304("STK_l_ButdelProd"+String:C10($_l_HeaderLevel))  //Button to remove the assigning of a product to a location
$_ptr_ProductAdd:=Get pointer:C304("STK_l_ButAddProd"+String:C10($_l_HeaderLevel))  // Button to add another product to the location(changes from single to double if currently only one

$_ptr_ProductList:=Get pointer:C304("STK_lB_Products"+String:C10($_l_HeaderLevel))  //Area showing list of products at this location..only displayed if multiple products at this one location
$_ptr_ProductCodes:=Get pointer:C304("STK_at_ProductCode"+String:C10($_l_HeaderLevel))  //Array of Products(Codes) to display in list of products
$_ptr_ProductIDS:=Get pointer:C304("STK_al_aProductListID"+String:C10($_l_HeaderLevel))  //Array of Products(IDS) to display in list of products
$_ptr_ProductNames:=Get pointer:C304("STK_at_ProductName"+String:C10($_l_HeaderLevel))  //Array of Products(Names) to display in list of products
$_ptr_ProductCounts:=Get pointer:C304("STK_ar_ProductCount"+String:C10($_l_HeaderLevel))  //Array of Products( stock count at location) to display in list of products

$_ptr_ProductCode:=Get pointer:C304("STK_t_ProductCode"+String:C10($_l_HeaderLevel))  //`Single Product(Code) to display
$_ptr_ProductID:=Get pointer:C304("STK_l_ProductID"+String:C10($_l_HeaderLevel))  //`Single Product(ID) to display
$_ptr_ProductName:=Get pointer:C304("STK_T_ProductName"+String:C10($_l_HeaderLevel))  //`Single Product(Name) to display
$_ptr_ProductCount:=Get pointer:C304("STK_R_ProductCount"+String:C10($_l_HeaderLevel))  //`Single Product(Stock Count at location) to display

$_ptr_CurrentLocation:=Get pointer:C304("STK_t_CurrentLocation"+String:C10($_l_HeaderLevel))  //`Selected location name
$_ptr_CurrentLocationSubLevName:=Get pointer:C304("STK_t_SubLevelLabel"+String:C10($_l_HeaderLevel))  //Name of the sublevels attached to this location
$_ptr_CurrentLocationCode:=Get pointer:C304("STK_t_CurrentLocationCode"+String:C10($_l_HeaderLevel))  //Selected location code
$_ptr_CurrentLocationID:=Get pointer:C304("STK_l_currentLocation"+String:C10($_l_HeaderLevel))  //Selected location ID
$_ptr_CurrentLocationCount:=Get pointer:C304("STK_l_CountSublevel"+String:C10($_l_HeaderLevel))  //Count of the sublevels for this level
//```
//Pointers relating to the sublevels
$_ptr_SubLevelSelect:=Get pointer:C304("STK_l_SubLevelSelected"+String:C10($_l_CurrentLevel))
$_ptr_ProdSelected:=Get pointer:C304("STK_l_ProdatlocSelected"+String:C10($_l_CurrentLevel))

If ($_ptr_SubLevelSelect->>0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	LISTBOX GET ARRAYS:C832($_Ptr_SubLevelLBArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
	$_Ptr_LocationNamesArray:=$_aptr_ColumnVariables{1}  // Location Name
	$_Ptr_LocationCodesArray:=$_aptr_ColumnVariables{2}  //Location Code
	$_ptr_Array10:=$_aptr_ColumnVariables{3}  //Location holds
	$_ptr_Array8:=$_aptr_ColumnVariables{4}  // Product code at location
	$_ptr_Array9:=$_aptr_ColumnVariables{5}  // Product name
	$_ptr_Array2:=$_aptr_ColumnVariables{6}  // Location ID
	$_ptr_Array4:=$_aptr_ColumnVariables{7}  //Sub locatons named
	$_ptr_Array5:=$_aptr_ColumnVariables{8}  //Sublocation coding pref
	$_ptr_Array6:=$_aptr_ColumnVariables{9}  //Parent location iD
	$_ptr_Array7:=$_aptr_ColumnVariables{10}  //Modified Flag
	$_l_SelectedRow:=Find in array:C230($_ptr_Array2->; $_ptr_SubLevelSelect->)
	
	$_t_LocationName:=$_Ptr_LocationCodesArray->{$_l_SelectedRow}
	
	$_t_NextSublevelNamed:=$_ptr_Array4->{$_l_SelectedRow}
	$_t_ProductCode:=$_ptr_Array8->{$_l_SelectedRow}
	Case of 
		: ($_t_NextSublevelNamed#"")  //The location has a sublevel
			//open the location in a new window....new process
			//Goto the next page of the form and set this location up
			ARRAY TEXT:C222($_at_ColumnNames; 0)
			ARRAY TEXT:C222($_at_HeaderNames; 0)
			ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
			ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
			ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
			ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
			LISTBOX GET ARRAYS:C832($_Ptr_SubLevelLBArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
			$_Ptr_LocationNamesArray:=$_aptr_ColumnVariables{1}  // Location Name
			$_Ptr_LocationCodesArray:=$_aptr_ColumnVariables{2}  //Location Code
			$_ptr_Array10:=$_aptr_ColumnVariables{3}  //Location holds
			$_ptr_Array8:=$_aptr_ColumnVariables{4}  // Product code at location
			$_ptr_Array9:=$_aptr_ColumnVariables{5}  // Product name
			$_ptr_Array2:=$_aptr_ColumnVariables{6}  // Location ID
			$_ptr_Array4:=$_aptr_ColumnVariables{7}  //Sub locatons named
			$_ptr_Array5:=$_aptr_ColumnVariables{8}  //Sublocation coding pref
			$_ptr_Array6:=$_aptr_ColumnVariables{9}  //Parent location iD
			$_ptr_Array7:=$_aptr_ColumnVariables{10}  //Modified Flag
			$_t_LocationSubdivisionName:=$_ptr_CurrentLocationSubLevName->
			
			$_l_NextLevelHeader:=FORM Get current page:C276
			$_l_NextLevel:=$_l_NextLevelHeader+1
			//```
			$_Ptr_NextAddSubLevel:=Get pointer:C304("STK_but_AddSub"+String:C10($_l_NextLevelHeader))  //Add the first sub level..hidden if a location or has already got a sublevel or product assigned
			$_Ptr_NextAddPrdl:=Get pointer:C304("STK_but_AddProd"+String:C10($_l_NextLevelHeader))  //assign a  first Product..hidden if a location or has already got a sublevel or product assigned
			$_Ptr_NextSublevelData:=Get pointer:C304("STK_lb_Sublevels"+String:C10($_l_NextLevelHeader))  //List of next level locations
			$_Ptr_NEXTSubLevelCount:=Get pointer:C304("STK_l_CountSublevel"+String:C10($_l_NextLevelHeader))  //Count of next level locations
			
			
			$_t_NEXTSubLevelLabelName:="oSubLocationCountLabel"+String:C10($_l_NextLevelHeader)
			$_t_NEXTProdCodeLabelName:="oProductCodeLabel"+String:C10($_l_NextLevelHeader)
			$_t_NEXTProdNameLabelName:="oProductNameLabel"+String:C10($_l_NextLevelHeader)
			$_t_NEXTProdCountLabelName:="oProductCountLabel"+String:C10($_l_NextLevelHeader)
			$_Ptr_NEXTSubLevelAddfurther:=Get pointer:C304("STK_but_AddFurther"+String:C10($_l_NextLevelHeader))  //Button to populate the next range of sublevels
			$_Ptr_NEXTSubLevelEdit:=Get pointer:C304("STK_but_EditSub"+String:C10($_l_NextLevelHeader))  //Button to edit a sublevel
			$_Ptr_NEXTSubLevelDelete:=Get pointer:C304("STK_but_DeleteSub"+String:C10($_l_NextLevelHeader))  //Button to delete a sublevel
			$_Ptr_NEXTSubLevelAdd:=Get pointer:C304("STK_but_AddSub"+String:C10($_l_NextLevelHeader))  //Button to add more sublevel records
			
			$_Ptr_NEXTProdDelPrd:=Get pointer:C304("STK_l_ButdelProd"+String:C10($_l_NextLevelHeader))  //Button to remove the assigning of a product to a location
			$_Ptr_NEXTProdAddPrd:=Get pointer:C304("STK_l_ButAddProd"+String:C10($_l_NextLevelHeader))  // Button to add another product to the location(changes from single to double if currently only one
			
			$_Ptr_NEXTProductListPointer:=Get pointer:C304("STK_lB_Products"+String:C10($_l_NextLevelHeader))  //Area showing list of products at this location..only displayed if multiple products at this one location
			$_ptr_NextProductCodeArray:=Get pointer:C304("STK_at_ProductCode"+String:C10($_l_NextLevelHeader))  //Array of Products(Codes) to display in list of products
			$_ptr_NextProductIDArray:=Get pointer:C304("STK_al_aProductListID"+String:C10($_l_NextLevelHeader))  //Array of Products(IDS) to display in list of products
			$_ptr_NextProductNameArray:=Get pointer:C304("STK_at_ProductName"+String:C10($_l_NextLevelHeader))  //Array of Products(Names) to display in list of products
			$_ptr_NextProductCountArray:=Get pointer:C304("STK_ar_ProductCount"+String:C10($_l_NextLevelHeader))  //Array of Products( stock count at location) to display in list of products
			
			$_Ptr_NEXTProductCode:=Get pointer:C304("STK_t_ProductCode"+String:C10($_l_NextLevelHeader))  //`Single Product(Code) to display
			$_Ptr_NEXTProductID:=Get pointer:C304("STK_l_ProductID"+String:C10($_l_NextLevelHeader))  //`Single Product(ID) to display
			$_Ptr_NEXTProductName:=Get pointer:C304("STK_T_ProductName"+String:C10($_l_NextLevelHeader))  //`Single Product(Name) to display
			$_Ptr_NEXTProductCount:=Get pointer:C304("STK_R_ProductCount"+String:C10($_l_NextLevelHeader))  //`Single Product(Stock Count at location) to display
			
			$_Ptr_NEXTCurrentLocation:=Get pointer:C304("STK_t_CurrentLocation"+String:C10($_l_NextLevelHeader))  //`Selected location name
			$_ptr_NextCurrentLocSubLevel:=Get pointer:C304("STK_t_SubLevelLabel"+String:C10($_l_NextLevelHeader))  //Name of the sublevels attached to this location
			$_Ptr_NEXTCurrentLocationCode:=Get pointer:C304("STK_t_CurrentLocationCode"+String:C10($_l_NextLevelHeader))  //Selected location code
			$_Ptr_NEXTCurrentLocationID:=Get pointer:C304("STK_l_currentLocation"+String:C10($_l_NextLevelHeader))  //Selected location ID
			$_Ptr_NEXTCurrentLocationcount:=Get pointer:C304("STK_l_CountSublevel"+String:C10($_l_NextLevelHeader))  //Count of the sublevels for this level
			//```
			//Pointers relating to the sublevels
			$_Ptr_NEXTSubLevelSelect:=Get pointer:C304("STK_l_SubLevelSelected"+String:C10($_l_NextLevel))
			$_Ptr_NEXTProdSelected:=Get pointer:C304("STK_l_ProdatlocSelected"+String:C10($_l_NextLevel))
			
			//````
			$_Ptr_NEXTCurrentLocationcount->:=Num:C11($_t_CountNextSubLevelsSTR)
			
			$_Ptr_ThisLocationName:=Get pointer:C304("STK_T_CurrentLocation"+String:C10($_l_NextLevelHeader))
			$_l_ThisLocationID:=$_ptr_Array2->{$_l_SelectedRow}
			
			$_ptr_SubLocationNames:=Get pointer:C304("STK_at_LocationNames"+String:C10($_l_NextLevelHeader))
			$_ptr_SubLocationIDS:=Get pointer:C304("STK_al_LocationsIDs"+String:C10($_l_NextLevelHeader))
			$_Ptr_SubLocationCodes:=Get pointer:C304("STK_at_LocationCodes"+String:C10($_l_NextLevelHeader))
			$_ptr_SubLocationNextLabel:=Get pointer:C304("STK_at_LevelLabel"+String:C10($_l_NextLevelHeader))
			$_ptr_SubLocationNextConfig:=Get pointer:C304("STK_al_CodingPref"+String:C10($_l_NextLevelHeader))
			$_ptr_SubLocationParentID:=Get pointer:C304("STK_al_ParentLocation"+String:C10($_l_NextLevelHeader))
			$_ptr_SubLocationPrdCd:=Get pointer:C304("STK_at_LocProdCode"+String:C10($_l_NextLevelHeader))
			$_Ptr_SubLocationPrdNm:=Get pointer:C304("STK_at_LocProdName"+String:C10($_l_NextLevelHeader))
			$_ptr_SubLocationModified:=Get pointer:C304("STK_abo_LocMod"+String:C10($_l_NextLevelHeader))
			$_ptr_SubLocationStkCount:=Get pointer:C304("STK_ar_StockAtLocation"+String:C10($_l_NextLevelHeader))
			$_ptr_SubLocationHolds:=Get pointer:C304("STK_at_LocationHolds"+String:C10($_l_NextLevelHeader))
			
			//``
			//
			//``
			ARRAY TEXT:C222($_ptr_SubLocationNames->; 0)
			ARRAY LONGINT:C221($_ptr_SubLocationIDS->; 0)
			ARRAY TEXT:C222($_Ptr_SubLocationCodes->; 0)
			ARRAY TEXT:C222($_ptr_SubLocationNextLabel->; 0)
			ARRAY LONGINT:C221($_ptr_SubLocationNextConfig->; 0)
			ARRAY LONGINT:C221($_ptr_SubLocationParentID->; 0)
			ARRAY TEXT:C222($_ptr_SubLocationPrdCd->; 0)
			ARRAY TEXT:C222($_Ptr_SubLocationPrdNm->; 0)
			ARRAY BOOLEAN:C223($_ptr_SubLocationModified->; 0)
			ARRAY REAL:C219($_ptr_SubLocationStkCount->; 0)
			ARRAY TEXT:C222($_ptr_SubLocationHolds->; 0)
			//``
			QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]ParentLocationID:3=$_l_ThisLocationID)
			SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Code:1; $_Ptr_SubLocationCodes->; [LOCATIONS:61]Location_Name:2; $_ptr_SubLocationNames->; [LOCATIONS:61]LocationID:4; $_ptr_SubLocationIDS->; [LOCATIONS:61]Sub_location_Labelled:6; $_ptr_SubLocationNextLabel->; [LOCATIONS:61]Sub_LocationCodingPref:7; $_ptr_SubLocationNextConfig->)
			$_l_SizeofArray:=Size of array:C274($_Ptr_SubLocationCodes->)
			ARRAY TEXT:C222($_ptr_SubLocationPrdCd->; $_l_SizeofArray)
			ARRAY TEXT:C222($_Ptr_SubLocationPrdNm->; $_l_SizeofArray)
			ARRAY BOOLEAN:C223($_ptr_SubLocationModified->; $_l_SizeofArray)
			ARRAY REAL:C219($_ptr_SubLocationStkCount->; $_l_SizeofArray)
			ARRAY TEXT:C222($_ptr_SubLocationHolds->; $_l_SizeofArray)
			For ($_l_Index; 1; Size of array:C274($_ptr_SubLocationPrdCd->))
				If ($_ptr_SubLocationNextLabel->{$_l_Index}="")
					//No sublevel maybe a product is stored there
					QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_LocationCode:2=$_Ptr_SubLocationCodes->{$_l_Index})
					If (Records in selection:C76([x_ProductLocations:185])>0)
						If (Records in selection:C76([x_ProductLocations:185])=1)
							//There is product stored there..maybe more than one product
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=[x_ProductLocations:185]x_ProductID:1)
							$_ptr_SubLocationPrdCd->{$_l_Index}:=[PRODUCTS:9]Product_Code:1
							$_Ptr_SubLocationPrdNm->{$_l_Index}:=[PRODUCTS:9]Product_Name:2
							STK_GetActiveThreads([PRODUCTS:9]X_ID:43; ""; 0; "ANY"; "ANY"; "ANY"; 0; 0; ""; 0; 0; ""; ""; $_ptr_SubLocationPrdCd->{$_l_Index})
							$_ptr_SubLocationStkCount->{$_l_Index}:=Sum:C1([Stock_Thread:143]Quantity:13)
							$_ptr_SubLocationHolds->{$_l_Index}:=$_ptr_SubLocationPrdCd->{$_l_Index}+", "+$_Ptr_SubLocationPrdNm->{$_l_Index}
						Else 
							//Mulltiple products
							$_ptr_SubLocationPrdCd->{$_l_Index}:="Multiple Products"
							$_Ptr_SubLocationPrdNm->{$_l_Index}:="Select Location to see product range"
							$_ptr_SubLocationStkCount->{$_l_Index}:=0
							$_ptr_SubLocationHolds->{$_l_Index}:=$_ptr_SubLocationPrdCd->{$_l_Index}+", "+$_Ptr_SubLocationPrdNm->{$_l_Index}
						End if 
					End if 
				Else 
					$_ptr_SubLocationHolds->{$_l_Index}:=$_ptr_SubLocationNextLabel->{$_l_Index}
				End if 
				If ($_ptr_SubLocationHolds->{$_l_Index}="")
					$_ptr_SubLocationHolds->{$_l_Index}:="Unknown"
				End if 
			End for 
			
			$_t_LevelName:="oLev"+String:C10($_l_NextLevelHeader)
			$_t_ButtonsName:="SLOC"+String:C10($_l_NextLevelHeader)+"_L"
			$_ptr_ListBoxArea:=Get pointer:C304("STK_lb_Level"+String:C10($_l_NextLevelHeader))
			LB_SetupListbox($_ptr_ListBoxArea; $_t_LevelName; $_t_ButtonsName; 1; $_ptr_SubLocationNames; $_Ptr_SubLocationCodes; $_ptr_SubLocationHolds; $_ptr_SubLocationPrdCd; $_Ptr_SubLocationPrdNm; $_ptr_SubLocationNextLabel; $_ptr_SubLocationIDS; $_ptr_SubLocationModified)
			LB_SetColumnHeaders($_ptr_ListBoxArea; "SLOC0_L"; 1; "Location Point"; "Location Code"; "Location Content"; "Product At location"; "Product Name"; "SubLevel"; "Location ID"; "Modified")
			
			LB_SetColumnWidths($_ptr_ListBoxArea; $_t_LevelName; 1; 120; 70; 190; 0; 0; 0; 0; 0)
			
			LB_SetScroll($_ptr_ListBoxArea; -2; -3)
			LB_SETENTRYOPTIONS  // doesn't actually do anything ...
			LB_StyleSettings($_ptr_ListBoxArea; "blue"; 9; $_t_LevelName; ->[LOCATIONS:61])
			LB_SetScroll($_ptr_ListBoxArea; -2; -2)
			LB_SetEnterable($_ptr_ListBoxArea; False:C215; 0)
			$_Ptr_ThisLocationName->:=$_Ptr_LocationNamesArray->{$_l_SelectedRow}
			//````
			OBJECT SET VISIBLE:C603($_Ptr_NextAddSubLevel->; False:C215)
			OBJECT SET VISIBLE:C603($_Ptr_NextAddPrdl->; False:C215)
			
			OBJECT SET VISIBLE:C603($_Ptr_NextSublevelData->; False:C215)
			OBJECT SET VISIBLE:C603($_Ptr_NEXTProductListPointer->; False:C215)
			OBJECT SET VISIBLE:C603(*; $_t_NEXTSubLevelLabelName; False:C215)
			OBJECT SET VISIBLE:C603(*; $_t_NEXTProdCodeLabelName; False:C215)
			OBJECT SET VISIBLE:C603(*; $_t_NEXTProdNameLabelName; False:C215)
			OBJECT SET VISIBLE:C603(*; $_t_NEXTProdCountLabelName; False:C215)
			OBJECT SET VISIBLE:C603($_Ptr_NEXTSubLevelCount->; False:C215)
			OBJECT SET VISIBLE:C603($_Ptr_NEXTProductCode->; False:C215)
			OBJECT SET VISIBLE:C603($_Ptr_NEXTProductName->; False:C215)
			OBJECT SET VISIBLE:C603($_Ptr_NEXTProductCount->; False:C215)
			OBJECT SET VISIBLE:C603($_Ptr_NEXTSubLevelAddfurther->; False:C215)
			OBJECT SET VISIBLE:C603($_Ptr_NEXTSubLevelEdit->; False:C215)
			OBJECT SET VISIBLE:C603($_Ptr_NEXTSubLevelDelete->; False:C215)
			OBJECT SET VISIBLE:C603($_Ptr_NEXTSubLevelAdd->; False:C215)
			OBJECT SET VISIBLE:C603($_Ptr_NEXTProdAddPrd->; False:C215)
			OBJECT SET VISIBLE:C603($_Ptr_NEXTProdDelPrd->; False:C215)
			$_t_Label:="oattachlocations"+String:C10($_l_NextLevelHeader)
			OBJECT SET VISIBLE:C603($_t_Label; False:C215)
			$_Ptr_NEXTCurrentLocationID->:=0
			$_Ptr_NEXTCurrentLocationCode->:=""
			$_Ptr_NEXTCurrentLocation->:=""
			$_Ptr_NEXTCurrentLocationcount->:=0
			$_Ptr_NEXTSubLevelSelect->:=0
			$_Ptr_NEXTProdSelected->:=0
			$_Ptr_NEXTProductCode->:=""
			$_Ptr_NEXTProductID->:=0
			$_Ptr_NEXTProductName->:=""
			$_Ptr_NEXTProductCount->:=0
			
			OBJECT SET ENTERABLE:C238($_Ptr_NEXTCurrentLocation->; False:C215)
			OBJECT SET ENTERABLE:C238($_Ptr_NEXTCurrentLocationCode->; False:C215)
			
			//````
			FORM GOTO PAGE:C247(FORM Get current page:C276+1)
			//```
			
			
		: ($_t_ProductCode#"Unknown") & ($_t_ProductCode#"")  //Has a product code show the product attachment screen
			//Edit default location of that product, edit product storerd at this location, remove this product from this location, or add another product to this location
			$_ptr_Self:=Self:C308
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			
			OBJECT GET COORDINATES:C663($_ptr_Self->; $_l_oLeft; $_l_oTop; $_l_oRight; $_l_oBottom)
			
			$_t_SelectedOption:=Gen_RequestWithList("Select an option"; ""; "Continue"; "Cancel"; ($_l_WindowLeft+$_l_oRight); ($_l_windowTop+$_l_oTop); "Edit Option"; 0; ""; ""; "Add Additional Product to Location"; "Remove Product from Location")
			If (OK=1) & ($_t_SelectedOption#"")
				Case of 
						
					: ($_t_SelectedOption="Add Additional Product to Location")
						$_t_ProductCode:=Gen_Request("Enter Additional Product Code to store at this location"; "")
						If ($_t_ProductCode#"") & (OK=1)
							STK_bo_ProductFound:=False:C215
							STK_t_ProductCode:=$_t_ProductCode
							Check_Product(->STK_t_ProductCode; "Product"; ->STK_bo_ProductFound)
							If (STK_bo_ProductFound)
								If ($_ptr_Array8->{$_l_SelectedRow}#"Multiple Products")
									CREATE RECORD:C68([x_ProductLocations:185])
									[x_ProductLocations:185]x_LocationCode:2:=$_Ptr_LocationCodesArray->{$_l_SelectedRow}
									[x_ProductLocations:185]x_ProductID:1:=[PRODUCTS:9]X_ID:43
									DB_SaveRecord(->[x_ProductLocations:185])
									
									$_ptr_Array8->{$_l_SelectedRow}:="Multiple Products"
									$_ptr_Array9->{$_l_SelectedRow}:="Select Location to see product range"
									$_ptr_Array7->{$_l_SelectedRow}:=True:C214
									$_ptr_Array10->{$_l_SelectedRow}:=$_ptr_Array8->{$_l_SelectedRow}+", "+$_ptr_Array8->{$_l_SelectedRow}
								Else 
									CREATE RECORD:C68([x_ProductLocations:185])
									[x_ProductLocations:185]x_LocationCode:2:=$_Ptr_LocationCodesArray->{$_l_SelectedRow}
									[x_ProductLocations:185]x_ProductID:1:=[PRODUCTS:9]X_ID:43
									DB_SaveRecord(->[x_ProductLocations:185])
									$_ptr_Array7->{$_l_SelectedRow}:=True:C214
									//these couple of lines are not needed but just make easier reading
									$_ptr_Array8->{$_l_SelectedRow}:="Multiple Products"
									$_ptr_Array9->{$_l_SelectedRow}:="Select Location to see product range"
									
									$_ptr_Array10->{$_l_SelectedRow}:=$_ptr_Array8->{$_l_SelectedRow}+", "+$_ptr_Array8->{$_l_SelectedRow}
									
								End if 
								
							Else 
								Gen_Alert("Product Not found")
								
							End if 
						End if 
						
						
					: ($_t_SelectedOption="Remove Product from Location")
						//We may have multiple products at the location need to select which one to remove(or all)
						If ($_ptr_Array8->{$_l_SelectedRow}#"Multiple Products")
							READ WRITE:C146([x_ProductLocations:185])
							QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_ProductID:1=$_ptr_Array8->{$_l_SelectedRow}; *)
							QUERY:C277([x_ProductLocations:185];  & ; [x_ProductLocations:185]x_LocationCode:2=$_Ptr_LocationCodesArray->{$_l_SelectedRow})
							If (Records in selection:C76([x_ProductLocations:185])>0)
								STK_GetActiveThreads($_ptr_Array8->{$_l_SelectedRow}; ""; 0; "ANY"; "ANY"; "ANY"; 0; 0; ""; 0; 0; ""; ""; $_Ptr_LocationCodesArray->{$_l_SelectedRow})
								$_r_StockAtLocation:=Sum:C1([Stock_Thread:143]Quantity:13)
								If ($_r_StockAtLocation>0)
									Gen_Alert("Although this will remove this product from being recorded at this location, you "+"will need to  execute a stock movement to move the stock to a different locat"+"ion")
								End if 
								DELETE RECORD:C58([x_ProductLocations:185])
							End if 
							$_ptr_Array8->{$_l_SelectedRow}:=""
							$_ptr_Array9->{$_l_SelectedRow}:=""
							$_ptr_Array7->{$_l_SelectedRow}:=True:C214
							$_ptr_Array10->{$_l_SelectedRow}:="Unknown"
							//And update the array
							
						Else 
							//There are multiple products at this location--select which one
							ARRAY LONGINT:C221($_al_ProductIDS; 0)
							Gen_Alert("There are multiple products at this location, select the product to remove")
							QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_LocationCode:2=$_Ptr_LocationCodesArray->{$_l_SelectedRow})
							SELECTION TO ARRAY:C260([x_ProductLocations:185]x_ProductID:1; $_al_ProductIDS)
							$_l_ProductsCount:=Records in selection:C76([PRODUCTS:9])
							QUERY WITH ARRAY:C644([PRODUCTS:9]X_ID:43; $_al_ProductIDS)
							ARRAY TEXT:C222(STK_at_RelProdCodes; 0)
							ARRAY TEXT:C222(STK_at_RelProdNames; 0)
							SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; STK_at_RelProdCodes; [PRODUCTS:9]Product_Name:2; STK_at_RelProdNames; [PRODUCTS:9]X_ID:43; $_al_ProductsXID)
							$_ptr_Self:=Self:C308
							GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
							OBJECT GET COORDINATES:C663($_ptr_Self->; $_l_oLeft; $_l_oTop; $_l_oRight; $_l_oBottom)
							$_t_SelectedOption:=Gen_RequestWithList("Select a Product"; ""; "Continue"; "Cancel"; ($_l_WindowLeft+$_l_oRight); ($_l_windowTop+$_l_oTop); "Remove Product"; 0; ""; "STK_at_RelProdCodes")
							If ($_t_SelectedOption#"") & (OK=1)
								$_l_ProductPosition:=Find in array:C230(STK_at_RelProdCodes; $_t_SelectedOption)
								$_l_ProductID:=$_al_ProductsXID{$_l_ProductPosition}
								READ WRITE:C146([x_ProductLocations:185])
								QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_ProductID:1=$_l_ProductID; *)
								QUERY:C277([x_ProductLocations:185];  & ; [x_ProductLocations:185]x_LocationCode:2=$_Ptr_LocationCodesArray->{$_l_SelectedRow})
								If (Records in selection:C76([x_ProductLocations:185])>0)
									STK_GetActiveThreads($_ptr_Array8->{$_l_SelectedRow}; ""; 0; "ANY"; "ANY"; "ANY"; 0; 0; ""; 0; 0; ""; ""; $_Ptr_LocationCodesArray->{$_l_SelectedRow})
									$_r_StockAtLocation:=Sum:C1([Stock_Thread:143]Quantity:13)
									If ($_r_StockAtLocation>0)
										Gen_Alert("Although this will remove this product from being recorded at this location, you "+"will need to  execute a stock movement to move the stock to a different locat"+"ion")
									End if 
									DELETE RECORD:C58([x_ProductLocations:185])
								End if 
								QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_LocationCode:2=$_Ptr_LocationCodesArray->{$_l_SelectedRow})
								If (Records in selection:C76([x_ProductLocations:185])=1)
									QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=[x_ProductLocations:185]x_ProductID:1)
									$_ptr_Array8->{$_l_SelectedRow}:=[PRODUCTS:9]Product_Code:1
									$_ptr_Array9->{$_l_SelectedRow}:=[PRODUCTS:9]Product_Name:2
									$_ptr_Array7->{$_l_SelectedRow}:=True:C214
									$_ptr_Array10->{$_l_SelectedRow}:=[PRODUCTS:9]Product_Code:1+", "+[PRODUCTS:9]Product_Name:2
								Else 
									
									$_ptr_Array8->{$_l_SelectedRow}:="Multiple Products"
									$_ptr_Array9->{$_l_SelectedRow}:="Select Location to see product range"
									$_ptr_Array7->{$_l_SelectedRow}:=True:C214
									$_ptr_Array10->{$_l_SelectedRow}:=$_ptr_Array8->{$_l_SelectedRow}+", "+$_ptr_Array9->{$_l_SelectedRow}
								End if 
							End if 
							
						End if 
				End case 
			End if 
			OK:=1
			
		Else 
			//nothing is 'attached' to this location;
			xNext:=0
			Gen_Confirm3("Do you wish to create sub-locations or Assign a product to this location"; "Product"; "SubLocation"; "Cancel")
			Case of 
				: (xNext=1)  //cancel`
					//Do nothing
				: (OK=0)  //Sublocation
					//Goto next page with this as the parent location(no 'locations' because there are none)
					//STK_T_CurrentLocation1:=$_Ptr_LocationNamesArray->{$_l_SelectedRow}
					//``
					ARRAY TEXT:C222($_at_ColumnNames; 0)
					ARRAY TEXT:C222($_at_HeaderNames; 0)
					ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
					ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
					ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
					ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
					LISTBOX GET ARRAYS:C832($_Ptr_SubLevelLBArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
					$_Ptr_LocationNamesArray:=$_aptr_ColumnVariables{1}  // Location Name
					$_Ptr_LocationCodesArray:=$_aptr_ColumnVariables{2}  //Location Code
					$_ptr_Array10:=$_aptr_ColumnVariables{3}  //Location holds
					$_ptr_Array8:=$_aptr_ColumnVariables{4}  // Product code at location
					$_ptr_Array9:=$_aptr_ColumnVariables{5}  // Product name
					$_ptr_Array2:=$_aptr_ColumnVariables{6}  // Location ID
					$_ptr_Array4:=$_aptr_ColumnVariables{7}  //Sub locatons named
					$_ptr_Array5:=$_aptr_ColumnVariables{8}  //Sublocation coding pref
					$_ptr_Array6:=$_aptr_ColumnVariables{9}  //Parent location iD
					$_ptr_Array7:=$_aptr_ColumnVariables{10}  //Modified Flag
					$_t_LocationSubdivisionName:=$_ptr_CurrentLocationSubLevName->
					$_t_singular:=GenWordSingle($_t_LocationSubdivisionName)
					$_t_NextSublevelLabel:=Gen_Request("How is this "+$_t_singular+" divided?"; "")
					If ($_t_NextSublevelLabel#"")
						$_t_Singular:=GenWordSingle($_t_NextSublevelLabel)
						Case of   // These default names are just so we can populate something into the request box that looks sensible
							: ($_t_NextSublevelLabel="Showrooms") | ($_t_NextSublevelLabel="Showrooms")
								$_t_SubLocationDefault:="SHOW"
							: ($_t_NextSublevelLabel="Rooms") | ($_t_NextSublevelLabel="Room") | ($_t_NextSublevelLabel="Store Room") | ($_t_NextSublevelLabel="Store Rooms")
								$_t_SubLocationDefault:="RM"
							: ($_t_NextSublevelLabel="Floors") | ($_t_NextSublevelLabel="Floor")
								$_t_SubLocationDefault:="FLR"
							: ($_t_NextSublevelLabel="Rows")
								$_t_SubLocationDefault:="ROW"
							: ($_t_NextSublevelLabel="Bins") | ($_t_NextSublevelLabel="Bin")
								$_t_SubLocationDefault:="BIN"
							: ($_t_NextSublevelLabel="Shelves") | ($_t_NextSublevelLabel="Shelf")
								$_t_SubLocationDefault:="SH"
							: ($_t_NextSublevelLabel="Tunnels") | ($_t_NextSublevelLabel="Tunnel")
								$_t_SubLocationDefault:="TUN"
							Else 
								If (Length:C16($_t_SublevelLabel)>1)
									$_t_SubLocationDefault:=Substring:C12($_t_NextSublevelLabel; 1; 2)
								Else 
									$_t_SubLocationDefault:=$_t_NextSublevelLabel
								End if 
						End case 
						$_t_NextSubLocationCode:=Gen_Request("Enter "+$_t_singular+" Coding prefix"; $_t_SubLocationDefault)
						If ($_t_NextSubLocationCode#"") & (OK=1)
							$_t_CountNextSubLevelsSTR:=Gen_Request("How many "+$_t_NextSublevelLabel; "1")
							//``
							If (Num:C11($_t_CountNextSubLevelsSTR)>0)
								$_ptr_Array4->{$_l_SelectedRow}:=$_t_NextSublevelLabel
								$_ptr_Array10->{$_l_SelectedRow}:=$_t_NextSublevelLabel
								READ WRITE:C146([LOCATIONS:61])
								QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=$_l_ThisLocationID)
								[LOCATIONS:61]Sub_location_Labelled:6:=$_t_NextSublevelLabel
								DB_SaveRecord(->[LOCATIONS:61])
								UNLOAD RECORD:C212([LOCATIONS:61])
								READ ONLY:C145([LOCATIONS:61])
								
								
								$_l_NextLevelHeader:=FORM Get current page:C276
								$_l_NextLevel:=$_l_NextLevelHeader+1
								//```
								$_Ptr_NextAddSubLevel:=Get pointer:C304("STK_but_AddSub"+String:C10($_l_NextLevelHeader))  //Add the first sub level..hidden if a location or has already got a sublevel or product assigned
								$_Ptr_NextAddPrdl:=Get pointer:C304("STK_but_AddProd"+String:C10($_l_NextLevelHeader))  //assign a  first Product..hidden if a location or has already got a sublevel or product assigned
								$_Ptr_NextSublevelData:=Get pointer:C304("STK_lb_Sublevels"+String:C10($_l_NextLevelHeader))  //List of next level locations
								$_Ptr_NEXTSubLevelCount:=Get pointer:C304("STK_l_CountSublevel"+String:C10($_l_NextLevelHeader))  //Count of next level locations
								
								
								$_t_NEXTSubLevelLabelName:="oSubLocationCountLabel"+String:C10($_l_NextLevelHeader)
								$_t_NEXTProdCodeLabelName:="oProductCodeLabel"+String:C10($_l_NextLevelHeader)
								$_t_NEXTProdNameLabelName:="oProductNameLabel"+String:C10($_l_NextLevelHeader)
								$_t_NEXTProdCountLabelName:="oProductCountLabel"+String:C10($_l_NextLevelHeader)
								$_Ptr_NEXTSubLevelAddfurther:=Get pointer:C304("STK_but_AddFurther"+String:C10($_l_NextLevelHeader))  //Button to populate the next range of sublevels
								$_Ptr_NEXTSubLevelEdit:=Get pointer:C304("STK_but_EditSub"+String:C10($_l_NextLevelHeader))  //Button to edit a sublevel
								$_Ptr_NEXTSubLevelDelete:=Get pointer:C304("STK_but_DeleteSub"+String:C10($_l_NextLevelHeader))  //Button to delete a sublevel
								$_Ptr_NEXTSubLevelAdd:=Get pointer:C304("STK_but_AddSub"+String:C10($_l_NextLevelHeader))  //Button to add more sublevel records
								
								$_Ptr_NEXTProdDelPrd:=Get pointer:C304("STK_l_ButdelProd"+String:C10($_l_NextLevelHeader))  //Button to remove the assigning of a product to a location
								$_Ptr_NEXTProdAddPrd:=Get pointer:C304("STK_l_ButAddProd"+String:C10($_l_NextLevelHeader))  // Button to add another product to the location(changes from single to double if currently only one
								
								$_Ptr_NEXTProductListPointer:=Get pointer:C304("STK_lB_Products"+String:C10($_l_NextLevelHeader))  //Area showing list of products at this location..only displayed if multiple products at this one location
								$_ptr_NextProductCodeArray:=Get pointer:C304("STK_at_ProductCode"+String:C10($_l_NextLevelHeader))  //Array of Products(Codes) to display in list of products
								$_ptr_NextProductIDArray:=Get pointer:C304("STK_al_aProductListID"+String:C10($_l_NextLevelHeader))  //Array of Products(IDS) to display in list of products
								$_ptr_NextProductNameArray:=Get pointer:C304("STK_at_ProductName"+String:C10($_l_NextLevelHeader))  //Array of Products(Names) to display in list of products
								$_ptr_NextProductCountArray:=Get pointer:C304("STK_ar_ProductCount"+String:C10($_l_NextLevelHeader))  //Array of Products( stock count at location) to display in list of products
								
								$_Ptr_NEXTProductCode:=Get pointer:C304("STK_t_ProductCode"+String:C10($_l_NextLevelHeader))  //`Single Product(Code) to display
								$_Ptr_NEXTProductID:=Get pointer:C304("STK_l_ProductID"+String:C10($_l_NextLevelHeader))  //`Single Product(ID) to display
								$_Ptr_NEXTProductName:=Get pointer:C304("STK_T_ProductName"+String:C10($_l_NextLevelHeader))  //`Single Product(Name) to display
								$_Ptr_NEXTProductCount:=Get pointer:C304("STK_R_ProductCount"+String:C10($_l_NextLevelHeader))  //`Single Product(Stock Count at location) to display
								
								$_Ptr_NEXTCurrentLocation:=Get pointer:C304("STK_t_CurrentLocation"+String:C10($_l_NextLevelHeader))  //`Selected location name
								$_ptr_NextCurrentLocSubLevel:=Get pointer:C304("STK_t_SubLevelLabel"+String:C10($_l_NextLevelHeader))  //Name of the sublevels attached to this location
								$_Ptr_NEXTCurrentLocationCode:=Get pointer:C304("STK_t_CurrentLocationCode"+String:C10($_l_NextLevelHeader))  //Selected location code
								$_Ptr_NEXTCurrentLocationID:=Get pointer:C304("STK_l_currentLocation"+String:C10($_l_NextLevelHeader))  //Selected location ID
								$_Ptr_NEXTCurrentLocationcount:=Get pointer:C304("STK_l_CountSublevel"+String:C10($_l_NextLevelHeader))  //Count of the sublevels for this level
								//```
								//Pointers relating to the sublevels
								$_Ptr_NEXTSubLevelSelect:=Get pointer:C304("STK_l_SubLevelSelected"+String:C10($_l_NextLevel))
								$_Ptr_NEXTProdSelected:=Get pointer:C304("STK_l_ProdatlocSelected"+String:C10($_l_NextLevel))
								
								//````
								$_Ptr_NEXTCurrentLocationcount->:=Num:C11($_t_CountNextSubLevelsSTR)
								
								$_Ptr_ThisLocationName:=Get pointer:C304("STK_T_CurrentLocation"+String:C10($_l_NextLevelHeader))
								$_l_ThisLocationID:=$_ptr_Array2->{$_l_SelectedRow}
								
								$_ptr_SubLocationNames:=Get pointer:C304("STK_at_LocationNames"+String:C10($_l_NextLevelHeader))
								$_ptr_SubLocationIDS:=Get pointer:C304("STK_al_LocationsIDs"+String:C10($_l_NextLevelHeader))
								$_Ptr_SubLocationCodes:=Get pointer:C304("STK_at_LocationCodes"+String:C10($_l_NextLevelHeader))
								$_ptr_SubLocationNextLabel:=Get pointer:C304("STK_at_LevelLabel"+String:C10($_l_NextLevelHeader))
								$_ptr_SubLocationNextConfig:=Get pointer:C304("STK_al_CodingPref"+String:C10($_l_NextLevelHeader))
								$_ptr_SubLocationParentID:=Get pointer:C304("STK_al_ParentLocation"+String:C10($_l_NextLevelHeader))
								$_ptr_SubLocationPrdCd:=Get pointer:C304("STK_at_LocProdCode"+String:C10($_l_NextLevelHeader))
								$_Ptr_SubLocationPrdNm:=Get pointer:C304("STK_at_LocProdName"+String:C10($_l_NextLevelHeader))
								$_ptr_SubLocationModified:=Get pointer:C304("STK_abo_LocMod"+String:C10($_l_NextLevelHeader))
								$_ptr_SubLocationStkCount:=Get pointer:C304("STK_ar_StockAtLocation"+String:C10($_l_NextLevelHeader))
								$_ptr_SubLocationHolds:=Get pointer:C304("STK_at_LocationHolds"+String:C10($_l_NextLevelHeader))
								
								//``
								//QUERY([LOCATIONS];[LOCATIONS]ParentLocationID=$_l_ThisLocationID)
								//``
								ARRAY TEXT:C222($_ptr_SubLocationNames->; 0)
								ARRAY LONGINT:C221($_ptr_SubLocationIDS->; 0)
								ARRAY TEXT:C222($_Ptr_SubLocationCodes->; 0)
								ARRAY TEXT:C222($_ptr_SubLocationNextLabel->; 0)
								ARRAY LONGINT:C221($_ptr_SubLocationNextConfig->; 0)
								ARRAY LONGINT:C221($_ptr_SubLocationParentID->; 0)
								ARRAY TEXT:C222($_ptr_SubLocationPrdCd->; 0)
								ARRAY TEXT:C222($_Ptr_SubLocationPrdNm->; 0)
								ARRAY BOOLEAN:C223($_ptr_SubLocationModified->; 0)
								ARRAY REAL:C219($_ptr_SubLocationStkCount->; 0)
								ARRAY TEXT:C222($_ptr_SubLocationHolds->; 0)
								//``
								ARRAY TEXT:C222($_ptr_SubLocationNames->; $_Ptr_NEXTCurrentLocationcount->)
								ARRAY LONGINT:C221($_ptr_SubLocationIDS->; $_Ptr_NEXTCurrentLocationcount->)
								ARRAY TEXT:C222($_Ptr_SubLocationCodes->; $_Ptr_NEXTCurrentLocationcount->)
								ARRAY TEXT:C222($_ptr_SubLocationNextLabel->; $_Ptr_NEXTCurrentLocationcount->)
								ARRAY LONGINT:C221($_ptr_SubLocationNextConfig->; $_Ptr_NEXTCurrentLocationcount->)
								ARRAY LONGINT:C221($_ptr_SubLocationParentID->; $_Ptr_NEXTCurrentLocationcount->)
								ARRAY TEXT:C222($_ptr_SubLocationPrdCd->; $_Ptr_NEXTCurrentLocationcount->)
								ARRAY TEXT:C222($_Ptr_SubLocationPrdNm->; $_Ptr_NEXTCurrentLocationcount->)
								ARRAY BOOLEAN:C223($_ptr_SubLocationModified->; $_Ptr_NEXTCurrentLocationcount->)
								ARRAY REAL:C219($_ptr_SubLocationStkCount->; $_Ptr_NEXTCurrentLocationcount->)
								ARRAY TEXT:C222($_ptr_SubLocationHolds->; $_Ptr_NEXTCurrentLocationcount->)
								
								For ($_l_FillArray; 1; Size of array:C274($_ptr_SubLocationHolds->))
									$_Ptr_SubLocationCodes->{$_l_FillArray}:=$_Ptr_LocationCodesArray->{$_l_SelectedRow}+$_t_NextSubLocationCode+String:C10($_l_FillArray)
									$_ptr_SubLocationNames->{$_l_FillArray}:=$_Ptr_LocationNamesArray->{$_l_SelectedRow}+","+$_t_singular+" "+String:C10($_l_FillArray)
									STK_l_Subid:=0
									$_ptr_SubLocationIDS->{$_l_FillArray}:=AA_GetNextID(->[LOCATIONS:61]LocationID:4)
									$_ptr_SubLocationParentID->{$_l_FillArray}:=$_l_ThisLocationID
									$_ptr_SubLocationModified->{$_l_FillArray}:=True:C214
									$_ptr_SubLocationHolds->{$_l_FillArray}:="Unknown"
									CREATE RECORD:C68([LOCATIONS:61])
									[LOCATIONS:61]Location_Code:1:=$_Ptr_SubLocationCodes->{$_l_FillArray}
									[LOCATIONS:61]Location_Name:2:=$_ptr_SubLocationNames->{$_l_FillArray}
									[LOCATIONS:61]LocationCodePrefix:5:=$_Ptr_LocationCodesArray->{$_l_SelectedRow}  //This is correct
									[LOCATIONS:61]LocationID:4:=$_ptr_SubLocationIDS->{$_l_FillArray}
									[LOCATIONS:61]ParentLocationID:3:=$_ptr_SubLocationParentID->{$_l_FillArray}
									//[LOCATIONS]Sub_LocationNamingPref
									[LOCATIONS:61]Sub_location_Labelled:6:=""
									DB_SaveRecord(->[LOCATIONS:61])
									
								End for 
								//SELECTION TO ARRAY([LOCATIONS]Location Code;$_Ptr_SubLocationCodes->;[LOCATIONS]Location Name;$_ptr_SubLocationNames->;[LOCATIONS]LocationID;$_ptr_SubLocationIDS->;[LOCATIONS]Sub_Location_Labelled;$_ptr_SubLocationNextLabel->;[LOCATIONS]Sub_LocationCodingPref;$_ptr_SubLocationNextConfig->)
								$_t_LevelName:="oLev"+String:C10($_l_NextLevelHeader)
								$_t_ButtonsName:="SLOC"+String:C10($_l_NextLevelHeader)+"_L"
								$_ptr_ListBoxArea:=Get pointer:C304("STK_lb_Level"+String:C10($_l_NextLevelHeader))
								LB_SetupListbox($_ptr_ListBoxArea; $_t_LevelName; $_t_ButtonsName; 1; $_ptr_SubLocationNames; $_Ptr_SubLocationCodes; $_ptr_SubLocationHolds; $_ptr_SubLocationPrdCd; $_Ptr_SubLocationPrdNm; $_ptr_SubLocationNextLabel; $_ptr_SubLocationIDS; $_ptr_SubLocationModified)
								LB_SetColumnHeaders($_ptr_ListBoxArea; "SLOC0_L"; 1; "Location Point"; "Location Code"; "Location Content"; "Product At location"; "Product Name"; "SubLevel"; "Location ID"; "Modified")
								
								LB_SetColumnWidths($_ptr_ListBoxArea; $_t_LevelName; 1; 120; 70; 190; 0; 0; 0; 0; 0)
								
								LB_SetScroll($_ptr_ListBoxArea; -2; -3)
								LB_SETENTRYOPTIONS  // doesn't actually do anything ...
								LB_StyleSettings($_ptr_ListBoxArea; "blue"; 9; $_t_LevelName; ->[LOCATIONS:61])
								LB_SetScroll($_ptr_ListBoxArea; -2; -2)
								LB_SetEnterable($_ptr_ListBoxArea; False:C215; 0)
								$_Ptr_ThisLocationName->:=$_Ptr_LocationNamesArray->{$_l_SelectedRow}
								//````
								OBJECT SET VISIBLE:C603($_Ptr_NextAddSubLevel->; False:C215)
								OBJECT SET VISIBLE:C603($_Ptr_NextAddPrdl->; False:C215)
								
								OBJECT SET VISIBLE:C603($_Ptr_NextSublevelData->; False:C215)
								OBJECT SET VISIBLE:C603($_Ptr_NEXTProductListPointer->; False:C215)
								OBJECT SET VISIBLE:C603(*; $_t_NEXTSubLevelLabelName; False:C215)
								OBJECT SET VISIBLE:C603(*; $_t_NEXTProdCodeLabelName; False:C215)
								OBJECT SET VISIBLE:C603(*; $_t_NEXTProdNameLabelName; False:C215)
								OBJECT SET VISIBLE:C603(*; $_t_NEXTProdCountLabelName; False:C215)
								OBJECT SET VISIBLE:C603($_Ptr_NEXTSubLevelCount->; False:C215)
								OBJECT SET VISIBLE:C603($_Ptr_NEXTProductCode->; False:C215)
								OBJECT SET VISIBLE:C603($_Ptr_NEXTProductName->; False:C215)
								OBJECT SET VISIBLE:C603($_Ptr_NEXTProductCount->; False:C215)
								OBJECT SET VISIBLE:C603($_Ptr_NEXTSubLevelAddfurther->; False:C215)
								OBJECT SET VISIBLE:C603($_Ptr_NEXTSubLevelEdit->; False:C215)
								OBJECT SET VISIBLE:C603($_Ptr_NEXTSubLevelDelete->; False:C215)
								OBJECT SET VISIBLE:C603($_Ptr_NEXTSubLevelAdd->; False:C215)
								OBJECT SET VISIBLE:C603($_Ptr_NEXTProdAddPrd->; False:C215)
								OBJECT SET VISIBLE:C603($_Ptr_NEXTProdDelPrd->; False:C215)
								$_t_Label:="oattachlocations"+String:C10($_l_NextLevelHeader)
								OBJECT SET VISIBLE:C603($_t_Label; False:C215)
								$_Ptr_NEXTCurrentLocationID->:=0
								$_Ptr_NEXTCurrentLocationCode->:=""
								$_Ptr_NEXTCurrentLocation->:=""
								$_Ptr_NEXTCurrentLocationcount->:=0
								$_Ptr_NEXTSubLevelSelect->:=0
								$_Ptr_NEXTProdSelected->:=0
								$_Ptr_NEXTProductCode->:=""
								$_Ptr_NEXTProductID->:=0
								$_Ptr_NEXTProductName->:=""
								$_Ptr_NEXTProductCount->:=0
								
								OBJECT SET ENTERABLE:C238($_Ptr_NEXTCurrentLocation->; False:C215)
								OBJECT SET ENTERABLE:C238($_Ptr_NEXTCurrentLocationCode->; False:C215)
								
								//````
								FORM GOTO PAGE:C247(FORM Get current page:C276+1)
								//```
							End if   //0 sub level rows
						End if   //no sulevel code string
					Else 
						Gen_Alert("Sorry you must give a name to the type of subdivision")
					End if 
					
					//````
				Else 
					//Product
					$_t_ProductCode:=Gen_Request("Enter Product Code to store at this location"; "")
					If ($_t_ProductCode#"") & (OK=1)
						STK_bo_ProductFound:=False:C215
						STK_t_ProductCode:=$_t_ProductCode
						Check_Product(->STK_t_ProductCode; "Product"; ->STK_bo_ProductFound)
						If (STK_bo_ProductFound)
							CREATE RECORD:C68([x_ProductLocations:185])
							[x_ProductLocations:185]x_LocationCode:2:=$_Ptr_LocationCodesArray->{$_l_SelectedRow}
							[x_ProductLocations:185]x_ProductID:1:=[PRODUCTS:9]X_ID:43
							DB_SaveRecord(->[x_ProductLocations:185])
							
							$_ptr_Array8->{$_l_SelectedRow}:=[PRODUCTS:9]Product_Code:1
							$_ptr_Array9->{$_l_SelectedRow}:=[PRODUCTS:9]Product_Name:2
							$_ptr_Array7->{$_l_SelectedRow}:=True:C214
							$_ptr_Array10->{$_l_SelectedRow}:=[PRODUCTS:9]Product_Code:1+", "+[PRODUCTS:9]Product_Name:2
						Else 
							Gen_Alert("Product Not found")
							
						End if 
					End if 
			End case 
			OK:=1
	End case 
	
Else 
	
	Gen_Alert("You must select a sublocation to edit it")
End if 
ERR_MethodTrackerReturn("OBJ [USER].STK_LocationsEditor.oButtonEditSub10"; $_t_oldMethodName)
