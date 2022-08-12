//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_LoadInformer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(UDP Close)
	//C_UNKNOWN(UDP Open)
	//C_UNKNOWN(UDP Send)
	ARRAY LONGINT:C221($_al_ProcessIDS; 0)
	C_BLOB:C604($_blb_MessageBlob)
	C_BOOLEAN:C305(<>IWS_bo_LoadInformerInterrupt; <>IWS_bo_Shutdown; <>IWS_bo_UseWatchdog; $_bo_HandlerWaiting; IWS_bo_HandlerWaiting)
	C_LONGINT:C283(<>IWS_l_LoadInformerPause; <>IWS_l_LoadInformerPort; <>IWS_l_LoadInformerProcID; <>IWS_l_WatchdogPort; <>IWS_l_Webport; $_l_BytesSend; $_l_FreeHandlers; $_l_Index; $_l_LastTotalTicks; $_l_NotificationInterval; $_l_NotificationPort)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $_l_Socket; $_l_TotalHandlers; $_l_TotalTicks; $_l_TotalTicksUsed; $_t_Machine)
	C_REAL:C285($_r_LastNotification)
	C_TEXT:C284(<>IWS_t_CommandPrefix; <>IWS_t_HandlerProcess; <>IWS_t_LoadInformerAddress; <>IWS_t_LocalAddress; <>Web_t_ServerHandler; $_t_HandlerStates; $_t_Message; $_t_MulticastAddress; $_t_NotificationAddress; $_t_NotificationMessage; $_t_oldMethodName)
	C_TEXT:C284($_t_ProcessName; $_t_WatchdogMessage; IWS_t_GCSLI_Event)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_LoadInformer")
//Method: IWS_LoadInformer
//
//Purpose: Sends information on load levels of server out to frontline web servers

Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		IWS_StartProcess
		Start_Process
		//
		
		
		
		<>IWS_l_LoadInformerProcID:=Current process:C322  //Ron 12/28/99
		
		//$EndPoint:=ITK_UDPCreate (◊UDP_i_LoadInformerPort;0;2048)ITK OUT AUgust 2009
		//$MulticastAddress:=ITK_Name2Addr (◊IWS_t_LoadInformerAddress))ITK OUT AUgust 2009
		
		//------------------------------------------------------------------------
		//Notification code added by John, 5/23/2001
		//Sends a UDP message to a fixed address saying
		//which multicast address and port this logic server
		//is sending its load messages to
		//$NotificationAddress:=ITK_Name2Addr ("239.4.1.1")  `Fixed address, hard-coded in forwarder as well)ITK OUT AUgust 2009
		$_l_NotificationPort:=<>IWS_l_LoadInformerPort
		$_l_NotificationInterval:=600  //ticks between notifications
		$_t_NotificationMessage:=<>IWS_t_LoadInformerAddress+":"+String:C10(<>IWS_l_LoadInformerPort)
		$_r_LastNotification:=0
		//----------------------------------------------------------------------------
		
		$_l_LastTotalTicks:=0
		
		//Use of text file removed by John, 6/4/2000
		//Messages are now sent to a single multicast address,
		//set in the configuration form
		
		<>IWS_bo_LoadInformerInterrupt:=False:C215  //always reset this
		
		Repeat 
			
			Case of 
				: (<>IWS_bo_Shutdown)
					$_t_Message:=<>IWS_t_CommandPrefix+"SHUTDOWN"  //John, Jan 13,2000
					
				: (<>IWS_bo_LoadInformerInterrupt)  //it is suspended
					//Changed by John, 5/31/2001, so that it continues to send SUSPEND messages
					//(formerly it would send one and then remain silent)
					$_t_Message:=<>IWS_t_CommandPrefix+"SUSPEND"  //John, Apr 6 2000
					
				: (IWS_t_GCSLI_Event#"")
					$_t_Message:=IWS_t_GCSLI_Event  //should already contain command prefix
					IWS_t_GCSLI_Event:=""
				Else 
					$_l_TotalTicks:=0
					$_l_TotalHandlers:=0
					$_l_FreeHandlers:=0
					$_t_HandlerStates:=""
					For ($_l_Index; 1; Count tasks:C335)
						PROCESS PROPERTIES:C336($_l_Index; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
						//changed by John, Jan 22 2001, so that the process will be regarded
						//as a valid handler as long as it has not been aborted, etc.
						If (($_t_ProcessName=(<>IWS_t_HandlerProcess+"@")) & ($_l_ProcessState>=Executing:K13:4))
							//it's a valid  handler
							$_l_TotalHandlers:=$_l_TotalHandlers+1
							//Now add its state to the handler state string
							$_t_HandlerStates:=$_t_HandlerStates+Char:C90($_l_ProcessState)
							//Now check to see whether the process is paused and at a particular location,
							//namely having completed its handling task and sitting waiting
							GET PROCESS VARIABLE:C371($_l_Index; IWS_bo_HandlerWaiting; $_bo_HandlerWaiting)
							If (($_bo_HandlerWaiting) & ($_l_ProcessState=Paused:K13:6))  //special safety measure, extra check for paused state, JDM 1/22/2001
								$_l_FreeHandlers:=$_l_FreeHandlers+1
							End if 
						End if   //it's a valid handler
						$_l_TotalTicks:=$_l_TotalTicks+$_l_ProcessTime
					End for 
					$_l_TotalTicksUsed:=$_l_TotalTicks-$_l_LastTotalTicks
					$_l_LastTotalTicks:=$_l_TotalTicks
					
					$_t_Message:=<>IWS_t_LocalAddress+"|"+String:C10(<>IWS_l_Webport)+"|"+String:C10($_l_TotalTicksUsed)+"|"+String:C10($_l_FreeHandlers)+"|"+String:C10($_l_TotalHandlers)+"|"+$_t_HandlerStates
			End case 
			If ($_t_Message#"")
				//$Err:=ITK_UDPSend ($EndPoint;$_t_Message;$MulticastAddress;◊IWS_l_LoadInformerPort;0))ITK OUT AUgust 2009
			End if 
			If (<>IWS_bo_UseWatchdog)  //send a message to the watchdog app saying we're still here
				//John 5/30/2001
				//As long as the load informer is actually running, we want to
				//continue sending out OK messages - the individual states
				//are of no concern here, all we need is some sign of life  to
				//prevent the watchdog from kicking off the restart process
				$_t_WatchdogMessage:=String:C10(<>IWS_l_Webport)
				//$Err:=ITK_UDPSend ($EndPoint;$_t_WatchdogMessage;◊IWS_l_LocalAddress;◊IWS_l_WatchdogPort;0))ITK OUT AUgust 2009
			End if 
			
			If (Not:C34(<>IWS_bo_Shutdown))
				DelayTicks(<>IWS_l_LoadInformerPause)  //wait e.g. 2 seconds and try again
			End if 
			//----------------------------------------------------
			//Notification coded added by John, 5/23/01
			If (Tickcount:C458>($_r_LastNotification+$_l_NotificationInterval))
				//it's time for another notification of load informer address
				//$Err:=ITK_UDPSend ($EndPoint;$_t_NotificationMessage;$NotificationAddress;$_l_NotificationPort;0))ITK OUT AUgust 2009
				$_r_LastNotification:=Tickcount:C458
			End if 
			//--------------------------------------------------------
		Until (<>IWS_bo_Shutdown)
		
		//$Err:=ITK_UDPRelease ($EndPoint))ITK OUT AUgust 2009
		
		
	: (<>Web_t_ServerHandler="NTK")
		
		IWS_StartProcess
		Start_Process
		
		
		
		
		<>IWS_l_LoadInformerProcID:=Current process:C322  //Ron 12/28/99
		
		$_l_Socket:=UDP Open
		$_t_MulticastAddress:=<>IWS_t_LoadInformerAddress
		
		//------------------------------------------------------------------------
		//Notification code added by John, 5/23/2001
		//Sends a UDP message to a fixed address saying
		//which multicast address and port this logic server
		//is sending its load messages to
		$_t_NotificationAddress:="239.4.1.1"  //Fixed address, hard-coded in forwarder as well
		$_l_NotificationPort:=<>IWS_l_LoadInformerPort
		$_l_NotificationInterval:=600  //ticks between notifications
		$_t_NotificationMessage:=<>IWS_t_LoadInformerAddress+":"+String:C10(<>IWS_l_LoadInformerPort)
		$_r_LastNotification:=0
		//----------------------------------------------------------------------------
		
		$_l_LastTotalTicks:=0
		
		//Use of text file removed by John, 6/4/2000
		//Messages are now sent to a single multicast address,
		//set in the configuration form
		
		<>IWS_bo_LoadInformerInterrupt:=False:C215  //always reset this
		
		Repeat 
			
			Case of 
				: (<>IWS_bo_Shutdown)
					$_t_Message:=<>IWS_t_CommandPrefix+"SHUTDOWN"  //John, Jan 13,2000
					
				: (<>IWS_bo_LoadInformerInterrupt)  //it is suspended
					//Changed by John, 5/31/2001, so that it continues to send SUSPEND messages
					//(formerly it would send one and then remain silent)
					$_t_Message:=<>IWS_t_CommandPrefix+"SUSPEND"  //John, Apr 6 2000
					
				: (IWS_t_GCSLI_Event#"")
					$_t_Message:=IWS_t_GCSLI_Event  //should already contain command prefix
					IWS_t_GCSLI_Event:=""
				Else 
					$_l_TotalTicks:=0
					$_l_TotalHandlers:=0
					$_l_FreeHandlers:=0
					$_t_HandlerStates:=""
					ARRAY LONGINT:C221($_al_ProcessIDS; 0)
					ThreadPool_GetThreadIDs(->$_al_ProcessIDS)
					
					For ($_l_Index; 1; Size of array:C274($_al_ProcessIDS))
						PROCESS PROPERTIES:C336($_al_ProcessIDS{$_l_Index}; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
						//changed by John, Jan 22 2001, so that the process will be regarded
						//as a valid handler as long as it has not been aborted, etc.
						//it's a valid  handler
						If ($_l_ProcessState>=Executing:K13:4)
							$_l_TotalHandlers:=$_l_TotalHandlers+1
							//Now add its state to the handler state string
							$_t_HandlerStates:=$_t_HandlerStates+Char:C90($_l_ProcessState)
							//Now check to see whether the process is paused having completed its handling task and sitting waiting
							If ($_l_ProcessState=Paused:K13:6)
								$_l_FreeHandlers:=$_l_FreeHandlers+1
							End if 
							$_l_TotalTicks:=$_l_TotalTicks+$_l_ProcessTime
						End if 
					End for 
					$_l_TotalTicksUsed:=$_l_TotalTicks-$_l_LastTotalTicks
					$_l_LastTotalTicks:=$_l_TotalTicks
					
					$_t_Message:=<>IWS_t_LocalAddress+"|"+String:C10(<>IWS_l_Webport)+"|"+String:C10($_l_TotalTicksUsed)+"|"+String:C10($_l_FreeHandlers)+"|"+String:C10($_l_TotalHandlers)+"|"+$_t_HandlerStates
			End case 
			
			If ($_t_Message#"")
				// We have to convert $_t_Message to a blob because it may contain Char(0) which will not transfer correctly in text mode
				// See how $_t_HandlerStates is filled
				TEXT TO BLOB:C554($_t_Message; $_blb_MessageBlob; Mac C string:K22:7)  //;Mac C string)  `v11 Mac C string
				$_l_BytesSend:=UDP Send Blob($_l_Socket; $_blb_MessageBlob; $_t_MulticastAddress; <>IWS_l_LoadInformerPort)
			End if 
			
			If (<>IWS_bo_UseWatchdog)  //send a message to the watchdog app saying we're still here
				//John 5/30/2001
				//As long as the load informer is actually running, we want to
				//continue sending out OK messages - the individual states
				//are of no concern here, all we need is some sign of life  to
				//prevent the watchdog from kicking off the restart process
				$_t_WatchdogMessage:=String:C10(<>IWS_l_Webport)
				$_l_BytesSend:=UDP Send($_l_Socket; $_t_WatchdogMessage; <>IWS_t_LocalAddress; <>IWS_l_WatchdogPort)
			End if 
			
			If (Not:C34(<>IWS_bo_Shutdown))
				DELAY PROCESS:C323(Current process:C322; <>IWS_l_LoadInformerPause)  //wait e.g. 2 seconds and try again
			End if 
			
			//----------------------------------------------------
			//Notification coded added by John, 5/23/01
			If (Tickcount:C458>($_r_LastNotification+$_l_NotificationInterval))
				//it's time for another notification of load informer address
				$_l_BytesSend:=UDP Send($_l_Socket; $_t_NotificationMessage; $_t_NotificationAddress; $_l_NotificationPort)
				$_r_LastNotification:=Tickcount:C458
			End if 
			//--------------------------------------------------------
		Until (<>IWS_bo_Shutdown)
		
		UDP Close($_l_Socket)
		
		<>IWS_l_LoadInformerProcID:=0  //Ron 12/28/99
	Else 
		
End case 


<>IWS_l_LoadInformerProcID:=0  //Ron 12/28/99
ERR_MethodTrackerReturn("IWS_LoadInformer"; $_t_oldMethodName)