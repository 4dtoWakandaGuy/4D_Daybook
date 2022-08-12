//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_Closer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Status; 0)
	ARRAY LONGINT:C221($_al_Stream; 0)
	ARRAY LONGINT:C221($_al_Time; 0)
	C_BOOLEAN:C305(<>IWS_bo_Shutdown)
	C_LONGINT:C283(<>ITK_l_StreamConnected; <>IWS_l_CloserChannel; $_l_CountMessages; $_l_Error; $_l_Erroror; $_l_MessageIndex; $_l_Status; $_l_StreamNumber; $_l_StreamNumberCount)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_Message; $_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("IWS_Closer")
//******************************************************************************
//
//Method: IWS_Closer
//
//Written by  John Moore on 27/08/98
//
//Purpose: Deals with closing of streams, etc. once handlers
//have finished with them. (Frees up handlers more quickly).

//******************************************************************************

IWS_StartProcess
Start_Process



MESSAGES OFF:C175

ARRAY LONGINT:C221($_al_Stream; 0)  // holding all streams to close
ARRAY LONGINT:C221($_al_Status; 0)  // holding status of streams to close
ARRAY LONGINT:C221($_al_Time; 0)  // holding time values for timed out connections
//C_INTEGER(◊ITK_i_StreamConnected)


Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		Repeat 
			$_l_CountMessages:=IPC_MessagesInQueue(<>IWS_l_CloserChannel)  // get remaining streams in close queue
			If ($_l_CountMessages=0)
				PAUSE PROCESS:C319(Current process:C322)
			Else 
				For ($_l_MessageIndex; 1; $_l_CountMessages)  // for all messages (streams) waiting in channel queue
					$_t_Message:=IPC_RcvMessage(<>IWS_l_CloserChannel)  // get stream reference
					If ($_t_Message#"")
						$_l_StreamNumber:=Num:C11($_t_Message)
						$_l_Status:=IWS_StreamStatus($_l_StreamNumber)
						If ($_l_Status=<>ITK_l_StreamConnected)
							$_l_Erroror:=IWS_CloseStream($_l_StreamNumber)
							$_l_Status:=IWS_StreamStatus($_l_StreamNumber)
							While (($_l_Status<12) & ($_l_Status>=0) & (Not:C34(<>IWS_bo_Shutdown)))
								DelayTicks(6)
								$_l_Status:=IWS_StreamStatus($_l_StreamNumber)
							End while 
							$_l_Erroror:=IWS_ReleaseStream($_l_StreamNumber)
						Else 
							IWS_SendToLog("ERROR: Closing stream "+String:C10($_l_StreamNumber)+", status = "+String:C10($_l_Status))
							$_l_Erroror:=IWS_ReleaseStream($_l_StreamNumber)
						End if 
					Else 
						IWS_SendToLog("ERROR: Blank stream ref sent to closer")
					End if   //  If ($_t_Message # "")
					IDLE:C311
				End for   //($_l_MessageIndex;1;$_l_CountMessages)
				
			End if   //  If ($_l_CountMessages=0)
			IDLE:C311
		Until (<>IWS_bo_Shutdown)
		
		//Now release all streams
		For ($_l_MessageIndex; 1; Size of array:C274($_al_Stream))
			//If (IWS_StreamStatus ($_al_Stream{$_l_MessageIndex}) # -1)
			$_l_Error:=IWS_ReleaseStream($_al_Stream{$_l_MessageIndex})
			// End if
		End for 
		IPC_ClearMessageQueue(<>IWS_l_CloserChannel)  //clear any messages in queue
		
	: (<>Web_t_ServerHandler="NTK")
		Repeat 
			
			$_l_CountMessages:=IPC_MessagesInQueue(<>IWS_l_CloserChannel)  // get remaining streams in close queue
			If ($_l_CountMessages=0)
				// PAUSE PROCESS(Current process)
				DELAY PROCESS:C323(Current process:C322; 30)
			Else 
				For ($_l_MessageIndex; 1; $_l_CountMessages)  // for all messages (streams) waiting in channel queue
					$_t_Message:=IPC_RcvMessage(<>IWS_l_CloserChannel)  // get stream reference
					If ($_t_Message#"")
						$_l_StreamNumber:=Num:C11($_t_Message)
						IWS_CloseStream($_l_StreamNumber)
					Else 
						IWS_SendToLog("ERROR: Blank stream ref sent to closer")
					End if   //  If ($_t_Message # "")
				End for   //($_l_MessageIndex;1;$_l_CountMessages)
			End if   //  If ($_l_CountMessages=0)
			
		Until (<>IWS_bo_Shutdown)
	Else 
		
End case 


//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_Closer"; $_t_oldMethodName)