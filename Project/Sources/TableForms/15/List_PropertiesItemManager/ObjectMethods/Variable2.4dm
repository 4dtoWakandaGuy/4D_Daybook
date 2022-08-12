If (False:C215)
	//object Name: [USER]List_PropertiesItemManager.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_PropertyItemsID;0)
	//ARRAY LONGINT(AA_at_PropertyItemActionCodes;0)
	//ARRAY TEXT(AA_at_PropertyItems;0)
	//ARRAY TEXT(AA_at_PropertyItemsProperties;0)
	//ARRAY TEXT(AA_at_PropertyItemAction;0)
	C_BOOLEAN:C305(AA_bo_SavePropertiesITEMS)
	C_LONGINT:C283($_l_index; $_l_PropertyPosition; AA_l_CurrentSelectItemID; AA_l_LoadPropertyItemsListID; AA_l_PropertyCurItemActionCode)
	C_TEXT:C284($_t_oldMethodName; $_t_PropertyAction; AA_t_PropertyCurrentItem; AA_t_PropertyCurrentItemAction)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_PropertiesItemManager.Variable2"; Form event code:C388)
If (AA_t_PropertyCurrentItem#"")
	
	CONFIRM:C162("Save "+AA_t_PropertyCurrentItem)
	If (OK=1)
		If (AA_l_CurrentSelectItemID=0)
			//new item
			INSERT IN ARRAY:C227(AA_at_PropertyItems; Size of array:C274(AA_at_PropertyItems)+1; 1)
			INSERT IN ARRAY:C227(AA_at_PropertyItemAction; Size of array:C274(AA_at_PropertyItemAction)+1; 1)
			INSERT IN ARRAY:C227(AA_al_PropertyItemsID; Size of array:C274(AA_al_PropertyItemsID)+1; 1)
			INSERT IN ARRAY:C227(AA_at_PropertyItemsProperties; Size of array:C274(AA_at_PropertyItemsProperties)+1; 1)
			INSERT IN ARRAY:C227(AA_at_PropertyItemActionCodes; Size of array:C274(AA_at_PropertyItemActionCodes)+1; 1)
			AA_at_PropertyItems{Size of array:C274(AA_at_PropertyItems)}:=AA_t_PropertyCurrentItem
			AA_at_PropertyItemAction{Size of array:C274(AA_at_PropertyItemAction)}:=AA_t_PropertyCurrentItemAction
			AA_al_PropertyItemsID{Size of array:C274(AA_al_PropertyItemsID)}:=-Size of array:C274(AA_al_PropertyItemsID)  //temp number
			AA_at_PropertyItemActionCodes{Size of array:C274(AA_at_PropertyItemActionCodes)}:=AA_l_PropertyCurItemActionCode
			
		Else 
			$_l_PropertyPosition:=Find in array:C230(AA_al_PropertyItemsID; AA_l_CurrentSelectItemID)
			If ($_l_PropertyPosition>0)  //it should be
				AA_at_PropertyItems{$_l_PropertyPosition}:=AA_t_PropertyCurrentItem
				AA_at_PropertyItemAction{$_l_PropertyPosition}:=AA_t_PropertyCurrentItemAction
				AA_at_PropertyItemActionCodes{$_l_PropertyPosition}:=AA_l_PropertyCurItemActionCode
			End if 
			
		End if 
	End if 
	
End if 
//now save the list entries
For ($_l_index; 1; Size of array:C274(AA_al_PropertyItemsID))
	If (AA_al_PropertyItemsID{$_l_index}<0)
		//this item does not exist
		AA_al_PropertyItemsID{$_l_index}:=AA_ListAddItembyID(AA_l_LoadPropertyItemsListID; AA_at_PropertyItems{$_l_index})
		//now save the "CODE"
		If (AA_at_PropertyItemAction{$_l_index}#"")
			$_t_PropertyAction:="CODE:"+String:C10(AA_at_PropertyItemActionCodes{$_l_index})
			READ WRITE:C146([LIST_ITEMS:95])
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AA_al_PropertyItemsID{$_l_index})
			AA_SetListItemProperty("CODE"; AA_at_PropertyItemActionCodes{$_l_index})
			//currently this is the only thing that can be stored in a property item
			//it will change
			//when that happens this will need to take account of that
			DB_SaveRecord(->[LIST_ITEMS:95])
			AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
			UNLOAD RECORD:C212([LIST_ITEMS:95])
		End if 
		
	End if 
End for 
AA_bo_SavePropertiesITEMS:=True:C214

CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].List_PropertiesItemManager.Variable2"; $_t_oldMethodName)