//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SMTPMessageMultiPart
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Error; $_l_Stream; $0)
	C_REAL:C285($_r_Timeout)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_DoubleQuote; <>STR_t_LF; $_t_Addressee; $_t_Boundary; $_t_CR; $_t_CRLF; $_t_Header; $_t_HTMLMessage; $_t_LF; $_t_LocalAddress)
	C_TEXT:C284($_t_oldMethodName; $_t_PlainMessage; $_t_SMTPHost; $_t_Subject; $1; $2; $3; $4; $5; $6; IWS_t_Error)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SMTPMessageMultiPart")
// //**********************************************//
// //   IWS_SMTPMessageMultiPart()
// //   Author: Axel Muench   1/26/2001
// //   based on John's IWS_SMTPMessage
// //   this one is for sending multipart text/html combinations...
// //**********************************************//




$_t_SMTPHost:=$1
$_t_LocalAddress:=$2
$_t_Addressee:=$3
$_t_Subject:=$4
$_t_PlainMessage:=$5
$_t_HTMLMessage:=$6


$_t_CR:=<>STR_t_CR
$_t_LF:=<>STR_t_LF
$_t_CRLF:=$_t_CR+$_t_LF
IWS_t_Error:=""

//$_l_Stream:=ITK_TCPOpen ($_t_SMTPHost;TCP SMTP ;0)  ` open connection with SMTP host)ITK OUT AUgust 2009
If ($_l_Stream#0)
	//waiting loop, to allow other processes
	//to proceed.
	$_r_Timeout:=Tickcount:C458+(10*60)
	//wait for the stream to be connected for up to 10 seconds, then bail out
	//While ((ITK_TCPStatus ($_l_Stream)#◊ITK_i_StreamConnected) & (Tickcount<$_r_Timeout)))ITK OUT AUgust 2009
	//DelayTicks (6))ITK OUT AUgust 2009
	//End while )ITK OUT AUgust 2009
	//If (ITK_TCPStatus ($_l_Stream)=◊ITK_i_StreamConnected))ITK OUT AUgust 2009
	$_l_Error:=IWS_SMTPAnswer($_l_Stream)  // wait SMTP server login answer
	If ($_l_Error=0)
		//$_l_Error:=IWS_SendText ($_l_Stream;"HELO "+ITK_Addr2Name (ITK_Name2Addr (""))+$_t_CRLF)  ` log on SMTP )ITK OUT AUgust 2009
		$_l_Error:=IWS_SMTPAnswer($_l_Stream)  // wait SMTP answer
		If ($_l_Error=0)  // still ok ?
			$_l_Error:=IWS_SendText($_l_Stream; "MAIL FROM:<"+$_t_LocalAddress+">"+$_t_CRLF)  // sender email
			$_l_Error:=IWS_SMTPAnswer($_l_Stream)
		End if 
		If ($_l_Error=0)  // still ok ?
			$_l_Error:=IWS_SendText($_l_Stream; "RCPT TO:<"+$_t_Addressee+">"+$_t_CRLF)  // recipient email
			$_l_Error:=IWS_SMTPAnswer($_l_Stream)
		End if 
		If ($_l_Error=0)
			$_l_Error:=IWS_SendText($_l_Stream; "DATA"+$_t_CRLF)  // send message
			$_l_Error:=IWS_SMTPAnswer($_l_Stream)
		End if 
		
		
		If ($_l_Error=0)
			$_t_Header:=""
			
			$_t_Boundary:="_____"+String:C10(0)+"_____"
			$_t_Header:=$_t_Header+"Mime-Version: 1.0"+$_t_CRLF
			$_t_Header:=$_t_Header+"Content-Type: multipart/alternative; boundary="+STR_InQuotes($_t_Boundary)+$_t_CRLF
			//$_t_Header:=$_t_Header+"Date: "+ITK_Secs2RFC (ITK_Date2Secs (Current date;Current time;1))+$_t_CRLF)ITK OUT AUgust 2009
			$_t_Header:=$_t_Header+"Subject: "+$_t_Subject+$_t_CRLF
			$_t_Header:=$_t_Header+"From: "+$_t_LocalAddress+$_t_CRLF
			$_t_Header:=$_t_Header+"To: "+$_t_Addressee+$_t_CRLF
			IWS_SendText($_l_Stream; $_t_Header+$_t_CRLF; 1)
			$_t_Header:=""
			//  $_t_PlainMessage:=$_t_PlainMessage+$_t_CRLF+$_t_CRLF
			$_t_PlainMessage:=Replace string:C233($_t_PlainMessage; $_t_LF; "")  // remove LF
			$_t_PlainMessage:=Replace string:C233($_t_PlainMessage; $_t_CR; $_t_CRLF)  // convert CR to CR/LF
			$_t_PlainMessage:=Replace string:C233($_t_PlainMessage; $_t_CRLF+"."; $_t_CRLF+"..")  // convert starting point
			
			// we are sending the text part first
			IWS_SendText($_l_Stream; "--"+$_t_Boundary+$_t_CRLF; 1)  //mark first body part
			IWS_SendText($_l_Stream; "Content-Type: text/plain; charset="+<>STR_t_DoubleQuote+"iso-8859-1"+<>STR_t_DoubleQuote+$_t_CRLF+$_t_CRLF; 1)
			
			IWS_SendText($_l_Stream; $_t_PlainMessage+$_t_CRLF+$_t_CRLF+$_t_CRLF; 1)  // send message text
			
			$_t_PlainMessage:=""  //clear message, we no longer need it
			
			
			// now we are sending the html part
			IWS_SendText($_l_Stream; "--"+$_t_Boundary+$_t_CRLF; 1)  //mark first body part
			IWS_SendText($_l_Stream; "Content-Type: text/html"+$_t_CRLF+$_t_CRLF; 1)
			
			IWS_SendText($_l_Stream; $_t_HTMLMessage+$_t_CRLF+$_t_CRLF+$_t_CRLF; 1)  // send message text
			
			IWS_SendText($_l_Stream; "--"+$_t_Boundary+"--"+$_t_CRLF; 0)  //send final boundary marker
			
			IWS_SendText($_l_Stream; $_t_CRLF+"."+$_t_CRLF)  // end of message
			$_l_Error:=IWS_SMTPAnswer($_l_Stream)
			IWS_SendText($_l_Stream; "QUIT"+$_t_CRLF)  // close SMTP session
			$_l_Error:=IWS_SMTPAnswer($_l_Stream)
			//$_l_Error:=ITK_TCPClose ($_l_Stream)  ` no more data to send)ITK OUT AUgust 2009
			
			$_r_Timeout:=Tickcount:C458+(10*60)
			//While ((ITK_TCPStatus ($_l_Stream)=◊ITK_i_StreamConnected) & (Tickcount<$_r_Timeout)))ITK OUT AUgust 2009
			//DelayTicks (6))ITK OUT AUgust 2009
			//End while   ` stream closed by SMTP host ?)ITK OUT AUgust 2009
			
		End if 
	End if 
	//Else )ITK OUT AUgust 2009
	//IWS_t_Error:="Unable to open SMTP connection")ITK OUT AUgust 2009
	//End if )ITK OUT AUgust 2009
	//$_l_Error:=ITK_TCPRelease ($_l_Stream))ITK OUT AUgust 2009
Else 
	IWS_t_Error:="Unable to open stream to SMTP server"
End if 
//return an integer variable for success or failure
If (IWS_t_Error="")
	$0:=0
Else 
	$0:=-1
End if 
ERR_MethodTrackerReturn("IWS_SMTPMessageMultiPart"; $_t_oldMethodName)