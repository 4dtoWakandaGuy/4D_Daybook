//%attributes = {}
If (False:C215)
	//Project Method Name:      RR_GetAustralianStateCodes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/01/2011 12:40
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

$_t_oldMethodName:=ERR_MethodTracker("RR_GetAustralianStateCodes")
ERR_MethodTrackerReturn("RR_GetAustralianStateCodes"; $_t_oldMethodName)