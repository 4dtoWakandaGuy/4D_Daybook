If (False:C215)
	//object Name: [USER]List_Manager.Button15
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
	//ARRAY LONGINT(AA_al_ItemIDsModified;0)
	C_LONGINT:C283($_l_CurrentSelectedItemID; $_l_ItemReference; $_l_ListItemRow; $_l_SelectedListItem; $_l_SubListID; AA_HL_ListItems; AA_l_CurrentSelectedItemID)
	C_TEXT:C284($_t_itemText; $_t_oldMethodName; AA_t_CurrentListItem)
End if 
//Code Starts Here




$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.Button15"; Form event code:C388)
AA_LMA_NewSubListItem
If (AA_l_CurrentSelectedItemID#0)
	$_l_CurrentSelectedItemID:=AA_l_CurrentSelectedItemID
	SELECT LIST ITEMS BY REFERENCE:C630(AA_HL_ListItems; AA_l_CurrentSelectedItemID)
	$_l_SelectedListItem:=Selected list items:C379(AA_HL_ListItems)
	GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_itemText; $_l_SubListID)
	$_l_ListItemRow:=Find in array:C230(AA_al_ItemIDsModified; $_l_ItemReference)
	If ($_l_ListItemRow<0)
		INSERT IN ARRAY:C227(AA_al_ItemIDsModified; Size of array:C274(AA_al_ItemIDsModified)+1; 1)
		AA_al_ItemIDsModified{Size of array:C274(AA_al_ItemIDsModified)}:=$_l_ItemReference
	End if 
	AA_LoadListItemtoManager($_l_ItemReference)
	AA_t_CurrentListItem:=$_t_itemText
End if 
ERR_MethodTrackerReturn("OBJ [USER].List_Manager.Button15"; $_t_oldMethodName)
