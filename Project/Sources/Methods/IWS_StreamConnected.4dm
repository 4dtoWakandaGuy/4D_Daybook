//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_StreamConnected
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 10:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(TCP Connection Established)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Stream; $1)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_oldMethodName; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_StreamConnected")
//******************************************************************************
//
//Method: IWS_StreamConnected
//
//Written by  John on 4/21/99
//
//Purpose: Wrapper for ITK command
//
//$1 - longint, stream number
//$0 - boolean, connected or not
//
IWS_t_CurrentMethodName:="IWS_StreamConnected"
//
//******************************************************************************
$_l_Stream:=$1

Case of 
	: (<>Web_t_ServerHandler="ITK")
		//$0:=(ITK_TCPStatus ($_l_Stream)=◊ITK_i_StreamConnected))ITK OUT AUgust 2009
		
	: (<>Web_t_ServerHandler="NTK")
		$0:=(TCP Get State($_l_Stream)=TCP Connection Established)
	Else 
		
End case 
ERR_MethodTrackerReturn("IWS_StreamConnected"; $_t_oldMethodName)