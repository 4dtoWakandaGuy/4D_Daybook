If (False:C215)
	//object Name: Object Name:      PRT_DymoLabelProject.oAddObject1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2012 20:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRT_lb_ListboxPrintObjects;0)
	//ARRAY TEXT(PRT_At_LabelObjects;0)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ PRT_DymoLabelProject.oAddObject1"; Form event code:C388)
LISTBOX GET CELL POSITION:C971(PRT_lb_ListboxPrintObjects; $_l_Column; $_l_Row)
If ($_l_Row>0)
	Gen_Confirm("Are you sure you want to delete the selected object?"; "No"; "Yes")
	If (OK=0)
		LISTBOX DELETE ROWS:C914(PRT_lb_ListboxPrintObjects; Size of array:C274(PRT_At_LabelObjects))
	End if 
	OK:=0
End if 
ERR_MethodTrackerReturn("OBJ PRT_DymoLabelProject.oAddObject1"; $_t_oldMethodName)
