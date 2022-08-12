//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_RecordClose
	//------------------ Method Notes ------------------
	//LOG_SetMethod ("IWS_RecordClose")
	
	//******************************************************************************
	//
	//Method: IWS_RecordClose
	//
	//Written by  John Moore on 11/5/98
	//
	//Purpose: Records when a stream has been closed
	//
	//******************************************************************************
	
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
	//ARRAY LONGINT(<>IWS_al_StreamID;0)
	C_LONGINT:C283($_l_StreamRow; $0; $1; IWS_l_Stream)
	C_TEXT:C284($_t_oldMethodName; $_t_Semaphore)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_RecordClose")

IWS_l_Stream:=$1
$_t_Semaphore:="$StreamArrays"
If (UTI_Semaphore($_t_Semaphore))
	$_l_StreamRow:=UTI_ArraySearch(-><>IWS_al_StreamID; ->IWS_l_Stream)
	If ($_l_StreamRow<0)
		IWS_SendToLog("ERROR: Could not find stream "+String:C10(IWS_l_Stream)+" in stream arrays!")
	Else 
		//we found this stream in the array. Let's check that it was really finished with
		//last time before using it again...
		If (<>IWS_al_Closed{$_l_StreamRow}>0)
			IWS_SendToLog("ERROR: The stream "+String:C10(IWS_l_Stream)+" has already been recorded as closed!")
		Else 
			<>IWS_al_Closed{$_l_StreamRow}:=0  //Milliseconds
			<>IWS_al_BytesSent{$_l_StreamRow}:=IWS_BytesSent(IWS_l_Stream)  //bytes
		End if 
	End if 
	UTI_ClearSemaphore($_t_Semaphore)
End if 


//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_RecordClose"; $_t_oldMethodName)