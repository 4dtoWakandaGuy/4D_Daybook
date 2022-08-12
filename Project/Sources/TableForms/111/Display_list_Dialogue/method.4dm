If (False:C215)
	//Table Form Method Name: Object Name:      [X_LISTS].Display_list_Dialogue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/02/2012 18:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(AA_LB_Listitems;0)
	//ARRAY LONGINT(<>WS_al_ListIDS;0)
	//ARRAY LONGINT(AA_al_2DItemAttributes;0;0)
	//ARRAY LONGINT(AA_al_2DItemAttributesLIstID;0;0)
	//ARRAY LONGINT(AA_al_aPropertyNum;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_ListItemsDelete;0)
	//ARRAY LONGINT(AA_al_ListItemvalue;0)
	//ARRAY LONGINT(AA_al_listPropertiesNUM;0;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_ListPropertyNum;0;0)
	//ARRAY LONGINT(AA_al_ListPropertySublists;0)
	//ARRAY LONGINT(AA_al_ListPropTypesID;0)
	//ARRAY TEXT(AA_at_2DItemAttributes;0;0)
	//ARRAY TEXT(AA_at_2DItemAttributesLIstNM;0;0)
	//ARRAY TEXT(AA_at_APropertyNames;0)
	//ARRAY TEXT(AA_at_aPropertyValue;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_ListItemvalue;0)
	//ARRAY TEXT(AA_at_ListProperties;0;0)
	//ARRAY TEXT(AA_at_listPropertiesSTR;0;0)
	//ARRAY TEXT(AA_at_ListPropertySTR;0;0)
	//ARRAY TEXT(AA_at_ListPropertyTypes;0)
	//ARRAY TEXT(AA_at_PropertiesListProperties;0)
	//ARRAY TEXT(AA_at_PropertyListPropertyNames;0;0)
	//ARRAY TEXT(AA_at_PropertyValues;0)
	C_BOOLEAN:C305(AA_bo_ListInitiation; DB_bo_NoLoad)
	C_LONGINT:C283($_l_Access; $_l_ArraySize; $_l_CUrrentItemPosition; $_l_EndofLinePosition; $_l_Event; $_l_Index; $_l_Index2; $_l_ListID; $_l_ListItemSize; $_l_ListRow; $_l_LoadedListID)
	C_LONGINT:C283($_l_Num; $_l_PropertyID; $_l_PropertyPosition; $_l_PropertyRow; $_l_ReferenceA; $_l_Retries; $_l_SublistListNum; $_l_SUblistPosition; $_l_SubReference; $_l_TotalWidth; AA_l_CurrentItemID)
	C_LONGINT:C283(AA_l_CurrentSelectedProperty; AAL_l_BUT1; AAL_l_But2; AAL_l_BUT3; AAL_l_BUT4; AAL_l_BUT5; AAL_l_BUT6; AAL_l_BUT7; AAL_l_BUT8; AAL_l_BUT9; BuseDefaults)
	C_LONGINT:C283(WS_l_CurrentItemROW)
	C_TEXT:C284($_t_ListName; $_t_oldMethodName; $_t_oldMethodName2; $_t_PropertyName; $_t_Sublist; AA_t_AddorModLabel; AA_t_NewListItem; AA_t_SelectedProperty; AAL_t_COL1; AAL_t_COL2; AAL_t_COL3)
	C_TEXT:C284(WS_t_selectedListItemvalue)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [X_LISTS]Display_list_Dialogue"; Form event code:C388)

$_l_Event:=Form event code:C388



Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		OpenHelp(Table:C252(->[X_LISTS:111]); "Display_list_Dialogue")
		
		OBJECT SET ENABLED:C1123(*; "oUseDefaultsButton"; (AA_bo_ListInitiation))
		OBJECT SET VISIBLE:C603(*; "oUseDefaultsButton"; (AA_bo_ListInitiation))
		
		SET WINDOW TITLE:C213("Edit List: "+[X_LISTS:111]x_ListName:2)
		$_t_ListName:=[X_LISTS:111]x_ListName:2
		$_l_LoadedListID:=[X_LISTS:111]x_ID:1
		WS_AutoscreenSize(3; 381; 428)
		ARRAY TEXT:C222(AA_at_ListItems; 0)
		ARRAY LONGINT:C221(AA_al_ListItemIDs; 0)
		ARRAY LONGINT:C221(AA_al_ListItemsDelete; 0)
		AA_t_NewListItem:=""
		AA_l_CurrentItemID:=0
		AA_t_AddorModLabel:="Enter New Item"
		ARRAY TEXT:C222(AA_at_PropertyListPropertyNames; 0; 0)
		ARRAY LONGINT:C221(AA_al_listPropertiesNUM; 0; 0)
		ARRAY TEXT:C222(AA_at_listPropertiesSTR; 0; 0)
		ARRAY TEXT:C222(AA_at_PropertiesListProperties; 0)
		ARRAY TEXT:C222(AA_at_ListPropertyTypes; 0)
		ARRAY LONGINT:C221(AA_al_ListPropTypesID; 0)
		//`````
		ARRAY TEXT:C222(AA_at_ListProperties; 0)
		ARRAY LONGINT:C221(AA_al_ListPropertyIDs; 0)
		ARRAY LONGINT:C221(AA_al_ListPropertySublists; 0)
		ARRAY TEXT:C222(AA_at_PropertyListPropertyNames; 0; 0)
		ARRAY LONGINT:C221(AA_al_ListPropertyNum; 0; 0)
		ARRAY TEXT:C222(AA_at_ListPropertySTR; 0; 0)
		ARRAY TEXT:C222(AA_at_PropertiesListProperties; 0)
		$_l_ListID:=AA_LoadListByName("List Properties"; ->AA_at_ListProperties; ->AA_al_ListPropertyIDs; False:C215; ->AA_at_PropertiesListProperties; ->AA_at_PropertyListPropertyNames; ->AA_al_ListPropertyNum; ->AA_at_listPropertiesSTR)
		ARRAY LONGINT:C221(AA_al_ListPropertySublists; Size of array:C274(AA_at_ListProperties))
		//this is a list of all the properties as defined by the designer
		If (Size of array:C274(AA_at_ListProperties)=0)  //1
			
			
			//mm first loading!!!
			$_l_Num:=0
			//so need to set the list properties up
			$_l_Num:=$_l_Num ?+ 3
			$_l_Num:=$_l_Num ?+ 4
			READ WRITE:C146([X_LISTS:111])
			QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="List Properties")
			//this means on the designer can see the list
			AA_SetListProperty("ACCESS"; $_l_Num)
			DB_SaveRecord(->[X_LISTS:111])
			AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
			//Get the SubList Ids
			
		End if   //end 1
		
		
		AA_SetupProperties
		For ($_l_Index; 1; Size of array:C274(AA_at_PropertiesListProperties))  //F2
			
			
			//->AA_at_PropertyListPropertyNames;->AA_al_ListPropertyNum;->AA_at_ListPropertySTR
			$_l_PropertyRow:=Find in array:C230(AA_at_PropertyListPropertyNames{$_l_Index}; "SUBLIST")
			If ($_l_PropertyRow>0)
				$_l_SublistListNum:=AA_al_ListPropertyNum{$_l_Index}{$_l_PropertyRow}
				AA_al_ListPropertySublists{$_l_Index}:=$_l_SublistListNum
			Else 
				$_l_SUblistPosition:=Position:C15("SUBLIST:"; AA_at_PropertiesListProperties{$_l_Index})
				If ($_l_SUblistPosition>0)  //I3
					
					
					//the sublist exisits so get the ID
					$_t_Sublist:=Substring:C12(AA_at_PropertiesListProperties{$_l_Index}; $_l_SUblistPosition+Length:C16("SUBLIST:"); Length:C16(AA_at_PropertiesListProperties{$_l_Index}))
					
					$_l_EndofLinePosition:=Position:C15(Char:C90(13); $_t_Sublist)
					If ($_l_EndofLinePosition>0)  //i4
						
						
						$_t_Sublist:=Substring:C12($_t_Sublist; 1; $_l_EndofLinePosition-1)
					End if   //end i4
					
					
					AA_al_ListPropertySublists{$_l_Index}:=Num:C11($_t_Sublist)
				End if 
			End if   //i3
		End for   //F2
		
		
		
		
		
		
		
		//``````
		//AA_at_ListPropertyTypes
		//property ids
		//proprty values
		ARRAY TEXT:C222(AA_at_APropertyNames; 0)
		ARRAY LONGINT:C221(AA_al_aPropertyNum; 0)
		ARRAY TEXT:C222(AA_at_aPropertyValue; 0)
		AA_GetListProperties(->AA_at_APropertyNames; ->AA_al_aPropertyNum; ->AA_at_aPropertyValue)
		$_l_SubReference:=Find in array:C230(AA_at_APropertyNames; "ACCESS")
		If ($_l_SubReference>0)
			$_l_Access:=AA_al_aPropertyNum{$_l_SubReference}
		Else 
			$_l_Access:=0
		End if 
		ARRAY TEXT:C222(AA_at_ListPropertyTypes; 0)
		ARRAY LONGINT:C221(AA_al_ListPropTypesID; 0)
		
		//````````
		For ($_l_Index; 1; Size of array:C274(AA_at_APropertyNames))  //F8²
			
			
			$_l_PropertyID:=AA_al_aPropertyNum{$_l_Index}
			//`````
			If ($_l_PropertyID>0)
				$_l_PropertyPosition:=Find in array:C230(AA_al_ListPropertyIDs; $_l_PropertyID)
				If ($_l_PropertyPosition>0)
					APPEND TO ARRAY:C911(AA_al_ListPropTypesID; $_l_PropertyID)
					APPEND TO ARRAY:C911(AA_at_ListPropertyTypes; AA_at_ListProperties{$_l_PropertyPosition})
				End if 
				
				
			End if 
			//````
		End for 
		$_l_ListID:=AA_LoadListByName($_t_ListName; ->AA_at_ListItems; ->AA_al_ListItemIDs; False:C215; ->AA_at_PropertiesListProperties; ->AA_at_PropertyListPropertyNames; ->AA_al_listPropertiesNUM; ->AA_at_listPropertiesSTR)
		$_l_Retries:=0
		While (Semaphore:C143("$LoadingListofLists"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End while 
		$_t_oldMethodName2:=ERR_MethodTracker("SEM:Owned by"+"FM Display_listDialogue(2)")
		$_l_ListRow:=Find in array:C230(<>WS_al_ListIDS; $_l_ListID)
		
		ARRAY TEXT:C222(AA_at_ListPropertyTypes; Size of array:C274(AA_al_listPropertiesNUM))
		ARRAY LONGINT:C221(AA_al_ListPropTypesID; Size of array:C274(AA_al_listPropertiesNUM))
		For ($_l_Index; 1; Size of array:C274(AA_al_listPropertiesNUM))
			//$_l_PropertyID:=AA_al_listPropertiesNUM{$_l_Index}<--this is wrong
			If ($_l_PropertyID>0)
				$_l_PropertyPosition:=Find in array:C230(AA_al_ListPropertyIDs; $_l_PropertyID)
				If ($_l_PropertyPosition>0)  //i9²
					AA_al_ListPropTypesID{$_l_Index}:=$_l_PropertyID
					AA_at_ListPropertyTypes{$_l_Index}:=AA_at_ListProperties{$_l_PropertyPosition}
				End if   //endi9
			End if 
			
		End for   //end F8
		
		
		CLEAR SEMAPHORE:C144("$LoadingListofLists")
		ARRAY LONGINT:C221(AA_al_2DItemAttributesLIstID; 0; 0)
		ARRAY LONGINT:C221(AA_al_2DItemAttributes; 0; 0)
		ARRAY TEXT:C222(AA_at_2DItemAttributesLIstNM; 0; 0)
		ARRAY TEXT:C222(AA_at_2DItemAttributes; 0; 0)
		ARRAY LONGINT:C221(AA_al_2DItemAttributesLIstID; Size of array:C274(AA_al_ListItemIDs); 0)
		ARRAY LONGINT:C221(AA_al_2DItemAttributes; Size of array:C274(AA_al_ListItemIDs); 0)
		ARRAY TEXT:C222(AA_at_2DItemAttributesLIstNM; Size of array:C274(AA_al_ListItemIDs); 0)
		ARRAY TEXT:C222(AA_at_2DItemAttributes; Size of array:C274(AA_al_ListItemIDs); 0)
		
		If (Size of array:C274(AA_al_ListPropertySublists)=0)
			OBJECT SET VISIBLE:C603(*; "Text_Properties"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Text_Properties2"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Text_Properties3"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Text_Properties4"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Pict_Properties"; False:C215)
			OBJECT SET VISIBLE:C603(AA_at_ListItemPropertyTypes; False:C215)
			OBJECT SET VISIBLE:C603(AA_at_ListItemvalue; False:C215)
			OBJECT SET VISIBLE:C603(AA_t_SelectedProperty; False:C215)
			OBJECT SET VISIBLE:C603(WS_t_selectedListItemvalue; False:C215)
			OBJECT SET VISIBLE:C603(AA_at_PropertyValues; False:C215)
		Else 
			For ($_l_Index; 1; Size of array:C274(AA_at_PropertiesListProperties))
				//the properties for this item are now found so store them in the 2D array
				//INSERT IN ARRAY(AA_al_2DItemAttributesLIstID{$_l_Index}; 1; AA_al_listPropertiesNUM{$_l_Index})<--This is wrong
				//INSERT IN ARRAY(AA_al_2DItemAttributes{$_l_Index}; 1; AA_al_listPropertiesNUM{$_l_Index}))<--This is wrong
				//INSERT IN ARRAY(AA_at_2DItemAttributesLIstNM{$_l_Index}; 1; AA_al_listPropertiesNUM{$_l_Index}))<--This is wrong
				//INSERT IN ARRAY(AA_at_2DItemAttributes{$_l_Index}; 1; AA_al_listPropertiesNUM{$_l_Index}))<--This is wrong
				//$_l_ReferenceA:=Find in array(AA_al_ListPropertyIDs; AA_al_listPropertiesNUM{$_l_Index}))<--This is wrong
				If ($_l_ReferenceA>0)  //it should be
					
					
					$_t_PropertyName:=AA_at_ListProperties{$_l_ReferenceA}
					//$PropertyListID
					For ($_l_Index2; 1; Size of array:C274(AA_at_PropertyListPropertyNames{$_l_Index}))  //F30²
						
						
						
						If (AA_at_PropertyListPropertyNames{$_l_Index}{$_l_Index2}="SUBLIST")
							AA_al_2DItemAttributesLIstID{$_l_Index}{$_l_Index2}:=AA_al_listPropertiesNUM{$_l_Index}{$_l_Index2}
							AA_at_2DItemAttributesLIstNM{$_l_Index}{$_l_Index2}:=AA_at_listPropertiesSTR{$_l_Index}{$_l_Index2}
						Else 
							AA_al_2DItemAttributes{$_l_Index}{$_l_Index2}:=AA_al_listPropertiesNUM{$_l_Index}{$_l_Index2}
							AA_at_2DItemAttributes{$_l_Index}{$_l_Index2}:=AA_at_PropertyListPropertyNames{$_l_Index}{$_l_Index2}
						End if 
						
						
					End for   //end F30
					
					
					
					//End for
					
				End if 
			End for 
			
			ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; 0)
			ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; 0)
			ARRAY TEXT:C222(AA_at_ListItemvalue; 0)
			ARRAY LONGINT:C221(AA_al_ListItemvalue; 0)
			AA_t_SelectedProperty:=""
			WS_t_selectedListItemvalue:=""
			//``WE are adding a new item and need the properties set up
			$_l_ArraySize:=Size of array:C274(AA_at_ListPropertyTypes)
			ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; $_l_ArraySize)
			ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; $_l_ArraySize)
			ARRAY TEXT:C222(AA_at_ListItemvalue; $_l_ArraySize)
			ARRAY LONGINT:C221(AA_al_ListItemvalue; $_l_ArraySize)
			$_l_CUrrentItemPosition:=Find in array:C230(AA_al_ListItemIDs; AA_l_CurrentItemID)
			For ($_l_Index; 1; Size of array:C274(AA_at_ListItemPropertyTypes))
				AA_al_ListItemPropertyTypes{$_l_Index}:=AA_al_ListPropTypesID{$_l_Index}
				AA_at_ListItemPropertyTypes{$_l_Index}:=AA_at_ListPropertyTypes{$_l_Index}
			End for 
			
		End if 
		
		//AA_LB_Listitems
		$_l_TotalWidth:=0
		
		LB_SetupListbox(->AA_LB_Listitems; "AAL_S55"; "AAL_L"; 1; ->AA_at_ListItems; ->AA_al_ListItemIDs; ->AA_at_ListPropertyTypes; ->AA_al_ListPropTypesID)
		LB_SetColumnHeaders(->AA_LB_Listitems; "AAL_L"; 1; "Items"; "ID"; "Properties"; "Properties ID")
		LB_SetColumnWidths(->AA_LB_Listitems; "AAL_S55"; 1; 290; 0; 0; 0)
		LB_SetEnterable(->AA_LB_Listitems; False:C215; 0)
		LB_SetEnterable(->AA_LB_Listitems; True:C214; 1)
		LB_SetScroll(->AA_LB_Listitems; -3; -2)
		LB_StyleSettings(->AA_LB_Listitems; "Black"; 9; "AAL_S55"; ->[ACCOUNTS:32]; 0)
		LB_Setdividers(->AA_LB_Listitems; 0; 0)
		$_l_ListItemSize:=Size of array:C274(AA_at_ListItems)+1
		//ARRAY STRING(55;$_at_ColumnNames;0)
		INSERT IN ARRAY:C227(AA_at_ListItems; $_l_ListItemSize; 1)
		INSERT IN ARRAY:C227(AA_al_ListItemIDs; $_l_ListItemSize; 1)
		INSERT IN ARRAY:C227(AA_at_ListPropertyTypes; $_l_ListItemSize; 1)
		INSERT IN ARRAY:C227(AA_al_ListPropTypesID; $_l_ListItemSize; 1)
		
		//ARRAY STRING(55;$_at_HeaderNames;0)
		//ARRAY POINTER($_aptr_ColumnVariables;0)
		//ARRAY POINTER($_aptr_HeaderVariables;0)
		//ARRAY BOOLEAN($_abo_ColumnsVisible;0)
		//ARRAY POINTER($_aptr_ColumnStyles;0)
		
		//LISTBOX GET ARRAYS(AA_LB_Listitems;$_at_ColumnNames;$_at_HeaderNames;$_aptr_ColumnVariables;$_aptr_HeaderVariables;$_abo_ColumnsVisible;$_aptr_ColumnStyles)
		
		//LISTBOX INSERT ROW(*;"oLBlistItems";$_l_ListItemSize)
		//$ColumnPt:=$_aptr_ColumnVariables{1}
		GOTO OBJECT:C206(AA_at_ListItems)
		
		//
		
		ARRAY LONGINT:C221(AA_al_ListItemsDelete; Size of array:C274(AA_at_ListItems))
		QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_LoadedListID)
		//GOTO OBJECT(AA_t_NewListItem)
		
		INT_SetDialog
		//CALL PROCESS(Current process)
		$_l_arraySize:=Size of array:C274(AA_at_ListItems)
		EDIT ITEM:C870(AA_at_ListItems; $_l_arraySize)
		
		
	: ($_l_Event=On Outside Call:K2:11)
		
		
		
		$_l_arraySize:=Size of array:C274(AA_at_ListItems)
		EDIT ITEM:C870(AA_at_ListItems; $_l_arraySize)
		
	: ($_l_Event=On Resize:K2:27)
		
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:Display_list_Dialogue"; $_t_oldMethodName)
