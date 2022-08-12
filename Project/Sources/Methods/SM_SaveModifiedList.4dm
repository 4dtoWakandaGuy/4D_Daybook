//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_SaveModifiedList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2011 18:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SetContextIDs;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	//ARRAY TEXT(SM_at_SetContexts;0)
	//ARRAY TEXT(SM_at_SetItemsName;0)
	C_BOOLEAN:C305($_bo_Expanded; SM_bo_SimulateClick)
	C_LONGINT:C283($_l_SelectedListItem; $_l_SelectedListItem2; $_l_FieldNumber; $_l_IconNumber; $_l_itemReference2; $_l_ItemReference; $_l_ListItemRow; $_l_ListItemsCount; $_l_SelectedItemParent; $_l_SourceProcess; $_l_SublistID)
	C_LONGINT:C283($_l_SublistID2; $_l_TableNumber; $srcElement; SM_HL_l_SETMANAGER)
	C_POINTER:C301($srcObject)
	C_TEXT:C284($_t_ItemText; $_t_ItemText2; $_t_oldMethodName; $_t_VariableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_SaveModifiedList")
$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
If ($_l_SelectedListItem>0)
	GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
	SM_ListItemShared($_l_ItemReference)
	If ($_l_ItemReference<0)  //it is an item!!`2
		$_l_SelectedItemParent:=List item parent:C633(SM_HL_l_SETMANAGER; $_l_ItemReference)
		If ($_t_ItemText#"Untitled") & ($_t_ItemText#"")  //3
			$_l_ListItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
			If ($_l_ListItemRow<0)  //this is not saved `changing the name of the list`4
				$_l_IconNumber:=853
				SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; $_l_ItemReference; True:C214; Plain:K14:1; 131072+853)
				SM_UpdateArrays("PER"; $_t_ItemText; $_l_ItemReference; $_l_SelectedItemParent)
			Else   //e4
				//modify
				SM_UpdateArrays("PER"; $_t_ItemText; $_l_ItemReference; $_l_SelectedItemParent)
			End if   //en4
			
		Else   //e3
			$_l_ListItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
			If ($_l_ListItemRow<0)  //5
				//not saved
				//HANG ON
				$_l_SelectedItemParent:=List item parent:C633(SM_HL_l_SETMANAGER; $_l_ItemReference)
				SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; $_l_SelectedItemParent)
				$_l_SelectedListItem2:=Selected list items:C379(SM_HL_l_SETMANAGER)
				GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem2; $_l_itemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded)
				SM_ListItemShared($_l_ItemReference)
				$_l_ListItemsCount:=Count list items:C380($_l_SublistID2)
				DELETE FROM LIST:C624(SM_HL_l_SETMANAGER; $_l_ItemReference)
				////////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
				
				If ($_l_ListItemsCount=1)  //WE JUST DELETED IT`6
					SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_itemReference2; $_t_ItemText2; $_l_ItemReference2; 0; True:C214)
				End if   //end6
				//the item name has been wiped
				//so change it back to what it was
				//or remove the item
			Else   //it cant be deleted this way so change it back`els5
				SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ItemReference; SM_at_SetItemsName{$_l_ListItemRow}; $_l_ItemReference; $_l_SublistID; False:C215)
			End if   //end 5
			////////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
		End if   //end3
	Else   //else2
		//modifying a catagory
		If ($_t_ItemText#"")  //6
			SM_UpdateArrays("PER"; ""; 0; 0; $_t_ItemText; $_l_ItemReference)
		Else   //else6
			$_l_ListItemRow:=Find in array:C230(SM_al_SetContextIDs; $_l_ItemReference)
			If ($_l_ListItemRow>0)  //7
				SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ItemReference; SM_at_SetContexts{$_l_ListItemRow}; $_l_ItemReference; $_l_SublistID; False:C215)
			End if   //edn 7
			
			
		End if   //end 6
		
	End if   //end 2
End if 
ERR_MethodTrackerReturn("SM_SaveModifiedList"; $_t_oldMethodName)