If (False:C215)
	//object Name: [USER]STK_LocationsEditor.oProductInformation10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 09:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible_1; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables_1; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables_1; 0)
	ARRAY POINTER:C280($_aptr_Styles_1; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_ColumnNames_1; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames_1; 0)
	C_BOOLEAN:C305($_bo_Continue; STK_bo_ProductFound)
	C_LONGINT:C283($_l_ColumnNumber; $_l_CurrentLevel; $_l_event; $_l_FieldNumber; $_l_HeaderLevel; $_l_LocationPosition; $_l_OldProductID; $_l_SelectedRow; $_l_TableNumber)
	C_POINTER:C301($_Ptr_addProductButton; $_Ptr_addSubLevelButton; $_ptr_CurrentLocation; $_ptr_CurrentLocationCode; $_ptr_CurrentLocationCount; $_ptr_CurrentLocationID; $_ptr_CurrentLocationSubLevName; $_Ptr_HeaderLBArea; $_Ptr_LocationHoldsArray; $_ptr_LocationIDSArray; $_Ptr_ProdCodeArray)
	C_POINTER:C301($_Ptr_ProdNameArray; $_ptr_ProdSelected; $_ptr_ProductAdd; $_ptr_ProductCode; $_ptr_ProductCodeArray; $_ptr_ProductCodes; $_ptr_ProductCount; $_ptr_ProductCounts; $_ptr_ProductDelete; $_ptr_ProductID; $_ptr_ProductIDS)
	C_POINTER:C301($_ptr_ProductList; $_ptr_ProductName; $_ptr_ProductNames; $_ptr_SubLevelAdd; $_ptr_SubLevelAddFurther; $_Ptr_SubLevelCount; $_ptr_SubLevelDelete; $_ptr_SubLevelEdit; $_Ptr_SubLevelLBArea; $_ptr_SubLevelSelect; $P3)
	C_TEXT:C284($_t_ColumnName; $_t_oldMethodName; $_t_ProdCodeLabelName; $_t_ProdCountLabelName; $_t_ProdNameLabelName; $_t_ProductCodeEntered; $_t_SubLevelLabelName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_LocationsEditor.oProductInformation10"; Form event code:C388)

$_l_event:=Form event code:C388
RESOLVE POINTER:C394(Self:C308; $_t_ColumnName; $_l_TableNumber; $_l_FieldNumber)
Case of 
	: ($_l_event=On Clicked:K2:4)
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
		
		
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		LISTBOX GET ARRAYS:C832($_ptr_ProductList->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		$_ptr_ProductCodeArray:=$_aptr_ColumnVariables{4}  //Pointer to array containing the ids
		
		$_l_SelectedRow:=Self:C308->
		//Column FIVE contains the ID
		$_ptr_ProdSelected->:=$_ptr_ProductCodeArray->{$_l_SelectedRow}
		
	: ($_l_event=On Data Change:K2:15)
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
		$_ptr_ProductIDS:=Get pointer:C304("STK_al_aProductListID"+String:C10($_l_HeaderLevel))  //Array of Products(IDS) to display in list of products `
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
		//`
		ARRAY TEXT:C222($_at_ColumnNames_1; 0)
		ARRAY TEXT:C222($_at_HeaderNames_1; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables_1; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables_1; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible_1; 0)
		ARRAY POINTER:C280($_aptr_Styles_1; 0)
		LISTBOX GET ARRAYS:C832($_ptr_ProductList->; $_at_ColumnNames_1; $_at_HeaderNames_1; $_aptr_ColumnVariables_1; $_aptr_HeaderVariables_1; $_abo_ColumnsVisible_1; $_aptr_Styles_1)
		$_ptr_ProductCodes:=$_aptr_ColumnVariables_1{1}
		$_ptr_ProductNames:=$_aptr_ColumnVariables_1{2}
		$_ptr_ProductIDS:=$_aptr_ColumnVariables_1{4}
		$_ptr_ProductCounts:=$_aptr_ColumnVariables_1{3}
		//``
		RESOLVE POINTER:C394(Self:C308; $_t_ColumnName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn($_ptr_ProductList; $_t_ColumnName)
		Case of 
			: ($_l_ColumnNumber=1)  //The product code(no other column should be editable
				If ($_ptr_ProdSelected->>0)  //This already had a product.
					$_l_OldProductID:=$_ptr_ProdSelected->
				Else 
					$_l_OldProductID:=0
				End if 
				
				$_t_ProductCodeEntered:=$_ptr_ProductCodes->{$_l_SelectedRow}
				STK_bo_ProductFound:=False:C215
				Check_Product(->$_t_ProductCodeEntered; "Product"; ->STK_bo_ProductFound)
				If (STK_bo_ProductFound)
					If ($_l_OldProductID>0)
						If ($_l_OldProductID#[PRODUCTS:9]X_ID:43)
							Gen_Confirm("Do you wish to change the product stored at this location?"; "No"; "Yes")
							If (OK=0)
								$_bo_Continue:=True:C214
								READ WRITE:C146([x_ProductLocations:185])
								QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_ProductID:1=$_l_OldProductID)
								DELETE RECORD:C58([x_ProductLocations:185])
								
							Else 
								$_bo_Continue:=False:C215
							End if 
							OK:=1
						Else 
							$_bo_Continue:=True:C214
						End if 
					Else 
						$_bo_Continue:=True:C214
					End if 
					
					If ($_bo_Continue)
						
						$_ptr_ProductCodes->{$_l_SelectedRow}:=[PRODUCTS:9]Product_Code:1
						$_ptr_ProductNames->{$_l_SelectedRow}:=[PRODUCTS:9]Product_Name:2
						$_ptr_ProductIDS->{$_l_SelectedRow}:=[PRODUCTS:9]X_ID:43
						$_ptr_ProductCounts->{$_l_SelectedRow}:=0
						CREATE RECORD:C68([x_ProductLocations:185])
						[x_ProductLocations:185]x_LocationCode:2:=$_ptr_CurrentLocationCode->
						[x_ProductLocations:185]x_ProductID:1:=[PRODUCTS:9]X_ID:43
						DB_SaveRecord(->[x_ProductLocations:185])
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
						$_l_LocationPosition:=Find in array:C230($_ptr_LocationIDSArray->; $_ptr_CurrentLocationID->)
						If (Size of array:C274($_ptr_ProductCodes->)=1)
							$_Ptr_ProdCodeArray->{$_l_LocationPosition}:=[PRODUCTS:9]Product_Code:1
							$_Ptr_ProdNameArray->{$_l_LocationPosition}:=[PRODUCTS:9]Product_Name:2
							$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:=[PRODUCTS:9]Product_Code:1+", "+[PRODUCTS:9]Product_Name:2
						Else 
							$_Ptr_ProdCodeArray->{$_l_LocationPosition}:="Multiple Products"
							$_Ptr_ProdNameArray->{$_l_LocationPosition}:="Select Location to see product range"
							$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:=$_Ptr_ProdCodeArray->{$_l_LocationPosition}+", "+$_Ptr_ProdNameArray->{$_l_LocationPosition}
							
						End if 
					Else 
						//revert product
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=$_l_OldProductID)
						//we wont have deleted the record...
						$_ptr_ProductCodes->{$_l_SelectedRow}:=[PRODUCTS:9]Product_Code:1
						$_ptr_ProductNames->{$_l_SelectedRow}:=[PRODUCTS:9]Product_Name:2
						$_ptr_ProductIDS->{$_l_SelectedRow}:=[PRODUCTS:9]X_ID:43
						$_ptr_ProductCounts->{$_l_SelectedRow}:=0
						
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
						$_l_LocationPosition:=Find in array:C230($_ptr_LocationIDSArray->; $_ptr_CurrentLocationID->)
						If (Size of array:C274($_ptr_ProductCodes->)=1)
							$_Ptr_ProdCodeArray->{$_l_LocationPosition}:=[PRODUCTS:9]Product_Code:1
							$_Ptr_ProdNameArray->{$_l_LocationPosition}:=[PRODUCTS:9]Product_Name:2
							$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:=[PRODUCTS:9]Product_Code:1+", "+[PRODUCTS:9]Product_Name:2
						Else 
							$_Ptr_ProdCodeArray->{$_l_LocationPosition}:="Multiple Products"
							$_Ptr_ProdNameArray->{$_l_LocationPosition}:="Select Location to see product range"
							$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:=$_Ptr_ProdCodeArray->{$_l_LocationPosition}+", "+$_Ptr_ProdNameArray->{$_l_LocationPosition}
							
						End if 
						
					End if 
				Else 
					
					Gen_Alert("Product Not found")
					If ($_l_OldProductID>0)
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=$_l_OldProductID)
						//we wont have deleted the record...
						$_ptr_ProductCodes->{$_l_SelectedRow}:=[PRODUCTS:9]Product_Code:1
						$_ptr_ProductNames->{$_l_SelectedRow}:=[PRODUCTS:9]Product_Name:2
						$_ptr_ProductIDS->{$_l_SelectedRow}:=[PRODUCTS:9]X_ID:43
						$_ptr_ProductCounts->{$_l_SelectedRow}:=0
						
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
						$_l_LocationPosition:=Find in array:C230($_ptr_LocationIDSArray->; $_ptr_CurrentLocationID->)
						If (Size of array:C274($_ptr_ProductCodes->)=1)
							$_Ptr_ProdCodeArray->{$_l_LocationPosition}:=[PRODUCTS:9]Product_Code:1
							$_Ptr_ProdNameArray->{$_l_LocationPosition}:=[PRODUCTS:9]Product_Name:2
							$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:=[PRODUCTS:9]Product_Code:1+", "+[PRODUCTS:9]Product_Name:2
						Else 
							$_Ptr_ProdCodeArray->{$_l_LocationPosition}:="Multiple Products"
							$_Ptr_ProdNameArray->{$_l_LocationPosition}:="Select Location to see product range"
							$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:=$_Ptr_ProdCodeArray->{$_l_LocationPosition}+", "+$_Ptr_ProdNameArray->{$_l_LocationPosition}
							
						End if 
						
					Else 
						$_ptr_ProductCodes->{$_l_SelectedRow}:=""
						$_ptr_ProductNames->{$_l_SelectedRow}:=""
						$_ptr_ProductIDS->{$_l_SelectedRow}:=0
						$_ptr_ProductCounts->{$_l_SelectedRow}:=0
						
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
						$_l_LocationPosition:=Find in array:C230($_ptr_LocationIDSArray->; $_ptr_CurrentLocationID->)
						If (Size of array:C274($_ptr_ProductCodes->)<2)  //NOTE THIS
							$_Ptr_ProdCodeArray->{$_l_LocationPosition}:=$_ptr_ProductCodes->{1}
							$_Ptr_ProdNameArray->{$_l_LocationPosition}:=$_ptr_ProductNames->{1}
							If ($_ptr_ProductCodes->{1}#"")
								$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:=$_ptr_ProductCodes->{1}+", "+$_ptr_ProductNames->{1}
							Else 
								$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:=""
							End if 
							
						Else 
							$_Ptr_ProdCodeArray->{$_l_LocationPosition}:="Multiple Products"
							$_Ptr_ProdNameArray->{$_l_LocationPosition}:="Select Location to see product range"
							$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:=$_Ptr_ProdCodeArray->{$_l_LocationPosition}+", "+$_Ptr_ProdNameArray->{$_l_LocationPosition}
							
						End if 
						
						
					End if 
				End if 
				
				
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].STK_LocationsEditor.oProductInformation10"; $_t_oldMethodName)
