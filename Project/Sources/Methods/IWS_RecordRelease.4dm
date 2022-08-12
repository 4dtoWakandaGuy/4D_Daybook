//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_RecordRelease
	//------------------ Method Notes ------------------
	//LOG_SetMethod ("IWS_RecordRelease")
	//******************************************************************************
	//
	//Method: IWS_RecordRelease
	//
	//Written by  John Moore on 11/5/98
	//
	//Purpose: Records when a stream has been released
	
	//******************************************************************************
	
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:46
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
	C_BOOLEAN:C305(<>IWS_bo_ConnectLogging)
	C_LONGINT:C283($_l_StreamRow; $0; $1; IWS_l_Stream)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; $_t_Semaphore)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_RecordRelease")


IWS_l_Stream:=$1


$_t_Semaphore:="$StreamArrays"
If (UTI_Semaphore($_t_Semaphore))
	$_l_StreamRow:=UTI_ArraySearch(-><>IWS_al_StreamID; ->IWS_l_Stream)
	If ($_l_StreamRow<0)
		IWS_SendToLog("ERROR: Could not find stream "+String:C10(IWS_l_Stream)+" in stream arrays to record release!")
		$_t_Message:=""
	Else 
		//we found this stream in the array. Let's check that it was really finished with
		//last time before using it again...
		If (<>IWS_al_Released{$_l_StreamRow}>0)
			IWS_SendToLog("ERROR: The stream "+String:C10(IWS_l_Stream)+" has already been recorded as released!")
		Else 
			<>IWS_al_Released{$_l_StreamRow}:=0  //Milliseconds
		End if 
		//Record time taken
		$_t_Message:=STR_ParamBlock(String:C10(<>IWS_al_StreamID{$_l_StreamRow}); String:C10(<>IWS_al_Connected{$_l_StreamRow}); String:C10(<>IWS_al_TimeSent{$_l_StreamRow}); String:C10(<>IWS_al_Closed{$_l_StreamRow}); String:C10(<>IWS_al_Released{$_l_StreamRow}); String:C10(<>IWS_al_BytesSent{$_l_StreamRow}); String:C10(<>IWS_al_Closed{$_l_StreamRow}-<>IWS_al_Connected{$_l_StreamRow}); String:C10(<>IWS_al_Handler{$_l_StreamRow}))
		<>IWS_al_Connected{$_l_StreamRow}:=0
		<>IWS_al_Closed{$_l_StreamRow}:=0
		<>IWS_al_Released{$_l_StreamRow}:=0
		<>IWS_al_BytesSent{$_l_StreamRow}:=0
		<>IWS_al_TimeSent{$_l_StreamRow}:=0
		<>IWS_al_Handler{$_l_StreamRow}:=0
	End if 
	UTI_ClearSemaphore($_t_Semaphore)
	If ($_t_Message#"") & (<>IWS_bo_ConnectLogging)
		IWS_SendToConnectLog($_t_Message)
	End if 
End if 
ERR_MethodTrackerReturn("IWS_RecordRelease"; $_t_oldMethodName)