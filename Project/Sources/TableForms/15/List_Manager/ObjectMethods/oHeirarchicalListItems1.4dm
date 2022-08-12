If (False:C215)
	//object Method Name: Object Name:      [USER].List_Manager.oHeirarchicalListItems1
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
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_SubListCRHLID;0)
	//ARRAY LONGINT(AA_al_SublistCRID;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	C_BOOLEAN:C305(AA_bo_SimulateClick; AA_bo_Drop)
	C_LONGINT:C283($_l_AccessNumber; $_l_addtoItemRef; $_l_BeforeItemRef; $_l_CountListItems; $_l_DropPosition; $_l_event; $_l_FieldNumber; $_l_ItemReference; $_l_ItemReferenceNEW; $_l_ItemReferenceOLD; $_l_ListItemRow)
	C_LONGINT:C283($_l_SelectedItemParent; $_l_SelectedItemParentNEW; $_l_SelectedItemParentOLD; $_l_SelectedListItem; $_l_SublistID; $_l_TableNumber; AA_HL_ListItems; AA_l_CurrentSelectedItemID; AA_l_SourceElement; AA_l_SourceProcess)
	C_POINTER:C301(AA_ptr_SourceObject)
	C_TEXT:C284($_t_BeforeItemText; $_t_ItemText; $_t_ItemTextNEW; $_t_itemTextOLD; $_t_oldMethodName; $_t_Text; $_t_VariableName; AA_t_CurrentListItem)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.oHeirarchicalListItems1"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Drag Over:K2:13)
		If (False:C215)
			AA_bo_Drop:=False:C215
			_O_DRAG AND DROP PROPERTIES:C607(AA_ptr_SourceObject; AA_l_SourceElement; AA_l_SourceProcess)
			RESOLVE POINTER:C394(AA_ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			If ($_t_VariableName="AA_HL_ListItems")
				AA_bo_Drop:=True:C214
				
			End if 
		End if 
		
	: ($_l_event=On Drop:K2:12)
		If (False:C215)
			If (AA_bo_Drop)
				$_l_DropPosition:=Drop position:C608
				If ($_l_DropPosition>0) & (AA_l_SourceElement>0)
					//it has been dropped on an item
					GET LIST ITEM:C378(AA_HL_ListItems; AA_l_SourceElement; $_l_ItemReferenceOLD; $_t_itemTextOLD; $_l_SublistID)
					$_l_SelectedItemParentOLD:=List item parent:C633(AA_HL_ListItems; $_l_ItemReferenceOLD)
					If ($_l_SelectedItemParentOLD#0)  //make sure we are not adding a parent item
						GET LIST ITEM:C378(AA_HL_ListItems; $_l_DropPosition; $_l_ItemReferenceNEW; $_t_ItemTextNEW; $_l_SublistID)
						$_l_SelectedItemParentNEW:=List item parent:C633(AA_HL_ListItems; $_l_ItemReferenceNEW)
						If ($_l_SelectedItemParentOLD#$_l_SelectedItemParentNEW)
							If ($_l_SelectedItemParentNEW=0)
								//this is a parent item
								//make sure the sublist exists
								
								If ($_l_SublistID=0)
									$_l_SublistID:=New list:C375
									READ WRITE:C146([X_LISTS:111])
									CREATE RECORD:C68([X_LISTS:111])
									[X_LISTS:111]x_ListName:2:=$_t_ItemTextNEW
									$_l_AccessNumber:=0
									$_l_AccessNumber:=$_l_AccessNumber ?+ 5
									AA_SetListProperty("ACCESS"; $_l_AccessNumber)
									DB_SaveRecord(->[X_LISTS:111])
									AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
									//AA_l_CurrentSelectedItemID:=[x_Lists]x_ID
									$_l_ListItemRow:=Find in array:C230(AA_al_ListItemIDs; $_l_addtoItemRef)
									If ($_l_ListItemRow>0)
										AA_al_SublistCRID{$_l_ListItemRow}:=[X_LISTS:111]x_ID:1
										AA_al_SubListCRHLID{$_l_ListItemRow}:=$_l_SublistID
									Else 
										//                 ALERT("ERROR")
										Gen_Alert("ERROR")
										
									End if 
									UNLOAD RECORD:C212([X_LISTS:111])
									READ ONLY:C145([X_LISTS:111])
								End if 
							Else 
								//this has been dropped inside the sublist
								//so add to the parent
								SELECT LIST ITEMS BY REFERENCE:C630(AA_HL_ListItems; $_l_SelectedItemParentNEW)
								$_l_DropPosition:=Selected list items:C379(AA_HL_ListItems)
								//AA_l_CurrentSelectedItemID:=
							End if 
							GET LIST ITEM:C378(AA_HL_ListItems; $_l_DropPosition; $_l_ItemReferenceNEW; $_t_ItemTextNEW; $_l_SublistID)
							OBJECT SET ENTERABLE:C238(AA_HL_ListItems; True:C214)
							$_t_Text:=""
							$_t_Text:=$_t_itemTextOLD
							$_l_CountListItems:=Count list items:C380($_l_SublistID)
							AA_l_CurrentSelectedItemID:=$_l_ItemReferenceOLD
							
							If ($_l_CountListItems=0)
								APPEND TO LIST:C376($_l_SublistID; $_t_Text; AA_l_CurrentSelectedItemID; 0; True:C214)
							Else 
								GET LIST ITEM:C378(AA_HL_ListItems; $_l_DropPosition+1; $_l_BeforeItemRef; $_t_BeforeItemText)
								SELECT LIST ITEMS BY REFERENCE:C630(AA_HL_ListItems; $_l_BeforeItemRef)
								INSERT IN LIST:C625($_l_SublistID; $_l_BeforeItemRef; $_t_Text; AA_l_CurrentSelectedItemID; 0; True:C214)
							End if 
							//now delete the old item
							SELECT LIST ITEMS BY REFERENCE:C630(AA_HL_ListItems; $_l_ItemReferenceOLD)
							////////_o_REDRAW LIST(AA_HL_ListItems)
							$_l_DropPosition:=$_l_DropPosition+1
							GET LIST ITEM:C378(AA_HL_ListItems; $_l_DropPosition; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
							SELECT LIST ITEMS BY REFERENCE:C630(AA_HL_ListItems; $_l_ItemReference)
						End if 
					End if 
					
				End if 
				
			End if 
		End if 
		
	: ($_l_event=On Clicked:K2:4)
		//an item is selected
		If (Not:C34(AA_bo_SimulateClick))
			If (AA_l_CurrentSelectedItemID#0)
				
				AA_SaveListItem(AA_l_CurrentSelectedItemID)
				////////_o_REDRAW LIST(AA_HL_ListItems)
			End if 
			$_l_SelectedListItem:=Selected list items:C379(AA_HL_ListItems)
			GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
			AA_LoadListItemtoManager($_l_ItemReference)
			AA_t_CurrentListItem:=$_t_ItemText
		End if 
		
	: ($_l_event=On Data Change:K2:15)
		AA_bo_SimulateClick:=False:C215
		$_l_SelectedListItem:=Selected list items:C379(AA_HL_ListItems)
		GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
		If ($_t_ItemText="Untitled") | ($_t_ItemText="")
			SET LIST ITEM:C385(AA_HL_ListItems; $_l_ItemReference; AA_t_CurrentListItem; $_l_ItemReference; $_l_SublistID; False:C215)
		End if 
		If ($_t_ItemText#"Untitled") & ($_t_ItemText#"")  //4²
			SET LIST ITEM:C385(AA_HL_ListItems; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SublistID; False:C215)
			AA_t_CurrentListItem:=$_t_ItemText
			AA_l_CurrentSelectedItemID:=$_l_ItemReference
			$_l_SelectedItemParent:=List item parent:C633(AA_HL_ListItems; $_l_ItemReference)
			AA_SaveListItem(AA_l_CurrentSelectedItemID; $_l_SelectedItemParent)
		Else   //e4
			$_l_ListItemRow:=Find in array:C230(AA_al_ListItemIDs; $_l_ItemReference)
			If ($_l_ListItemRow<0)  //6²
				//not saved
				//HANG ON
				DELETE FROM LIST:C624(AA_HL_ListItems; $_l_ItemReference)
				////////_o_REDRAW LIST(AA_HL_ListItems)
			Else   //it cant be deleted this way so change it back`els
				SET LIST ITEM:C385(AA_HL_ListItems; $_l_ItemReference; AA_at_ListItems{$_l_ListItemRow}; $_l_ItemReference; $_l_SublistID; False:C215)
			End if   //end 6
			////////_o_REDRAW LIST(AA_HL_ListItems)
		End if   //end4
		//end 7
		GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
		AA_LoadListItemtoManager($_l_ItemReference)
		AA_t_CurrentListItem:=$_t_ItemText
		AA_l_CurrentSelectedItemID:=$_l_ItemReference
End case 
ERR_MethodTrackerReturn("OBJ [USER].List_Manager.oHeirarchicalListItems1"; $_t_oldMethodName)
