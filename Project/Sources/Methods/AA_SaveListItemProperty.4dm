//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_SaveListItemProperty
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
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_ListItemvalue;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_ListPropertySublists;0)
	//ARRAY LONGINT(AA_al_ListPropTypesID;0)
	//ARRAY LONGINT(AA_al_SubItemAttributes;0)
	//ARRAY LONGINT(AA_al_SubItemAttributesListID;0)
	//ARRAY LONGINT(AA_al_SubItemIndex;0)
	//ARRAY LONGINT(WS_al_PropertyValues;0)
	//ARRAY TEXT(AA_at_2DItemAttributes;0)
	//ARRAY TEXT(AA_at_2DItemAttributesLIstNM;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItemvalue;0)
	//ARRAY TEXT(AA_at_PropertyValues;0)
	//ARRAY TEXT(AA_at_SubItemAttributes;0)
	//ARRAY TEXT(AA_at_SubItemAttributesLIst;0)
	C_BOOLEAN:C305($_bo_Expanded; $_bo_Expanded2; $_bo_Update; AA_Bo_ListtoUpdate)
	C_LONGINT:C283($_l_AttributePosition; $_l_CurrentPropertyTypePosition; $_l_ItemReference; $_l_ItemReference2; $_l_ListItemRow; $_l_PropertyRow; $_l_Row; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SelectedListItem2; $_l_SublistID)
	C_LONGINT:C283($_l_SublistID2; $_l_SunlistID; $1; AA_HL_ListItems; AA_l_CurrentSelectedItemID)
	C_TEXT:C284($_t_ItemText; $_t_ItemText2; $_t_oldMethodName; AA_t_SelectedProperty; WS_t_selectedListItemvalue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_SaveListItemProperty")
// this will save the currently selected list item property
//back into
//AA_at_ListItemvalue
//AA_al_ListItemvalue
$_bo_Update:=False:C215
If (Count parameters:C259>=1)
	If (AA_at_PropertyValues>0)
		$_l_CurrentPropertyTypePosition:=Find in array:C230(AA_al_ListItemPropertyTypes; $1)
		If (WS_al_PropertyValues{AA_at_PropertyValues}#AA_al_ListItemvalue{$_l_CurrentPropertyTypePosition})
			// the value has been changed
			AA_Bo_ListtoUpdate:=True:C214
			$_bo_Update:=True:C214
			AA_al_ListItemvalue{$_l_CurrentPropertyTypePosition}:=WS_al_PropertyValues{AA_at_PropertyValues}
			AA_at_ListItemvalue{$_l_CurrentPropertyTypePosition}:=AA_at_PropertyValues{AA_at_PropertyValues}
		End if 
		ARRAY TEXT:C222(AA_at_PropertyValues; 0)  //these get populated when you select  and item
		ARRAY LONGINT:C221(WS_al_PropertyValues; 0)  //these get populated when you select  and item
		AA_t_SelectedProperty:=""
		WS_t_selectedListItemvalue:=""
		//and save it back to the 2D arrays as well
		$_l_SelectedListItem:=List item position:C629(AA_HL_ListItems; AA_l_CurrentSelectedItemID)
		GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
		If ($_bo_Update)
			$_l_ListItemRow:=Find in array:C230(AA_al_ItemIDsModified; $_l_ItemReference)
			If ($_l_ListItemRow<0)
				INSERT IN ARRAY:C227(AA_al_ItemIDsModified; Size of array:C274(AA_al_ItemIDsModified)+1; 1)
				AA_al_ItemIDsModified{Size of array:C274(AA_al_ItemIDsModified)}:=$_l_ItemReference
			End if 
			
		End if 
		
		$_l_SelectedItemParent:=List item parent:C633(AA_HL_ListItems; $_l_ItemReference)
		If ($_l_SelectedItemParent#0)
			//need to know the sublist number!
			$_l_SelectedListItem2:=List item position:C629(AA_HL_ListItems; $_l_SelectedItemParent)
			GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem2; $_l_ItemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded2)
		End if 
		$_l_ListItemRow:=Find in array:C230(AA_al_SubItemIndex; AA_l_CurrentSelectedItemID)
		If ($_l_ListItemRow<0) | ($_l_SelectedItemParent=0)
			//try the parent list
			$_l_Row:=Find in array:C230(AA_al_ListItemIDs; AA_l_CurrentSelectedItemID)
			If ($_l_Row>0)
				//it should be
				$_l_PropertyRow:=Find in array:C230(AA_al_ListPropertyIDs; AA_al_ListPropTypesID{$_l_CurrentPropertyTypePosition})
				If ($_l_PropertyRow>0)
					//it should be
					$_l_SunlistID:=AA_al_ListPropertySublists{$_l_PropertyRow}
					$_l_AttributePosition:=Find in array:C230(AA_al_2DItemAttributesLIstID{$_l_Row}; $_l_SunlistID)
					If ($_l_AttributePosition<0)
						//this was not set now it is
						INSERT IN ARRAY:C227(AA_al_2DItemAttributesLIstID{$_l_Row}; Size of array:C274(AA_al_2DItemAttributesLIstID{$_l_Row})+1; 1)
						INSERT IN ARRAY:C227(AA_al_2DItemAttributes{$_l_Row}; Size of array:C274(AA_al_2DItemAttributesLIstID{$_l_Row})+1; 1)
						INSERT IN ARRAY:C227(AA_at_2DItemAttributesLIstNM{$_l_Row}; Size of array:C274(AA_al_2DItemAttributesLIstID{$_l_Row})+1; 1)
						INSERT IN ARRAY:C227(AA_at_2DItemAttributes{$_l_Row}; Size of array:C274(AA_al_2DItemAttributesLIstID{$_l_Row})+1; 1)
						$_l_AttributePosition:=Size of array:C274(AA_al_2DItemAttributesLIstID{$_l_Row})
					End if 
					AA_al_2DItemAttributesLIstID{$_l_Row}{$_l_AttributePosition}:=$_l_SunlistID
					AA_al_2DItemAttributes{$_l_Row}{$_l_AttributePosition}:=AA_al_ListItemvalue{$_l_CurrentPropertyTypePosition}
					AA_at_2DItemAttributesLIstNM{$_l_Row}{$_l_AttributePosition}:=AA_at_ListItemPropertyTypes{$_l_CurrentPropertyTypePosition}
					AA_at_2DItemAttributes{$_l_Row}{$_l_AttributePosition}:=AA_at_ListItemvalue{$_l_CurrentPropertyTypePosition}
				Else 
					//       ALERT("ERROR")
					Gen_Alert("ERROR")
					
				End if 
				
			Else 
				//     ALERT("ERROR")
				Gen_Alert("ERROR")
			End if 
			
		Else 
			
			//this is a sub item and it exist
			$_l_Row:=$_l_ListItemRow
			If ($_l_Row>0)
				//it should be
				$_l_PropertyRow:=Find in array:C230(AA_al_ListPropertyIDs; AA_al_ListPropTypesID{$_l_CurrentPropertyTypePosition})
				If ($_l_PropertyRow>0)
					//it should be
					$_l_SunlistID:=AA_al_ListPropertySublists{$_l_PropertyRow}
					$_l_AttributePosition:=Find in array:C230(AA_al_SubItemAttributesListID{$_l_Row}; $_l_SunlistID)
					If ($_l_AttributePosition<0)
						//this was not set now it is
						INSERT IN ARRAY:C227(AA_al_SubItemAttributesListID{$_l_Row}; Size of array:C274(AA_al_SubItemAttributesListID{$_l_Row})+1; 1)
						INSERT IN ARRAY:C227(AA_al_SubItemAttributes{$_l_Row}; Size of array:C274(AA_al_SubItemAttributesListID{$_l_Row})+1; 1)
						INSERT IN ARRAY:C227(AA_at_SubItemAttributesLIst{$_l_Row}; Size of array:C274(AA_al_SubItemAttributesListID{$_l_Row})+1; 1)
						INSERT IN ARRAY:C227(AA_at_SubItemAttributes{$_l_Row}; Size of array:C274(AA_al_SubItemAttributesListID{$_l_Row})+1; 1)
						$_l_AttributePosition:=Size of array:C274(AA_at_SubItemAttributes{$_l_Row})
					End if 
					AA_al_SubItemAttributesListID{$_l_Row}{$_l_AttributePosition}:=$_l_SunlistID
					AA_al_SubItemAttributes{$_l_Row}{$_l_AttributePosition}:=AA_al_ListItemvalue{$_l_CurrentPropertyTypePosition}
					AA_at_SubItemAttributesLIst{$_l_Row}{$_l_AttributePosition}:=AA_at_ListItemPropertyTypes{$_l_CurrentPropertyTypePosition}
					AA_at_SubItemAttributes{$_l_Row}{$_l_AttributePosition}:=AA_at_ListItemvalue{$_l_CurrentPropertyTypePosition}
				Else 
					//       ALERT("ERROR")
					Gen_Alert("ERROR")
					
				End if 
				
			Else 
				//     ALERT("ERROR")
				Gen_Alert("ERROR")
			End if 
			
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("AA_SaveListItemProperty"; $_t_oldMethodName)
