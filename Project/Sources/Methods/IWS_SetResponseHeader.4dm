//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SetResponseHeader
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
	C_BOOLEAN:C305(<>IWS_bo_HTTPCacheNoPages)
	C_LONGINT:C283($_l_ErrorCode; $_l_MaxAge; $1; $3)
	C_TEXT:C284(<>STR_t_CRLF; $_t_CurrentTimeRFC; $_t_oldMethodName; $_t_timeOut; $2; $4; $tErrorMessage; IWS_t_MIMEType; IWS_t_ResponseHeader)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SetResponseHeader")
// IWS_SetResponseHeader
//
// b20 Rollo 19990629 - Replaced method (cacheing and unModulusing changes)
// b24 Rollo 19990709 - Replaced method

// $1 -> HTTP errorcode

//LOG_SetMethod ("IWS_SetResponseHeader")

//C_DATE($2;$dTimeoutDate)
//C_TIME($3;$tTimoutTime)


//(NB In HTTP 1.1. this takes precedence over the expire header)
$_l_MaxAge:=0
$_t_CurrentTimeRFC:=IWS_CurrentTimeRFC

If (Count parameters:C259>0)
	$_l_ErrorCode:=$1
Else 
	$_l_ErrorCode:=200
End if 

If (Count parameters:C259>1)
	//If ($2#"")  `may be empty if we're passing a max age directive
	$_t_timeOut:=$2  //eg Expires: Wed, 04 Jun 1998 22:34:07 GMT
	//End if
	If (Count parameters:C259>2)
		$_l_MaxAge:=$3
	End if 
Else 
	$_t_timeOut:=""
End if 

If (Count parameters:C259>3)
	$tErrorMessage:=$4
Else 
	$tErrorMessage:=""
End if 

//I ought really to write the conversion from these:

//If (Count parameters>1)
//$dTimeoutDate:=$2
//Else
//$dTimeoutDate:=!00/00/00!
//End if

//If (Count parameters>1)
// $dTimeoutTime:=$3
//Else
// $dTimeoutTime:=†00:00:00†
//End if

If ($tErrorMessage#"")
	IWS_t_ResponseHeader:="HTTP/1.0 "+String:C10($_l_ErrorCode)+" "+$tErrorMessage
Else 
	IWS_t_ResponseHeader:="HTTP/1.0 "
	Case of 
		: ($_l_ErrorCode=200)  // OK
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"200 OK"
		: ($_l_ErrorCode=201)  // Created
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"201 Created"
		: ($_l_ErrorCode=202)  // Accepted
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"202 Accepted"
		: ($_l_ErrorCode=204)  // No Content
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"204 No Content"
		: ($_l_ErrorCode=301)  // Moved Permanently
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"301 Moved Permanently"
		: ($_l_ErrorCode=302)  // Moved Temporarily
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"302 Moved Temporarily"
		: ($_l_ErrorCode=304)  // Not Modified
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"304 Not Modified"
		: ($_l_ErrorCode=400)  // Bad Request
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"400 Bad Request"
		: ($_l_ErrorCode=401)  // Unauthorized
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"401 Unauthorized"
		: ($_l_ErrorCode=403)  // Forbidden
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"403 Forbidden"
		: ($_l_ErrorCode=404)  // Not Found
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"404 Not Found"
		: ($_l_ErrorCode=412)  // Precondition Failed
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"412 Precondition Failed"
		: ($_l_ErrorCode=500)  // Internal Server Error
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"500 Internal Server Error"
		: ($_l_ErrorCode=501)  // Not Implemented
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"501 Not Implemented"
		: ($_l_ErrorCode=502)  // Bad Gateway
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"502 Bad Gateway"
		: ($_l_ErrorCode=503)  // Service Unavailable
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"503 Service Unavailable"
		Else 
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"404 Not Found"  // 404 Not Found
	End case 
End if 
IWS_t_ResponseHeader:=IWS_t_ResponseHeader+<>STR_t_CRLF
IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"Server: Jabberwacky"+<>STR_t_CRLF  //Rollo 6/29/99
IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"MIME-Version: 1.0"+<>STR_t_CRLF
IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"Date: "+$_t_CurrentTimeRFC+<>STR_t_CRLF
If (IWS_t_MIMEType="text/html")
	IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"Content-Type: text/html;charset=iso-8859-1"+<>STR_t_CRLF
Else 
	IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"Content-Type: "+IWS_t_MIMEType+<>STR_t_CRLF
End if 
//we will always require this, so we may as well include it here
//rather than via IWS_AddToResponseHeader

If ($_t_timeOut#"")
	IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"Expires: "+$_t_timeOut+<>STR_t_CRLF
	If ($_t_timeOut="0")  //Rollo 4/9/2000
		IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"Pragma: no-cache"+<>STR_t_CRLF
		IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"Cache-Control: no-cache;no-store"+<>STR_t_CRLF
	End if 
	If ($_l_MaxAge#0)
		
	End if 
Else   //Rollo 7/9/99
	
	If (<>IWS_bo_HTTPCacheNoPages)  //Rollo 8/4/99
		If (IWS_t_MIMEType="text/html")  //Rollo 7/9/99 - this section moved from just above
			//the following line for use with HTTP 1.0 caches (which we won't meet)
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"Pragma: no-cache"+<>STR_t_CRLF  //Rollo 7/9/99 - moved & capital P
			//the following line for use with HTTP 1.1 headers. no-store prevents any storage
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"Cache-Control: no-cache;no-store"+<>STR_t_CRLF  //Rollo 7/9/99 - new; John 10/10/99, amended in accordance with RFC
			IWS_t_ResponseHeader:=IWS_t_ResponseHeader+"Expires: "+$_t_CurrentTimeRFC+<>STR_t_CRLF  //Rollo 7/9/99 - new, changed by John to be same as Date
		End if   //Rollo 7/9/99 - moved
	End if   //Rollo 8/4/99
	
End if 

IWS_t_ResponseHeader:=IWS_t_ResponseHeader+<>STR_t_CRLF  //...making header end in CRLF pair

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_SetResponseHeader"; $_t_oldMethodName)