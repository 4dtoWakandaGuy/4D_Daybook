If (False:C215)
	//object Name: [USER]STK_LocationsEditor.oButtonAddSub10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 09:26
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
	C_LONGINT:C283($_l_AddRowIndex; $_l_ArraySize; $_l_CurrentLocationsLevel; $_l_HeaderLevel; $_l_Index; $_l_LastLocationNameNum; $_l_LastLocationNumber; $_l_Length; $_l_NumberToAdd; $_l_RecordClashtest; STK_l_currentLocation)
	C_LONGINT:C283(STK_l_Subid)
	C_POINTER:C301($_Ptr_addProductButton; $_Ptr_addSubLevelButton; $_ptr_Array1; $_ptr_Array10; $_ptr_Array2; $_ptr_Array3; $_ptr_Array4; $_ptr_Array5; $_ptr_Array6; $_ptr_Array7; $_ptr_Array8)
	C_POINTER:C301($_ptr_Array9; $_ptr_CurrentLocation; $_ptr_CurrentLocationCode; $_ptr_CurrentLocationCount; $_ptr_CurrentLocationID; $_ptr_CurrentLocationSubLevName; $_ptr_ProdSelected; $_ptr_ProductAdd; $_ptr_ProductCode; $_ptr_ProductCodes; $_ptr_ProductCount)
	C_POINTER:C301($_ptr_ProductCounts; $_ptr_ProductDelete; $_ptr_ProductID; $_ptr_ProductIDS; $_ptr_ProductList; $_ptr_ProductName; $_ptr_ProductNames; $_ptr_SubLevelAdd; $_ptr_SubLevelAddFurther; $_Ptr_SubLevelCount; $_ptr_SubLevelDelete)
	C_POINTER:C301($_ptr_SubLevelEdit; $_Ptr_SubLevelLBArea; $_ptr_SubLevelSelect)
	C_TEXT:C284($_t_LastLocationCode; $_t_LastLocationName; $_t_LastLocationNameNumSTR; $_t_LastLocationNumberSTR; $_t_NextLocationCode; $_t_NextLocationName; $_t_NumberToAddSTR; $_t_oldMethodName; $_t_ProdCodeLabelName; $_t_ProdCountLabelName; $_t_ProdNameLabelName)
	C_TEXT:C284($_t_SubLevelLabelName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_LocationsEditor.oButtonAddSub10"; Form event code:C388)

$_l_CurrentLocationsLevel:=FORM Get current page:C276
$_l_HeaderLevel:=$_l_CurrentLocationsLevel-1
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
$_ptr_SubLevelSelect:=Get pointer:C304("STK_l_SubLevelSelected"+String:C10($_l_CurrentLocationsLevel))
$_ptr_ProdSelected:=Get pointer:C304("STK_l_ProdatlocSelected"+String:C10($_l_CurrentLocationsLevel))


If ($_ptr_CurrentLocationCode->#"")
	If ($_ptr_CurrentLocationSubLevName->#"")
		//the sublevel does exist..
		$_t_NumberToAddSTR:=Gen_Request("Number of "+$_ptr_CurrentLocationSubLevName->+" to add"; "1")
		$_l_NumberToAdd:=Num:C11($_t_NumberToAddSTR)
		
		If (OK=1) & ($_l_NumberToAdd>0)
			ARRAY TEXT:C222($_at_ColumnNames; 0)
			ARRAY TEXT:C222($_at_HeaderNames; 0)
			ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
			ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
			ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
			ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
			LISTBOX GET ARRAYS:C832($_Ptr_SubLevelLBArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
			//LB_SetupListbox (->STK_lb_Sublevels0;"oLocations";"SLOC_L";1;$_ptr_Array1;$_ptr_Array3;$_ptr_Array8;$_ptr_Array9;$_ptr_Array2;$_ptr_Array4;$_ptr_Array5;$_ptr_Array6;$_ptr_Array7)
			$_ptr_Array1:=$_aptr_ColumnVariables{1}
			$_ptr_Array3:=$_aptr_ColumnVariables{2}
			$_ptr_Array10:=$_aptr_ColumnVariables{3}
			$_ptr_Array8:=$_aptr_ColumnVariables{4}
			$_ptr_Array9:=$_aptr_ColumnVariables{5}
			$_ptr_Array2:=$_aptr_ColumnVariables{6}
			$_ptr_Array4:=$_aptr_ColumnVariables{7}
			$_ptr_Array5:=$_aptr_ColumnVariables{8}
			$_ptr_Array6:=$_aptr_ColumnVariables{9}
			$_ptr_Array7:=$_aptr_ColumnVariables{10}
			For ($_l_AddRowIndex; 1; $_l_NumberToAdd)
				$_l_ArraySize:=Size of array:C274($_ptr_Array3->)
				$_t_LastLocationCode:=$_ptr_Array3->{$_l_ArraySize}
				$_t_LastLocationName:=$_ptr_Array1->{$_l_ArraySize}
				$_t_LastLocationNumberSTR:=""
				$_t_LastLocationNameNumSTR:=""
				$_l_LastLocationNumber:=0
				$_l_LastLocationNameNum:=0
				For ($_l_Index; Length:C16($_t_LastLocationCode); 1; -1)
					If (Num:C11($_t_LastLocationCode[[$_l_Index]])>0) | ($_t_LastLocationCode[[$_l_Index]]="0")
						$_t_LastLocationNumberSTR:=$_t_LastLocationCode[[$_l_Index]]+$_t_LastLocationNumberSTR
					Else 
						$_l_Length:=$_l_Index
						$_l_Index:=0
					End if 
				End for 
				$_l_LastLocationNumber:=Num:C11($_t_LastLocationNumberSTR)
				Repeat 
					$_t_NextLocationCode:=Substring:C12($_t_LastLocationCode; 1; $_l_Length)+String:C10($_l_LastLocationNumber+1)
					$_l_RecordClashtest:=0
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_RecordClashtest)
					QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]Location_Code:1=$_t_NextLocationCode)
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					If ($_l_RecordClashtest>0)
						$_l_LastLocationNumber:=$_l_LastLocationNumber+1
					End if 
				Until ($_l_RecordClashtest=0)
				
				For ($_l_Index; Length:C16($_t_LastLocationName); 1; -1)
					If (Num:C11($_t_LastLocationName[[$_l_Index]])>0) | ($_t_LastLocationName[[$_l_Index]]="0")
						$_t_LastLocationNameNumSTR:=$_t_LastLocationName[[$_l_Index]]+$_t_LastLocationNameNumSTR
					Else 
						$_l_Length:=$_l_Index
						$_l_Index:=0
					End if 
				End for 
				$_l_LastLocationNameNum:=Num:C11($_t_LastLocationNameNumSTR)
				Repeat 
					$_t_NextLocationName:=Substring:C12($_t_LastLocationName; 1; $_l_Length)+String:C10($_l_LastLocationNameNum+1)
					$_l_RecordClashtest:=0
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_RecordClashtest)
					QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]Location_Name:2=$_t_NextLocationName)
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					If ($_l_RecordClashtest>0)
						$_l_LastLocationNameNum:=$_l_LastLocationNameNum+1
					End if 
				Until ($_l_RecordClashtest=0)
				APPEND TO ARRAY:C911($_ptr_Array1->; $_t_NextLocationName)
				APPEND TO ARRAY:C911($_ptr_Array3->; $_t_NextLocationCode)
				STK_l_Subid:=0
				APPEND TO ARRAY:C911($_ptr_Array2->; AA_GetNextID(->[LOCATIONS:61]LocationID:4))
				APPEND TO ARRAY:C911($_ptr_Array10->; "Unknown")
				APPEND TO ARRAY:C911($_ptr_Array8->; "")
				APPEND TO ARRAY:C911($_ptr_Array9->; "")
				APPEND TO ARRAY:C911($_ptr_Array4->; "")
				APPEND TO ARRAY:C911($_ptr_Array5->; 0)
				APPEND TO ARRAY:C911($_ptr_Array6->; STK_l_currentLocation)
				APPEND TO ARRAY:C911($_ptr_Array7->; True:C214)
				CREATE RECORD:C68([LOCATIONS:61])
				$_l_ArraySize:=Size of array:C274($_ptr_Array3->)
				[LOCATIONS:61]Location_Code:1:=$_ptr_Array3->{$_l_ArraySize}
				[LOCATIONS:61]Location_Name:2:=$_ptr_Array1->{$_l_ArraySize}
				[LOCATIONS:61]LocationCodePrefix:5:=$_ptr_CurrentLocationCode->
				[LOCATIONS:61]LocationID:4:=$_ptr_Array2->{$_l_ArraySize}
				[LOCATIONS:61]ParentLocationID:3:=$_ptr_CurrentLocationID->
				//[LOCATIONS]Sub_LocationNamingPref
				[LOCATIONS:61]Sub_location_Labelled:6:=""
				DB_SaveRecord(->[LOCATIONS:61])
			End for 
			$_ptr_CurrentLocationCount->:=Size of array:C274($_ptr_Array1->)
			LB_SetScroll($_Ptr_SubLevelLBArea; $_ptr_CurrentLocationCount->)
			$_ptr_SubLevelSelect->:=0
			EDIT ITEM:C870($_Ptr_SubLevelLBArea->; 0)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].STK_LocationsEditor.oButtonAddSub10"; $_t_oldMethodName)
