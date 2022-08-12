//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetURL
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

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetURL")
//******************************************************************************
//
//Method: IWS_GetURL
//
//Written by  John on 21/09/98
//
//Purpose: Gets URL from HTTP request
//
//$0 - text, URL

//******************************************************************************

//First get request line (everything up to first CRLF)
$_l_CharacterPosition:=Position:C15(<>STR_t_CRLF; IWS_t_Request)
$_t_Text:=Substring:C12(IWS_t_Request; 1; $_l_CharacterPosition-1)
//Now strip off HTTP method
$_l_CharacterPosition:=Position:C15("/"; $_t_Text)+1
$_t_Text:=Substring:C12($_t_Text; $_l_CharacterPosition)

//Now find where URL ends and version begins
$_l_CharacterPosition:=Position:C15(" HTTP/"; $_t_Text)
//URL is everything up to that
$0:=Substring:C12($_t_Text; 1; $_l_CharacterPosition-1)
ERR_MethodTrackerReturn("IWS_GetURL"; $_t_oldMethodName)