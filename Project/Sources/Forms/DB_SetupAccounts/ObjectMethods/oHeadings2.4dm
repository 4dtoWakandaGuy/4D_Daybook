If (False:C215)
	//object Name: Object Name:      DB_SetupAccounts.oHeadings2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/08/2013 15:30
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_SetupAccounts/oHeadings2"; Form event code:C388)


$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_SetupAccounts.oHeadings2"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ DB_SetupAccounts.oHeadings2"; $_t_oldMethodName)