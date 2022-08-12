//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SMTPExchange
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
	C_LONGINT:C283($_l_error; $_l_FlushFlag; $_l_Stream; $0; $1; $3)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; $_t_CR; $_t_CRLF; $_t_IncomingText; $_t_LF; $_t_oldMethodName; $2; IWS_t_Error)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SMTPExchange")
//Method: IWS_SMTPExchange
//
//Purpose: Handles a subcomponent of an SMTP transaction


$_l_Stream:=$1
$_t_IncomingText:=$2
If (Count parameters:C259=3)
	$_l_FlushFlag:=$3
Else 
	$_l_FlushFlag:=0
End if 

$_t_CR:=<>STR_t_CR
$_t_LF:=<>STR_t_LF
$_t_CRLF:=$_t_CR+$_t_LF

//$Bytes:=ITK_TCPSend ($_l_Stream;$_t_IncomingText+$_t_CRLF;$_l_FlushFlag))ITK OUT AUgust 2009
$_l_error:=IWS_SMTPAnswer($_l_Stream)
If ($_l_error#0)
	IWS_t_Error:="Problems with "+$_t_IncomingText
End if 
$0:=$_l_error
ERR_MethodTrackerReturn("IWS_SMTPExchange"; $_t_oldMethodName)