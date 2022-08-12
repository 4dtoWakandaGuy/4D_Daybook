//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_HandlerChecker
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:50
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IWS_al_HandlerProcessID;0)
	//ARRAY LONGINT(<>IWS_al_HandlerTimeout;0)
	C_BOOLEAN:C305(<>IWS_bo_AutoDismiss; <>IWS_bo_Shutdown; <>SYS_bo_Quit; $_bo_Stop)
	C_LONGINT:C283(<>IWS_l_CheckerChannel; <>IWS_l_HandlerCheckInterval; <>IWS_l_HandlerProcessID; <>IWS_l_SQLTimeout; $_l_ArrayElement; $_l_Index; $_l_IWSProcess; $_l_NumberofMessages; $_l_ProcessState; $_l_ProcessTime; $_l_WaitTime)
	C_TEXT:C284(<>IWS_t_HandlerProcess; $_t_Message; $_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_HandlerChecker")

Start_Process
//******************************************************************************
//
//Method: IWS_HandlerChecker
//
//Written by  John Moore on 10/24/98
//
//Purpose: Updates Process_Arrays in log periodically
//
//******************************************************************************



UTI_ArrayClear(-><>IWS_al_HandlerProcessID; -><>IWS_al_HandlerTimeout)
$_bo_Stop:=False:C215

While (Not:C34(<>IWS_bo_Shutdown))
	DelayTicks(<>IWS_l_HandlerCheckInterval)
	$_l_NumberofMessages:=IPC_MessagesInQueue(<>IWS_l_CheckerChannel)
	For ($_l_Index; 1; $_l_NumberofMessages)
		$_t_Message:=IPC_RcvMessage(<>IWS_l_CheckerChannel)
		If ($_t_Message#"")
			Case of 
				: ($_t_Message="START@")  //a msg from a handler about to go into IME CGI Search
					<>IWS_l_HandlerProcessID:=Num:C11(STR_Param($_t_Message; 2))
					$_l_ArrayElement:=UTI_ArrayInsertAt(-><>IWS_al_HandlerProcessID; -><>IWS_l_HandlerProcessID)
					UTI_ArrayInsertElements($_l_ArrayElement; 1; -><>IWS_al_HandlerProcessID; -><>IWS_al_HandlerTimeout)
					<>IWS_al_HandlerProcessID{$_l_ArrayElement}:=<>IWS_l_HandlerProcessID
					<>IWS_al_HandlerTimeout{$_l_ArrayElement}:=Tickcount:C458+<>IWS_l_SQLTimeout
					
					
				: ($_t_Message="FINISH@")  //a msg from a handler just come out of IME CGI Search
					<>IWS_l_HandlerProcessID:=Num:C11(STR_Param($_t_Message; 2))
					$_l_ArrayElement:=UTI_ArraySearch(-><>IWS_al_HandlerProcessID; -><>IWS_l_HandlerProcessID)
					If ($_l_ArrayElement>0)
						UTI_ArrayDeleteElements($_l_ArrayElement; 1; -><>IWS_al_HandlerProcessID; -><>IWS_al_HandlerTimeout)
					Else 
						IWS_SendToLog("ERROR: Process ID not found in arrays!")
					End if 
				Else 
					IWS_SendToLog("ERROR: The following message not handled by IWS_HandlerChecker '"+$_t_Message+"'")
			End case 
		End if 
		IDLE:C311
	End for 
	
	For ($_l_Index; Size of array:C274(<>IWS_al_HandlerProcessID); 1; -1)
		<>IWS_l_HandlerProcessID:=<>IWS_al_HandlerProcessID{$_l_Index}
		PROCESS PROPERTIES:C336(<>IWS_l_HandlerProcessID; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
		If ($_l_ProcessState=Paused:K13:6) & (Tickcount:C458><>IWS_al_HandlerTimeout{$_l_Index})
			UTI_ArrayDeleteElements($_l_Index; 1; -><>IWS_al_HandlerProcessID; -><>IWS_al_HandlerTimeout)
			RESUME PROCESS:C320(<>IWS_l_HandlerProcessID)
			IWS_SendToLog("ERROR: "+$_t_ProcessName+" process resumed.")
		End if 
		IDLE:C311
	End for 
	//New addition by John, 10/13/99, to abort  handlers with range-checking dialogs
	If (<>IWS_bo_AutoDismiss)
		For ($_l_Index; 1; Count tasks:C335)
			PROCESS PROPERTIES:C336($_l_Index; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			
			If ($_t_ProcessName=(<>IWS_t_HandlerProcess+"@")) & ($_l_ProcessState=Aborted:K13:1) & (<>IWS_bo_Shutdown=False:C215)
				DelayTicks(20)
				$_l_IWSProcess:=New process:C317("IWS_Handler"; 128000; $_t_ProcessName)  // launch process
				BEEP:C151
				DelayTicks(20)
			End if 
			
			If ($_t_ProcessName=(<>IWS_t_HandlerProcess+"@")) & ($_l_ProcessState=Waiting for user event:K13:9)  //it's a handler in the state it's in if runtime error dialog appears
				IWS_SendToLog($_t_ProcessName+" was stalled, attempting to resume")
				POST KEY:C465(Enter:K15:35; 0; Process number:C372($_t_ProcessName))  //send a post key to the process so that it trips the OK button
				DelayTicks(60)
				POST KEY:C465(Escape:K15:39; 0; Process number:C372($_t_ProcessName))  //send an escape key to the process so that it trips the CANCEL button` Axel 10/5/
				//we now wait up to 2 seconds to see if it really aborts
				$_l_WaitTime:=Tickcount:C458+(2*60)
				//the number may change but the name won't so we use that
				While ((Process state:C330(Process number:C372($_t_ProcessName))=Waiting for user event:K13:9) & (Tickcount:C458<$_l_WaitTime))
					DelayTicks(10)
				End while 
				$_l_ProcessState:=Process state:C330(Process number:C372($_t_ProcessName))
				Case of 
					: ($_l_ProcessState<0)  //it was aborted
						IWS_SendToLog($_t_ProcessName+" aborted by handler checker")
					: ($_l_ProcessState#Waiting for user event:K13:9)
						IWS_SendToLog($_t_ProcessName+" successfully resumed by handler checker")
						//The following disabled by John - we don't want to be reducing IWS_l_Handlers,
						//because it could screw up the array of listeners
						
						//While (Semaphore("$HandlerCount"))
						// Delayticks(2)
						//End while
						//<>IWS_l_Handlers:=<>IWS_l_Handlers-1
						//CLEAR SEMAPHORE("$HandlerCount")
					Else 
						IWS_SendToLog("ERROR: "+$_t_ProcessName+" could not be resumed or aborted by handler checker")
				End case 
			End if   //If ($_t_ProcessName=(◊IWS_t_HandlerProcess +"@")) & ($_l_ProcessState=Waiting for user event )
			
		End for   // For ($_l_Index;1;Count tasks)
		
		
	End if   //If(<>IWS_bo_AutoDismiss)
	
	If (<>SYS_bo_Quit)
		<>IWS_bo_Shutdown:=True:C214  //this will cause all other processes to quit themselves
	End if 
End while 
ERR_MethodTrackerReturn("IWS_HandlerChecker"; $_t_oldMethodName)