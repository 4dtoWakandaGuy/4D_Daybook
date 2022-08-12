If (False:C215)
	//object Name: [USER]STK_LocationsEditor.oButtonAddFurtherSub10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 09:24
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY LONGINT:C221($_al_NextLevelIDsTemp; 0)
	ARRAY LONGINT:C221($_al_NextLevelParentIDTEMP; 0)
	ARRAY LONGINT:C221($_al_SubLevelParentIDS; 0)
	ARRAY LONGINT:C221($_al_SubLocationsWithnoSubLevel; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_NamedSubLocations; 0)
	ARRAY TEXT:C222($_at_NextLevelCodesTEMP; 0)
	ARRAY TEXT:C222($_at_NextLevelLabelTEMP; 0)
	ARRAY TEXT:C222($_at_NextLevelNamesTEMP; 0)
	C_BOOLEAN:C305($_bo_AddSubLevels; $_bo_SubLevelsCreated)
	C_LONGINT:C283($_l_CurrentElement; $_l_CurrentLevel; $_l_ElementsPerParent; $_l_HeaderLevel; $_l_ID; $_l_index; $_l_index2; $_l_LocationPosition; $_l_NumberOfElements; $_l_Ok; $_l_Parents)
	C_LONGINT:C283($_l_SelectedRow; STK_l_Subid)
	C_POINTER:C301($_Ptr_addProductButton; $_Ptr_AddSubLevelButton; $_ptr_Array10; $_ptr_Array2; $_ptr_Array4; $_ptr_Array5; $_ptr_Array6; $_ptr_Array7; $_ptr_Array8; $_ptr_Array9; $_ptr_CurrentLocation)
	C_POINTER:C301($_ptr_CurrentLocationCode; $_ptr_CurrentLocationCount; $_ptr_CurrentLocationID; $_ptr_CurrentLocationSubLevName; $_Ptr_LocationCodesArray; $_Ptr_LocationNamesArray; $_ptr_NextLevel1; $_ptr_NextLevel10; $_ptr_NextLevel2; $_ptr_NextLevel3; $_ptr_NextLevel4)
	C_POINTER:C301($_ptr_NextLevel5; $_ptr_NextLevel6; $_ptr_NextLevel7; $_ptr_NextLevel8; $_ptr_NextLevel9; $_ptr_NextLevelP1; $_ptr_NextLevelP10; $_ptr_NextLevelP2; $_ptr_NextLevelP3; $_ptr_NextLevelP4; $_ptr_NextLevelP5)
	C_POINTER:C301($_ptr_NextLevelP6; $_ptr_NextLevelP7; $_ptr_NextLevelP8; $_ptr_NextLevelP9; $_ptr_ProdSelected; $_ptr_ProductAdd; $_ptr_ProductCode; $_ptr_ProductCodes; $_ptr_ProductCount; $_ptr_ProductCounts; $_ptr_ProductDelete)
	C_POINTER:C301($_ptr_ProductID; $_ptr_ProductIDS; $_ptr_ProductList; $_ptr_ProductName; $_ptr_ProductNames; $_ptr_SubLevelAdd; $_ptr_SubLevelAddFurther; $_Ptr_SubLevelCount; $_ptr_SubLevelDelete; $_ptr_SubLevelEdit; $_Ptr_SubLevelLBArea)
	C_POINTER:C301($_ptr_SubLevelSelect)
	C_TEXT:C284($_t_CounSubLevelsSTR; $_t_LocationName; $_t_oldMethodName; $_t_ParentCode; $_t_ProdCodeLabelName; $_t_ProdCountLabelName; $_t_ProdNameLabelName; $_t_Singular; $_t_SubLevelLabel; $_t_SubLevelLabelName; $_t_SubLocationCode)
	C_TEXT:C284($_t_SubLocationDefault)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_LocationsEditor.oButtonAddFurtherSub10"; Form event code:C388)

$_l_CurrentLevel:=FORM Get current page:C276
$_l_HeaderLevel:=$_l_CurrentLevel-1
$_Ptr_AddSubLevelButton:=Get pointer:C304("STK_but_AddSub"+String:C10($_l_HeaderLevel))  //Add the first sub level..hidden if a location or has already got a sublevel or product assigned
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
	//$_Ptr_LocationCodesArray:=$_aptr_ColumnVariables{5}
	//$_ptr_Array4:=$_aptr_ColumnVariables{6}
	//$_ptr_Array8:=$_aptr_ColumnVariables{3}
	$_t_LocationName:=$_ptr_CurrentLocationSubLevName->
	ARRAY LONGINT:C221($_al_SubLocationsWithnoSubLevel; 0)
	ARRAY TEXT:C222($_at_NamedSubLocations; 0)
	For ($_l_index; 1; Size of array:C274($_ptr_Array9->))
		QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]ParentLocationID:3=$_ptr_Array2->{$_l_index})
		If (Records in selection:C76([LOCATIONS:61])=0)  //no sublocations
			APPEND TO ARRAY:C911($_al_SubLocationsWithnoSubLevel; $_ptr_Array2->{$_l_index})
		Else 
			If ($_ptr_Array4->{$_l_index}#"No Sublocations")
				$_l_LocationPosition:=Find in array:C230($_at_NamedSubLocations; $_ptr_Array4->{$_l_index})
				If ($_l_LocationPosition<0)
					APPEND TO ARRAY:C911($_at_NamedSubLocations; $_ptr_Array4->{$_l_index})
				End if 
			End if 
		End if 
	End for 
	If (Size of array:C274($_al_SubLocationsWithnoSubLevel)>0)
		//at least one sub level
		$_bo_AddSubLevels:=False:C215
		If (Size of array:C274($_al_SubLocationsWithnoSubLevel)<Size of array:C274($_ptr_Array2->))
			//at least on sub level had a subleve of its own
			Gen_Confirm("Some "+$_t_LocationName+" Already have sublevels, do you wish to add sublevels only to those with no suble"+"vel"; "No"; "Yes")
			If ($_l_Ok=0)
				$_bo_AddSubLevels:=True:C214
			End if 
			$_l_Ok:=1
		Else 
			//None of these had sublevels.
			$_bo_AddSubLevels:=True:C214
		End if 
		If ($_bo_AddSubLevels)
			$_t_SubLevelLabel:=Gen_Request("How are the "+$_t_LocationName+" divided?"; "")
			//```
			If ($_t_SubLevelLabel#"") & ($_l_Ok=1)
				$_t_Singular:=GenWordSingle($_t_SubLevelLabel)
				Case of   // These default names are just so we can populate something into the request box that looks sensible
					: ($_t_SubLevelLabel="Showrooms") | ($_t_SubLevelLabel="Showrooms")
						$_t_SubLocationDefault:="SHOW"
					: ($_t_SubLevelLabel="Rooms") | ($_t_SubLevelLabel="Room") | ($_t_SubLevelLabel="Store Room") | ($_t_SubLevelLabel="Store Rooms")
						$_t_SubLocationDefault:="RM"
					: ($_t_SubLevelLabel="Floors") | ($_t_SubLevelLabel="Floor")
						$_t_SubLocationDefault:="FLR"
					: ($_t_SubLevelLabel="Rows")
						$_t_SubLocationDefault:="ROW"
					: ($_t_SubLevelLabel="Bins") | ($_t_SubLevelLabel="Bin")
						$_t_SubLocationDefault:="BIN"
					: ($_t_SubLevelLabel="Shelves") | ($_t_SubLevelLabel="Shelf")
						$_t_SubLocationDefault:="SH"
					: ($_t_SubLevelLabel="Tunnels") | ($_t_SubLevelLabel="Tunnel")
						$_t_SubLocationDefault:="TUN"
					Else 
						If (Length:C16($_t_SubLevelLabel)>1)
							$_t_SubLocationDefault:=Substring:C12($_t_SubLevelLabel; 1; 2)
						Else 
							$_t_SubLocationDefault:=$_t_SubLevelLabel
						End if 
				End case 
				$_t_SubLocationCode:=Gen_Request("Enter "+$_t_Singular+"Coding prefix"; $_t_SubLocationDefault)
				If ($_t_SubLocationCode#"") & ($_l_Ok=1)
					$_t_CounSubLevelsSTR:=Gen_Request("How many "+$_t_SubLevelLabel; "1")
					If (Num:C11($_t_CounSubLevelsSTR)>0)
						$_l_NumberOfElements:=$_al_SubLocationsWithnoSubLevel*Num:C11($_t_CounSubLevelsSTR)
						$_l_ElementsPerParent:=Num:C11($_t_CounSubLevelsSTR)
						
						$_Ptr_LocationNamesArray:=Get pointer:C304("STK_at_SubLocationNames"+String:C10($_l_CurrentLevel+1))
						$_ptr_Array2:=Get pointer:C304("STK_al_SubLocationsIDs"+String:C10($_l_CurrentLevel+1))
						$_Ptr_LocationCodesArray:=Get pointer:C304("STK_at_SubLocationCodes"+String:C10($_l_CurrentLevel+1))
						$_ptr_Array4:=Get pointer:C304("STK_at_SubLevelLabel"+String:C10($_l_CurrentLevel+1))
						$_ptr_Array5:=Get pointer:C304("STK_al_SubCodingPref"+String:C10($_l_CurrentLevel+1))
						$_ptr_Array6:=Get pointer:C304("STK_al_SubParentLocation"+String:C10($_l_CurrentLevel+1))
						$_ptr_Array7:=Get pointer:C304("STK_abo_SUBRECORDMODIFIED"+String:C10($_l_CurrentLevel+1))
						$_ptr_Array8:=Get pointer:C304("STK_at_SubLocProdCode"+String:C10($_l_CurrentLevel+1))
						$_ptr_Array9:=Get pointer:C304("STK_at_SubLocProdName"+String:C10($_l_CurrentLevel+1))
						$_ptr_Array10:=Get pointer:C304("STK_at_SubLocHolds"+String:C10($_l_CurrentLevel+1))
						ARRAY TEXT:C222($_Ptr_LocationNamesArray->; $_l_NumberOfElements)
						ARRAY LONGINT:C221($_ptr_Array2->; $_l_NumberOfElements)
						ARRAY TEXT:C222($_Ptr_LocationCodesArray->; $_l_NumberOfElements)
						ARRAY TEXT:C222($_ptr_Array4->; $_l_NumberOfElements)
						ARRAY LONGINT:C221($_ptr_Array5->; $_l_NumberOfElements)
						ARRAY LONGINT:C221($_ptr_Array6->; $_l_NumberOfElements)
						ARRAY BOOLEAN:C223($_ptr_Array7->; $_l_NumberOfElements)
						ARRAY TEXT:C222($_ptr_Array8->; $_l_NumberOfElements)
						ARRAY TEXT:C222($_ptr_Array9->; $_l_NumberOfElements)
						ARRAY TEXT:C222($_ptr_Array10->; $_l_NumberOfElements)
						$_l_CurrentElement:=1
						For ($_l_Parents; 1; Size of array:C274($_al_SubLocationsWithnoSubLevel))
							QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=$_al_SubLocationsWithnoSubLevel{$_l_Parents})
							$_t_ParentCode:=[LOCATIONS:61]Location_Code:1
							For ($_l_index; 1; $_l_ElementsPerParent)
								If ($_Ptr_LocationCodesArray->{$_l_index}="")  //Location not coded yet
									$_Ptr_LocationCodesArray->{$_l_index}:=$_t_ParentCode+$_t_SubLocationCode+String:C10($_l_index)
								End if 
								If ($_Ptr_LocationNamesArray->{$_l_index}="")
									$_Ptr_LocationNamesArray->{$_l_index}:=$_t_ParentCode+", "+$_t_Singular+" "+String:C10($_l_index)
								End if 
								If ($_ptr_Array2->{$_l_index}=0)
									STK_l_Subid:=0
									$_ptr_Array2->{$_l_index}:=AA_GetNextID(->[LOCATIONS:61]LocationID:4)
								End if 
								If ($_ptr_Array4->{$_l_index}="")
									$_ptr_Array4->{$_l_index}:=""
								End if 
								$_ptr_Array6->{$_l_index}:=$_al_SubLocationsWithnoSubLevel{$_l_Parents}
								$_ptr_Array7->{$_l_index}:=True:C214
								$_ptr_Array8->{$_l_index}:="Unknown"
								$_ptr_Array9->{$_l_index}:=""
								CREATE RECORD:C68([LOCATIONS:61])
								[LOCATIONS:61]Location_Code:1:=$_Ptr_LocationCodesArray->{$_l_index}
								[LOCATIONS:61]Location_Name:2:=$_Ptr_LocationNamesArray->{$_l_index}
								[LOCATIONS:61]LocationCodePrefix:5:=$_t_ParentCode
								[LOCATIONS:61]LocationID:4:=$_ptr_Array2->{$_l_index}
								[LOCATIONS:61]ParentLocationID:3:=$_al_SubLocationsWithnoSubLevel{$_l_Parents}
								//[LOCATIONS]Sub_LocationNamingPref
								[LOCATIONS:61]Sub_location_Labelled:6:=""
								DB_SaveRecord(->[LOCATIONS:61])
								QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=$_al_SubLocationsWithnoSubLevel{$_l_Parents})
								[LOCATIONS:61]Sub_location_Labelled:6:=$_t_SubLevelLabel
								DB_SaveRecord(->[LOCATIONS:61])
							End for 
						End for 
						
					Else 
						
						
					End if 
				End if 
			End if 
			
			
			//```
		End if 
	Else 
		//drill down to the next level
		
		ARRAY LONGINT:C221($_al_SubLevelParentIDS; 0)
		Repeat 
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
			//$_ptr_Array2:=Get pointer("STK_al_SubLocationsIDs"+String($_l_CurrentLevel))
			//$_ptr_Array4:=Get pointer("STK_at_SubLevelLabel"+String($_l_CurrentLevel))
			//``
			$_ptr_NextLevel1:=Get pointer:C304("STK_at_SubLocationNames"+String:C10($_l_CurrentLevel+1))
			$_ptr_NextLevel2:=Get pointer:C304("STK_al_SubLocationsIDs"+String:C10($_l_CurrentLevel+1))
			$_ptr_NextLevel3:=Get pointer:C304("STK_at_SubLocationCodes"+String:C10($_l_CurrentLevel+1))
			$_ptr_NextLevel4:=Get pointer:C304("STK_at_SubLevelLabel"+String:C10($_l_CurrentLevel+1))
			$_ptr_NextLevel5:=Get pointer:C304("STK_al_SubCodingPref"+String:C10($_l_CurrentLevel+1))
			$_ptr_NextLevel6:=Get pointer:C304("STK_al_SubParentLocation"+String:C10($_l_CurrentLevel+1))
			$_ptr_NextLevel7:=Get pointer:C304("STK_abo_SUBRECORDMODIFIED"+String:C10($_l_CurrentLevel+1))
			$_ptr_NextLevel8:=Get pointer:C304("STK_at_SubLocProdCode"+String:C10($_l_CurrentLevel+1))
			$_ptr_NextLevel9:=Get pointer:C304("STK_at_SubLocProdName"+String:C10($_l_CurrentLevel+1))
			$_ptr_NextLevel10:=Get pointer:C304("STK_at_SubLocHolds"+String:C10($_l_CurrentLevel+1))
			ARRAY TEXT:C222($_ptr_NextLevel1->; 0)
			ARRAY LONGINT:C221($_ptr_NextLevel2->; 0)
			ARRAY TEXT:C222($_ptr_NextLevel3->; 0)
			ARRAY TEXT:C222($_ptr_NextLevel4->; 0)
			ARRAY LONGINT:C221($_ptr_NextLevel5->; 0)
			ARRAY LONGINT:C221($_ptr_NextLevel6->; 0)
			ARRAY BOOLEAN:C223($_ptr_NextLevel7->; 0)
			ARRAY TEXT:C222($_ptr_NextLevel8->; 0)
			ARRAY TEXT:C222($_ptr_NextLevel9->; 0)
			ARRAY TEXT:C222($_ptr_NextLevel10->; 0)
			//```
			//ARRAY LONGINT($_ptr_NextLevel2->;0)
			//ARRAY TEXT($_ptr_NextLevel4->;0)
			$_l_ID:=0
			ARRAY LONGINT:C221($_al_SubLevelParentIDS; 0)
			ARRAY LONGINT:C221($_al_NextLevelIDsTemp; 0)
			$_bo_SubLevelsCreated:=False:C215
			For ($_l_index; 1; Size of array:C274($_ptr_Array2->))
				$_t_LocationName:=$_ptr_Array4->{$_l_index}
				$_l_ID:=$_ptr_Array2->{$_l_index}
				QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]ParentLocationID:3=$_l_ID)
				SELECTION TO ARRAY:C260([LOCATIONS:61]LocationID:4; $_al_NextLevelIDsTemp; [LOCATIONS:61]Sub_location_Labelled:6; $_at_NextLevelLabelTEMP; [LOCATIONS:61]Location_Name:2; $_at_NextLevelNamesTEMP; [LOCATIONS:61]Location_Code:1; $_at_NextLevelCodesTEMP; [LOCATIONS:61]ParentLocationID:3; $_al_NextLevelParentIDTEMP)
				For ($_l_index2; 1; Size of array:C274($_al_NextLevelIDsTemp))
					APPEND TO ARRAY:C911($_ptr_NextLevel1->; $_at_NextLevelNamesTEMP{$_l_index2})
					APPEND TO ARRAY:C911($_ptr_NextLevel2->; $_al_NextLevelIDsTemp{$_l_index2})
					APPEND TO ARRAY:C911($_ptr_NextLevel3->; $_at_NextLevelCodesTEMP{$_l_index2})
					APPEND TO ARRAY:C911($_ptr_NextLevel4->; $_at_NextLevelLabelTEMP{$_l_index2})
					APPEND TO ARRAY:C911($_ptr_NextLevel5->; 0)
					APPEND TO ARRAY:C911($_ptr_NextLevel6->; $_al_NextLevelParentIDTEMP{$_l_index2})
					APPEND TO ARRAY:C911($_ptr_NextLevel7->; False:C215)
					APPEND TO ARRAY:C911($_ptr_NextLevel8->; "")
					APPEND TO ARRAY:C911($_ptr_NextLevel9->; "")
				End for 
			End for 
			//We now have an array of all the IDs at the next level..we can test if these have sublevels
			ARRAY LONGINT:C221($_al_SubLocationsWithnoSubLevel; 0)
			ARRAY TEXT:C222($_at_NamedSubLocations; 0)
			For ($_l_index; 1; $_ptr_NextLevel2->)
				QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]ParentLocationID:3=$_ptr_NextLevel2->{$_l_index})
				If (Records in selection:C76([LOCATIONS:61])=0)  //no sublocations
					APPEND TO ARRAY:C911($_al_SubLocationsWithnoSubLevel; $_ptr_NextLevel2->{$_l_index})
				Else 
					If ($_ptr_NextLevel4->{$_l_index}#"No Sublocations")
						$_l_LocationPosition:=Find in array:C230($_at_NamedSubLocations; $_ptr_NextLevel4->{$_l_index})
						If ($_l_LocationPosition<0)
							APPEND TO ARRAY:C911($_at_NamedSubLocations; $_ptr_NextLevel4->{$_l_index})
						End if 
					End if 
				End if 
			End for 
			If (Size of array:C274($_al_SubLocationsWithnoSubLevel)>0)
				//at least one sub level
				$_bo_AddSubLevels:=False:C215
				If (Size of array:C274($_al_SubLocationsWithnoSubLevel)<Size of array:C274($_Ptr_LocationCodesArray->))
					//at least on sub level had a subleve of its own
					Gen_Confirm("Some "+$_t_LocationName+" Already have sublevels, do you wish to add sublevels only to those with no suble"+"vel"; "No"; "Yes")
					If ($_l_Ok=0)
						$_bo_AddSubLevels:=True:C214
					End if 
					$_l_Ok:=1
				Else 
					//None of these had sublevels.
					$_bo_AddSubLevels:=True:C214
				End if 
				If ($_bo_AddSubLevels)
					$_t_SubLevelLabel:=Gen_Request("How is the "+$_t_LocationName+" divided?"; "Bins")
					//```
					If ($_t_SubLevelLabel#"") & ($_l_Ok=1)
						$_t_Singular:=GenWordSingle($_t_SubLevelLabel)
						Case of   // These default names are just so we can populate something into the request box that looks sensible
							: ($_t_SubLevelLabel="Showrooms") | ($_t_SubLevelLabel="Showrooms")
								$_t_SubLocationDefault:="SHOW"
							: ($_t_SubLevelLabel="Rooms") | ($_t_SubLevelLabel="Room") | ($_t_SubLevelLabel="Store Room") | ($_t_SubLevelLabel="Store Rooms")
								$_t_SubLocationDefault:="RM"
							: ($_t_SubLevelLabel="Floors") | ($_t_SubLevelLabel="Floor")
								$_t_SubLocationDefault:="FLR"
							: ($_t_SubLevelLabel="Rows")
								$_t_SubLocationDefault:="ROW"
							: ($_t_SubLevelLabel="Bins") | ($_t_SubLevelLabel="Bin")
								$_t_SubLocationDefault:="BIN"
							: ($_t_SubLevelLabel="Shelves") | ($_t_SubLevelLabel="Shelf")
								$_t_SubLocationDefault:="SH"
							: ($_t_SubLevelLabel="Tunnels") | ($_t_SubLevelLabel="Tunnel")
								$_t_SubLocationDefault:="TUN"
							Else 
								If (Length:C16($_t_SubLevelLabel)>1)
									$_t_SubLocationDefault:=Substring:C12($_t_SubLevelLabel; 1; 2)
								Else 
									$_t_SubLocationDefault:=$_t_SubLevelLabel
								End if 
						End case 
						$_t_SubLocationCode:=Gen_Request("Enter "+$_t_Singular+"Coding prefix"; $_t_SubLocationDefault)
						If ($_t_SubLocationCode#"") & ($_l_Ok=1)
							$_t_CounSubLevelsSTR:=Gen_Request("How many "+$_t_SubLevelLabel; "1")
							If (Num:C11($_t_CounSubLevelsSTR)>0)
								$_l_NumberOfElements:=$_al_SubLocationsWithnoSubLevel*Num:C11($_t_CounSubLevelsSTR)
								$_l_ElementsPerParent:=Num:C11($_t_CounSubLevelsSTR)
								
								$_ptr_NextLevelP1:=Get pointer:C304("STK_at_SubLocationNames"+String:C10($_l_CurrentLevel+1))
								$_ptr_NextLevelP2:=Get pointer:C304("STK_al_SubLocationsIDs"+String:C10($_l_CurrentLevel+1))
								$_ptr_NextLevelP3:=Get pointer:C304("STK_at_SubLocationCodes"+String:C10($_l_CurrentLevel+1))
								$_ptr_NextLevelP4:=Get pointer:C304("STK_at_SubLevelLabel"+String:C10($_l_CurrentLevel+1))
								$_ptr_NextLevelP5:=Get pointer:C304("STK_al_SubCodingPref"+String:C10($_l_CurrentLevel+1))
								$_ptr_NextLevelP6:=Get pointer:C304("STK_al_SubParentLocation"+String:C10($_l_CurrentLevel+1))
								$_ptr_NextLevelP7:=Get pointer:C304("STK_abo_SUBRECORDMODIFIED"+String:C10($_l_CurrentLevel+1))
								$_ptr_NextLevelP8:=Get pointer:C304("STK_at_SubLocProdCode"+String:C10($_l_CurrentLevel+1))
								$_ptr_NextLevelP9:=Get pointer:C304("STK_at_SubLocProdName"+String:C10($_l_CurrentLevel+1))
								$_ptr_NextLevelP10:=Get pointer:C304("STK_at_SubLocHolds"+String:C10($_l_CurrentLevel+1))
								ARRAY TEXT:C222($_ptr_NextLevelp1->; $_l_NumberOfElements)
								ARRAY LONGINT:C221($_ptr_NextLevelp2->; $_l_NumberOfElements)
								ARRAY TEXT:C222($_ptr_NextLevelp3->; $_l_NumberOfElements)
								ARRAY TEXT:C222($_ptr_NextLevelp4->; $_l_NumberOfElements)
								ARRAY LONGINT:C221($_ptr_NextLevelp5->; $_l_NumberOfElements)
								ARRAY LONGINT:C221($_ptr_NextLevelp6->; $_l_NumberOfElements)
								ARRAY BOOLEAN:C223($_ptr_NextLevelp7->; $_l_NumberOfElements)
								ARRAY TEXT:C222($_ptr_NextLevelp8->; $_l_NumberOfElements)
								ARRAY TEXT:C222($_ptr_NextLevelp9->; $_l_NumberOfElements)
								ARRAY TEXT:C222($_ptr_NextLevelp10->; $_l_NumberOfElements)
								$_l_CurrentElement:=1
								For ($_l_Parents; 1; Size of array:C274($_al_SubLocationsWithnoSubLevel))
									QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=$_al_SubLocationsWithnoSubLevel{$_l_Parents})
									$_t_ParentCode:=[LOCATIONS:61]Location_Code:1
									For ($_l_index; 1; $_l_ElementsPerParent)
										If ($_Ptr_LocationCodesArray->{$_l_index}="")  //Location not coded yet
											$_Ptr_LocationCodesArray->{$_l_index}:=$_t_ParentCode+$_t_SubLocationCode+String:C10($_l_index)
										End if 
										If ($_Ptr_LocationNamesArray->{$_l_index}="")
											$_Ptr_LocationNamesArray->{$_l_index}:=$_t_ParentCode+", "+$_t_Singular+" "+String:C10($_l_index)
										End if 
										If ($_ptr_Array2->{$_l_index}=0)
											STK_l_Subid:=0
											$_ptr_Array2->{$_l_index}:=AA_GetNextID(->[LOCATIONS:61]LocationID:4)
										End if 
										If ($_ptr_Array4->{$_l_index}="")
											$_ptr_Array4->{$_l_index}:=""
										End if 
										$_ptr_Array6->{$_l_index}:=$_al_SubLocationsWithnoSubLevel{$_l_Parents}
										$_ptr_Array7->{$_l_index}:=True:C214
										$_ptr_Array8->{$_l_index}:="Unknown"
										$_ptr_Array9->{$_l_index}:=""
										$_ptr_Array10->{$_l_index}:="Unknown"
										CREATE RECORD:C68([LOCATIONS:61])
										[LOCATIONS:61]Location_Code:1:=$_Ptr_LocationCodesArray->{$_l_index}
										[LOCATIONS:61]Location_Name:2:=$_Ptr_LocationNamesArray->{$_l_index}
										[LOCATIONS:61]LocationCodePrefix:5:=$_t_ParentCode
										[LOCATIONS:61]LocationID:4:=$_ptr_Array2->{$_l_index}
										[LOCATIONS:61]ParentLocationID:3:=$_al_SubLocationsWithnoSubLevel{$_l_Parents}
										//[LOCATIONS]Sub_LocationNamingPref
										[LOCATIONS:61]Sub_location_Labelled:6:=""
										DB_SaveRecord(->[LOCATIONS:61])
										QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=$_al_SubLocationsWithnoSubLevel{$_l_Parents})
										[LOCATIONS:61]Sub_location_Labelled:6:=$_t_SubLevelLabel
										DB_SaveRecord(->[LOCATIONS:61])
										
									End for 
								End for 
								
							Else 
								
								
							End if 
						End if 
					End if 
					
					
					//```
				End if 
				
			Else 
				$_l_CurrentLevel:=$_l_CurrentLevel+1
			End if 
		Until ($_bo_SubLevelsCreated) | ($_l_CurrentLevel=10)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].STK_LocationsEditor.oButtonAddFurtherSub10"; $_t_oldMethodName)