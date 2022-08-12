If (False:C215)
	//object Name: [USER]List_Manager.oHLListofLists
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 17:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>WS_al_ListIDS;0)
	//ARRAY LONGINT(AA_al_ItemIDsModified;0)
	//ARRAY LONGINT(AA_al_ListItemDeletion;0)
	//ARRAY LONGINT(AA_al_SubListItemDeletion;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	C_BOOLEAN:C305($_bo_Deletions; AA_Bo_ListtoUpdate; AA_bo_SimulateClick; WS_bo_ListModified)
	C_LONGINT:C283($_l_CurrentListItemOLD; $_l_DeletionIndex; $_l_event; $_l_Icon; $_l_ItemReference; $_l_ListID; $_l_ListItemRow; $_l_OK; $_l_Retries; $_l_SelectedListItem; $_l_SublistID)
	C_LONGINT:C283(AA_l_CurrentListiD; WS_l_HLALISTNAMES)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; $_t_oldMethodName2; AA_t_listName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]List_Manager.oHLListofLists"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (Not:C34(AA_bo_SimulateClick))
			$_l_SelectedListItem:=Selected list items:C379(WS_l_HLALISTNAMES)
			$_l_ListID:=0
			//there is a list loaded so do we save it
			$_bo_Deletions:=False:C215
			For ($_l_DeletionIndex; 1; Size of array:C274(AA_al_ListItemDeletion))
				If (AA_al_ListItemDeletion{$_l_DeletionIndex}>0)
					$_l_DeletionIndex:=Size of array:C274(AA_al_ListItemDeletion)
					$_bo_Deletions:=True:C214
				End if 
			End for 
			If (Not:C34($_bo_Deletions))
				For ($_l_DeletionIndex; 1; Size of array:C274(AA_al_SubListItemDeletion))
					If (AA_al_SubListItemDeletion{$_l_DeletionIndex}>0)
						$_l_DeletionIndex:=Size of array:C274(AA_al_SubListItemDeletion)
						$_bo_Deletions:=True:C214
					End if 
				End for 
				
			End if 
			If (Size of array:C274(AA_al_ItemIDsModified)>0) | ($_bo_Deletions) | (AA_Bo_ListtoUpdate)
				
				
				
				Gen_Confirm("Save "+AA_t_listName+"?")
				$_l_OK:=OK
				If ($_l_OK=1)
					$_l_ListID:=AA_SaveUpdatedList(AA_l_CurrentListiD; AA_t_listName)
				End if 
			End if 
			
			
			If ($_l_ListID>0)
				SELECT LIST ITEMS BY REFERENCE:C630(WS_l_HLALISTNAMES; AA_l_CurrentListiD)
				$_l_CurrentListItemOLD:=Selected list items:C379(WS_l_HLALISTNAMES)
				GET LIST ITEM:C378(WS_l_HLALISTNAMES; $_l_CurrentListItemOLD; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
				SET LIST ITEM:C385(WS_l_HLALISTNAMES; $_l_ItemReference; $_t_ItemText; $_l_ListID; $_l_SublistID; False:C215)
			End if 
			AA_l_CurrentListiD:=0
			SELECT LIST ITEMS BY POSITION:C381(WS_l_HLALISTNAMES; $_l_SelectedListItem)
			GET LIST ITEM:C378(WS_l_HLALISTNAMES; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
			AA_t_listName:=$_t_ItemText
			// AA_l_CurrentListiD
			AA_LoadListtoManager($_l_ItemReference; $_t_ItemText; True:C214)
			WS_bo_ListModified:=False:C215
		End if 
	: ($_l_event=On Data Change:K2:15)
		AA_bo_SimulateClick:=False:C215
		$_l_SelectedListItem:=Selected list items:C379(WS_l_HLALISTNAMES)
		GET LIST ITEM:C378(WS_l_HLALISTNAMES; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
		If ($_l_ItemReference<0)  //it is an item!!`2
			//it is not a saved list
			If ($_t_ItemText#"Untitled") & ($_t_ItemText#"")  //3
				$_l_ListItemRow:=Find in array:C230(<>WS_al_ListIDS; $_l_ItemReference)
				If ($_l_ListItemRow<0)  //this is not saved `changing the name of the list`4
					$_l_Icon:=853
					SET LIST ITEM PROPERTIES:C386(WS_l_HLALISTNAMES; $_l_ItemReference; True:C214; Plain:K14:1; 0)
					$_l_ListID:=AA_SaveUpdatedList($_l_ItemReference; $_t_ItemText)
					If ($_l_ListID>0)
						SELECT LIST ITEMS BY REFERENCE:C630(WS_l_HLALISTNAMES; AA_l_CurrentListiD)
						$_l_CurrentListItemOLD:=Selected list items:C379(WS_l_HLALISTNAMES)
						GET LIST ITEM:C378(WS_l_HLALISTNAMES; $_l_CurrentListItemOLD; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
						SET LIST ITEM:C385(WS_l_HLALISTNAMES; $_l_ItemReference; $_t_ItemText; $_l_ListID; $_l_SublistID; False:C215)
						
					End if 
				Else   //e4
					//list is saved???
					SET LIST ITEM PROPERTIES:C386(WS_l_HLALISTNAMES; $_l_ItemReference; True:C214; Plain:K14:1; 0)
					$_l_ListID:=AA_SaveUpdatedList($_l_ItemReference; $_t_ItemText)
				End if   //en4
			Else   //e3
				//it is untitled or empty
				$_l_ListItemRow:=Find in array:C230(<>WS_al_ListIDS; $_l_ItemReference)
				If ($_l_ListItemRow<0)  //5
					//not saved
					//HANG ON
					DELETE FROM LIST:C624(WS_l_HLALISTNAMES; $_l_ItemReference)
					////////_o_REDRAW LIST(WS_l_HLALISTNAMES)
				Else   //it cant be deleted this way so change it back`els5
					$_l_Retries:=0
					While (Semaphore:C143("$LoadingListofLists"))
						$_l_Retries:=$_l_Retries+1
						DelayTicks(2*$_l_Retries)
					End while 
					
					SET LIST ITEM:C385(WS_l_HLALISTNAMES; $_l_ItemReference; AA_at_ListNames{$_l_ListItemRow}; $_l_ItemReference; 0; False:C215)
					CLEAR SEMAPHORE:C144("$LoadingListofLists")
					
				End if   //end 5
				////////_o_REDRAW LIST(WS_l_HLALISTNAMES)
			End if   //end3
		Else   //else2
			//its a positive value so is saved
			If ($_t_ItemText#"")  //6
				
			Else   //else6
				$_l_ListItemRow:=Find in array:C230(<>WS_al_ListIDS; $_l_ItemReference)
				If ($_l_ListItemRow>0)  //7
					$_l_Retries:=0
					While (Semaphore:C143("$LoadingListofLists"))
						$_l_Retries:=$_l_Retries+1
						DelayTicks(2*$_l_Retries)
					End while 
					$_t_oldMethodName2:=ERR_MethodTracker("SEM:Owned by"+"WS_l_HLALISTNAMES"+"(2)")
					SET LIST ITEM:C385(WS_l_HLALISTNAMES; $_l_ItemReference; AA_at_ListNames{$_l_ListItemRow}; $_l_ItemReference; 0; False:C215)
					CLEAR SEMAPHORE:C144("$LoadingListofLists")
					
				End if   //edn 7
				
				
			End if   //end 6
			
		End if   //end 2
		//end1
		GET LIST ITEM:C378(WS_l_HLALISTNAMES; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
		AA_LoadListtoManager($_l_ItemReference; $_t_ItemText; True:C214)
		
		
End case 
ERR_MethodTrackerReturn("OBJ:List_Manager,WS_l_HLALISTNAMES"; $_t_oldMethodName)
