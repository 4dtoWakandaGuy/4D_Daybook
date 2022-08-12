//%attributes = {}
If (False:C215)
	//Project Method Name:      IPC_SendMessage
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
	C_LONGINT:C283($_l_Channel; $1)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_Message; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IPC_SendMessage")
//******************************************************************************
//
//Method: IPC_SendMessage
//
//Written by  John on 4/21/99
//
//Purpose: Wrapper for ITK routine
//
//$1 - type -purpose


$_l_Channel:=$1
$_t_Message:=$2

Case of 
	: (<>Web_t_ServerHandler="ITK")
		//ITK_SendIPCMsg ($_l_Channel;$_t_Message) ITK OUT
		
		
	: (<>Web_t_ServerHandler="NTK")
		IPC Send($_l_Channel; $_t_Message)
		
	Else 
		
End case 


//If (<>IWS_bo_MessageLogging)
//IWS_LogMessage ($_l_Channel;$_t_Message;"S")
//End if
ERR_MethodTrackerReturn("IPC_SendMessage"; $_t_oldMethodName)