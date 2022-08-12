If (False:C215)
	//object Name: Object Name:      PRT_DymoLabelProject.oPrintOrientation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/05/2012 15:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PRT_at_PrintOrientation;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; PRT_t_PrintOrientation)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PRT_DymoLabelProject.oPrintOrientation"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		PRT_t_PrintOrientation:=PRT_at_PrintOrientation{PRT_at_PrintOrientation}
End case 
ERR_MethodTrackerReturn("OBJ PRT_DymoLabelProject.oPrintOrientation"; $_t_oldMethodName)
