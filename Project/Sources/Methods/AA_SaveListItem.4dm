//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_SaveListItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_2DItemAttributes;0)
	//ARRAY LONGINT(AA_al_2DItemAttributesLIstID;0)
	//ARRAY LONGINT(AA_al_ItemIDsModified;0)
	//ARRAY LONGINT(AA_al_ListItemDeletion;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_SubItemAttributes;0)
	//ARRAY LONGINT(AA_al_SubItemAttributesListID;0)
	//ARRAY LONGINT(AA_al_SubItemIndex;0)
	//ARRAY LONGINT(AA_al_SubItemListID;0)
	//ARRAY LONGINT(AA_al_SubListCRHLID;0)
	//ARRAY LONGINT(AA_al_SublistCRID;0)
	//ARRAY LONGINT(AA_al_SubListItemDeletion;0)
	//ARRAY TEXT(AA_at_2DItemAttributes;0)
	//ARRAY TEXT(AA_at_2DItemAttributesLIstNM;0)
	//ARRAY TEXT(AA_at_ListItemProperties;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_SubItemAttributes;0)
	//ARRAY TEXT(AA_at_SubItemAttributesLIst;0)
	//ARRAY TEXT(AA_at_SubItemNames;0)
	C_BOOLEAN:C305($_bo_Expanded; $_bo_Expanded2; AA_Bo_ListtoUpdate)
	C_LONGINT:C283($_l_ItemReference; $_l_ItemReference2; $_l_ItemRow; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SelectedListItem2; $_l_SublistID; $_l_SublistID2; $1; AA_HL_ListItems; AA_l_CurrentSelectedItemID)
	C_LONGINT:C283(AA_l_CurrentSelectedProperty)
	C_REAL:C285($2)
	C_TEXT:C284($_t_ItemRef2; $_t_ItemText; $_t_oldMethodName; AA_t_CurrentListItem)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_SaveListItem")
//this method saves a list item back to the array and
// updates the Heirarchical list
//it does save the item back to data
//(that happens when you switch lists or exit the screen
//





If (Count parameters:C259>=1)
	If ($1#0)
		//this is either in the list or the sublist
		$_l_ItemRow:=Find in array:C230(AA_al_SubItemIndex; $1)
		// If ($_l_ItemRow<0)`i dont think it makes a difference
		//this item is in the list not the sublist
		$_l_SelectedListItem:=List item position:C629(AA_HL_ListItems; $1)
		GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
		$_l_SelectedItemParent:=List item parent:C633(AA_HL_ListItems; $_l_ItemReference)
		If ($_l_SelectedItemParent#0)
			//need to know the sublist number!
			$_l_SelectedListItem2:=List item position:C629(AA_HL_ListItems; $_l_SelectedItemParent)
			GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem2; $_l_ItemReference2; $_t_ItemRef2; $_l_SublistID2; $_bo_Expanded2)
		End if 
		
		
		
		If ($_t_ItemText#AA_t_CurrentListItem)
			AA_Bo_ListtoUpdate:=True:C214
			$_l_ItemRow:=Find in array:C230(AA_al_ItemIDsModified; $_l_ItemReference)
			If ($_l_ItemRow<0)
				INSERT IN ARRAY:C227(AA_al_ItemIDsModified; Size of array:C274(AA_al_ItemIDsModified)+1; 1)
				AA_al_ItemIDsModified{Size of array:C274(AA_al_ItemIDsModified)}:=$_l_ItemReference
			End if 
			SET LIST ITEM:C385(AA_HL_ListItems; $_l_ItemReference; AA_t_CurrentListItem; $_l_ItemReference; $_l_SublistID; $_bo_Expanded)
		End if 
		$_l_ItemRow:=Find in array:C230(AA_al_SubItemIndex; $1)
		If ($_l_ItemRow<0) & ($_l_SelectedItemParent=0)
			$_l_ItemRow:=Find in array:C230(AA_al_ListItemIDs; $_l_ItemReference)
			If ($_l_ItemRow<0)
				INSERT IN ARRAY:C227(AA_at_ListItems; Size of array:C274(AA_at_ListItems)+1; 1)
				INSERT IN ARRAY:C227(AA_al_ListItemIDs; Size of array:C274(AA_al_ListItemIDs)+1; 1)
				INSERT IN ARRAY:C227(AA_at_ListItemProperties; Size of array:C274(AA_at_ListItemProperties)+1; 1)
				AA_al_ListItemIDs{Size of array:C274(AA_al_ListItemIDs)}:=$_l_ItemReference
				AA_at_ListItems{Size of array:C274(AA_at_ListItems)}:=AA_t_CurrentListItem
				INSERT IN ARRAY:C227(AA_al_2DItemAttributesLIstID; Size of array:C274(AA_al_2DItemAttributesLIstID)+1; 1)
				INSERT IN ARRAY:C227(AA_al_2DItemAttributes; Size of array:C274(AA_al_2DItemAttributes)+1; 1)
				INSERT IN ARRAY:C227(AA_at_2DItemAttributesLIstNM; Size of array:C274(AA_at_2DItemAttributesLIstNM)+1; 1)
				INSERT IN ARRAY:C227(AA_at_2DItemAttributes; Size of array:C274(AA_at_2DItemAttributes)+1; 1)
				INSERT IN ARRAY:C227(AA_al_SublistCRID; Size of array:C274(AA_al_SublistCRID)+1; 1)
				INSERT IN ARRAY:C227(AA_al_SubListCRHLID; Size of array:C274(AA_al_SubListCRHLID)+1; 1)
				INSERT IN ARRAY:C227(AA_al_ListItemDeletion; Size of array:C274(AA_al_ListItemDeletion)+1; 1)
			Else 
				//the item already exists so just update it
				AA_al_ListItemIDs{$_l_ItemRow}:=$_l_ItemReference
				AA_at_ListItems{$_l_ItemRow}:=AA_t_CurrentListItem
			End if 
		Else   //this is a sublist item
			If ($_l_ItemRow<0)
				INSERT IN ARRAY:C227(AA_al_SubItemAttributesListID; Size of array:C274(AA_al_SubItemAttributesListID)+1; 1)
				INSERT IN ARRAY:C227(AA_al_SubItemAttributes; Size of array:C274(AA_al_SubItemAttributesListID)+1; 1)
				INSERT IN ARRAY:C227(AA_at_SubItemAttributesLIst; Size of array:C274(AA_at_2DItemAttributesLIstNM)+1; 1)
				INSERT IN ARRAY:C227(AA_at_SubItemAttributes; Size of array:C274(AA_al_SubItemAttributesListID)+1; 1)
				INSERT IN ARRAY:C227(AA_al_SubItemIndex; Size of array:C274(AA_al_SubItemIndex)+1; 1)
				INSERT IN ARRAY:C227(AA_al_SubItemListID; Size of array:C274(AA_al_SubItemListID)+1; 1)
				INSERT IN ARRAY:C227(AA_at_SubItemNames; Size of array:C274(AA_at_SubItemNames)+1; 1)
				AA_al_SubItemIndex{Size of array:C274(AA_al_SubItemIndex)}:=$_l_ItemReference
				AA_al_SubItemListID{Size of array:C274(AA_al_SubItemListID)}:=AA_al_SublistCRID{Find in array:C230(AA_al_SubListCRHLID; $_l_SublistID2)}
				AA_at_SubItemNames{Size of array:C274(AA_at_SubItemNames)}:=$_t_ItemText
				
				
			Else 
				//item already saved
				AA_at_SubItemNames{$_l_ItemRow}:=$_t_ItemText
			End if 
			
			
			
			
		End if 
		If (AA_l_CurrentSelectedProperty>0)
			AA_SaveListItemProperty(AA_al_ListItemPropertyTypes{AA_l_CurrentSelectedProperty})
			AA_l_CurrentSelectedProperty:=0
		End if 
		AA_l_CurrentSelectedItemID:=0
		//then clear the item
		AA_t_CurrentListItem:=""
		
	End if 
	
End if 
ARRAY LONGINT:C221(AA_al_SubListItemDeletion; Size of array:C274(AA_al_SubItemIndex))
ARRAY LONGINT:C221(AA_al_ListItemDeletion; Size of array:C274(AA_al_ListItemIDs))
ERR_MethodTrackerReturn("AA_SaveListItem"; $_t_oldMethodName)
