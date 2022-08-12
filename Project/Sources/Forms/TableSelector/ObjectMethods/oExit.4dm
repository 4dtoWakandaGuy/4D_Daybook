If (False:C215)
	//object Name: Object Name:      TableSelector.oExit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(xOK)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ TableSelector.oExit"; Form event code:C388)

CANCEL:C270
xOK:=0
ERR_MethodTrackerReturn("OBJ TableSelector.oExit"; $_t_oldMethodName)