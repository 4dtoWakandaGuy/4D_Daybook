//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_FinishStream
	//------------------ Method Notes ------------------
	//IWS_FinishStream
	//19990609 b5 - Rollo - alternative Log message using above variable + correcting
	//     - Error handling by John
	//19990609 b5 - Rollo - Cancelled check for bytes sent, because of ITK bug
	// b22 Rollo 19990701 - a minor addition to the IWS logging window
	
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(IWS_bo_StreamEnded)
	C_LONGINT:C283(<>IWS_l_CloserChannel; <>IWS_l_RefuseConnections; $_l_Bytes; $_l_Status; IWS_l_MSendPageBuild; IWS_l_MSTaken; IWS_l_RemoteIPAddress; IWS_l_Stream)
	C_TEXT:C284(<>IWS_t_CloserProcess; <>Web_t_ServerHandler; $_t_LogTimeMessage; $_t_oldMethodName; $_t_URL; IWS_t_Direct; IWS_t_DocLogText; IWS_t_HTTPMethod; IWS_t_Message; IWS_t_PageType; IWS_t_Search)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_FinishStream")
//LOG_SetMethod ("IWS_FinishStream")

//IWS_SendToLog ("Finishing stream")

//Dotrace
If (IWS_l_Stream#0)
	If (IWS_t_PageType="Static")
		IWS_l_MSendPageBuild:=0
	End if 
	IWS_RecordSend
	
	$_l_Status:=IWS_StreamStatus(IWS_l_Stream)
	$_l_Bytes:=IWS_BytesSent(IWS_l_Stream)  //bytes sent
	IPC_SendMessage(<>IWS_l_CloserChannel; String:C10(IWS_l_Stream))  // send to closer
	RESUME PROCESS:C320(Process number:C372(<>IWS_t_CloserProcess))
	// Delayticks(0)
	//IWS_l_MSTaken:=Milliseconds-IWS_l_MSStart
	//Now send a message off to the log window
	
	If (True:C214)  //If ($_l_Bytes>=0)  `Rollo 6/9/99 - this was not returning correctly prob >32K
		
		IWS_t_Message:=""
		
		If (IWS_t_DocLogText#"")
			$_t_URL:=IWS_t_DocLogText
		Else 
			
			If (IWS_t_Search#"")  //JM, 12/17/1998 - altered so PING etc. would show OK
				$_t_URL:=Lowercase:C14(IWS_t_Direct+"  ?  "+IWS_t_Search)
			Else 
				$_t_URL:=Lowercase:C14(IWS_t_Direct)
			End if 
			
		End if 
		
		If (<>IWS_l_RefuseConnections=1)
			$_t_URL:=$_t_URL+" [CONNECTION REFUSED]"
		End if 
		
		Case of 
			: (<>Web_t_ServerHandler="ITK")
				//`$_t_LogTimeMessage:=ITK_Secs2RFC (ITK_Date2Secs (Current date;Current time)) ITK OUT
			: (<>Web_t_ServerHandler="NTK")
				$_t_LogTimeMessage:=DATE_DateTimeToRFCString
			Else 
				
		End case 
		
		STR_AddParamsToBlock(->IWS_t_Message; String:C10(IWS_l_RemoteIPAddress); String:C10($_l_Bytes))
		STR_AddParamsToBlock(->IWS_t_Message; String:C10(IWS_l_MSTaken); String:C10(IWS_l_MSendPageBuild))
		STR_AddParamsToBlock(->IWS_t_Message; $_t_LogTimeMessage; $_t_URL)
		STR_AddParamsToBlock(->IWS_t_Message; IWS_t_PageType; IWS_t_HTTPMethod)
		
	Else 
		IWS_t_Message:="ERROR: Stream error (status = "+String:C10($_l_Status)+", bytes = "+String:C10($_l_Bytes)+")"  //Rollo 6/9/99
		IWS_SendToLog(IWS_t_Message)  //added by JDM, 4/21/99
	End if 
	//we need to document these things, even if we are not updating the display
	
	IWS_DocLog(IWS_t_Message)
	
	IWS_t_Message:=""
	
Else 
	IWS_SendToLog("ERROR: Stream ID was 0")
End if 

IWS_bo_StreamEnded:=True:C214
//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_FinishStream"; $_t_oldMethodName)