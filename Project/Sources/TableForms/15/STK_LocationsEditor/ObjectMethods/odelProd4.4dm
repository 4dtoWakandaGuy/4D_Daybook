If (False:C215)
	//object Name: [USER]STK_LocationsEditor.odelProd4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 21:04
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
	C_LONGINT:C283($_l_CurrentLevel; $_l_HeaderLevel; $_l_LocationPosition)
	C_POINTER:C301($_Ptr_addProductButton; $_Ptr_addSubLevelButton; $_ptr_CurrentLocation; $_ptr_CurrentLocationCode; $_ptr_CurrentLocationCount; $_ptr_CurrentLocationID; $_ptr_CurrentLocationSubLevName; $_Ptr_HeaderLBArea; $_Ptr_LocationHoldsArray; $_ptr_LocationIDSArray; $_Ptr_ProdCodeArray)
	C_POINTER:C301($_Ptr_ProdNameArray; $_ptr_ProdSelected; $_ptr_ProductAdd; $_ptr_ProductCode; $_ptr_ProductCodes; $_ptr_ProductCount; $_ptr_ProductCounts; $_ptr_ProductDelete; $_ptr_ProductID; $_ptr_ProductIDS; $_ptr_ProductList)
	C_POINTER:C301($_ptr_ProductName; $_ptr_ProductNames; $_ptr_SubLevelAdd; $_ptr_SubLevelAddFurther; $_Ptr_SubLevelCount; $_ptr_SubLevelDelete; $_ptr_SubLevelEdit; $_Ptr_SubLevelLBArea; $_ptr_SubLevelSelect)
	C_TEXT:C284($_t_oldMethodName; $_t_ProdCodeLabelName; $_t_ProdCountLabelName; $_t_ProdNameLabelName; $_t_SubLevelLabelName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_LocationsEditor.odelProd4"; Form event code:C388)

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
If (Size of array:C274($_ptr_ProductCodes->)>0)
	If ($_ptr_ProdSelected->>0)
		$_l_LocationPosition:=Find in array:C230($_ptr_ProductIDS->; $_ptr_ProdSelected->)
		If ($_l_LocationPosition>0)
			
			READ WRITE:C146([x_ProductLocations:185])
			QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_ProductID:1=$_ptr_ProdSelected->; *)
			QUERY:C277([x_ProductLocations:185];  & ; [x_ProductLocations:185]x_LocationCode:2=$_ptr_CurrentLocationCode->)
			If (Records in selection:C76([x_ProductLocations:185])>0)
				If ($_ptr_ProductCounts->{$_l_LocationPosition}>0)
					Gen_Alert("Although this will remove this product from being recorded at this location, you "+"will need to  execute a stock movement to move the stock to a different locat"+"ion")
				End if 
				DELETE RECORD:C58([x_ProductLocations:185])
			End if 
			LISTBOX DELETE ROWS:C914($_ptr_ProductList->; $_l_LocationPosition)
			$_ptr_ProdSelected->:=0
			
			If (Size of array:C274($_ptr_ProductIDS->)=0)  //Removed the last product from the location
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
				//`
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
				$_Ptr_ProdCodeArray->{$_l_LocationPosition}:=""
				$_Ptr_ProdNameArray->{$_l_LocationPosition}:=""
				$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:="Unknown"
				
				//`
			Else 
				If (Size of array:C274($_ptr_ProductIDS->)=1)  //only one product
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
					$_Ptr_ProdCodeArray->{$_l_LocationPosition}:=$_ptr_ProductCodes->{1}
					$_Ptr_ProdNameArray->{$_l_LocationPosition}:=$_ptr_ProductNames->{1}
					$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:=$_ptr_ProductCodes->{1}+", "+$_ptr_ProductNames->{1}
					
				End if 
				
			End if 
		End if 
	Else 
		Gen_Alert("You must select a product first")
		
	End if 
	
Else 
	//either one or 0 products attached
	If ($_ptr_ProductCode->#"")
		// a product code is there
		READ WRITE:C146([x_ProductLocations:185])
		QUERY:C277([x_ProductLocations:185]; [x_ProductLocations:185]x_ProductID:1=$_ptr_ProductID->)
		If (Records in selection:C76([x_ProductLocations:185])>0)
			If ($_ptr_ProductCount->>0)
				Gen_Alert("Although this will remove this product from being recorded at this location, you "+"will need to  execute a stock movement to move the stock to a different locat"+"ion")
			End if 
			DELETE RECORD:C58([x_ProductLocations:185])
		End if 
		//``
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
		$_Ptr_ProdCodeArray->{$_l_LocationPosition}:=""
		$_Ptr_ProdNameArray->{$_l_LocationPosition}:=""
		$_Ptr_LocationHoldsArray->{$_l_LocationPosition}:="Unknown"
		
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
		
	Else 
		//nothing was entered
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
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].STK_LocationsEditor.odelProd4"; $_t_oldMethodName)
