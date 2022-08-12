//%attributes = {}
If (False:C215)
	//Project Method Name:      NTK_HTTP_SETURL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 14:52`Method: NTK_HTTP_SETURL
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(HTTP_Port)
	C_TEXT:C284($_t_oldMethodName; $1; HTTP_Host; HTTP_Path; HTTP_Protocol; HTTP_URL)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("NTK_HTTP_SETURL")


// Sets the URL for a HTTP request
// $1 = URL


HTTP_URL:=$1

// Extract the protocol and port to use
Case of 
	: (HTTP_URL="http://@")
		HTTP_Protocol:="http"
		HTTP_Port:=80
	: (HTTP_URL="https://@")
		HTTP_Protocol:="https"
		HTTP_Port:=443
End case 

// Extract the domain name and path to the resource
HTTP_Host:=NTK_StringFindBetween(HTTP_URL; "://"; "/")
If (HTTP_Host="")
	HTTP_Host:=NTK_StringFindBetween(HTTP_URL; "://")
End if 
HTTP_Path:=NTK_StringFindBetween(HTTP_URL; HTTP_Host)

If (Position:C15(":"; HTTP_Host)>0)
	HTTP_Port:=Num:C11(NTK_StringFindBetween(HTTP_Host; ":"; ""))
	HTTP_Host:=NTK_StringFindBetween(HTTP_Host; ""; ":")
End if 
ERR_MethodTrackerReturn("NTK_HTTP_SETURL"; $_t_oldMethodName)  // (PM) HTTP_SetURL