If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oSaveReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2011 03:00
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.oSaveReport"; Form event code:C388)
DB_REP_SaveReport
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oSaveReport"; $_t_oldMethodName)
