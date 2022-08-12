//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45
	//Method Name: Compiler_IWS_IA
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("Compiler_IWS_IA")
ARRAY LONGINT:C221(<>IWS_al_WinProc; 0)
ARRAY TEXT:C222(<>IWS_at_WinTitle; 0)
ARRAY TEXT:C222(<>IWS_at_RequestFields; 0)

ARRAY LONGINT:C221(<>IWS_al_Stream; 0)
ARRAY LONGINT:C221(<>IWS_al_Status; 0)

//Initialise them...
ARRAY LONGINT:C221(<>IWS_al_IPStart; 0)
ARRAY LONGINT:C221(<>IWS_al_IPEnd; 0)

//Logging arrays
ARRAY LONGINT:C221(<>IWS_al_LogIP; 0)
ARRAY LONGINT:C221(<>IWS_al_Bytes; 0)
ARRAY LONGINT:C221(<>IWS_al_Ms; 0)
ARRAY LONGINT:C221(<>IWS_al_MsPageBuild; 0)
ARRAY TEXT:C222(<>IWS_at_PageType; 0)
ARRAY TEXT:C222(<>IWS_at_GetOrPost; 0)
ARRAY TEXT:C222(<>IWS_at_LogTime; 0)
ARRAY TEXT:C222(<>IWS_at_LogPage; 0)
ARRAY TEXT:C222(<>IWS_at_ValidIPRange; 0)

ARRAY POINTER:C280(<>IWS_apo_Setup; 0)

ARRAY TEXT:C222(<>IWS_at_ServerList; 0)
IWS_StreamArrays

ARRAY LONGINT:C221(<>IWS_al_HandlerProcessID; 0)
ARRAY LONGINT:C221(<>IWS_al_HandlerTimeout; 0)

//Array for e-mails
ARRAY PICTURE:C279(<>IWS_apic_MailQueue; 0)

//Moved here from IWS_UpdateLogArrays, JDM, 1/22/01
ARRAY TEXT:C222(<>IWS_at_ProcessName; 0)
ARRAY TEXT:C222(<>IWS_at_ProcessStates; 0)
ARRAY LONGINT:C221(<>IWS_al_ProcessTicks; 0)
ARRAY LONGINT:C221(<>IWS_al_StreamListens; 0)
ARRAY LONGINT:C221(<>IWS_al_StreamListenMS; 0)




ERR_MethodTrackerReturn("Compiler_IWS_IA"; $_t_oldMethodName)