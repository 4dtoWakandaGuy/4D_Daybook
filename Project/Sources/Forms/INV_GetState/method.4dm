If (False:C215)
	//Project Form Method Name: INV_GetState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 13:03
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
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/INV_GetState/{formMethod}"; Form event code:C388)
ERR_MethodTrackerReturn("FM INV_GetState"; $_t_oldMethodName)