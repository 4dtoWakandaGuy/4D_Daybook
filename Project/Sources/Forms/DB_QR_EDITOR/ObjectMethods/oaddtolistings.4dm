If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oaddtolistings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/03/2012 12:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_QR_EDITOR/oaddtolistings"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oaddtolistings"; $_t_oldMethodName)