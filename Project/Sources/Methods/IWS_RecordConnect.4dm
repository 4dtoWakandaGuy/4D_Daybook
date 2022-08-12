//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_RecordConnect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:47
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
	C_LONGINT:C283($_l_Handler; $_l_StreamRow; $1; $2; IWS_l_Stream)
	C_TEXT:C284($_t_oldMethodName; $_t_Semaphore)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_RecordConnect")
//LOG_SetMethod ("IWS_RecordConnect")

//******************************************************************************
//
//Method: IWS_RecordConnect
//
//Written by  John Moore on 11/5/98
//
//Purpose: Reords when a stream has been connected
//
//******************************************************************************


IWS_l_Stream:=$1
$_l_Handler:=$2
$_t_Semaphore:="$StreamArrays"
If (UTI_Semaphore($_t_Semaphore))
	$_l_StreamRow:=UTI_ArraySearch(-><>IWS_al_StreamID; ->IWS_l_Stream)
	If ($_l_StreamRow<0)
		//it didn't exist, so we are going to add it
		$_l_StreamRow:=Abs:C99($_l_StreamRow)
		IWS_AddToStreamArrays($_l_StreamRow)
		<>IWS_al_StreamID{$_l_StreamRow}:=IWS_l_Stream
	Else 
		//we found this stream in the array. Let's check that it was really finished with
		//last time before using it again...
		If (<>IWS_al_Connected{$_l_StreamRow}#0)
			IWS_SendToLog("ERROR: Stream "+String:C10(IWS_l_Stream)+" is being reused before it has been closed!")
		End if 
	End if 
	<>IWS_al_Connected{$_l_StreamRow}:=0  //Milliseconds
	<>IWS_al_Closed{$_l_StreamRow}:=0
	<>IWS_al_Released{$_l_StreamRow}:=0
	<>IWS_al_BytesSent{$_l_StreamRow}:=0
	<>IWS_al_TimeSent{$_l_StreamRow}:=0
	<>IWS_al_Handler{$_l_StreamRow}:=$_l_Handler
	
	UTI_ClearSemaphore($_t_Semaphore)
End if 

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_RecordConnect"; $_t_oldMethodName)