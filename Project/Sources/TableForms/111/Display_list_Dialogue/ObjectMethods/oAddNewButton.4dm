If (False:C215)
	//object Method Name: Object Name:      [X_LISTS].Display_list_Dialogue.Variable2
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
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListPropTypesID;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_ListPropertyTypes;0)
	C_BOOLEAN:C305(WS_bo_listEdited)
	C_LONGINT:C283($_l_AddRowPosition; $_l_event; $_l_ListItemsCount; $_l_ListItemsRow; WS_l_CurrentItemROW)
	C_TEXT:C284($_t_oldMethodName; AA_t_NewListItem)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [X_LISTS]Display_list_Dialogue.oAddNewButton"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (AA_at_ListItems{Size of array:C274(AA_at_ListItems)}#"")
			Gen_Confirm("Save "+AA_t_NewListItem+"?"; "Save"; "Clear")
			If (OK=1)
				$_l_ListItemsRow:=Find in array:C230(AA_at_ListItems; AA_at_ListItems{Size of array:C274(AA_at_ListItems)})
				If ($_l_ListItemsRow<Size of array:C274(AA_at_ListItems))
					Gen_Alert(AA_t_NewListItem+" Already exists. It cannot be added twice.")
					AA_at_ListItems{Size of array:C274(AA_at_ListItems)}:=""
				Else 
					AA_al_ListItemIDs{WS_l_CurrentItemROW}:=-Size of array:C274(AA_al_ListItemIDs)
					WS_bo_listEdited:=True:C214
					$_l_AddRowPosition:=Size of array:C274(AA_at_ListItems)+1
					INSERT IN ARRAY:C227(AA_at_ListItems; $_l_AddRowPosition; 1)
					INSERT IN ARRAY:C227(AA_al_ListItemIDs; $_l_AddRowPosition; 1)
					INSERT IN ARRAY:C227(AA_at_ListPropertyTypes; $_l_AddRowPosition; 1)
					INSERT IN ARRAY:C227(AA_al_ListPropTypesID; $_l_AddRowPosition; 1)
					
					
				End if 
			Else 
				AA_at_ListItems{Size of array:C274(AA_at_ListItems)}:=""
			End if 
		Else 
			$_l_AddRowPosition:=Size of array:C274(AA_at_ListItems)+1
			//INSERT IN ARRAY(AA_at_ListItems;$_l_AddRowPosition;1)
			//INSERT IN ARRAY(AA_al_ListItemIDs;$_l_AddRowPosition;1)
			//INSERT IN ARRAY(AA_at_ListPropertyTypes;$_l_AddRowPosition;1)
			//INSERT IN ARRAY(AA_al_ListPropTypesID;$_l_AddRowPosition;1)
			
		End if 
		
		$_l_ListItemsCount:=Size of array:C274(AA_at_ListItems)
		//LISTBOX SELECT ROW(AA_at_ListItems;$_l_ListItemsCount)
		//GOTO OBJECT(AA_at_ListItems{$_l_ListItemsCount})
		EDIT ITEM:C870(AA_at_ListItems; $_l_ListItemsCount)
		
		
End case 
ERR_MethodTrackerReturn("OBJ [X_LISTS].Display_list_Dialogue.Variable2"; $_t_oldMethodName)
