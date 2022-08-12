//%attributes = {}
If (False:C215)
	//Project Method Name:      IPC_ClearMessageQueue
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
	C_LONGINT:C283($1; $Queue)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IPC_ClearMessageQueue")
//******************************************************************************
//
//Method: IPC_ClearMessageQueue
//
//Written by  John on 4/21/99
//
//Purpose: Wrapper for ITK command
//$1 = channel, longint
//  `
//
//******************************************************************************
$Queue:=$1

Case of 
	: (<>Web_t_ServerHandler="ITK")
		//ITK_ResetIPCMsg ($Queue)  `clear any messages in queue ITK OUT
		
	: (<>Web_t_ServerHandler="NTK")
		IPC Delete Channel($Queue)  //clear any messages in queue
		
	Else 
		
End case 
ERR_MethodTrackerReturn("IPC_ClearMessageQueue"; $_t_oldMethodName)