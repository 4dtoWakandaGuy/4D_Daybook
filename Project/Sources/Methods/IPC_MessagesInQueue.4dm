//%attributes = {}
If (False:C215)
	//Project Method Name:      IPC_MessagesInQueue
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
	C_LONGINT:C283($0; $1; $Queue)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IPC_MessagesInQueue")
//******************************************************************************
//
//Method: IPC_MessagesInQueue
//
//Written by  John on 4/21/99
//
//Purpose: returns number of messages in queue, passed as longint in $1
//
//Wrapper for ITK function

//******************************************************************************

$Queue:=$1

Case of 
	: (<>Web_t_ServerHandler="ITK")
		//$0:=ITK_NbIPCMsg ($Queue) ITK OUT
		
	: (<>Web_t_ServerHandler="NTK")
		$0:=IPC Count Messages($Queue)
		
	Else 
		
End case 
ERR_MethodTrackerReturn("IPC_MessagesInQueue"; $_t_oldMethodName)