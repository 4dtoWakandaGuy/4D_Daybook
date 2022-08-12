//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LMA_newList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 14:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>WS_al_ListIDS;0)
	//ARRAY LONGINT(AA_al_aallListIDS;0)
	//ARRAY LONGINT(AA_al_ItemIDsModified;0)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY LONGINT(AA_al_ListItemDeletion;0)
	//ARRAY LONGINT(AA_al_SubListItemDeletion;0)
	//ARRAY TEXT(AA_at_aallListNames;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	C_BOOLEAN:C305($_bo_Deletions; AA_bo_ListsInited; AA_Bo_ListtoUpdate; AA_bo_SimulateClick)
	C_LONGINT:C283($_l_CountListItems; $_l_Delete; $_l_IconNumber; $_l_Ignore; $_l_ItemReference; $_l_ItemRefPosition; $_l_ListID; $_l_ListObjectTop; $_l_NextID; $_l_Ok; $_l_Retries)
	C_LONGINT:C283($_l_SelectedListItem; $_l_SelectedListItemOLD; $_l_SublistID; $_l_WIndowBottom; $_l_WIndowLeft; $_l_WIndowRight; $_l_WIndowTop; AA_l_CurrentListiD; WS_l_HLAListNames)
	C_REAL:C285($_l_ListObjecRight; $_l_ListObjectBottom; $_l_ListObjectLeft)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; AA_t_listName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LMA_newList")
//this method is called in the list manager administrator window
//to add a new list
//NOTE it is specific to that window
//does the existing list need saving

If (Not:C34(AA_bo_ListsInited))
	$_l_Retries:=0
	While (Semaphore:C143("$LoadingListofLists"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	ARRAY TEXT:C222(AA_at_ListNames; 0)
	ARRAY LONGINT:C221(AA_al_ListIDS; 0)
	ARRAY TEXT:C222(AA_at_aallListNames; 0)
	ARRAY LONGINT:C221(AA_al_aallListIDS; 0)
	AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
	//On THIS FORM we do need all the list IDs
	ALL RECORDS:C47([X_LISTS:111])
	SELECTION TO ARRAY:C260([X_LISTS:111]x_ID:1; AA_al_aallListIDs; [X_LISTS:111]x_ListName:2; AA_at_aallListNames)
	
	AA_bo_ListsInited:=True:C214
	CLEAR SEMAPHORE:C144("$LoadingListofLists")
End if 


AA_bo_SimulateClick:=True:C214
$_l_SelectedListItem:=Selected list items:C379(WS_l_HLAListNames)
GET LIST ITEM:C378(WS_l_HLAListNames; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText)
If ($_t_ItemText#"Untitled") & ($_t_ItemText#"")  //3
	$_l_ItemRefPosition:=Find in array:C230(AA_al_aallListIDs; $_l_ItemReference)
	If ($_l_ItemRefPosition<0)  //this is not saved `changing the name of the list`4
		$_l_IconNumber:=853
		$_l_ListID:=0
		SET LIST ITEM PROPERTIES:C386(WS_l_HLaListNames; $_l_ItemReference; True:C214; Bold:K14:2; 0)
		$_bo_Deletions:=False:C215
		For ($_l_Delete; 1; Size of array:C274(AA_al_ListItemDeletion))
			If (AA_al_ListItemDeletion{$_l_Delete}>0)
				$_l_Delete:=Size of array:C274(AA_al_ListItemDeletion)
				$_bo_Deletions:=True:C214
			End if 
		End for 
		If (Not:C34($_bo_Deletions))
			For ($_l_Delete; 1; Size of array:C274(AA_al_SubListItemDeletion))
				If (AA_al_SubListItemDeletion{$_l_Delete}>0)
					$_l_Delete:=Size of array:C274(AA_al_SubListItemDeletion)
					$_bo_Deletions:=True:C214
				End if 
			End for 
			
		End if 
		
		If (Size of array:C274(AA_al_ItemIDsModified)>0) | ($_bo_Deletions) | (AA_Bo_ListtoUpdate)
			
			
			
			Gen_Confirm("Save "+AA_t_listName+"?")
			$_l_Ok:=OK
			If ($_l_Ok=1)
				$_l_ListID:=AA_SaveUpdatedList(AA_l_CurrentListiD; AA_t_listName)
			End if 
		End if 
		If ($_l_ListID>0)
			SELECT LIST ITEMS BY REFERENCE:C630(WS_l_HLaListNames; AA_l_CurrentListiD)
			$_l_SelectedListItemOLD:=Selected list items:C379(WS_l_HLaListNames)
			GET LIST ITEM:C378(WS_l_HLaListNames; $_l_SelectedListItemOLD; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
			SET LIST ITEM:C385(WS_l_HLaListNames; $_l_ItemReference; $_t_ItemText; $_l_ListID; $_l_SublistID; False:C215)
			
		End if 
	Else   //e4
		//list is saved???
		SET LIST ITEM PROPERTIES:C386(WS_l_HLALISTNAMES; $_l_ItemReference; True:C214; Bold:K14:2; 0)
		$_bo_Deletions:=False:C215
		For ($_l_Delete; 1; Size of array:C274(AA_al_ListItemDeletion))
			If (AA_al_ListItemDeletion{$_l_Delete}>0)
				$_l_Delete:=Size of array:C274(AA_al_ListItemDeletion)
				$_bo_Deletions:=True:C214
			End if 
		End for 
		If (Not:C34($_bo_Deletions))
			For ($_l_Delete; 1; Size of array:C274(AA_al_SubListItemDeletion))
				If (AA_al_SubListItemDeletion{$_l_Delete}>0)
					$_l_Delete:=Size of array:C274(AA_al_SubListItemDeletion)
					$_bo_Deletions:=True:C214
				End if 
			End for 
			
		End if 
		If (Size of array:C274(AA_al_ItemIDsModified)>0) | ($_bo_Deletions) | (AA_Bo_ListtoUpdate)
			
			
			
			Gen_Confirm("Save "+AA_t_listName+"?")
			$_l_Ok:=OK
			If ($_l_Ok=1)
				$_l_ListID:=AA_SaveUpdatedList(AA_l_CurrentListiD; AA_t_listName)
			End if 
		End if 
		
	End if   //en4
	
Else   //e3
	$_l_ItemRefPosition:=Find in array:C230(<>WS_al_ListIDS; $_l_ItemReference)
	If ($_l_ItemRefPosition<0)  //5
		//not saved
		//HANG ON
		DELETE FROM LIST:C624(WS_l_HLALISTNAMES; $_l_ItemReference)
		//////////////////////////////_o_REDRAW LIST(WS_l_HLALISTNAMES)
		// WS_l_aListIDs
	Else   //it cant be deleted this way so change it back`els5
		SET LIST ITEM:C385(WS_l_HLALISTNAMES; $_l_ItemReference; AA_at_aallListNames{$_l_ItemRefPosition}; $_l_ItemReference; 0; False:C215)
		
	End if   //end 5
	//////////////////////////////_o_REDRAW LIST(WS_l_HLALISTNAMES)
End if 


//and clear it!!

//CREATE RECORD([x_Lists])

$_l_CountListItems:=Count list items:C380(WS_l_HLALISTNAMES)
Case of 
	: ($_l_CountListItems>$_l_SelectedListItem) | (True:C214)
		
		SELECT LIST ITEMS BY POSITION:C381(WS_l_HLALISTNAMES; 1)
		$_l_SelectedListItem:=1
		GET LIST ITEM:C378(WS_l_HLALISTNAMES; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText)
		GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_Ignore; $_l_Ignore)
		OBJECT GET COORDINATES:C663(WS_l_HLALISTNAMES; $_l_ListObjectLeft; $_l_ListObjectTop; $_l_ListObjecRight; $_l_ListObjectBottom)
		$_l_NextID:=AA_GetNextIDinMethod(->[X_LISTS:111]x_ID:1)
		//APPEND TO LIST(WS_l_HLALISTNAMES;"Untitled";-$_l_NextID)
		AA_LoadListtoManager(-$_l_NextID; "Untitled")
		INSERT IN LIST:C625(WS_l_HLALISTNAMES; $_l_ItemReference; "Untitled"; -$_l_NextID)
		
		////////////////////////////_o_REDRAW LIST(WS_l_HLALISTNAMES)
		POST EVENT:C467(Mouse down event:K17:2; 0; Tickcount:C458; ($_l_WIndowLeft+$_l_ListObjectLeft+2); $_l_WIndowTop+$_l_ListObjectTop+2; Command key mask:K16:1; Current process:C322)
		POST KEY:C465(Character code:C91("A"); Command key mask:K16:1; Current process:C322)
		//SM_bo_SimulateClick:=True
	: ($_l_CountListItems>0)
		GET LIST ITEM:C378(WS_l_HLALISTNAMES; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText)
		GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_Ignore; $_l_Ignore)
		OBJECT GET COORDINATES:C663(WS_l_HLALISTNAMES; $_l_ListObjectLeft; $_l_ListObjectTop; $_l_ListObjecRight; $_l_ListObjectBottom)
		$_l_NextID:=AA_GetNextIDinMethod(->[X_LISTS:111]x_ID:1)
		//APPEND TO LIST(WS_l_HLALISTNAMES;"Untitled";-$_l_NextID)
		INSERT IN LIST:C625(WS_l_HLALISTNAMES; $_l_ItemReference; "Untitled"; -$_l_NextID)
		////////////////////////////_o_REDRAW LIST(WS_l_HLALISTNAMES)
		POST EVENT:C467(Mouse down event:K17:2; 0; Tickcount:C458; ($_l_WIndowLeft+$_l_ListObjectLeft+2); ($_l_WIndowTop+$_l_ListObjectBottom-2); Command key mask:K16:1; Current process:C322)
		POST KEY:C465(Character code:C91("A"); Command key mask:K16:1; Current process:C322)
		
		
	: ($_l_CountListItems=0)
		GET LIST ITEM:C378(WS_l_HLALISTNAMES; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText)
		GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom)
		
		OBJECT GET COORDINATES:C663(WS_l_HLALISTNAMES; $_l_ListObjectLeft; $_l_ListObjectTop; $_l_ListObjecRight; $_l_ListObjectBottom)
		$_l_NextID:=AA_GetNextIDinMethod(->[X_LISTS:111]x_ID:1)
		APPEND TO LIST:C376(WS_l_HLALISTNAMES; "Untitled"; -$_l_NextID)
		// INSERT LIST ITEM(WS_l_HLALISTNAMES;$_l_ItemReference;"Untitled";-$_l_NextID)
		//////////////////////////////_o_REDRAW LIST(WS_l_HLALISTNAMES)
		POST EVENT:C467(Mouse down event:K17:2; 0; Tickcount:C458; ($_l_WIndowLeft+$_l_ListObjectLeft+2); ($_l_WIndowTop+$_l_ListObjectTop+2+(($_l_SelectedListItem*16))); Command key mask:K16:1; Current process:C322)
		POST KEY:C465(Character code:C91("A"); Command key mask:K16:1; Current process:C322)
End case 
//dont assign the following till the list has been given a name
//AA_l_CurrentListiD:=-$_l_NextID
ERR_MethodTrackerReturn("AA_LMA_newList"; $_t_oldMethodName)
