//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SendText
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
	C_LONGINT:C283($_l_Bytes; $_l_BytesSend; $_l_Error; $_l_FlushFlag; $_l_Stream; $0; $1; $3)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_message; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SendText")
//Method: IWS_SendText

//Purpose: Sends a message on a stream and logs any errors
//

Case of 
	: (<>Web_t_ServerHandler="ITK")
		//$1 - longint, stream
		//$2 - text, message
		//$3 - optional longint, flush stream
		//$0 - response code
		
		$_l_Stream:=$1
		$_t_message:=$2
		If (Count parameters:C259=3)
			$_l_FlushFlag:=$3
		Else 
			$_l_FlushFlag:=0
		End if 
		//$0:=ITK_TCPSend ($_l_Stream;$_t_message;$_l_FlushFlag))ITK OUT AUgust 2009
		
		If ($0<0)
			IWS_SendToLog("Error in IWS_SendText (return value = "+String:C10($0)+") sending the following text: "+$_t_message)
		End if 
		
	: (<>Web_t_ServerHandler="NTK")
		
		//$1 - longint, stream
		//$2 - text, message
		//$0 - response code
		
		
		
		$_l_Stream:=$1
		$_t_message:=$2
		
		$_l_BytesSend:=TCP Send($_l_Stream; $_t_message)
		
		If (($_l_BytesSend=0) & (Length:C16($_t_message)>0))
			$_l_Error:=-1
		End if 
		
		$0:=$_l_Error
		
	Else 
		
End case 
ERR_MethodTrackerReturn("IWS_SendText"; $_t_oldMethodName)