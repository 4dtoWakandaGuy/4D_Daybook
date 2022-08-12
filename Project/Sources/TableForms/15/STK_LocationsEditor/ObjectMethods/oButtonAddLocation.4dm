If (False:C215)
	//object Name: [USER]STK_LocationsEditor.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_ArraySize; $_l_CurrentLevel; $_l_FirstSubLocationID; $_l_HeaderLevel; $_l_isUnique; $_l_NewLocationRef)
	C_POINTER:C301($_Ptr_addProductButton; $_Ptr_addSubLevelButton; $_ptr_Array1; $_ptr_Array10; $_ptr_Array2; $_ptr_Array3; $_ptr_Array4; $_ptr_Array5; $_ptr_Array6; $_ptr_Array7; $_ptr_Array8)
	C_POINTER:C301($_ptr_Array9; $_ptr_CurrentLocation; $_ptr_CurrentLocationCode; $_ptr_CurrentLocationCount; $_ptr_CurrentLocationID; $_ptr_CurrentLocationSubLevName; $_Ptr_HeaderLBArea; $_Ptr_LocationCode; $_Ptr_LocationIDSArray; $_ptr_LocationNameArray; $_ptr_ParentLocationCode)
	C_POINTER:C301($_ptr_ParentLocationID; $_ptr_ParentLocationSubLabel; $_Ptr_ProdCodeArray; $_ptr_ProdSelected; $_ptr_ProductAdd; $_ptr_ProductCode; $_ptr_ProductCodeArray; $_ptr_ProductCodes; $_ptr_ProductCount; $_ptr_ProductCounts; $_ptr_ProductDelete)
	C_POINTER:C301($_ptr_ProductID; $_ptr_ProductIDS; $_ptr_ProductList; $_ptr_ProductName; $_ptr_ProductNames; $_ptr_SubLevelAdd; $_ptr_SubLevelAddFurther; $_Ptr_SubLevelCount; $_ptr_SubLevelDelete; $_ptr_SubLevelEdit; $_Ptr_SubLevelLBArea)
	C_POINTER:C301($_ptr_SubLevelSelect; $_Ptr_SubLocationNamesArray)
	C_TEXT:C284($_t_oldMethodName; $_t_ProdCodeLabelName; $_t_ProdCountLabelName; $_t_ProdNameLabelName; $_t_Singular; $_t_SubLevelLabel; $_t_SubLevelLabelName; $_t_SubLocationCode; $_t_SubLocationDefault)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_LocationsEditor.Variable9"; Form event code:C388)

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

//$_CurrentHeader:=FORM Get current page-1
ARRAY TEXT:C222($_at_ColumnNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
$_Ptr_HeaderLBArea:=Get pointer:C304("STK_lb_Level"+String:C10($_l_HeaderLevel))
LISTBOX GET ARRAYS:C832($_Ptr_HeaderLBArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
$_Ptr_LocationCode:=$_aptr_ColumnVariables{2}
$_ptr_LocationNameArray:=$_aptr_ColumnVariables{1}
$_Ptr_LocationIDSArray:=$_aptr_ColumnVariables{7}
$_Ptr_SubLocationNamesArray:=$_aptr_ColumnVariables{6}
$_Ptr_ProdCodeArray:=$_aptr_ColumnVariables{4}
$_l_ArraySize:=Size of array:C274($_ptr_ProductCodeArray->)

LISTBOX INSERT ROWS:C913($_Ptr_HeaderLBArea->; $_l_ArraySize+1)
LB_SetScroll($_Ptr_HeaderLBArea; $_l_ArraySize+1)
OBJECT SET VISIBLE:C603($_Ptr_AddSubLevelButton->; True:C214)
OBJECT SET VISIBLE:C603($_Ptr_addProductButton->; True:C214)
OBJECT SET VISIBLE:C603($_Ptr_SubLevelLBArea->; False:C215)
OBJECT SET VISIBLE:C603(*; $_t_SubLevelLabelName; False:C215)
OBJECT SET VISIBLE:C603(*; $_t_ProdCodeLabelName; False:C215)
OBJECT SET VISIBLE:C603(*; $_t_ProdNameLabelName; False:C215)
OBJECT SET VISIBLE:C603(*; $_t_ProdCountLabelName; False:C215)

OBJECT SET VISIBLE:C603($_Ptr_SubLevelCount->; False:C215)
OBJECT SET VISIBLE:C603($_ptr_SubLevelAddFurther->; False:C215)
OBJECT SET VISIBLE:C603($_ptr_SubLevelEdit->; False:C215)
OBJECT SET VISIBLE:C603($_ptr_SubLevelDelete->; False:C215)
OBJECT SET VISIBLE:C603($_ptr_SubLevelAdd->; False:C215)
OBJECT SET VISIBLE:C603($_ptr_ProductList->; False:C215)
OBJECT SET VISIBLE:C603($_ptr_ProductCode->; False:C215)
OBJECT SET VISIBLE:C603($_ptr_ProductID->; False:C215)
OBJECT SET VISIBLE:C603($_ptr_ProductName->; False:C215)
OBJECT SET VISIBLE:C603($_ptr_ProductCount->; False:C215)
OBJECT SET VISIBLE:C603($_ptr_ProductDelete->; False:C215)
OBJECT SET VISIBLE:C603($_ptr_ProductAdd->; False:C215)
OBJECT SET ENTERABLE:C238($_Ptr_SubLevelCount->; False:C215)
ARRAY LONGINT:C221($_ptr_ProductIDS->; 0)
ARRAY TEXT:C222($_ptr_ProductCodes->; 0)
ARRAY TEXT:C222($_ptr_ProductNames->; 0)
ARRAY REAL:C219($_ptr_ProductCounts->; 0)
$_ptr_Array1:=Get pointer:C304("STK_at_SubLocationNames"+String:C10($_l_CurrentLevel))
$_ptr_Array2:=Get pointer:C304("STK_al_SubLocationsIDs"+String:C10($_l_CurrentLevel))
$_ptr_Array3:=Get pointer:C304("STK_at_SubLocationCodes"+String:C10($_l_CurrentLevel))
$_ptr_Array4:=Get pointer:C304("STK_at_SubLevelLabel"+String:C10($_l_CurrentLevel))
$_ptr_Array5:=Get pointer:C304("STK_al_SubCodingPref"+String:C10($_l_CurrentLevel))
$_ptr_Array6:=Get pointer:C304("STK_al_SubParentLocation"+String:C10($_l_CurrentLevel))
$_ptr_Array7:=Get pointer:C304("STK_abo_SUBRECORDMODIFIED"+String:C10($_l_CurrentLevel))
$_ptr_Array8:=Get pointer:C304("STK_at_SubLocProdCode"+String:C10($_l_CurrentLevel))
$_ptr_Array9:=Get pointer:C304("STK_at_SubLocProdName"+String:C10($_l_CurrentLevel))
$_ptr_Array10:=Get pointer:C304("STK_at_SubLocHolds"+String:C10($_l_CurrentLevel))
ARRAY TEXT:C222($_ptr_Array1->; 0)
ARRAY LONGINT:C221($_ptr_Array2->; 0)
ARRAY TEXT:C222($_ptr_Array3->; 0)
ARRAY TEXT:C222($_ptr_Array4->; 0)
ARRAY LONGINT:C221($_ptr_Array5->; 0)
ARRAY LONGINT:C221($_ptr_Array6->; 0)
ARRAY BOOLEAN:C223($_ptr_Array7->; 0)
ARRAY TEXT:C222($_ptr_Array8->; 0)
ARRAY TEXT:C222($_ptr_Array9->; 0)
ARRAY TEXT:C222($_ptr_Array10->; 0)
$_ptr_SubLevelSelect->:=0
$_ptr_ProdSelected->:=0
$_ptr_CurrentLocation->:=$_ptr_LocationNameArray->{$_l_ArraySize+1}
$_ptr_CurrentLocationCode->:=$_Ptr_LocationCode->{$_l_ArraySize+1}
$_ptr_CurrentLocationID->:=$_Ptr_LocationIDSArray->{$_l_ArraySize+1}
$_ptr_CurrentLocationID->:=-1  //so we easily find it!!
$_ptr_CurrentLocationSubLevName->:=$_Ptr_SubLocationNamesArray->{$_l_ArraySize+1}
OBJECT SET ENTERABLE:C238($_ptr_CurrentLocation->; True:C214)

If (FORM Get current page:C276=1)
	OBJECT SET ENTERABLE:C238($_ptr_CurrentLocationCode->; True:C214)
Else 
	OBJECT SET ENTERABLE:C238($_ptr_CurrentLocationCode->; False:C215)
	$_ptr_ParentLocationCode:=Get pointer:C304("STK_t_CurrentLocationCode"+String:C10($_l_HeaderLevel-1))  //Selected location code
	$_ptr_ParentLocationSubLabel:=Get pointer:C304("STK_at_LevelLabel"+String:C10($_l_HeaderLevel-1))
	$_t_Singular:=GenWordSingle($_ptr_ParentLocationSubLabel->)
	If (Size of array:C274($_Ptr_LocationCode->)=1)  //THis is the first sublocation...(highly unlikelty but still)
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
		
		Repeat 
			$_t_SubLocationCode:=Gen_Request("Enter "+$_t_Singular+" Coding prefix"; $_t_SubLocationDefault)
			If ($_t_SubLocationCode="")
				Gen_Alert("Sorry you must give this a coding, to cancel enter a code then do not save  the l"+"ocatio"+"n.")
			End if 
		Until ($_t_SubLocationCode#"")
	Else 
		$_l_FirstSubLocationID:=$_Ptr_LocationIDSArray->{1}
		QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=$_l_FirstSubLocationID)
		$_t_SubLocationCode:=[LOCATIONS:61]LocationCodePrefix:5
	End if 
	
	$_ptr_ParentLocationID:=Get pointer:C304("STK_l_currentLocation"+String:C10($_l_HeaderLevel-1))  //Selected location ID
	$_l_NewLocationRef:=Size of array:C274($_Ptr_LocationCode->)
	
	Repeat 
		$_ptr_CurrentLocationCode->:=$_ptr_ParentLocationCode->+$_t_SubLocationCode+String:C10($_l_NewLocationRef)
		$_l_isUnique:=0
		SET QUERY DESTINATION:C396(3; $_l_isUnique)
		QUERY:C277([LOCATIONS:61]Location_Code:1; $_ptr_CurrentLocationCode->)
		SET QUERY DESTINATION:C396(0)
		If ($_l_isUnique>0)
			$_l_NewLocationRef:=$_l_NewLocationRef+1
		End if 
	Until ($_l_isUnique=0)
End if 

EDIT ITEM:C870($_Ptr_HeaderLBArea->; $_ptr_CurrentLocationCount->)
LB_SetScroll($_Ptr_HeaderLBArea; $_ptr_CurrentLocationCount->)

GOTO OBJECT:C206($_ptr_CurrentLocation->)
ERR_MethodTrackerReturn("OBJ [USER].STK_LocationsEditor.Variable9"; $_t_oldMethodName)