//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_Init
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(NTK Set Error Handler)
	//ARRAY POINTER(<>IWS_apo_Setup;0)
	C_BOOLEAN:C305(<>IWS_bo_GetUserInfo; <>IWS_bo_HitLogging; <>IWS_bo_HTTPCacheNoPages; <>IWS_bo_LoadInformerInterrupt; <>IWS_bo_Log; <>IWS_bo_LogCacheing; <>IWS_bo_MessageLog; <>IWS_bo_Shutdown; <>LOG_bo_IOLogging; <>LOG_bo_MethodLogging; <>IWS_bo_GetUserInfo)
	C_BOOLEAN:C305(<>IWS_bo_HitLogging; <>IWS_bo_HTTPCacheNoPages; <>IWS_bo_LoadInformerInterrupt; <>IWS_bo_Log; <>IWS_bo_LogCacheing; <>IWS_bo_MessageLog; <>IWS_bo_Shutdown; <>LOG_bo_IOLogging; <>LOG_bo_MethodLogging)
	C_LONGINT:C283(<>ITK_i_StreamClosed; <>ITK_l_NoStream; <>ITK_l_StreamClosed; <>ITK_l_StreamConnected; <>IWS_l_BadListens; <>IWS_l_BadReleases; <>IWS_l_CallOSDelay; <>IWS_l_CheckerChannel; <>IWS_l_CloserChannel; <>IWS_l_ConnectLog; <>IWS_l_HandlerOffset)
	C_LONGINT:C283(<>IWS_l_Listens; <>IWS_l_LoadInformerProcID; <>IWS_l_LogChannel; <>IWS_l_LoggedMessages; <>IWS_l_LogRefresh; <>IWS_l_MaxLoggedMessages; <>IWS_l_MaxOSDelay; <>IWS_l_MaxUploadBlobSize; <>IWS_l_MessageLog; <>IWS_l_MinOSDelay; <>IWS_l_PagesServed)
	C_LONGINT:C283(<>IWS_l_POSTtimeout; <>IWS_l_RcvDelay; <>IWS_l_RcvTimeout; <>IWS_l_RefuseConnections; <>IWS_l_Releases; <>IWS_l_ShowHits; <>IWS_l_ShowProcessesInLog; <>IWS_l_StatusFailure; <>IWS_l_StatusNull; <>IWS_l_StatusSuccess; <>IWS_l_sWebPort)
	C_LONGINT:C283(<>IWS_l_UDPSequence; <>IWS_l_UserInfoChannel; <>IWS_l_Webport; <>IWS_l_WinAddX; <>IWS_l_WinSizeX; <>IWS_l_WinSizeY; <>IWS_l_WinStartX; <>IWS_l_WinStartY; <>LOG_l_IOLoggingNo; $_l_NTKErrorMethodExists; $iITKVersion)
	C_LONGINT:C283(<>ITK_l_NoStream; <>ITK_l_StreamClosed; <>ITK_l_StreamConnected; <>IWS_l_BadListens; <>IWS_l_BadReleases; <>IWS_l_CallOSDelay; <>IWS_l_CheckerChannel; <>IWS_l_CloserChannel; <>IWS_l_ConnectLog; <>IWS_l_HandlerOffset; <>IWS_l_Listens)
	C_LONGINT:C283(<>IWS_l_LoadInformerProcID; <>IWS_l_LogChannel; <>IWS_l_LoggedMessages; <>IWS_l_LogRefresh; <>IWS_l_MaxLoggedMessages; <>IWS_l_MaxOSDelay; <>IWS_l_MaxUploadBlobSize; <>IWS_l_MessageLog; <>IWS_l_MinOSDelay; <>IWS_l_PagesServed; <>IWS_l_POSTtimeout)
	C_LONGINT:C283(<>IWS_l_RcvDelay; <>IWS_l_RcvTimeout; <>IWS_l_RefuseConnections; <>IWS_l_Releases; <>IWS_l_ShowHits; <>IWS_l_ShowProcessesInLog; <>IWS_l_StatusFailure; <>IWS_l_StatusNull; <>IWS_l_StatusSuccess; <>IWS_l_sWebPort; <>IWS_l_UDPSequence)
	C_LONGINT:C283(<>IWS_l_UserInfoChannel; <>IWS_l_Webport; <>IWS_l_WinAddX; <>IWS_l_WinAddY; <>IWS_l_WinSizeX; <>IWS_l_WinSizeY; <>IWS_l_WinStartX; <>IWS_l_WinStartY; <>LOG_l_IOLoggingNo; $_l_NTKErrorMethodExists)
	C_REAL:C285(<>IWS_r_BytesServed)
	C_TEXT:C284(<>IWS_t_CertificateKeyPath; <>IWS_t_CheckerProcess; <>IWS_t_CloserProcess; <>IWS_t_CommandPrefix; <>IWS_t_DynamicIndexPage; <>IWS_t_HandlerProcess; <>IWS_t_LoadTest; <>IWS_t_LocalAddress; <>IWS_t_LocalAddressAndPort; <>IWS_t_LogBuilderProcess; <>IWS_t_LogMessage)
	C_TEXT:C284(<>IWS_t_LogonPrefix; <>IWS_t_LogProcess; <>IWS_t_LSCookie; <>IWS_t_MasterProcess; <>IWS_t_PrivateKeyPassPhrase; <>IWS_t_PrivateKeyPath; <>IWS_t_ProxyPrefix; <>IWS_t_sLocalAddressAndPort; <>IWS_t_sLSCookie; <>IWS_t_StaticFolder; <>IWS_t_StaticIndexPage)
	C_TEXT:C284(<>IWS_t_StaticPrefix; <>IWS_t_UserInfoProcess; <>Web_t_ServerHandler; $_t_NTKErrorMethodName; $_t_oldMethodName; <>IWS_t_CertificateKeyPath; <>IWS_t_CheckerProcess; <>IWS_t_CloserProcess; <>IWS_t_CommandPrefix; <>IWS_t_DynamicIndexPage; <>IWS_t_HandlerProcess)
	C_TEXT:C284(<>IWS_t_LoadTest; <>IWS_t_LocalAddress; <>IWS_t_LocalAddressAndPort; <>IWS_t_LogBuilderProcess; <>IWS_t_LogMessage; <>IWS_t_LogonPrefix; <>IWS_t_LogProcess; <>IWS_t_LSCookie; <>IWS_t_MasterProcess; <>IWS_t_PrivateKeyPassPhrase; <>IWS_t_PrivateKeyPath)
	C_TEXT:C284(<>IWS_t_ProxyPrefix; <>IWS_t_sLocalAddressAndPort; <>IWS_t_sLSCookie; <>IWS_t_StaticFolder; <>IWS_t_StaticIndexPage; <>IWS_t_StaticPrefix; <>IWS_t_UserInfoProcess; <>Web_t_ServerHandler; $_t_NTKErrorMethodName; $_t_oldMethodName)
	C_TIME:C306(<>IWS_ti_HitLog; <>IWS_ti_MessageLog; <>IWS_ti_HitLog; <>IWS_ti_MessageLog)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_Init")
//******************************************************************************
//
//Method: IWS_Init
//
//Written by  John Moore on 10/19/98
//
//Purpose: Initialises all interprocess variables for this module

// b24 Rollo 19990706 - Init two new vars
//******************************************************************************

//C_INTEGER(◊ITK_i_NoStream;◊IWS_l_BadListens;◊ITK_i_StreamClosed)

Compiler_IWS_IA

IWS_Register  //for ITK_Init

<>IWS_l_Webport:=80  // If the port isn't set in the startup options file, set the default port.
<>IWS_l_sWebPort:=443  //added 18/02/08
<>IWS_t_PrivateKeyPassPhrase:=""  //18/02/08
<>IWS_t_PrivateKeyPath:=""  //13/03/08
<>IWS_t_CertificateKeyPath:=""  //13/03/08

If (Records in table:C83([WEBSETUP_4D:129])=0)
	IWS_InitWebSetup
End if 
IWS_ReadWebSetup


//**************************** added 06/10/08 v631b120 -kmw  **************************
If (<>Web_t_ServerHandler="NTK")  //If We are using NTK as web server then set an error method handler
	If (False:C215)  //Expand to view notes on "NTK Set Error Handler" from NTK manual.
		//From the manual...
		
		//The error handler is global in scope and is used for all connections in all processes. You only
		//have to call this command once at the start of your application. To clear the installed error
		//handler, pass an empty method name to this command. If no error handler is installed, all
		//error messages will be displayed as an alert message on screen.
		
		//The 4D method should handle and declare the following parameters:
		//Name Type
		//$1=Socket longint
		//$2=Error class longint
		//$3=Error message text
		
		//The error class parameter defines which subsystem triggered the error. You can use the
		//following constants:
		//• NTK Parameter Error
		//An invalid parameter was passed to the plugin.
		//• NTK OS Error
		//An error occurred at the OS level.
		//• NTK SSL Error
		//An error occurred at the SSL level(OpenSSL)0
		//Usually the error message parameter should be sufficient to help you identify th
		//the error. If however you require more information, refer to:
		//• On Mac: the"man"pages or the developer documentation on BSD sockets.
		//• On Windows: the documentation of the function WSAGetLastError()or other relevant
		//parts of the Winsock documentation.
		//• For SSL related errors, refer to the documentation of OpenSSL.
	End if 
	$_t_NTKErrorMethodName:="IWS_NTKErrorHandler"
	$_l_NTKErrorMethodExists:=NTK Set Error Handler($_t_NTKErrorMethodName)
	
	If ($_l_NTKErrorMethodExists=0)
		Gen_Alert("Developer error trying to set NTK error method handler. Method '"+$_t_NTKErrorMethodName+"' does not exist.")
	End if 
End if 
//*******************************************************************************

//Pseudoconstants:

<>IWS_t_StaticPrefix:="s"
<>IWS_t_ProxyPrefix:="sender/"
<>IWS_t_StaticIndexPage:=<>IWS_t_StaticPrefix+"/"+"index.html"
<>IWS_t_DynamicIndexPage:="index.html"
<>IWS_bo_MessageLog:=True:C214
<>IWS_bo_GetUserInfo:=False:C215  //don't use User Info feature
<>IWS_t_LogonPrefix:="logon@"
<>IWS_l_POSTtimeout:=10*60  //ticks to timeout for POST request
//we will use a different timeout for a file upload
//<>IWS_l_SQLTimeout:=1200  `ticks until we assume SQL process has failed
<>IWS_l_RcvTimeout:=600  //ticks until we can assume no more data is going to come
<>IWS_l_MaxUploadBlobSize:=1024*1024  //John, 7/20/2000



<>IWS_l_WinAddX:=20  // add to window X Position
<>IWS_l_WinAddY:=20  // to overlap them
<>IWS_l_WinSizeX:=516  // size of windows
<>IWS_l_WinSizeY:=300
If (Is Windows:C1573)  // platform dependent stuff
	<>IWS_l_WinStartX:=5
	<>IWS_l_WinStartY:=50
Else 
	<>IWS_l_WinStartX:=10
	<>IWS_l_WinStartY:=50
End if 

If (Application type:C494=4D Remote mode:K5:5)
	<>IWS_t_StaticFolder:=UTI_GetFolderName(Application file:C491)+<>IWS_t_StaticPrefix
Else 
	<>IWS_t_StaticFolder:=UTI_GetFolderName(Data file:C490)+<>IWS_t_StaticPrefix
End if 

<>IWS_l_LogRefresh:=120  //default to every 2 seconds
<>IWS_l_ShowProcessesInLog:=1
<>IWS_l_RcvDelay:=0  //John 8/14/2000 - was 2

//Variables
<>IWS_ti_MessageLog:=?00:00:00?
<>IWS_bo_Shutdown:=False:C215
<>IWS_l_ShowHits:=1
<>IWS_l_ConnectLog:=1
<>IWS_l_RefuseConnections:=0
<>IWS_bo_Log:=False:C215
<>IWS_l_MessageLog:=1
<>IWS_r_BytesServed:=0
<>IWS_l_PagesServed:=0
<>IWS_l_UDPSequence:=0

<>IWS_l_Listens:=0
<>IWS_l_BadListens:=0
<>IWS_l_Releases:=0
<>IWS_l_BadReleases:=0

//LOGGING FEATURES
<>IWS_t_LogMessage:=""
<>IWS_l_LoggedMessages:=0
<>IWS_l_MaxLoggedMessages:=50
<>IWS_bo_LogCacheing:=False:C215

//These arrays keep track of what process is connected to what server.
//They need to be cleared out each time the web server starts.

//UTI_ArrayClear (->◊SQL_as_ServerName;->◊SQL_as_ProcessName
//;->◊SQL_ai_InQueue;->◊SQL_ai_ConnectionID)

IWS_StreamArrays  //

ARRAY POINTER:C280(<>IWS_apo_Setup; 10)

<>IWS_bo_HitLogging:=False:C215  //Rollo 7/6/99
<>IWS_ti_HitLog:=?00:00:00?  //Rollo 7/6/99

<>IWS_bo_HTTPCacheNoPages:=False:C215  //Rollo 8/4/99

<>IWS_t_LoadTest:=""  //John, 12/06/99, for load testing (see IME_CGI_Search)

<>IWS_l_LoadInformerProcID:=0

<>IWS_bo_LoadInformerInterrupt:=False:C215  //Rollo 3/7/2000

<>IWS_t_CommandPrefix:="CMD-"

<>IWS_t_LSCookie:=IWS_GetLSCookie(<>IWS_t_LocalAddress; <>IWS_l_Webport)
<>IWS_t_LocalAddressAndPort:=Substring:C12(<>IWS_t_LocalAddress+":"+String:C10(<>IWS_l_Webport); 1; 79)

<>IWS_t_sLSCookie:=IWS_GetLSCookie(<>IWS_t_LocalAddress; <>IWS_l_sWebPort)  //added 18/02/08
<>IWS_t_sLocalAddressAndPort:=Substring:C12(<>IWS_t_LocalAddress+":"+String:C10(<>IWS_l_sWebPort); 1; 79)  //added 18/02/08

<>IWS_l_CallOSDelay:=1
<>IWS_l_MaxOSDelay:=8
<>IWS_l_MinOSDelay:=0

//were constants

<>IWS_t_HandlerProcess:="IWS Handler"
<>IWS_l_HandlerOffset:=1000

<>IWS_t_LogProcess:="$IWS Log"
<>IWS_t_LogBuilderProcess:="$Log Builder"
<>IWS_t_CloserProcess:="$IWS Closer"
<>IWS_t_MasterProcess:="$IWS Master"
<>IWS_t_CheckerProcess:="$IWS Checker"
<>IWS_t_UserInfoProcess:="$IWS User Info"

<>IWS_l_UserInfoChannel:=4
<>IWS_l_CloserChannel:=2
<>IWS_l_LogChannel:=3
<>IWS_l_CheckerChannel:=6

<>ITK_l_NoStream:=-1
<>ITK_l_StreamClosed:=0
<>ITK_l_StreamConnected:=8

<>IWS_l_StatusNull:=0
<>IWS_l_StatusFailure:=-1
<>IWS_l_StatusSuccess:=1

<>LOG_l_IOLoggingNo:=1
<>LOG_bo_IOLogging:=False:C215
<>LOG_bo_MethodLogging:=False:C215
ERR_MethodTrackerReturn("IWS_Init"; $_t_oldMethodName)
