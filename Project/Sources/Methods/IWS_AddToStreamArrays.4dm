//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_AddToStreamArrays
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
	//Array LONGINT(<>IWS_al_BytesSent;0)
	//Array LONGINT(<>IWS_al_Closed;0)
	//Array LONGINT(<>IWS_al_Connected;0)
	//Array LONGINT(<>IWS_al_Handler;0)
	//Array LONGINT(<>IWS_al_Released;0)
	//Array LONGINT(<>IWS_al_StreamID;0)
	//Array LONGINT(<>IWS_al_TimeSent;0)
	C_LONGINT:C283($1; $Insert)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_AddToStreamArrays")
$Insert:=$1

INSERT IN ARRAY:C227(<>IWS_al_StreamID; $Insert; 1)  //reference number of stream
INSERT IN ARRAY:C227(<>IWS_al_Connected; $Insert; 1)  //ms when listen started
INSERT IN ARRAY:C227(<>IWS_al_Closed; $Insert; 1)  //ms when stream closed
INSERT IN ARRAY:C227(<>IWS_al_Released; $Insert; 1)  //ms when stream released
INSERT IN ARRAY:C227(<>IWS_al_BytesSent; $Insert; 1)  //bytes sent on stream
INSERT IN ARRAY:C227(<>IWS_al_TimeSent; $Insert; 1)  //time data sent
INSERT IN ARRAY:C227(<>IWS_al_Handler; $Insert; 1)  //handler dealing with it
ERR_MethodTrackerReturn("IWS_AddToStreamArrays"; $_t_oldMethodName)