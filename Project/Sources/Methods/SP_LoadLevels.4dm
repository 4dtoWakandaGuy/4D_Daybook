//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_LoadLevels
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_NumericSortOrder; 0)
	//ARRAY LONGINT(QV_al_SortOrdersIDs;0)
	//ARRAY LONGINT(SP_al_SalesProjectionLEvelID;0)
	ARRAY TEXT:C222($_at_TempValues; 0)
	//ARRAY TEXT(QV_at_SortOrderNMs;0)
	//ARRAY TEXT(SP_at_SalesProjectionLevels;0)
	C_LONGINT:C283($_l_FieldNumber; $_l_Highest; $_l_Index; $_l_ItemID; $_l_LevelID; $_l_LevelRow; $_l_ListID; $_l_SIzeofArray; $_l_SortID; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_SortSTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_LoadLevels")
ARRAY TEXT:C222(SP_at_SalesProjectionLevels; 0)
ARRAY LONGINT:C221(SP_al_SalesProjectionLEvelID; 0)
$_l_TableNumber:=Table:C252(->[SALES_PROJECTION:113]Forcast_LevelID:3)
$_l_FieldNumber:=Field:C253(->[SALES_PROJECTION:113]Forcast_LevelID:3)
$_l_ListID:=AA_GetListID($_l_TableNumber; $_l_FieldNumber; "Sales Projection Level")
AA_LoadListbyID($_l_ListID; ->SP_at_SalesProjectionLevels; ->SP_al_SalesProjectionLEvelID)

If (Size of array:C274(SP_at_SalesProjectionLevels)=0)
	//first run-put defaults in
	$_l_ItemID:=AA_ListAddItembyID($_l_ListID; "Projected Sale"; "Combined Personal Sales Projection")
	//now put the levels on them
	AA_LoadListbyID($_l_ListID; ->SP_at_SalesProjectionLevels; ->SP_al_SalesProjectionLEvelID)
	$_l_LevelID:=AA_GetListbyName("Sort Order"; True:C214)
	ARRAY LONGINT:C221(QV_al_SortOrdersIDs; 0)
	ARRAY TEXT:C222(QV_at_SortOrderNMs; 0)
	AA_LoadListbyID($_l_LevelID; ->QV_at_SortOrderNMs; ->QV_al_SortOrdersIDs)
	//check there are enough
	ARRAY LONGINT:C221($_al_NumericSortOrder; Size of array:C274(QV_at_SortOrderNMs))
	//because we are storing these as strings sorting would not work
	//so have to put them into a numeric before sorting
	For ($_l_Index; 1; Size of array:C274(QV_at_SortOrderNMs))
		$_al_NumericSortOrder{$_l_Index}:=Num:C11(QV_at_SortOrderNMs{$_l_Index})
	End for 
	SORT ARRAY:C229($_al_NumericSortOrder; QV_at_SortOrderNMs; QV_al_SortOrdersIDs)
	$_l_Highest:=$_al_NumericSortOrder{Size of array:C274($_al_NumericSortOrder)}
	If (Size of array:C274(QV_at_SortOrderNMs)<Size of array:C274(SP_at_SalesProjectionLevels))
		$_l_SIzeofArray:=Size of array:C274(SP_at_SalesProjectionLevels)-Size of array:C274(QV_at_SortOrderNMs)
		For ($_l_Index; 1; $_l_SIzeofArray+1)
			$_t_SortSTR:=String:C10($_l_Highest+$_l_Index)
			$_l_ItemID:=AA_ListAddItembyID($_l_LevelID; $_t_SortSTR)
		End for 
		AA_LoadListbyID($_l_LevelID; ->QV_at_SortOrderNMs; ->QV_al_SortOrdersIDs)
		ARRAY LONGINT:C221($_al_NumericSortOrder; Size of array:C274(QV_at_SortOrderNMs))
		//because we are storing these as strings sorting would not work
		//so have to put them into a numeric before sorting
		For ($_l_Index; 1; Size of array:C274(QV_at_SortOrderNMs))
			$_al_NumericSortOrder{$_l_Index}:=Num:C11(QV_at_SortOrderNMs{$_l_Index})
		End for 
	End if 
	
	
	//remember these are only the defaults for a blank list
	ARRAY TEXT:C222($_at_TempValues; 5)
	$_at_TempValues{1}:="Projected Sale"
	$_at_TempValues{2}:="Combined Personal Sales Projection"
	For ($_l_Index; 1; Size of array:C274($_at_TempValues))
		$_l_LevelRow:=Find in array:C230(SP_at_SalesProjectionLevels; $_at_TempValues{$_l_Index})
		If ($_at_TempValues{$_l_Index}#"")
			If (Find in array:C230($_al_NumericSortOrder; $_l_Index)>0)
				$_l_SortID:=QV_al_SortOrdersIDs{Find in array:C230($_al_NumericSortOrder; $_l_Index)}
				If ($_l_SortID=0)  //????
					AA_ListItemAddProperty(SP_al_SalesProjectionLEvelID{$_l_LevelRow}; $_l_LevelID; $_l_SortID; "Sort Order")
				End if 
			End if 
		End if 
		
	End for 
	
End if 
ERR_MethodTrackerReturn("SP_LoadLevels"; $_t_oldMethodName)
