If (False:C215)
	//Project Form Method Name: DB_LicenceValidateDateCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:54
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
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/DB_LicenceValidateDateCode/{formMethod}"; Form event code:C388)
ERR_MethodTrackerReturn("FM DB_LicenceValidateDateCode"; $_t_oldMethodName)