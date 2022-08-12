//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_InitWebSetup
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
	C_LONGINT:C283(<>IWS_l_sWebport; <>IWS_l_Webport)
	C_TEXT:C284(<>IWS_t_CertificateKeyPath; <>IWS_t_PrivateKeyPassPhrase; <>IWS_t_PrivateKeyPath; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_InitWebSetup")

//IWS_InitWebSetup

CREATE RECORD:C68([WEBSETUP_4D:129])
[WEBSETUP_4D:129]Handlers:1:=5
[WEBSETUP_4D:129]Multiple:2:=3
[WEBSETUP_4D:129]CheckInterval:3:=120
[WEBSETUP_4D:129]MessageLogging:4:=False:C215
[WEBSETUP_4D:129]ConnectLogging:5:=False:C215
[WEBSETUP_4D:129]Webport:6:=<>IWS_l_Webport
[WEBSETUP_4D:129]sWebPort:34:=<>IWS_l_sWebport
[WEBSETUP_4D:129]sPrivateKeyPassPhrase:35:=<>IWS_t_PrivateKeyPassPhrase
[WEBSETUP_4D:129]sPrivateKeyPath:36:=<>IWS_t_PrivateKeyPath  //13/03/08
[WEBSETUP_4D:129]sCertificatePath:37:=<>IWS_t_CertificateKeyPath  //13/03/08
[WEBSETUP_4D:129]OracleTimeout:7:=1800
[WEBSETUP_4D:129]UseCache:8:=False:C215
[WEBSETUP_4D:129]RestrictAccess:9:=False:C215
[WEBSETUP_4D:129]MaxHandlers:10:=5
[WEBSETUP_4D:129]MasterDelay:11:=1
[WEBSETUP_4D:129]StreamLogging:12:=False:C215
[WEBSETUP_4D:129]ViaProxy:13:=False:C215
[WEBSETUP_4D:129]ProxyServesStatic:14:=False:C215
[WEBSETUP_4D:129]DebugMode:15:=False:C215
[WEBSETUP_4D:129]UseLoadInformer:26:=False:C215
[WEBSETUP_4D:129]LoadInformerPause:16:=180
[WEBSETUP_4D:129]RemoteLogging:17:=False:C215
[WEBSETUP_4D:129]RemoteLogAddress:18:="127.0.0.1"
[WEBSETUP_4D:129]RemoteLogPort:19:=5678
[WEBSETUP_4D:129]BugSMTPServer:20:="192.168.1.202"
[WEBSETUP_4D:129]BugSender:21:="support@daybook.co.uk"
[WEBSETUP_4D:129]BugAddressee:22:="support@daybook.co.uk"
[WEBSETUP_4D:129]UseWatchdog:23:=False:C215
[WEBSETUP_4D:129]WatchdogPort:24:=5679
[WEBSETUP_4D:129]AutoDismiss:30:=False:C215
[WEBSETUP_4D:129]LoadInformerAddress:31:="239.0.0.0"
[WEBSETUP_4D:129]LoadInformerPort:32:=1279
//C_LONGINT($LocalAddress;$Dummy)
//$Dummy:=ITK_TCPInfos ($LocalAddress;$Dummy;$Dummy;$Dummy)
[WEBSETUP_4D:129]LocalAddress:29:=""  //IWS_DottedIPAddress ($LocalAddress)
AA_CheckUUID(Table:C252(->[WEBSETUP_4D:129]))

SAVE RECORD:C53([WEBSETUP_4D:129])
ERR_MethodTrackerReturn("IWS_InitWebSetup"; $_t_oldMethodName)