If (False:C215)
	//object Name: [USER]List_Manager.Variable9
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
	C_LONGINT:C283($_l_event; $_l_ItemReference; $_l_ListItemRow; $_l_SelectedListItem; $_l_SublistID; AA_HL_ListItems)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; AA_t_CurrentListItem)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.Variable9"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		
		$_l_SelectedListItem:=Selected list items:C379(AA_HL_ListItems)
		If ($_l_SelectedListItem>0)
			GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
			$_l_ListItemRow:=Find in array:C230(AA_al_ItemIDsModified; $_l_ItemReference)
			If ($_l_ListItemRow<0)
				INSERT IN ARRAY:C227(AA_al_ItemIDsModified; Size of array:C274(AA_al_ItemIDsModified)+1; 1)
				AA_al_ItemIDsModified{Size of array:C274(AA_al_ItemIDsModified)}:=$_l_ItemReference
			End if 
			
			SET LIST ITEM:C385(AA_HL_ListItems; $_l_ItemReference; AA_t_CurrentListItem; $_l_ItemReference; $_l_SublistID; False:C215)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].List_Manager.Variable9"; $_t_oldMethodName)
