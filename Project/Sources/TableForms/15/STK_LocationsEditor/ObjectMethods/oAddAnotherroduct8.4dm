If (False:C215)
	//object Name: [USER]STK_LocationsEditor.oAddAnotherroduct8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 08:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentLevel; $_l_HeaderLevel; $_l_SizeofArray; PLOC0_l_BUT1; PLOC0_l_BUT10; PLOC0_l_BUT2; PLOC0_l_BUT3; PLOC0_l_BUT4; PLOC0_l_BUT5; PLOC0_l_BUT7; PLOC0_l_BUT8)
	C_LONGINT:C283(PLOC0_l_BUT9; PLOC0_L6; PLOC1_l_BUT1; PLOC1_l_BUT10; PLOC1_l_BUT2; PLOC1_l_BUT3; PLOC1_l_BUT4; PLOC1_l_BUT5; PLOC1_l_BUT7; PLOC1_l_BUT8; PLOC1_l_BUT9)
	C_LONGINT:C283(PLOC10_l_BUT1; PLOC10_l_BUT10; PLOC10_l_BUT2; PLOC10_l_BUT3; PLOC10_l_BUT4; PLOC10_l_BUT5; PLOC10_l_BUT7; PLOC10_l_BUT8; PLOC10_l_BUT9; PLOC2_l_BUT1; PLOC2_l_BUT10)
	C_LONGINT:C283(PLOC2_l_BUT2; PLOC2_l_BUT3; PLOC2_l_BUT4; PLOC2_l_BUT5; PLOC2_l_BUT7; PLOC2_l_BUT8; PLOC2_l_BUT9; PLOC3_l_BUT1; PLOC3_l_BUT2; PLOC3_l_BUT3; PLOC3_l_BUT4)
	C_LONGINT:C283(PLOC3_l_BUT5; PLOC3_l_BUT7; PLOC3_l_BUT8; PLOC3_l_BUT9; PLOC4_l_BUT1; PLOC4_l_BUT10; PLOC4_l_BUT2; PLOC4_l_BUT3; PLOC4_l_BUT4; PLOC4_l_BUT5; PLOC4_l_BUT7)
	C_LONGINT:C283(PLOC4_l_BUT8; PLOC4_l_BUT9; PLOC5_l_BUT1; PLOC5_l_BUT10; PLOC5_l_BUT2; PLOC5_l_BUT3; PLOC5_l_BUT4; PLOC5_l_BUT5; PLOC5_l_BUT7; PLOC5_l_BUT8; PLOC5_l_BUT9)
	C_LONGINT:C283(PLOC6_l_BUT1; PLOC6_l_BUT10; PLOC6_l_BUT2; PLOC6_l_BUT3; PLOC6_l_BUT4; PLOC6_l_BUT5; PLOC6_l_BUT7; PLOC6_l_BUT8; PLOC6_l_BUT9; PLOC7_l_BUT1; PLOC7_l_BUT10)
	C_LONGINT:C283(PLOC7_l_BUT2; PLOC7_l_BUT3; PLOC7_l_BUT4; PLOC7_l_BUT5; PLOC7_l_BUT7; PLOC7_l_BUT8; PLOC7_l_BUT9; PLOC8_l_BUT1; PLOC8_l_BUT10; PLOC8_l_BUT2; PLOC8_l_BUT3)
	C_LONGINT:C283(PLOC8_l_BUT4; PLOC8_l_BUT5; PLOC8_l_BUT7; PLOC8_l_BUT8; PLOC8_l_BUT9; PLOC9_l_BUT1; PLOC9_l_BUT10; PLOC9_l_BUT2; PLOC9_l_BUT3; PLOC9_l_BUT4; PLOC9_l_BUT5)
	C_LONGINT:C283(PLOC9_l_BUT7; PLOC9_l_BUT8; PLOC9_l_BUT9)
	C_POINTER:C301($_Ptr_addProductButton; $_Ptr_addSubLevelButton; $_ptr_CurrentLocation; $_ptr_CurrentLocationCode; $_ptr_CurrentLocationCount; $_ptr_CurrentLocationID; $_ptr_CurrentLocationSubLevName; $_ptr_ProdSelected; $_ptr_ProductAdd; $_ptr_ProductCode; $_ptr_ProductCodes)
	C_POINTER:C301($_ptr_ProductCount; $_ptr_ProductCounts; $_ptr_ProductDelete; $_ptr_ProductID; $_ptr_ProductIDS; $_ptr_ProductList; $_ptr_ProductName; $_ptr_ProductNames; $_ptr_SubLevelAdd; $_ptr_SubLevelAddFurther; $_Ptr_SubLevelCount)
	C_POINTER:C301($_ptr_SubLevelDelete; $_ptr_SubLevelEdit; $_Ptr_SubLevelLBArea; $_ptr_SubLevelSelect)
	C_TEXT:C284($_t_ButtonName; $_t_ObjectName; $_t_oldMethodName; $_t_ProdCodeLabelName; $_t_ProdCountLabelName; $_t_ProdNameLabelName; $_t_SubLevelLabelName; oprd0_COL1; oprd0_COL10; oprd0_COL2; oprd0_COL3)
	C_TEXT:C284(oprd0_COL4; oprd0_COL5; oprd0_COL6; oprd0_COL7; oprd0_COL8; oprd0_COL9; oprd0_HED1; oprd0_HED10; oprd0_HED2; oprd0_HED3; oprd0_HED4)
	C_TEXT:C284(oprd0_HED5; oprd0_HED6; oprd0_HED7; oprd0_HED8; oprd0_HED9; oprd1_COL1; oprd1_COL10; oprd1_COL2; oprd1_COL3; oprd1_COL4; oprd1_COL5)
	C_TEXT:C284(oprd1_COL6; oprd1_COL7; oprd1_COL8; oprd1_COL9; oprd1_HED1; oprd1_HED2; oprd1_HED3; oprd1_HED4; oprd1_HED5; oprd1_HED6; oprd1_HED7)
	C_TEXT:C284(oprd1_HED8; oprd1_HED9; oprd10_COL1; oprd10_COL10; oprd10_COL2; oprd10_COL3; oprd10_COL4; oprd10_COL5; oprd10_COL6; oprd10_COL7; oprd10_COL8)
	C_TEXT:C284(oprd10_COL9; oprd10_HED1; oprd10_HED10; oprd10_HED2; oprd10_HED3; oprd10_HED4; oprd10_HED5; oprd10_HED6; oprd10_HED7; oprd10_HED8; oprd10_HED9)
	C_TEXT:C284(oprd2_COL1; oprd2_COL10; oprd2_COL2; oprd2_COL3; oprd2_COL4; oprd2_COL5; oprd2_COL6; oprd2_COL7; oprd2_COL8; oprd2_COL9; oprd2_HED1)
	C_TEXT:C284(oprd2_HED10; oprd2_HED2; oprd2_HED3; oprd2_HED4; oprd2_HED5; oprd2_HED6; oprd2_HED7; oprd2_HED8; oprd2_HED9; oprd3_COL1; oprd3_COL10)
	C_TEXT:C284(oprd3_COL2; oprd3_COL3; oprd3_COL4; oprd3_COL5; oprd3_COL6; oprd3_COL7; oprd3_COL8; oprd3_COL9; oprd3_HED1; oprd3_HED10; oprd3_HED2)
	C_TEXT:C284(oprd3_HED3; oprd3_HED4; oprd3_HED5; oprd3_HED6; oprd3_HED7; oprd3_HED8; oprd3_HED9; oprd4_COL1; oprd4_COL10; oprd4_COL2; oprd4_COL3)
	C_TEXT:C284(oprd4_COL4; oprd4_COL5; oprd4_COL6; oprd4_COL7; oprd4_COL8; oprd4_COL9; oprd4_HED1; oprd4_HED10; oprd4_HED2; oprd4_HED3; oprd4_HED4)
	C_TEXT:C284(oprd4_HED5; oprd4_HED6; oprd4_HED7; oprd4_HED8; oprd4_HED9; oprd5_COL1; oprd5_COL10; oprd5_COL2; oprd5_COL3; oprd5_COL4; oprd5_COL5)
	C_TEXT:C284(oprd5_COL6; oprd5_COL7; oprd5_COL8; oprd5_COL9; oprd5_HED1; oprd5_HED10; oprd5_HED2; oprd5_HED3; oprd5_HED4; oprd5_HED5; oprd5_HED6)
	C_TEXT:C284(oprd5_HED7; oprd5_HED8; oprd5_HED9; oprd6_COL1; oprd6_COL10; oprd6_COL2; oprd6_COL3; oprd6_COL4; oprd6_COL5; oprd6_COL6; oprd6_COL7)
	C_TEXT:C284(oprd6_COL8; oprd6_COL9; oprd6_HED1; oprd6_HED10; oprd6_HED2; oprd6_HED3; oprd6_HED4; oprd6_HED5; oprd6_HED6; oprd6_HED7; oprd6_HED8)
	C_TEXT:C284(oprd6_HED9; oprd7_COL1; oprd7_COL10; oprd7_COL2; oprd7_COL3; oprd7_COL4; oprd7_COL5; oprd7_COL6; oprd7_COL7; oprd7_COL8; oprd7_COL9)
	C_TEXT:C284(oprd7_HED1; oprd7_HED10; oprd7_HED2; oprd7_HED3; oprd7_HED4; oprd7_HED5; oprd7_HED6; oprd7_HED7; oprd7_HED8; oprd7_HED9; oprd8_COL1)
	C_TEXT:C284(oprd8_COL10; oprd8_COL2; oprd8_COL3; oprd8_COL4; oprd8_COL5; oprd8_COL6; oprd8_COL7; oprd8_COL8; oprd8_COL9; oprd8_HED1; oprd8_HED10)
	C_TEXT:C284(oprd8_HED2; oprd8_HED3; oprd8_HED4; oprd8_HED5; oprd8_HED6; oprd8_HED7; oprd8_HED8; oprd8_HED9; oprd9_COL1; oprd9_COL10; oprd9_COL2)
	C_TEXT:C284(oprd9_COL3; oprd9_COL4; oprd9_COL5; oprd9_COL6; oprd9_COL7; oprd9_COL8; oprd9_COL9; oprd9_HED1; oprd9_HED10; oprd9_HED2; oprd9_HED3)
	C_TEXT:C284(oprd9_HED4; oprd9_HED5; oprd9_HED6; oprd9_HED7; oprd9_HED8; oprd9_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_LocationsEditor.oAddAnotherroduct8"; Form event code:C388)

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


If ($_ptr_CurrentLocationID->>0)
	If ($_ptr_CurrentLocationSubLevName->="")
		If (Size of array:C274($_ptr_ProductCodes->)>0)
			
			//we already have at least one added and have already clicked to add
			LB_SetEnterable($_ptr_ProductList; True:C214; 1)
			$_l_SizeofArray:=Size of array:C274($_ptr_ProductIDS->)
			LISTBOX INSERT ROWS:C913($_ptr_ProductList->; $_l_SizeofArray+1)
			$_ptr_ProdSelected->:=0
			LB_GoToCell($_ptr_ProductList; 1; $_l_SizeofArray+1)
		Else 
			//we have none or 1
			If ($_ptr_ProductCode->#"")
				//Set up the list box
				ARRAY LONGINT:C221($_ptr_ProductIDS->; 0)
				ARRAY TEXT:C222($_ptr_ProductCodes->; 0)
				ARRAY TEXT:C222($_ptr_ProductNames->; 0)
				ARRAY REAL:C219($_ptr_ProductCounts->; 0)
				//``
				//`
				
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
				LB_SetEnterable($_ptr_ProductList; True:C214; 1)
				OBJECT SET VISIBLE:C603($_ptr_ProductList->; True:C214)
				OBJECT SET VISIBLE:C603(*; $_t_ProdCodeLabelName; False:C215)
				OBJECT SET VISIBLE:C603(*; $_t_ProdNameLabelName; False:C215)
				OBJECT SET VISIBLE:C603(*; $_t_ProdCountLabelName; False:C215)
				OBJECT SET VISIBLE:C603($_ptr_ProductCode->; False:C215)
				OBJECT SET VISIBLE:C603($_ptr_ProductID->; False:C215)
				OBJECT SET VISIBLE:C603($_ptr_ProductName->; False:C215)
				OBJECT SET VISIBLE:C603($_ptr_ProductCount->; False:C215)
				LISTBOX INSERT ROWS:C913($_ptr_ProductList->; 1)
				
				$_ptr_ProductIDS->{1}:=$_ptr_ProductID->
				$_ptr_ProductCodes->{1}:=$_ptr_ProductCode->
				$_ptr_ProductNames->{1}:=$_ptr_ProductName->
				$_ptr_ProductCounts->{1}:=$_ptr_ProductCount->
				$_ptr_ProductCount->:=0
				$_ptr_ProductName->:=""
				$_ptr_ProductCode->:=""
				$_ptr_ProductID->:=0
				//Now add another row in for typing...
				$_l_SizeofArray:=Size of array:C274($_ptr_ProductIDS->)
				LISTBOX INSERT ROWS:C913($_ptr_ProductList->; $_l_SizeofArray+1)
				LB_GoToCell($_ptr_ProductList; 1; $_l_SizeofArray+1)
				$_ptr_ProdSelected->:=0
				
			Else 
				//This should never be because the button is hidden
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].STK_LocationsEditor.oAddAnotherroduct8"; $_t_oldMethodName)
