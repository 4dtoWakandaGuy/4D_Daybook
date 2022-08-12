//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_RcvIPCMessage
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
	//C_UNKNOWN(IPC Get Message By Index)
	//C_UNKNOWN(IPC Receive)
	C_LONGINT:C283($_l_Channel; $_l_Clear; $1; $2)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_Message; $_t_oldMethodName; $0; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_RcvIPCMessage")
IWS_t_CurrentMethodName:="IWS_RcvIPCMessage"

$_l_Channel:=$1
If (Count parameters:C259=2)
	$_l_Clear:=$2
Else 
	$_l_Clear:=0
End if 


Case of 
	: (<>Web_t_ServerHandler="ITK")
		//$_t_Message:=ITK_RcvIPCMsg ($_l_Channel;$_l_Clear))ITK OUT AUgust 2009
		//If (<>IWS_bo_MessageLogging)
		// IWS_LogMessage ($_l_Channel;$_t_Message;"R")
		//End if
		
	: (<>Web_t_ServerHandler="NTK")
		If ($_l_Clear=1)
			// RL (27-11-2007) : Because of keeping compatibility with ITK, the value 1 means do not clear the message from the queue
			IPC Get Message By Index($_l_Channel; 1; $_t_Message)
		Else 
			IPC Receive($_l_Channel; $_t_Message)
		End if 
	Else 
		
End case 




$0:=$_t_Message
ERR_MethodTrackerReturn("IWS_RcvIPCMessage"; $_t_oldMethodName)