If (False:C215)
	//object Name: [USER]WS_SetManager.Variable20
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/04/2011 09:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $_l_ItemReference; $_l_SelectedListItem; $_l_SourceProcess; $_l_SubListID; $_l_TableNumber; SM_HL_l_SETMANAGER; SM_SaveSelection)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Variable20"; Form event code:C388)
$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
If ($_l_SelectedListItem>0)
	GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
	If ($_l_ItemReference<10000)  // a context is selected(max 9999 lists!)
		OBJECT SET ENABLED:C1123(SM_SaveSelection; True:C214)
		//_O_ENABLE BUTTON(SM_SaveSelection)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Variable20"; $_t_oldMethodName)
