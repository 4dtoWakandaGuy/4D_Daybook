//%attributes = {}
If (False:C215)
	//Project Method Name:      SMdeleteLIST
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/01/2011 18:35 v7.0.0/B45
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
	//ARRAY TEXT(SM_at_SetitemsClassName;0)
	//ARRAY TEXT(SM_at_SetItemsName;0)
	C_LONGINT:C283($_l_SelectedListItem; $_l_ItemReference; $_l_ListItemRow; $_l_SublistID; SM_HL_l_SETMANAGER; SM_RB_1; SM_RB_2; SM_RB_3; SM_RB_4; SM_RB_5)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ItemText; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMdeleteLIST")
//REMEMBER WE CAN ONLY ACTUALLY DELETE PERSONAL LISTS NOT SHARED ONES
//WE MUST TAKE THE LIST OUT OF THE ARRAY
//UPDATE THE ARRAY AND THEN REBUILT THE LIST
$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)

If ($_l_SelectedListItem>0)
	GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
	
	If ($_l_ItemReference>10000)
		Gen_Alert("You cannot delete a category-only lists may be deleted")
	Else 
		
		$_l_ListItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
		If ($_l_ListItemRow>0)
			If (SM_at_SetContextitemOwnerIDs{$_l_ListItemRow}=<>PER_t_CurrentUserInitials)
				Gen_Confirm("Are you sure you wish to delete this list?"; "No"; "Yes")
				If (Ok=0)
					OK:=1
					
					
					DELETE FROM ARRAY:C228(SM_at_SetItemsName; $_l_ListItemRow; 1)
					DELETE FROM ARRAY:C228(SM_al_SetContextItemContextID; $_l_ListItemRow; 1)
					DELETE FROM ARRAY:C228(SM_al_SetitemsID; $_l_ListItemRow; 1)
					DELETE FROM ARRAY:C228(SM_at_SetitemsClassName; $_l_ListItemRow; 1)
					DELETE FROM ARRAY:C228(SM_al_SetitemsClassID; $_l_ListItemRow; 1)
					DELETE FROM ARRAY:C228(SM_at_SetContextitemOwnerIDs; $_l_ListItemRow; 1)
					SM_UPDATEDATA
					SM_LoadHLList
					SELECT LIST ITEMS BY POSITION:C381(SM_HL_l_SETMANAGER; $_l_SelectedListItem-1)
					//````````
					If ($_l_SelectedListItem>0)
						GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
						If ($_l_ItemReference>10000)  // a context is selected(max 9999 lists!)
							OBJECT SET ENABLED:C1123(SM_RB_1; True:C214)
							OBJECT SET ENABLED:C1123(SM_RB_2; False:C215)
							OBJECT SET ENABLED:C1123(SM_RB_3; False:C215)
							OBJECT SET ENABLED:C1123(SM_RB_4; False:C215)
							OBJECT SET ENABLED:C1123(SM_RB_5; False:C215)
							//Object Set Enabled(SM_RB_1;TRUE)
							//Object Set Enabled(SM_RB_2;FALSE)
							//Object Set Enabled(SM_RB_3;FALSE)
							//Object Set Enabled(SM_RB_4;FALSE)
							//Object Set Enabled(SM_RB_5;FALSE)
							OBJECT SET TITLE:C194(SM_RB_2; "Unite list & Current Selection")
							OBJECT SET TITLE:C194(SM_RB_3; "Intersect list & Current Selection")
							OBJECT SET TITLE:C194(SM_RB_4; "Remove Current Selection from list")
							OBJECT SET TITLE:C194(SM_RB_5; "Remove list from Current Selection")
							OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
							SM_RB_1:=0
							SM_RB_2:=0
							SM_RB_3:=0
							SM_RB_4:=0
							SM_RB_5:=0
						Else 
							//a sublist is selected
							//so buttons can allow lists to be intersected
							OBJECT SET ENABLED:C1123(SM_RB_1; True:C214)
							OBJECT SET ENABLED:C1123(SM_RB_2; True:C214)
							OBJECT SET ENABLED:C1123(SM_RB_3; True:C214)
							OBJECT SET ENABLED:C1123(SM_RB_4; True:C214)
							OBJECT SET ENABLED:C1123(SM_RB_5; True:C214)
							//Object Set Enabled(SM_RB_1;TRUE)
							//Object Set Enabled(SM_RB_2;TRUE)
							//Object Set Enabled(SM_RB_3;TRUE)
							//Object Set Enabled(SM_RB_4;TRUE)
							//Object Set Enabled(SM_RB_5;TRUE)
							OBJECT SET TITLE:C194(SM_RB_2; "Unite list "+Char:C90(34)+$_t_ItemText+Char:C90(34)+" & Current Selection")
							OBJECT SET TITLE:C194(SM_RB_3; "Intersect list "+Char:C90(34)+$_t_ItemText+Char:C90(34)+" & Current Selection")
							OBJECT SET TITLE:C194(SM_RB_4; "Remove Current Selection from list "+Char:C90(34)+$_t_ItemText+Char:C90(34))
							OBJECT SET TITLE:C194(SM_RB_5; "Remove list "+Char:C90(34)+$_t_ItemText+Char:C90(34)+" from Current Selection")
							//for the next line we need to know the class of the current list
							$_l_ListItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
							Case of 
								: ($_l_ListItemRow<0)
									OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
								: (SM_al_SetitemsClassID{$_l_ListItemRow}=853) | (SM_al_SetitemsClassID{$_l_ListItemRow}=852)
									OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to list "+Char:C90(34)+$_t_ItemText+Char:C90(34))
								Else 
									OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
							End case 
							SM_RB_1:=0
							SM_RB_2:=0
							SM_RB_3:=0
							SM_RB_4:=0
							SM_RB_5:=0
						End if 
						
					Else 
						
						OBJECT SET ENABLED:C1123(SM_RB_1; True:C214)
						OBJECT SET ENABLED:C1123(SM_RB_2; False:C215)
						OBJECT SET ENABLED:C1123(SM_RB_3; False:C215)
						OBJECT SET ENABLED:C1123(SM_RB_4; False:C215)
						OBJECT SET ENABLED:C1123(SM_RB_5; False:C215)
						//Object Set Enabled(SM_RB_1;TRUE)
						//Object Set Enabled(SM_RB_2;FALSE)
						//Object Set Enabled(SM_RB_3;FALSE)
						//Object Set Enabled(SM_RB_4;FALSE)
						//Object Set Enabled(SM_RB_5;FALSE)
						OBJECT SET TITLE:C194(SM_RB_2; "Unite list & Current Selection")
						OBJECT SET TITLE:C194(SM_RB_3; "Intersect list & Current Selection")
						OBJECT SET TITLE:C194(SM_RB_4; "Remove Current Selection from list")
						OBJECT SET TITLE:C194(SM_RB_5; "Remove list from Current Selection")
						OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
						SM_RB_1:=0
						SM_RB_2:=0
						SM_RB_3:=0
						SM_RB_4:=0
						SM_RB_5:=0
					End if 
					
					//`````
					////////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
				End if 
			Else 
				Gen_Alert("This is a shared List-It cannot be deleted")
			End if 
			
		End if 
		
		
	End if 
End if 
ERR_MethodTrackerReturn("SMdeleteLIST"; $_t_oldMethodName)
////
ERR_MethodTrackerReturn("SMdeleteLIST"; $_t_oldMethodName)