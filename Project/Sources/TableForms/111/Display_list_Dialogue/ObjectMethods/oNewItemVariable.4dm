If (False:C215)
	//object Method Name: Object Name:      [X_LISTS].Display_list_Dialogue.oNewItemVariable
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
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_ListItemvalue;0)
	//ARRAY LONGINT(AA_al_ListPropTypesID;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItemvalue;0)
	//ARRAY TEXT(AA_at_ListPropertyTypes;0)
	C_LONGINT:C283($_l_Event; $_l_Index; $_l_PropertiesCount; $_l_Row; AA_l_CurrentItemID; bsave)
	C_TEXT:C284($_t_oldMethodName; AA_t_NewListItem)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [X_LISTS].Display_list_Dialogue.oNewItemVariable"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Data Change:K2:15)
		If (AA_t_NewListItem#"")
			OBJECT SET TITLE:C194(*; "oSaveItemButton"; "Save")
			If (AA_l_CurrentItemID=0)
				$_l_PropertiesCount:=Size of array:C274(AA_at_ListPropertyTypes)
				ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; $_l_PropertiesCount)
				ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; $_l_PropertiesCount)
				ARRAY TEXT:C222(AA_at_ListItemvalue; $_l_PropertiesCount)
				ARRAY LONGINT:C221(AA_al_ListItemvalue; $_l_PropertiesCount)
				$_l_Row:=Find in array:C230(AA_al_ListItemIDs; AA_l_CurrentItemID)
				For ($_l_Index; 1; Size of array:C274(AA_at_ListItemPropertyTypes))
					AA_al_ListItemPropertyTypes{$_l_Index}:=AA_al_ListPropTypesID{$_l_Index}
					AA_at_ListItemPropertyTypes{$_l_Index}:=AA_at_ListPropertyTypes{$_l_Index}
				End for 
				
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [X_LISTS].Display_list_Dialogue.oNewItemVariable"; $_t_oldMethodName)
