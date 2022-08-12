If (False:C215)
	//object Method Name: Object Name:      [X_LISTS].Display_list_Dialogue.oLBlistItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/02/2012 18:28
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DeletePreferenceID; 0)
	//ARRAY LONGINT(AA_al_2DItemAttributes;0)
	//ARRAY LONGINT(AA_al_2DItemAttributesLIstID;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_ListItemvalue;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_ListPropertySublists;0)
	//ARRAY LONGINT(AA_al_ListPropTypesID;0)
	//ARRAY LONGINT(WS_al_PropertyValues;0)
	ARRAY TEXT:C222($_at_DeletePreferences; 0)
	//ARRAY TEXT(AA_at_2DItemAttributes;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_ListItemvalue;0)
	//ARRAY TEXT(AA_at_ListPropertyTypes;0)
	//ARRAY TEXT(AA_at_PropertyValues;0)
	C_BOOLEAN:C305(WS_bo_listEdited)
	C_LONGINT:C283($_l_Event; $_l_Index; $_l_ItemID; $_l_PropertyIDRow; $_l_PropertyTypeCount; $_l_PropertyTypeRow; $_l_Row; $_l_SubListColumn; $_l_SubListID; AA_l_CurrentItemID; AA_l_CurrentSelectedItemID)
	C_LONGINT:C283(AA_l_CurrentSelectedProperty; WS_l_CurrentItemROW)
	C_TEXT:C284($_t_oldMethodName; AA_t_SelectedProperty; WS_t_selectedListItemvalue)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [X_LISTS]Display_list_Dialogue.oLBlistItems"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		$_l_Row:=Self:C308->
		$_l_ItemID:=AA_al_ListItemIDs{$_l_Row}
		
		
		If (AA_at_ListItems{Size of array:C274(AA_at_ListItems)}#"")
			If (AA_al_ListItemIDs{Size of array:C274(AA_al_ListItemIDs)}=0)
				Gen_Confirm("Save "+AA_at_ListItems{Size of array:C274(AA_at_ListItems)}+"?"; "Save"; "Clear")
				If (OK=1)
					$_l_PropertyTypeRow:=Find in array:C230(AA_at_ListItems; AA_at_ListItems{Size of array:C274(AA_at_ListItems)})
					If ($_l_PropertyTypeRow<Size of array:C274(AA_at_ListItems))
						Gen_Alert(AA_at_ListItems{Size of array:C274(AA_at_ListItems)}+" Already exists. It cannot be added twice.")
						AA_at_ListItems{Size of array:C274(AA_at_ListItems)}:=""
					Else 
						AA_al_ListItemIDs{Size of array:C274(AA_at_ListItems)}:=-Size of array:C274(AA_al_ListItemIDs)
						WS_bo_listEdited:=True:C214
					End if 
				Else 
					AA_at_ListItems{Size of array:C274(AA_at_ListItems)}:=""
				End if 
			End if 
		End if 
		
		
		If ($_l_ItemID>0)
			AA_l_CurrentItemID:=$_l_ItemID
			WS_l_CurrentItemROW:=$_l_Row
			If (False:C215)
				ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; 0)
				ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; 0)
				ARRAY TEXT:C222(AA_at_ListItemvalue; 0)
				ARRAY LONGINT:C221(AA_al_ListItemvalue; 0)
				AA_t_SelectedProperty:=""
				WS_t_selectedListItemvalue:=""
				ARRAY TEXT:C222(AA_at_PropertyValues; 0)  //these get populated when you select  an item
				ARRAY LONGINT:C221(WS_al_PropertyValues; 0)  //these get populated when you select  and item
				//now set up the propertytypes
				$_l_PropertyTypeCount:=Size of array:C274(AA_at_ListPropertyTypes)
				ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; $_l_PropertyTypeCount)
				ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; $_l_PropertyTypeCount)
				ARRAY TEXT:C222(AA_at_ListItemvalue; $_l_PropertyTypeCount)
				ARRAY LONGINT:C221(AA_al_ListItemvalue; $_l_PropertyTypeCount)
				$_l_Row:=Find in array:C230(AA_al_ListItemIDs; AA_l_CurrentItemID)
				ARRAY TEXT:C222($_at_DeletePreferences; 0)
				ARRAY LONGINT:C221($_al_DeletePreferenceID; 0)
				For ($_l_Index; 1; Size of array:C274(AA_at_ListItemPropertyTypes))
					If (AA_al_ListPropTypesID{$_l_Index}>0)
						AA_al_ListItemPropertyTypes{$_l_Index}:=AA_al_ListPropTypesID{$_l_Index}
						AA_at_ListItemPropertyTypes{$_l_Index}:=AA_at_ListPropertyTypes{$_l_Index}
						//do we have a property set
						
						$_l_PropertyIDRow:=Find in array:C230(AA_al_ListPropertyIDs; AA_al_ListPropTypesID{$_l_Index})
						If ($_l_PropertyIDRow>0)
							$_l_SubListID:=AA_al_ListPropertySublists{$_l_PropertyIDRow}
							//look in the 2 d row for this attribute
							$_l_SubListColumn:=Find in array:C230(AA_al_2DItemAttributesLIstID{$_l_Row}; $_l_SubListID)
							If ($_l_SubListColumn<0)
								//no value set=thats ok
								AA_at_ListItemvalue{$_l_Index}:="Not Set"
							Else 
								AA_al_ListItemvalue{$_l_Index}:=AA_al_2DItemAttributes{$_l_Row}{$_l_SubListColumn}
								AA_at_ListItemvalue{$_l_Index}:=AA_at_2DItemAttributes{$_l_Row}{$_l_SubListColumn}
							End if 
						Else 
							//there is a problem
							//             ALERT("programming error")
							Gen_Alert("programming error.")
						End if 
					Else 
						APPEND TO ARRAY:C911($_at_DeletePreferences; AA_at_ListPropertyTypes{$_l_Index})
						APPEND TO ARRAY:C911($_al_DeletePreferenceID; AA_al_ListPropTypesID{$_l_Index})
						
						//there is a problem
						//           ALERT("programming error")
						Gen_Alert("programming error.")
					End if 
				End for 
				If (Size of array:C274($_at_DeletePreferences)>0)
					For ($_l_Index; 1; Size of array:C274($_at_DeletePreferences))
						$_l_PropertyTypeRow:=Find in array:C230(AA_at_ListPropertyTypes; $_at_DeletePreferences{$_l_Index})
						If ($_l_PropertyTypeRow>0)
							DELETE FROM ARRAY:C228(AA_at_ListPropertyTypes; $_l_PropertyTypeRow)
							DELETE FROM ARRAY:C228(AA_al_ListPropTypesID; $_l_PropertyTypeRow)
						End if 
						
					End for 
				End if 
			End if 
		End if 
		
		
	: ($_l_Event=On Data Change:K2:15)
		$_l_Row:=Self:C308->
		WS_bo_listEdited:=True:C214
		
		
End case 
ERR_MethodTrackerReturn("OBJ [X_LISTS].Display_list_Dialogue.oLBlistItems"; $_t_oldMethodName)
