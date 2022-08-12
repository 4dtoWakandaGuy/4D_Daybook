//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_DocSend
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>IWS_l_PagesServed; $_l_Bytes; $_l_BytesSend; $_l_Error; $1; IWS_l_Stream)
	C_REAL:C285(<>IWS_r_BytesServed)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_Filename; $_t_oldMethodName; $_t_Semaphore; IWS_t_Filename)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_DocSend")
// IWS_DocSend


//LOG_SetMethod ("IWS_DocSend")

$_t_Filename:=IWS_DocNormalize(IWS_t_Filename)

Case of 
	: (<>Web_t_ServerHandler="ITK")
		If (Test path name:C476($_t_Filename)=Is a document:K24:1)
			// IWS_SetResponseHeader (200)  ` send OK response
			IWS_SetStaticCacheHeader
			IWS_SendResponseHeader
			$_l_Bytes:=Get document size:C479($_t_Filename)
			//$_l_Error:=ITK_TCPSendFile (IWS_l_Stream;$_t_Filename)  `ITK OUT send File to client
		Else 
			IWS_SetResponseHeader(404)  // file not found
			IWS_SendResponseHeader
			$_l_Bytes:=0
			
		End if 
	: (<>Web_t_ServerHandler="NTK")
		If (Test path name:C476($_t_Filename)=Is a document:K24:1)
			// IWS_SetResponseHeader (200)  ` send OK response
			IWS_SetStaticCacheHeader
			IWS_SendResponseHeader
			$_l_BytesSend:=TCP Send File(IWS_l_Stream; $_t_Filename)  // send File to client
		Else 
			IWS_SetResponseHeader(404)  // file not found
			IWS_SendResponseHeader
			$_l_BytesSend:=0
		End if 
	Else 
		
End case 


$_t_Semaphore:="$Monitor Update"
If (UTI_Semaphore($_t_Semaphore))
	<>IWS_r_BytesServed:=<>IWS_r_BytesServed+$_l_Bytes
	<>IWS_l_PagesServed:=<>IWS_l_PagesServed+1
	UTI_ClearSemaphore($_t_Semaphore)
End if 
//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_DocSend"; $_t_oldMethodName)