//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SMTPAnswer
	//------------------ Method Notes ------------------
	//******************************************************************************
	//
	//Method: IWS_SMTPAnswer
	//
	//Written by  John on 20/9/98
	//
	//Purpose: Waits for answer from SMTP server
	//
	//$1 - longint, stream
	//$2 - longint, timeout in ticks
	//$0 - longint, status. 0 = success, -1 = error
	//
	//******************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Bytes; $_l_Stream; $_l_Ticks; $0; $1; $2)
	C_REAL:C285($_r_TimeOutPoint)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; $_t_Buffer; $_t_CR; $_t_crlf; $_t_LF; $_t_oldMethodName; $_t_StatusString; $_t_Temp; IWS_t_Error)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SMTPAnswer")


$_t_Temp:=""
$_t_CR:=<>STR_t_CR
$_t_LF:=<>STR_t_LF

//IWS_l_Stream:=$1
$_l_Stream:=$1

If (Count parameters:C259=2)
	$_l_Ticks:=$2
Else 
	$_l_Ticks:=20*60
End if 
$_r_TimeOutPoint:=Tickcount:C458+$_l_Ticks
$_t_StatusString:=""

$_t_Buffer:=$_t_LF

//$err:=ITK_TCPStrmInfo (IWS_l_Stream;IWS_l_RemoteIPAddress;
//IWS_l_RemotePort;IWS_l_LocalPort;$Srtt;IWS_l_LocalIPAddress)  ` get $_l_Stream info

//If (IWS_l_Stream # 0)
If ($_l_Stream#0)
	
	Repeat 
		//$_l_Bytes:=ITK_TCPRcv (IWS_l_Stream;$_t_Temp;0;0;0;"";0)
		//$_l_Bytes:=ITK_TCPRcv ($_l_Stream;$_t_Temp))ITK OUT AUgust 2009
		If ($_l_Bytes>0)
			$_t_Buffer:=$_t_Buffer+$_t_Temp
			Case of 
				: (Position:C15($_t_LF+"2"; $_t_Buffer)>0)
					$_t_StatusString:="Success"
				: (Position:C15($_t_LF+"3"; $_t_Buffer)>0)
					$_t_StatusString:="Success"
				: (Position:C15($_t_LF+"5"; $_t_Buffer)>0)
					$_t_StatusString:="Failure"
					IWS_t_Error:="SMTP  Host response = "+$_t_Buffer+" (IWS_SMTPAnswer)"
			End case 
		End if 
		IDLE:C311
	Until ($_t_StatusString#"") | (Tickcount:C458>$_r_TimeOutPoint)
	If ($_t_StatusString="")  //it timed out
		$_t_StatusString:="Failure"
		IWS_t_Error:="Timeout  (IWS_SMTPAnswer)"
	End if 
Else 
	$_t_StatusString:="Failure"
	IWS_t_Error:="Stream does not exist (IWS_SMTPAnswer)"
End if 
If ($_t_StatusString="Failure")
	$0:=-1
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("IWS_SMTPAnswer"; $_t_oldMethodName)