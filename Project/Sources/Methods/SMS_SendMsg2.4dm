//%attributes = {}
If (False:C215)
	//Project Method Name:      SMS_SendMsg2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FLashFlag; $5)
	C_LONGINT:C283($_l_Error; $_l_TcpSession; $_l_TcpState)
	C_TEXT:C284($_l_Destination; $_t_HttpText; $_t_Message; $_t_oldMethodName; $_t_password; $_t_Response; $_t_SenderID; $_t_Temp; $_t_Username; $0; $1)
	C_TEXT:C284($2; $3; $4; $6)
	C_TIME:C306($_ti_StartTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMS_SendMsg2")
// SMS_SendMsg2
//resp:=SMSRelay_SendTextMessage(username,password, destination, message, flash)
//submits a SMS via SMSRelay.

If (Count parameters:C259>=6)
	$_t_Username:=$1
	$_t_password:=$2
	$_l_Destination:=$3
	$_t_Message:=$4
	$_bo_FLashFlag:=$5
	$_t_SenderID:=$6
	
	//$_t_HttpText:="GET /cgi-bin/smsrelay.cgi?"
	$_t_HttpText:="GET /cgi-bin/sendsms?"  // pb
	//$_t_HttpText:=$_t_HttpText+"&user="+SMSRelay_URL_Encode ($_t_password)
	$_t_HttpText:=$_t_HttpText+"user="+SMSRelay_URL_Encode($_t_Username)  // 26/06/02 pb
	$_t_HttpText:=$_t_HttpText+"&password="+SMSRelay_URL_Encode($_t_password)
	$_t_HttpText:=$_t_HttpText+"&to="+SMSRelay_URL_Encode($_l_Destination)
	
	$_t_HttpText:=$_t_HttpText+"&from="+SMSRelay_URL_Encode($_t_SenderID)
	$_t_HttpText:=$_t_HttpText+"&text="+SMSRelay_URL_Encode($_t_Message)
	If ($_bo_FLashFlag)
		$_t_HttpText:=$_t_HttpText+"&flash=1"
	End if 
	// blue.smsrelay.com
	$_t_HttpText:=$_t_HttpText+" HTTP/1.0"+Char:C90(13)+Char:C90(10)+"Host: blue.smsrelay.com"+Char:C90(13)+Char:C90(10)  // 29/04/02 pb
	$_t_HttpText:=$_t_HttpText+Char:C90(13)+Char:C90(10)
	//TRACE
	$_l_Error:=TCP_Open("blue.smsrelay.com"; 80; $_l_TcpSession)  // 29/04/02 pb
	$0:=""
	If ($_l_Error#0)
		$0:=Errors_TCP($_l_Error)
	Else 
		$_t_Response:=""
		$_ti_StartTime:=Current time:C178
		$_l_Error:=TCP_State($_l_TcpSession; $_l_TcpState)
		If ($_l_Error#0)
			$0:=Errors_TCP($_l_Error)
		Else 
			While (($_l_TcpState#8) & ((Current time:C178-$_ti_StartTime)<60) & ($_l_Error=0))  //wait for a proper session for up to 60 seconds
				DelayTicks(10)
				$_l_Error:=TCP_State($_l_TcpSession; $_l_TcpState)
				If ($_l_Error#0)
					$0:=Errors_TCP($_l_Error)
				End if 
			End while 
			
			If ($0#"")
				// bye bye
			Else 
				If ($_l_TcpState#8)
					$0:="Could not open a TCP session."
				Else 
					$_l_Error:=TCP_Send($_l_TcpSession; $_t_HttpText)
					If ($_l_Error#0)
						$0:=Errors_TCP($_l_Error)
					Else 
						$_ti_StartTime:=Current time:C178
						While ($_l_Error=0) & ($_l_TcpState=8) & ((Current time:C178-$_ti_StartTime)<60)
							IDLE:C311  // 7/04/03 pb
							$_t_Temp:=""
							$_l_Error:=TCP_Receive($_l_TcpSession; $_t_Temp)
							If ($_l_Error#0)
								$0:=Errors_TCP($_l_Error)
							End if 
							$_t_Response:=$_t_Response+$_t_Temp
							$_l_Error:=TCP_State($_l_TcpSession; $_l_TcpState)
							If ($_l_Error#0)
								$0:=Errors_TCP($_l_Error)
							End if 
						End while 
						//         If ($0#"")
						If ($_t_Response#"")
							$0:=$_t_Response
						End if 
						$_l_Error:=TCP_Close($_l_TcpSession)
					End if 
				End if 
			End if 
		End if 
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("SMS_SendMsg2"; $_t_oldMethodName)
