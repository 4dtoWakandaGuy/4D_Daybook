If (False:C215)
	//object Name: [USER]WS_SetManager.Radio Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2011 20:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ItemReference; $_l_SelectedListItem; $_l_SubListID; SM_HL_l_SETMANAGER; SM_SaveSelection)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Radio Button1"; Form event code:C388)

$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
If ($_l_SelectedListItem>0)
	GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
	If ($_l_ItemReference<10000)  // a context is selected(max 9999 lists!)
		//_O_ENABLE BUTTON(SM_SaveSelection)
		OBJECT SET ENABLED:C1123(SM_SaveSelection; True:C214)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Radio Button1"; $_t_oldMethodName)
