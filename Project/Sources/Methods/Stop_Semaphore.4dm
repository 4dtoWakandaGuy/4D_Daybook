//%attributes = {}
If (False:C215)
	//Project Method Name:      Stop_Semaphore
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
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stop_Semaphore")
If ($1#"")
	CLEAR SEMAPHORE:C144($1)
End if 
ERR_MethodTrackerReturn("Stop_Semaphore"; $_t_oldMethodName)
