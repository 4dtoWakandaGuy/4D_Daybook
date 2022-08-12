//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_RecordSend
	//------------------ Method Notes ------------------
	//******************************************************************************
	//
	//Method: IWS_RecordSend
	//
	//Written by  John Moore on 11/5/98
	//
	//Purpose: Records when all the data on a stream has been sent
	
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IWS_al_StreamID;0)
	//ARRAY LONGINT(<>IWS_al_TimeSent;0)
	C_BOOLEAN:C305(<>IWS_bo_ConnectLogging)
	C_LONGINT:C283($_l_StreamRow; $0; IWS_l_Stream)
	C_TEXT:C284($_t_oldMethodName; $_t_Semaphore; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_RecordSend")

//
IWS_t_CurrentMethodName:="IWS_RecordSend"
//
//******************************************************************************


If (<>IWS_bo_ConnectLogging)
	
	$_t_Semaphore:="$StreamArrays"
	If (UTI_Semaphore($_t_Semaphore))
		$_l_StreamRow:=UTI_ArraySearch(-><>IWS_al_StreamID; ->IWS_l_Stream)
		If ($_l_StreamRow<0)
			IWS_SendToLog("ERROR: Could not find stream "+String:C10(IWS_l_Stream)+" in stream arrays!")
		Else 
			<>IWS_al_TimeSent{$_l_StreamRow}:=0  //Milliseconds
		End if 
		UTI_ClearSemaphore($_t_Semaphore)
	End if 
End if 
ERR_MethodTrackerReturn("IWS_RecordSend"; $_t_oldMethodName)