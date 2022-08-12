//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      DOM_ReferenceIsValidOnError
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
	C_LONGINT:C283(DOM_l_ReferenceIsValidError)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOM_ReferenceIsValidOnError")


DOM_l_ReferenceIsValidError:=Error

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("DOM_ReferenceIsValidOnError"; $_t_oldMethodName)