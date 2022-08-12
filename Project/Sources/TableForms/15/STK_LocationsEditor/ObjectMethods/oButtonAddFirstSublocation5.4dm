If (False:C215)
	//object Method Name: Object Name:      [USER].STK_LocationsEditor.oButtonAddFirstSublocation5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 21:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_CurrentLevel; $_l_HeaderLevel; $_l_Index; $_l_LocationPosition; SLOC1_l_BUT2; Sloc10_l_BUT2; Sloc2_l_BUT2; Sloc3_l_BUT2; Sloc4_l_BUT2; Sloc5_l_BUT2; Sloc6_l_BUT2)
	C_LONGINT:C283(Sloc7_l_BUT2; Sloc8_l_BUT2; Sloc9_l_BUT2; SSLOC1_l_BUT1; SSLOC1_l_BUT10; SSLOC1_l_BUT3; SSLOC1_l_BUT4; SSLOC1_l_BUT5; SSLOC1_l_BUT7; SSLOC1_l_BUT8; SSLOC1_l_BUT9)
	C_LONGINT:C283(SSLOC1_L6; SSloc10_l_BUT1; SSloc10_l_BUT10; SSloc10_l_BUT3; SSloc10_l_BUT4; SSloc10_l_BUT5; SSloc10_l_BUT7; SSloc10_l_BUT8; SSloc10_l_BUT9; SSloc10_L6; SSloc2_l_BUT1)
	C_LONGINT:C283(SSloc2_l_BUT3; SSloc2_l_BUT4; SSloc2_l_BUT5; SSloc2_l_BUT7; SSloc2_l_BUT8; SSloc2_l_BUT9SSloc2_l_BUT10; SSloc2_L6; SSloc3_l_BUT1; SSloc3_l_BUT3; SSloc3_l_BUT4; SSloc3_l_BUT5)
	C_LONGINT:C283(SSloc3_l_BUT7; SSloc3_l_BUT8; SSloc3_l_BUT9SSloc3_l_BUT10; SSloc3_L6; SSloc4_l_BUT1; SSloc4_l_BUT10; SSloc4_l_BUT3; SSloc4_l_BUT4; SSloc4_l_BUT5; SSloc4_l_BUT7; SSloc4_l_BUT8)
	C_LONGINT:C283(SSloc4_l_BUT9; SSloc4_L6; SSloc5_l_BUT1; SSloc5_l_BUT10; SSloc5_l_BUT3; SSloc5_l_BUT4; SSloc5_l_BUT5; SSloc5_l_BUT7; SSloc5_l_BUT8; SSloc5_l_BUT9; SSloc5_L6)
	C_LONGINT:C283(SSloc6_l_BUT1; SSloc6_l_BUT10; SSloc6_l_BUT3; SSloc6_l_BUT4; SSloc6_l_BUT5; SSloc6_l_BUT7; SSloc6_l_BUT8; SSloc6_l_BUT9; SSloc6_L6; SSloc7_l_BUT1; SSloc7_l_BUT10)
	C_LONGINT:C283(SSloc7_l_BUT3; SSloc7_l_BUT4; SSloc7_l_BUT5; SSloc7_l_BUT7; SSloc7_l_BUT8; SSloc7_l_BUT9; SSloc7_L6; SSloc8_l_BUT1; SSloc8_l_BUT10; SSloc8_l_BUT3; SSloc8_l_BUT4)
	C_LONGINT:C283(SSloc8_l_BUT5; SSloc8_l_BUT7; SSloc8_l_BUT8; SSloc8_l_BUT9; SSloc8_L6; SSloc9_l_BUT1; SSloc9_l_BUT10; SSloc9_l_BUT3; SSloc9_l_BUT4; SSloc9_l_BUT5; SSloc9_l_BUT7)
	C_LONGINT:C283(SSloc9_l_BUT8; SSloc9_l_BUT9; SSloc9_L6; STK_l_Subid)
	C_POINTER:C301($_Ptr_addProductButton; $_Ptr_addSubLevelButton; $_ptr_Array1; $_ptr_Array10; $_ptr_Array2; $_ptr_Array3; $_ptr_Array4; $_ptr_Array5; $_ptr_Array6; $_ptr_Array7; $_ptr_Array8)
	C_POINTER:C301($_ptr_Array9; $_ptr_CurrentLocation; $_ptr_CurrentLocationCode; $_ptr_CurrentLocationCount; $_ptr_CurrentLocationID; $_ptr_CurrentLocationSubLevName; $_Ptr_HeaderLBArea; $_Ptr_LocationHoldsArray; $_ptr_LocationIDSArray; $_Ptr_ProdCodeArray; $_Ptr_ProdNameArray)
	C_POINTER:C301($_ptr_ProdSelected; $_ptr_ProductAdd; $_ptr_ProductCode; $_ptr_ProductCodes; $_ptr_ProductCount; $_ptr_ProductCounts; $_ptr_ProductDelete; $_ptr_ProductID; $_ptr_ProductIDS; $_ptr_ProductList; $_ptr_ProductName)
	C_POINTER:C301($_ptr_ProductNames; $_ptr_SubLevelAdd; $_ptr_SubLevelAddFurther; $_Ptr_SubLevelCount; $_ptr_SubLevelDelete; $_ptr_SubLevelEdit; $_Ptr_SubLevelLBArea; $_ptr_SubLevelSelect; $_Ptr_SubLocationNamesArray)
	C_TEXT:C284($_t_ButtonName; $_t_CounSubLevelsSTR; $_t_ObjectName; $_t_oldMethodName; $_t_ProdCodeLabelName; $_t_ProdCountLabelName; $_t_ProdNameLabelName; $_t_Singular; $_t_SubLevelLabel; $_t_SubLevelLabelName; $_t_SubLocationCode)
	C_TEXT:C284($_t_SubLocationDefault; osubloc1_COL1; osubloc1_COL10; osubloc1_COL2; osubloc1_COL3; osubloc1_COL4; osubloc1_COL5; osubloc1_COL6; osubloc1_COL7; osubloc1_COL8; osubloc1_COL9)
	C_TEXT:C284(osubloc1_HED1; osubloc1_HED10; osubloc1_HED2; osubloc1_HED3; osubloc1_HED4; osubloc1_HED5; osubloc1_HED6; osubloc1_HED7; osubloc1_HED8; osubloc1_HED9; osubloc10_COL1)
	C_TEXT:C284(osubloc10_COL10; osubloc10_COL2; osubloc10_COL3; osubloc10_COL4; osubloc10_COL5; osubloc10_COL6; osubloc10_COL7; osubloc10_COL8; osubloc10_COL9; osubloc10_HED1; osubloc10_HED10)
	C_TEXT:C284(osubloc10_HED2; osubloc10_HED3; osubloc10_HED4; osubloc10_HED5; osubloc10_HED6; osubloc10_HED7; osubloc10_HED8; osubloc10_HED9; osubloc2_COL1; osubloc2_COL10; osubloc2_COL2)
	C_TEXT:C284(osubloc2_COL3; osubloc2_COL4; osubloc2_COL5; osubloc2_COL6; osubloc2_COL7; osubloc2_COL8; osubloc2_COL9; osubloc2_HED1; osubloc2_HED10; osubloc2_HED2; osubloc2_HED3)
	C_TEXT:C284(osubloc2_HED4; osubloc2_HED5; osubloc2_HED6; osubloc2_HED7; osubloc2_HED8; osubloc2_HED9; osubloc3_COL1; osubloc3_COL10; osubloc3_COL2; osubloc3_COL3; osubloc3_COL4)
	C_TEXT:C284(osubloc3_COL5; osubloc3_COL6; osubloc3_COL7; osubloc3_COL8; osubloc3_COL9; osubloc3_HED1; osubloc3_HED10; osubloc3_HED2; osubloc3_HED3; osubloc3_HED4; osubloc3_HED5)
	C_TEXT:C284(osubloc3_HED6; osubloc3_HED7; osubloc3_HED8; osubloc3_HED9; osubloc4_COL1; osubloc4_COL10; osubloc4_COL2; osubloc4_COL3; osubloc4_COL4; osubloc4_COL5; osubloc4_COL6)
	C_TEXT:C284(osubloc4_COL7; osubloc4_COL8; osubloc4_COL9; osubloc4_HED1; osubloc4_HED10; osubloc4_HED2; osubloc4_HED3; osubloc4_HED4; osubloc4_HED5; osubloc4_HED6; osubloc4_HED7)
	C_TEXT:C284(osubloc4_HED8; osubloc4_HED9; osubloc5_COL1; osubloc5_COL10; osubloc5_COL2; osubloc5_COL3; osubloc5_COL4; osubloc5_COL5; osubloc5_COL6; osubloc5_COL7; osubloc5_COL8)
	C_TEXT:C284(osubloc5_COL9; osubloc5_HED1; osubloc5_HED10; osubloc5_HED2; osubloc5_HED3; osubloc5_HED4; osubloc5_HED5; osubloc5_HED6; osubloc5_HED7; osubloc5_HED8; osubloc5_HED9)
	C_TEXT:C284(osubloc6_COL1; osubloc6_COL10; osubloc6_COL2; osubloc6_COL3; osubloc6_COL4; osubloc6_COL5; osubloc6_COL6; osubloc6_COL7; osubloc6_COL8; osubloc6_COL9; osubloc6_HED1)
	C_TEXT:C284(osubloc6_HED10; osubloc6_HED2; osubloc6_HED3; osubloc6_HED4; osubloc6_HED5; osubloc6_HED6; osubloc6_HED7; osubloc6_HED8; osubloc6_HED9; osubloc7_COL1; osubloc7_COL10)
	C_TEXT:C284(osubloc7_COL2; osubloc7_COL3; osubloc7_COL4; osubloc7_COL5; osubloc7_COL6; osubloc7_COL7; osubloc7_COL8; osubloc7_COL9; osubloc7_HED1; osubloc7_HED10; osubloc7_HED2)
	C_TEXT:C284(osubloc7_HED3; osubloc7_HED4; osubloc7_HED5; osubloc7_HED6; osubloc7_HED7; osubloc7_HED8; osubloc7_HED9; osubloc8_COL1; osubloc8_COL10; osubloc8_COL2; osubloc8_COL3)
	C_TEXT:C284(osubloc8_COL4; osubloc8_COL5; osubloc8_COL6; osubloc8_COL7; osubloc8_COL8; osubloc8_COL9; osubloc8_HED1; osubloc8_HED10; osubloc8_HED2; osubloc8_HED3; osubloc8_HED4)
	C_TEXT:C284(osubloc8_HED5; osubloc8_HED6; osubloc8_HED7; osubloc8_HED8; osubloc8_HED9; osubloc9_COL1; osubloc9_COL10; osubloc9_COL2; osubloc9_COL3; osubloc9_COL4; osubloc9_COL5)
	C_TEXT:C284(osubloc9_COL6; osubloc9_COL7; osubloc9_COL8; osubloc9_COL9; osubloc9_HED1; osubloc9_HED10; osubloc9_HED2; osubloc9_HED3; osubloc9_HED4; osubloc9_HED5; osubloc9_HED6)
	C_TEXT:C284(osubloc9_HED7; osubloc9_HED8; osubloc9_HED9)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_LocationsEditor.oButtonAddFirstSublocation5"; Form event code:C388)
//This button is only visible if the location does not have sublocations already.

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

$_Ptr_HeaderLBArea:=Get pointer:C304("STK_lb_Level"+String:C10($_l_HeaderLevel))
ARRAY TEXT:C222($_at_ColumnNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
LISTBOX GET ARRAYS:C832($_Ptr_HeaderLBArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
//In the columns column
$_Ptr_SubLocationNamesArray:=$_aptr_ColumnVariables{6}  //Pointer to array containing the product code
$_ptr_LocationIDSArray:=$_aptr_ColumnVariables{7}  //Pointer to array containing the ids
$_l_LocationPosition:=Find in array:C230($_ptr_LocationIDSArray->; $_ptr_CurrentLocationID->)


If ($_ptr_CurrentLocationID->>0)
	If ($_ptr_CurrentLocationSubLevName->="")
		If ($_ptr_ProductName->="") & (Size of array:C274($_ptr_ProductCodes->)=0)
			$_t_SubLevelLabel:=Gen_Request("How is this location divided?"; "Shelves")
			
			If ($_t_SubLevelLabel#"") & (OK=1)
				If ($_l_LocationPosition>0)
					$_Ptr_SubLocationNamesArray->{$_l_LocationPosition}:=$_t_SubLevelLabel
				End if 
				$_ptr_CurrentLocationSubLevName->:=$_t_SubLevelLabel
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
				$_t_SubLocationCode:=Gen_Request("Enter "+$_t_Singular+" Coding prefix"; $_t_SubLocationDefault)
				If ($_t_SubLocationCode#"") & (OK=1)
					
					$_t_CounSubLevelsSTR:=Gen_Request("How many "+$_t_SubLevelLabel; "1")
					If (Num:C11($_t_CounSubLevelsSTR)>0)
						//```
						$_Ptr_HeaderLBArea:=Get pointer:C304("STK_lb_Level"+String:C10($_l_HeaderLevel))
						ARRAY TEXT:C222($_at_ColumnNames; 0)
						ARRAY TEXT:C222($_at_HeaderNames; 0)
						ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
						ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
						ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
						ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
						LISTBOX GET ARRAYS:C832($_Ptr_HeaderLBArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
						//In the columns column
						
						$_Ptr_ProdCodeArray:=$_aptr_ColumnVariables{4}  //Pointer to array containing the product code
						$_Ptr_ProdNameArray:=$_aptr_ColumnVariables{5}  //Pointer to the array containing the product name
						$_Ptr_LocationHoldsArray:=$_aptr_ColumnVariables{3}  //Pointer to the array containing the Location holds
						$_ptr_LocationIDSArray:=$_aptr_ColumnVariables{7}  //Pointer to array containing the ids
						$_Ptr_SubLocationNamesArray:=$_aptr_ColumnVariables{6}
						$_l_LocationPosition:=Find in array:C230($_ptr_LocationIDSArray->; $_ptr_CurrentLocationID->)
						$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:=$_t_SubLevelLabel
						READ WRITE:C146([LOCATIONS:61])
						
						QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=$_ptr_CurrentLocationID->)
						[LOCATIONS:61]Sub_location_Labelled:6:=$_t_SubLevelLabel
						DB_SaveRecord(->[LOCATIONS:61])
						
						$_Ptr_SubLocationNamesArray->{$_l_LocationPosition}:=$_t_SubLevelLabel
						//```
						$_ptr_CurrentLocationCount->:=Num:C11($_t_CounSubLevelsSTR)
						
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
						ARRAY TEXT:C222($_ptr_Array1->; $_ptr_CurrentLocationCount->)
						ARRAY LONGINT:C221($_ptr_Array2->; $_ptr_CurrentLocationCount->)
						ARRAY TEXT:C222($_ptr_Array3->; $_ptr_CurrentLocationCount->)
						ARRAY TEXT:C222($_ptr_Array4->; $_ptr_CurrentLocationCount->)
						ARRAY LONGINT:C221($_ptr_Array5->; $_ptr_CurrentLocationCount->)
						ARRAY LONGINT:C221($_ptr_Array6->; $_ptr_CurrentLocationCount->)
						ARRAY BOOLEAN:C223($_ptr_Array7->; $_ptr_CurrentLocationCount->)
						ARRAY TEXT:C222($_ptr_Array8->; $_ptr_CurrentLocationCount->)
						ARRAY TEXT:C222($_ptr_Array9->; $_ptr_CurrentLocationCount->)
						ARRAY TEXT:C222($_ptr_Array10->; $_ptr_CurrentLocationCount->)
						For ($_l_Index; 1; Size of array:C274($_ptr_Array1->))
							If ($_ptr_Array3->{$_l_Index}="")  //Location not coded yet
								$_ptr_Array3->{$_l_Index}:=$_ptr_CurrentLocationCode->+$_t_SubLocationCode+String:C10($_l_Index)
							End if 
							If ($_ptr_Array1->{$_l_Index}="")
								$_ptr_Array1->{$_l_Index}:=$_ptr_CurrentLocation->+", "+$_t_Singular+" "+String:C10($_l_Index)
							End if 
							If ($_ptr_Array2->{$_l_Index}=0)
								STK_l_Subid:=0
								$_ptr_Array2->{$_l_Index}:=AA_GetNextID(->[LOCATIONS:61]LocationID:4)
							End if 
							If ($_ptr_Array4->{$_l_Index}="")
								$_ptr_Array4->{$_l_Index}:=""
							End if 
							$_ptr_Array6->{$_l_Index}:=$_ptr_CurrentLocationID->
							$_ptr_Array7->{$_l_Index}:=True:C214
							$_ptr_Array8->{$_l_Index}:=""
							$_ptr_Array9->{$_l_Index}:=""
							$_ptr_Array10->{$_l_Index}:="Unknown"
							CREATE RECORD:C68([LOCATIONS:61])
							[LOCATIONS:61]Location_Code:1:=$_ptr_Array3->{$_l_Index}
							[LOCATIONS:61]Location_Name:2:=$_ptr_Array1->{$_l_Index}
							[LOCATIONS:61]LocationCodePrefix:5:=$_ptr_CurrentLocationCode->
							[LOCATIONS:61]LocationID:4:=$_ptr_Array2->{$_l_Index}
							[LOCATIONS:61]ParentLocationID:3:=$_ptr_CurrentLocationID->
							//[LOCATIONS]Sub_LocationNamingPref
							[LOCATIONS:61]Sub_location_Labelled:6:=""
							DB_SaveRecord(->[LOCATIONS:61])
						End for 
						
						
						OBJECT SET TITLE:C194($_ptr_SubLevelAdd->; "Add "+$_t_Singular)
						OBJECT SET TITLE:C194($_ptr_SubLevelDelete->; "Delete "+$_t_Singular)
						OBJECT SET TITLE:C194($_ptr_SubLevelEdit->; "Edit "+$_t_Singular)
						//``
						OBJECT SET VISIBLE:C603($_Ptr_AddSubLevelButton->; False:C215)
						OBJECT SET VISIBLE:C603($_Ptr_addProductButton->; False:C215)
						OBJECT SET VISIBLE:C603($_Ptr_SubLevelLBArea->; True:C214)
						OBJECT SET VISIBLE:C603(*; $_t_SubLevelLabelName; True:C214)
						OBJECT SET VISIBLE:C603(*; $_t_ProdCodeLabelName; False:C215)
						OBJECT SET VISIBLE:C603(*; $_t_ProdNameLabelName; False:C215)
						OBJECT SET VISIBLE:C603(*; $_t_ProdCountLabelName; False:C215)
						
						OBJECT SET VISIBLE:C603($_Ptr_SubLevelCount->; True:C214)
						OBJECT SET VISIBLE:C603($_ptr_SubLevelAddFurther->; True:C214)
						OBJECT SET VISIBLE:C603($_ptr_SubLevelEdit->; True:C214)
						OBJECT SET VISIBLE:C603($_ptr_SubLevelDelete->; True:C214)
						OBJECT SET VISIBLE:C603($_ptr_SubLevelAdd->; True:C214)
						OBJECT SET VISIBLE:C603($_ptr_ProductList->; False:C215)
						OBJECT SET VISIBLE:C603($_ptr_ProductCode->; False:C215)
						OBJECT SET VISIBLE:C603($_ptr_ProductID->; False:C215)
						OBJECT SET VISIBLE:C603($_ptr_ProductName->; False:C215)
						OBJECT SET VISIBLE:C603($_ptr_ProductCount->; False:C215)
						OBJECT SET VISIBLE:C603($_ptr_ProductDelete->; False:C215)
						OBJECT SET VISIBLE:C603($_ptr_ProductAdd->; False:C215)
						OBJECT SET ENTERABLE:C238($_Ptr_SubLevelCount->; False:C215)
						If ($_l_HeaderLevel=0)
							OBJECT SET ENTERABLE:C238($_ptr_CurrentLocationCode->; True:C214)
						Else 
							OBJECT SET ENTERABLE:C238($_ptr_CurrentLocationCode->; False:C215)
						End if 
						
						
						//````
						
						
						
						
						
						
						
						
						
						
						$_t_ObjectName:="osubloc"+String:C10($_l_CurrentLevel)
						$_t_ButtonName:="SSLOC"+String:C10($_l_HeaderLevel)+"_l_"
						
						LB_SetupListbox($_Ptr_SubLevelLBArea; $_t_ObjectName; $_t_ButtonName; 1; $_ptr_Array1; $_ptr_Array3; $_ptr_Array10; $_ptr_Array8; $_ptr_Array9; $_ptr_Array2; $_ptr_Array4; $_ptr_Array5; $_ptr_Array6; $_ptr_Array7)
						
						LB_SetColumnHeaders($_Ptr_SubLevelLBArea; $_t_ButtonName; 1; "Location Point"; "Location Code"; "Location Holds"; "Product At location"; "Product Name"; "Location ID"; "Sub Locations"; "Sub Location Coding"; "Parent Location ID"; "Modified")
						
						LB_SetColumnWidths($_Ptr_SubLevelLBArea; $_t_ObjectName; 1; 190; 90; 90; 90; 190; 20; 20; 20; 20; 20)
						
						LB_SetScroll($_Ptr_SubLevelLBArea; -2; -3)
						LB_SETENTRYOPTIONS  // doesn't actually do anything ...
						LB_StyleSettings($_Ptr_SubLevelLBArea; "blue"; 9; $_t_ObjectName; ->[LOCATIONS:61])
						LB_SetScroll($_Ptr_SubLevelLBArea; -2; -2)
						LB_SetEnterable($_Ptr_SubLevelLBArea; False:C215; 0)
						LB_SetEnterable($_Ptr_SubLevelLBArea; True:C214; 1)
						LB_SetEnterable($_Ptr_SubLevelLBArea; False:C215; 2)
					Else 
						$_ptr_CurrentLocationCount->:=0
						
					End if 
					LB_SetScroll($_Ptr_SubLevelLBArea; $_ptr_CurrentLocationCount->)
					$_ptr_SubLevelSelect->:=0
					EDIT ITEM:C870($_Ptr_SubLevelLBArea->; 0)
				End if 
			End if 
		Else 
			Gen_Alert("This location already has products, it cannot be sub-divided")
		End if 
	Else 
		Gen_Alert("This location already has sublocations")
		
	End if 
Else 
	
	Gen_Alert("Sorry you cannot add sub-locations until you give this location a code")
End if 
ERR_MethodTrackerReturn("OBJ:File_StatesManager,Badd"; $_t_oldMethodName)
