If (False:C215)
	//object Name: [USER]STK_LocationsEditor.oButtonDeleteSub3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 20:57
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
	//ARRAY TEXT(STK_at_SessionDeletions;0)
	C_LONGINT:C283($_l_CurrentLevel; $_l_HeaderLevel; $_l_LocationCodePosition)
	C_POINTER:C301($_Ptr_addProductButton; $_Ptr_addSubLevelButton; $_ptr_Array10; $_ptr_Array2; $_ptr_Array3; $_ptr_Array4; $_ptr_Array5; $_ptr_Array6; $_ptr_Array7; $_ptr_Array8; $_ptr_Array9)
	C_POINTER:C301($_ptr_CurrentLocation; $_ptr_CurrentLocationCode; $_ptr_CurrentLocationCount; $_ptr_CurrentLocationID; $_ptr_CurrentLocationSubLevName; $_Ptr_HeaderLBArea; $_Ptr_LocationHoldsArray; $_ptr_LocationIDSArray; $_Ptr_LocationNamesArray; $_Ptr_ProdCodeArray; $_Ptr_ProdNameArray)
	C_POINTER:C301($_ptr_ProdSelected; $_ptr_ProductAdd; $_ptr_ProductCode; $_ptr_ProductCodes; $_ptr_ProductCount; $_ptr_ProductCounts; $_ptr_ProductDelete; $_ptr_ProductID; $_ptr_ProductIDS; $_ptr_ProductList; $_ptr_ProductName)
	C_POINTER:C301($_ptr_ProductNames; $_ptr_SubLevelAdd; $_ptr_SubLevelAddFurther; $_Ptr_SubLevelCount; $_ptr_SubLevelDelete; $_ptr_SubLevelEdit; $_Ptr_SubLevelLBArea; $_ptr_SubLevelSelect; $_Ptr_SubLocationNamesArray)
	C_TEXT:C284($_t_LocationName; $_t_oldMethodName; $_t_ProdCodeLabelName; $_t_ProdCountLabelName; $_t_ProdNameLabelName; $_t_SubLevelLabelName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_LocationsEditor.oButtonDeleteSub3"; Form event code:C388)

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
	$_ptr_Array3:=$_aptr_ColumnVariables{2}  //Location Code
	$_ptr_Array10:=$_aptr_ColumnVariables{3}  //Location holds
	$_ptr_Array8:=$_aptr_ColumnVariables{4}  // Product code at location
	$_ptr_Array9:=$_aptr_ColumnVariables{5}  // Product name
	$_ptr_Array2:=$_aptr_ColumnVariables{6}  // Location ID
	$_ptr_Array4:=$_aptr_ColumnVariables{7}  //Sub locatons named
	$_ptr_Array5:=$_aptr_ColumnVariables{8}  //Sublocation coding pref
	$_ptr_Array6:=$_aptr_ColumnVariables{9}  //Parent location iD
	$_ptr_Array7:=$_aptr_ColumnVariables{10}  //Modified Flag
	$_l_LocationCodePosition:=Find in array:C230($_ptr_Array2->; $_ptr_SubLevelSelect->)
	$_t_LocationName:=$_ptr_Array3->{$_l_LocationCodePosition}
	
	
	Gen_Confirm("Are you sure you want to delete "+$_t_LocationName; "No"; "Yes")
	If (OK=0)
		//Here we will check from stock at that location
		STK_GetActiveThreads(0; ""; 0; "ANY"; "ANY"; "ANY"; 0; 0; ""; 0; 0; ""; ""; $_t_LocationName)
		If (Records in selection:C76([Stock_Thread:143])>0)
			Gen_Alert("There is stock registered at that location. Relocate the stock first")
		Else 
			
			APPEND TO ARRAY:C911(STK_at_SessionDeletions; $_t_LocationName)
			LISTBOX DELETE ROWS:C914($_Ptr_SubLevelLBArea->; $_l_LocationCodePosition)
			READ WRITE:C146([LOCATIONS:61])
			QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=$_ptr_SubLevelSelect->)
			DELETE RECORD:C58([LOCATIONS:61])
			$_ptr_SubLevelSelect->:=0
			EDIT ITEM:C870($_Ptr_SubLevelLBArea->; 0)
			$_ptr_CurrentLocationCount->:=Size of array:C274($_Ptr_LocationNamesArray->)
			If (Size of array:C274($_Ptr_LocationNamesArray->)=0)
				//There are no sublocations..so revert
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
				$_Ptr_SubLocationNamesArray:=$_aptr_ColumnVariables{6}
				$_l_LocationCodePosition:=Find in array:C230($_ptr_LocationIDSArray->; $_ptr_CurrentLocationID->)
				$_Ptr_ProdCodeArray->{$_l_LocationCodePosition}:=""
				$_Ptr_ProdNameArray->{$_l_LocationCodePosition}:=""
				$_Ptr_LocationHoldsArray->{$_l_LocationCodePosition}:="Unknown"
				$_Ptr_SubLocationNamesArray->{$_l_LocationCodePosition}:=""
				
			End if 
			
		End if 
	End if 
	
	OK:=1
Else 
	Gen_Alert("You must select a sublocation to delete")
End if 
ERR_MethodTrackerReturn("OBJ [USER].STK_LocationsEditor.oButtonDeleteSub3"; $_t_oldMethodName)
