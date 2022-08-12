//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_CHECKSUBS
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
	//ARRAY LONGINT(AA_al_ListItemProperttNUM;0;0)
	//ARRAY LONGINT(AL_al_ListItemIDS;0)
	//ARRAY TEXT(AA_at_ListItemProperties;0)
	//ARRAY TEXT(AA_at_ListItempropertyNAM;0;0)
	//ARRAY TEXT(AA_at_ListitemPropertyNM;0;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	C_LONGINT:C283($_l_ListID; $_l_ListIndex; $_l_SubListID; $_l_SublistID2; $_l_SublistRow)
	C_TEXT:C284($_t_ItemName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_CHECKSUBS")

//this checks the subgroup is correct(something made them all go screwy)
ARRAY TEXT:C222(AA_at_ListitemPropertyNM; 0; 0)
ARRAY LONGINT:C221(AA_al_ListItemProperttNUM; 0; 0)
ARRAY TEXT:C222(AA_at_ListItempropertyNAM; 0; 0)
$_l_ListID:=AA_LoadListByName("Qualities"; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties; ->AA_at_ListitemPropertyNM; ->AA_al_ListItemProperttNUM; ->AA_at_ListItempropertyNAM)

For ($_l_ListIndex; 1; Size of array:C274(AA_at_ListItems))
	$_t_ItemName:=AA_at_ListItems{$_l_ListIndex}
	$_l_SubListID:=AA_GetListbyName($_t_ItemName)  //gives me a list matching the name
	$_l_SublistRow:=Find in array:C230(AA_at_ListitemPropertyNM{$_l_ListIndex}; "SUBLIST")
	If ($_l_SublistRow>0)
		$_l_SublistID2:=AA_al_ListItemProperttNUM{$_l_ListIndex}{$_l_SublistRow}
	Else 
		$_l_SublistID2:=0
	End if 
	If ($_l_SubListID>0)
		If ($_l_SublistID2#$_l_SubListID)
			READ WRITE:C146([LIST_ITEMS:95])
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AL_al_ListItemIDS{$_l_ListIndex})
			AA_SetListItemProperty("SUBLIST"; $_l_SubListID)
			DB_SaveRecord(->[LIST_ITEMS:95])
			AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
			UNLOAD RECORD:C212([LIST_ITEMS:95])
			//```
		End if 
	Else 
		READ WRITE:C146([X_LISTS:111])
		QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_SublistID2)
		[X_LISTS:111]x_ListName:2:=$_t_ItemName
		DB_SaveRecord(->[X_LISTS:111])
		AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
		UNLOAD RECORD:C212([X_LISTS:111])
		READ ONLY:C145([X_LISTS:111])
	End if 
	
	
End for 
ERR_MethodTrackerReturn("QV_CHECKSUBS"; $_t_oldMethodName)
