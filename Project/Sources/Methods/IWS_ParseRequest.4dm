//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ParseRequest
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
	//ARRAY TEXT(IWS_at_HeaderNames;0)
	//ARRAY TEXT(IWS_at_Headers;0)
	//ARRAY TEXT(IWS_at_HeaderValues;0)
	C_BOOLEAN:C305(<>IWS_bo_ViaProxy; IWS_bo_IncompleteURL; IWS_bo_ValidIP; IWS_bo_ViaProxy)
	C_LONGINT:C283($_l_ArraySize; $_l_CharacterPosition; $_l_ColonPosition; $_l_ElementCount; $_l_EndPosition; $_l_Index; $_l_StartPosition; IWS_l_ContentLength)
	C_TEXT:C284(<>iEncrypt; <>IWS_t_StaticFolder; <>IWS_t_StaticPrefix; <>STR_s_Sep; <>STR_t_CR; <>STR_t_LF; $_t_CRLF; $_t_HeaderText; $_t_Line; $_t_Name; $_t_oldMethodName)
	C_TEXT:C284($_t_Value; $Temp; IWS_t_ContentType; IWS_t_Direct; IWS_t_Extension; IWS_t_Filename; IWS_t_HTTPMethod; IWS_t_HTTPVersion; IWS_t_PageType; IWS_t_Protocol; IWS_t_ProxyIPAddress)
	C_TEXT:C284(IWS_t_RemoteIPAddress; IWS_t_Request; IWS_t_Search; IWS_t_URL)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ParseRequest")
//LOG_SetMethod ("IWS_ParseRequest")

//******************************************************************************
//
//Method: IWS_ParseRequest
//
//Written by  John on 22/09/98
//rewritten John 5/30/2000

//Purpose: Derives all necessary variables from request

//******************************************************************************
$_t_CRLF:=<>STR_t_CR+<>STR_t_LF

//First get request line (everything up to first CRLF)
$_l_CharacterPosition:=Position:C15($_t_CRLF; IWS_t_Request)
$Temp:=Substring:C12(IWS_t_Request; 1; $_l_CharacterPosition-1)

$_l_CharacterPosition:=Position:C15(" /"; $Temp)
If ($_l_CharacterPosition>11)
	$_l_CharacterPosition:=11
End if 
IWS_t_HTTPMethod:=Substring:C12($Temp; 1; $_l_CharacterPosition-1)
$Temp:=Substring:C12($Temp; $_l_CharacterPosition+2)

$_l_CharacterPosition:=Position:C15(" HTTP/"; $Temp)

IWS_t_URL:=Substring:C12($Temp; 1; $_l_CharacterPosition-1)
IWS_t_HTTPVersion:=Substring:C12($Temp; $_l_CharacterPosition+6; 5)
$_l_CharacterPosition:=Position:C15("?"; IWS_t_URL)
If ($_l_CharacterPosition>0)
	IWS_t_Direct:=Substring:C12(IWS_t_URL; 1; $_l_CharacterPosition-1)
	IWS_t_Search:=Substring:C12(IWS_t_URL; $_l_CharacterPosition+1)
Else 
	IWS_t_Direct:=IWS_t_URL
	IWS_t_Search:=""
End if 

If (IWS_t_URL=(<>IWS_t_StaticPrefix+"/@")) | (IWS_t_URL=<>IWS_t_StaticPrefix)
	IWS_t_PageType:="Static"
	$_l_CharacterPosition:=Length:C16(<>IWS_t_StaticPrefix+"/")+1
	$Temp:=Substring:C12(IWS_t_URL; $_l_CharacterPosition)
	If (($Temp="/") | ($Temp=""))
		IWS_bo_IncompleteURL:=True:C214
		IWS_t_Filename:=""
	Else 
		IWS_bo_IncompleteURL:=False:C215
		IWS_t_Filename:=<>IWS_t_StaticFolder+Folder separator:K24:12+Replace string:C233($Temp; "/"; Folder separator:K24:12)
	End if 
Else 
	
	IWS_t_PageType:="Dynamic"
	IWS_t_Filename:=""  //we're going to serve up a dynamic page
End if 

//New code added by John, 5/29/2000
//Now build the header arrays
$_l_StartPosition:=Position:C15($_t_CRLF; IWS_t_Request)+Length:C16($_t_CRLF)
If ($_l_StartPosition<=Length:C16(IWS_t_Request))
	$_t_HeaderText:=Substring:C12(IWS_t_Request; $_l_StartPosition)
	$_l_EndPosition:=Position:C15($_t_CRLF+<>STR_t_CR; $_t_HeaderText)-1
	$_t_HeaderText:=Substring:C12($_t_HeaderText; 1; $_l_EndPosition)
	//get rid of any line feeds so we can parse effectively
	$_t_HeaderText:=Replace string:C233($_t_HeaderText; <>STR_t_LF; "")
	STR_Text2Array($_t_HeaderText; ->IWS_at_Headers)
	$_l_ArraySize:=Size of array:C274(IWS_at_Headers)
	UTI_ArrayResize($_l_ArraySize; ->IWS_at_HeaderNames; ->IWS_at_HeaderValues)
	$_l_ElementCount:=0
	For ($_l_Index; 1; $_l_ArraySize)
		$_t_Line:=IWS_at_Headers{$_l_Index}
		$_l_ColonPosition:=Position:C15(":"; $_t_Line)
		If ($_l_ColonPosition>0)
			$_t_Name:=STR_RemoveLeadTrailSpace(Substring:C12($_t_Line; 1; $_l_ColonPosition-1))
			$_t_Value:=STR_RemoveLeadTrailSpace(Substring:C12($_t_Line; $_l_ColonPosition+1))
			$_l_ElementCount:=$_l_ElementCount+1
			IWS_at_HeaderNames{$_l_ElementCount}:=$_t_Name
			IWS_at_HeaderValues{$_l_ElementCount}:=$_t_Value
		End if 
	End for 
	If ($_l_ElementCount<$_l_ArraySize)
		//if there were some malformed entries, we need to truncate to the real size
		UTI_ArrayResize($_l_ElementCount; ->IWS_at_HeaderNames; ->IWS_at_HeaderValues)
	End if 
	SORT ARRAY:C229(IWS_at_HeaderNames; IWS_at_HeaderValues)
End if 

//Rollo 7/9/99 - *** THIS DOES NOT WORK ***
//Rollo 7/9/99 - but it doesn't need to at the moment -if we are not via proxy
//Rollo 7/9/99 - then we can safely assume it's HTTP, not HTTPS
//$_l_CharacterPosition:=Position(":";IWS_t_Request)  `Rollo 7/9/99
//IWS_t_Protocol:=Substring(IWS_t_Request;1;$_l_CharacterPosition-1)  `Rollo 7/9/99

If (<>IWS_bo_ViaProxy)
	//If we've come via a proxy, we can't use the information from the
	//IP stream, as every request will appear to come from
	//the proxy . We have stuck an extra header field in the
	//request if it is coming from the proxy, saying where
	//it originally came from.
	IWS_t_RemoteIPAddress:=Substring:C12(IWS_GetHeaderField("Remote-Host"); 1; 15)
	IWS_CheckValidIP
	
	If (IWS_t_RemoteIPAddress#"")  //Rollo 7/9/99
		IWS_bo_ViaProxy:=True:C214  //Rollo 7/9/99
		IWS_t_Protocol:=Substring:C12(IWS_GetHeaderField("Protocol"); 1; 15)  //Rollo 7/9/99
		
	Else   //Rollo 7/9/99
		IWS_t_RemoteIPAddress:=IWS_t_ProxyIPAddress  //Rollo 7/9/99 - reset the swap of these 2 done in IWS_Handler
		IWS_t_ProxyIPAddress:=""  //Rollo 7/9/99
		IWS_bo_ViaProxy:=False:C215  //Rollo 7/9/99
	End if   //Rollo 7/9/99
	
End if 

If (IWS_t_Protocol#"https")  //Rollo 7/9/99
	IWS_t_Protocol:="http"  //Rollo 7/9/99
End if   //Rollo 7/9/99

If (IWS_bo_ValidIP)  //may have just been assigned, for
	//requests which have come via a proxy
	IWS_t_Extension:=Substring:C12(IWS_GetFileExtension(->IWS_t_Direct; True:C214); 1; 21)
	If ((<>iEncrypt="") & (IWS_t_Extension=""))  //for uncompiled code only
		IWS_t_Extension:=Substring:C12(IWS_GetFileExtension(->IWS_t_Search; True:C214); 1; 21)
	End if 
End if 

//===========================Addition goes here?=====================` Axel
//added by John, 7/19/2000
IWS_t_ContentType:=IWS_GetHeaderField("Content-Type")
If (IWS_t_ContentType#"")
	$_l_CharacterPosition:=Position:C15(";"; IWS_t_ContentType)
	If ($_l_CharacterPosition>0)  //we aren't interested in the boundary just now, so we
		//just look at the first bit
		IWS_t_ContentType:=Substring:C12(IWS_t_ContentType; 1; $_l_CharacterPosition-1)
	End if 
End if 

//added by John, 7/19/2000
$Temp:=IWS_GetHeaderField("Content-Length")
If ($Temp="")
	IWS_l_ContentLength:=-1
Else 
	IWS_l_ContentLength:=Num:C11($Temp)
End if 
//===========================Addition goes here?=====================` Axel

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_ParseRequest"; $_t_oldMethodName)