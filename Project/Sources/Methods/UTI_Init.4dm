//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_Init
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
	_O_C_INTEGER:C282(<>UTI_i_SemaphoreWait)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_Init")
<>UTI_i_SemaphoreWait:=600
ERR_MethodTrackerReturn("UTI_Init"; $_t_oldMethodName)