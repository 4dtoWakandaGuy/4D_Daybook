If (False:C215)
	//object Name: [USER]STK_LocationsEditor.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 16:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Page)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_LocationsEditor.Variable10"; Form event code:C388)

$_l_Page:=FORM Get current page:C276
FORM GOTO PAGE:C247($_l_Page-1)
ERR_MethodTrackerReturn("OBJ [USER].STK_LocationsEditor.Variable10"; $_t_oldMethodName)
