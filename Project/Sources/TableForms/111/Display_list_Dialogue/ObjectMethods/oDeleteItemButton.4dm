If (False:C215)
	//object Name: [X_LISTS]Display_list_Dialogue.oDeleteButton
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
	//ARRAY LONGINT(AA_al_2DItemAttributes;0)
	//ARRAY LONGINT(AA_al_2DItemAttributesLIstID;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListItemsDelete;0)
	//ARRAY TEXT(AA_at_2DItemAttributes;0)
	//ARRAY TEXT(AA_at_2DItemAttributesLIstNM;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	C_LONGINT:C283($_l_BlankRow; AA_l_CurrentItemID)
	C_TEXT:C284($_t_oldMethodName; AA_t_NewListItem)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [X_LISTS].Display_list_Dialogue.Button2"; Form event code:C388)
If (AA_l_CurrentItemID>0)
	//adding new record
	Gen_Confirm("Delete "+AA_at_ListItems{Find in array:C230(AA_al_ListItemIDs; AA_l_CurrentItemID)}+" This cannot be undone"; "No"; "Delete")
	If (OK=0)
		$_l_BlankRow:=Find in array:C230(AA_al_ListItemsDelete; 0)
		If ($_l_BlankRow>0)
			AA_al_ListItemsDelete{$_l_BlankRow}:=AA_l_CurrentItemID
		End if 
		$_l_BlankRow:=Find in array:C230(AA_al_ListItemIDs; AA_l_CurrentItemID)
		If ($_l_BlankRow>0)
			DELETE FROM ARRAY:C228(AA_al_ListItemIDs; $_l_BlankRow)
			DELETE FROM ARRAY:C228(AA_at_ListItems; $_l_BlankRow)
			DELETE FROM ARRAY:C228(AA_al_2DItemAttributesLIstID; $_l_BlankRow; 1)
			DELETE FROM ARRAY:C228(AA_al_2DItemAttributes; $_l_BlankRow; 1)
			DELETE FROM ARRAY:C228(AA_at_2DItemAttributesLIstNM; $_l_BlankRow; 1)
			DELETE FROM ARRAY:C228(AA_at_2DItemAttributes; $_l_BlankRow; 1)
		End if 
		AA_t_NewListItem:=""
		AA_l_CurrentItemID:=0
		AA_at_ListItems:=0
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Display_list_Dialogue,BDelItem"; $_t_oldMethodName)
