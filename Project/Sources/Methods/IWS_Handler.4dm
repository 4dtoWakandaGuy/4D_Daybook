//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_Handler
	//------------------ Method Notes ------------------
	//Method: IWS_Handler
	//
	//Written by  John Moore on 10/24/98
	//
	//Purpose: Actually handles the streams handed to it by the IWS master
	//
	//Runs in global process , not local process, as needs to
	//access data. Performance on standalone machines should be
	//identical
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:50
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(TCP Connection Established)
	C_BLOB:C604(IWS_blb_PostDataBLOB)
	C_BOOLEAN:C305(<>IWS_bo_Shutdown; <>IWS_bo_ViaProxy; $_bo_CachesCleared; $_bo_FirstCall; $_bo_ProcessVisible; IWS_bo_Forwarded; IWS_bo_HandlerWaiting; IWS_bo_IncompleteURL; IWS_bo_StreamEnded; IWS_bo_ValidIP)
	C_LONGINT:C283(<>ITK_l_StreamConnected; <>IWS_l_CheckerChannel; <>IWS_l_HandlerOffset; <>IWS_l_MasterChannel; <>IWS_l_RefuseConnections; <>IWS_l_StatusSuccess; $_l_IWPMasterProcessNum; $_l_ProcessState; $_l_ProcessTime; $_l_Status; $_l_TCPStatus)
	C_LONGINT:C283($1; IWS_l_HandlerChannel; IWS_l_LocalPort; IWS_l_RemoteIPAddress; IWS_l_RemotePort; IWS_l_Stream)
	C_TEXT:C284(<>IWS_t_MasterProcess; <>STR_s_TAB; <>Web_t_ServerHandler; $_t_ForwardedFor; $_t_IPAddress; $_t_IWSProcessName; $_t_Message; $_t_oldMethodName; IWS_t_Direct; IWS_t_DocLogText; IWS_t_ErrorHTML)
	C_TEXT:C284(IWS_t_Filename; IWS_t_HTTPMethod; IWS_t_PageType; IWS_t_ProxyIPAddress; IWS_t_RemoteIPAddress; IWS_t_Request)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_Handler")

Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		IWS_StartProcess
		Start_Process
		
		MESSAGES OFF:C175
		
		//ON ERR CALL("MAC_ErrorEvent")  `**** Rollo 12/14/98: called here to avoid repeat
		
		
		
		$_bo_FirstCall:=True:C214
		
		$_l_IWPMasterProcessNum:=Process number:C372(<>IWS_t_MasterProcess)
		
		PROCESS PROPERTIES:C336(Current process:C322; $_t_IWSProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
		IWS_l_HandlerChannel:=Current process:C322+<>IWS_l_HandlerOffset  // create channel number
		IPC_ClearMessageQueue(IWS_l_HandlerChannel)  //clear any existing messages in queue
		
		If (Not:C34(<>IWS_bo_Shutdown))
			Repeat 
				
				If (IPC_MessagesInQueue(IWS_l_HandlerChannel)=0)  // Axel 2/27/2001
					//if there are no more waiting to be dealt with, tell the master we're free
					//and pause ourselves
					//******* old start *********
					IPC_SendMessage(<>IWS_l_MasterChannel; $_t_IWSProcessName)  // report back
					//IWS_bo_HandlerWaiting is used by load informer to determine whether this process
					//is waiting. We cannot just test process state, because there may be other places
					//where the process is paused or delayed
					IWS_bo_HandlerWaiting:=True:C214  //John, 10/10/99
					PAUSE PROCESS:C319(Current process:C322)  //go to sleep until we get an answer
					IWS_bo_HandlerWaiting:=False:C215  //John, 10/10/99
					//******* old end *********
				End if 
				
				IWS_InitRequestVars
				
				If (Not:C34(<>IWS_bo_Shutdown)) & (IPC_MessagesInQueue(IWS_l_HandlerChannel)>0)
					$_bo_CachesCleared:=False:C215
					$_t_Message:=IPC_RcvMessage(IWS_l_HandlerChannel)
					// IWS_SendToLog ("Message (should be) from IWS Master: "+$_t_Message)
					While ($_t_Message="CLEAR CACHES")  //there may have been a message to clear process caches
						If (Not:C34($_bo_CachesCleared))
							// MAC_ClearProcessCaches  `clear out the MAC process caches. May be several messa
							$_bo_CachesCleared:=True:C214
						End if 
						$_t_Message:=IPC_RcvMessage(IWS_l_HandlerChannel)
						IDLE:C311
					End while 
					
					IWS_l_Stream:=Num:C11($_t_Message)  // get IWS_l_Stream
					
					
					
					IWS_t_RemoteIPAddress:=IWS_DottedIPAddress(IWS_l_RemoteIPAddress)  //returns dotted form
					
					IWS_bo_ValidIP:=False:C215  //assume it's a villain until proved otherwise
					//If (Not(<>IWS_bo_ViaProxy))  `19990518 - LNH
					IWS_CheckValidIP
					//End if  `19990518 - LNH
					
					If (<>IWS_bo_ViaProxy)  //Rollo 7/2/99
						IWS_t_ProxyIPAddress:=IWS_t_RemoteIPAddress  //Rollo 7/2/99
					Else   //Rollo 7/2/99
						IWS_t_ProxyIPAddress:=""  //Rollo 7/2/99
					End if   //Rollo 7/2/99
					
					If (IWS_bo_ValidIP) | (<>IWS_bo_ViaProxy)
						//if we're using a proxy server, then all the requests will come from that
						//address. We will have to pick the address up later in the request header.
						
						IWS_ResetMacroVars  //Rollo 10/21/98 - to clear variables, and can't be done in IME_CGISearch
						
						$_l_Status:=IWS_RcvRequest  // get and parse request
						
						If (IWS_bo_ValidIP)
							If (IWS_t_ErrorHTML="")  //only if we actually got the request
								
								//$_l_TCPStatus:=ITK_TCPStatus (IWS_l_Stream) ITK OUT
								If ($_l_TCPStatus=<>ITK_l_StreamConnected)
									//Rollo 9/24/99 (IWS_StreamConnected (IWS_l_Stream))
									
									//IWS_l_MSStart:=Milliseconds
									
									IWS_GetClientDetails  //for use in macros
									
									IWS_bo_StreamEnded:=False:C215
									If (<>IWS_l_RefuseConnections=1)  //set in web log
										IWS_t_Request:=""
										IWS_t_Filename:=""
									End if 
									If (IWS_bo_IncompleteURL)
										IWS_Redirect
									Else 
										IWS_GetMIMEType  // get mime type
										If (IWS_t_PageType="Static")
											IWS_DocSend  // send the file to user
										Else 
											IWS_t_DocLogText:=""  //Rollo 6/9/99
											//IWS_l_MSStartPageBuild:=Milliseconds  //will record time taken to build a dynamic page
											IPC_SendMessage(<>IWS_l_CheckerChannel; "START"+<>STR_s_TAB+String:C10(Current process:C322))
											IME_Main(IWS_l_Stream; IWS_t_Direct)
											IPC_SendMessage(<>IWS_l_CheckerChannel; "FINISH"+<>STR_s_TAB+String:C10(Current process:C322))
											//in case it was resumed by the checker process...
											// CLEAR SEMAPHORE(MAC_s_GetMacroSemaphore)
										End if 
									End if 
								Else 
									IWS_SendToLog("ERROR: Stream lost after getting request (IWS_Handler)"+" - TCPStatus "+String:C10($_l_TCPStatus))
								End if 
							Else 
								IWS_ErrorHTML  //send back error message to browser
							End if   //IWS_t_Request#""
						End if 
					End if   //IWS_ValidIP
					If (Not:C34(IWS_bo_ValidIP))
						IWS_Deny
					End if 
					If (Not:C34(IWS_bo_StreamEnded))  //if it's not already been finished in IME_CGISearch
						IWS_FinishStream
					End if 
				End if   // If (Not(<>IWS_bo_Shutdown)) & (ITK_NbIPCMsg (IWS_l_HandlerChannel)>0)
				IWS_InitRequestVars
				
				$_bo_FirstCall:=False:C215
				
				IDLE:C311
			Until (<>IWS_bo_Shutdown)
		End if   //If (Not(<>IWS_bo_Shutdown))
		
		IPC_ClearMessageQueue(IWS_l_HandlerChannel)
		
		
	: (<>Web_t_ServerHandler="NTK")
		// $1 = Socket of incoming connection
		
		
		IWS_l_Stream:=$1
		
		//ProcessDeclare
		IWS_StartProcess
		Start_Process
		
		MESSAGES OFF:C175
		ON ERR CALL:C155("Error_Macro")
		
		IWS_InitRequestVars
		
		TCP Get Remote Address(IWS_l_Stream; IWS_t_RemoteIPAddress; IWS_l_RemotePort)
		
		//Remote Proxy Server adds this header to show the real IP
		$_t_ForwardedFor:=Substring:C12(IWS_GetHeaderField("X-Forwarded-For"); 1; 79)
		If ($_t_ForwardedFor#"")
			$_t_ForwardedFor:=NTK Get Host By Name($_t_IPAddress)
			If ($_t_ForwardedFor#"")
				//first check the validity of the RPS IP adddress
				IWS_bo_ValidIP:=False:C215  //assume it's a villain until proved otherwise
				IWS_CheckValidIP
				If (IWS_bo_ValidIP)
					IWS_t_RemoteIPAddress:=$_t_ForwardedFor
					IWS_bo_Forwarded:=True:C214
					IWS_bo_ValidIP:=False:C215  //assume it's a villain until proved otherwise
					IWS_CheckValidIP
				End if 
			Else 
				IWS_bo_ValidIP:=False:C215  //assume it's a villain until proved otherwise
				IWS_bo_Forwarded:=False:C215
				IWS_CheckValidIP
			End if 
		Else 
			IWS_bo_ValidIP:=False:C215  //assume it's a villain until proved otherwise
			IWS_bo_Forwarded:=False:C215
			IWS_CheckValidIP
		End if 
		
		If (<>IWS_bo_ViaProxy)  //Rollo 7/2/99
			IWS_t_ProxyIPAddress:=IWS_t_RemoteIPAddress  //Rollo 7/2/99
		Else   //Rollo 7/2/99
			IWS_t_ProxyIPAddress:=""  //Rollo 7/2/99
		End if   //Rollo 7/2/99
		
		If (IWS_bo_ValidIP) | (<>IWS_bo_ViaProxy)
			//if we're using a proxy server, then all the requests will come from that
			//address. We will have to pick the address up later in the request header.
			
			IWS_ResetMacroVars  //Rollo 10/21/98 - to clear variables, and can't be done in IME_CGISearch
			
			$_l_Status:=IWS_RcvRequest  // get and parse request
			
			If ((IWS_bo_ValidIP) & ($_l_Status=<>IWS_l_StatusSuccess))
				
				If (IWS_t_ErrorHTML="")  //only if we actually got the request
					
					$_l_TCPStatus:=TCP Get State(IWS_l_Stream)
					If ($_l_TCPStatus=TCP Connection Established)
						//Rollo 9/24/99 (IWS_StreamConnected (IWS_l_Stream))
						
						//IWS_l_MSStart:=Milliseconds
						
						IWS_GetClientDetails  //for use in macros
						
						If (<>IWS_l_RefuseConnections=1)  //set in web log
							IWS_t_Request:=""
							IWS_t_Filename:=""
						End if 
						
						If (IWS_bo_IncompleteURL)
							IWS_Redirect
						Else 
							IWS_GetMIMEType  // get mime type
							If (IWS_t_PageType="Static")
								IWS_DocSend  // send the file to user
							Else 
								IWS_t_DocLogText:=""  //Rollo 6/9/99
								//IWS_l_MSStartPageBuild:=Milliseconds  //will record time taken to build a dynamic page
								IPC_SendMessage(<>IWS_l_CheckerChannel; "START"+<>STR_s_TAB+String:C10(Current process:C322))
								IME_CGISearch(IWS_l_Stream; IWS_t_Direct)
								IPC_SendMessage(<>IWS_l_CheckerChannel; "FINISH"+<>STR_s_TAB+String:C10(Current process:C322))
								//in case it was resumed by the checker process...
								// CLEAR SEMAPHORE(MAC_s_GetMacroSemaphore)
								
								If (IWS_t_HTTPMethod="POST")
									SET BLOB SIZE:C606(IWS_blb_PostDataBLOB; 0)  //Rollo 12/9/2006 - no longer done in IWS_ParsePostData
								End if 
								
							End if 
							
						End if 
						
					Else 
						
						IWS_SendToLog("ERROR: Stream lost after getting request (IWS_Handler)"+" - TCPStatus "+String:C10($_l_TCPStatus))
						
					End if 
					
				Else 
					
					IWS_ErrorHTML  //send back error message to browser
					
				End if   //IWS_t_Request#""
				
			End if 
			
		End if   //IWS_ValidIP
		
		If (Not:C34(IWS_bo_ValidIP))
			IWS_Deny
		End if 
		
		If (Not:C34(IWS_bo_StreamEnded))  //if it's not already been finished in IME_CGISearch
			IWS_FinishStream
		End if 
		
	Else 
		
		
End case 
ERR_MethodTrackerReturn("IWS_Handler"; $_t_oldMethodName)