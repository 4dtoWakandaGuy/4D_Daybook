//%attributes = {}
If (False:C215)
	//Project Method Name:      CO_CloseNews
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

$_t_oldMethodName:=ERR_MethodTracker("CO_CloseNews")

//CO_CloseNews
CANCEL:C270
ERR_MethodTrackerReturn("CO_CloseNews"; $_t_oldMethodName)