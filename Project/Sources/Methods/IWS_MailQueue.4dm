//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_MailQueue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY PICTURE(<>IWS_apic_MailQueue;0)
	C_BLOB:C604($_blb_mailBLOB)
	C_BOOLEAN:C305(<>IWS_bo_Shutdown)
	C_LONGINT:C283($_l_Error; $_l_offset; $_l_Platform; $_l_Stream)
	C_PICTURE:C286($_pic_Picture)
	C_REAL:C285($_r_Timeout)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; $_t_Addressee; $_t_Attachment; $_t_Boundary; $_t_CR; $_t_CRLF; $_t_Encoding; $_t_Header; $_t_LF; $_t_LocalAddress)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; $_t_SMTPHost; $_t_Subject; $1; IWS_t_Error)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_MailQueue")
//Method: IWS_MailQueue
//
//Purpose: Sends SMTP messages created by IWS_SMTPMessage2




IWS_StartProcess



$_t_CR:=<>STR_t_CR
$_t_LF:=<>STR_t_LF
$_t_CRLF:=$_t_CR+$_t_LF
$_t_SMTPHost:=$1
While (Not:C34(<>IWS_bo_Shutdown))
	IWS_t_Error:=""
	While (Size of array:C274(<>IWS_apic_MailQueue)>0)
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
				
				While (Semaphore:C143("$MailQueue"))
					IDLE:C311
				End while 
				//take the first item off the list  (semaphore ensures size can't change)
				$_pic_Picture:=<>IWS_apic_MailQueue{1}
				CLEAR SEMAPHORE:C144("$MailQueue")
				//$_blb_mailBLOB:=B2P_PictToBlob2 ($_pic_Picture)  `Rollo 4/9/2000 - method doesn't work!
				
				//$_blb_mailBLOB:=ITK_Pict2Blob ($_pic_Picture)
				//$_blb_mailBLOB:=PictureToBLOB ($_pic_Picture)  //replaced  ITK_Pict2Blob 14/03/08
				
				
				$_pic_Picture:=$_pic_Picture*0
				$_l_offset:=0
				BLOB TO VARIABLE:C533($_blb_mailBLOB; $_t_LocalAddress; $_l_offset)
				BLOB TO VARIABLE:C533($_blb_mailBLOB; $_t_Addressee; $_l_offset)
				BLOB TO VARIABLE:C533($_blb_mailBLOB; $_t_Subject; $_l_offset)
				BLOB TO VARIABLE:C533($_blb_mailBLOB; $_t_Message; $_l_offset)
				BLOB TO VARIABLE:C533($_blb_mailBLOB; $_t_Attachment; $_l_offset)
				BLOB TO VARIABLE:C533($_blb_mailBLOB; $_t_Encoding; $_l_offset)
				SET BLOB SIZE:C606($_blb_mailBLOB; 0)
				//IWS_SendToLog ($_t_SMTPHost+", "+$_t_LocalAddress+", "+
				//$_t_Addressee+", "+$_t_Subject+", "+
				//$_t_Message+", "+$_t_Attachment+", "+$_t_Encoding)
				//we now have all the bits and pieces we need to send a message on the existing co
				IWS_t_Error:=""
				//$_l_Error:=IWS_SMTPExchange ($_l_Stream;"HELO "+ITK_Addr2Name (ITK_Name2Addr (""))))ITK OUT AUgust 2009
				If ($_l_Error=0)
					$_l_Error:=IWS_SMTPExchange($_l_Stream; "MAIL FROM:<"+$_t_LocalAddress+">")
					If ($_l_Error=0)  // still ok ?
						$_l_Error:=IWS_SMTPExchange($_l_Stream; "RCPT TO:<"+$_t_Addressee+">")  // recipient email
						If ($_l_Error=0)
							$_l_Error:=IWS_SMTPExchange($_l_Stream; "DATA")  // send message
							If ($_l_Error=0)
								$_t_Header:=""
								If ($_t_Attachment#"")  //if there is an attachment
									$_t_Boundary:="====="+String:C10(0)+"=="
									$_t_Header:=$_t_Header+"Mime-Version: 1.0"+$_t_CRLF
									$_t_Header:=$_t_Header+"Content-Type: multipart/mixed; boundary="+STR_InQuotes($_t_Boundary)+$_t_CRLF
								Else 
									$_t_Boundary:=""
								End if 
								//$_t_Header:=$_t_Header+"Date: "+ITK_Secs2RFC (ITK_Date2Secs (Current date;Current time;1))+$_t_CRLF)ITK OUT AUgust 2009
								$_t_Header:=$_t_Header+"Subject: "+$_t_Subject+$_t_CRLF
								$_t_Header:=$_t_Header+"From: "+$_t_LocalAddress+$_t_CRLF
								$_t_Header:=$_t_Header+"To: "+$_t_Addressee+$_t_CRLF
								//$_l_Error:=ITK_TCPSend ($_l_Stream;$_t_Header+$_t_CRLF;1))ITK OUT AUgust 2009
								$_t_Header:=""
								$_t_Message:=Replace string:C233($_t_Message; $_t_LF; "")  // remove LF
								If (Is macOS:C1572)
									$_t_Message:=Replace string:C233($_t_Message; $_t_CR; $_t_CRLF)  // convert CR to CR/LF
								End if 
								$_t_Message:=Replace string:C233($_t_Message; $_t_CRLF+"."; $_t_CRLF+"..")  // convert starting point
								If ($_t_Boundary#"")  // we are sending MIME Multipart
									//$Bytes:=ITK_TCPSend ($_l_Stream;"--"+$_t_Boundary+$_t_CRLF;1)  `mark first body part)ITK OUT AUgust 2009
									//$Bytes:=ITK_TCPSend ($_l_Stream;"Content-Type: text/plain"+$_t_CRLF+$_t_CRLF;1))ITK OUT AUgust 2009
								End if 
								//$Bytes:=ITK_TCPSend ($_l_Stream;$_t_Message+$_t_CRLF+$_t_CRLF+$_t_CRLF;1)  ` send message text)ITK OUT AUgust 2009
								$_t_Message:=""  //clear message, we no longer need it
								If ($_t_Attachment#"")
									IWS_MailAttachment($_l_Stream; $_t_Attachment; $_t_Encoding)
								End if   //     If ($_t_Attachment # "")
								If ($_t_Boundary#"")
									//$Bytes:=ITK_TCPSend ($_l_Stream;"--"+$_t_Boundary+"--"+$_t_CRLF;0)  `send final boundary marker)ITK OUT AUgust 2009
								End if 
								$_l_Error:=IWS_SMTPExchange($_l_Stream; "."; 1)  // end of message
							End if 
							//Now we close the connection again
							$_l_Error:=IWS_SMTPExchange($_l_Stream; "QUIT")  // close SMTP session
							//$_l_Error:=ITK_TCPClose ($_l_Stream)  ` no more data to send)ITK OUT AUgust 2009
							//While (ITK_TCPStatus ($_l_Stream)=◊ITK_i_StreamConnected))ITK OUT AUgust 2009
							//DelayTicks (6))ITK OUT AUgust 2009
							//End while   ` stream closed by SMTP host ?)ITK OUT AUgust 2009
						End if 
					End if 
				End if 
			End if   // wait SMTP server login answer
			//End if   `ITK_TCPStatus ($_l_Stream))ITK OUT AUgust 2009
			//$_l_Error:=ITK_TCPRelease ($_l_Stream))ITK OUT AUgust 2009
		End if   //open
		If (IWS_t_Error#"")
			IWS_SendToLog(IWS_t_Error)
		End if 
		While (Semaphore:C143("$MailQueue"))
			IDLE:C311
		End while 
		DELETE FROM ARRAY:C228(<>IWS_apic_MailQueue; 1; 1)
		CLEAR SEMAPHORE:C144("$MailQueue")
		IDLE:C311
	End while   //size of array
	If (Size of array:C274(<>IWS_apic_MailQueue)=0)
		PAUSE PROCESS:C319(Current process:C322)
	Else 
		IDLE:C311
	End if 
End while 
ERR_MethodTrackerReturn("IWS_MailQueue"; $_t_oldMethodName)