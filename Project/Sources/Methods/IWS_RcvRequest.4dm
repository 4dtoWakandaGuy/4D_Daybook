//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_RcvRequest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(IWS_blb_PostDataBLOB)
	C_BOOLEAN:C305(<>IWS_bo_Shutdown; <>LOG_bo_IOLogging; <>SYS_bo_NewVRSPostDataMethod; $_bo_AllPostDataReceived; $_bo_FileUpload; $_bo_RequestHeadersReceived; IWS_bo_UploadToDisk; IWS_bo_ValidIP)
	C_LONGINT:C283(<>IED_l_StatusFailure; <>IWS_l_RcvDelay; <>IWS_l_RcvTimeout; <>IWS_l_StatusNull; <>IWS_l_StatusSuccess; <>LOG_l_IOLoggingNo; $_l_CRLF2Pos; $_l_ReceiveDelay; $_l_Status; $_l_StreamError; $0)
	C_LONGINT:C283(IWS_l_ContentLength; IWS_l_Stream)
	C_REAL:C285($_r_Bytes; $_r_PostBytesReceived; $_r_Timeout)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; <>Web_t_ServerHandler; $_t_ContenctType; $_t_CRLF; $_t_DocumentName; $_t_DoubleCRLF; $_t_oldMethodName; $_t_PostBuffer; $_t_PostData; $_t_TextReceived)
	C_TEXT:C284(IWS_t_ContentType; IWS_t_Error; IWS_t_Extension; IWS_t_HTTPMethod; IWS_t_Request; IWS_t_UploadDocName)
	C_TIME:C306($_ti_DocumentRef; $_ti_ReceiveDocRef; IWS_ti_UploadDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_RcvRequest")
//LOG_SetMethod ("IWS_RcvRequest")

//******************************************************************************
//
//Method: IWS_RcvRequest
//
//Written by  John Moore on 10/30/98
//Thoroughly revised by John 7/18/2000, to reduce duplicate code and clarify logic
//
//Purpose: Receives request
//
//******************************************************************************



$_t_CRLF:=<>STR_t_CR+<>STR_t_LF
$_t_DoubleCRLF:=$_t_CRLF*2

$_t_TextReceived:=""
$_r_Timeout:=Tickcount:C458+<>IWS_l_RcvTimeout
$_l_Status:=<>IWS_l_StatusNull
IWS_t_Error:=""
$_l_StreamError:=0
//Rollo 5/25/99
If (<>LOG_bo_IOLogging)
	<>LOG_l_IOLoggingNo:=<>LOG_l_IOLoggingNo+1
	$_ti_DocumentRef:=DB_CreateDocument(STR_LeadZeros(String:C10(<>LOG_l_IOLoggingNo); 5)+"_inp.txt")
End if 
$_bo_RequestHeadersReceived:=False:C215
$_r_PostBytesReceived:=0
$_bo_FileUpload:=False:C215
$_t_ContenctType:=""
$_bo_AllPostDataReceived:=False:C215
UTI_BlobClear(->IWS_blb_PostDataBLOB)
$_t_PostData:=""
//Switched from testing $_t_PostBuffer to testing $_r_Bytes (return value) by John, 7/18/00
//Gives more useful information (such as stream error)



Case of 
	: (<>Web_t_ServerHandler="ITK")
		Repeat 
			//$_r_Bytes:=ITK_TCPRcv (IWS_l_Stream;$_t_PostBuffer))ITK OUT AUgust 2009
			
			Case of 
				: (<>IWS_bo_Shutdown)
					$_l_Status:=<>IED_l_StatusFailure
					IWS_t_Error:="ERROR: Server was shutting down"
					
				: ($_r_Bytes<0)  //a stream error, we should clear out
					$_l_Status:=<>IED_l_StatusFailure
					IWS_t_Error:="ERROR: Stream error waiting for data - ITK_TCPRcv returned "+String:C10($_r_Bytes)+", stream status was "+String:C10(IWS_StreamStatus(IWS_l_Stream))
					
				: ($_r_Bytes=0)  //no errors but no data either? Do nothing this time other than check for timeout.
					If (Tickcount:C458>$_r_Timeout)
						$_l_Status:=<>IED_l_StatusFailure
						IWS_t_Error:="ERROR: Timed out in IWS_RcvRequest waiting for data!"
					Else 
						$_l_Status:=<>IWS_l_StatusNull
					End if 
				Else 
					//we've obviously received something
					//so reset the timeout
					$_r_Timeout:=Tickcount:C458+<>IWS_l_RcvTimeout
					//Rollo 5/25/99
					If (<>LOG_bo_IOLogging)
						SEND PACKET:C103($_ti_DocumentRef; $_t_PostBuffer)
					End if 
					//Now what we do is dependent on whether or not we've already
					//received the header section and have moved on to the post data
					If (Not:C34($_bo_RequestHeadersReceived))
						//add what has been received to our big buffer
						$_t_TextReceived:=$_t_TextReceived+$_t_PostBuffer
						//we haven't dealt with the header section yet
						$_l_CRLF2Pos:=Position:C15($_t_DoubleCRLF; $_t_TextReceived)
						If ($_l_CRLF2Pos>0)  //we've received the entire request
							If (Current user:C182="John")
								$_ti_ReceiveDocRef:=DB_CreateDocument("TextReceived")
								SEND PACKET:C103($_ti_ReceiveDocRef; $_t_TextReceived)
								CLOSE DOCUMENT:C267($_ti_ReceiveDocRef)
							End if 
							$_bo_RequestHeadersReceived:=True:C214
							IWS_t_Request:=Substring:C12($_t_TextReceived; 1; $_l_CRLF2Pos+3)
							IWS_ParseRequest
							$_bo_FileUpload:=(IWS_t_Extension="upload")
							If (Not:C34(IWS_bo_ValidIP))
								IWS_t_Error:="Invalid user IP"
								$_l_Status:=<>IED_l_StatusFailure
							Else 
								If (IWS_t_HTTPMethod="POST")  // if it's a POST, then there will be some extra message body data
									$_l_Status:=<>IWS_l_StatusNull
									//We need to calculate when we have received all the data.
									//We use message length as given in the Content-Length field
									If (IWS_l_ContentLength=-1)
										$_l_Status:=<>IED_l_StatusFailure
										IWS_t_Error:="No content length header received in POST request"
									Else 
										//first get what was left over after the header
										$_t_PostBuffer:=Substring:C12($_t_TextReceived; $_l_CRLF2Pos+4)
										If (Length:C16($_t_PostBuffer)<IWS_l_ContentLength)  //we've not received all yet
											$_l_Status:=<>IWS_l_StatusNull
										Else 
											//we've got all of the POST data as well
											$_l_Status:=<>IWS_l_StatusSuccess
										End if 
										If (IWS_t_ContentType="multipart/form-data")
											IWS_bo_UploadToDisk:=True:C214
											$_t_DocumentName:="Upload-"+String:C10(SYS_Sequence)
											IWS_ti_UploadDoc:=DB_CreateDocument($_t_DocumentName)
											IWS_t_UploadDocName:=Document  //to get around the idiot addition of suffixes which 4D likes to do
										Else 
											IWS_bo_UploadToDisk:=False:C215
											IWS_t_UploadDocName:=""
											IWS_ti_UploadDoc:=?00:00:00?
										End if 
									End if   //  IWS_l_ContentLength
									
								Else 
									$_l_Status:=<>IWS_l_StatusSuccess
								End if 
							End if   //If (Not(IWS_bo_ValidIP))
						Else 
							//we've not received the entire request yet, so carry on
							$_l_Status:=<>IWS_l_StatusNull
						End if   // If($_l_CRLF2Pos>0)
					End if   // Not($_bo_RequestHeadersReceived)
					
					If ($_bo_RequestHeadersReceived)  //test again, this may have just been reset
						//We've received all the request header information already
						//Now we're dealing with the POST data
						If (IWS_t_HTTPMethod="POST")
							$_r_PostBytesReceived:=$_r_PostBytesReceived+Length:C16($_t_PostBuffer)
							If ($_r_PostBytesReceived>=IWS_l_ContentLength)
								//we've received all we're going to
								$_bo_AllPostDataReceived:=True:C214
								$_l_Status:=<>IWS_l_StatusSuccess
							Else 
								$_bo_AllPostDataReceived:=False:C215
								$_l_Status:=<>IWS_l_StatusNull
							End if   // If ($_r_PostBytesReceived>=IWS_l_ContentLength)
							//now write what we have just received in our buffer
							If (IWS_bo_UploadToDisk)
								//we're using a large text buffer to write to before sending to disk
								If ((Length:C16($_t_PostData)+Length:C16($_t_PostBuffer))>MAXTEXTLENBEFOREV11:K35:3)
									//if adding the received packet would take it over the 32000 byte limit,
									//flush to disk and reset the buffer to ""
									SEND PACKET:C103(IWS_ti_UploadDoc; $_t_PostData)
									$_t_PostData:=""
								End if   // If ((Length($_t_PostData)+Length($_t_PostBuffer))>MAXTEXTLEN )
								$_t_PostData:=$_t_PostData+$_t_PostBuffer
								If ($_bo_AllPostDataReceived)
									SEND PACKET:C103(IWS_ti_UploadDoc; $_t_PostData)
									CLOSE DOCUMENT:C267(IWS_ti_UploadDoc)
								End if 
							Else 
								TEXT TO BLOB:C554($_t_PostBuffer; IWS_blb_PostDataBLOB; Mac text without length:K22:10; *)
							End if   //If(IWS_bo_UploadToDisk)
						Else 
							$_l_Status:=<>IED_l_StatusFailure
							IWS_t_Error:="Extraneous data received - not POST"
						End if   // If (IWS_t_HTTPMethod="POST")
					End if   //If ($_bo_RequestHeadersReceived)
			End case 
			If ($_l_Status=<>IWS_l_StatusNull)
				
				If (<>IWS_l_RcvDelay>0)
					DelayTicks(<>IWS_l_RcvDelay)  //we don't want to use up all CPU while waiting
				End if 
			End if   //If ($_l_Status=◊i_STATUS_NULL )
			IDLE:C311
			
		Until ($_l_Status#<>IWS_l_StatusNull)
		
		If ($_l_Status=<>IWS_l_StatusSuccess)
			If ((IWS_t_HTTPMethod="POST") & ((<>SYS_bo_NewVRSPostDataMethod=False:C215) | (IWS_t_Direct#"VRSRequest@")))
				IWS_ParsePostData
			End if   //If (IWS_t_HTTPMethod="POST")
		Else 
			If (IWS_t_Error#"")
				IWS_SendToLog(IWS_t_Error)
			Else 
				IWS_SendToLog("Receive request failed, cause unknown")
			End if 
		End if   //If ($_l_Status=◊i_STATUS_SUCCESS )
		//Rollo 5/25/99
		If (<>LOG_bo_IOLogging)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
		End if 
		
		
	: (<>Web_t_ServerHandler="NTK")
		$_l_ReceiveDelay:=<>IWS_l_RcvDelay
		
		Repeat 
			$_r_Bytes:=TCP Receive(IWS_l_Stream; $_t_PostBuffer)
			Case of 
				: (<>IWS_bo_Shutdown)
					$_l_Status:=<>IED_l_StatusFailure
					IWS_t_Error:="ERROR: Server was shutting down"
					
				: ($_r_Bytes=0)  //Remote end closed connection (which is not really an error, just a change of state)
					$_l_Status:=<>IED_l_StatusFailure
					IWS_t_Error:="NOTICE: Remote end closed connection"
					
				: ($_r_Bytes=-1)  //no errors but no data either? Do nothing this time other than check for timeout.
					If (Tickcount:C458>$_r_Timeout)
						$_l_Status:=<>IED_l_StatusFailure
						IWS_t_Error:="ERROR: Timed out in IWS_RcvRequest waiting for data!"
					Else 
						$_l_Status:=<>IWS_l_StatusNull
					End if 
					
				Else 
					//we've obviously received something
					//so reset the timeout
					$_r_Timeout:=Tickcount:C458+<>IWS_l_RcvTimeout
					//Rollo 5/25/99
					If (<>LOG_bo_IOLogging)
						SEND PACKET:C103($_ti_DocumentRef; $_t_PostBuffer)
					End if 
					//Now what we do is dependent on whether or not we've already
					//received the header section and have moved on to the post data
					If (Not:C34($_bo_RequestHeadersReceived))
						//add what has been received to our big buffer
						$_t_TextReceived:=$_t_TextReceived+$_t_PostBuffer
						//we haven't dealt with the header section yet
						$_l_CRLF2Pos:=Position:C15($_t_DoubleCRLF; $_t_TextReceived)
						If ($_l_CRLF2Pos>0)  //we've received the entire request
							$_bo_RequestHeadersReceived:=True:C214
							IWS_t_Request:=Substring:C12($_t_TextReceived; 1; $_l_CRLF2Pos+3)
							IWS_ParseRequest
							$_bo_FileUpload:=(IWS_t_Extension="upload")
							If (Not:C34(IWS_bo_ValidIP))
								IWS_t_Error:="Invalid user IP"
								$_l_Status:=<>IED_l_StatusFailure
							Else 
								If (IWS_t_HTTPMethod="POST")  // if it's a POST, then there will be some extra message body data
									$_l_Status:=<>IWS_l_StatusNull
									//We need to calculate when we have received all the data.
									//We use message length as given in the Content-Length field
									If (IWS_l_ContentLength=-1)
										$_l_Status:=<>IED_l_StatusFailure
										IWS_t_Error:="No content length header received in POST request"
									Else 
										//first get what was left over after the header
										$_t_PostBuffer:=Substring:C12($_t_TextReceived; $_l_CRLF2Pos+4)
										If (Length:C16($_t_PostBuffer)<IWS_l_ContentLength)  //we've not received all yet
											$_l_Status:=<>IWS_l_StatusNull
										Else 
											//we've got all of the POST data as well
											$_l_Status:=<>IWS_l_StatusSuccess
										End if 
										If (IWS_t_ContentType="multipart/form-data")
											IWS_bo_UploadToDisk:=True:C214
											$_t_DocumentName:="Upload-"+String:C10(SYS_Sequence)
											IWS_ti_UploadDoc:=DB_CreateDocument($_t_DocumentName)
											IWS_t_UploadDocName:=Document  //to get around the idiot addition of suffixes which 4D likes to do
										Else 
											IWS_bo_UploadToDisk:=False:C215
											IWS_t_UploadDocName:=""
											IWS_ti_UploadDoc:=?00:00:00?
										End if 
									End if   //  IWS_l_ContentLength
									
								Else 
									$_l_Status:=<>IWS_l_StatusSuccess
								End if 
							End if   //If (Not(IWS_bo_ValidIP))
						Else 
							If ((Length:C16($_t_TextReceived)>32000) | (Tickcount:C458>$_r_Timeout))
								IWS_t_Error:="Headerless request"
								$_l_Status:=<>IED_l_StatusFailure
							Else 
								//we've not received the entire request yet, so carry on
								$_l_Status:=<>IWS_l_StatusNull
							End if 
						End if   // If($_l_CRLF2Pos>0)
					End if   // Not($_bo_RequestHeadersReceived)
					
					If ($_bo_RequestHeadersReceived)  //test again, this may have just been reset
						//We've received all the request header information already
						//Now we're dealing with the POST data
						If (IWS_t_HTTPMethod="POST")
							$_r_PostBytesReceived:=$_r_PostBytesReceived+Length:C16($_t_PostBuffer)
							If ($_r_PostBytesReceived>=IWS_l_ContentLength)
								//we've received all we're going to
								$_bo_AllPostDataReceived:=True:C214
								$_l_Status:=<>IWS_l_StatusSuccess
							Else 
								$_bo_AllPostDataReceived:=False:C215
								$_l_Status:=<>IWS_l_StatusNull
							End if   // If ($_r_PostBytesReceived>=IWS_l_ContentLength)
							//now write what we have just received in our buffer
							If (IWS_bo_UploadToDisk)
								//we're using a large text buffer to write to before sending to disk
								If ((Length:C16($_t_PostData)+Length:C16($_t_PostBuffer))>MAXTEXTLENBEFOREV11:K35:3)
									//if adding the received packet would take it over the 32000 byte limit,
									//flush to disk and reset the buffer to ""
									SEND PACKET:C103(IWS_ti_UploadDoc; $_t_PostData)
									$_t_PostData:=""
								End if   // If ((Length($_t_PostData)+Length($_t_PostBuffer))>MAXTEXTLEN )
								$_t_PostData:=$_t_PostData+$_t_PostBuffer
								If ($_bo_AllPostDataReceived)
									SEND PACKET:C103(IWS_ti_UploadDoc; $_t_PostData)
									CLOSE DOCUMENT:C267(IWS_ti_UploadDoc)
								End if 
							Else 
								TEXT TO BLOB:C554($_t_PostBuffer; IWS_blb_PostDataBLOB; Mac text without length:K22:10; *)  //v11 Mac text without length
							End if   //If(IWS_bo_UploadToDisk)
						Else 
							//$_l_Status:=◊i_STATUS_FAILURE
							//IWS_t_Error:="Extraneous data received - not POST"
						End if   // If (IWS_t_HTTPMethod="POST")
					End if   //If ($_bo_RequestHeadersReceived)
			End case 
			
			If ($_l_Status=<>IWS_l_StatusNull)
				If ($_l_ReceiveDelay>0)
					DELAY PROCESS:C323(Current process:C322; $_l_ReceiveDelay)  //we don't want to use up all CPU while waiting
				End if 
				Case of 
					: ($_l_ReceiveDelay=0)
						$_l_ReceiveDelay:=1
					: ($_l_ReceiveDelay>=16)  //don't go higher than quarter of a second
					Else 
						$_l_ReceiveDelay:=$_l_ReceiveDelay*2
				End case 
			End if   //If ($_l_Status=◊i_STATUS_NULL )
			IDLE:C311
			
		Until ($_l_Status#<>IWS_l_StatusNull)
		
		If ($_l_Status=<>IWS_l_StatusSuccess)
			If ((IWS_t_HTTPMethod="POST") & ((<>SYS_bo_NewVRSPostDataMethod=False:C215) | (IWS_t_Direct#"VRSRequest@")))
				IWS_ParsePostData
			End if   //If (IWS_t_HTTPMethod="POST")
		Else 
			If (IWS_t_Error#"")
				IWS_SendToLog(IWS_t_Error)
			Else 
				IWS_SendToLog("Receive request failed, cause unknown")
			End if 
		End if   //If ($_l_Status=◊i_STATUS_SUCCESS )
		//Rollo 5/25/99
		If (<>LOG_bo_IOLogging)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
		End if 
		
	Else 
		
End case 


$0:=$_l_Status

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_RcvRequest"; $_t_oldMethodName)