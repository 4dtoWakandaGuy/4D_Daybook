//%attributes = {}
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AttributeItemID; 0)
	ARRAY LONGINT:C221($_al_AttributeListID; 0)
	ARRAY LONGINT:C221($_al_ParentListIDs; 0)
	ARRAY LONGINT:C221($_al_TempListIDS; 0)
	//ARRAY LONGINT(AA_al_2DItemAttributes;0;0)
	//ARRAY LONGINT(AA_al_2DItemAttributesLIstID;0;0)
	//ARRAY LONGINT(AA_al_aPropertyNum;0)
	//ARRAY LONGINT(AA_al_ItemIDsModified;0)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY LONGINT(AA_al_ListItemDeletion;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_ListItemvalue;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_ListPropertyNum;0;0)
	//ARRAY LONGINT(AA_al_ListPropertySublists;0)
	//ARRAY LONGINT(AA_al_ListPropTypesID;0)
	//ARRAY LONGINT(AA_al_RelatedFieldsID;0)
	//ARRAY LONGINT(AA_al_RelatedFieldsTable;0)
	//ARRAY LONGINT(AA_al_SubItemAttributes;0;0)
	//ARRAY LONGINT(AA_al_SubItemAttributesListID;0;0)
	//ARRAY LONGINT(AA_al_SubItemIndex;0)
	//ARRAY LONGINT(AA_al_SubItemListID;0)
	//ARRAY LONGINT(AA_al_SubListCRHLID;0)
	//ARRAY LONGINT(AA_al_SublistCRID;0)
	//ARRAY LONGINT(AA_al_SubListItemDeletion;0)
	//ARRAY LONGINT(AA_al_SubListItemIDs;0)
	//ARRAY LONGINT(AA_al_SubListPropertyNum;0;0)
	//ARRAY LONGINT(WS_al_PropertyValues;0)
	ARRAY TEXT:C222($_at_AttributeItemNM; 0)
	ARRAY TEXT:C222($_at_AttributeListNM; 0)
	ARRAY TEXT:C222($_at_RelatedVariableName; 0)
	ARRAY TEXT:C222($_at_TempList; 0)
	//ARRAY TEXT(AA_at_2DItemAttributes;0;0)
	//ARRAY TEXT(AA_at_2DItemAttributesLIstNM;0;0)
	//ARRAY TEXT(AA_at_2DPropertyListProperties;0;0)
	//ARRAY TEXT(AA_at_2DSubListProperties;0;0)
	//ARRAY TEXT(AA_at_APropertyNames;0)
	//ARRAY TEXT(AA_at_aPropertyValue;0)
	//ARRAY TEXT(AA_at_LIPropValues;0)
	//ARRAY TEXT(AA_at_ListItemProperties;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_ListItemvalue;0)
	//ARRAY TEXT(AA_at_ListProperties;0;0)
	//ARRAY TEXT(AA_at_ListPropertySTR;0;0)
	//ARRAY TEXT(AA_at_ListPropertyTypes;0)
	//ARRAY TEXT(AA_at_PropertiesListProperties;0)
	//ARRAY TEXT(AA_at_PropertyValues;0)
	//ARRAY TEXT(AA_at_RelatedFieldNames;0)
	//ARRAY TEXT(AA_at_SubItemAttributes;0;0)
	//ARRAY TEXT(AA_at_SubItemAttributesLIst;0;0)
	//ARRAY TEXT(AA_at_SubItemNames;0)
	//ARRAY TEXT(AA_at_SubListItemNames;0)
	//ARRAY TEXT(AA_at_SubListItemProperties;0)
	//ARRAY TEXT(AA_at_SubListPropertySTR;0;0)
	C_BOOLEAN:C305($3; AA_Bo_ListtoUpdate; AA_bo_PropertiesLoaded)
	C_LONGINT:C283($_l_Access; $_l_AccessPropertyPosition; $_l_arraySize; $_l_CountProperties; $_l_CurrentIndex; $_l_Element; $_l_IgnoreProperty; $_l_Index; $_l_Index2; $_l_Index3; $_l_ParentPosition)
	C_LONGINT:C283($_l_PropertiesCount; $_l_PropertiesIndex; $_l_PropertyID; $_l_PropertyIndex; $_l_PropertyItemID; $_l_PropertyItemPosition; $_l_PropertyListID; $_l_PropertyNamePosition; $_l_PropertyPosition; $_l_PropertySize; $_l_PropertySublistPosition)
	C_LONGINT:C283($_l_SublistIDPosition; $_l_SublistNumber; $_l_SublistPropertyPosition; $1; AA_HL_ListItems; AA_l_CurrentListiD; AA_l_CurrentSelectedItemID; AA_l_CurrentSelectedProperty; AA_l_PropertyListID; BModProperties; CB_LP1)
	C_LONGINT:C283(CB_LP2; CB_LP3; CB_LP4; STK_but_AddSub)
	C_OBJECT:C1216($_obj_List; $_obj_ListProperties; $_obj_Lists)
	C_TEXT:C284($_t_oldMethodName; $_t_Properties; $_t_PropertyName; $2; AA_t_CurrentListItem; AA_t_listName; AA_t_NewListItem; AA_t_SelectedProperty)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LoadListtoManager")
//this method will load a list properties anDWS_t_aListItems
// list items to the list manager screen
//First Clear any sublists

//ALERT("!00/00/00!-1")
AA_l_CurrentSelectedProperty:=0
AA_l_CurrentSelectedItemID:=0
AA_Bo_ListtoUpdate:=False:C215
ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; 0)
ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; 0)
ARRAY TEXT:C222(AA_at_ListItemvalue; 0)
AA_t_CurrentListItem:=""
ARRAY LONGINT:C221(AA_al_ListItemvalue; 0)
AA_t_SelectedProperty:=""
ARRAY TEXT:C222(AA_at_PropertyValues; 0)  //these get populated when you select  and item
ARRAY LONGINT:C221(WS_al_PropertyValues; 0)  //these get populated when you select  and item
ARRAY TEXT:C222(AA_at_ListItems; 0)
ARRAY TEXT:C222(AA_at_ListItemProperties; 0)
ARRAY LONGINT:C221(AA_al_ListItemIDs; 0)
ARRAY TEXT:C222(AA_at_ListPropertyTypes; 0)
ARRAY LONGINT:C221(AA_al_ItemIDsModified; 0)
ARRAY LONGINT:C221(AA_al_ListPropTypesID; 0)
ARRAY TEXT:C222(AA_at_RelatedFieldNames; 0)
ARRAY LONGINT:C221(AA_al_RelatedFieldsTable; 0)
ARRAY LONGINT:C221(AA_al_RelatedFieldsID; 0)
ARRAY LONGINT:C221(AA_al_SublistCRID; 0)
ARRAY LONGINT:C221(AA_al_SubListCRHLID; 0)
//if the items are not heirarchical just load them else also append the sublists
ARRAY TEXT:C222(AA_at_SubListItemNames; 0)
ARRAY LONGINT:C221(AA_al_SubListItemIDs; 0)
ARRAY TEXT:C222(AA_at_SubListItemProperties; 0)
//we need to find if there is a a sublist for each item and append the sublist
ARRAY LONGINT:C221(AA_al_2DItemAttributesLIstID; 0; 0)
ARRAY LONGINT:C221(AA_al_2DItemAttributes; 0; 0)
ARRAY TEXT:C222(AA_at_2DItemAttributesLIstNM; 0; 0)
ARRAY TEXT:C222(AA_at_2DItemAttributes; 0; 0)
ARRAY LONGINT:C221(AA_al_SubItemAttributesListID; 0; 0)
ARRAY LONGINT:C221(AA_al_SubItemAttributes; 0; 0)
ARRAY TEXT:C222(AA_at_SubItemAttributesLIst; 0; 0)
ARRAY TEXT:C222(AA_at_SubItemAttributes; 0; 0)
ARRAY LONGINT:C221(AA_al_SubItemIndex; 0)
ARRAY LONGINT:C221(AA_al_SubItemListID; 0)
ARRAY TEXT:C222(AA_at_SubItemNames; 0)
If (Is a list:C621(AA_HL_ListItems))
	CLEAR LIST:C377(AA_HL_ListItems; *)
End if 
//---------
For ($_l_Index; 1; Size of array:C274(AA_al_SublistCRID))  //F1²
	If (AA_al_SubListCRHLID{$_l_Index}>0)  //i2²
		If (Is a list:C621(AA_al_SubListCRHLID{$_l_Index}))
			CLEAR LIST:C377(AA_al_SubListCRHLID{$_l_Index})
		End if 
	End if   //end i2
End for   //End F1
//----------
ARRAY LONGINT:C221(AA_al_SublistCRID; 0)
ARRAY LONGINT:C221(AA_al_SubListCRHLID; 0)
ARRAY LONGINT:C221(AA_al_SubListItemDeletion; 0)
ARRAY LONGINT:C221(AA_al_ListItemDeletion; 0)
//TRACE
If (Count parameters:C259>=2)  //i3²
	If ($1>0)
		$_l_ParentPosition:=Find in array:C230(AA_al_ListIDS; $1)
	Else 
		$_l_ParentPosition:=0
	End if 
	
	//ALERT("!00/00/00!-3")
	AA_l_CurrentListiD:=$1
	CB_LP1:=0
	CB_LP2:=0
	CB_LP3:=0
	CB_LP4:=0
	
	If ($_l_ParentPosition>0)  //it is in  the arrays`i4²
		$_obj_Lists:=ds:C1482.X_LISTS.query("x_ID =:1"; AA_l_CurrentListiD)
		If ($_obj_Lists.length>0)
			$_obj_List:=$_obj_Lists[0]
			$_obj_ListProperties:=New object:C1471
			$_obj_ListProperties:=$_obj_List.x_ListValues
			
			//QUERY([X_LISTS]; [X_LISTS]x_ID=$1)
			ARRAY TEXT:C222(AA_at_APropertyNames; 0)
			ARRAY LONGINT:C221(AA_al_aPropertyNum; 0)
			ARRAY TEXT:C222(AA_at_aPropertyValue; 0)
			AA_GetListProperties($_obj_ListProperties; ->AA_at_APropertyNames; ->AA_al_aPropertyNum; ->AA_at_aPropertyValue)
			AA_t_listName:=$2  //get the access rights
			$_l_AccessPropertyPosition:=Find in array:C230(AA_at_APropertyNames; "ACCESS")
			If ($_l_AccessPropertyPosition>0)
				$_l_Access:=AA_al_aPropertyNum{$_l_AccessPropertyPosition}
			Else 
				$_l_Access:=0
			End if 
			//$_l_Access:=AA_GetListPropertyNUM ($1;"Access:")
			//$_l_Access:=◊WS_l_aAccessRights{$_l_ParentPosition}
			CB_LP1:=Num:C11(($_l_Access ?? 1))
			//````
			If (CB_LP1=0)  //5²
				CB_LP2:=Num:C11(($_l_Access ?? 2))
				//`````````
				If (CB_LP2=0)  //6²
					CB_LP3:=Num:C11(($_l_Access ?? 3))
					//``````````
					If (CB_LP3=0)  //7²
						CB_LP1:=1
					End if   //end i7
					//```````````
				End if   //end i6
				//``````````
			End if   //end i5
			//``````````
			CB_LP4:=Num:C11($_l_Access ?? 4)
			OBJECT SET VISIBLE:C603(STK_but_AddSub; (CB_LP4=1))
			//ARRAY STRING(55;AA_at_ListPropertyTypes;Size of array(◊WS_l_aPropertyTypes{$_l_ParentPosition}))
			//ARRAY LONGINT(AA_al_ListPropTypesID;Size of array(◊WS_l_aPropertyTypes{$_l_ParentPosition}))
			ARRAY TEXT:C222(AA_at_RelatedFieldNames; 0)
			ARRAY LONGINT:C221(AA_al_RelatedFieldsTable; 0)
			ARRAY LONGINT:C221(AA_al_RelatedFieldsID; 0)
			//get the property types for this list
			If (Not:C34(AA_bo_PropertiesLoaded))
				ARRAY TEXT:C222(AA_at_ListProperties; 0)
				ARRAY LONGINT:C221(AA_al_ListPropertyIDs; 0)
				AA_l_PropertyListID:=AA_LoadListByName("List Properties"; ->AA_at_ListProperties; ->AA_al_ListPropertyIDs; False:C215; ->AA_at_PropertiesListProperties)
				AA_bo_PropertiesLoaded:=True:C214
			End if 
			ARRAY TEXT:C222(AA_at_ListPropertyTypes; 0)
			ARRAY LONGINT:C221(AA_al_ListPropTypesID; 0)
			
			//````````
			For ($_l_Index3; 1; Size of array:C274(AA_at_APropertyNames))  //F8²
				$_l_PropertyID:=AA_al_aPropertyNum{$_l_Index3}
				//`````
				If ($_l_PropertyID>0)
					$_l_PropertyPosition:=Find in array:C230(AA_al_ListPropertyIDs; $_l_PropertyID)
					If ($_l_PropertyPosition>0)  //i9²
						APPEND TO ARRAY:C911(AA_al_ListPropTypesID; $_l_PropertyID)
						APPEND TO ARRAY:C911(AA_at_ListPropertyTypes; AA_at_ListProperties{$_l_PropertyPosition})
					End if   //endi9
				End if 
				//````
			End for   //end F8
			//`````
			ARRAY TEXT:C222($_at_RelatedVariableName; 0)
			QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_ListID:2=AA_l_CurrentListiD)
			SELECTION TO ARRAY:C260([x_ListUsage:112]x_TableID:3; AA_al_RelatedFieldsTable; [x_ListUsage:112]x_FieldID:4; AA_al_RelatedFieldsID; [x_ListUsage:112]x_VariableName:5; $_at_RelatedVariableName)
			
			ARRAY TEXT:C222(AA_at_RelatedFieldNames; Size of array:C274(AA_al_RelatedFieldsTable))
			//````
			For ($_l_Index3; 1; Size of array:C274(AA_al_RelatedFieldsTable))  //F10²
				If (AA_al_RelatedFieldsTable{$_l_Index3}>0)
					AA_at_RelatedFieldNames{$_l_Index3}:=Table name:C256(AA_al_RelatedFieldsTable{$_l_Index3})+":"+Field name:C257(AA_al_RelatedFieldsTable{$_l_Index3}; AA_al_RelatedFieldsID{$_l_Index3})
				Else 
					AA_at_RelatedFieldNames{$_l_Index3}:="Variable: "+$_at_RelatedVariableName{$_l_Index3}
				End if 
				
			End for   //endF10
			//``````
			ARRAY TEXT:C222(AA_at_ListItemProperties; 0)
			ARRAY LONGINT:C221(AA_al_ListItemIDs; 0)
			ARRAY TEXT:C222(AA_at_2DPropertyListProperties; 0; 0)
			ARRAY LONGINT:C221(AA_al_ListPropertyNum; 0; 0)
			ARRAY TEXT:C222(AA_at_ListPropertySTR; 0; 0)
			ARRAY LONGINT:C221($_al_ParentListIDs; 0)
			
			If ($1>0)
				INSERT IN ARRAY:C227($_al_ParentListIDs; (Size of array:C274($_al_ParentListIDs)+1); 1)
				$_al_ParentListIDs{Size of array:C274($_al_ParentListIDs)}:=$1
				
				AA_LoadListbyID($1; ->AA_at_ListItems; ->AA_al_ListItemIDs; False:C215; ->AA_at_ListItemProperties; ->AA_at_2DPropertyListProperties; ->AA_al_ListPropertyNum; ->AA_at_ListPropertySTR)
			Else 
				$_l_PropertyListID:=AA_LoadListByName($2; ->AA_at_ListItems; ->AA_al_ListItemIDs; False:C215; ->AA_at_ListItemProperties; ->AA_at_2DPropertyListProperties; ->AA_al_ListPropertyNum; ->AA_at_ListPropertySTR)
				INSERT IN ARRAY:C227($_al_ParentListIDs; Size of array:C274($_al_ParentListIDs)+1; 1)
				$_al_ParentListIDs{Size of array:C274($_al_ParentListIDs)}:=$_l_PropertyListID
				
			End if 
			
			If (Count parameters:C259>=3)
				If ($3)
					SORT ARRAY:C229(AA_at_ListItems; AA_al_ListItemIDs; AA_at_ListItemProperties; AA_at_2DPropertyListProperties; AA_al_ListPropertyNum; AA_at_ListPropertySTR)
					
				End if 
				
			End if 
			
			
			AA_HL_ListItems:=New list:C375
			ARRAY LONGINT:C221(AA_al_SublistCRID; Size of array:C274(AA_al_ListItemIDs))
			ARRAY LONGINT:C221(AA_al_SubListCRHLID; Size of array:C274(AA_al_ListItemIDs))
			//if the items are not heirarchical just load them else also append the sublists
			ARRAY TEXT:C222(AA_at_SubListItemNames; 0)
			ARRAY LONGINT:C221(AA_al_SubListItemIDs; 0)
			ARRAY TEXT:C222(AA_at_SubListItemProperties; 0)
			
			
			//we need to find if there is a a sublist for each item and append the sublist
			ARRAY LONGINT:C221(AA_al_2DItemAttributesLIstID; 0; 0)
			ARRAY LONGINT:C221(AA_al_2DItemAttributes; 0; 0)
			ARRAY TEXT:C222(AA_at_2DItemAttributesLIstNM; 0; 0)
			ARRAY TEXT:C222(AA_at_2DItemAttributes; 0; 0)
			ARRAY LONGINT:C221(AA_al_2DItemAttributesLIstID; Size of array:C274(AA_al_ListItemIDs); 0)
			ARRAY LONGINT:C221(AA_al_2DItemAttributes; Size of array:C274(AA_al_ListItemIDs); 0)
			ARRAY TEXT:C222(AA_at_2DItemAttributesLIstNM; Size of array:C274(AA_al_ListItemIDs); 0)
			ARRAY TEXT:C222(AA_at_2DItemAttributes; Size of array:C274(AA_al_ListItemIDs); 0)
			ARRAY LONGINT:C221(AA_al_SubItemAttributesListID; 0; 0)
			ARRAY LONGINT:C221(AA_al_SubItemAttributes; 0; 0)
			ARRAY TEXT:C222(AA_at_SubItemAttributesLIst; 0; 0)
			ARRAY TEXT:C222(AA_at_SubItemAttributes; 0; 0)
			ARRAY LONGINT:C221(AA_al_SubItemIndex; 0)
			ARRAY LONGINT:C221(AA_al_SubItemListID; 0)
			ARRAY TEXT:C222(AA_at_SubItemNames; 0)
			
			
			
			For ($_l_Index; 1; Size of array:C274(AA_al_ListItemIDs))  //F12
				$_l_ParentPosition:=Find in array:C230($_al_ParentListIDs; AA_al_ListItemIDs{$_l_Index})
				If ($_l_ParentPosition<0)
					INSERT IN ARRAY:C227($_al_ParentListIDs; Size of array:C274($_al_ParentListIDs)+1; 1)
					$_al_ParentListIDs{Size of array:C274($_al_ParentListIDs)}:=AA_al_ListItemIDs{$_l_Index}
				End if 
				
				$_l_CountProperties:=Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index})
				If ($_l_CountProperties=0)  //="")  `I13²
					APPEND TO LIST:C376(AA_HL_ListItems; AA_at_ListItems{$_l_Index}; AA_al_ListItemIDs{$_l_Index})
				Else   //i13
					Case of   //C11²
						: (CB_LP4=1)  //C11
							$_l_SublistPropertyPosition:=Find in array:C230(AA_at_2DPropertyListProperties{$_l_Index}; "Sublist")
							
							$_l_CurrentIndex:=0
							If ($_l_SublistPropertyPosition>0)  //i14²
								
								$_l_SublistNumber:=AA_al_ListPropertyNum{$_l_Index}{$_l_SublistPropertyPosition}
								//now we load the sublist
								$_l_ParentPosition:=Find in array:C230($_al_ParentListIDs; $_l_SublistNumber)
								//This checks we don't have a recursion
								If ($_l_ParentPosition>0)
									$_l_SublistNumber:=0
								End if 
								
								//ONE ROW PER ITEM
								//````````
								If ($_l_SublistNumber>0)  //i16²
									ARRAY TEXT:C222(AA_at_2DSubListProperties; 0; 0)
									ARRAY LONGINT:C221(AA_al_SubListPropertyNum; 0; 0)
									ARRAY TEXT:C222(AA_at_SubListPropertySTR; 0; 0)
									
									AA_LoadListbyID($_l_SublistNumber; ->AA_at_SubListItemNames; ->AA_al_SubListItemIDs; False:C215; ->AA_at_SubListItemProperties; ->AA_at_2DSubListProperties; ->AA_al_SubListPropertyNum; ->AA_at_SubListPropertySTR)
									If (Count parameters:C259>=3)
										If ($3)
											SORT ARRAY:C229(AA_at_SubListItemNames; AA_al_SubListItemIDs; AA_at_SubListItemProperties; AA_at_2DSubListProperties; AA_al_SubListPropertyNum; AA_at_SubListPropertySTR)
											
										End if 
										
									End if 
									$_l_CurrentIndex:=$_l_Index
									AA_al_SublistCRID{$_l_CurrentIndex}:=$_l_SublistNumber
									AA_al_SubListCRHLID{$_l_CurrentIndex}:=New list:C375
									$_l_arraySize:=Size of array:C274(AA_al_SubItemAttributesListID)
									INSERT IN ARRAY:C227(AA_al_SubItemAttributesListID; Size of array:C274(AA_al_SubItemAttributesListID)+1; Size of array:C274(AA_at_SubListItemNames))
									INSERT IN ARRAY:C227(AA_al_SubItemAttributes; Size of array:C274(AA_al_SubItemAttributesListID)+1; Size of array:C274(AA_at_SubListItemNames))
									INSERT IN ARRAY:C227(AA_at_SubItemAttributesLIst; Size of array:C274(AA_at_2DItemAttributesLIstNM)+1; Size of array:C274(AA_at_SubListItemNames))
									INSERT IN ARRAY:C227(AA_at_SubItemAttributes; Size of array:C274(AA_al_SubItemAttributesListID)+1; Size of array:C274(AA_at_SubListItemNames))
									INSERT IN ARRAY:C227(AA_al_SubItemIndex; Size of array:C274(AA_al_SubItemIndex)+1; Size of array:C274(AA_at_SubListItemNames))
									INSERT IN ARRAY:C227(AA_al_SubItemListID; Size of array:C274(AA_al_SubItemListID)+1; Size of array:C274(AA_at_SubListItemNames))
									INSERT IN ARRAY:C227(AA_at_SubItemNames; Size of array:C274(AA_at_SubItemNames)+1; Size of array:C274(AA_at_SubListItemNames))
									ARRAY LONGINT:C221($_al_AttributeListID; 0)
									ARRAY LONGINT:C221($_al_AttributeItemID; 0)
									ARRAY TEXT:C222($_at_AttributeListNM; 0)
									ARRAY TEXT:C222($_at_AttributeItemNM; 0)
									//`````
									For ($_l_Index3; 1; Size of array:C274(AA_at_SubListItemNames))  //F18²
										AA_al_SubItemIndex{$_l_Index3+$_l_arraySize}:=AA_al_SubListItemIDs{$_l_Index3}
										AA_al_SubItemListID{$_l_Index3+$_l_arraySize}:=$_l_SublistNumber
										AA_at_SubItemNames{$_l_Index3+$_l_arraySize}:=AA_at_SubListItemNames{$_l_Index3}
										APPEND TO LIST:C376(AA_al_SubListCRHLID{$_l_CurrentIndex}; AA_at_SubListItemNames{$_l_Index3}; AA_al_SubListItemIDs{$_l_Index3})
										// now extract the properties for that item
										ARRAY LONGINT:C221($_al_AttributeListID; Size of array:C274(AA_at_2DPropertyListProperties))
										ARRAY LONGINT:C221($_al_AttributeItemID; Size of array:C274(AA_at_2DPropertyListProperties))
										ARRAY TEXT:C222($_at_AttributeListNM; Size of array:C274(AA_at_2DPropertyListProperties))
										ARRAY TEXT:C222($_at_AttributeItemNM; Size of array:C274(AA_at_2DPropertyListProperties))
										$_l_Element:=0
										ARRAY TEXT:C222($_at_TempList; 0)
										ARRAY LONGINT:C221($_al_TempListIDS; 0)
										//now get the item properties and put them into the
										$_l_PropertiesCount:=Size of array:C274(AA_at_2DSubListProperties{$_l_Index3})
										If ($_l_PropertiesCount>0)  //i19²
											//the sublist item has properties
											//properties are saved in the following way
											//List ID;Item ID
											//first we look up the name of property-from
											//`````````
											For ($_l_PropertiesIndex; 1; Size of array:C274(AA_at_2DSubListProperties{$_l_Index3}))
												//Repeat   `R20²
												//>AA_at_2DSubListProperties;->AA_al_SubListPropertyNum;->AA_at_SubListPropertySTR
												$_t_Properties:=AA_at_2DSubListProperties{$_l_Index3}{$_l_PropertiesIndex}
												$_l_PropertyListID:=AA_al_SubListPropertyNum{$_l_Index3}{$_l_PropertiesIndex}
												$_l_PropertyItemID:=Num:C11(AA_at_SubListPropertySTR{$_l_Index3}{$_l_PropertiesIndex})
												$_l_PropertyNamePosition:=Position:C15(";"; $_t_Properties)  ///$_t_Properties is not set
												
												
												//this should be >0
												If ($_l_PropertyItemID>0)  //i22²
													$_l_Element:=$_l_Element+1
													$_al_AttributeListID{$_l_Element}:=$_l_PropertyListID
													$_al_AttributeItemID{$_l_Element}:=$_l_PropertyItemID
													$_at_AttributeListNM{$_l_Element}:=AA_at_ListProperties{$_l_ParentPosition}
													ARRAY TEXT:C222($_at_TempList; 0)
													ARRAY LONGINT:C221($_al_TempListIDS; 0)
													AA_LoadListbyID($_l_PropertyListID; ->$_at_TempList; ->$_al_TempListIDS; False:C215)
													$_l_PropertyPosition:=Find in array:C230($_al_TempListIDS; $_l_PropertyItemID)
													//we can now use the property name
													If ($_l_PropertyPosition>0)  //i23²
														//it better be!!
														$_at_AttributeItemNM{$_l_Element}:=$_at_TempList{$_l_PropertyPosition}
													End if   //end i23²
												End if   //end i22²
												//end i21
												//Until ($_t_Properties="")  `end R20
											End for 
											//````
											//reset the size of the local arrays
											ARRAY LONGINT:C221($_al_AttributeListID; $_l_Element)
											ARRAY LONGINT:C221($_al_AttributeItemID; $_l_Element)
											ARRAY TEXT:C222($_at_AttributeListNM; $_l_Element)
											ARRAY TEXT:C222($_at_AttributeItemNM; $_l_Element)
											//and size the row of the 2D arrays
											INSERT IN ARRAY:C227(AA_al_SubItemAttributesListID{$_l_Index3+$_l_arraySize}; 1; Size of array:C274($_al_AttributeListID))
											INSERT IN ARRAY:C227(AA_al_SubItemAttributes{$_l_Index3+$_l_arraySize}; 1; Size of array:C274($_al_AttributeListID))
											INSERT IN ARRAY:C227(AA_at_SubItemAttributesLIst{$_l_Index3+$_l_arraySize}; 1; Size of array:C274($_al_AttributeListID))
											INSERT IN ARRAY:C227(AA_at_SubItemAttributes{$_l_Index3+$_l_arraySize}; 1; Size of array:C274($_al_AttributeListID))
											//`
											For ($_l_Index2; 1; Size of array:C274($_al_AttributeListID))  //F24²
												AA_al_SubItemAttributesListID{$_l_Index+$_l_arraySize}{$_l_Index2}:=$_al_AttributeListID{$_l_Index2}
												AA_al_SubItemAttributes{$_l_Index+$_l_arraySize}{$_l_Index2}:=$_al_AttributeItemID{$_l_Index2}
												AA_at_SubItemAttributesLIst{$_l_Index+$_l_arraySize}{$_l_Index2}:=$_at_AttributeListNM{$_l_Index2}
												AA_at_SubItemAttributes{$_l_Index+$_l_arraySize}{$_l_Index2}:=$_at_AttributeItemNM{$_l_Index2}
											End for   //end F24
											//`
											ARRAY LONGINT:C221($_al_AttributeListID; 0)
											ARRAY LONGINT:C221($_al_AttributeItemID; 0)
											ARRAY TEXT:C222($_at_AttributeListNM; 0)
											ARRAY TEXT:C222($_at_AttributeItemNM; 0)
											
											
											
										End if   //end i19
										
									End for   //end F18²
									
									//``
								End if   //end i16  ²
							End if   //end i14    ²
							//get the item attributes
							//this is the same as the way we get them for sub items
							//`````
							ARRAY LONGINT:C221($_al_AttributeListID; 0)
							ARRAY LONGINT:C221($_al_AttributeItemID; 0)
							ARRAY TEXT:C222($_at_AttributeListNM; 0)
							ARRAY TEXT:C222($_at_AttributeItemNM; 0)
							ARRAY LONGINT:C221($_al_AttributeListID; Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index}))
							ARRAY LONGINT:C221($_al_AttributeItemID; Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index}))
							ARRAY TEXT:C222($_at_AttributeListNM; Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index}))
							ARRAY TEXT:C222($_at_AttributeItemNM; Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index}))
							$_l_Element:=0
							ARRAY TEXT:C222($_at_TempList; 0)
							ARRAY LONGINT:C221($_al_TempListIDS; 0)
							//now get the item properties and put them into the
							$_l_PropertySize:=Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index})
							//$_t_Properties:=AA_at_ListItemProperties{$_l_Index}
							If ($_l_PropertySize>0)  //#"")  `i25
								$_l_SublistPropertyPosition:=Find in array:C230(AA_at_2DPropertyListProperties{$_l_Index}; "Sublist")
								If ($_l_SublistPropertyPosition>0)
									$_l_IgnoreProperty:=$_l_SublistPropertyPosition
								Else 
									$_l_IgnoreProperty:=0
								End if 
								
								
								//the list item has properties
								//properties are saved in the following way
								//List ID;Item ID
								//first we look up the name of property-from
								For ($_l_PropertiesIndex; 1; Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index}))
									If ($_l_PropertiesIndex#$_l_IgnoreProperty)
										//Repeat   `R26²
										
										//$_l_PropertyListID:=Num(AA_at_2DPropertyListProperties{$_l_Index}{$_l_PropertiesIndex})
										$_l_PropertyListID:=AA_al_ListPropertyNum{$_l_Index}{$_l_PropertiesIndex}
										$_l_PropertyItemID:=Num:C11(AA_at_ListPropertySTR{$_l_Index}{$_l_PropertiesIndex})
										If ($_l_PropertyItemID>0)  //if 27²
											$_l_SublistIDPosition:=Find in array:C230(AA_al_ListPropertySublists; $_l_PropertyListID)
											//this should be >0
											If ($_l_SublistIDPosition>0)  //i28²
												$_l_Element:=$_l_Element+1
												$_al_AttributeListID{$_l_Element}:=$_l_PropertyListID
												$_al_AttributeItemID{$_l_Element}:=$_l_PropertyItemID
												$_at_AttributeListNM{$_l_Element}:=AA_at_ListProperties{$_l_ParentPosition}
												ARRAY TEXT:C222($_at_TempList; 0)
												ARRAY LONGINT:C221($_al_TempListIDS; 0)
												AA_LoadListbyID($_l_PropertyListID; ->$_at_TempList; ->$_al_TempListIDS; False:C215)
												$_l_PropertyPosition:=Find in array:C230($_al_TempListIDS; $_l_PropertyItemID)
												//we can now use the property name
												If ($_l_PropertyPosition>0)  //i29²
													//it better be!!
													$_at_AttributeItemNM{$_l_Element}:=$_at_TempList{$_l_PropertyPosition}
												End if   //end i29
											End if   //end i28
										Else 
											//TRACE
											
										End if   //end i27
									End if 
									//Until ($_t_Properties="")  `end R26
								End for 
								//reset the size of the local arrays
								ARRAY LONGINT:C221($_al_AttributeListID; $_l_Element)
								ARRAY LONGINT:C221($_al_AttributeItemID; $_l_Element)
								ARRAY TEXT:C222($_at_AttributeListNM; $_l_Element)
								ARRAY TEXT:C222($_at_AttributeItemNM; $_l_Element)
								//and size the row of the 2D arrays
								INSERT IN ARRAY:C227(AA_al_2DItemAttributesLIstID{$_l_Index}; 1; Size of array:C274($_al_AttributeListID))
								INSERT IN ARRAY:C227(AA_al_2DItemAttributes{$_l_Index}; 1; Size of array:C274($_al_AttributeListID))
								INSERT IN ARRAY:C227(AA_at_2DItemAttributesLIstNM{$_l_Index}; 1; Size of array:C274($_al_AttributeListID))
								INSERT IN ARRAY:C227(AA_at_2DItemAttributes{$_l_Index}; 1; Size of array:C274($_al_AttributeListID))
								
								For ($_l_Index2; 1; Size of array:C274($_al_AttributeListID))  //F30²
									AA_al_2DItemAttributesLIstID{$_l_Index}{$_l_Index2}:=$_al_AttributeListID{$_l_Index2}
									AA_al_2DItemAttributes{$_l_Index}{$_l_Index2}:=$_al_AttributeItemID{$_l_Index2}
									AA_at_2DItemAttributesLIstNM{$_l_Index}{$_l_Index2}:=$_at_AttributeListNM{$_l_Index2}
									AA_at_2DItemAttributes{$_l_Index}{$_l_Index2}:=$_at_AttributeItemNM{$_l_Index2}
									
								End for   //end F30
								ARRAY LONGINT:C221($_al_AttributeListID; 0)
								ARRAY LONGINT:C221($_al_AttributeItemID; 0)
								ARRAY TEXT:C222($_at_AttributeListNM; 0)
								ARRAY TEXT:C222($_at_AttributeItemNM; 0)
							End if 
							
							
							//`````
							If ($_l_CurrentIndex>0)
								APPEND TO LIST:C376(AA_HL_ListItems; AA_at_ListItems{$_l_Index}; AA_al_ListItemIDs{$_l_Index}; AA_al_SubListCRHLID{$_l_CurrentIndex}; True:C214)
							Else 
								APPEND TO LIST:C376(AA_HL_ListItems; AA_at_ListItems{$_l_Index}; AA_al_ListItemIDs{$_l_Index}; 0; True:C214)
							End if 
							
							
							
						Else 
							ARRAY LONGINT:C221($_al_AttributeListID; 0)
							ARRAY LONGINT:C221($_al_AttributeItemID; 0)
							ARRAY TEXT:C222($_at_AttributeListNM; 0)
							ARRAY TEXT:C222($_at_AttributeItemNM; 0)
							ARRAY LONGINT:C221($_al_AttributeListID; Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index}))
							ARRAY LONGINT:C221($_al_AttributeItemID; Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index}))
							ARRAY TEXT:C222($_at_AttributeListNM; Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index}))
							ARRAY TEXT:C222($_at_AttributeItemNM; Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index}))
							$_l_Element:=0
							ARRAY TEXT:C222($_at_TempList; 0)
							ARRAY LONGINT:C221($_al_TempListIDS; 0)
							//now get the item properties and put them into the
							$_l_PropertySize:=Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index})
							//$_t_Properties:=AA_at_ListItemProperties{$_l_Index}
							If ($_l_PropertySize>0)  //#"")  `i25
								//the list item has properties
								//properties are saved in the following way
								//List ID;Item ID
								//first we look up the name of property-from
								For ($_l_PropertyIndex; 1; Size of array:C274(AA_at_2DPropertyListProperties{$_l_Index}))
									//Repeat   `R26²
									IDLE:C311
									$_t_PropertyName:=AA_at_2DPropertyListProperties{$_l_Index}{$_l_PropertyIndex}
									$_l_PropertyListID:=AA_al_ListPropertyNum{$_l_Index}{$_l_PropertyIndex}
									$_l_PropertyItemID:=Num:C11(AA_at_ListPropertySTR{$_l_Index}{$_l_PropertyIndex})
									
									
									If ($_l_PropertyItemID>0)  //if 27²
										$_l_PropertySublistPosition:=Find in array:C230(AA_al_ListPropertySublists; $_l_PropertyListID)
										//this should be >0
										If ($_l_PropertySublistPosition>0)  //i28²
											$_l_Element:=$_l_Element+1
											$_al_AttributeListID{$_l_Element}:=$_l_PropertyListID
											$_al_AttributeItemID{$_l_Element}:=$_l_PropertyItemID
											$_at_AttributeListNM{$_l_Element}:=AA_at_ListProperties{$_l_PropertySublistPosition}
											ARRAY TEXT:C222($_at_TempList; 0)
											ARRAY LONGINT:C221($_al_TempListIDS; 0)
											AA_LoadListbyID($_l_PropertyListID; ->$_at_TempList; ->$_al_TempListIDS; False:C215)
											$_l_PropertyItemPosition:=Find in array:C230($_al_TempListIDS; $_l_PropertyItemID)
											//we can now use the property name
											If ($_l_PropertyItemPosition>0)  //i29²
												//it better be!!
												$_at_AttributeItemNM{$_l_Element}:=$_at_TempList{$_l_PropertyItemPosition}
											End if   //end i29
										End if   //end i28
									Else 
										$_t_Properties:=""
									End if   //end i27
									//Until ($_t_Properties="")  `end R26
								End for 
								//reset the size of the local arrays
								ARRAY LONGINT:C221($_al_AttributeListID; $_l_Element)
								ARRAY LONGINT:C221($_al_AttributeItemID; $_l_Element)
								ARRAY TEXT:C222($_at_AttributeListNM; $_l_Element)
								ARRAY TEXT:C222($_at_AttributeItemNM; $_l_Element)
								//and size the row of the 2D arrays
								INSERT IN ARRAY:C227(AA_al_2DItemAttributesLIstID{$_l_Index}; 1; Size of array:C274($_al_AttributeListID))
								INSERT IN ARRAY:C227(AA_al_2DItemAttributes{$_l_Index}; 1; Size of array:C274($_al_AttributeListID))
								INSERT IN ARRAY:C227(AA_at_2DItemAttributesLIstNM{$_l_Index}; 1; Size of array:C274($_al_AttributeListID))
								INSERT IN ARRAY:C227(AA_at_2DItemAttributes{$_l_Index}; 1; Size of array:C274($_al_AttributeListID))
								
								For ($_l_Index2; 1; Size of array:C274($_al_AttributeListID))  //F30²
									AA_al_2DItemAttributesLIstID{$_l_Index}{$_l_Index2}:=$_al_AttributeListID{$_l_Index2}
									AA_al_2DItemAttributes{$_l_Index}{$_l_Index2}:=$_al_AttributeItemID{$_l_Index2}
									AA_at_2DItemAttributesLIstNM{$_l_Index}{$_l_Index2}:=$_at_AttributeListNM{$_l_Index2}
									AA_at_2DItemAttributes{$_l_Index}{$_l_Index2}:=$_at_AttributeItemNM{$_l_Index2}
									
								End for   //end F30
								ARRAY LONGINT:C221($_al_AttributeListID; 0)
								ARRAY LONGINT:C221($_al_AttributeItemID; 0)
								ARRAY TEXT:C222($_at_AttributeListNM; 0)
								ARRAY TEXT:C222($_at_AttributeItemNM; 0)
							End if 
							
							//eeeeeeeeror
							//`````
							APPEND TO LIST:C376(AA_HL_ListItems; AA_at_ListItems{$_l_Index}; AA_al_ListItemIDs{$_l_Index}; 0; True:C214)
					End case   //`end C11
				End if   //end I13
				
			End for   //end F12
			ARRAY TEXT:C222($_at_TempList; 0)
			ARRAY LONGINT:C221($_al_TempListIDS; 0)
			If ((Current user:C182="Designer") | (User in group:C338(Current user:C182; "Designer"))) & (AA_t_listName#"List Properties")
				OBJECT SET VISIBLE:C603(BModProperties; True:C214)
			Else 
				OBJECT SET VISIBLE:C603(BModProperties; False:C215)
			End if 
			//now get the item attributes in the main list
			//and load an item(empty in this case)
			AA_LoadListItemtoManager(0)
		End if 
		
	Else   //i4
		
		AA_t_listName:=$2
		AA_l_CurrentListiD:=$1
		
		//it is a new item so set up the default values
		CB_LP1:=0  //list not User_Modifiable
		CB_LP2:=0  //list not admin modifiable
		//above should be 1 if user is admin
		CB_LP3:=1  //list is designer only
		CB_LP4:=0  //not a heirarchical list
		ARRAY TEXT:C222(AA_at_ListPropertyTypes; 0)
		ARRAY TEXT:C222(AA_at_RelatedFieldNames; 0)
		ARRAY LONGINT:C221(AA_al_RelatedFieldsTable; 0)
		ARRAY LONGINT:C221(AA_al_RelatedFieldsID; 0)
		If (Is a list:C621(AA_HL_ListItems))
			CLEAR LIST:C377(AA_HL_ListItems; *)
		End if 
		
		AA_HL_ListItems:=New list:C375
		ARRAY TEXT:C222(AA_at_ListItems; 0)
		AA_t_NewListItem:=""
		ARRAY TEXT:C222(AA_at_ListItemProperties; 0)
		ARRAY TEXT:C222(AA_at_LIPropValues; 0)
		If ((Current user:C182="Designer") | (User in group:C338(Current user:C182; "Designer"))) & (AA_t_listName#"List Properties")
			OBJECT SET VISIBLE:C603(BModProperties; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(BModProperties; False:C215)
		End if 
		ARRAY TEXT:C222(AA_at_RelatedFieldNames; 0)
		ARRAY LONGINT:C221(AA_al_RelatedFieldsTable; 0)
		ARRAY LONGINT:C221(AA_al_RelatedFieldsID; 0)
		ARRAY LONGINT:C221(AA_al_SublistCRID; 0)
		ARRAY LONGINT:C221(AA_al_SubListCRHLID; 0)
		//if the items are not heirarchical just load them else also append the sublists
		ARRAY TEXT:C222(AA_at_SubListItemNames; 0)
		ARRAY LONGINT:C221(AA_al_SubListItemIDs; 0)
		ARRAY TEXT:C222(AA_at_SubListItemProperties; 0)
		//we need to find if there is a a sublist for each item and append the sublist
		ARRAY LONGINT:C221(AA_al_2DItemAttributesLIstID; 0; 0)
		ARRAY LONGINT:C221(AA_al_2DItemAttributes; 0; 0)
		ARRAY TEXT:C222(AA_at_2DItemAttributesLIstNM; 0; 0)
		ARRAY TEXT:C222(AA_at_2DItemAttributes; 0; 0)
		ARRAY LONGINT:C221(AA_al_SubItemAttributesListID; 0; 0)
		ARRAY LONGINT:C221(AA_al_SubItemAttributes; 0; 0)
		ARRAY TEXT:C222(AA_at_SubItemAttributesLIst; 0; 0)
		ARRAY TEXT:C222(AA_at_SubItemAttributes; 0; 0)
		ARRAY LONGINT:C221(AA_al_SubItemIndex; 0)
		ARRAY LONGINT:C221(AA_al_SubItemListID; 0)
		ARRAY TEXT:C222(AA_at_SubItemNames; 0)
		
		//and load an item(empty in this case)
		AA_LoadListItemtoManager(0)
		//```````````````
		
		//````````````
		
	End if   //end if4
	
	
Else 
	ARRAY TEXT:C222(AA_at_RelatedFieldNames; 0)
	ARRAY LONGINT:C221(AA_al_RelatedFieldsTable; 0)
	ARRAY LONGINT:C221(AA_al_RelatedFieldsID; 0)
	ARRAY LONGINT:C221(AA_al_SublistCRID; 0)
	ARRAY LONGINT:C221(AA_al_SubListCRHLID; 0)
	//if the items are not heirarchical just load them else also append the sublists
	ARRAY TEXT:C222(AA_at_SubListItemNames; 0)
	ARRAY LONGINT:C221(AA_al_SubListItemIDs; 0)
	ARRAY TEXT:C222(AA_at_SubListItemProperties; 0)
	//we need to find if there is a a sublist for each item and append the sublist
	ARRAY LONGINT:C221(AA_al_2DItemAttributesLIstID; 0; 0)
	ARRAY LONGINT:C221(AA_al_2DItemAttributes; 0; 0)
	ARRAY TEXT:C222(AA_at_2DItemAttributesLIstNM; 0; 0)
	ARRAY TEXT:C222(AA_at_2DItemAttributes; 0; 0)
	ARRAY LONGINT:C221(AA_al_SubItemAttributesListID; 0; 0)
	ARRAY LONGINT:C221(AA_al_SubItemAttributes; 0; 0)
	ARRAY TEXT:C222(AA_at_SubItemAttributesLIst; 0; 0)
	ARRAY TEXT:C222(AA_at_SubItemAttributes; 0; 0)
	ARRAY LONGINT:C221(AA_al_SubItemIndex; 0)
	ARRAY LONGINT:C221(AA_al_SubItemListID; 0)
	ARRAY TEXT:C222(AA_at_SubItemNames; 0)
	
End if   //end i3
ARRAY LONGINT:C221(AA_al_SubListItemDeletion; Size of array:C274(AA_al_SubItemIndex))
ARRAY LONGINT:C221(AA_al_ListItemDeletion; Size of array:C274(AA_al_ListItemIDs))
ERR_MethodTrackerReturn("AA_LoadListtoManager"; $_t_oldMethodName)
