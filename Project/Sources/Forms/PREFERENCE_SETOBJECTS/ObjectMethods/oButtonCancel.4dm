
If (False:C215)
	//Object Name:      PREFERENCE_SETOBJECTS.oButton2
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/02/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_OBJECT:C1216(DB_obj_Interface)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ PREFERENCE_SETOBJECTS.oButtonCancel"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		CANCEL:C270
		OB SET:C1220(DB_obj_Interface; "Exit"; "Cancel")
End case 
ERR_MethodTrackerReturn("OBJ PREFERENCE_SETOBJECTS.oButtonCancel"; $_t_oldMethodName)
