//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LMU_SaveProperty
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
	//ARRAY LONGINT(AA_al_2DItemAttributesLIstID;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_ListItemvalue;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_ListPropertySublists;0)
	//ARRAY LONGINT(AA_al_ListPropTypesID;0)
	//ARRAY LONGINT(WS_al_PropertyValues;0)
	//ARRAY TEXT(AA_at_2DItemAttributes;0)
	//ARRAY TEXT(AA_at_2DItemAttributesLIstNM;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_ListItemvalue;0)
	//ARRAY TEXT(AA_at_PropertyValues;0)
	C_LONGINT:C283($_l_CurrentItemRow; $_l_PropertyIDPosition; $_l_PropertyTypePosition; $_l_SublistID; $_l_SublistPosition; AA_l_CurrentItemID; AA_l_CurrentSelectedProperty; WS_l_CurrentItemROW)
	C_TEXT:C284($_t_oldMethodName; AA_t_SelectedProperty; WS_t_selectedListItemvalue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LMU_SaveProperty")
//this method works in the form[x_Lists];"Display_list_Dialogue"
//it is used to update the properties of a list item
If (AA_l_CurrentSelectedProperty>0)
	//here check that the 2D arrays exist to save this into
	If (AA_l_CurrentItemID>0)
		WS_l_CurrentItemROW:=Find in array:C230(AA_al_ListItemIDs; AA_l_CurrentItemID)
	Else 
		//this item does not exist so we need to add a row for it and give an ID
		If (WS_l_CurrentItemROW=0)
			INSERT IN ARRAY:C227(AA_at_ListItems; Size of array:C274(AA_at_ListItems)+1; 1)
			INSERT IN ARRAY:C227(AA_al_ListItemIDs; Size of array:C274(AA_al_ListItemIDs)+1; 1)
			INSERT IN ARRAY:C227(AA_al_2DItemAttributesLIstID; Size of array:C274(AA_al_2DItemAttributesLIstID)+1; 1)
			INSERT IN ARRAY:C227(AA_al_2DItemAttributes; Size of array:C274(AA_al_2DItemAttributes)+1; 1)
			INSERT IN ARRAY:C227(AA_at_2DItemAttributesLIstNM; Size of array:C274(AA_at_2DItemAttributesLIstNM)+1; 1)
			INSERT IN ARRAY:C227(AA_at_2DItemAttributes; Size of array:C274(AA_at_2DItemAttributes)+1; 1)
			WS_l_CurrentItemROW:=Size of array:C274(AA_at_ListItems)
		End if 
	End if 
	If (Size of array:C274(AA_at_PropertyValues)>0)
		$_l_PropertyTypePosition:=Find in array:C230(AA_al_ListItemPropertyTypes; AA_al_ListItemPropertyTypes{AA_at_ListItemPropertyTypes})
		If (WS_al_PropertyValues{AA_at_PropertyValues}#AA_al_ListItemvalue{$_l_PropertyTypePosition})
			AA_al_ListItemvalue{$_l_PropertyTypePosition}:=WS_al_PropertyValues{AA_at_PropertyValues}
			AA_at_ListItemvalue{$_l_PropertyTypePosition}:=AA_at_PropertyValues{AA_at_PropertyValues}
		End if 
		//and save it back to the 2D arrays as well
		$_l_CurrentItemRow:=WS_l_CurrentItemROW
		If ($_l_CurrentItemRow>0)
			//it should be
			$_l_PropertyIDPosition:=Find in array:C230(AA_al_ListPropertyIDs; AA_al_ListPropTypesID{$_l_PropertyTypePosition})
			If ($_l_PropertyIDPosition>0)  //it should be
				$_l_SublistID:=AA_al_ListPropertySublists{$_l_PropertyIDPosition}
				$_l_SublistPosition:=Find in array:C230(AA_al_2DItemAttributesLIstID{$_l_CurrentItemRow}; $_l_SublistID)
				If ($_l_SublistPosition<0)
					//this was not set now it is
					INSERT IN ARRAY:C227(AA_al_2DItemAttributesLIstID{$_l_CurrentItemRow}; Size of array:C274(AA_al_2DItemAttributesLIstID{$_l_CurrentItemRow})+1; 1)
					INSERT IN ARRAY:C227(AA_al_2DItemAttributes{$_l_CurrentItemRow}; Size of array:C274(AA_al_2DItemAttributesLIstID{$_l_CurrentItemRow})+1; 1)
					INSERT IN ARRAY:C227(AA_at_2DItemAttributesLIstNM{$_l_CurrentItemRow}; Size of array:C274(AA_al_2DItemAttributesLIstID{$_l_CurrentItemRow})+1; 1)
					INSERT IN ARRAY:C227(AA_at_2DItemAttributes{$_l_CurrentItemRow}; Size of array:C274(AA_al_2DItemAttributesLIstID{$_l_CurrentItemRow})+1; 1)
					$_l_SublistPosition:=Size of array:C274(AA_al_2DItemAttributesLIstID{$_l_CurrentItemRow})
				End if 
				AA_al_2DItemAttributesLIstID{$_l_CurrentItemRow}{$_l_SublistPosition}:=$_l_SublistID
				AA_al_2DItemAttributes{$_l_CurrentItemRow}{$_l_SublistPosition}:=AA_al_ListItemvalue{$_l_PropertyTypePosition}
				AA_at_2DItemAttributesLIstNM{$_l_CurrentItemRow}{$_l_SublistPosition}:=AA_at_ListItemPropertyTypes{$_l_PropertyTypePosition}
				AA_at_2DItemAttributes{$_l_CurrentItemRow}{$_l_SublistPosition}:=AA_at_ListItemvalue{$_l_PropertyTypePosition}
			Else 
				//  ALERT("ERROR")
				Gen_Alert("ERROR")
				
			End if 
			
		Else 
			//    ALERT("ERROR")
			Gen_Alert("ERROR")
		End if 
		
		
		
		
	End if 
	
End if 
//````
ARRAY TEXT:C222(AA_at_PropertyValues; 0)  //these get populated when you select  and item
ARRAY LONGINT:C221(WS_al_PropertyValues; 0)  //these get populated when you select  and item
AA_t_SelectedProperty:=""
WS_t_selectedListItemvalue:=""
AA_l_CurrentSelectedProperty:=0
AA_at_PropertyValues:=0
ERR_MethodTrackerReturn("AA_LMU_SaveProperty"; $_t_oldMethodName)
