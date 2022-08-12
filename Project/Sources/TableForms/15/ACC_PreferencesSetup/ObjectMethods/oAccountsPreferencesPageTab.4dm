If (False:C215)
	//object Name: [USER]ACC_PreferencesSetup.Tab Control1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_TabControl;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PreferencesSetup.Tab Control1"; Form event code:C388)
If (ACC_at_TabControl>0)
	FORM GOTO PAGE:C247(ACC_at_TabControl)
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_PreferencesSetup.Tab Control1"; $_t_oldMethodName)
