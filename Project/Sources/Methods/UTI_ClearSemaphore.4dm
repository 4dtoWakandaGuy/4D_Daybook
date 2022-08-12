//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_ClearSemaphore
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
	C_TEXT:C284($_t_oldMethodName; $_t_SemaphoreName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_ClearSemaphore")
//Method: UTI_ClearSemaphore
//
//Purpose: Wrapper for CLEAR SEMAPHORE

//we don't want logging routines here

If (Count parameters:C259>=1)
	$_t_SemaphoreName:=$1
	
	CLEAR SEMAPHORE:C144($_t_SemaphoreName)
	
End if 
ERR_MethodTrackerReturn("UTI_ClearSemaphore"; $_t_oldMethodName)
