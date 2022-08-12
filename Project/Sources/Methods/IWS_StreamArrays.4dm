//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_StreamArrays
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
	//ARRAY LONGINT(<>IWS_al_BytesSent;0)
	//ARRAY LONGINT(<>IWS_al_Closed;0)
	//ARRAY LONGINT(<>IWS_al_Connected;0)
	//ARRAY LONGINT(<>IWS_al_Handler;0)
	//ARRAY LONGINT(<>IWS_al_Released;0)
	//ARRAY LONGINT(<>IWS_al_StreamID;0)
	//ARRAY LONGINT(<>IWS_al_TimeSent;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_StreamArrays")
ARRAY LONGINT:C221(<>IWS_al_StreamID; 0)  //reference number of stream
ARRAY LONGINT:C221(<>IWS_al_Connected; 0)  //ms when stream connected
ARRAY LONGINT:C221(<>IWS_al_Closed; 0)  //ms when stream closed
ARRAY LONGINT:C221(<>IWS_al_Released; 0)  //ms when stream released
ARRAY LONGINT:C221(<>IWS_al_BytesSent; 0)  //bytes sent on stream
ARRAY LONGINT:C221(<>IWS_al_TimeSent; 0)  //time data sent
ARRAY LONGINT:C221(<>IWS_al_Handler; 0)  //handler dealing with stream
ERR_MethodTrackerReturn("IWS_StreamArrays"; $_t_oldMethodName)