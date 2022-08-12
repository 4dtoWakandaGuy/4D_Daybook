//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LMA_DeleteListItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListItemDeletion;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_ListItemvalue;0)
	//ARRAY LONGINT(AA_al_SubItemIndex;0)
	//ARRAY LONGINT(AA_al_SubListItemDeletion;0)
	//ARRAY LONGINT(WS_al_PropertyValues;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItemvalue;0)
	//ARRAY TEXT(AA_at_PropertyValues;0)
	C_BOOLEAN:C305($_bo_DeleteSublist)
	C_LONGINT:C283($_l_Continue; $_l_CountListItems; $_l_Insert; $_l_ItemPosition; $_l_ItemReference; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SelectedSubListItem; $_l_SubItemPosition; $_l_SubItemRef; $_l_SubListID)
	C_LONGINT:C283($_l_SublistID2; AA_HL_ListItems; AA_l_CurrentSelectedItemID)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; $_t_ParentText; $_t_SubItem; AA_t_CurrentListItem; AA_t_SelectedProperty; WS_t_selectedListItemvalue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LMA_DeleteListItem")


$_l_SelectedListItem:=Selected list items:C379(AA_HL_ListItems)
GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)

If (AA_HL_ListItems>0)
	CONFIRM:C162("Are you sure you wish to delete "+$_t_ItemText+"?"; "No"; "Yes")
	If (OK=0)
		GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
		$_l_SelectedItemParent:=List item parent:C633(AA_HL_ListItems; $_l_ItemReference)
		If ($_l_SelectedItemParent#0)  //this is a sublist item
			$_l_ItemPosition:=Find in array:C230(AA_al_SubItemIndex; $_l_ItemReference)
			If ($_l_ItemPosition>0)
				If ($_l_ItemPosition>Size of array:C274(AA_al_SubListItemDeletion))
					//just to stop any errors
					
					$_l_Insert:=$_l_ItemPosition-Size of array:C274(AA_al_SubListItemDeletion)
					INSERT IN ARRAY:C227(AA_al_SubListItemDeletion; Size of array:C274(AA_al_SubListItemDeletion)+1; $_l_Insert)
				End if 
				
				AA_al_SubListItemDeletion{$_l_ItemPosition}:=1
				$_bo_DeleteSublist:=False:C215
				If ($_l_SelectedItemParent>0)
					SELECT LIST ITEMS BY REFERENCE:C630(AA_HL_ListItems; $_l_SelectedItemParent)
					$_l_SelectedListItem:=Selected list items:C379(AA_HL_ListItems)
					GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_SelectedItemParent; $_t_ParentText; $_l_SubListID)
					$_l_CountListItems:=Count list items:C380($_l_SubListID)
					If ($_l_CountListItems=1)
						//we are gonna delete the last item
						$_bo_DeleteSublist:=True:C214
					End if 
					
				End if 
				
				DELETE FROM LIST:C624(AA_HL_ListItems; $_l_ItemReference; *)
				If ($_bo_DeleteSublist)
					SET LIST ITEM:C385(AA_HL_ListItems; $_l_SelectedItemParent; $_t_ParentText; $_l_SelectedItemParent; 0; False:C215)
				End if 
				AA_l_CurrentSelectedItemID:=0
				AA_t_CurrentListItem:=""
				ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; 0)
				ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; 0)
				ARRAY TEXT:C222(AA_at_ListItemvalue; 0)
				ARRAY LONGINT:C221(AA_al_ListItemvalue; 0)
				AA_t_SelectedProperty:=""
				WS_t_selectedListItemvalue:=""
				ARRAY TEXT:C222(AA_at_PropertyValues; 0)  //these get populated when you select  and item
				ARRAY LONGINT:C221(WS_al_PropertyValues; 0)  //these get populated when you select  and item
			End if 
		Else 
			$_l_ItemPosition:=Find in array:C230(AA_al_ListItemIDs; $_l_ItemReference)
			$_l_Continue:=1
			If ($_l_SubListID>0)  //this has a sublist too
				$_l_Continue:=0
				CONFIRM:C162("This will delete the Sub-items too"; "Stop"; "Continue")
				If (OK=0)
					$_l_Continue:=1
					$_l_CountListItems:=Count list items:C380($_l_SubListID)
					For ($_l_SelectedSubListItem; $_l_CountListItems; 1; -1)
						GET LIST ITEM:C378($_l_SubListID; $_l_SelectedSubListItem; $_l_SubItemRef; $_t_SubItem; $_l_SublistID2)
						$_l_SubItemPosition:=Find in array:C230(AA_al_SubItemIndex; $_l_SubItemRef)
						If ($_l_SubItemPosition>0)
							AA_al_SubListItemDeletion{$_l_SubItemPosition}:=1
						End if 
					End for 
					
				End if 
			End if 
			
			If ($_l_Continue=1)
				If ($_l_ItemPosition>0)
					AA_al_ListItemDeletion{$_l_ItemPosition}:=1
					
					DELETE FROM LIST:C624(AA_HL_ListItems; $_l_ItemReference; *)
					
					
					AA_l_CurrentSelectedItemID:=0
					AA_t_CurrentListItem:=""
					
					ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; 0)
					ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; 0)
					ARRAY TEXT:C222(AA_at_ListItemvalue; 0)
					ARRAY LONGINT:C221(AA_al_ListItemvalue; 0)
					AA_t_SelectedProperty:=""
					WS_t_selectedListItemvalue:=""
					ARRAY TEXT:C222(AA_at_PropertyValues; 0)  //these get populated when you select  and item
					ARRAY LONGINT:C221(WS_al_PropertyValues; 0)
				End if 
			End if 
		End if 
		
		//now remove the item from the HL
		
		////////////////////////////_o_REDRAW LIST(AA_HL_ListItems)
		
		
	End if 
	
End if 
ERR_MethodTrackerReturn("AA_LMA_DeleteListItem"; $_t_oldMethodName)
