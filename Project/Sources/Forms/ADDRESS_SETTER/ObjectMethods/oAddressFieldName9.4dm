If (False:C215)
	//object Name: Object Name:      ADDRESS_SETTER.oAddressFieldName9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2013 13:00
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ ADDRESS_SETTER.oAddressFieldName9"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ ADDRESS_SETTER.oAddressFieldName9"; $_t_oldMethodName)