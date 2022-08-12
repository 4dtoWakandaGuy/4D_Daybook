If (False:C215)
	//object Method Name: Object Name:      [X_LISTS].Display_list_Dialogue.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 23:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	C_LONGINT:C283($_l_ListID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [X_LISTS].Display_list_Dialogue.Variable7"; Form event code:C388)
//AA_LISTDEFAULTS($_t_DefaultListName)
$_l_ListID:=AA_LoadListByName([X_LISTS:111]x_ListName:2; ->AA_at_ListItems; ->AA_al_ListItemIDs; False:C215)

ERR_MethodTrackerReturn("OBJ [X_LISTS].Display_list_Dialogue.Variable7"; $_t_oldMethodName)
