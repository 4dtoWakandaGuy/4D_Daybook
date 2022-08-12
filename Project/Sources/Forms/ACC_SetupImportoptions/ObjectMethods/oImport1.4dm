If (False:C215)
	//object Name: Object Name:      ACC_SetupImportoptions.oImport1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/07/2013 12:23
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_SetupImportoptions.oImport1"; Form event code:C388)

CANCEL:C270
ERR_MethodTrackerReturn("OBJ ACC_SetupImportoptions.oImport1"; $_t_oldMethodName)