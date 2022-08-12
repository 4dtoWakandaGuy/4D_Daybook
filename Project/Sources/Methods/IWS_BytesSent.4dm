//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_BytesSent
	//------------------ Method Notes ------------------
	//******************************************************************************
	//
	//Method: IWS_BytesSent
	//
	//Written by  Administrator on 4/21/99
	//
	//Purpose: Returns number of bytes sent on stream
	//
	//$1 - longint,stream ID
	//$0 - longint, number of bytes
	
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(TCP Bytes Send)
	C_LONGINT:C283($_l_Stream; $0; $1)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_oldMethodName; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_BytesSent")
IWS_t_CurrentMethodName:="IWS_BytesSent"
//
//******************************************************************************
$_l_Stream:=$1

Case of 
	: (<>Web_t_ServerHandler="ITK")
		//$0:=ITK_TCPStatus ($_l_Stream;17)  ITK OUT`this flag sets the number of bytes returned on stream
	: (<>Web_t_ServerHandler="NTK")
		$0:=TCP Get Statistics($_l_Stream; TCP Bytes Send)
		//
	Else 
		
End case 


//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_BytesSent"; $_t_oldMethodName)