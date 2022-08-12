//%attributes = {}

If (False:C215)
	//Project Method Name:      LOC_LocationsLBCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  23/12/2019
	//Created BY:  DefaultUser
	
	//Date Modified:
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY LONGINT:C221($_al_ProductIDSatLocation; 0)
	//ARRAY LONGINT(STK_al_aProductListID0;0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	//ARRAY REAL(STK_ar_ProductCount0;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(STK_at_ProductCode0;0)
	C_BOOLEAN:C305($_bo_NoSave)
	C_LONGINT:C283($_l_ArraySize; $_l_CurrentLevel; $_l_Event; $_l_FillCounts; $_l_HeaderLevel; $_l_Index; $_l_SelectedRow; $_l_WIndowBottom; $_l_WIndowLeft; $_l_WIndowRight; $_l_WIndowTop)
	C_LONGINT:C283($1; $2; STK_l_Subid)
	C_POINTER:C301($_Ptr_addProductButton; $_Ptr_addSubLevelButton; $_ptr_Array1; $_ptr_Array10; $_ptr_Array2; $_ptr_Array3; $_ptr_Array4; $_ptr_Array5; $_ptr_Array6; $_ptr_Array7; $_ptr_Array8)
	C_POINTER:C301($_ptr_Array9; $_ptr_CurrentLocation; $_ptr_CurrentLocationCode; $_ptr_CurrentLocationCount; $_ptr_CurrentLocationID; $_ptr_CurrentLocationSubLevName; $_Ptr_HeaderLBArea; $_Ptr_LocationCode; $_Ptr_LocationIDSArray; $_Ptr_LocationNamesArray; $_ptr_ParentLocationCode)
	C_POINTER:C301($_ptr_ParentLocationID; $_ptr_ProdSelected; $_ptr_ProductAdd; $_ptr_ProductCode; $_ptr_ProductCodes; $_ptr_ProductCount; $_ptr_ProductCounts; $_ptr_ProductDelete; $_ptr_ProductID; $_ptr_ProductIDS; $_ptr_ProductList)
	C_POINTER:C301($_ptr_ProductName; $_ptr_ProductNames; $_ptr_SubLevelAdd; $_ptr_SubLevelAddFurther; $_Ptr_SubLevelCount; $_ptr_SubLevelDelete; $_ptr_SubLevelEdit; $_Ptr_SubLevelLBArea; $_ptr_SubLevelSelect; $_Ptr_SubLocationNamesArray)
	C_TEXT:C284($_t_ButtonName; $_t_LocationCode; $_t_ObjectName; $_t_ProdCodeLabelName; $_t_ProdCountLabelName; $_t_ProdNameLabelName; $_t_SubLevelLabelName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LOC_LocationsLBCode")
If (Count parameters:C259>=2)
	$_l_Event:=$1
	$_l_CurrentLevel:=$2
	Case of 
		: ($_l_event=On Clicked:K2:4)
			TRACE:C157
			
			$_l_HeaderLevel:=$_l_CurrentLevel-1
			
			ARRAY TEXT:C222($_at_ColumnNames; 0)
			ARRAY TEXT:C222($_at_HeaderNames; 0)
			ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
			ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
			ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
			ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
			$_Ptr_HeaderLBArea:=Get pointer:C304("STK_lb_Level"+String:C10($_l_HeaderLevel))
			LISTBOX GET ARRAYS:C832($_Ptr_HeaderLBArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
			$_Ptr_LocationCode:=$_aptr_ColumnVariables{2}
			$_Ptr_LocationNamesArray:=$_aptr_ColumnVariables{1}
			$_Ptr_LocationIDSArray:=$_aptr_ColumnVariables{7}
			$_Ptr_SubLocationNamesArray:=$_aptr_ColumnVariables{6}
			$_Ptr_LocationNamesArray:=$_aptr_ColumnVariables{4}
			
			$_l_SelectedRow:=Self:C308->
			//Column FIVE contains the ID
			
			//``
			
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
			$_ptr_ProductCount:=Get pointer:C304("STK_ar_ProductCount"+String:C10($_l_HeaderLevel))  //`Single Product(Stock Count at location) to display
			
			$_ptr_CurrentLocation:=Get pointer:C304("STK_t_CurrentLocation"+String:C10($_l_HeaderLevel))  //`Selected location name
			$_ptr_CurrentLocationSubLevName:=Get pointer:C304("STK_t_SubLevelLabel"+String:C10($_l_HeaderLevel))  //Name of the sublevels attached to this location
			$_ptr_CurrentLocationCode:=Get pointer:C304("STK_t_CurrentLocationCode"+String:C10($_l_HeaderLevel))  //Selected location code
			$_ptr_CurrentLocationID:=Get pointer:C304("STK_l_currentLocation"+String:C10($_l_HeaderLevel))  //Selected location ID
			$_ptr_CurrentLocationCount:=Get pointer:C304("STK_l_CountSublevel"+String:C10($_l_HeaderLevel))  //Count of the sublevels for this level
			//```
			//Pointers relating to the sublevels
			$_ptr_SubLevelSelect:=Get pointer:C304("STK_l_SubLevelSelected"+String:C10($_l_CurrentLevel))
			$_ptr_ProdSelected:=Get pointer:C304("STK_l_ProdatlocSelected"+String:C10($_l_CurrentLevel))
			
			If ($_ptr_CurrentLocationID->=-1)  //The current location ID is -1 this mean we are adding a record.
				//if we did not enter a name for the location we should not remove the list box row at the end if we did we must save the record.
				//actually we should never have to save the record here becuase the form method should have dealt with that
				If ($_ptr_CurrentLocation->="")
					LISTBOX DELETE ROWS:C914($_Ptr_HeaderLBArea->; Size of array:C274($_Ptr_SubLocationNamesArray->))
				Else 
					CREATE RECORD:C68([LOCATIONS:61])
					[LOCATIONS:61]Location_Name:2:=$_ptr_CurrentLocation->
					If ($_ptr_CurrentLocationCode->="")
						
						Repeat 
							[LOCATIONS:61]Location_Code:1:=Gen_Request("Enter Location Code")
						Until ([LOCATIONS:61]Location_Code:1#"") | (OK=0)
					Else 
						[LOCATIONS:61]Location_Code:1:=$_ptr_CurrentLocationCode->
					End if 
					If (OK=0)
						$_bo_NoSave:=True:C214
					Else 
						$_bo_NoSave:=False:C215
					End if 
					If (Not:C34($_bo_NoSave))
						STK_l_Subid:=0
						[LOCATIONS:61]LocationID:4:=AA_GetNextID(->[LOCATIONS:61]LocationID:4)
						If (FORM Get current page:C276=1)
							[LOCATIONS:61]ParentLocationID:3:=0
							[LOCATIONS:61]LocationCodePrefix:5:=""
						Else 
							$_ptr_ParentLocationCode:=Get pointer:C304("STK_t_CurrentLocationCode"+String:C10($_l_HeaderLevel-1))  //Selected location code
							$_ptr_ParentLocationID:=Get pointer:C304("STK_l_currentLocation"+String:C10($_l_HeaderLevel-1))  //Selected location ID
							[LOCATIONS:61]LocationCodePrefix:5:=$_ptr_ParentLocationCode->
							[LOCATIONS:61]ParentLocationID:3:=$_ptr_ParentLocationID->
							
							
						End if 
						DB_SaveRecord(->[LOCATIONS:61])
						
					End if 
					
				End if 
			End if 
			//`
			Case of 
				: ($_Ptr_SubLocationNamesArray->{$_l_SelectedRow}#"")  //This location has a sublevel named
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
					OBJECT SET ENTERABLE:C238($_Ptr_SubLevelCount->; True:C214)
					ARRAY LONGINT:C221($_ptr_ProductIDS->; 0)
					ARRAY TEXT:C222($_ptr_ProductCodes->; 0)
					ARRAY TEXT:C222($_ptr_ProductNames->; 0)
					ARRAY REAL:C219($_ptr_ProductCounts->; 0)
					//``
					
					
					QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]ParentLocationID:3=$_Ptr_LocationIDSArray->{$_l_SelectedRow})
					
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
					SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Code:1; $_ptr_Array3->; [LOCATIONS:61]Location_Name:2; $_ptr_Array1->; [LOCATIONS:61]LocationID:4; $_ptr_Array2->; [LOCATIONS:61]Sub_location_Labelled:6; $_ptr_Array4->; [LOCATIONS:61]Sub_LocationCodingPref:7; $_ptr_Array5->; [LOCATIONS:61]ParentLocationID:3; $_ptr_Array6->)
					
					$_l_ArraySize:=Size of array:C274($_ptr_Array3->)
					ARRAY TEXT:C222($_ptr_Array8->; $_l_ArraySize)
					ARRAY TEXT:C222($_ptr_Array9->; $_l_ArraySize)
					ARRAY BOOLEAN:C223($_ptr_Array7->; $_l_ArraySize)
					//ARRAY REAL($P11->;$_l_ArraySize)
					ARRAY TEXT:C222($_ptr_Array10->; $_l_ArraySize)
					For ($_l_Index; 1; Size of array:C274($_ptr_Array8->))
						If ($_ptr_Array4->{$_l_Index}="")
							//No sublevel maybe a product is stored there
							QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_LocationCode:2=$_ptr_Array3->{$_l_Index})
							If (Records in selection:C76([x_ProductLocations:185])>0)
								If (Records in selection:C76([x_ProductLocations:185])=1)
									//There is product stored there..maybe more than one product
									QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=[x_ProductLocations:185]x_ProductID:1)
									$_ptr_Array8->{$_l_Index}:=[PRODUCTS:9]Product_Code:1
									$_ptr_Array9->{$_l_Index}:=[PRODUCTS:9]Product_Name:2
									STK_GetActiveThreads([PRODUCTS:9]X_ID:43; ""; 0; "ANY"; "ANY"; "ANY"; 0; 0; ""; 0; 0; ""; ""; $_ptr_Array8->{$_l_Index})
									//$P11->{$_l_Index}:=Sum([Stock_Thread]Quantity)
									$_ptr_Array10->{$_l_Index}:=$_ptr_Array8->{$_l_Index}+", "+$_ptr_Array9->{$_l_Index}
								Else 
									//Mulltiple products
									$_ptr_Array8->{$_l_Index}:="Multiple Products"
									$_ptr_Array9->{$_l_Index}:="Select Location to see product range"
									//$P11->{$_l_Index}:=0
									$_ptr_Array10->{$_l_Index}:=$_ptr_Array8->{$_l_Index}+", "+$_ptr_Array9->{$_l_Index}
								End if 
							End if 
						Else 
							$_ptr_Array10->{$_l_Index}:=$_ptr_Array4->{$_l_Index}
						End if 
						If ($_ptr_Array10->{$_l_Index}="")
							$_ptr_Array10->{$_l_Index}:="Unknown"
						End if 
					End for 
					
					$_t_ObjectName:="osubloc"+String:C10($_l_CurrentLevel)
					$_t_ButtonName:="SSLOC"+String:C10($_l_HeaderLevel)+"_l_"
					LB_SetupListbox($_Ptr_SubLevelLBArea; $_t_ObjectName; $_t_ButtonName; 1; $_ptr_Array1; $_ptr_Array3; $_ptr_Array10; $_ptr_Array8; $_ptr_Array9; $_ptr_Array2; $_ptr_Array4; $_ptr_Array5; $_ptr_Array6; $_ptr_Array7)
					LB_SetColumnHeaders($_Ptr_SubLevelLBArea; $_t_ButtonName; 1; "Location Point"; "Location Code"; "Location Holds"; "Product At location"; "Product Name"; "Location ID"; "SubLevel"; "Sub Location Coding"; "Parent Location ID"; "Modified")
					
					LB_SetColumnWidths($_Ptr_SubLevelLBArea; $_t_ObjectName; 1; 190; 90; 90; 90; 190; 20; 20; 20; 20; 20)
					
					LB_SetScroll($_Ptr_SubLevelLBArea; -2; -3)
					LB_SETENTRYOPTIONS  // doesn't actually do anything ...
					LB_StyleSettings($_Ptr_SubLevelLBArea; "blue"; 9; $_t_ObjectName; ->[LOCATIONS:61])
					LB_SetScroll($_Ptr_SubLevelLBArea; -2; -2)
					LB_SetEnterable($_Ptr_SubLevelLBArea; False:C215; 0)
					LB_SetEnterable($_Ptr_SubLevelLBArea; True:C214; 1)
					LB_SetEnterable($_Ptr_SubLevelLBArea; False:C215; 2)
					$_Ptr_SubLevelCount->:=Size of array:C274($_ptr_Array1->)
					OBJECT SET ENTERABLE:C238($_Ptr_SubLevelCount->; False:C215)
					
					//````
					
					//``END
					
					
					
					
					
					
				: ($_Ptr_LocationNamesArray->{$_l_SelectedRow}#"")
					//This location contains a product or product
					OBJECT SET VISIBLE:C603($_Ptr_AddSubLevelButton->; False:C215)
					OBJECT SET VISIBLE:C603($_Ptr_addProductButton->; False:C215)
					OBJECT SET VISIBLE:C603($_Ptr_SubLevelLBArea->; False:C215)
					OBJECT SET VISIBLE:C603(*; $_t_SubLevelLabelName; False:C215)
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
					//``
					
					
					//THis will be set to true if one product
					OBJECT SET VISIBLE:C603(*; $_t_ProdCodeLabelName; False:C215)
					OBJECT SET VISIBLE:C603(*; $_t_ProdNameLabelName; False:C215)
					OBJECT SET VISIBLE:C603(*; $_t_ProdCountLabelName; False:C215)
					OBJECT SET VISIBLE:C603($_ptr_ProductCode->; False:C215)
					OBJECT SET VISIBLE:C603($_ptr_ProductID->; False:C215)
					OBJECT SET VISIBLE:C603($_ptr_ProductName->; False:C215)
					OBJECT SET VISIBLE:C603($_ptr_ProductCount->; False:C215)
					
					
					//This will be set to true if more than one product
					OBJECT SET VISIBLE:C603($_ptr_ProductList->; False:C215)
					
					
					OBJECT SET VISIBLE:C603($_ptr_ProductDelete->; True:C214)
					OBJECT SET VISIBLE:C603($_ptr_ProductAdd->; True:C214)
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
					
					If ($_Ptr_LocationNamesArray->{$_l_SelectedRow}="Multiple Products")
						ARRAY LONGINT:C221($_ptr_ProductIDS->; 0)
						ARRAY TEXT:C222($_ptr_ProductCodes->; 0)
						ARRAY TEXT:C222($_ptr_ProductNames->; 0)
						ARRAY REAL:C219($_ptr_ProductCounts->; 0)
						
						//This contains multiple products. Show the stock in an array
						$_t_LocationCode:=$_Ptr_LocationCode->{$_l_SelectedRow}
						QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_LocationCode:2=$_t_LocationCode)
						
						SELECTION TO ARRAY:C260([x_ProductLocations:185]x_ProductID:1; $_al_ProductIDSatLocation)
						QUERY WITH ARRAY:C644([PRODUCTS:9]X_ID:43; $_al_ProductIDSatLocation)
						ARRAY LONGINT:C221($_ptr_ProductIDS->; 0)
						ARRAY TEXT:C222($_ptr_ProductCodes->; 0)
						ARRAY TEXT:C222($_ptr_ProductNames->; 0)
						ARRAY REAL:C219($_ptr_ProductCounts->; 0)
						SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_ptr_ProductCodes->; [PRODUCTS:9]X_ID:43; $_ptr_ProductIDS->; [PRODUCTS:9]Product_Name:2; $_ptr_ProductNames->)
						ARRAY REAL:C219($_ptr_ProductCounts->; Size of array:C274(STK_at_ProductCode0))
						For ($_l_FillCounts; 1; Size of array:C274(STK_ar_ProductCount0))
							STK_GetActiveThreads($_ptr_ProductIDS->{$_l_FillCounts}; ""; 0; "ANY"; "ANY"; "ANY"; 0; 0; ""; 0; 0; ""; ""; $_t_LocationCode)
							$_ptr_ProductCounts->{$_l_FillCounts}:=Sum:C1([Stock_Thread:143]Quantity:13)
						End for 
						
						//``
						
						
						
						//
						//
						
						
						
						
						
						
						
						
						
						
						
						$_t_ObjectName:="oprd"+String:C10($_l_HeaderLevel)
						$_t_ButtonName:="PLOC"+String:C10($_l_HeaderLevel)+"_l_"
						LB_SetupListbox($_ptr_ProductList; $_t_ObjectName; $_t_ButtonName; 1; $_ptr_ProductCodes; $_ptr_ProductNames; $_ptr_ProductCounts; $_ptr_ProductIDS)
						LB_SetColumnHeaders($_ptr_ProductList; $_t_ButtonName; 1; "Product Code"; "Product Name"; "Stock At location"; "ID")
						LB_SetColumnWidths($_ptr_ProductList; $_t_ObjectName; 1; 120; 190; 90; 0)
						
						LB_SetScroll($_ptr_ProductList; -2; -3)
						LB_SETENTRYOPTIONS  // doesn't actually do anything ...
						LB_StyleSettings($_ptr_ProductList; "blue"; 9; $_t_ObjectName; ->[PRODUCTS:9])
						LB_SetScroll($_ptr_ProductList; -2; -2)
						LB_SetEnterable($_ptr_ProductList; False:C215; 0)
						OBJECT SET VISIBLE:C603($_ptr_ProductList->; True:C214)
					Else 
						//This contains one product. Show the product details
						QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_LocationCode:2=$_t_LocationCode)
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=[x_ProductLocations:185]x_ProductID:1)
						$_ptr_ProductCode->:=[PRODUCTS:9]Product_Code:1
						$_ptr_ProductID->:=[PRODUCTS:9]X_ID:43
						$_ptr_ProductName->:=[PRODUCTS:9]Product_Name:2
						STK_GetActiveThreads(STK_al_aProductListID0{$_l_Index}; ""; 0; "ANY"; "ANY"; "ANY"; 0; 0; ""; 0; 0; ""; ""; $_t_LocationCode)
						$_ptr_ProductCount->:=Sum:C1([Stock_Thread:143]Quantity:13)
						
						OBJECT SET VISIBLE:C603($_ptr_ProductCode->; False:C215)
						OBJECT SET VISIBLE:C603($_ptr_ProductID->; False:C215)
						OBJECT SET VISIBLE:C603($_ptr_ProductName->; False:C215)
						OBJECT SET VISIBLE:C603($_ptr_ProductCount->; False:C215)
						
						
					End if 
				Else 
					//This location does not have a product or a sublocation so prepare for setup
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
					If ($_l_HeaderLevel=0)  //You can only manually enter a location code at level 0
						OBJECT SET ENTERABLE:C238($_ptr_CurrentLocationCode->; True:C214)
					Else 
						OBJECT SET ENTERABLE:C238($_ptr_CurrentLocationCode->; False:C215)
					End if 
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
					
					
					
					
					
			End case 
			
			$_ptr_SubLevelSelect->:=0
			$_ptr_ProdSelected->:=0
			$_ptr_CurrentLocation->:=$_Ptr_LocationNamesArray->{$_l_SelectedRow}
			$_ptr_CurrentLocationCode->:=$_Ptr_LocationCode->{$_l_SelectedRow}
			$_ptr_CurrentLocationID->:=$_Ptr_LocationIDSArray->{$_l_SelectedRow}
			$_ptr_CurrentLocationSubLevName->:=$_Ptr_SubLocationNamesArray->{$_l_SelectedRow}
			OBJECT SET ENTERABLE:C238($_ptr_CurrentLocation->; True:C214)
			GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowRight; $_l_WIndowTop; $_l_WIndowBottom)
			SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WIndowRight; $_l_WIndowTop; $_l_WIndowBottom+1)
			SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WIndowRight; $_l_WIndowTop; $_l_WIndowBottom)  //To force a redraw
			//``
			
	End case 
End if 
ERR_MethodTrackerReturn("LOC_LocationsLBCode"; $_t_oldMethodName)