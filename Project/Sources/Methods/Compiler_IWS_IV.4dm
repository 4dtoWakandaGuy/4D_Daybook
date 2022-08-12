//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45
	//Method Name: Compiler_IWS_IV
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("Compiler_IWS_IV")
//Compiler_IWS_IV
//
// b24 Rollo 19990706 - two new variables

C_BOOLEAN:C305(<>IWS_bo_Shutdown; <>IWS_bo_Log; <>IWS_bo_MessageLogging; <>IWS_bo_RestrictAccess)
C_BOOLEAN:C305(<>IWS_bo_RestartServer; <>IWS_bo_GetUserInfo; <>IWS_bo_HighlightLast)

C_LONGINT:C283(<>IWS_l_Handlers; <>IWS_l_HandlerMultiple; <>IWS_l_HandlerCheckInterval; <>IWS_l_MaxHandlers; <>IWS_l_MinHandlers; <>IWS_l_HandlerCount)
C_LONGINT:C283(<>IWS_l_WinStartX; <>IWS_l_WinStartY)  // window start position
C_LONGINT:C283(<>IWS_l_WinAddX; <>IWS_l_WinAddY)  // add to window start position
C_LONGINT:C283(<>IWS_l_WinSizeX; <>IWS_l_WinSizeY)  // window sizes

C_LONGINT:C283(<>IWS_l_ShowProcessesInLog; <>IWS_l_RefuseConnections)
C_TEXT:C284(<>IWS_t_StaticPrefix; <>IWS_t_LogonPrefix)
C_TEXT:C284(<>IWS_t_StaticFolder)
C_TEXT:C284(<>IWS_t_StaticIndexPage; <>IWS_t_DynamicIndexPage)  //location of home static page
C_TIME:C306(<>IWS_ti_MessageLog)
C_TIME:C306(<>IWS_ti_Doc; <>IWS_ti_ConnectDoc)
C_REAL:C285(<>IWS_r_BytesServed)  //will be big number
C_LONGINT:C283(<>IWS_l_PagesServed; <>IWS_l_MasterDelay; <>IWS_l_LogRefresh; <>IWS_l_ShowHits; <>IWS_l_ConnectLog)
C_LONGINT:C283(<>IWS_l_SQLTimeout)  //ticks until we assume SQL process has failed
C_LONGINT:C283(<>IWS_l_RcvTimeout; <>IWS_l_POSTTimeout)  //ticks until data receive has obviously failed
C_LONGINT:C283(<>IWS_l_TotalDynamicTime)
C_LONGINT:C283(<>IWS_l_TotalStaticTime)
C_LONGINT:C283(<>IWS_l_TotalBuildTime)
C_LONGINT:C283(<>IWS_l_AveBuildTime)
C_LONGINT:C283(<>IWS_l_AveTotalTime)
C_LONGINT:C283(<>IWS_l_LogStartTime)
C_LONGINT:C283(<>IWS_l_CountDynamic)
C_LONGINT:C283(<>IWS_l_CountStatic)
C_LONGINT:C283(<>IWS_l_AveStatic)
C_LONGINT:C283(<>IWS_l_AveDynamic)
C_LONGINT:C283(<>IWS_l_CountPOST)
C_LONGINT:C283(<>IWS_l_CountGET)

C_LONGINT:C283(<>IWS_l_WebPort)

C_LONGINT:C283(<>IWS_l_sWebPort)  //added 18/02/08

C_TEXT:C284(<>IWS_t_PrivateKeyPassPhrase)  //added 18/02/08


C_LONGINT:C283(<>IWS_l_UDPSequence)  //a sequence number for UDP messages to Monitor
C_TIME:C306(<>IWS_ti_TimeRunning; <>IWS_ti_StreamDoc)
C_LONGINT:C283(<>IWS_l_MaxUploadBlobSize)  // Johns addition

//Some variables for web server load testing
C_LONGINT:C283(<>IWS_l_ClientTestChannel)  //IPC channel to send client test result messages to
C_LONGINT:C283(<>IWS_l_PageTicks; <>IWS_l_StartTicks; <>IWS_l_TestClients; <>IWS_l_TestRandom; <>IWS_l_TestMins; <>IWS_l_WaitForPage)
C_TEXT:C284(<>IWS_t_Testpages; <>IWS_t_Hostname)
C_LONGINT:C283(<>IWS_ControlPanelTestClientsProc; <>IWS_StartTestClientsProc)  // Axel 10/12/2000


//PROXY SETTINGS
C_BOOLEAN:C305(<>IWS_bo_ViaProxy; <>IWS_bo_ProxyServesStatic)
C_TEXT:C284(<>IWS_t_ProxyPrefix)  //alias of proxy servlet
C_LONGINT:C283(<>IWS_l_UseProxy)


//LOGGING FEATURES
C_TEXT:C284(<>IWS_t_LogMessage)
C_LONGINT:C283(<>IWS_l_LoggedMessages; <>IWS_l_MaxLoggedMessages; <>IWS_l_RcvDelay)
C_BOOLEAN:C305(<>IWS_bo_LogCacheing)

//LOAD INFORMER FEATURES
C_LONGINT:C283(<>IWS_l_LoadInformerProcID; <>IWS_l_LoadInformerPort; <>IWS_l_LoadInformerPause)
C_BOOLEAN:C305(<>IWS_bo_UseLoadInformer)
C_TEXT:C284(<>IWS_t_HTTPServerList)
C_BOOLEAN:C305(<>IWS_bo_LoadInformerInterrupt)  //Rollo 3/7/2000
C_LONGINT:C283(<>IWS_l_LoadInformerPort)  //John, 6/4/2000
C_TEXT:C284(<>IWS_t_LoadInformerAddress)  //John, 6/4/2000

//WATCHDOG FEATURES
C_BOOLEAN:C305(<>IWS_bo_UseWatchdog)
C_LONGINT:C283(<>IWS_l_WatchdogPort)

C_BOOLEAN:C305(<>IWS_bo_HitLogging)  //Rollo 7/6/99
C_TIME:C306(<>IWS_ti_HitLog)  //Rollo 7/6/99

C_BOOLEAN:C305(<>IWS_bo_HTTPCacheNoPages)  //Rollo 8/4/99

C_LONGINT:C283(<>IWS_l_LocalAddress)  //John 10/11/99
C_TEXT:C284(<>IWS_t_LocalAddress)  // for dotted string version of above
C_TEXT:C284(<>IWS_t_LocalAddressAndPort)  //Rollo 1/19/2001

C_BOOLEAN:C305(<>IWS_bo_AutoDismiss)  //automatically OK dialogs such as Runtime Error messages
C_TEXT:C284(<>IWS_t_LoadTest)  //added by John for load testing purposes

C_BLOB:C604(<>IWS_x_UploadData)  //for handling file uploads

C_TEXT:C284(<>IWS_t_CommandPrefix)
C_TEXT:C284(<>IWS_t_LSCookie)

C_LONGINT:C283(<>IWS_l_CallOSDelay; <>IWS_l_MaxOSDelay; <>IWS_l_MinOSDelay)

C_LONGINT:C283(<>IWS_l_StreamConnected)


ERR_MethodTrackerReturn("Compiler_IWS_IV"; $_t_oldMethodName)