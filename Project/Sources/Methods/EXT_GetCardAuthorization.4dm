//%attributes = {}
If (False:C215)
	//Project Method Name:      EXT_GetCardAuthorization
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("EXT_GetCardAuthorization")
//This method will be available as a soap reques
ERR_MethodTrackerReturn("EXT_GetCardAuthorization"; $_t_oldMethodName)