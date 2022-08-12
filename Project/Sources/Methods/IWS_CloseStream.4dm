//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_CloseStream
	//------------------ Method Notes ------------------
	
	//******************************************************************************
	//
	//Method: IWS_CloseStream
	//
	//Written by  John Moore on 11/5/98
	//
	//Purpose: Closes a stream
	//
	//******************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>IWS_bo_ConnectLogging)
	C_LONGINT:C283($_l_Error; $_l_Stream; $0; $1)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_CloseStream")
//LOG_SetMethod ("IWS_CloseStream")


$_l_Stream:=$1

Case of 
	: (<>Web_t_ServerHandler="ITK")
		//$_l_Error:=ITK_TCPClose ($_l_Stream) ITK OUT
		
		If ($_l_Error#0)
			IWS_SendToLog("ERROR: Closing non-existent stream  "+String:C10($_l_Stream)+" - error #"+String:C10($0))
		End if 
		
		If (<>IWS_bo_ConnectLogging)
			IWS_RecordClose($_l_Stream)
		End if 
	: (<>Web_t_ServerHandler="NTK")
		$_l_Error:=0
		
		If (<>IWS_bo_ConnectLogging)
			// We need to log before closing the stream because TCP Closet sets $_l_Stream to 0
			IWS_RecordClose($_l_Stream)
		End if 
		
		// NTK Debuglog ("TCP Close "+String($_l_Stream)+"\r\n")
		TCP Close($_l_Stream)
		
		If ($_l_Error#0)
			IWS_SendToLog("ERROR: Closing non-existent stream  "+String:C10($_l_Stream)+" - error #"+String:C10($0))
		End if 
End case 

$0:=$_l_Error

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_CloseStream"; $_t_oldMethodName)