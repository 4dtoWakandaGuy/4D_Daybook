//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME Flush
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
	//C_UNKNOWN(TCP Send Blob)
	C_BLOB:C604(IME_blb_Result)
	C_BOOLEAN:C305(<>LOG_bo_IOLogging; <>SYS_bo_MACOptimize; IME_bo_FlushAllowed; IME_bo_Flushed; IWS_bo_ResponseHeaderSent; <>IME_bo_Debug; <>LOG_bo_IOLogging; <>SYS_bo_MACOptimize; IME_bo_FlushAllowed; IME_bo_Flushed; IWS_bo_ResponseHeaderSent)
	C_LONGINT:C283(<>LOG_l_IOLoggingNo; $_l_BlobSize; $_l_BytesSend; $_l_LastCall; $_l_offset; $1; IWS_l_Stream; <>IWS_l_PagesServed; <>LOG_l_IOLoggingNo; $_l_BlobSize; $_l_BytesSend)
	C_LONGINT:C283($_l_LastCall; $_l_offset; $1; IWS_l_Stream)
	C_REAL:C285(<>IWS_r_BytesServed)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; IME_t_ImageLocation; IWS_t_Error; IWS_t_ResponseHeader; <>Web_t_ServerHandler; $_t_Message; $_t_oldMethodName; IME_t_ImageLocation; IWS_t_Error; IWS_t_ResponseHeader)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("IME Flush")

//IME Flush

Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		If (Count parameters:C259>0)
			// Screwed up by PB 22/04/02
			$_t_Message:="Unimplemented feature. Please contact the programmer "
			$_t_Message:=$_t_Message+"and quote ref. no. 666."
			//  ALERT($_t_Message)
			Gen_Alert($_t_Message)
			
			//  If ($1=1)
			//  NL_FlushReply (viReqID;1)
			//  Else
			//  NL_FlushReply (viReqID;0)
			// End if
			//Else
			//NL_FlushReply (viReqID;0)
		End if 
		
		
	: (<>Web_t_ServerHandler="NTK")
		//C_TEXT($WebServer)
		
		If ((IME_bo_FlushAllowed) & (IME_bo_Flushed=False:C215))
			
			//IWS_GetMIME   ` get mime type
			//IWS_DocHeader (200;IWS_t_MIME)  ` send HTTP header
			
			If (IWS_t_ResponseHeader="")
				IWS_SetResponseHeader(200)  //just in case
			End if 
			
			
			If (Count parameters:C259=1)
				$_l_LastCall:=$1  //1 = end the whole page, 0 = don't end
				If ($_l_LastCall=1)
					IME_bo_Flushed:=True:C214
				End if 
			Else 
				$_l_LastCall:=0
			End if 
			//$WebServer:=SYS_GetWebServer
			
			If ($_l_LastCall=1)
				IWS_SetBuildTime  //record how long page took to build
			End if 
			//Send IWS_DocHeader if not already sent & if required (See IME_ClearHdr)
			
			$_l_BlobSize:=BLOB size:C605(IME_blb_Result)
			//  While (Semaphore("$Monitor Update"))
			
			//   IDLE
			//   End while
			<>IWS_r_BytesServed:=<>IWS_r_BytesServed+$_l_BlobSize
			//  CLEAR SEMAPHORE("$Monitor Update")
			
			//$Ms:=Milliseconds
			
			//Rollo 5/25/99
			If (<>LOG_bo_IOLogging)
				<>LOG_l_IOLoggingNo:=<>LOG_l_IOLoggingNo+1
				$_ti_DocumentRef:=DB_CreateDocument(STR_LeadZeros(String:C10(<>LOG_l_IOLoggingNo); 5)+"_out.txt")
			End if 
			
			//Ron 9/14/99
			If (<>LOG_bo_IOLogging)
				SEND PACKET:C103($_ti_DocumentRef; IWS_t_ResponseHeader)
			End if 
			
			//John, 10/13/99 - replaced Rollo's multiple Replace Strings
			//with new UTI_ReplaceInBlob routine
			If (<>SYS_bo_MACOptimize)
				UTI_ReplaceInBlob("___IME_t_ImageLocation___"; IME_t_ImageLocation; ->IME_blb_Result)
				$_l_BlobSize:=BLOB size:C605(IME_blb_Result)
			End if 
			
			IWS_AddToResponseHeader("Content-Length"; String:C10($_l_BlobSize))
			
			//IWS_AddToResponseHeader ("Content-Length";String($_l_BlobSize))  `Rollo 7/9/99
			
			If (Not:C34(IWS_bo_ResponseHeaderSent))
				IWS_SendResponseHeader
			End if 
			
			//John, 2/28/01 - heavily amended to use send blob instead of multiple sends.
			//Has three  benefits. Firstly, reduces the number of calls. Secondly it makes the
			//the process more atomic - the data is either all sent successfully or  single
			// error is returned for the entire send. Thirdly, it reduces the amount of large
			//memory allocations 4D has to make
			
			If (<>IME_bo_Debug)
				$_l_offset:=0
				//GEN_TextExpand("IME_Flush: Data sent (up to 32000 bytes) = "
				//+BLOB to text(IME_blb_Result;Text without length ;$_l_offset;32000))
			End if 
			
			$_l_BytesSend:=TCP Send Blob(IWS_l_Stream; IME_blb_Result)
			
			If (($_l_BytesSend=0) & (BLOB size:C605(IME_blb_Result)>0))
				//There was an error which needs reporting
				IWS_t_Error:="Error sending blob with TCP Send Blob"
			Else 
				If (<>LOG_bo_IOLogging)
					//Now send all the data within the blob, 32000 bytes at a time
					$_l_offset:=0
					While ($_l_offset<$_l_BlobSize)  //$_l_offset will be incremented each time
						SEND PACKET:C103($_ti_DocumentRef; BLOB to text:C555(IME_blb_Result; Mac text without length:K22:10; $_l_offset; 32000))  //v11 becomes Mac text without length
						IDLE:C311
					End while 
				End if 
			End if 
			UTI_BlobClear(->IME_blb_Result)
			
			//Rollo 5/25/99
			If (<>LOG_bo_IOLogging)
				Close_DocUMENT($_ti_DocumentRef)
			End if 
			
			//   IWS_SendToLog ("Sent "+String($_l_BlobSize)+" bytes to "+IME_t_ClientPlatform+" b
			//~rowser, took "+String(Milliseconds-$ms)+" ms")
			//  IME_t_ResultFlush:=""
			If ($_l_LastCall=1)
				
				//   While (Semaphore("$Monitor Update"))
				//    IDLE
				//   End while
				<>IWS_l_PagesServed:=<>IWS_l_PagesServed+1
				//   CLEAR SEMAPHORE("$Monitor Update")
				IWS_FinishStream
			End if 
		End if 
		
		
		//LOG_ResetMethod
		
	Else 
		
End case 
ERR_MethodTrackerReturn("IME Flush"; $_t_oldMethodName)
