If (False:C215)
	//object Name: [USER]List_Manager.Radio Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Expanded)
	C_LONGINT:C283($_l_CountListItems; $_l_ItemReference; $_l_ListItemIndex; $_l_SubListID; AA_HL_ListItems; AA_l_CurrentSelectedItemID)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.Radio Button1"; Form event code:C388)
If (Is a list:C621(AA_HL_ListItems))
	If (AA_l_CurrentSelectedItemID>0)
		
		AA_SaveListItem(AA_l_CurrentSelectedItemID)
		
	End if 
	$_l_CountListItems:=Count list items:C380(AA_HL_ListItems)
	For ($_l_ListItemIndex; 1; $_l_CountListItems)
		GET LIST ITEM:C378(AA_HL_ListItems; $_l_ListItemIndex; $_l_ItemReference; $_t_ItemText; $_l_SubListID; $_bo_Expanded)
		If ($_l_SubListID>0)
			SET LIST ITEM:C385(AA_HL_ListItems; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SubListID; False:C215)
		End if 
	End for 
	//////_o_REDRAW LIST(AA_HL_ListItems)
End if 
ERR_MethodTrackerReturn("OBJ [USER].List_Manager.Radio Button1"; $_t_oldMethodName)
