If (False:C215)
	//object Name: Object Name:      DB_SetupAccounts.oAccountHeadings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2013 14:19
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_SetupAccounts.oAccountHeadings"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ DB_SetupAccounts.oAccountHeadings"; $_t_oldMethodName)