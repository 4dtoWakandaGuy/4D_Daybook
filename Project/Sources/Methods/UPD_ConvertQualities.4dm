//%attributes = {}
If (False:C215)
	//Project Method Name:      UPD_ConvertQualities
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/09/2009 20:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListItemProperttNUM;0;0)
	//ARRAY LONGINT(AA_al_SubListItemProperttNUM;0;0)
	//ARRAY LONGINT(AA_al_SubListItemsIDS;0)
	//ARRAY LONGINT(AL_al_ListItemIDS;0)
	ARRAY TEXT:C222($_at_otherGroups; 0)
	//ARRAY TEXT(AA_at_ListItemProperties;0)
	//ARRAY TEXT(AA_at_ListItempropertyNAM;0;0)
	//ARRAY TEXT(AA_at_ListitemPropertyNM;0;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_SubListItemProperties;0)
	//ARRAY TEXT(AA_at_SubListItempropertyNAM;0;0)
	//ARRAY TEXT(AA_at_SubListitemPropertyNM;0;0)
	//ARRAY TEXT(AA_at_SubListItems;0)
	C_LONGINT:C283($_l_AccessLevel; $_l_CurrentRow; $_l_GroupNameRow; $_l_GroupNameRow2; $_l_Index; $_l_InformationIndex; $_l_ItemID; $_l_ListID; $_l_PropertiesListNUM; $_l_RecordsIndex; $_l_SubListID)
	C_LONGINT:C283($_l_SublistRow)
	C_TEXT:C284($_t_GroupItem; $_t_GroupName; $_t_ItemName; $_t_oldMethodName; $_t_SubListName; AA_t_CallingMethod)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UPD_ConvertQualities")
//Open window(20;60;300;200;1984)


READ WRITE:C146([INFORMATION:55])
QUERY:C277([INFORMATION:55]; [INFORMATION:55]SubGroup:6=""; *)
QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Group:2="")
DELETE SELECTION:C66([INFORMATION:55])

//UPD_CheckQualities

ARRAY TEXT:C222(AA_at_ListItems; 0)
ARRAY LONGINT:C221(AL_al_ListItemIDS; 0)
ARRAY TEXT:C222(AA_at_ListItemProperties; 0)
ARRAY TEXT:C222(AA_at_ListitemPropertyNM; 0; 0)
ARRAY LONGINT:C221(AA_al_ListItemProperttNUM; 0; 0)
ARRAY TEXT:C222(AA_at_ListItempropertyNAM; 0; 0)
QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=0)
If (Records in selection:C76([INFORMATION:55])>0)
	
	
	//so now all the qual sub groups should exist????
	AA_t_CallingMethod:="UPD_ConvertQualities"
	$_l_ListID:=AA_LoadListByName("Qualities"; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215)
	
	
	ARRAY TEXT:C222($_at_otherGroups; 1000)
	$_l_CurrentRow:=0
	ALL RECORDS:C47([QUALITY_GROUPS:56])
	For ($_l_Index; 1; Records in selection:C76([QUALITY_GROUPS:56]))
		$_t_GroupName:=[QUALITY_GROUPS:56]Group:1
		$_l_GroupNameRow:=Find in array:C230(AA_at_ListItems; $_t_GroupName)
		If ($_l_GroupNameRow<0)
			$_l_GroupNameRow2:=Find in array:C230($_at_otherGroups; $_t_GroupName)
			If ($_l_GroupNameRow2<0)
				//this did not get created so it will need to be
				$_l_CurrentRow:=$_l_CurrentRow+1
				If ($_l_CurrentRow>Size of array:C274($_at_otherGroups))
					INSERT IN ARRAY:C227($_at_otherGroups; Size of array:C274($_at_otherGroups); 1000)
				End if 
				$_at_otherGroups{$_l_CurrentRow}:=$_t_GroupName
			End if 
			
		End if 
		NEXT RECORD:C51([QUALITY_GROUPS:56])
	End for 
	ARRAY TEXT:C222($_at_otherGroups; $_l_CurrentRow)
	
	If ($_l_CurrentRow>0)
		$_l_ListID:=AA_GetListbyName("Qualities")
		For ($_l_Index; 1; Size of array:C274($_at_otherGroups))
			$_l_ItemID:=AA_ListAddItembyID($_l_ListID; $_at_otherGroups{$_l_Index})
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ItemID)
			//we have to set up an xlist(sublist) for the items in that quality
			$_t_ItemName:=[LIST_ITEMS:95]List_Entry:2
			QUERY:C277([QUALITY_GROUPS:56]; [QUALITY_GROUPS:56]Group:1=[LIST_ITEMS:95]List_Entry:2)
			If (Records in selection:C76([QUALITY_GROUPS:56])>0)
				//there is a subgroup
				AA_t_CallingMethod:="UPD_ConvertQualities"
				$_l_ListID:=AA_LoadListByName($_t_ItemName; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215)
				$_l_SubListID:=AA_GetListbyName($_t_ItemName)
				FIRST RECORD:C50([QUALITY_GROUPS:56])
				For ($_l_RecordsIndex; 1; Records in selection:C76([QUALITY_GROUPS:56]))
					$_l_GroupNameRow:=Find in array:C230(AA_at_ListItems; [QUALITY_GROUPS:56]SubGroup:2)
					If ($_l_GroupNameRow<0)
						$_t_GroupItem:=[QUALITY_GROUPS:56]SubGroup:2
						CREATE RECORD:C68([LIST_ITEMS:95])
						[LIST_ITEMS:95]List_Entry:2:=$_t_GroupItem
						[LIST_ITEMS:95]X_ListID:4:=$_l_SubListID
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
					Else 
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AL_al_ListItemIDS{$_l_GroupNameRow})
					End if 
					READ WRITE:C146([X_LISTS:111])
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_SubListID)
					$_l_AccessLevel:=0
					$_l_AccessLevel:=$_l_AccessLevel ?+ 5
					AA_SetListProperty("ACCESS"; $_l_AccessLevel)
					DB_SaveRecord(->[X_LISTS:111])
					AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
					NEXT RECORD:C51([QUALITY_GROUPS:56])
					
				End for 
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ItemID)
				AA_SetListItemProperty("SUBLIST"; $_l_SubListID)
				DB_SaveRecord(->[LIST_ITEMS:95])
				AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
			End if 
			
		End for 
		
		
		
	End if 
	//now we can link up the existing records
	ARRAY TEXT:C222(AA_at_ListitemPropertyNM; 0; 0)
	ARRAY LONGINT:C221(AA_al_ListItemProperttNUM; 0; 0)
	ARRAY TEXT:C222(AA_at_ListItempropertyNAM; 0; 0)
	AA_t_CallingMethod:="UPD_ConvertQualities"
	$_l_ListID:=AA_LoadListByName("Qualities"; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties; ->AA_at_ListitemPropertyNM; ->AA_al_ListItemProperttNUM; ->AA_at_ListItempropertyNAM)
	
	READ WRITE:C146([INFORMATION:55])
	QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15=0; *)
	QUERY:C277([INFORMATION:55];  | ; [INFORMATION:55]QualityRecordID:16=0; *)
	QUERY:C277([INFORMATION:55];  | ; [INFORMATION:55]QualityID:14=0)
	CREATE SET:C116([INFORMATION:55]; "QSET")
	//ORDER BY([QUALITIES];[QUALITIES]Group;[QUALITIES]SubGroup)
	
	//CLOSE WINDOW
	ARRAY TEXT:C222(AA_at_ListItems; 0)
	ARRAY LONGINT:C221(AL_al_ListItemIDS; 0)
	ARRAY TEXT:C222(AA_at_ListItemProperties; 0)
	ARRAY TEXT:C222(AA_at_SubListItems; 0)
	ARRAY LONGINT:C221(AA_al_SubListItemsIDS; 0)
	ARRAY TEXT:C222(AA_at_SubListItemProperties; 0)
	ARRAY TEXT:C222(AA_at_ListitemPropertyNM; 0; 0)
	ARRAY LONGINT:C221(AA_al_ListItemProperttNUM; 0; 0)
	ARRAY TEXT:C222(AA_at_ListItempropertyNAM; 0; 0)
	AA_t_CallingMethod:="UPD_ConvertQualities"
	$_l_ListID:=AA_LoadListByName("Qualities"; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties; ->AA_at_ListitemPropertyNM; ->AA_al_ListItemProperttNUM; ->AA_at_ListItempropertyNAM)
	
	For ($_l_Index; 1; Size of array:C274(AA_at_ListItems))
		$_l_SublistRow:=Find in array:C230(AA_at_ListitemPropertyNM{$_l_Index}; "SUBLIST")
		
		If ($_l_SublistRow>0)  //#"")
			$_l_PropertiesListNUM:=AA_al_ListItemProperttNUM{$_l_Index}{$_l_SublistRow}
			If ($_l_PropertiesListNUM>0)
				ARRAY TEXT:C222(AA_at_SubListitemPropertyNM; 0; 0)
				ARRAY LONGINT:C221(AA_al_SubListItemProperttNUM; 0; 0)
				ARRAY TEXT:C222(AA_at_SubListItempropertyNAM; 0; 0)
				AA_LoadListbyID($_l_PropertiesListNUM; ->AA_at_SubListItems; ->AA_al_SubListItemsIDS; False:C215; ->AA_at_SubListItemProperties; ->AA_at_SubListitemPropertyNM; ->AA_al_SubListItemProperttNUM; ->AA_at_SubListItempropertyNAM)
				
				READ WRITE:C146([X_LISTS:111])
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_PropertiesListNUM)
				$_l_AccessLevel:=0
				$_l_AccessLevel:=$_l_AccessLevel ?+ 5
				AA_SetListProperty("ACCESS"; $_l_AccessLevel)
				DB_SaveRecord(->[X_LISTS:111])
				AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
			End if 
		Else 
			$_t_SubListName:=AA_at_ListItems{$_l_Index}
			$_l_SubListID:=AA_GetListbyName($_t_SubListName)
			If ($_l_SubListID=0)
				ARRAY TEXT:C222(AA_at_SubListitemPropertyNM; 0; 0)
				ARRAY LONGINT:C221(AA_al_SubListItemProperttNUM; 0; 0)
				ARRAY TEXT:C222(AA_at_SubListItempropertyNAM; 0; 0)
				AA_t_CallingMethod:="UPD_ConvertQualities"
				$_l_ListID:=AA_LoadListByName($_t_SubListName; ->AA_at_SubListItems; ->AA_al_SubListItemsIDS; False:C215; ->AA_at_SubListItemProperties; ->AA_at_SubListitemPropertyNM; ->AA_al_SubListItemProperttNUM; ->AA_at_SubListItempropertyNAM)
				
				
				$_l_SubListID:=AA_GetListbyName($_t_SubListName)
			End if 
			READ WRITE:C146([LIST_ITEMS:95])
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AL_al_ListItemIDS{$_l_Index})
			AA_SetListItemProperty("SUBLIST"; $_l_SubListID)
			DB_SaveRecord(->[LIST_ITEMS:95])
			AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
			
			
			
		End if 
	End for 
	
	
	ARRAY TEXT:C222(AA_at_ListItems; 0)
	ARRAY LONGINT:C221(AL_al_ListItemIDS; 0)
	ARRAY TEXT:C222(AA_at_ListItemProperties; 0)
	ARRAY TEXT:C222(AA_at_SubListItems; 0)
	ARRAY LONGINT:C221(AA_al_SubListItemsIDS; 0)
	ARRAY TEXT:C222(AA_at_SubListItemProperties; 0)
	ARRAY TEXT:C222(AA_at_ListitemPropertyNM; 0; 0)
	ARRAY LONGINT:C221(AA_al_ListItemProperttNUM; 0; 0)
	ARRAY TEXT:C222(AA_at_ListItempropertyNAM; 0; 0)
	AA_t_CallingMethod:="UPD_ConvertQualities"
	$_l_ListID:=AA_LoadListByName("Qualities"; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties; ->AA_at_ListitemPropertyNM; ->AA_al_ListItemProperttNUM; ->AA_at_ListItempropertyNAM)
	
	For ($_l_Index; 1; Size of array:C274(AA_at_ListItems))
		$_l_SublistRow:=Find in array:C230(AA_at_ListitemPropertyNM{$_l_Index}; "SUBLIST")
		$_t_SubListName:=AA_at_ListItems{$_l_Index}
		If ($_l_SublistRow>0)
			$_l_PropertiesListNUM:=AA_al_ListItemProperttNUM{$_l_Index}{$_l_SublistRow}
			If ($_l_PropertiesListNUM>0)
				ARRAY TEXT:C222(AA_at_SubListitemPropertyNM; 0; 0)
				ARRAY LONGINT:C221(AA_al_SubListItemProperttNUM; 0; 0)
				ARRAY TEXT:C222(AA_at_SubListItempropertyNAM; 0; 0)
				AA_t_CallingMethod:="UPD_ConvertQualities"
				$_l_ListID:=AA_LoadListByName($_t_SubListName; ->AA_at_SubListItems; ->AA_al_SubListItemsIDS; False:C215; ->AA_at_SubListItemProperties; ->AA_at_SubListitemPropertyNM; ->AA_al_SubListItemProperttNUM; ->AA_at_SubListItempropertyNAM)
				
				READ WRITE:C146([X_LISTS:111])
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_PropertiesListNUM)
				$_l_AccessLevel:=0
				$_l_AccessLevel:=$_l_AccessLevel ?+ 5
				AA_SetListProperty("ACCESS"; $_l_AccessLevel)
				DB_SaveRecord(->[X_LISTS:111])
				AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
				
				
			End if 
		Else 
			
			$_l_SubListID:=AA_GetListbyName($_t_SubListName)
			If ($_l_SubListID=0)
				AA_t_CallingMethod:="UPD_ConvertQualities"
				$_l_ListID:=AA_LoadListByName($_t_SubListName; ->AA_at_SubListItems; ->AA_al_SubListItemsIDS; False:C215; ->AA_at_SubListItemProperties; ->AA_at_SubListitemPropertyNM; ->AA_al_SubListItemProperttNUM; ->AA_at_SubListItempropertyNAM)
				$_l_SubListID:=AA_GetListbyName($_t_SubListName)
			End if 
			READ WRITE:C146([LIST_ITEMS:95])
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AL_al_ListItemIDS{$_l_Index})
			AA_SetListItemProperty("SUBLIST"; $_l_SubListID)
			DB_SaveRecord(->[LIST_ITEMS:95])
			AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
			
			
			
		End if 
	End for 
	ARRAY TEXT:C222(AA_at_ListitemPropertyNM; 0; 0)
	ARRAY LONGINT:C221(AA_al_ListItemProperttNUM; 0; 0)
	ARRAY TEXT:C222(AA_at_ListItempropertyNAM; 0; 0)
	AA_t_CallingMethod:="UPD_ConvertQualities"
	$_l_ListID:=AA_LoadListByName("Qualities"; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties; ->AA_at_ListitemPropertyNM; ->AA_al_ListItemProperttNUM; ->AA_at_ListItempropertyNAM)
	$_l_ListID:=AA_GetListbyName("Qualities")
	For ($_l_Index; 1; Size of array:C274(AA_at_ListItemProperties))
		$_t_ItemName:=AA_at_ListItems{$_l_Index}
		$_l_ItemID:=AL_al_ListItemIDS{$_l_Index}
		$_l_ListID:=AA_LoadListByName($_t_ItemName; ->AA_at_SubListItems; ->AA_al_SubListItemsIDS; False:C215; ->AA_at_SubListItemProperties; ->AA_at_SubListitemPropertyNM; ->AA_al_SubListItemProperttNUM; ->AA_at_SubListItempropertyNAM)
		
		$_l_SubListID:=AA_GetListbyName($_t_ItemName)
		For ($_l_InformationIndex; 1; Size of array:C274(AA_al_SubListItemsIDS))
			READ WRITE:C146([INFORMATION:55])
			QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=AA_al_SubListItemsIDS{$_l_InformationIndex})
			DB_lockFile(->[INFORMATION:55])
			APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15:=$_l_ItemID)
			APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]Group:2:=$_t_ItemName)
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
			
		End for 
	End for 
	
	
End if 
ERR_MethodTrackerReturn("UPD_ConvertQualities"; $_t_oldMethodName)
