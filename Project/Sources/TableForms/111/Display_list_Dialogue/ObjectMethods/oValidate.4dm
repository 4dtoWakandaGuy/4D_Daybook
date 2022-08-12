If (False:C215)
	//object Method Name: Object Name:      [X_LISTS].Display_list_Dialogue.bValidate1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/02/2012 11:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_2DItemAttributes;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListItemsDelete;0)
	//ARRAY TEXT(AA_at_ListItemProperties;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	C_BOOLEAN:C305($_bo_Save; WS_bo_listEdited)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_ItemRow; WS_l_ListItemaddedID)
	C_TEXT:C284($_t_Attribute2; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [X_LISTS].Display_list_Dialogue.bValidate1"; Form event code:C388)
$_bo_Save:=False:C215
If (AA_at_ListItems{Size of array:C274(AA_at_ListItems)}#"")
	If (AA_al_ListItemIDs{Size of array:C274(AA_al_ListItemIDs)}=0)
		Gen_Confirm("Save "+AA_at_ListItems{Size of array:C274(AA_at_ListItems)}+"?"; "Save"; "Clear")
		If (OK=1)
			$_l_ItemRow:=Find in array:C230(AA_at_ListItems; AA_at_ListItems{Size of array:C274(AA_at_ListItems)})
			If ($_l_ItemRow<Size of array:C274(AA_at_ListItems))
				Gen_Alert(AA_at_ListItems{Size of array:C274(AA_at_ListItems)}+" Already exists. It cannot be added twice.")
				AA_at_ListItems{Size of array:C274(AA_at_ListItems)}:=""
			Else 
				AA_al_ListItemIDs{Size of array:C274(AA_at_ListItems)}:=-Size of array:C274(AA_al_ListItemIDs)
				WS_bo_listEdited:=True:C214
			End if 
		Else 
			AA_at_ListItems{Size of array:C274(AA_at_ListItems)}:=""
		End if 
	Else 
	End if 
End if 

WS_l_ListItemaddedID:=0
If (WS_bo_listEdited)  //exiting form so update records
	READ WRITE:C146([LIST_ITEMS:95])
	For ($_l_Index; 1; Size of array:C274(AA_at_ListItems))
		If (AA_al_ListItemIDs{$_l_Index}<0)  //new Item
			CREATE RECORD:C68([LIST_ITEMS:95])
			[LIST_ITEMS:95]X_ListID:4:=[X_LISTS:111]x_ID:1
			[LIST_ITEMS:95]List_Entry:2:=AA_at_ListItems{$_l_Index}
			DB_SaveRecord(->[LIST_ITEMS:95])
			AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
			WS_l_ListItemaddedID:=[LIST_ITEMS:95]X_ID:3
			//Save the properties
		Else 
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AA_al_ListItemIDs{$_l_Index})
			If ([LIST_ITEMS:95]List_Entry:2#AA_at_ListItems{$_l_Index})  // 06/11/03 pb & bs
				[LIST_ITEMS:95]List_Entry:2:=AA_at_ListItems{$_l_Index}
				//save the properties
				$_t_Attribute2:=""
				If (False:C215)
					For ($_l_Index2; 1; Size of array:C274(AA_al_2DItemAttributes{$_l_Index}))
						AA_SetListItemProperty(AA_at_ListItemProperties{$_l_Index}; AA_al_2DItemAttributes{$_l_Index}{$_l_Index2})
						
					End for 
				End if   //```
				DB_SaveRecord(->[LIST_ITEMS:95])
				AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
			End if   // not equal
		End if 
	End for 
	For ($_l_Index; 1; Size of array:C274(AA_al_ListItemsDelete))
		If (AA_al_ListItemsDelete{$_l_Index}#0)  // 06/11/03 pb
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AA_al_ListItemsDelete{$_l_Index})
			[LIST_ITEMS:95]X_Item_Status:7:=-1
			DB_SaveRecord(->[LIST_ITEMS:95])
			AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
		End if 
	End for 
	UNLOAD RECORD:C212([LIST_ITEMS:95])
	READ ONLY:C145([LIST_ITEMS:95])
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ:Display_list_Dialogue,bValidate"; $_t_oldMethodName)
