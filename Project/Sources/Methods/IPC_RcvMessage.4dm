//%attributes = {}
If (False:C215)
	//Project Method Name:      IPC_RcvMessage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Channel; $_l_received; $1; $2; $Clear)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_Message; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IPC_RcvMessage")

//******************************************************************************
//
//Method: IPC_RcvMessage
//
//Written by  John on 4/21/99
//
//Purpose: Wrapper for ITK routine
//
//$1 - type -purpose
//
//******************************************************************************


$_l_Channel:=$1
If (Count parameters:C259=2)
	$Clear:=$2
Else 
	$Clear:=0
End if 

Case of 
	: (<>Web_t_ServerHandler="ITK")
		//$_t_Message:=ITK_RcvIPCMsg ($_l_Channel;$Clear) ITK OUT
		//If (<>IWS_bo_MessageLogging)
		// IWS_LogMessage ($_l_Channel;$_t_Message;"R")
		//End if
	: (<>Web_t_ServerHandler="NTK")
		If ($Clear=1)
			// RL (27-11-2007) : Because of keeping compatibility with ITK, the value 1 means do not clear the message from the queue
			IPC Get Message By Index($_l_Channel; 1; $_t_Message)
		Else 
			$_l_received:=IPC Receive($_l_Channel; $_t_Message)
		End if 
		
	Else 
		
End case 




$0:=$_t_Message
ERR_MethodTrackerReturn("IPC_RcvMessage"; $_t_oldMethodName)