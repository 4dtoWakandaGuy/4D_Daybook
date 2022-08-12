//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SMTPMessage2
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
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BLOB:C604($_blb_MessageBLOB)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_Base64PacketLength; $_l_Base64Total; $_l_BlobSize; $_l_CharacterPosition; $_l_Error; $_l_Index; $_l_IndexIterations; $_l_offset; $_l_Platform; $_l_Stream; $_l_WholeIteration)
	C_LONGINT:C283($_l_WindowReferenceRow; $_r_Bytes; $_r_BytesSent; $_r_Timeout; $_r_TotalReadBytes; $0; $Packetlength; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; $_t_Addressee; $_t_attachment; $_t_Attachment2; $_t_AttachmentHeader; $_t_Base64Packet; $_t_Base64Text; $_t_Boundary; $_t_CCAddresee; $_t_CCList)
	C_TEXT:C284($_t_CR; $_t_CRLF; $_t_Encoding; $_t_Header; $_t_LF; $_t_LocalAddress; $_t_Message; $_t_oldMethodName; $_t_SMTPHost; $_t_Text; $1)
	C_TEXT:C284($2; $3; $4; $5; $6; $7; $Subject; IWS_t_Error)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SMTPMessage2")
//******************************************************************************
//
//Method: IWS_SMTPMessage2
//
//Purpose: Sends SMTP message to specified recipient
//
// $1 - string 80, SMTP server address
// $2 - string 255, email address of sender
// $3 - text, email address of addressee (recipient)
//     (you may pass a comma delimited list of email addresses)
// $4 - string 255,  message subject
// $5 - text, message
// $6 - text, pathname of attachment  (optional)
// $7 - text, encoding method for attachment - UUEncode or Base64
//
//******************************************************************************



$_t_SMTPHost:=$1
$_t_LocalAddress:=$2
$_t_Addressee:=Replace string:C233($3; " "; "")
$_t_Addressee:=Replace string:C233($3; ";"; ",")  //Rollo 1/30/2003 - make ; delimited addresses work as well as , delimited

$Subject:=$4
$_t_Message:=$5
If (Count parameters:C259<6)
	$_t_attachment:=""
Else 
	$_t_attachment:=$6
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

$_t_CCList:=""
$_l_CharacterPosition:=Position:C15(","; $_t_Addressee)
If ($_l_CharacterPosition>0)
	$_t_CCList:=Substring:C12($_t_Addressee; $_l_CharacterPosition+1)
	$_t_Addressee:=Substring:C12($_t_Addressee; 1; $_l_CharacterPosition-1)
Else 
	$_t_CCList:=""
End if 

//$_l_Stream:=ITK_TCPOpen ($_t_SMTPHost;TCP SMTP ;0)  ` open connection with SMTP host)ITK OUT AUgust 2009
If ($_l_Stream#0)
	//The following lines changed by John, 4/9/2000,  from synchronous
	//blocking call in ITK to waiting loop, to allow other processes
	//to proceed.
	$_r_Timeout:=Tickcount:C458+(10*60)
	//wait for the stream to be connected for up to 10 seconds, then bail out
	//While ((ITK_TCPStatus ($_l_Stream)#◊ITK_i_StreamConnected) & (Tickcount<$_r_Timeout)))ITK OUT AUgust 2009
	//DelayTicks (6))ITK OUT AUgust 2009
	//End while )ITK OUT AUgust 2009
	//If (ITK_TCPStatus ($_l_Stream)=◊ITK_i_StreamConnected))ITK OUT AUgust 2009
	$_l_Error:=IWS_SMTPAnswer($_l_Stream)  // wait SMTP server login answer
	If ($_l_Error=0)
		//$_l_Error:=IWS_SendText ($_l_Stream;"HELO "+ITK_Addr2Name (ITK_Name2Addr (""))+$_t_CRLF)  ` log on SMTP host
		$_l_Error:=IWS_SMTPAnswer($_l_Stream)  // wait SMTP answer
		If ($_l_Error=0)  // still ok ?
			IWS_SendText($_l_Stream; "MAIL FROM:<"+$_t_LocalAddress+">"+$_t_CRLF)  // sender email
			$_l_Error:=IWS_SMTPAnswer($_l_Stream)
		End if 
		If ($_l_Error=0)  // still ok ?
			$_l_Error:=IWS_SendText($_l_Stream; "RCPT TO:<"+$_t_Addressee+">"+$_t_CRLF)  // recipient email
			$_l_Error:=IWS_SMTPAnswer($_l_Stream)
		End if 
		While (($_l_Error=0) & ($_t_CCList#""))  // still ok ? AND still have more recipients to email
			$_l_CharacterPosition:=Position:C15(","; $_t_CCList)
			If ($_l_CharacterPosition>0)
				$_t_CCAddresee:=Substring:C12($_t_CCList; 1; $_l_CharacterPosition-1)
				$_t_CCList:=Substring:C12($_t_CCList; $_l_CharacterPosition+1)
			Else 
				$_t_CCAddresee:=$_t_CCList
				$_t_CCList:=""
			End if 
			IWS_SendText($_l_Stream; "RCPT TO:<"+$_t_CCAddresee+">"+$_t_CRLF)  // recipient email
			$_l_Error:=IWS_SMTPAnswer($_l_Stream)
		End while 
		If ($_l_Error=0)
			IWS_SendText($_l_Stream; "DATA"+$_t_CRLF)  // send message
			$_l_Error:=IWS_SMTPAnswer($_l_Stream)
		End if 
		If ($_l_Error=0)
			$_t_Header:=""
			
			If ($_t_attachment#"")  //if there is an attachment
				$_t_Boundary:="====="+String:C10(0)+"=="
				$_t_Header:=$_t_Header+"Mime-Version: 1.0"+$_t_CRLF
				$_t_Header:=$_t_Header+"Content-Type: multipart/mixed; boundary="+STR_InQuotes($_t_Boundary)+$_t_CRLF
			Else 
				$_t_Boundary:=""
			End if 
			//$_t_Header:=$_t_Header+"Date: "+ITK_Secs2RFC (ITK_Date2Secs (Current date;Current time;1))+$_t_CRLF)ITK OUT AUgust 2009
			$_t_Header:=$_t_Header+"Subject: "+$Subject+$_t_CRLF
			$_t_Header:=$_t_Header+"From: "+$_t_LocalAddress+$_t_CRLF
			$_t_Header:=$_t_Header+"To: "+$_t_Addressee+$_t_CRLF
			IWS_SendText($_l_Stream; $_t_Header+$_t_CRLF; 1)
			$_t_Header:=""
			//  $_t_Message:=$_t_Message+$_t_CRLF+$_t_CRLF
			$_t_Message:=Replace string:C233($_t_Message; $_t_LF; "")  // remove LF
			$_t_Message:=Replace string:C233($_t_Message; $_t_CR; $_t_CRLF)  // convert CR to CR/LF
			$_t_Message:=Replace string:C233($_t_Message; $_t_CRLF+"."; $_t_CRLF+"..")  // convert starting point
			If ($_t_Boundary#"")  // we are sending MIME Multipart
				IWS_SendText($_l_Stream; "--"+$_t_Boundary+$_t_CRLF; 1)  //mark first body part
				IWS_SendText($_l_Stream; "Content-Type: text/plain"+$_t_CRLF+$_t_CRLF; 1)
			End if 
			IWS_SendText($_l_Stream; $_t_Message+$_t_CRLF+$_t_CRLF+$_t_CRLF; 1)  // send message text
			
			$_t_Message:=""  //clear message, we no longer need it
			If ($_t_attachment#"")
				If (Test path name:C476($_t_attachment)=1)
					$_t_AttachmentHeader:="--"+$_t_Boundary+$_t_CRLF
					If ($_t_Encoding="Base64")
						//***** Rollo 28/5/2004 **** Implement HFS Replacement to make attachments work
						$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Type: octet-stream; name="  //+STR_InQuotes (HFSShortName($_t_attachment))+$_t_CRLF
						$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Transfer-Encoding: base64"+$_t_CRLF
						$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Disposition: attachment; filename="  //+STR_InQuotes (HFSShortName ($_t_attachment))+$_t_CRLF+$_t_CRLF
						
						IWS_SendText($_l_Stream; $_t_AttachmentHeader; 0)
						UTI_WinCenter(300; 65; 0)
						GOTO XY:C161(0; 0)
						MESSAGE:C88("Copying document to BLOB"+$_t_CR)
						DOCUMENT TO BLOB:C525($_t_attachment; $_blb_MessageBLOB)
						$_l_BlobSize:=BLOB size:C605($_blb_MessageBLOB)
						$_r_TotalReadBytes:=0
						$_r_BytesSent:=0
						$_l_Error:=0
						$_l_Base64Total:=4/3*$_l_BlobSize  //gives predicted size of Base64 version
						$_l_WholeIteration:=$_l_BlobSize\57
						$_l_offset:=0
						For ($_l_Index; 0; $_l_BlobSize-1; 57)
							$_l_IndexIterations:=$_l_IndexIterations+1
							$_t_Text:=BLOB to text:C555($_blb_MessageBLOB; Mac text without length:K22:10; $_l_offset; 57)
							If ($_l_IndexIterations>$_l_WholeIteration)  //it's on last loop
								//$_t_Base64Text:=ITK_Text2B64 ($_t_Text;0)+"=="+$_t_CRLF)ITK OUT AUgust 2009
							Else 
								//$_t_Base64Text:=ITK_Text2B64 ($_t_Text;0)+$_t_CRLF)ITK OUT AUgust 2009
							End if 
							If ((Length:C16($_t_Base64Text)-2)>76)
								//IWS_SendToLog ("Line longer than 76 characters!")
							End if 
							GOTO XY:C161(0; 1)
							
							$_r_BytesSent:=$_r_BytesSent+Length:C16($_t_Base64Text)
							IWS_SendText($_l_Stream; $_t_Base64Text; 1)
							MESSAGE:C88("Base64-encoded bytes sent = "+String:C10($_r_BytesSent)+" of "+String:C10($_l_Base64Total))
							//  $_t_Base64Text:=""
							// End if
							IDLE:C311
						End for 
						
						
						SET BLOB SIZE:C606($_blb_MessageBLOB; 0)
						CLOSE WINDOW:C154
						If (WIN_bo_TrackerInited)
							$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
							If ($_l_WindowReferenceRow>0)
								WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
							End if 
						End if 
						
					Else 
						If ($_t_attachment#"@.uu")
							$_t_Attachment2:=$_t_attachment+".uu"
							//$_l_Error:=ITK_Mac2uu ($_t_attachment;$_t_Attachment2))ITK OUT AUgust 2009
						End if 
						$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Type: application/uuencode; name="  //+STR_InQuotes (HFSShortName ($_t_Attachment2))+$_t_CRLF
						$_t_AttachmentHeader:=$_t_AttachmentHeader+"Content-Disposition: attachment; filename="  //+STR_InQuotes (HFSShortName ($_t_Attachment2))+$_t_CRLF+$_t_CRLF
						
						IWS_SendText($_l_Stream; $_t_AttachmentHeader; 0)
						//$_l_Error:=ITK_TCPSendFile ($_l_Stream;$_t_Attachment2;0))ITK OUT AUgust 2009
						If ($_t_attachment#"@.uu")
							DELETE DOCUMENT:C159($_t_Attachment2)
						End if 
					End if 
					IWS_SendText($_l_Stream; $_t_CRLF; 0)
				End if   //If (Test path name($_t_attachment)=1)
			End if   //     If ($_t_attachment # "")
			If ($_t_Boundary#"")
				IWS_SendText($_l_Stream; "--"+$_t_Boundary+"--"+$_t_CRLF; 0)  //send final boundary marker
			End if 
			IWS_SendText($_l_Stream; $_t_CRLF+"."+$_t_CRLF)  // end of message
			$_l_Error:=IWS_SMTPAnswer($_l_Stream)
			IWS_SendText($_l_Stream; "QUIT"+$_t_CRLF)  // close SMTP session
			$_l_Error:=IWS_SMTPAnswer($_l_Stream)
			//$_l_Error:=ITK_TCPClose ($_l_Stream)  ` no more data to send)ITK OUT AUgust 2009
			
			$_r_Timeout:=Tickcount:C458+(10*60)
			//While ((ITK_TCPStatus ($_l_Stream)=◊ITK_i_StreamConnected) & (Tickcount<$_r_Timeout))
			//DelayTicks (6)
			//End while   ` stream closed by SMTP host ?
			
		End if 
	End if 
	//Else
	//IWS_t_Error:="Unable to open SMTP connection"
	//End if
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
ERR_MethodTrackerReturn("IWS_SMTPMessage2"; $_t_oldMethodName)