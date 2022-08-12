//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      DOM_StartCustomErrorHandling
	//------------------ Method Notes ------------------
	//*****************************************************************************
	////
	////  DOM_StartCustomErrorHandling
	////
	////  Written by Charles Vass - 08/12/2009, 10:17
	////
	////  Purpose:
	////
	////  $1 - type - purpose
	////
	////
	//*****************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DOM_l_PreviousValueOfError; DOM_l_ReferenceIsValidError)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; DOM_t_PreviousErrorHandler)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOM_StartCustomErrorHandling")


Error:=0

DOM_t_PreviousErrorHandler:=Method called on error:C704
DOM_l_PreviousValueOfError:=Error
DOM_l_ReferenceIsValidError:=0  // Assign a value in error method, if run.
Error:=0


ON ERR CALL:C155("DOM_ReferenceIsValidOnError")
ERR_MethodTrackerReturn("DOM_StartCustomErrorHandling"; $_t_oldMethodName)