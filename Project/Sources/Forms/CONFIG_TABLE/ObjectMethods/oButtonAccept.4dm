If (False:C215)
	//object Name: Object Name:      CONFIG_TABLE.oButtonAccept
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 09:09
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_TABLE.oButtonAccept")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_TABLE.oButtonAccept"; Form event code:C388)

ACCEPT:C269
ERR_MethodTrackerReturn("OBJ CONFIG_TABLE.oButtonAccept"; $_t_oldMethodName)