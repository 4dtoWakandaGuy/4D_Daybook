//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_Redirect
	//------------------ Method Notes ------------------
	//Method: IWS_Redirect
	//
	//Written by  John on 22/09/98
	//
	//Purpose: Redirects browser to another location
	
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Error; IWS_l_Stream)
	C_TEXT:C284(<>IWS_t_DynamicIndexPage; <>IWS_t_StaticIndexPage; <>STR_t_CRLF; <>Web_t_ServerHandler; $_t_oldMethodName; $_t_RedirectPage; $_t_TempURL; $1; IWS_t_CurrentMethodName; IWS_t_PageType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_Redirect")


Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		If (IWS_t_PageType="Static")
			$_t_RedirectPage:=<>IWS_t_StaticIndexPage
		Else 
			$_t_RedirectPage:=<>IWS_t_DynamicIndexPage
		End if 
		$_t_TempURL:="HTTP/1.0 301 Moved Permanently"+<>STR_t_CRLF
		$_t_TempURL:=$_t_TempURL+"Location: "
		$_t_TempURL:=$_t_TempURL+"http://"+IWS_LocalIPAddress+"/"+$_t_RedirectPage+<>STR_t_CRLF+<>STR_t_CRLF
		//$_l_Error:=ITK_TCPSend (IWS_l_Stream;$_t_TempURL;1))ITK OUT AUgust 2009
		
	: (<>Web_t_ServerHandler="NTK")
		
		
		IWS_t_CurrentMethodName:="IWS_Redirect"
		
		
		If (Count parameters:C259>0)
			$_t_RedirectPage:=$1
		Else 
			If (IWS_t_PageType="Static")
				$_t_RedirectPage:=<>IWS_t_StaticIndexPage
			Else 
				$_t_RedirectPage:=<>IWS_t_DynamicIndexPage
			End if 
		End if 
		
		$_t_TempURL:="HTTP/1.0 301 Moved Permanently"+<>STR_t_CRLF
		$_t_TempURL:=$_t_TempURL+"Location: "
		$_t_TempURL:=$_t_TempURL+"http://"+IWS_LocalIPAddress+"/"+$_t_RedirectPage+<>STR_t_CRLF+<>STR_t_CRLF
		$_l_Error:=TCP Send(IWS_l_Stream; $_t_TempURL)
		//
	Else 
		
End case 
ERR_MethodTrackerReturn("IWS_Redirect"; $_t_oldMethodName)