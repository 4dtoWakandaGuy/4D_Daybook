//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45
	//Method Name: Compiler_IWS_PA
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("Compiler_IWS_PA")
ARRAY LONGINT:C221(IWS_al_LogIP; 0)
ARRAY LONGINT:C221(IWS_al_Bytes; 0)
ARRAY LONGINT:C221(IWS_al_Ms; 0)
ARRAY LONGINT:C221(IWS_al_MsPageBuild; 0)


ARRAY TEXT:C222(IWS_at_PageType; 0)
ARRAY TEXT:C222(IWS_at_GetOrPost; 0)

ARRAY TEXT:C222(IWS_at_ProcessName; 0)
ARRAY TEXT:C222(IWS_at_ProcessState; 0)
ARRAY LONGINT:C221(IWS_al_ProcessTicks; 0)

//for UserInfo
//ARRAY LONGINT(IWS_ai_UserIP;100)
//ARRAY LONGINT(IWS_ai_UserTime;100)
//ARRAY LONGINT(IWS_ai_UserArea;100)
//ARRAY LONGINT(IWS_ai_UserSection;100)

//For logging purposes
ARRAY TEXT:C222(IWS_at_LogTime; 0)
ARRAY TEXT:C222(IWS_at_LogPage; 0)

//for receiving request
ARRAY TEXT:C222(IWS_at_TextData; 0)

//John 5/30/2000
ARRAY TEXT:C222(IWS_at_Headers; 0)
ARRAY TEXT:C222(IWS_at_HeaderNames; 0)
ARRAY TEXT:C222(IWS_at_HeaderValues; 0)
ARRAY TEXT:C222(IWS_at_UploadHeaders; 0)


ERR_MethodTrackerReturn("Compiler_IWS_PA"; $_t_oldMethodName)