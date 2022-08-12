//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      DOM_StopCustomErrorHandling
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DOM_l_PreviousValueOfError)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; DOM_t_PreviousErrorHandler)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOM_StopCustomErrorHandling")


ON ERR CALL:C155(DOM_t_PreviousErrorHandler)  // Restore original error handler.
Error:=DOM_l_PreviousValueOfError  // Restore original value of Error.
ERR_MethodTrackerReturn("DOM_StopCustomErrorHandling"; $_t_oldMethodName)