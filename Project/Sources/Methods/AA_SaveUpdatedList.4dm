//%attributes = {}
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_RelatedFieldsTable; 0)
	//ARRAY LONGINT(AA_al_2DItemAttributes;0)
	//ARRAY LONGINT(AA_al_2DItemAttributesLIstID;0)
	//ARRAY LONGINT(AA_al_ItemIDsModified;0)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY LONGINT(AA_al_ListItemDeletion;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListPropTypesID;0)
	//ARRAY LONGINT(AA_al_RelatedFieldsID;0)
	//ARRAY LONGINT(AA_al_RelatedFieldsTable;0)
	//ARRAY LONGINT(AA_al_SubItemAttributes;0)
	//ARRAY LONGINT(AA_al_SubItemAttributesListID;0)
	//ARRAY LONGINT(AA_al_SubItemIndex;0)
	//ARRAY LONGINT(AA_al_SubItemListID;0)
	//ARRAY LONGINT(AA_al_SublistCRID;0)
	//ARRAY LONGINT(AA_al_SubListItemDeletion;0)
	//ARRAY LONGINT(WS_al_RelacedFieldIDs2;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	//ARRAY TEXT(AA_at_ListPropertyTypes;0)
	//ARRAY TEXT(AA_at_SubItemNames;0)
	C_BOOLEAN:C305($_bo_Delete; $_bo_Expanded; $_bo_Reload)
	C_COLLECTION:C1488($_Col_RelatedFieldsFIelds; $_Col_RelatedFieldsTable)
	C_LONGINT:C283($_l_BinaryNumber; $_l_CountListItems; $_l_DeleteItemPosition; $_l_DeletionsPosition; $_l_index; $_l_ItemReference2; $_l_ListItemCheck; $_l_ModifiedItemPosition; $_l_NextReference; $_l_RelatedFieldTable; $_l_RelatedIndex)
	C_LONGINT:C283($_l_RelationFieldPosition; $_l_RelationPosition; $_l_Retries; $_l_SaveRelationsIndex; $_l_SelectedListItem; $_l_Skip; $_l_SublistID2; $_l_SubListItemCheck; $_l_SublistRef; $0; $1)
	C_LONGINT:C283(AA_HL_ListItems; AA_l_CurrentSelectedItemID; CB_LP1; CB_LP2; CB_LP3; CB_LP4; WS_l_HLAListNames)
	C_OBJECT:C1216($_obj_DeleteUsage; $_obj_DeleteUsages; $_obj_List; $_obj_ListAA_at_ListPropertyType; $_obj_ListItem; $_obj_ListItems; $_obj_Lists; $_obj_Lists0; $_obj_ListsUsages; $_obj_ListUsage; $_obj_ListUsages)
	C_TEXT:C284($_t_accesss; $_t_Attribute; $_t_Attribute1; $_t_Attribute2; $_t_AttributeIDString; $_t_AttributesList; $_t_AttributeType; $_t_ItemText2; $_t_ListName; $_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_SaveUpdatedList")
//NG Feb 2004 Modified to use semaphores before updating lists
//this method will save an existing list

$0:=0
If (Count parameters:C259>=2)
	If ($1#0)
		//there is a currently selected list
		If (AA_l_CurrentSelectedItemID#0)  //this only sets the data to the arrays-but it should really use an object
			AA_SaveListItem(AA_l_CurrentSelectedItemID)
			////////////////////////////_o_REDRAW LIST(AA_HL_ListItems)
		End if 
		
		Case of 
			: ($1<0)
				$_l_Retries:=0
				While (Semaphore:C143("LoadingListofLists"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*(1+$_l_Retries))
				End while 
				$_l_Retries:=0
				While (Semaphore:C143("$LoadingListofLists"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*(1+$_l_Retries))
				End while 
				//this list does not 'exist'
				//so here we must create the list
				//READ WRITE([X_LISTS])
				//CREATE RECORD([X_LISTS])
				$_obj_List:=ds:C1482.X_LISTS.new()
				$_bo_Reload:=True:C214
				$_obj_List.x_ID:=Abs:C99($1)
				//Remember that Items must be saved to the correct list
				$_obj_List.x_ListName:=$2
				//now get the attributes
				$_l_BinaryNumber:=0
				If (CB_LP1=1)  //the list is User_Modifiable
					$_l_BinaryNumber:=$_l_BinaryNumber ?+ 1
				End if 
				If (CB_LP2=1)
					$_l_BinaryNumber:=$_l_BinaryNumber ?+ 2
				End if 
				If (CB_LP3=1)
					$_l_BinaryNumber:=$_l_BinaryNumber ?+ 3
				End if 
				If (CB_LP4=1)
					$_l_BinaryNumber:=$_l_BinaryNumber ?+ 4
				End if 
				$_t_accesss:="Access:"+String:C10($_l_BinaryNumber)
				$_t_Attribute:=""
				$_l_BinaryNumber:=$_l_BinaryNumber ?+ 1
				AA_SetListProperty($_obj_List; "ACCESS"; $_l_BinaryNumber)
				If (Size of array:C274(AA_at_ListPropertyTypes)>0)
					For ($_l_index; 1; Size of array:C274(AA_at_ListPropertyTypes))
						AA_SetListProperty($_obj_List; AA_at_ListPropertyTypes{$_l_index}; AA_al_ListPropTypesID{$_l_index})
					End for 
				End if 
				DB_SaveEntity($_obj_List)
				//DB_SaveRecord(->[X_LISTS])
				//AA_CheckFileUnlocked(->[X_LISTS]x_ID)
				$0:=$_obj_List.x_ID
				//Update the list of lists here
				//`need this next line so we can find any for deletion
				ARRAY LONGINT:C221($_al_RelatedFieldsTable; 0)
				ARRAY LONGINT:C221(WS_al_RelacedFieldIDs2; 0)
				$_obj_ListUsages:=ds:C1482.x_ListUsage.query("x_ListID =:1"; $1)
				$_Col_RelatedFieldsTable:=New collection:C1472
				$_Col_RelatedFieldsFIelds:=New collection:C1472
				If ($_obj_ListUsages.length>0)
					For each ($_obj_ListUsage; $_obj_ListUsages)
						If ($_obj_ListUsage.x_ListID<0)
							$_obj_ListUsage.x_ListID:=Abs:C99($_obj_ListUsage.x_ListID)
							DB_SaveEntity($_obj_ListUsage)
						End if 
					End for each 
					$_Col_RelatedFieldsTable:=$_obj_ListUsages.x_TableID
					$_Col_RelatedFieldsFIelds:=$_obj_ListUsages.x_FieldID
				End if 
				//if $1 was negative though this would not find the list usage if it is positive?
				//QUERY([x_ListUsage]; [x_ListUsage]x_ListID=$1)
				//SELECTION TO ARRAY([x_ListUsage]x_TableID; $_al_RelatedFieldsTable; [x_ListUsage]x_FieldID; WS_al_RelacedFieldIDs2)
				//READ WRITE([x_ListUsage])
				
				For ($_l_SaveRelationsIndex; 1; Size of array:C274(AA_al_RelatedFieldsTable))
					$_obj_ListsUsages:=ds:C1482.x_ListUsage.query("x_TableID =:1 and x_FieldID =:2"; AA_al_RelatedFieldsTable{$_l_SaveRelationsIndex}; AA_al_RelatedFieldsID{$_l_SaveRelationsIndex})
					If ($_obj_ListsUsages.length=0)
						$_obj_ListUsage:=ds:C1482.x_ListUsage.new()
						$_obj_ListUsage.x_TableID:=AA_al_RelatedFieldsTable{$_l_SaveRelationsIndex}
						$_obj_ListUsage.x_FieldID:=AA_al_RelatedFieldsID{$_l_SaveRelationsIndex}
						$_obj_ListUsage.x_ListID:=Abs:C99($1)
						DB_SaveEntity($_obj_ListUsage)
						$_Col_RelatedFieldsTable.push(AA_al_RelatedFieldsTable{$_l_SaveRelationsIndex})
						$_Col_RelatedFieldsFIelds.push(AA_al_RelatedFieldsID{$_l_SaveRelationsIndex})
					End if 
					
					//QUERY([x_ListUsage]; [x_ListUsage]x_TableID=AA_al_RelatedFieldsTable{$_l_SaveRelationsIndex}; *)
					//QUERY([x_ListUsage];  & ; [x_ListUsage]x_FieldID=AA_al_RelatedFieldsID{$_l_SaveRelationsIndex})
					//If (Records in selection([x_ListUsage])=0)
					//CREATE RECORD([x_ListUsage])
					//[x_ListUsage]x_TableID:=AA_al_RelatedFieldsTable{$_l_SaveRelationsIndex}
					//[x_ListUsage]x_FieldID:=AA_al_RelatedFieldsID{$_l_SaveRelationsIndex}
					//End if 
					//[x_ListUsage]x_ListID:=Abs($1)
					//DB_SaveRecord(->[x_ListUsage])
					//AA_CheckFileUnlocked(->[x_ListUsage]x_ID)
				End for 
				//and any to delete?
				$_l_RelatedIndex:=0
				For each ($_l_RelatedFieldTable; $_Col_RelatedFieldsTable)
					$_bo_Delete:=False:C215
					$_l_RelationPosition:=Find in array:C230(AA_al_RelatedFieldsTable; $_l_RelatedFieldTable)
					If ($_l_RelationPosition>0)
						$_l_RelationFieldPosition:=Find in array:C230(AA_al_RelatedFieldsID; $_Col_RelatedFieldsFIelds[$_l_RelatedIndex]; $_l_RelationPosition)
						If ($_l_RelationFieldPosition<0)
							$_bo_Delete:=True:C214
						End if 
					Else 
						$_bo_Delete:=True:C214
					End if 
					If ($_bo_Delete)
						$_obj_DeleteUsages:=ds:C1482.x_ListUsage].query("x_TableID =:1 and x_FieldID =:2"; $_l_RelatedFieldTable; $_Col_RelatedFieldsFIelds[$_l_RelatedIndex])
						If ($_obj_DeleteUsages.length>0)
							$_obj_DeleteUsage:=$_obj_DeleteUsages[0]
							$_obj_DeleteUsage.x_ListID:=0
							DB_SaveEntity($_obj_DeleteUsage)
						End if 
					End if 
					$_l_RelatedIndex:=$_l_RelatedIndex+1
				End for each 
				ARRAY LONGINT:C221(AA_al_ListItemDeletion; Size of array:C274(AA_al_ListItemIDs))
				
				For ($_l_ListItemCheck; 1; Size of array:C274(AA_al_ListItemIDs))
					If (Size of array:C274(AA_al_ListItemDeletion)>=$_l_ListItemCheck)
						$_l_RelationPosition:=Find in array:C230(AA_al_ItemIDsModified; AA_al_ListItemIDs{$_l_ListItemCheck})
						$_bo_Delete:=(AA_al_ListItemDeletion{$_l_ListItemCheck}=1)
					Else 
						$_l_RelationPosition:=Find in array:C230(AA_al_ItemIDsModified; AA_al_ListItemIDs{$_l_ListItemCheck})
						$_bo_Delete:=False:C215
					End if 
					
					If ($_l_RelationPosition>0) | ($_bo_Delete)
						If (AA_al_ListItemIDs{$_l_ListItemCheck}<0)
							//item is not saved
							
							READ WRITE:C146([LIST_ITEMS:95])
							CREATE RECORD:C68([LIST_ITEMS:95])
							[LIST_ITEMS:95]X_ID:3:=Abs:C99(AA_al_ListItemIDs{$_l_ListItemCheck})
							[LIST_ITEMS:95]X_ListID:4:=$_obj_List.x_ID
						Else 
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AA_al_ListItemIDs{$_l_ListItemCheck})
						End if 
						[LIST_ITEMS:95]List_Entry:2:=AA_at_ListItems{$_l_ListItemCheck}
						$_t_Attribute2:=""
						AA_SetListItemProperty("SUBLIST"; AA_al_SublistCRID{$_l_ListItemCheck})
						For ($_l_index; 1; Size of array:C274(AA_al_2DItemAttributes{$_l_ListItemCheck}))
							QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=AA_al_2DItemAttributesLIstID{$_l_ListItemCheck}{$_l_index})
							$_t_ListName:=[X_LISTS:111]x_ListName:2
							AA_SetListItemProperty($_t_ListName; AA_al_2DItemAttributes{$_l_ListItemCheck}{$_l_index})
							$_t_Attribute2:=String:C10(AA_al_2DItemAttributesLIstID{$_l_ListItemCheck}{$_l_index})+","+String:C10(AA_al_2DItemAttributes{$_l_ListItemCheck}{$_l_index})+";"
						End for 
						//If ($_t_Attribute1#"")
						//TEXT TO BLOB($_t_Attribute1+Char(13)+$_t_Attribute2;[LIST_ITEMS]X_ItemAttributes;3)
						//Else
						//TEXT TO BLOB($_t_Attribute2;[LIST_ITEMS]X_ItemAttributes;3)
						//End if
						//item is deleted
						If (AA_al_ListItemDeletion{$_l_ListItemCheck}=1)
							[LIST_ITEMS:95]X_Item_Status:7:=-1
						End if 
						
						
						
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						//Here we should make sure the ACCESS of any list that is a sublist is set correctly(which of course would fix any faulty data).
					End if 
					
				End for 
				
				
				//and the sublist items
				ARRAY LONGINT:C221(AA_al_SubListItemDeletion; Size of array:C274(AA_al_SubItemIndex))
				
				For ($_l_SubListItemCheck; 1; Size of array:C274(AA_al_SubItemIndex))
					If (Size of array:C274(AA_al_SubListItemDeletion)>=$_l_SubListItemCheck)
						$_l_RelationPosition:=Find in array:C230(AA_al_ItemIDsModified; AA_al_ListItemIDs{$_l_SubListItemCheck})
						$_bo_Delete:=(AA_al_SubListItemDeletion{$_l_SubListItemCheck}=1)
					Else 
						$_l_RelationPosition:=Find in array:C230(AA_al_ItemIDsModified; AA_al_ListItemIDs{$_l_SubListItemCheck})
						$_bo_Delete:=False:C215
					End if 
					
					If ($_l_RelationPosition>0) | ($_bo_Delete)
						If (AA_al_SubItemIndex{$_l_SubListItemCheck}<0)
							CREATE RECORD:C68([LIST_ITEMS:95])
							[LIST_ITEMS:95]X_ID:3:=Abs:C99(AA_al_SubItemIndex{$_l_SubListItemCheck})
							[LIST_ITEMS:95]X_ListID:4:=AA_al_SubItemListID{$_l_SubListItemCheck}
						Else 
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AA_al_SubItemIndex{$_l_SubListItemCheck})
						End if 
						[LIST_ITEMS:95]List_Entry:2:=AA_at_SubItemNames{$_l_SubListItemCheck}
						$_t_AttributesList:=""
						For ($_l_index; 1; Size of array:C274(AA_al_SubItemAttributesListID{$_l_RelationPosition}))
							$_t_AttributeType:=String:C10(AA_al_SubItemAttributesListID{$_l_RelationPosition}{$_l_index})
							$_t_AttributeIDString:=String:C10(AA_al_SubItemAttributes{$_l_RelationPosition}{$_l_index})
							If ($_t_AttributesList="")
								$_t_AttributesList:=$_t_AttributeType+","+$_t_AttributeIDString
							Else 
								$_t_AttributesList:=$_t_AttributesList+";"+$_t_AttributeType+","+$_t_AttributeIDString
							End if 
						End for 
						//that has built a string of attributes
						
						
						TEXT TO BLOB:C554($_t_AttributesList; [LIST_ITEMS:95]X_Item_Attributes:6; 3)
						If ($_l_SubListItemCheck<=Size of array:C274(AA_al_SubListItemDeletion))
							If (AA_al_SubListItemDeletion{$_l_SubListItemCheck}=1)  //item is deleted
								[LIST_ITEMS:95]X_Item_Status:7:=-1
							End if 
						End if 
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
					End if 
					
				End for 
				
				
				CLEAR SEMAPHORE:C144("LoadingListofLists")
				//```
			: ($1>0)
				//this list exist-update things
				//this list does not 'exist'
				//so here we must create the list
				$_l_Retries:=0
				While (Semaphore:C143("LoadingListofLists"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*(1+$_l_Retries))
				End while 
				$_l_RelationPosition:=Find in array:C230(AA_al_ListIDS; $1)
				$_obj_Lists:=ds:C1482.X_LISTS.query("x_ID =:1"; $1)
				If ($_obj_Lists.length=0)
				Else 
					$_obj_List:=$_obj_Lists[0]
				End if 
				//READ WRITE([X_LISTS])
				//QUERY([X_LISTS]; [X_LISTS]x_ID=$1)
				//$_l_Retries:=0
				//While (Not(Check_Locked(->[X_LISTS]; 1)))
				//$_l_Retries:=$_l_Retries+1
				//DelayTicks(2*(1+$_l_Retries))
				//End while 
				$_obj_List.x_ListName:=$2
				If ($_l_RelationPosition>0)  //this shoud not be done in this method-the data data should be passed back
					AA_at_ListNames{$_l_RelationPosition}:=$2
					SET LIST ITEM:C385(WS_l_HLAListNames; AA_al_ListIDS{$_l_RelationPosition}; AA_at_ListNames{$_l_RelationPosition}; AA_al_ListIDS{$_l_RelationPosition})
					//////////////////////////////_o_REDRAW LIST(WS_l_HLAListNames)
				Else 
					//MMMMMM something wrong
				End if 
				
				//now get the attributes
				$_l_BinaryNumber:=0
				If (CB_LP1=1)  //the list is User_Modifiable
					$_l_BinaryNumber:=$_l_BinaryNumber ?+ 1
				End if 
				If (CB_LP2=1)
					$_l_BinaryNumber:=$_l_BinaryNumber ?+ 2
				End if 
				If (CB_LP3=1)
					$_l_BinaryNumber:=$_l_BinaryNumber ?+ 3
				End if 
				If (CB_LP4=1)
					$_l_BinaryNumber:=$_l_BinaryNumber ?+ 4
				End if 
				AA_SetListProperty($_obj_List; "ACCESS"; $_l_BinaryNumber)
				$_t_Attribute:=""
				For ($_l_index; 1; Size of array:C274(AA_at_ListPropertyTypes))
					AA_SetListProperty($_obj_List; $_obj_ListAA_at_ListPropertyType{$_l_index}; AA_al_ListPropTypesID{$_l_index})
				End for 
				DB_SaveEntity($_obj_List)
				//DB_SaveRecord(->[X_LISTS])
				//AA_CheckFileUnlocked(->[X_LISTS]x_ID)
				//``````````````
				//`need this next line so we can find any for deletion
				ARRAY LONGINT:C221($_al_RelatedFieldsTable; 0)
				ARRAY LONGINT:C221(WS_al_RelacedFieldIDs2; 0)
				QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_ListID:2=$1)
				SELECTION TO ARRAY:C260([x_ListUsage:112]x_TableID:3; $_al_RelatedFieldsTable; [x_ListUsage:112]x_FieldID:4; WS_al_RelacedFieldIDs2)
				READ WRITE:C146([x_ListUsage:112])
				For ($_l_SaveRelationsIndex; 1; Size of array:C274(AA_al_RelatedFieldsTable))
					QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_TableID:3=AA_al_RelatedFieldsTable{$_l_SaveRelationsIndex}; *)
					QUERY:C277([x_ListUsage:112];  & ; [x_ListUsage:112]x_FieldID:4=AA_al_RelatedFieldsID{$_l_SaveRelationsIndex})
					If (Records in selection:C76([x_ListUsage:112])=0)
						CREATE RECORD:C68([x_ListUsage:112])
						[x_ListUsage:112]x_TableID:3:=AA_al_RelatedFieldsTable{$_l_SaveRelationsIndex}
						[x_ListUsage:112]x_FieldID:4:=AA_al_RelatedFieldsID{$_l_SaveRelationsIndex}
					End if 
					[x_ListUsage:112]x_ListID:2:=$1
					DB_SaveRecord(->[x_ListUsage:112])
					AA_CheckFileUnlocked(->[x_ListUsage:112]x_ID:1)
				End for 
				//and any to delete?
				For ($_l_SaveRelationsIndex; 1; Size of array:C274($_al_RelatedFieldsTable))
					$_bo_Delete:=False:C215
					$_l_RelationPosition:=Find in array:C230(AA_al_RelatedFieldsTable; $_al_RelatedFieldsTable{$_l_SaveRelationsIndex})
					If ($_l_RelationPosition>0)
						$_l_RelationFieldPosition:=Find in array:C230(AA_al_RelatedFieldsID; WS_al_RelacedFieldIDs2{$_l_SaveRelationsIndex}; $_l_RelationPosition)
						If ($_l_RelationFieldPosition<0)
							$_bo_Delete:=True:C214
						End if 
					Else 
						$_bo_Delete:=True:C214
					End if 
					If ($_bo_Delete)
						QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_TableID:3=$_al_RelatedFieldsTable{$_l_SaveRelationsIndex}; *)
						QUERY:C277([x_ListUsage:112];  & ; [x_ListUsage:112]x_FieldID:4=WS_al_RelacedFieldIDs2{$_l_SaveRelationsIndex})
						[x_ListUsage:112]x_ListID:2:=0
						DB_SaveRecord(->[x_ListUsage:112])
						AA_CheckFileUnlocked(->[x_ListUsage:112]x_ID:1)
					End if 
				End for 
				UNLOAD RECORD:C212([x_ListUsage:112])
				READ ONLY:C145([x_ListUsage:112])
				
				For ($_l_SelectedListItem; Count list items:C380(AA_HL_ListItems); 1; -1)
					GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded)
					SET LIST ITEM:C385(AA_HL_ListItems; $_l_ItemReference2; $_t_ItemText2; $_l_ItemReference2; $_l_SublistID2; False:C215)
				End for 
				//the above makes sure we have all the list collapsed
				$_l_CountListItems:=Count list items:C380(AA_HL_ListItems)
				$_l_NextReference:=1
				ARRAY LONGINT:C221(AA_al_ListItemDeletion; Size of array:C274(AA_al_ListItemIDs))
				For ($_l_ListItemCheck; 1; Size of array:C274(AA_al_ListItemIDs))
					If (Size of array:C274(AA_al_ListItemDeletion)>=$_l_ListItemCheck)
						$_l_RelationPosition:=Find in array:C230(AA_al_ItemIDsModified; AA_al_ListItemIDs{$_l_ListItemCheck})
						$_bo_Delete:=(AA_al_ListItemDeletion{$_l_ListItemCheck}=1)
					Else 
						$_l_RelationPosition:=Find in array:C230(AA_al_ItemIDsModified; AA_al_ListItemIDs{$_l_ListItemCheck})
						$_bo_Delete:=False:C215
					End if 
					
					
					If ($_l_RelationPosition>0) | ($_bo_Delete)
						
						If (AA_al_ListItemIDs{$_l_ListItemCheck}<0)
							//item is not saved
							$_obj_ListItem:=ds:C1482.LIST_ITEMS.new()
							$_obj_ListItem.X_ID:=Abs:C99(AA_al_ListItemIDs{$_l_ListItemCheck})
							$_obj_ListItem.X_ListID:=[X_LISTS:111]x_ID:1
							//READ WRITE([LIST_ITEMS])
							//CREATE RECORD([LIST_ITEMS])
							//[LIST_ITEMS]X_ID:=Abs(AA_al_ListItemIDs{$_l_ListItemCheck})
							//[LIST_ITEMS]X_ListID:=[X_LISTS]x_ID
						Else 
							$_obj_ListItems:=ds:C1482.LIST_ITEMS.query("X_ID =:1"; AA_al_ListItemIDs{$_l_ListItemCheck})
							If ($_obj_ListItems.length>0)
								$_obj_ListItem:=$_obj_ListItems[0]
							Else 
								$_obj_ListItem:=ds:C1482.LIST_ITEMS.new()
								$_obj_ListItem.X_ID:=Abs:C99(AA_al_ListItemIDs{$_l_ListItemCheck})
								$_obj_ListItem.X_ListID:=[X_LISTS:111]x_ID:1
							End if 
							
							//READ WRITE([LIST_ITEMS])
							//QUERY([LIST_ITEMS]; [LIST_ITEMS]X_ID=AA_al_ListItemIDs{$_l_ListItemCheck})
						End if 
						$_obj_ListItem.List_Entry:=AA_at_ListItems{$_l_ListItemCheck}
						//[LIST_ITEMS]List_Entry:=AA_at_ListItems{$_l_ListItemCheck}
						$_t_Attribute1:=""
						
						If (AA_al_SublistCRID{$_l_ListItemCheck}#0)  //there is a sublist
							AA_SetListItemProperty($_obj_ListItem; "SUBLIST"; AA_al_SublistCRID{$_l_ListItemCheck})
							//$_t_Attribute1:="Sublist:"+String(AA_al_SublistCRID{$_l_ListItemCheck})
						End if 
						$_t_Attribute2:=""
						
						For ($_l_index; 1; Size of array:C274(AA_al_2DItemAttributes{$_l_ListItemCheck}))
							//this looks incorrect to me(August 2022)//we are not passing the name to set list item property
							$_obj_Lists:=ds:C1482.X_LISTS.query("x_ID =:1"; AA_al_2DItemAttributesLIstID{$_l_ListItemCheck}{$_l_index})
							If ($_obj_Lists.length>0)  //it should be
								//QUERY([X_LISTS]; [X_LISTS]x_ID=AA_al_2DItemAttributesLIstID{$_l_ListItemCheck}{$_l_index})
								$_t_ListName:=$_obj_Lists[0].x_ListName
								AA_SetListItemProperty($_obj_ListItem; "SUBLISTNAME"; $_obj_Lists0].x_ListName)
								
								//AA_SetListItemProperty("$_t_ListName"; AA_al_SublistCRID{$_l_ListItemCheck})
								//$_t_Attribute2:=String(AA_al_2DItemAttributesLIstID{$_l_ListItemCheck}{$_l_index})+","+String(AA_al_2DItemAttributes{$_l_ListItemCheck}{$_l_index})+";"
							End if 
						End for 
						If ($_t_Attribute1#"")
							//TEXT TO BLOB($_t_Attribute1+Char(13)+$_t_Attribute2;[LIST_ITEMS]X_ItemAttributes;3)
						Else 
							//TEXT TO BLOB($_t_Attribute2;[LIST_ITEMS]X_ItemAttributes;3)
						End if 
						If (AA_al_ListItemDeletion{$_l_ListItemCheck}=1)
							$_obj_ListItem.X_Item_Status:=-1
						End if 
						DB_SaveEntity($_obj_ListItem)
						//DB_SaveRecord(->[LIST_ITEMS])
						AA_al_ListItemDeletion{$_l_ListItemCheck}:=0
						//AA_CheckFileUnlocked(->[LIST_ITEMS]X_ID)
					Else 
						//```
						If (Size of array:C274(AA_al_ItemIDsModified)>0)
							For ($_l_Skip; $_l_NextReference; Size of array:C274(AA_al_ItemIDsModified))
								
								$_l_RelationFieldPosition:=Find in array:C230(AA_al_ListItemIDs; AA_al_ItemIDsModified{$_l_Skip})
								If ($_l_RelationFieldPosition>0)
									$_l_DeletionsPosition:=Find in array:C230(AA_al_ListItemDeletion; 1)
									If ($_l_DeletionsPosition>0)
										If ($_l_DeletionsPosition<$_l_RelationFieldPosition)
											$_l_ListItemCheck:=$_l_DeletionsPosition-1
											$_l_NextReference:=$_l_DeletionsPosition+1
											$_l_Skip:=Size of array:C274(AA_al_ItemIDsModified)
										Else 
											$_l_ListItemCheck:=$_l_RelationFieldPosition-1
											$_l_NextReference:=$_l_Skip+1
											$_l_Skip:=Size of array:C274(AA_al_ItemIDsModified)
										End if 
										
									Else 
										$_l_ListItemCheck:=$_l_RelationFieldPosition-1
										$_l_NextReference:=$_l_Skip+1
										$_l_Skip:=Size of array:C274(AA_al_ItemIDsModified)
									End if 
								End if 
								
							End for 
							//````
						Else 
							$_l_DeletionsPosition:=Find in array:C230(AA_al_ListItemDeletion; 1)
							If ($_l_DeletionsPosition>$_l_ListItemCheck)
								$_l_ListItemCheck:=$_l_DeletionsPosition-1
								$_l_NextReference:=$_l_DeletionsPosition+1
							End if 
						End if 
					End if 
				End for 
				//and the sublist items
				$_l_NextReference:=1
				ARRAY LONGINT:C221(AA_al_SubListItemDeletion; Size of array:C274(AA_al_SubItemIndex))
				
				For ($_l_SubListItemCheck; 1; Size of array:C274(AA_al_SubItemIndex))
					If (Size of array:C274(AA_al_SubListItemDeletion)>=$_l_SubListItemCheck)
						$_l_RelationPosition:=Find in array:C230(AA_al_ItemIDsModified; AA_al_SubItemIndex{$_l_SubListItemCheck})
						$_bo_Delete:=(AA_al_SubListItemDeletion{$_l_SubListItemCheck}=1)
					Else 
						$_l_RelationPosition:=Find in array:C230(AA_al_ItemIDsModified; AA_al_SubItemIndex{$_l_SubListItemCheck})
						$_bo_Delete:=False:C215
					End if 
					
					If ($_l_RelationPosition>0) | ($_bo_Delete)
						
						If (AA_al_SubItemIndex{$_l_SubListItemCheck}<0)
							READ WRITE:C146([LIST_ITEMS:95])
							CREATE RECORD:C68([LIST_ITEMS:95])
							[LIST_ITEMS:95]X_ListID:4:=AA_al_SubItemListID{$_l_SubListItemCheck}
							[LIST_ITEMS:95]X_ID:3:=Abs:C99(AA_al_SubItemIndex{$_l_SubListItemCheck})
						Else 
							READ WRITE:C146([LIST_ITEMS:95])
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AA_al_SubItemIndex{$_l_SubListItemCheck})
						End if 
						[LIST_ITEMS:95]List_Entry:2:=AA_at_SubItemNames{$_l_SubListItemCheck}
						$_t_AttributesList:=""
						For ($_l_index; 1; Size of array:C274(AA_al_SubItemAttributesListID{$_l_SubListItemCheck}))
							QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=AA_al_SubItemAttributesListID{$_l_ListItemCheck}{$_l_index})
							$_t_ListName:=[X_LISTS:111]x_ListName:2
							//$_t_AttributeType:=String(AA_al_SubItemAttributesListID{$_l_SubListItemCheck}{$_l_index})
							//$_t_AttributeIDString:=String(AA_al_SubItemAttributes{$_l_SubListItemCheck}{$_l_index})
							AA_SetListItemProperty($_t_ListName; AA_al_SubItemAttributes{$_l_SubListItemCheck}{$_l_index})
							If ($_t_AttributesList="")
								$_t_AttributesList:=$_t_AttributeType+","+$_t_AttributeIDString
							Else 
								$_t_AttributesList:=$_t_AttributesList+";"+$_t_AttributeType+","+$_t_AttributeIDString
							End if 
						End for 
						//that has built a string of attributes
						//TEXT TO BLOB($_t_AttributesList;[LIST_ITEMS]X_ItemAttributes;3)
						If ($_l_SubListItemCheck>0) & ($_l_SubListItemCheck<=Size of array:C274(AA_al_SubListItemDeletion))
							If (AA_al_SubListItemDeletion{$_l_SubListItemCheck}=1)
								//item is deleted
								[LIST_ITEMS:95]X_Item_Status:7:=-1
							End if 
						End if 
						AA_al_SubListItemDeletion{$_l_SubListItemCheck}:=0
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
					Else 
						If (Size of array:C274(AA_al_ItemIDsModified)>0)
							For ($_l_Skip; $_l_NextReference; Size of array:C274(AA_al_ItemIDsModified))
								
								$_l_ModifiedItemPosition:=Find in array:C230(AA_al_SubItemIndex; AA_al_ItemIDsModified{$_l_Skip})
								If ($_l_ModifiedItemPosition>0)
									$_l_DeleteItemPosition:=Find in array:C230(AA_al_SubListItemDeletion; 1)
									If ($_l_DeleteItemPosition>0)
										If ($_l_DeleteItemPosition<$_l_ModifiedItemPosition)
											$_l_SubListItemCheck:=$_l_DeleteItemPosition-1
											$_l_NextReference:=$_l_DeleteItemPosition+1
											$_l_Skip:=Size of array:C274(AA_al_ItemIDsModified)
										Else 
											$_l_SubListItemCheck:=$_l_ModifiedItemPosition-1
											$_l_NextReference:=$_l_Skip+1
											$_l_Skip:=Size of array:C274(AA_al_ItemIDsModified)
										End if 
										
									Else 
										$_l_SubListItemCheck:=$_l_ModifiedItemPosition-1
										$_l_NextReference:=$_l_Skip+1
										$_l_Skip:=Size of array:C274(AA_al_ItemIDsModified)
									End if 
								End if 
								
							End for 
						Else 
							$_l_DeleteItemPosition:=Find in array:C230(AA_al_SubListItemDeletion; 1)
							If ($_l_DeleteItemPosition>$_l_SubListItemCheck)
								$_l_SubListItemCheck:=$_l_DeleteItemPosition-1
								$_l_NextReference:=$_l_DeleteItemPosition+1
							End if 
						End if 
						
					End if 
					
				End for 
				
				
				
				
				CLEAR SEMAPHORE:C144("LoadingListofLists")
				CLEAR SEMAPHORE:C144("$LoadingListofLists")
				
		End case 
		
	End if 
	UNLOAD RECORD:C212([X_LISTS:111])
	READ ONLY:C145([X_LISTS:111])
	UNLOAD RECORD:C212([LIST_ITEMS:95])
	READ ONLY:C145([LIST_ITEMS:95])
	If ($_bo_Reload)  //a new list was added
		
		
	End if 
End if 
ERR_MethodTrackerReturn("AA_SaveUpdatedList"; $_t_oldMethodName)
