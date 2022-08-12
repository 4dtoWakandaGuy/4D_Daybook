//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LoadListItemProperty
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2010 17:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ListPropertyNUM; 0)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_ListPropertiesNUM;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(WS_al_PropertyValues;0)
	ARRAY TEXT:C222($_at_ListPropertiesSTR; 0)
	ARRAY TEXT:C222($_at_ListPropertyTypes; 0)
	//ARRAY TEXT(AA_at_2DListPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItemvalue;0)
	//ARRAY TEXT(AA_at_PropertyValues;0)
	C_LONGINT:C283($_l_AttributeNum; $_l_PropertyRow; $_l_PropertyTypeRow; $_l_SublistID; $_l_SublistRef; $1; AA_l_CurrentSelectedProperty)
	C_TEXT:C284($_t_oldMethodName; AA_t_SelectedProperty; WS_t_selectedListItemvalue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LoadListItemProperty")
//this will load the current value and the pop up of values for that list

If (Count parameters:C259>=1)
	If ($1>0)
		$_l_PropertyTypeRow:=Find in array:C230(AA_al_ListItemPropertyTypes; $1)
		AA_t_SelectedProperty:=AA_at_ListItemPropertyTypes{$_l_PropertyTypeRow}
		//this is the property
		AA_l_CurrentSelectedProperty:=$_l_PropertyTypeRow
		WS_t_selectedListItemvalue:=AA_at_ListItemvalue{$_l_PropertyTypeRow}
		$_l_PropertyRow:=Find in array:C230(AA_al_ListPropertyIDs; $1)
		If ($_l_PropertyRow>0)
			$_l_SublistRef:=Find in array:C230(AA_at_2DListPropertyTypes{$_l_PropertyRow}; "SUBLIST")  ///AA_aS55_ListPropertyTypes
			If ($_l_SublistRef>0)
				$_l_SublistID:=AA_al_ListPropertiesNUM{$_l_PropertyRow}{$_l_SublistRef}
				ARRAY TEXT:C222(AA_at_PropertyValues; 0)  //these get populated when you select  and item
				ARRAY LONGINT:C221(WS_al_PropertyValues; 0)  //these get populated when you select  and item
				If ($_l_SublistID>0)
					AA_LoadListbyID($_l_SublistID; ->AA_at_PropertyValues; ->WS_al_PropertyValues; True:C214)
				Else 
					ARRAY TEXT:C222(AA_at_PropertyValues; 1)  //these get populated when you select  and item
					ARRAY LONGINT:C221(WS_al_PropertyValues; 1)  //these get populated when you select  and item
					AA_at_PropertyValues{1}:="Add Item"
					
				End if 
				AA_at_PropertyValues:=0
			Else 
				
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$1)
				If (BLOB size:C605([LIST_ITEMS:95]X_Revised_Attributes:9)>0)
					ARRAY TEXT:C222($_at_ListPropertyTypes; 0)
					ARRAY LONGINT:C221($_al_ListPropertyNUM; 0)
					ARRAY TEXT:C222($_at_ListPropertiesSTR; 0)
					AA_GetListItemProperties(->$_at_ListPropertyTypes; ->$_al_ListPropertyNUM; ->$_at_ListPropertiesSTR)
					//Change to the way this all works.
					//Properties List items are special items-only accessible to the designer
					//They describe a property of a list item and the property types are pre-prescibed. They must be read and used by code
					//NOT by user code. The property ITEMS(available settings) must therefore will not be built from a sublist, because the IDS(for example table numbers) or special meanings of the items cannot be
					//random' numbers so cant be from a list.
					//the 'pop-up' of available 'property values' does not neccessarily contain the whole list.
					//the WHOLE list if defined either by code (as in the case of Default actions or calculated.(as in the case of table numbers). The current available list of properties for a given list
					//are stored in a [preference] record where the OWNER is always -1(system) the ID number=the number of the LIST(list ID) and the blob contains the values for each assigned property.
					//Against the item then the properties contain the ID of the item and ID from the list of properties.
					
					
					$_l_SublistRef:=Find in array:C230($_at_ListPropertyTypes; "SUBLIST")
					If ($_l_SublistRef>0)
						$_l_SublistID:=$_al_ListPropertyNUM{$_l_SublistRef}
						ARRAY TEXT:C222(AA_at_PropertyValues; 0)  //these get populated when you select  and item
						ARRAY LONGINT:C221(WS_al_PropertyValues; 0)  //these get populated when you select  and item
						If ($_l_SublistID<0)
							CREATE RECORD:C68([X_LISTS:111])
							[X_LISTS:111]x_ListName:2:=AA_t_SelectedProperty
							$_l_AttributeNum:=0 ?+ 5
							AA_SetListProperty("ACCESS"; $_l_AttributeNum)
							DB_SaveRecord(->[X_LISTS:111])
							$_l_SublistID:=[X_LISTS:111]x_ID:1
							AA_SetListItemProperty("SUBLIST"; $_l_SublistID)
						End if 
						AA_LoadListbyID($_l_SublistID; ->AA_at_PropertyValues; ->WS_al_PropertyValues; True:C214)
						AA_ValidatePropertySublist($_l_SublistID; AA_t_SelectedProperty; ->AA_at_PropertyValues; ->WS_al_PropertyValues)
					End if 
					
					
					AA_at_PropertyValues:=0
					
				End if 
				
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("AA_LoadListItemProperty"; $_t_oldMethodName)
