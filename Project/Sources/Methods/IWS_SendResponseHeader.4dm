//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SendResponseHeader
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(IWS_bo_ResponseHeaderSent)
	C_LONGINT:C283($_l_BytesSend; IWS_l_Stream)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_oldMethodName; IWS_t_ResponseHeader)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SendResponseHeader")
//LOG_SetMethod ("IWS_SendResponseHeader")
//******************************************************************************
//
//Method: IWS_SendResponseHeader
//
//Written by  John Moore on 1/11/99
//
//Purpose: Sends response header to browser
//
//******************************************************************************

Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		
		//$Err:=ITK_TCPSend (IWS_l_Stream;IWS_t_ResponseHeader;1))ITK OUT AUgust 2009
		
	: (<>Web_t_ServerHandler="NTK")
		
		$_l_BytesSend:=TCP Send(IWS_l_Stream; IWS_t_ResponseHeader)
		
	Else 
		
End case 




IWS_bo_ResponseHeaderSent:=True:C214
IWS_t_ResponseHeader:=""

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_SendResponseHeader"; $_t_oldMethodName)