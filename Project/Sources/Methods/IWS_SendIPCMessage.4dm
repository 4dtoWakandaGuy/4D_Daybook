//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SendIPCMessage
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
	C_LONGINT:C283($_l_Channel; $1)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_Message; $_t_oldMethodName; $2; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SendIPCMessage")
IWS_t_CurrentMethodName:="IWS_SendIPCMessage"
$_l_Channel:=$1
$_t_Message:=$2

Case of 
	: (<>Web_t_ServerHandler="ITK")
		//ITK_SendIPCMsg ($_l_Channel;$_t_Message))ITK OUT AUgust 2009
		
	: (<>Web_t_ServerHandler="NTK")
		IPC Send($_l_Channel; $_t_Message)
		
	Else 
		
End case 

//If (<>IWS_bo_MessageLogging)
//IWS_LogMessage ($_l_Channel;$_t_Message;"S")
//End if
ERR_MethodTrackerReturn("IWS_SendIPCMessage"; $_t_oldMethodName)