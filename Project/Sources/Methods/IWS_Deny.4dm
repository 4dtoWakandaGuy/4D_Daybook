//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_Deny
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
	C_LONGINT:C283($_l_BytesSend; IWS_l_Stream)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_Message; $_t_oldMethodName; IWS_t_RemoteIPAddress)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_Deny")


$_t_Message:="SECURITY VIOLATION: Access attempt from unauthorized user "+IWS_t_RemoteIPAddress
IWS_SetResponseHeader(403)
IWS_SendResponseHeader

Case of 
	: (<>Web_t_ServerHandler="ITK")
	: (<>Web_t_ServerHandler="NTK")
		$_l_BytesSend:=TCP Send(IWS_l_Stream; "<HTML><H1>Unavailable</H1></HTML>")
	Else 
		
End case 

IWS_SendToLog($_t_Message)
ERR_MethodTrackerReturn("IWS_Deny"; $_t_oldMethodName)