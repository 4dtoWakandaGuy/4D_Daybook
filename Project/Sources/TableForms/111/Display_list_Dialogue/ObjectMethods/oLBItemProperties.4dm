If (False:C215)
	//object Method Name: Object Name:      [X_LISTS].Display_list_Dialogue.oLBItemProperties
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/10/2012 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(WS_Lb_ItemProperties;0)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	C_LONGINT:C283($_l_Event; $_l_SelectedColumn; $_l_SelectedRow; AA_l_CurrentSelectedProperty)
	C_TEXT:C284($_t_ColumnName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [X_LISTS].Display_list_Dialogue.oLBItemProperties"; Form event code:C388)


AA_LMU_SaveProperty
AA_l_CurrentSelectedProperty:=0
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		
		LISTBOX GET CELL POSITION:C971(*; "oLBItemProperties"; $_l_SelectedColumn; $_l_SelectedRow)
		If ($_l_SelectedRow>0)
			
			AA_LoadListItemProperty(AA_al_ListItemPropertyTypes{$_l_SelectedRow})
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [X_LISTS].Display_list_Dialogue.oLBItemProperties"; $_t_oldMethodName)
