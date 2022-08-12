//%attributes = {}
If (False:C215)
	//Project Method Name:      LM_PrintListItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	C_BOOLEAN:C305($_bo_Expanded; $_bo_Expanded2; $_bo_WasExpanded)
	C_LONGINT:C283($_l_CountSubListItems; $_l_Index; $_l_Index2; $_l_ItemReference; $_l_itemReference2; $_l_Lines; $_l_Max; $_l_OK; $_l_SelectedItemParent2; $_l_SelectedListItem; $_l_SublistID)
	C_LONGINT:C283($_l_SublistID2; AA_HL_ListItems)
	C_REAL:C285($1)
	C_TEXT:C284($_t_ItemText; $_t_ItemText2; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LM_PrintListItems")
//This will print the list items from the list administrator window
If ($1>0)
	//list is selected
	$_l_Lines:=0
	$_l_Max:=52
	$_l_OK:=PRINT_SetSIZE("A4"; "P"; "PrintLists")
	If ($_l_OK>=0)
		If ($_l_OK=1)
			PRINT SETTINGS:C106
			$_l_OK:=OK
		Else 
			$_l_OK:=1
		End if 
		If ($_l_OK=1)
			
			
			QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$1)
			Print form:C5([X_LISTS:111]; "Print_List_Properties")
			$_l_Lines:=$_l_Lines+1
			//use the Heirarichal list to print the items
			For ($_l_Index; 1; Size of array:C274(AA_al_ListItemIDs))
				If ($_l_Lines>$_l_Max)
					$_l_Lines:=0
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$1)
					PAGE BREAK:C6(>)
					Print form:C5([X_LISTS:111]; "Print_List_Properties")
					$_l_Lines:=$_l_Lines+1
				End if 
				
				SELECT LIST ITEMS BY REFERENCE:C630(AA_HL_ListItems; AA_al_ListItemIDs{$_l_Index})
				$_l_SelectedListItem:=Selected list items:C379(AA_HL_ListItems)
				GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_ItemReference)
				Print form:C5([LIST_ITEMS:95]; "Print_List_Items")
				$_l_Lines:=$_l_Lines+1
				If ($_l_SublistID>0)
					$_bo_WasExpanded:=$_bo_Expanded
					SET LIST ITEM:C385(AA_HL_ListItems; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SublistID; True:C214)
					$_l_CountSubListItems:=Count list items:C380($_l_SublistID)
					For ($_l_Index2; 1; $_l_CountSubListItems)
						If ($_l_Lines>$_l_Max)
							$_l_Lines:=0
							PAGE BREAK:C6(>)
							QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$1)
							Print form:C5([X_LISTS:111]; "Print_List_Properties")
							$_l_Lines:=$_l_Lines+1
						End if 
						$_l_SelectedListItem:=$_l_SelectedListItem+1
						GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_itemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded2)
						$_l_SelectedItemParent2:=List item parent:C633(AA_HL_ListItems; $_l_itemReference2)
						If ($_l_SelectedItemParent2=$_l_ItemReference)
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_itemReference2)
							Print form:C5([LIST_ITEMS:95]; "Print_SubListItems")
							$_l_Lines:=$_l_Lines+1
						End if 
					End for 
					If (Not:C34($_bo_WasExpanded))
						SET LIST ITEM:C385(AA_HL_ListItems; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SublistID; False:C215)
						
					End if 
				End if 
			End for 
			
			
			
			PAGE BREAK:C6
			PRT_SetPrinterPaperOptions("PrintLists")  //NG June 2005
		End if 
	End if 
End if 

////////////_o_REDRAW LIST(AA_HL_ListItems)
ERR_MethodTrackerReturn("LM_PrintListItems"; $_t_oldMethodName)