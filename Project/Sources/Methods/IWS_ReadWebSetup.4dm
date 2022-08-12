//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ReadWebSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>IWS_bo_Autodismiss; <>IWS_bo_ConnectLogging; <>IWS_bo_HitLogging; <>IWS_bo_MessageLogging; <>IWS_bo_ProxyServesStatic; <>IWS_bo_RestrictAccess; <>IWS_bo_StreamLogging; <>IWS_bo_UseCache; <>IWS_bo_UseLoadInformer; <>IWS_bo_UseWatchdog; <>IWS_bo_ViaProxy)
	C_BOOLEAN:C305(<>LOG_bo_Debug; <>LOG_bo_IOLogging; <>LOG_bo_RemoteLogging)
	C_LONGINT:C283(<>IWS_l_HandlerCheckInterval; <>IWS_l_HandlerMultiple; <>IWS_l_LoadInformerPause; <>IWS_l_LoadInformerPort; <>IWS_l_MasterDelay; <>IWS_l_MaxHandlers; <>IWS_l_MinHandlers; <>IWS_l_SQLTimeout; <>IWS_l_sWebport; <>IWS_l_WatchdogPort; <>IWS_l_Webport)
	C_LONGINT:C283($Dummy)
	C_REAL:C285(<>LOG_i_RemoteAddress; <>LOG_i_RemotePort)
	C_TEXT:C284(<>IWS_t_LoadInformerAddress; <>IWS_t_LocalAddress; <>IWS_t_CertificateKeyPath; <>IWS_t_PrivateKeyPassPhrase; <>IWS_t_PrivateKeyPath; <>IWS_t_SameServer; <>IWS_t_sSameServer; <>LOG_s_BugAddressee; <>LOG_s_BugSender; <>LOG_s_RemoteAddress; <>LOG_s_SMTPServer)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ReadWebSetup")
// IWS_ReadWebSetup
//
// b24 Rollo 19990706 - initialize new var <>IWS_bo_HitLogging

//Method: IWS_ReadWebSetup
ALL RECORDS:C47([WEBSETUP_4D:129])
If (Records in selection:C76([WEBSETUP_4D:129])>1)
	//IWS_SendToLog ("ERROR: There is more than one web setup record!")
	//NO, cannot call that becuase the Log vars haven't been defined yet
End if 

<>Web_t_ServerHandler:=[WEBSETUP_4D:129]WebServerUses:33

Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		<>IWS_l_MinHandlers:=[WEBSETUP_4D:129]Handlers:1
		<>IWS_l_HandlerMultiple:=[WEBSETUP_4D:129]Multiple:2
		<>IWS_l_HandlerCheckInterval:=[WEBSETUP_4D:129]CheckInterval:3
		<>IWS_bo_MessageLogging:=[WEBSETUP_4D:129]MessageLogging:4
		<>IWS_bo_ConnectLogging:=[WEBSETUP_4D:129]ConnectLogging:5
		<>IWS_l_Webport:=[WEBSETUP_4D:129]Webport:6
		<>IWS_l_SQLTimeout:=[WEBSETUP_4D:129]OracleTimeout:7
		<>IWS_bo_UseCache:=[WEBSETUP_4D:129]UseCache:8
		<>IWS_bo_RestrictAccess:=[WEBSETUP_4D:129]RestrictAccess:9
		<>IWS_l_MaxHandlers:=[WEBSETUP_4D:129]MaxHandlers:10
		<>IWS_l_MasterDelay:=[WEBSETUP_4D:129]MasterDelay:11
		<>IWS_bo_StreamLogging:=[WEBSETUP_4D:129]StreamLogging:12
		<>IWS_bo_ViaProxy:=[WEBSETUP_4D:129]ViaProxy:13
		<>IWS_bo_ProxyServesStatic:=[WEBSETUP_4D:129]ProxyServesStatic:14
		<>IWS_l_LoadInformerPause:=[WEBSETUP_4D:129]LoadInformerPause:16
		<>IWS_bo_UseLoadInformer:=[WEBSETUP_4D:129]UseLoadInformer:26
		//<>IWS_t_HTTPServerList:=[Websetup_4D]HTTPServerFile
		<>IWS_t_LocalAddress:=[WEBSETUP_4D:129]LocalAddress:29
		<>IWS_bo_Autodismiss:=[WEBSETUP_4D:129]AutoDismiss:30
		<>IWS_t_LoadInformerAddress:=[WEBSETUP_4D:129]LoadInformerAddress:31
		<>IWS_l_LoadInformerPort:=[WEBSETUP_4D:129]LoadInformerPort:32
		
		If (<>IWS_t_LocalAddress#"")
			//◊IWS_l_LocalAddress:=ITK_Name2Addr (◊IWS_t_LocalAddress))ITK OUT AUgust 2009
		Else 
			//failsafe just in case it hasn't been set
			//$Dummy:=ITK_TCPInfos (◊IWS_l_LocalAddress;$Dummy;$Dummy;$Dummy))ITK OUT AUgust 2009
			//◊IWS_t_LocalAddress:=Substring(ITK_Addr2Name (◊IWS_l_LocalAddress;2);1;79))ITK OUT AUgust 2009
		End if 
		
		//added by John, 4/22/99 for logging purposes
		<>LOG_bo_Debug:=[WEBSETUP_4D:129]DebugMode:15
		<>LOG_bo_RemoteLogging:=[WEBSETUP_4D:129]RemoteLogging:17
		If (<>LOG_bo_RemoteLogging)
			//◊LOG_i_RemoteAddress:=ITK_Name2Addr ([Websetup_4D]RemoteLogAddress))ITK OUT AUgust 2009
			<>LOG_i_RemotePort:=[WEBSETUP_4D:129]RemoteLogPort:19
		Else 
			<>LOG_i_RemoteAddress:=0
			<>LOG_i_RemotePort:=0
		End if 
		<>LOG_s_SMTPServer:=[WEBSETUP_4D:129]BugSMTPServer:20
		<>LOG_s_BugSender:=[WEBSETUP_4D:129]BugSender:21
		<>LOG_s_BugAddressee:=[WEBSETUP_4D:129]BugAddressee:22
		
		<>LOG_bo_IOLogging:=[WEBSETUP_4D:129]IO_Logging:27  //Rollo 5/25/99
		<>IWS_bo_HitLogging:=[WEBSETUP_4D:129]Hit_Logging:28  //Rollo 7/6/99
		
		//added by John, 5/6/99, for watchdog purposes
		<>IWS_bo_UseWatchdog:=[WEBSETUP_4D:129]UseWatchdog:23
		<>IWS_l_WatchdogPort:=[WEBSETUP_4D:129]WatchdogPort:24
		
		
	: (<>Web_t_ServerHandler="NTK")
		
		<>IWS_l_MinHandlers:=[WEBSETUP_4D:129]Handlers:1
		<>IWS_l_HandlerMultiple:=[WEBSETUP_4D:129]Multiple:2
		<>IWS_l_HandlerCheckInterval:=[WEBSETUP_4D:129]CheckInterval:3
		<>IWS_bo_MessageLogging:=[WEBSETUP_4D:129]MessageLogging:4
		<>IWS_bo_ConnectLogging:=[WEBSETUP_4D:129]ConnectLogging:5
		<>IWS_l_Webport:=[WEBSETUP_4D:129]Webport:6
		
		<>IWS_l_sWebport:=[WEBSETUP_4D:129]sWebPort:34  //added 18/02/08
		
		<>IWS_t_PrivateKeyPassPhrase:=[WEBSETUP_4D:129]sPrivateKeyPassPhrase:35  //added 18/02/08
		
		<>IWS_t_PrivateKeyPath:=[WEBSETUP_4D:129]sPrivateKeyPath:36  //13/03/08
		<>IWS_t_CertificateKeyPath:=[WEBSETUP_4D:129]sCertificatePath:37  //13/03/08
		
		<>IWS_l_SQLTimeout:=[WEBSETUP_4D:129]OracleTimeout:7
		<>IWS_bo_UseCache:=[WEBSETUP_4D:129]UseCache:8
		<>IWS_bo_RestrictAccess:=[WEBSETUP_4D:129]RestrictAccess:9
		
		<>IWS_l_MaxHandlers:=[WEBSETUP_4D:129]MaxHandlers:10
		<>IWS_l_MasterDelay:=[WEBSETUP_4D:129]MasterDelay:11
		<>IWS_bo_StreamLogging:=[WEBSETUP_4D:129]StreamLogging:12
		<>IWS_bo_ViaProxy:=[WEBSETUP_4D:129]ViaProxy:13
		<>IWS_bo_ProxyServesStatic:=[WEBSETUP_4D:129]ProxyServesStatic:14
		<>IWS_l_LoadInformerPause:=[WEBSETUP_4D:129]LoadInformerPause:16
		<>IWS_bo_UseLoadInformer:=[WEBSETUP_4D:129]UseLoadInformer:26
		//<>IWS_t_HTTPServerList:=[Websetup_4D]HTTPServerFile
		<>IWS_t_LocalAddress:=[WEBSETUP_4D:129]LocalAddress:29
		<>IWS_bo_Autodismiss:=[WEBSETUP_4D:129]AutoDismiss:30
		<>IWS_t_LoadInformerAddress:=[WEBSETUP_4D:129]LoadInformerAddress:31
		<>IWS_l_LoadInformerPort:=[WEBSETUP_4D:129]LoadInformerPort:32
		
		//Rob Laveaux:
		//ITK used a 32-bit longint value to deal with IP addresses, while NTK plugin uses a dotted string (i.e. "192.168.1.1"). Which is more human readable. Because of this the longint variables became superfluous which is why I've removed them and replaced them with their string equivalent.
		//if no IP address has been set, use the local IP address.
		
		If (<>IWS_t_LocalAddress="")
			<>IWS_t_LocalAddress:=IWS_GetLocalIPAddress
		End if 
		
		//WAS previously:
		
		//If (◊IWS_t_LocalAddress#"")
		//◊IWS_l_LocalAddress:=ITK_Name2Addr (◊IWS_t_LocalAddress)
		//Else
		//  `failsafe just in case it hasn't been set
		//C_LONGINT($Dummy)
		//$Dummy:=ITK_TCPInfos (◊IWS_l_LocalAddress;$Dummy;$Dummy;$Dummy)
		//◊IWS_t_LocalAddress:=Substring(ITK_Addr2Name (◊IWS_l_LocalAddress;2);1;21)
		//End if
		
		<>IWS_t_SameServer:="_ais_"+UTI_MD5Base64(<>IWS_t_LocalAddress+":"+String:C10(<>IWS_l_Webport))
		<>IWS_t_sSameServer:="_ais_"+UTI_MD5Base64(<>IWS_t_LocalAddress+":"+String:C10(<>IWS_l_sWebport))  //added 18/02/08
		
		//
		//added by John, 4/22/99 for logging purposes
		<>LOG_bo_Debug:=[WEBSETUP_4D:129]DebugMode:15
		<>LOG_bo_RemoteLogging:=[WEBSETUP_4D:129]RemoteLogging:17
		If (<>LOG_bo_RemoteLogging)
			<>LOG_s_RemoteAddress:=NTK Get Host By Name([WEBSETUP_4D:129]RemoteLogAddress:18)
			<>LOG_i_RemotePort:=[WEBSETUP_4D:129]RemoteLogPort:19
		Else 
			<>LOG_s_RemoteAddress:=""
			<>LOG_i_RemotePort:=0
		End if 
		
		<>LOG_s_SMTPServer:=[WEBSETUP_4D:129]BugSMTPServer:20
		<>LOG_s_BugSender:=[WEBSETUP_4D:129]BugSender:21
		<>LOG_s_BugAddressee:=[WEBSETUP_4D:129]BugAddressee:22
		
		<>LOG_bo_IOLogging:=[WEBSETUP_4D:129]IO_Logging:27  //Rollo 5/25/99
		<>IWS_bo_HitLogging:=[WEBSETUP_4D:129]Hit_Logging:28  //Rollo 7/6/99
		
		//added by John, 5/6/99, for watchdog purposes
		<>IWS_bo_UseWatchdog:=[WEBSETUP_4D:129]UseWatchdog:23
		<>IWS_l_WatchdogPort:=[WEBSETUP_4D:129]WatchdogPort:24
		
		
		
End case 



UNLOAD RECORD:C212([WEBSETUP_4D:129])
ERR_MethodTrackerReturn("IWS_ReadWebSetup"; $_t_oldMethodName)