If (False:C215)
	//object Name: Object Name:      TEST_SVG.oGraphPicture
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/05/2011 13:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ TEST_SVG.oGraphPicture"; Form event code:C388)
Case of 
	: ($_l_event=On Drop:K2:12)
		
End case 
ERR_MethodTrackerReturn("OBJ TEST_SVG.oGraphPicture"; $_t_oldMethodName)
