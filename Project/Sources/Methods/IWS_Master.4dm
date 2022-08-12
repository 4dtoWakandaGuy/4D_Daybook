//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_Master
	//------------------ Method Notes ------------------
	//Method: IWS_Master
	//
	//Purpose: Listens on HTTP port, and hands out new streams
	//to waiting bank of handler processes
	
	//Rewritten John Moore 12/17/98, to speed up handling
	//Now makes use of all connections for each call of ITK_TCPStatus2A
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IWS_al_Status;0)
	//ARRAY LONGINT(<>IWS_al_Stream;0)
	C_BOOLEAN:C305(<>IWS_bo_ConnectLogging; <>IWS_bo_Shutdown; $_bo_ProcessSelected; $_bo_ServerStarting)
	C_LONGINT:C283(<>ITK_l_StreamConnected; <>IWS_l_EmptyStream; <>IWS_l_HandlerMultiple; <>IWS_l_HandlerOffset; <>IWS_l_Handlers; <>IWS_l_MasterChannel; <>IWS_l_MasterDelay; <>IWS_l_MinHandlers; <>IWS_l_ServerSocket; <>IWS_l_SSLServerSocket; <>IWS_l_StreamConnected)
	C_LONGINT:C283(<>IWS_l_sWebPort; <>IWS_l_WebPort; $_l_CurrentHandlersCount; $_l_HitsWithNoFreeProcess; $_l_Index; $_l_InsertPoint; $_l_IWSHandlerChannel; $_l_IWSHandlerProcessNumber; $_l_IWSProcess; $_l_NewHandlerIndex; $_l_NewHandlersRequired)
	C_LONGINT:C283($_l_NumStream; $_l_ProcessState; $_l_Seconds; $_l_Socket; $_l_SSLSocket; $_l_StreamIndex; $_l_StreamRow; $_l_TotalHits; IWS_l_Count)
	C_REAL:C285(<>IWS_r_NoFreePerc; $_r_LastRequestTicks; $_r_TicksNow)
	C_TEXT:C284(<>IWS_t_CertificateKeyPath; <>IWS_t_HandlerProcess; <>IWS_t_LocalAddress; <>IWS_t_PrivateKeyPassPhrase; <>IWS_t_PrivateKeyPath; <>STR_t_CR; <>Web_t_ServerHandler; $_t_CR; $_t_IWSHandlerProcessName; $_t_Message; $_t_oldMethodName)
	C_TEXT:C284($_t_SSLAttributes)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_Master")




Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		IWS_StartProcess
		Start_Process
		
		
		//C_INTEGER(◊ITK_i_NoStream)
		MESSAGES OFF:C175
		
		
		$_t_CR:=<>STR_t_CR
		IPC_ClearMessageQueue(<>IWS_l_MasterChannel)  //clear any messages in queue
		
		<>IWS_r_NoFreePerc:=0
		$_l_TotalHits:=0
		$_l_HitsWithNoFreeProcess:=0
		
		
		<>IWS_bo_Shutdown:=False:C215  //added by John, 4/23/99 - could this have been causing strange behaviour
		
		//on restarting server?
		
		
		
		For ($_l_Index; 1; <>IWS_l_MinHandlers)  // start this number of handlers
			// *** MODIFIED BY  John, 5/3/99, to determine whether a process of that name
			//already exists before starting a new one
			$_t_IWSHandlerProcessName:=<>IWS_t_HandlerProcess+" "+String:C10(IWS_GetFirstFreeHandlerID; "00")  // create Process_Name - nb not local process!!!
			//MSG_Send("Starting web handler "+$_t_IWSHandlerProcessName)
			
			$_l_IWSProcess:=New process:C317("IWS_Handler"; 128000; $_t_IWSHandlerProcessName)  // launch process
			IDLE:C311
		End for 
		
		//MSG_HideWindow   `Rollo 6/23/99
		
		$_l_NumStream:=<>IWS_l_MinHandlers*<>IWS_l_HandlerMultiple  // number of streams to use
		UTI_ArrayResize($_l_NumStream; -><>IWS_al_Stream; -><>IWS_al_Status)  // status for these streams
		
		IWS_StreamArrays
		For ($_l_Index; 1; $_l_NumStream)
			<>IWS_al_Stream{$_l_Index}:=IWS_ListenStream
			<>IWS_al_Status{$_l_Index}:=0
			DelayTicks(1)
		End for 
		
		<>IWS_l_StreamConnected:=<>ITK_l_StreamConnected
		<>IWS_l_EmptyStream:=0
		$_bo_ServerStarting:=True:C214
		
		$_r_LastRequestTicks:=Tickcount:C458
		
		<>IWS_l_Handlers:=<>IWS_l_MinHandlers
		
		Repeat 
			
			//The following nonsense added by John, 4/21/99, to help identify
			//sporadic crashing problem on startup of server
			
			//$_l_StreamRow:=ITK_TCPStatus2A (◊IWS_ai_Stream;◊IWS_ai_Status;0))ITK OUT AUgust 2009
			
			SORT ARRAY:C229(<>IWS_al_Status; <>IWS_al_Stream; >)
			
			$_l_StreamRow:=UTI_ArraySearch(-><>IWS_al_Status; -><>IWS_l_StreamConnected; ->IWS_l_Count)
			
			If ($_bo_ServerStarting)
				DelayTicks(30)
			End if 
			
			
			//<DEBUG>
			//More debugging code by John, this time to track down why the
			//server will occasionally crash after not serving any requests
			//for a long time
			If (IWS_l_Count>0)
				$_r_TicksNow:=Tickcount:C458
				$_l_Seconds:=($_r_TicksNow-$_r_LastRequestTicks)\60  //seconds since last request
				If ($_l_Seconds>3600)  //has an hour elapsed since last call?
				End if 
				$_r_LastRequestTicks:=$_r_TicksNow
			End if 
			//</DEBUG>
			
			
			For ($_l_Index; 1; IWS_l_Count)
				//We have picked up a browser connection, so we need to hand it off
				//to a handler process
				$_l_TotalHits:=$_l_TotalHits+1
				$_bo_ProcessSelected:=False:C215
				Repeat 
					$_t_Message:=IPC_RcvMessage(<>IWS_l_MasterChannel)  // get free process number to serve to
					If ($_t_Message#"")  // check if we have a process ID
						$_t_IWSHandlerProcessName:=$_t_Message
						$_l_IWSHandlerProcessNumber:=Process number:C372($_t_IWSHandlerProcessName)
						//John, 5/4/2001
						//We need to check that this process is still viable, though, before passing the
						//request off to it
						$_l_ProcessState:=Process state:C330($_l_IWSHandlerProcessNumber)
						If ($_l_ProcessState>=Executing:K13:4) & ($_l_ProcessState#Waiting for user event:K13:9)
							$_bo_ProcessSelected:=True:C214
						End if   //If ($_t_Message#"")
					End if 
					//Keep on reading from the channel until we have a viable
					//process or there are no more messages
				Until ($_t_Message="") | ($_bo_ProcessSelected)
				
				If ($_bo_ProcessSelected)
					
					$_l_IWSHandlerChannel:=$_l_IWSHandlerProcessNumber+<>IWS_l_HandlerOffset
					If (<>IWS_bo_ConnectLogging)
						IWS_RecordConnect(<>IWS_al_Stream{$_l_StreamRow}; $_l_IWSHandlerProcessNumber)  //record connection time
					End if 
					// old section:
					//IWS_WaitForProcessPause ($_l_IWSHandlerProcessNumber)  `wait for handler to be paus
					IWS_WaitForHandlerPause($_l_IWSHandlerProcessNumber)  // Axel 2/27/2001
					If (Not:C34(<>IWS_bo_Shutdown))
						
						IPC_SendMessage($_l_IWSHandlerChannel; String:C10(<>IWS_al_Stream{$_l_StreamRow}))  // and send stream to handler
						RESUME PROCESS:C320($_l_IWSHandlerProcessNumber)
						<>IWS_al_Stream{$_l_StreamRow}:=IWS_ListenStream
						<>IWS_al_Status{$_l_StreamRow}:=0  // and delete status
						
					Else 
						$_l_StreamRow:=IWS_l_Count+1
					End if   // If (Not(<>IWS_bo_Shutdown))
					
				Else   // there was no free process available, so start one or more others
					$_l_HitsWithNoFreeProcess:=$_l_HitsWithNoFreeProcess+1
					<>IWS_r_NoFreePerc:=Round:C94($_l_HitsWithNoFreeProcess/$_l_TotalHits; 2)
					//if the max has not already been reached
					//    IWS_SendToLog ("No free process to serve to...")
					
					//---ADDED BY JOHN, 4/5/2001, TO HELP SOLVE DISAPPEARING HANDLERS PROBLEM
					//check whether all handlers are still viable
					$_l_CurrentHandlersCount:=IWS_GetHandlerCount
					
					//we now have an accurate count of real working handlers. If this is less than the
					//minimum, we should start a number of new ones equal to the shortfall.
					//Otherwise we should just launch one
					If ($_l_CurrentHandlersCount<<>IWS_l_MinHandlers)
						$_l_NewHandlersRequired:=<>IWS_l_MinHandlers-$_l_CurrentHandlersCount
					Else 
						If ($_l_CurrentHandlersCount<<>IWS_l_MaxHandlers)
							$_l_NewHandlersRequired:=1
						Else 
							$_l_NewHandlersRequired:=0
						End if 
					End if 
					
					
					For ($_l_NewHandlerIndex; 1; $_l_NewHandlersRequired)
						$_l_InsertPoint:=$_l_NumStream+1  //new insert point
						While (Semaphore:C143("$HandlerCount"))
							DelayTicks(2)
						End while 
						<>IWS_l_Handlers:=<>IWS_l_Handlers+1
						CLEAR SEMAPHORE:C144("$HandlerCount")
						$_t_IWSHandlerProcessName:=<>IWS_t_HandlerProcess+" "+String:C10(IWS_GetFirstFreeHandlerID; "00")  // create Process_Name - nb not local process!!!
						$_l_IWSProcess:=New process:C317("IWS_Handler"; 128000; $_t_IWSHandlerProcessName)  // launch process
						$_l_NumStream:=<>IWS_l_Handlers*<>IWS_l_HandlerMultiple  // number of streams to use
						UTI_ArrayResize($_l_NumStream; -><>IWS_al_Stream; -><>IWS_al_Status)  // status for these streams
						For ($_l_StreamIndex; $_l_InsertPoint; $_l_NumStream)  //loop through new additions
							<>IWS_al_Stream{$_l_StreamIndex}:=IWS_ListenStream
							<>IWS_al_Status{$_l_StreamIndex}:=0
							DelayTicks(1)
						End for 
						IDLE:C311
					End for   //For ($_l_NewHandlerIndex;1;$_l_NewHandlersRequired)
					DelayTicks(1)
				End if   //        If ($_bo_ProcessSelected)  ` check if we have a process ID
				$_l_StreamRow:=$_l_StreamRow+1
				
			End for 
			
			//Now check for any dead streams...
			SORT ARRAY:C229(<>IWS_al_Stream; <>IWS_al_Status; >)
			$_l_StreamRow:=UTI_ArraySearch(-><>IWS_al_Stream; -><>IWS_l_EmptyStream; ->IWS_l_Count)
			For ($_l_Index; 1; IWS_l_Count)
				If (<>IWS_al_Stream{$_l_StreamRow}=0)
					<>IWS_al_Stream{$_l_StreamRow}:=IWS_ListenStream
					<>IWS_al_Status{$_l_StreamRow}:=0
					DelayTicks(1)
				End if 
				$_l_StreamRow:=$_l_StreamRow+1
				IDLE:C311
			End for 
			If (<>IWS_l_MasterDelay>0)
				DelayTicks(<>IWS_l_MasterDelay)
			End if 
			IDLE:C311
			
			$_bo_ServerStarting:=False:C215
			
		Until (<>IWS_bo_Shutdown)
		
		
		//This is necessary to clear up any streams which have not been
		//released by IWS_Closer
		//$_l_NumStream:=ITK_TCPGetStrm (0)  ` get the number of allocated streams)ITK OUT AUgust 2009
		
		
		UTI_ArrayResize(0; -><>IWS_al_Stream; -><>IWS_al_Status)
		
		
	: (<>Web_t_ServerHandler="NTK")
		
		
		//ProcessDeclare
		IWS_StartProcess
		Start_Process
		
		
		<>IWS_r_NoFreePerc:=0
		<>IWS_bo_Shutdown:=False:C215  //added by John, 4/23/99 - could this have been causing strange behaviour
		IWS_StreamArrays
		
		// Start the request handlers
		ThreadPool_Start(<>IWS_l_MinHandlers; 128*1024; <>IWS_t_HandlerProcess)
		
		// Launch the server socket
		<>IWS_l_ServerSocket:=TCP Listen(<>IWS_t_LocalAddress; <>IWS_l_WebPort)
		If (<>IWS_l_ServerSocket=0)
			ALERT:C41("TCP Listen failed on "+<>IWS_t_LocalAddress+":"+String:C10(<>IWS_l_WebPort))
		End if 
		
		$_t_SSLAttributes:="ssl=true"
		If (<>IWS_t_PrivateKeyPassPhrase#"")  //a pass phrase has been specified to use to unencrypt the private key (private key is presumably encrypted)
			$_t_SSLAttributes:=$_t_SSLAttributes+" ssl-password="+Char:C90(34)+<>IWS_t_PrivateKeyPassPhrase+Char:C90(34)
		End if 
		If (<>IWS_t_CertificateKeyPath#"")  //a path to the ssl certificate file that should be used has been specified (otherwise it would have looked for "cert.pem" in default location)
			$_t_SSLAttributes:=$_t_SSLAttributes+" ssl-certificate="+Char:C90(34)+<>IWS_t_CertificateKeyPath+Char:C90(34)
		End if 
		If (<>IWS_t_PrivateKeyPath#"")  //a path to the ssl private key file that should be used has been specified (otherwise it would have looked for "key.pem" in default location)
			$_t_SSLAttributes:=$_t_SSLAttributes+" ssl-private-key="+Char:C90(34)+<>IWS_t_PrivateKeyPath+Char:C90(34)
		End if 
		<>IWS_l_SSLServerSocket:=TCP Listen(<>IWS_t_LocalAddress; <>IWS_l_sWebPort; $_t_SSLAttributes)
		If (<>IWS_l_SSLServerSocket=0)
			ALERT:C41("TCP Listen failed on "+<>IWS_t_LocalAddress+":"+String:C10(<>IWS_l_sWebPort))
		End if 
		
		// Loop until we have to stop
		// Note: the server socket will always be listening unless we call TCP Close on it
		While ((<>IWS_bo_Shutdown=False:C215) & (TCP Get State(<>IWS_l_ServerSocket)=TCP Listening) & (TCP Get State(<>IWS_l_SSLServerSocket)=TCP Listening))
			
			// Check for incoming connections
			$_l_Socket:=TCP Accept(<>IWS_l_ServerSocket)
			
			$_l_SSLSocket:=TCP Accept(<>IWS_l_SSLServerSocket)
			
			If ($_l_Socket#0) | ($_l_SSLSocket#0)
				// NTK Debuglog ("TCP Accept "+String($_l_Socket)+"\r\n")
				If ($_l_Socket#0)
					If (<>IWS_bo_ConnectLogging)
						IWS_RecordConnect($_l_Socket; 0)  //record connection time
					End if 
					ThreadPool_Queue("IWS_Handler"; String:C10($_l_Socket))
				End if 
				
				If ($_l_SSLSocket#0)
					If (<>IWS_bo_ConnectLogging)
						IWS_RecordConnect($_l_SSLSocket; 0)  //record connection time
					End if 
					ThreadPool_Queue("IWS_Handler"; String:C10($_l_SSLSocket))
				End if 
				
				
			Else 
				
				DELAY PROCESS:C323(Current process:C322; <>IWS_l_MasterDelay)
				
			End if 
			
		End while 
		
		// Close the server socket
		If (TCP Get State(<>IWS_l_ServerSocket)=TCP Listening)
			TCP Close(<>IWS_l_ServerSocket)
		End if 
		
		If (TCP Get State(<>IWS_l_SSLServerSocket)=TCP Listening)
			TCP Close(<>IWS_l_SSLServerSocket)
		End if 
		
		// Stop the request handlers
		ThreadPool_Stop
		//
	Else 
		
End case 
ERR_MethodTrackerReturn("IWS_Master"; $_t_oldMethodName)