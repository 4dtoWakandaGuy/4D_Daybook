If (False:C215)
	//object Name: Object Name:      CONFIG_SETUP.oCRMNotAutoCaseSetting
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 10:57
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oCRMNotAutoCaseSetting")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oCRMNotAutoCaseSetting"; Form event code:C388)
[USER:15]Capitalisation:67:=2
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oCRMNotAutoCaseSetting"; $_t_oldMethodName)