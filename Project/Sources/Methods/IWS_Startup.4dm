//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_Startup
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
	C_BOOLEAN:C305(<>IWS_bo_LoadInformerInterrupt; <>SYS_bo_StartWebServer; $bMayStartWebServer; $Monitor)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_Startup")

//Modification History:
//10/20/98 S. Frey - added call to MAC_LoadStartupMacros
//11/29/99 R.Feavyear - added GCS may start web server check

<>IWS_bo_LoadInformerInterrupt:=True:C214

$bMayStartWebServer:=True:C214  //GCS_MayStartWebServer

If ((<>SYS_bo_StartWebServer) & ($bMayStartWebServer))
	IWS_StartWebServer
End if 

<>IWS_bo_LoadInformerInterrupt:=False:C215
ERR_MethodTrackerReturn("IWS_Startup"; $_t_oldMethodName)