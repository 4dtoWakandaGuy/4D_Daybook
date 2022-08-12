//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_StreamStatus
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
	C_LONGINT:C283($_l_Flag; $_l_Stream; $0; $1; $2)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_StreamStatus")
//******************************************************************************
//
//Method: IWS_StreamStatus
//
//Written by  John on 4/21/99
//
//Purpose: returns numeric status of stream.
//Wrapper for ITK function
//
//$1 - longint, stream
//$0 - longint, status

//
//******************************************************************************
$_l_Stream:=$1



Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		If (Count parameters:C259=2)
			$_l_Flag:=$2
			//$0:=ITK_TCPStatus ($_l_Stream;$_l_Flag))ITK OUT AUgust 2009
		Else 
			//$0:=ITK_TCPStatus ($_l_Stream))ITK OUT AUgust 2009
		End if 
		
	: (<>Web_t_ServerHandler="NTK")
		$0:=TCP Get State($_l_Stream)
	Else 
		
End case 
ERR_MethodTrackerReturn("IWS_StreamStatus"; $_t_oldMethodName)