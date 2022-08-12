If (False:C215)
	//object Name: Object Name:      DB_SetupAccounts.oLBAccounts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2013 16:04
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_SetupAccounts.oLBAccounts"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ DB_SetupAccounts.oLBAccounts"; $_t_oldMethodName)