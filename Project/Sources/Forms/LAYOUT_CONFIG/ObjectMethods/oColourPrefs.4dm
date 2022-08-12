If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.oColourPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/03/2011 08:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(DB_aptr_Setup;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.oColourPrefs"; Form event code:C388)

Mod_PersonFunc
LBi_InclFields(->DB_aptr_Setup; True:C214; True:C214)
LBi_LoadSetup(->DB_aptr_Setup)
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.oColourPrefs"; $_t_oldMethodName)
