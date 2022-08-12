//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_StreamClosed
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
	//C_UNKNOWN(TCP Connection Closed)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Status; $_l_Stream; $1)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_oldMethodName; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_StreamClosed")
//******************************************************************************
//
//Method: IWS_StreamClosed
//
//Written by  John Moore on 10/20/98
//
//Purpose: Function that returns true if a stream can be released
//
//$1 - longint, stream
//$0 - boolean, closed or not
//
IWS_t_CurrentMethodName:="IWS_StreamClosed"
//
//******************************************************************************

$_l_Stream:=$1

Case of 
	: (<>Web_t_ServerHandler="ITK")
		//$_l_Status:=ITK_TCPStatus ($_l_Stream))ITK OUT AUgust 2009
		$0:=($_l_Status<0) | ($_l_Status>=12)
		
	: (<>Web_t_ServerHandler="NTK")
		$0:=(TCP Get State($_l_Stream)=TCP Connection Closed)
		
	Else 
		
End case 
ERR_MethodTrackerReturn("IWS_StreamClosed"; $_t_oldMethodName)