//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_GetClientDetails
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
	C_BOOLEAN:C305(<>IWS_bo_ProxyServesStatic; <>IWS_bo_ViaProxy)
	C_LONGINT:C283($_l_ColonPosition)
	C_TEXT:C284(<>IME_t_BaseImageIP; <>IME_t_BaseImageLocation; $_t_oldMethodName; IME_t_BrowserApp; IME_t_BrowserMake; IME_t_BrowserVersion; IME_t_ClientIP; IME_t_ClientPlatform; IME_t_Domain; IME_t_Host; IME_t_ImageLocation)
	C_TEXT:C284(IME_t_OrgPrefix; IME_t_OriginalURLHost; IME_t_Referer; IME_t_URLHost; IWS_t_BrowserApp; IWS_t_BrowserMake; IWS_t_BrowserVersion; IWS_t_ClientPlatform; IWS_t_Domain; IWS_t_Host; IWS_t_OrgPrefix)
	C_TEXT:C284(IWS_t_Protocol; IWS_t_Referer; IWS_t_RemoteIPAddress; IWS_t_URLHost)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_GetClientDetails")
//******************************************************************************
//
//Method: IME_GetClientDetails
//
//Written by  John Moore on 10/22/98
//
//Purpose: Copies various IWS process vars into IME process vars

//NB: See also IWS_GetClientDetails  - where the values are set

//
// b23 Rollo 19990702 - changed IWS_t_IPAddress to IWS_t_RemoteIPAddress
// b24 Rollo 19990702 - Undefined variable fix + a new section preparing the
//     - ground for a change to Image variables that will be required throughout
//     - all Macros

//******************************************************************************

IME_t_ClientIP:=IWS_t_RemoteIPAddress  //Rollo 7/2/99 `IP address of client
//IME_t_ClientName:=IWS_t_ClientName  `DNS translation of above
IME_t_Referer:=IWS_t_Referer
IME_t_Domain:=IWS_t_Domain
IME_t_OrgPrefix:=IWS_t_OrgPrefix
IME_t_BrowserMake:=IWS_t_BrowserMake
IME_t_BrowserApp:=IWS_t_BrowserApp
IME_t_BrowserVersion:=IWS_t_BrowserVersion
IME_t_ClientPlatform:=IWS_t_ClientPlatform
IME_t_Host:=IWS_t_Host
IME_t_URLHost:=IWS_t_URLHost
IME_t_OriginalURLHost:=IME_t_URLHost

If ((<>IWS_bo_ViaProxy) & (IWS_bo_ViaProxy))  //Rollo 7/9/99 - ie we might be and we ARE via Proxy
	If ((<>IWS_bo_ProxyServesStatic) & (<>IME_t_BaseImageLocation="@$IP$@"))  //Rollo 7/9/99
		IME_t_ImageLocation:=Replace string:C233(<>IME_t_BaseImageLocation; "$IP$"; IWS_t_ProxyIPAddress)  //Rollo 7/9/99
	Else 
		IME_t_ImageLocation:=<>IME_t_BaseImageLocation
	End if 
Else 
	IME_t_ImageLocation:=<>IME_t_BaseImageLocation
End if 

If (IME_t_ImageLocation="@$IP$@")
	If (<>IME_t_BaseImageIP#"")
		IME_t_ImageLocation:=Replace string:C233(IME_t_ImageLocation; "$IP$"; <>IME_t_BaseImageIP)
	Else 
		IME_t_ImageLocation:=Replace string:C233(IME_t_ImageLocation; "$IP$"; "")
	End if 
Else 
	If ((Not:C34((<>IWS_bo_ViaProxy) & (IWS_bo_ViaProxy))) & (<>IME_t_BaseImageIP#"") & (IME_t_ImageLocation="/@"))
		IME_t_ImageLocation:="http://"+<>IME_t_BaseImageIP+IME_t_ImageLocation
	End if 
End if 

If (IWS_t_Protocol#"")  //this should be set every time, but just checking
	If (IME_t_ImageLocation#(IWS_t_Protocol+"@"))  //if the protocol's not the same as set on startup
		$_l_ColonPosition:=Position:C15(":"; IME_t_ImageLocation)
		If ($_l_ColonPosition>0)
			IME_t_ImageLocation:=IWS_t_Protocol+Substring:C12(IME_t_ImageLocation; $_l_ColonPosition)
		End if 
	End if 
End if 


//LOG_ResetMethod
ERR_MethodTrackerReturn("IME_GetClientDetails"; $_t_oldMethodName)