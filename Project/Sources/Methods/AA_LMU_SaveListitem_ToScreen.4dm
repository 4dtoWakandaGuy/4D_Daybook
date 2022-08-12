//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LMU_SaveListitem_ToScreen
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_2DItemAttributes;0)
	//ARRAY LONGINT(AA_al_2DItemAttributesLIstID;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_ListItemvalue;0)
	//ARRAY TEXT(AA_at_2DItemAttributes;0)
	//ARRAY TEXT(AA_at_2DItemAttributesLIstNM;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_ListItemvalue;0)
	C_LONGINT:C283($_l_ListItemPosition; AA_l_CurrentItemID; AA_l_CurrentSelectedProperty; Bsave; WS_l_CurrentItemROW)
	C_TEXT:C284($_t_oldMethodName; AA_t_AddorModLabel; AA_t_NewListItem)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LMU_SaveListitem_ToScreen")
//this method save a list item to screen in the form
//[x_Lists];"Display_list_Dialog
Case of 
	: (AA_l_CurrentItemID=0)
		//this is not a saved item
		CONFIRM:C162("Save "+AA_t_NewListItem+"?"; "Save"; "Clear")
		If (OK=1)
			$_l_ListItemPosition:=Find in array:C230(AA_at_ListItems; AA_t_NewListItem)
			If ($_l_ListItemPosition>0)
				//this item already exists-cannot save it
				//   ALERT(AA_t_NewListItem+" Already exists, it cannot be added twice")
				Gen_Alert(AA_t_NewListItem+" Already exists. It cannot be added twice.")
				If (WS_l_CurrentItemROW>0)
					//rows have been created so delete them
					DELETE FROM ARRAY:C228(AA_at_ListItems; WS_l_CurrentItemROW; 1)
					DELETE FROM ARRAY:C228(AA_al_ListItemIDs; WS_l_CurrentItemROW; 1)
					DELETE FROM ARRAY:C228(AA_al_2DItemAttributesLIstID; WS_l_CurrentItemROW; 1)
					DELETE FROM ARRAY:C228(AA_al_2DItemAttributes; WS_l_CurrentItemROW; 1)
					DELETE FROM ARRAY:C228(AA_at_2DItemAttributesLIstNM; WS_l_CurrentItemROW; 1)
					DELETE FROM ARRAY:C228(AA_at_2DItemAttributes; WS_l_CurrentItemROW; 1)
				End if 
			Else 
				If (WS_l_CurrentItemROW=0)  //the rows have not been created for this
					INSERT IN ARRAY:C227(AA_at_ListItems; Size of array:C274(AA_at_ListItems)+1; 1)
					INSERT IN ARRAY:C227(AA_al_ListItemIDs; Size of array:C274(AA_al_ListItemIDs)+1; 1)
					INSERT IN ARRAY:C227(AA_al_2DItemAttributesLIstID; Size of array:C274(AA_al_2DItemAttributesLIstID)+1; 1)
					INSERT IN ARRAY:C227(AA_al_2DItemAttributes; Size of array:C274(AA_al_2DItemAttributes)+1; 1)
					INSERT IN ARRAY:C227(AA_at_2DItemAttributesLIstNM; Size of array:C274(AA_at_2DItemAttributesLIstNM)+1; 1)
					INSERT IN ARRAY:C227(AA_at_2DItemAttributes; Size of array:C274(AA_at_2DItemAttributes)+1; 1)
					WS_l_CurrentItemROW:=Size of array:C274(AA_at_ListItems)
				End if 
				//put the data in
				AA_at_ListItems{WS_l_CurrentItemROW}:=AA_t_NewListItem
				AA_al_ListItemIDs{WS_l_CurrentItemROW}:=-Size of array:C274(AA_al_ListItemIDs)
				AA_LMU_SaveProperty
			End if 
			
		Else 
			//Clear the item
			If (WS_l_CurrentItemROW>0)
				//rows have been created so delete them
				DELETE FROM ARRAY:C228(AA_at_ListItems; WS_l_CurrentItemROW; 1)
				DELETE FROM ARRAY:C228(AA_al_ListItemIDs; WS_l_CurrentItemROW; 1)
				DELETE FROM ARRAY:C228(AA_al_2DItemAttributesLIstID; WS_l_CurrentItemROW; 1)
				DELETE FROM ARRAY:C228(AA_al_2DItemAttributes; WS_l_CurrentItemROW; 1)
				DELETE FROM ARRAY:C228(AA_at_2DItemAttributesLIstNM; WS_l_CurrentItemROW; 1)
				DELETE FROM ARRAY:C228(AA_at_2DItemAttributes; WS_l_CurrentItemROW; 1)
			End if 
			AA_l_CurrentSelectedProperty:=0
			
		End if 
		AA_t_AddorModLabel:="Enter New item"
		OBJECT SET TITLE:C194(Bsave; "Save")
		
	Else 
		//This is a currently Saved item-updating it
		WS_l_CurrentItemROW:=Find in array:C230(AA_al_ListItemIDs; AA_l_CurrentItemID)
		AA_at_ListItems{Find in array:C230(AA_al_ListItemIDs; AA_l_CurrentItemID)}:=AA_t_NewListItem
		AA_LMU_SaveProperty
		
		OBJECT SET TITLE:C194(bsave; "Clear")
		AA_t_AddorModLabel:="Enter New item"
End case 
AA_t_NewListItem:=""
AA_l_CurrentItemID:=0  //the item ID
WS_l_CurrentItemROW:=0  //the Item ROW
//the row is used especially when creating ROWS in the 2D array
//for Items which have not been created yet
ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; 0)
ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; 0)
ARRAY TEXT:C222(AA_at_ListItemvalue; 0)
ARRAY LONGINT:C221(AA_al_ListItemvalue; 0)
ERR_MethodTrackerReturn("AA_LMU_SaveListitem_ToScreen"; $_t_oldMethodName)
