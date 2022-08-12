//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LoadListItemtoManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/09/2012 12:32
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
	//ARRAY LONGINT(AA_al_SubItemAttributes;0)
	//ARRAY LONGINT(AA_al_SubItemAttributesListID;0)
	//ARRAY LONGINT(AA_al_SubItemIndex;0)
	//ARRAY LONGINT(WS_al_PropertyValues;0)
	//ARRAY TEXT(AA_at_2DItemAttributes;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItemvalue;0)
	//ARRAY TEXT(AA_at_ListPropertyTypes;0)
	//ARRAY TEXT(AA_at_PropertyValues;0)
	//ARRAY TEXT(AA_at_SubItemAttributes;0)
	C_LONGINT:C283($_l_AttrbutesListRow; $_l_Index; $_l_ListPropertiesCount; $_l_PropertyTypeRow; $_l_Row; $_l_SUbItemRow; $_l_SublistID; $1; AA_l_CurrentSelectedItemID; AA_l_CurrentSelectedProperty)
	C_TEXT:C284($_t_oldMethodName; AA_t_SelectedProperty; WS_t_selectedListItemvalue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LoadListItemtoManager")
//this method loads a list item
//if the current list is the list properties
//then there is only one thing to load
//`that is the word CODE
If (Count parameters:C259>=1)
	AA_l_CurrentSelectedProperty:=0
	AA_l_CurrentSelectedItemID:=$1
	ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; 0)
	ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; 0)
	ARRAY TEXT:C222(AA_at_ListItemvalue; 0)
	ARRAY LONGINT:C221(AA_al_ListItemvalue; 0)
	AA_t_SelectedProperty:=""
	WS_t_selectedListItemvalue:=""
	ARRAY TEXT:C222(AA_at_PropertyValues; 0)  //these get populated when you select  and item
	ARRAY LONGINT:C221(WS_al_PropertyValues; 0)  //these get populated when you select  and item
	//now set up the propertytypes
	$_l_ListPropertiesCount:=Size of array:C274(AA_at_ListPropertyTypes)  //was WS_S55_aListPropTypes AA_aS55_ListPropertyTypes
	
	//get the values from.....
	
	//AA_al_ListPropTypesID{$_l_Index}:=$propertyID
	//AA_at_ListPropertyTypes{$_l_Index}:=AA_at_ListProperties{$ref}
	AA_l_CurrentSelectedItemID:=0
	If (Count parameters:C259>=1)
		AA_l_CurrentSelectedItemID:=$1
		If (AA_l_CurrentSelectedItemID#0)
			$_l_SUbItemRow:=Find in array:C230(AA_al_SubItemIndex; AA_l_CurrentSelectedItemID)
			ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; $_l_ListPropertiesCount)
			ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; $_l_ListPropertiesCount)
			ARRAY TEXT:C222(AA_at_ListItemvalue; $_l_ListPropertiesCount)
			ARRAY LONGINT:C221(AA_al_ListItemvalue; $_l_ListPropertiesCount)
			AA_at_ListItemPropertyTypes:=0
			AA_al_ListItemPropertyTypes:=0
			AA_at_ListItemvalue:=0
			AA_al_ListItemvalue:=0
			If ($_l_SUbItemRow<0)
				//this is a parent item
				$_l_Row:=Find in array:C230(AA_al_ListItemIDs; AA_l_CurrentSelectedItemID)
				For ($_l_Index; 1; Size of array:C274(AA_at_ListItemPropertyTypes))
					AA_al_ListItemPropertyTypes{$_l_Index}:=AA_al_ListPropTypesID{$_l_Index}
					AA_at_ListItemPropertyTypes{$_l_Index}:=AA_at_ListPropertyTypes{$_l_Index}
					//do we have a property set
					If (AA_al_ListPropTypesID{$_l_Index}>0)
						$_l_PropertyTypeRow:=Find in array:C230(AA_al_ListPropertyIDs; AA_al_ListPropTypesID{$_l_Index})
						If ($_l_PropertyTypeRow>0)
							$_l_SublistID:=AA_al_ListPropertySublists{$_l_PropertyTypeRow}
							//look in the 2 d row for this attribute
							If ($_l_Row>0)
								$_l_AttrbutesListRow:=Find in array:C230(AA_al_2DItemAttributesLIstID{$_l_Row}; $_l_SublistID)
								If ($_l_AttrbutesListRow<0)
									//no value set=thats ok
									AA_at_ListItemvalue{$_l_Index}:="Not Set"
								Else 
									AA_al_ListItemvalue{$_l_Index}:=AA_al_2DItemAttributes{$_l_Row}{$_l_AttrbutesListRow}
									AA_at_ListItemvalue{$_l_Index}:=AA_at_2DItemAttributes{$_l_Row}{$_l_AttrbutesListRow}
								End if 
							Else 
								AA_at_ListItemvalue{$_l_Index}:="Not Set"
							End if 
						Else 
							//there is a problem
							//          ALERT("programming error")
							Gen_Alert("programming error")
						End if 
					Else 
						//there is a problem
						//        ALERT("programming error")
						Gen_Alert("programming error")
					End if 
				End for 
				
				
			Else 
				//this is a sublist item
				
				$_l_Row:=$_l_SUbItemRow
				For ($_l_Index; 1; Size of array:C274(AA_at_ListItemPropertyTypes))
					AA_al_ListItemPropertyTypes{$_l_Index}:=AA_al_ListPropTypesID{$_l_Index}
					AA_at_ListItemPropertyTypes{$_l_Index}:=AA_at_ListPropertyTypes{$_l_Index}
					//do we have a property set
					$_l_PropertyTypeRow:=Find in array:C230(AA_al_ListPropertyIDs; AA_al_ListPropTypesID{$_l_Index})
					If ($_l_PropertyTypeRow>0)
						$_l_SublistID:=AA_al_ListPropertySublists{$_l_PropertyTypeRow}
						//look in the 2 d row for this attribute
						$_l_AttrbutesListRow:=Find in array:C230(AA_al_SubItemAttributesListID{$_l_Row}; $_l_SublistID)
						If ($_l_AttrbutesListRow<0)
							//no value set=thats ok
							AA_at_ListItemvalue{$_l_Index}:="Not Set"
						Else 
							AA_al_ListItemvalue{$_l_Index}:=AA_al_SubItemAttributes{$_l_Row}{$_l_AttrbutesListRow}
							AA_at_ListItemvalue{$_l_Index}:=AA_at_SubItemAttributes{$_l_Row}{$_l_AttrbutesListRow}
						End if 
					Else 
						//there is a problem
						//        ALERT("programming error")
						Gen_Alert("programming error")
					End if 
				End for 
				
			End if 
		Else 
			//load empty item
			
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("AA_LoadListItemtoManager"; $_t_oldMethodName)
