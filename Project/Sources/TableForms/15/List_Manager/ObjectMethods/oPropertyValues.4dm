If (False:C215)
	//object Method Name:      AA_at_PropertyValues
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 00:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_ListPropertiesNUM;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(WS_al_PropertyValues;0)
	//ARRAY TEXT(AA_at_2DListPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListPropertyTypes;0)
	//ARRAY TEXT(AA_at_PropertyValues;0)
	C_BOOLEAN:C305($_bo_Update)
	C_LONGINT:C283($_l_AccessNum; $_l_event; $_l_ListRow; $_l_offset; $_l_PropertyRow; $_l_SublistColumn; $_l_subListID)
	C_TEXT:C284($_t_oldMethodName; AA_t_SelectedProperty; WS_t_selectedListItemvalue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.Variable4"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (AA_at_PropertyValues>0)
			If (WS_al_PropertyValues{AA_at_PropertyValues}>0)
				WS_t_selectedListItemvalue:=AA_at_PropertyValues{AA_at_PropertyValues}
			Else 
				If (AA_at_PropertyValues=Size of array:C274(AA_at_PropertyValues))
					//add item
					$_l_PropertyRow:=Find in array:C230(AA_at_ListItemPropertyTypes; AA_t_SelectedProperty)
					If ($_l_PropertyRow>0)
						//need the sublist reference for that
						$_l_subListID:=0
						$_l_ListRow:=Find in array:C230(AA_al_ListPropertyIDs; AA_al_ListItemPropertyTypes{$_l_PropertyRow})
						If ($_l_ListRow>0)
							$_l_SublistColumn:=Find in array:C230(AA_at_2DListPropertyTypes{$_l_ListRow}; "SUBLIST")
							If ($_l_SublistColumn>0)
								$_l_subListID:=AA_al_ListPropertiesNUM{$_l_ListRow}{$_l_SublistColumn}
							End if 
						End if 
						If ($_l_subListID=0)
							//no sublist currently exists-so we have to add one and update the list
							READ WRITE:C146([X_LISTS:111])
							CREATE RECORD:C68([X_LISTS:111])
							[X_LISTS:111]x_ListName:2:=AA_at_ListItemPropertyTypes{$_l_PropertyRow}
							$_l_AccessNum:=0
							$_l_AccessNum:=$_l_AccessNum ?+ 5
							AA_SetListProperty("ACCESS"; $_l_AccessNum)
							DB_SaveRecord(->[X_LISTS:111])
							AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
							$_l_subListID:=[X_LISTS:111]x_ID:1
							READ WRITE:C146([LIST_ITEMS:95])
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AA_al_ListItemPropertyTypes{$_l_PropertyRow})
							$_l_offset:=0
							AA_SetListItemProperty("SUBLIST"; $_l_subListID)
							
							
							DB_SaveRecord(->[LIST_ITEMS:95])
							AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
							//AA_al_ListPropertySublists{$_l_ListRow}:=$_l_subListID
							
							
							UNLOAD RECORD:C212([LIST_ITEMS:95])
							UNLOAD RECORD:C212([X_LISTS:111])
							READ ONLY:C145([LIST_ITEMS:95])
							READ ONLY:C145([X_LISTS:111])
							
						End if 
						
						$_bo_Update:=AA_ListPropertiesUpdate($_l_subListID; AA_t_SelectedProperty; True:C214)
						
						If ($_bo_Update)
							AA_LoadListbyID($_l_subListID; ->AA_at_PropertyValues; ->WS_al_PropertyValues; True:C214)
							AA_at_PropertyValues:=0
						End if 
					End if 
				End if 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:List_Manager,AA_at_PropertyValues"; $_t_oldMethodName)
