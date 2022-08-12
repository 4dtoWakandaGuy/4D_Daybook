//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45
	//Method Name: Compiler_IWS_PV
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("Compiler_IWS_PV")
//Compiler_IWS_PV
//19990609 b5 - Rollo - Added declaration for IWS_t_DocLogText
// b24 Rollo 19990702 - a var previously only in XXX + a new var
//     - IWS_t_ProxyIPAddress
// b24 Rollo 19990709 - Two new variables

C_LONGINT:C283(IWS_l_HandlerChannel; IWS_l_Stream; IWS_l_RemoteIPAddress)
C_LONGINT:C283(IWS_l_LocalIPAddress; IWS_l_Bytes)
C_LONGINT:C283(IWS_l_Area; IWS_l_Section; IWS_l_User; IWS_l_EmptyStream)
C_LONGINT:C283(IWS_l_RemotePort; IWS_l_LocalPort)  //MODIFIED NG JANuary 2005 to match other declarations
C_TEXT:C284(IWS_t_Request; IWS_t_URL; IWS_t_Filename; IWS_t_MIMEType; IWS_t_Search; IWS_t_Direct; IWS_t_ResponseHeader)
C_TEXT:C284(IWS_t_IPAddress)
C_BOOLEAN:C305(IWS_bo_SMPTError; IWS_bo_FileUpload)
C_BOOLEAN:C305(IWS_bo_StreamEnded; IWS_bo_ResponseHeaderSent)
C_TEXT:C284(IWS_t_Message)
C_TEXT:C284(IWS_t_PostData)
C_LONGINT:C283(IWS_l_Int1; IWS_l_Int2; IWS_l_ShowHits)
C_LONGINT:C283(IWS_l_MSTaken; IWS_l_MSStart)
C_TEXT:C284(IWS_t_PageType)
C_LONGINT:C283(IWS_l_MSStartPageBuild; IWS_l_MSendPageBuild)

C_TEXT:C284(IWS_t_RemoteIPAddress)
C_TEXT:C284(IWS_t_HTTPMethod)  //e.g., GET or POST
C_TEXT:C284(IWS_t_HTTPVersion)  //e.g., 1.0 or 1.1

C_LONGINT:C283(IWS_l_IP)
C_BOOLEAN:C305(IWS_bo_IncompleteURL)
C_TEXT:C284(IWS_t_ClientName)  //to store DNS name form of client ID
//SMTP setup variables
C_TEXT:C284(IWS_t_SMTPServer; IWS_t_SMTPLocalAddr)  //SMTP srever, and our local e-mail

C_TEXT:C284(IWS_t_BrowserApp; IWS_t_BrowserMake)
C_TEXT:C284(IWS_t_BrowserVersion)
C_TEXT:C284(IWS_t_ClientPlatform)

C_TEXT:C284(IWS_t_Domain)  //e.g., [myco.]modulus.net
C_TEXT:C284(IWS_t_OrgPrefix)  //e.g. myco[.modulus.net]

C_TEXT:C284(IWS_t_Host)  //eg 99.99.99.99 usually - Rollo 3/30/2000
C_TEXT:C284(IWS_t_URLHost)  //eg myco.modulus.net or 99.99.99.99 if no forwarder or DNS - Rollo 4/4/2000

C_TEXT:C284(IWS_t_ProcessName)

C_TEXT:C284(IWS_t_Temp)
C_BLOB:C604(IWS_blb_PostDataBLOB)

C_TEXT:C284(IWS_t_Extension)

//used for stream info
C_LONGINT:C283(IWS_l_RemoteIPAddress; IWS_l_RemotePort; IWS_l_LocalPort; $_l_sort; IWS_l_LocalIPAddress)

C_TEXT:C284(IWS_t_DocLogText)  //Rollo 6/9/99

C_TEXT:C284(IWS_t_Referer)  //Rollo 7/2/99
C_TEXT:C284(IWS_t_ProxyIPAddress)  //Rollo 7/2/99

C_BOOLEAN:C305(IWS_bo_ViaProxy)  //Rollo 7/9/99
C_TEXT:C284(IWS_t_Protocol)  //Rollo 7/9/99

C_LONGINT:C283(IWS_l_Connections)

C_BOOLEAN:C305(IWS_bo_HandlerWaiting)  //added by John to help with load informing, 10/10/99

C_TEXT:C284(IWS_t_GCSLI_Event)  //Ron 12/28/99

C_TEXT:C284(IWS_t_HeaderName)  //John 5/30/2000

C_TEXT:C284(IWS_t_ContentType)  //John 7/19/2000
C_LONGINT:C283(IWS_l_ContentLength)  //John, 7/19/2000
C_BOOLEAN:C305(IWS_bo_UploadToDisk)  //John, 7/19/2000
C_TIME:C306(IWS_ti_UploadDoc)  //John, 7/19/2000
C_TEXT:C284(IWS_t_UploadDocName)  //John, 7/19/2000


ERR_MethodTrackerReturn("Compiler_IWS_PV"; $_t_oldMethodName)