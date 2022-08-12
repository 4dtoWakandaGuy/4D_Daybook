If (False:C215)
	//object Name: [USER]WS_SetManager.Button3
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
	//ARRAY LONGINT(SM_al_SetitemsClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	//ARRAY TEXT(SM_at_SetItemsName;0)
	C_BOOLEAN:C305($_bo_Expanded; SM_bo_Busy; SM_bo_SimulateClick)
	C_LONGINT:C283($_l_AddToItemReference; $_l_BeforeItemReference; $_l_CountListItems; $_l_FieldNumber; $_l_HLListLeft; $_l_HLListTop; $_l_HorizontalCenter; $_l_IconID; $_l_Ignore; $_l_ItemReference; $_l_ItemReference2)
	C_LONGINT:C283($_l_ItemReferenceRow; $_l_offset; $_l_ParentObject; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SelectedListItem2; $_l_SubListID; $_l_SubListID2; $_l_TableNumber; $_l_VerticalCenter; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_windowTop; SM_HL_l_SETMANAGER; SM_l_ContextItemID; SM_RB_1; SM_RB_2; SM_RB_3; SM_RB_4; SM_RB_5)
	C_TEXT:C284($_t_BeforeItemText; $_t_ItemText; $_t_ItemText2; $_t_NewItemName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Button3"; Form event code:C388)
SM_bo_Busy:=True:C214

If (SM_CheckActionOK("Add"; "list"))
	$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
	If ($_l_SelectedListItem>0)
		SM_SaveModifiedList
		GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
		SM_ListItemShared($_l_ItemReference)
		If ($_l_ItemReference>10000)
		Else 
			
			
			//switch items to the parent
			$_l_SelectedItemParent:=List item parent:C633(SM_HL_l_SETMANAGER; $_l_ItemReference)
			SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; $_l_SelectedItemParent)
			$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
			$_l_ParentObject:=$_l_SelectedListItem
			GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
			SM_ListItemShared($_l_ItemReference)
			//here collapse the whole list
			
			
			
			
		End if 
		For ($_l_SelectedListItem2; Count list items:C380(SM_HL_l_SETMANAGER); 1; -1)
			GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem2; $_l_ItemReference2; $_t_ItemText2; $_l_SubListID2; $_bo_Expanded)
			SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ItemReference2; $_t_ItemText2; $_l_ItemReference2; $_l_SubListID2; False:C215)
			
		End for 
		////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
		//now reselect the parent and expand
		SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; $_l_ItemReference)
		$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
		$_l_CountListItems:=Count list items:C380(SM_HL_l_SETMANAGER)
		If ($_l_CountListItems>($_l_SelectedListItem+7))
			$_l_offset:=1
			$_l_SelectedListItem2:=$_l_SelectedListItem+7
			SELECT LIST ITEMS BY POSITION:C381(SM_HL_l_SETMANAGER; $_l_SelectedListItem2)
			////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
		Else 
			$_l_SelectedListItem2:=$_l_CountListItems
			SELECT LIST ITEMS BY POSITION:C381(SM_HL_l_SETMANAGER; $_l_SelectedListItem2)
			////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
			$_l_offset:=7-($_l_SelectedListItem2-$_l_SelectedListItem)*16  //offset from top?
		End if 
		
		$_l_ParentObject:=$_l_SelectedListItem
		GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference2; $_t_ItemText2; $_l_SubListID2; $_bo_Expanded)
		SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ItemReference2; $_t_ItemText2; $_l_ItemReference2; $_l_SubListID2; True:C214)
		//the item is now expanded
		////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
		$_l_AddToItemReference:=$_l_ItemReference
		If ($_l_SubListID=0)
			$_l_SubListID:=New list:C375
		End if 
		OBJECT SET ENTERABLE:C238(SM_HL_l_SETMANAGER; True:C214)
		$_t_NewItemName:=""
		If (True:C214)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_HorizontalCenter:=$_l_WindowLeft+($_l_WindowRight-($_l_WindowLeft/2))
			$_l_VerticalCenter:=$_l_WindowTop+($_l_WindowBottom-($_l_WindowTop/2))
			HIDE WINDOW:C436
			$_t_NewItemName:=Gen_Request("Name This list:"; ""; "Save"; "Cancel"; $_l_WindowLeft; $_l_WindowTop; "Add List")
			SHOW WINDOW:C435
		Else 
			$_t_NewItemName:="Untitled"
			If (False:C215)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_Ignore; $_l_Ignore)
				OBJECT GET COORDINATES:C663(SM_HL_l_SETMANAGER; $_l_HLListLeft; $_l_HLListTop; $_l_Ignore; $_l_Ignore)
				POST EVENT:C467(Mouse down event:K17:2; 0; ((Current time:C178*1)*60); ($_l_WindowLeft+$_l_HLListLeft+2); ($_l_WindowTop+$_l_HLListTop+2+(($_l_SelectedListItem*12)+12)); Command key mask:K16:1; Current process:C322)
				
				POST KEY:C465(Character code:C91("A"); Command key mask:K16:1; Current process:C322)
			End if 
		End if 
		If ($_t_NewItemName#"")  // | (True)
			$_l_CountListItems:=Count list items:C380($_l_SubListID)
			
			SM_l_ContextItemID:=AA_GetNextIDinMethod(->SM_l_ContextItemID)
			If ($_l_CountListItems=0)
				APPEND TO LIST:C376($_l_SubListID; $_t_NewItemName; -(SM_l_ContextItemID); 0; True:C214)
			Else 
				
				GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem+1; $_l_BeforeItemReference; $_t_BeforeItemText)
				SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; $_l_BeforeItemReference)
				
				INSERT IN LIST:C625($_l_SubListID; $_l_BeforeItemReference; $_t_NewItemName; -(SM_l_ContextItemID); 0; True:C214)
				SM_ListItemShared(-(SM_l_ContextItemID))
			End if 
			If (False:C215)
				$_l_IconID:=853
				SET LIST ITEM PROPERTIES:C386($_l_SubListID; -(SM_l_ContextItemID); True:C214; Plain:K14:1; 131072+853)
				
				
				OBJECT SET ENTERABLE:C238(SM_HL_l_SETMANAGER; True:C214)
			End if 
			SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SubListID; True:C214)
			////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
			$_l_SelectedListItem:=$_l_SelectedListItem+1
			If (True:C214)  //bsw/ng 8/09/04
				SELECT LIST ITEMS BY POSITION:C381(SM_HL_l_SETMANAGER; $_l_SelectedListItem)
				SM_UpdateArrays("PER"; $_t_NewItemName; -(SM_l_ContextItemID); $_l_AddToItemReference)
				$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
			End if 
			GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
			SM_ListItemShared($_l_ItemReference)
			$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
			// $_l_IconID:=SM_al_SetitemsClassID{$_l_ItemReferenceRow}
			//  If ($_l_IconID=0)
			If (False:C215)
				$_l_IconID:=853
				//  End if
				SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; $_l_ItemReference; True:C214; Plain:K14:1; 131072+$_l_IconID)
			End if 
			If ($_l_SelectedListItem>0)
				GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
				SM_ListItemShared($_l_ItemReference)
				If ($_l_ItemReference>10000)  // a context is selected(max 9999 lists!)
					If (False:C215)
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
					
				Else 
					If (False:C215)
						$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
						$_t_ItemText:=SM_at_SetItemsName{$_l_ItemReferenceRow}
						//a sublist is selected
						//so buttons can allow lists to be intersected
						//Object Set Enabled(SM_RB_1;TRUE)
						//Object Set Enabled(SM_RB_2;TRUE)
						//Object Set Enabled(SM_RB_3;TRUE)
						//Object Set Enabled(SM_RB_4;TRUE)
						//Object Set Enabled(SM_RB_5;TRUE)
						OBJECT SET ENABLED:C1123(SM_RB_1; True:C214)
						OBJECT SET ENABLED:C1123(SM_RB_2; True:C214)
						OBJECT SET ENABLED:C1123(SM_RB_3; True:C214)
						OBJECT SET ENABLED:C1123(SM_RB_4; True:C214)
						OBJECT SET ENABLED:C1123(SM_RB_5; True:C214)
						OBJECT SET TITLE:C194(SM_RB_2; "Unite list "+Char:C90(34)+$_t_ItemText+Char:C90(34)+" & Current Selection")
						OBJECT SET TITLE:C194(SM_RB_3; "Intersect list "+Char:C90(34)+$_t_ItemText+Char:C90(34)+" & Current Selection")
						OBJECT SET TITLE:C194(SM_RB_4; "Remove Current Selection from list "+Char:C90(34)+$_t_ItemText+Char:C90(34))
						OBJECT SET TITLE:C194(SM_RB_5; "Remove list "+Char:C90(34)+$_t_ItemText+Char:C90(34)+" from Current Selection")
						//for the next line we need to know the class of the current list
						$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
						Case of 
							: ($_l_ItemReferenceRow<0)
								OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
							: (SM_al_SetitemsClassID{$_l_ItemReferenceRow}=853) | (SM_al_SetitemsClassID{$_l_ItemReferenceRow}=852)
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
					
				End if 
				
			Else 
				
				If (False:C215)
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
			End if 
		End if 
		If (False:C215)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_Ignore; $_l_Ignore)
			OBJECT GET COORDINATES:C663(SM_HL_l_SETMANAGER; $_l_HLListLeft; $_l_HLListTop; $_l_Ignore; $_l_Ignore)
			//  SELECT LIST ITEM(SM_HL_l_SETMANAGER;$_l_SelectedListItem)
			If (True:C214)
				POST EVENT:C467(Mouse down event:K17:2; 0; ((Current time:C178*1)*60); ($_l_WindowLeft+$_l_HLListLeft+2); ($_l_WindowTop+$_l_HLListTop+2+(($_l_offset*16))); Command key mask:K16:1; Current process:C322)
				POST KEY:C465(Character code:C91("A"); Command key mask:K16:1; Current process:C322)
			End if 
			SM_bo_SimulateClick:=True:C214
		End if 
		
		//Else
		
		
		// Gen_Alert ("You must select a context to add a set to")
		// End if
	End if 
End if 

SM_bo_Busy:=False:C215
ERR_MethodTrackerReturn("OBJ:WS_SetManager,Badd"; $_t_oldMethodName)