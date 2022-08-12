//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_StartServer
	//------------------ Method Notes ------------------
	//******************************************************************************
	//
	//Method: IWS_StartServer
	//
	//Written by  John Moore on 10/30/98
	//
	//Purpose: Starts up the web server (well, what else would it do?)
	//
	
	//Modification History:
	
	//2/14/99 S. Frey - moved SQL_Startup to "On Startup" method
	//2/17/99 S. Frey - removed call to Compiler_Process
	//4/22/99 S. Frey - added use of <>SQL_i_DirectConnect variable for direct
	//Oracle connections
	//19990607 - LNH - Cahged call from MSG_ClearWindow to MSG_HideWindow
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IWS_al_StreamListenMS;0)
	//ARRAY LONGINT(<>IWS_al_StreamListens;0)
	C_BOOLEAN:C305(<>fSebModification; <>IME_StartupHasBeenRun; <>IWS_bo_ConnectLogging; <>IWS_bo_MessageLogging; <>IWS_bo_StreamLogging; <>IWS_bo_UseLoadInformer; <>SYS_bo_ConnectToOracle)
	C_LONGINT:C283($_l_NewProcessNum)
	C_REAL:C285(<>SQL_i_DirectConnect)
	C_TEXT:C284(<>IWS_t_CheckerProcess; <>IWS_t_CloserProcess; <>IWS_t_LogBuilderProcess; <>IWS_t_LogProcess; <>IWS_t_MasterProcess; $_t_ApplicationLogsPath; $_t_crlf; $_t_Delimiter; $_t_Message; $_t_oldMethodName; $_t_Tab)
	C_TIME:C306(<>IWS_ti_ConnectDoc; <>IWS_ti_Doc; <>IWS_ti_StreamDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_StartServer")

<>fSebModification:=True:C214
//******************************************************************************

//********************************************** added -kmw 10/10/08 v631b120 *******************************************
//The change made to personnel settings so that users don't neccessarily...
//... run IME_Startup on startup means we need to check for this here...
//....and run it now at the last minute if neccessary.
If (<>IME_StartupHasBeenRun=False:C215)
	IME_Startup
End if 
//*****************************************************************************************************************************


//LOG_SetMethod ("IWS_StartServer")


//MSG_WindowProcess

//MSG_Send("Starting up web server...")
//Compiler_Process

Compiler_IWS_IA
Compiler_IWS_IV

IWS_Init
IWS_GetValidIPRanges

<>SQL_i_DirectConnect:=1  //Set to 0 to use multi-process SQL Handling...


SYS_SetWebServer("IWS")

$_t_Tab:=Char:C90(9)  //tab
$_t_crlf:=Char:C90(13)+Char:C90(10)  //CR+LF

If (Is Windows:C1573)
	$_t_Delimiter:="\\"  // BACK SLASH
	
	If (Application type:C494=4D Remote mode:K5:5)
		$_t_ApplicationLogsPath:=UTI_GetFolderName(Application file:C491)+$_t_Delimiter+"Logs"
	Else 
		$_t_ApplicationLogsPath:=UTI_GetFolderName(Data file:C490)+$_t_Delimiter+"Logs"
	End if 
	
	//$_t_ApplicationLogsPath:=(FindFolder(GetStructPath))+$_t_Delimiter+"Logs"
	
	If (Test path name:C476($_t_ApplicationLogsPath)#Is a folder:K24:2)
		CREATE FOLDER:C475($_t_ApplicationLogsPath)
	End if 
Else 
	$_t_Delimiter:=""
	$_t_ApplicationLogsPath:=""
End if 

If (<>IWS_bo_MessageLogging)
	<>IWS_ti_Doc:=DB_CreateDocument($_t_ApplicationLogsPath+$_t_Delimiter+"Session Log "+String:C10(Tickcount:C458))
	SEND PACKET:C103(<>IWS_ti_Doc; "SESSION STARTED "+String:C10(Current date:C33)+", "+String:C10(Current time:C178)+$_t_crlf)
End if 

If (<>IWS_bo_ConnectLogging)
	<>IWS_ti_ConnectDoc:=DB_CreateDocument($_t_ApplicationLogsPath+$_t_Delimiter+"Connections Log "+String:C10(Tickcount:C458))
	SEND PACKET:C103(<>IWS_ti_ConnectDoc; "STREAM"+$_t_Tab+"CONNECTED"+$_t_Tab+"DATA SENT"+$_t_Tab+"CLOSED"+$_t_Tab+"RELEASED"+$_t_Tab+"BYTES"+$_t_Tab+"TIME"+$_t_Tab+"HANDLER"+$_t_crlf)
End if 

If (<>IWS_bo_StreamLogging)
	UTI_ArrayClear(-><>IWS_al_StreamListens; -><>IWS_al_StreamListenMS)
	<>IWS_ti_StreamDoc:=DB_CreateDocument($_t_ApplicationLogsPath+$_t_Delimiter+"Streams "+String:C10(0))
	SEND PACKET:C103(<>IWS_ti_StreamDoc; "SESSION STARTED "+String:C10(Current date:C33)+", "+String:C10(Current time:C178)+$_t_crlf)
	SEND PACKET:C103(<>IWS_ti_StreamDoc; "STREAM"+$_t_Tab+"STARTED"+$_t_crlf)
End if 


//MON_GetMonitorIP
//<>MON_s_ServerAddr:="192.168.10.149"

BRING TO FRONT:C326(Current process:C322)

//MSG_Send ("Starting up log window process...")
$_l_NewProcessNum:=New process:C317("IWS_LogWindow"; DB_ProcessMemoryinit(2); <>IWS_t_LogProcess; *)
//MSG_Send ("Starting up log builder process...")
$_l_NewProcessNum:=New process:C317("IWS_LogBuilder"; DB_ProcessMemoryinit(2); <>IWS_t_LogBuilderProcess; *)
//MSG_Send ("Starting up closer process...")
$_l_NewProcessNum:=New process:C317("IWS_Closer"; DB_ProcessMemoryinit(2); <>IWS_t_CloserProcess; *)
//MSG_Send ("Starting up master process...")
$_l_NewProcessNum:=New process:C317("IWS_Master"; DB_ProcessMemoryinit(2); <>IWS_t_MasterProcess; *)
//MSG_Send ("Starting up handler checker process...")
$_l_NewProcessNum:=New process:C317("IWS_HandlerChecker"; DB_ProcessMemoryinit(1); <>IWS_t_CheckerProcess; *)


BRING TO FRONT:C326(Process number:C372(<>IWS_t_LogProcess))
//LGS_LogicServer ("WebServer";"START")  `Ron 12/23/99

If (<>IWS_bo_UseLoadInformer)
	IWS_StartLoadInformer
End if 

If (<>SYS_bo_ConnectToOracle)  // *** MODIFIED BY  John, 29/11/98
	//MAC_LoadStartupMacros   `moved from IWS_Startup by John, 11/09/98
	Record_Startup
	
	//If (◊SQL_i_DirectConnect<1)
	// $_l_NewProcessNum:=New process("SQL_Master";48000;◊SQL_s_MasterProcess)  `moved here by Seb 2
	// End if
	//$_l_NewProcessNum:=New process("SQL_P_ClearCursors";DB_ProcessMemoryinit(1);◊SQL_s_CursorFlushProcess;*)
End if 

//MSG_HideWindow   `19990607 - LNH

//MSG_ClearWindow   `Rollo 6/7/99 `19990607 - LNH
//CLOSE WINDOW   `Rollo 6/7/99

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_StartServer"; $_t_oldMethodName)