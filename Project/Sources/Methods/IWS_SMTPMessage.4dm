//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SMTPMessage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283(<>ITK_l_StreamConnected; $_l_Base64PacketLength; $_l_error; $_l_PacketIndex; $_l_PacketLength; $_l_PacketLengthDiv; $_l_Platform; $_l_Status; $_l_Stream; $_l_WindowReferenceRow; $_r_Bytes)
	C_LONGINT:C283($_r_SentBytes; $0; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_TotalReadBytes)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; $_t_Addressee; $_t_Attachment; $_t_Attachment2; $_t_AttachmentHeader; $_t_Base64Packet; $_t_Boundary; $_t_CR; $_t_CRLF; $_t_Encoding)
	C_TEXT:C284($_t_Header; $_t_LF; $_t_LocalAddress; $_t_Message; $_t_oldMethodName; $_t_Packet; $_t_SMTPHost; $_t_Subject; $_t_Text; $1; $2)
	C_TEXT:C284($3; $4; $5; $6; $7; IWS_t_Error)
	C_TIME:C306($_ti_AttachmentDocument)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SMTPMessage")
//******************************************************************************
//
//Method: IWS_SMTPMessage
//
//Written by  John on 20/9/98
//
//Purpose: Sends SMTP message to specified recipient
//
// $1 - string 80, SMTP server address
// $2 - string 80, email address of sender
// $3 - string 80, email address of addressee (recipient)
// $4 - string 80,  message subject
// $5 - text, message
// $6 - text, pathname of attachment  (optional)
// $7 - text, encoding system for attachment - UUEncode or Base64

//******************************************************************************



$_t_SMTPHost:=$1
$_t_LocalAddress:=$2
$_t_Addressee:=$3
$_t_Subject:=$4
$_t_Message:=$5
If (Count parameters:C259<6)
	$_t_Attachment:=""
Else 
	$_t_Attachment:=$6
	If (Count parameters:C259=7)
		$_t_Encoding:=$7
	Else 
		$_t_Encoding:="UUEncode"
	End if 
End if 

$_t_CR:=<>STR_t_CR
$_t_LF:=<>STR_t_LF
$_t_CRLF:=$_t_CR+$_t_LF
IWS_t_Error:=""

//$_l_Stream:=ITK_TCPOpen ($_t_SMTPHost;TCP SMTP ;0)  ` open connection with SMTP host)ITK OUT AUgust 2009
If ($_l_Stream#0)
	//$_l_Status:=ITK_TCPWaitConn ($_l_Stream;◊ITK_i_StreamConnected;10*60)  ` wait for SMTP connection synchronously, for 10 secs.)ITK OUT AUgust 2009
	
	If ($_l_Status=<>ITK_l_StreamConnected)
		$_l_error:=IWS_SMTPAnswer($_l_Stream)  // wait SMTP server login answer
		If ($_l_error=0)
			
			//$_r_Bytes:=ITK_TCPSend ($_l_Stream;"HELO "+ITK_Addr2Name (ITK_Name2Addr (""))+$_t_CRLF)  ` log on SMTP )ITK OUT AUgust 2009
			$_l_error:=IWS_SMTPAnswer($_l_Stream)  // wait SMTP answer
			If ($_l_error=0)  // still ok ?
				//$_r_Bytes:=ITK_TCPSend ($_l_Stream;"MAIL FROM:<"+$_t_LocalAddress+">"+$_t_CRLF)  ` sender email)ITK OUT AUgust 2009
				$_l_error:=IWS_SMTPAnswer($_l_Stream)
			End if 
			If ($_l_error=0)  // still ok ?
				//$_r_Bytes:=ITK_TCPSend ($_l_Stream;"RCPT TO:<"+$_t_Addressee+">"+$_t_CRLF)  ` recipient email)ITK OUT AUgust 2009
				$_l_error:=IWS_SMTPAnswer($_l_Stream)
			End if 
			If ($_l_error=0)
				//$_r_Bytes:=ITK_TCPSend ($_l_Stream;"DATA"+$_t_CRLF)  ` send message)ITK OUT AUgust 2009
				$_l_error:=IWS_SMTPAnswer($_l_Stream)
			End if 
			If ($_l_error=0)
				$_t_Header:=""
				
				If ($_t_Attachment#"")  //if there is an attachment
					//$_t_Boundary:="==========_=="+String(ITK_Date2Secs (Current date;Current time))+"==_==========")ITK OUT AUgust 2009
					$_t_Header:=$_t_Header+"Mime-Version: 1.0"+$_t_CRLF
					$_t_Header:=$_t_Header+"Content-Type: multipart/mixed; boundary="+STR_InQuotes($_t_Boundary)+$_t_CRLF
				Else 
					$_t_Boundary:=""
				End if 
				//$_t_Header:=$_t_Header+"Date: "+ITK_Secs2RFC (ITK_Date2Secs (Current date;Current time;1))+$_t_CRLF b)ITK OUT AUgust 2009
				$_t_Header:=$_t_Header+"Subject: "+$_t_Subject+$_t_CRLF
				$_t_Header:=$_t_Header+"From: "+$_t_LocalAddress+$_t_CRLF
				$_t_Header:=$_t_Header+"To: "+$_t_Addressee+$_t_CRLF
				//$_r_Bytes:=ITK_TCPSend ($_l_Stream;$_t_Header+$_t_CRLF;1))ITK OUT AUgust 2009
				$_t_Header:=""
				//  $_t_Message:=$_t_Message+$_t_CRLF+$_t_CRLF
				$_t_Message:=Replace string:C233($_t_Message; $_t_LF; "")  // remove LF
				If (Is macOS:C1572)
					$_t_Message:=Replace string:C233($_t_Message; $_t_CR; $_t_CRLF)  // convert CR to CR/LF
				End if 
				$_t_Message:=Replace string:C233($_t_Message; $_t_CRLF+"."; $_t_CRLF+"..")  // convert starting point
				If ($_t_Boundary#"")  // we are sending MIME Multipart
					//$_r_Bytes:=ITK_TCPSend ($_l_Stream;"--"+$_t_Boundary+$_t_CRLF;1)  `mark first body part)ITK OUT AUgust 2009
					//$_r_Bytes:=ITK_TCPSend ($_l_Stream;"Content-Type: text/plain"+$_t_CRLF+$_t_CRLF;1))ITK OUT AUgust 2009
				End if 
				//$_r_Bytes:=ITK_TCPSend ($_l_Stream;$_t_Message+$_t_CRLF+$_t_CRLF+$_t_CRLF;1)  ` send message text)ITK OUT AUgust 2009
				
				$_t_Message:=""  //clear message, we no longer need it
				If ($_t_Attachment#"")
					If (Test path name:C476($_t_Attachment)=1)
						$_t_AttachmentHeader:="--"+$_t_Boundary+$_t_CRLF
						If ($_t_Encoding="Base64")
							//***** Rollo 28/5/2004 **** Implement HFS Replacement to make attachments work
							$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Type: octet-stream; name="  //+STR_InQuotes (HFSShortName ($_t_Attachment))+$_t_CRLF
							$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Transfer-Encoding: base64"+$_t_CRLF
							$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Disposition: attachment; filename="  //+STR_InQuotes (HFSShortName ($_t_Attachment))+$_t_CRLF+$_t_CRLF
							
							//$_r_Bytes:=ITK_TCPSend ($_l_Stream;$_t_AttachmentHeader;0))ITK OUT AUgust 2009
							UTI_WinCenter(230; 65; 0)
							GOTO XY:C161(0; 0)
							MESSAGE:C88("Opening document"+<>STR_t_CR)
							$_ti_AttachmentDocument:=DB_OpenDocument($_t_Attachment)
							$_r_TotalReadBytes:=0
							$_r_SentBytes:=0
							$_l_error:=0
							
							$_t_Base64Packet:=""
							While (OK=1)
								RECEIVE PACKET:C104($_ti_AttachmentDocument; $_t_Packet; 19998)  //keep it divisible by 3
								$_l_PacketLength:=Length:C16($_t_Packet)
								If ($_l_PacketLength>0)
									
									GOTO XY:C161(0; 0)
									$_r_TotalReadBytes:=$_r_TotalReadBytes+$_l_PacketLength
									MESSAGE:C88("Bytes read = "+String:C10($_r_TotalReadBytes)+<>STR_t_CR)
									MESSAGE:C88("Converting "+String:C10($_l_PacketLength)+" bytes to Base64")
									//$_t_Base64Packet:=$_t_Base64Packet+ITK_Text2B64 ($_t_Packet;0))ITK OUT AUgust 2009
									//  $_t_Base64Packet:=$_t_Base64Packet+IWS_AsciiToBase64 ($_t_Packet)
									$_l_Base64PacketLength:=Length:C16($_t_Base64Packet)
									GOTO XY:C161(0; 1)
									MESSAGE:C88("Base64 packet length is "+String:C10($_l_Base64PacketLength)+<>STR_t_CR)
									$_l_PacketLengthDiv:=$_l_Base64PacketLength\76
									For ($_l_PacketIndex; 1; $_l_PacketLengthDiv)
										$_t_Text:=Substring:C12($_t_Base64Packet; 1; 76)+$_t_CRLF
										$_t_Base64Packet:=Substring:C12($_t_Base64Packet; 77)
										$_r_SentBytes:=$_r_SentBytes+Length:C16($_t_Text)
										//$_r_Bytes:=ITK_TCPSend ($_l_Stream;$_t_Text;1))ITK OUT AUgust 2009
										GOTO XY:C161(0; 2)
										MESSAGE:C88("Base64-encoded bytes sent = "+String:C10($_r_SentBytes))
									End for 
								End if 
							End while 
							//Now clear up what was left over...
							While ($_t_Base64Packet#"")
								$_t_Text:=Substring:C12($_t_Base64Packet; 1; 76)+$_t_CRLF
								$_t_Base64Packet:=Substring:C12($_t_Base64Packet; 77)
								$_r_SentBytes:=$_r_SentBytes+Length:C16($_t_Text)
								//$_r_Bytes:=ITK_TCPSend ($_l_Stream;$_t_Text;1))ITK OUT AUgust 2009
								GOTO XY:C161(0; 2)
								MESSAGE:C88("Base64-encoded bytes sent = "+String:C10($_r_SentBytes))
							End while 
							
							ERASE WINDOW:C160
							MESSAGE:C88("Closing document...")
							CLOSE DOCUMENT:C267($_ti_AttachmentDocument)
							CLOSE WINDOW:C154
							If (WIN_bo_TrackerInited)
								$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
								If ($_l_WindowReferenceRow>0)
									WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
								End if 
							End if 
							
							
						Else 
							If ($_t_Attachment#"@.uu")
								$_t_Attachment2:=$_t_Attachment+".uu"
								//$_l_error:=ITK_Mac2uu ($_t_Attachment;$_t_Attachment2))ITK OUT AUgust 2009
							End if 
							$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Type: application/uuencode; name="  //+STR_InQuotes (HFSShortName ($_t_Attachment2))+$_t_CRLF
							$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Disposition: attachment; filename="  //+STR_InQuotes (HFSShortName ($_t_Attachment2))+$_t_CRLF+$_t_CRLF
							
							//$_r_Bytes:=ITK_TCPSend ($_l_Stream;$_t_AttachmentHeader;0))ITK OUT AUgust 2009
							//$_l_error:=ITK_TCPSendFile ($_l_Stream;$_t_Attachment2;0))ITK OUT AUgust 2009
							If ($_t_Attachment#"@.uu")
								DELETE DOCUMENT:C159($_t_Attachment2)
							End if 
						End if 
						//$_r_Bytes:=ITK_TCPSend ($_l_Stream;$_t_CRLF;1))ITK OUT AUgust 2009
					End if   //If (Test path name($_t_Attachment)=1)
				End if   //     If ($_t_Attachment # "")
				If ($_t_Boundary#"")
					//$_r_Bytes:=ITK_TCPSend ($_l_Stream;"--"+$_t_Boundary+"--"+$_t_CRLF;0)  `send final boundary marker)ITK OUT AUgust 2009
				End if 
				//$_r_Bytes:=ITK_TCPSend ($_l_Stream;"."+$_t_CRLF)  ` end of message)ITK OUT AUgust 2009
				$_l_error:=IWS_SMTPAnswer($_l_Stream)
				//$_r_Bytes:=ITK_TCPSend ($_l_Stream;"QUIT"+$_t_CRLF)  ` close SMTP session)ITK OUT AUgust 2009
				$_l_error:=IWS_SMTPAnswer($_l_Stream)
				//$_l_error:=ITK_TCPClose ($_l_Stream)  ` no more data to send )ITK OUT AUgust 2009
				Repeat 
					//$_l_Status:=ITK_TCPStatus ($_l_Stream))ITK OUT AUgust 2009
					IDLE:C311
				Until ($_l_Status#<>ITK_l_StreamConnected)  // stream closed by SMTP host ?
			End if 
		End if 
	Else 
		IWS_t_Error:="Unable to open SMTP connection"
	End if 
	//$_l_error:=ITK_TCPRelease ($_l_Stream))ITK OUT AUgust 2009
Else 
	IWS_t_Error:="Unable to open stream to SMTP server"
End if 
//return an integer variable for success or failure
If (IWS_t_Error="")
	$0:=0
Else 
	$0:=-1
End if 
ERR_MethodTrackerReturn("IWS_SMTPMessage"; $_t_oldMethodName)