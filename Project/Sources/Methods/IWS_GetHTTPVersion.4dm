//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetHTTPVersion
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
	C_TEXT:C284(<>STR_t_CRLF; $_t_oldMethodName; $0; $_t_Text; IWS_t_Request)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetHTTPVersion")
//******************************************************************************
//
//Method: IWS_GetHTTPVersion
//
//Written by  John on 21/09/98
//
//Purpose: Returns HTTP version from request
//
//$0 - string 5, HTTP version
//
//******************************************************************************


//First get request line (everything up to first CRLF)
$_l_CharacterPosition:=Position:C15(<>STR_t_CRLF; IWS_t_Request)
$_t_Text:=Substring:C12(IWS_t_Request; 1; $_l_CharacterPosition-1)
$_l_CharacterPosition:=Position:C15("HTTP/"; $_t_Text)
//HTTP version is everything after that
$0:=Substring:C12($_t_Text; $_l_CharacterPosition+5)
ERR_MethodTrackerReturn("IWS_GetHTTPVersion"; $_t_oldMethodName)