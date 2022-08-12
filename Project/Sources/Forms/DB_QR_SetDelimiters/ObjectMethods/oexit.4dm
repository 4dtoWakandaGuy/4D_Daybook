If (False:C215)
	//object Name: Object Name:      DB_QR_SetDelimiters.oexit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 15:47
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_SetDelimiters.oexit"; Form event code:C388)

ACCEPT:C269
ERR_MethodTrackerReturn("OBJ DB_QR_SetDelimiters.oexit"; $_t_oldMethodName)