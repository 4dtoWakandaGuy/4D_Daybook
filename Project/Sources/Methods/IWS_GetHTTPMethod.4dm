//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetHTTPMethod
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
	C_LONGINT:C283($_l_CharacterPosition)
	C_TEXT:C284($_t_oldMethodName; $0; IWS_t_Request)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetHTTPMethod")
//******************************************************************************
//
//Method: IWS_GetHTTPMethod
//
//Written by  John on 20/09/98
//
//Purpose: Returns GET or POST (others possible) from request
//
//$0 - string 10, HTTP method
//
//******************************************************************************
$_l_CharacterPosition:=Position:C15(" /"; IWS_t_Request)
$0:=Substring:C12(IWS_t_Request; 1; $_l_CharacterPosition-1)
ERR_MethodTrackerReturn("IWS_GetHTTPMethod"; $_t_oldMethodName)