If (False:C215)
	//object Name: [USER]WS_SetManager.Check Box1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2011 20:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SetContextItemContextID;0)
	//ARRAY LONGINT(SM_al_SetitemsClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	//ARRAY TEXT(SM_at_SetContextitemOwnerIDs;0)
	C_BOOLEAN:C305($_bo_OK; SM_bo_Busy)
	C_LONGINT:C283($_l_ContextID; $_l_Icon; $_l_ItemReference; $_l_ListItemRow; $_l_MakeSetuniversal; $_l_SelectedListItem; $_l_SubListID; SM_HL_l_SETMANAGER; SM_MakeSetuniversal)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; SM_PersonGroup)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Check Box1"; Form event code:C388)
SM_bo_Busy:=True:C214


$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)


If ($_l_SelectedListItem>0)
	GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
	If ($_l_ItemReference<10000)
		$_l_MakeSetuniversal:=SM_MakeSetuniversal
		SM_SaveModifiedList
		SM_MakeSetuniversal:=$_l_MakeSetuniversal
		$_l_ListItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
		$_l_ContextID:=SM_al_SetContextItemContextID{$_l_ListItemRow}
		If (SM_MakeSetuniversal=1)  //share it
			
			$_bo_OK:=SM_CheckActionOK("Share"; "list"; $_l_ItemReference)
			If ($_bo_OK)
				If (False:C215)
					Gen_Confirm("Share list with Group "+Char:C90(34)+SM_PersonGroup+Char:C90(34)+", or with all"; "Group"; "All")
					If (Ok=1)  //share with group
						SM_UpdateArrays("GRP"; $_t_ItemText; $_l_ItemReference; $_l_ContextID)
					Else 
						//share with all
						SM_UpdateArrays("UNI"; $_t_ItemText; $_l_ItemReference; $_l_ContextID)
					End if 
					$_l_ListItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
					$_l_Icon:=SM_al_SetitemsClassID{$_l_ListItemRow}
					If ($_l_Icon=0)
						$_l_Icon:=853
					End if 
					
					$_l_Icon:=SM_al_SetitemsClassID{$_l_ListItemRow}
					If ($_l_Icon=0)
						$_l_Icon:=853
					End if 
				Else 
					//SHARE LIST WITH MANY
					$_bo_OK:=SM_SendSetSelection($_t_ItemText; $_l_ItemReference; $_l_ContextID)
					If ($_bo_OK)
						$_l_ListItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
						If ($_l_ListItemRow>0)
							$_l_Icon:=SM_al_SetitemsClassID{$_l_ListItemRow}
							If ($_l_Icon=0)
								$_l_Icon:=853
							End if 
						End if 
					Else 
						$_l_ListItemRow:=-1
					End if 
					
				End if 
				
				//SELECT LIST ITEM BY REFERENCE(list;itemRef)
				If ($_l_ListItemRow>0)
					SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; $_l_ItemReference; True:C214; Bold:K14:2; 131072+$_l_Icon)
				End if 
				
				////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
				
				
			End if 
		Else 
			//unshare it
			SM_at_SetContextitemOwnerIDs{$_l_ListItemRow}:=""
			
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:WS_SetManager,SM_MAKESETUNIVERSAL"; $_t_oldMethodName)
