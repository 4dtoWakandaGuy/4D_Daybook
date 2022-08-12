//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LMA_NewSubListItem
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
	//ARRAY LONGINT(AA_al_ItemIDsModified;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_SubListCRHLID;0)
	//ARRAY LONGINT(AA_al_SublistCRID;0)
	C_BOOLEAN:C305($_bo_Expanded; AA_bo_SimulateClick)
	C_LONGINT:C283($_l_AddtoItemRef; $_l_BeforeItemReference; $_l_CountListItems; $_l_ItemPosition; $_l_ItemReference; $_l_ItemReference2; $_l_ListItemParent; $_l_Number; $_l_ParentObject; $_l_SelectedListItem; $_l_SelectedListItem2)
	C_LONGINT:C283($_l_SublistID; $_l_SublistID2; $_l_WindowLeft; $_l_WindowTop; AA_HL_ListItems; AA_l_CurrentSelectedItemID)
	C_TEXT:C284($_t_BeforeItemText; $_t_ItemText; $_t_ItemText2; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LMA_NewSubListItem")
//this method is called in the list manager administrator window
//to add a new  sub list item
//NOTE it is specific to that window

AA_bo_SimulateClick:=True:C214

$_t_ItemText:=""
$_t_ItemText:="Untitled"
$_t_ItemText:=Gen_Request("Name This subitem:"; ""; "Save"; "Cancel"; $_l_WindowLeft; $_l_WindowTop; "Add subitem")
If (OK=0)
	$_t_ItemText:=""
End if 
If ($_t_ItemText#"")
	
	//does the existing list item need saving
	If (AA_l_CurrentSelectedItemID#0)
		AA_SaveListItem(AA_l_CurrentSelectedItemID)
	End if 
	$_l_SelectedListItem:=Selected list items:C379(AA_HL_ListItems)
	GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
	$_l_ListItemParent:=List item parent:C633(AA_HL_ListItems; $_l_ItemReference)
	GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
	//if there is no parent this is the parent
	//else we are going to append to the sublist
	If ($_l_ListItemParent#0)
		//select the parent and append to that
		SELECT LIST ITEMS BY REFERENCE:C630(AA_HL_ListItems; $_l_ListItemParent)
		$_l_SelectedListItem:=Selected list items:C379(AA_HL_ListItems)
		$_l_ParentObject:=$_l_SelectedListItem
		GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
	Else 
		//check there is a  sublist-if not-create it
		GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID)
	End if 
	For ($_l_SelectedListItem2; Count list items:C380(AA_HL_ListItems); 1; -1)
		GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem2; $_l_ItemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded)
		SET LIST ITEM:C385(AA_HL_ListItems; $_l_ItemReference2; $_t_ItemText2; $_l_ItemReference2; $_l_SublistID2; False:C215)
	End for 
	SELECT LIST ITEMS BY REFERENCE:C630(AA_HL_ListItems; $_l_ItemReference)
	$_l_SelectedListItem:=Selected list items:C379(AA_HL_ListItems)
	$_l_ParentObject:=$_l_SelectedListItem
	GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference2; $_t_ItemText2; $_l_SublistID; $_bo_Expanded)
	//the item is now expanded
	$_l_AddtoItemRef:=$_l_ItemReference
	If ($_l_SublistID=0)
		$_l_SublistID:=New list:C375
		READ WRITE:C146([X_LISTS:111])
		CREATE RECORD:C68([X_LISTS:111])
		[X_LISTS:111]x_ListName:2:=$_t_ItemText2
		$_l_Number:=0
		$_l_Number:=$_l_Number ?+ 5
		AA_SetListProperty("ACCESS"; $_l_Number)
		DB_SaveRecord(->[X_LISTS:111])
		AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
		//AA_l_CurrentSelectedItemID:=[x_Lists]x_ID
		$_l_ItemPosition:=Find in array:C230(AA_al_ListItemIDs; $_l_AddtoItemRef)
		If ($_l_ItemPosition>0)
			INSERT IN ARRAY:C227(AA_al_ItemIDsModified; Size of array:C274(AA_al_ItemIDsModified)+1; 1)
			AA_al_ItemIDsModified{Size of array:C274(AA_al_ItemIDsModified)}:=$_l_AddtoItemRef
			
			AA_al_SublistCRID{$_l_ItemPosition}:=[X_LISTS:111]x_ID:1
			AA_al_SubListCRHLID{$_l_ItemPosition}:=$_l_SublistID
		Else 
			Gen_Alert("ERROR")
			
		End if 
		
		UNLOAD RECORD:C212([X_LISTS:111])
		READ ONLY:C145([X_LISTS:111])
	End if 
	SET LIST ITEM:C385(AA_HL_ListItems; $_l_ItemReference2; $_t_ItemText2; $_l_ItemReference2; $_l_SublistID; True:C214)
	OBJECT SET ENTERABLE:C238(AA_HL_ListItems; True:C214)
	$_l_CountListItems:=Count list items:C380($_l_SublistID)
	AA_l_CurrentSelectedItemID:=-(AA_GetNextIDinMethod(->[LIST_ITEMS:95]X_ID:3))
	
	If ($_l_CountListItems=0)
		APPEND TO LIST:C376($_l_SublistID; $_t_ItemText; AA_l_CurrentSelectedItemID; 0; True:C214)
		SET LIST ITEM:C385(AA_HL_ListItems; $_l_ItemReference2; $_t_ItemText2; $_l_ItemReference2; $_l_SublistID; True:C214)
	Else 
		GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem+1; $_l_BeforeItemReference; $_t_BeforeItemText)
		SELECT LIST ITEMS BY REFERENCE:C630(AA_HL_ListItems; $_l_BeforeItemReference)
		INSERT IN LIST:C625($_l_SublistID; $_l_BeforeItemReference; $_t_ItemText; AA_l_CurrentSelectedItemID; 0; True:C214)
	End if 
	
	
	
End if 

AA_bo_SimulateClick:=False:C215
ERR_MethodTrackerReturn("AA_LMA_NewSubListItem"; $_t_oldMethodName)
