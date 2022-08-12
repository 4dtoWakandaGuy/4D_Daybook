If (False:C215)
	//Project Form Method Name: OUTPUT_HANDLER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 13:04
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
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/OUTPUT_HANDLER/{formMethod}"; Form event code:C388)
ERR_MethodTrackerReturn("FM OUTPUT_HANDLER"; $_t_oldMethodName)