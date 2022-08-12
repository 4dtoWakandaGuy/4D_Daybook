If (False:C215)
	//object Method Name:      AA_at_PropertyValues
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 23:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_ListPropertySublists;0)
	//ARRAY LONGINT(WS_al_PropertyValues;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_PropertyValues;0)
	C_BOOLEAN:C305($_bo_Update)
	C_LONGINT:C283($_l_AccessNum; $_l_Event; $_l_offset; $_l_PropertyRow; $_l_ProperyListRow; $_l_SublistID)
	C_TEXT:C284($_t_oldMethodName; AA_t_SelectedProperty; WS_t_selectedListItemvalue)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [X_LISTS].Display_list_Dialogue.Variable12"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		If (AA_at_PropertyValues>0)
			If (WS_al_PropertyValues{AA_at_PropertyValues}>0)
				WS_t_selectedListItemvalue:=AA_at_PropertyValues{AA_at_PropertyValues}
			Else 
				If (AA_at_PropertyValues=Size of array:C274(AA_at_PropertyValues))
					//add item
					$_l_PropertyRow:=Find in array:C230(AA_at_ListItemPropertyTypes; AA_t_SelectedProperty)
					If ($_l_PropertyRow>0)
						//need the sublist reference for that
						$_l_ProperyListRow:=Find in array:C230(AA_al_ListPropertyIDs; AA_al_ListItemPropertyTypes{$_l_PropertyRow})
						$_l_SublistID:=AA_al_ListPropertySublists{$_l_ProperyListRow}
						If ($_l_SublistID=0)
							//no sublist currently exists-so we have to add one and update the list
							READ WRITE:C146([X_LISTS:111])
							CREATE RECORD:C68([X_LISTS:111])
							[X_LISTS:111]x_ListName:2:=AA_at_ListItemPropertyTypes{$_l_PropertyRow}
							$_l_AccessNum:=0
							$_l_AccessNum:=$_l_AccessNum ?+ 5
							AA_SetListProperty("ACCESS"; $_l_AccessNum)
							DB_SaveRecord(->[X_LISTS:111])
							AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
							
							$_l_SublistID:=[X_LISTS:111]x_ID:1
							READ WRITE:C146([LIST_ITEMS:95])
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AA_al_ListItemPropertyTypes{$_l_PropertyRow})
							$_l_offset:=0
							
							AA_SetListItemProperty("SUBLIST"; $_l_SublistID)
							DB_SaveRecord(->[LIST_ITEMS:95])
							AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
							AA_al_ListPropertySublists{$_l_ProperyListRow}:=$_l_SublistID
							UNLOAD RECORD:C212([LIST_ITEMS:95])
							UNLOAD RECORD:C212([X_LISTS:111])
							READ ONLY:C145([LIST_ITEMS:95])
							READ ONLY:C145([X_LISTS:111])
							
						End if 
						
						$_bo_Update:=AA_ListPropertiesUpdate($_l_SublistID; AA_t_SelectedProperty; True:C214)
						
						If ($_bo_Update)
							AA_LoadListbyID($_l_SublistID; ->AA_at_PropertyValues; ->WS_al_PropertyValues; True:C214)
							AA_at_PropertyValues:=0
						End if 
					End if 
				End if 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [X_LISTS].Display_list_Dialogue.Variable12"; $_t_oldMethodName)
