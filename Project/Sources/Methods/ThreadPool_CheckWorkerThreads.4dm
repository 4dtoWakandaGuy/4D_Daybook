//%attributes = {}
If (False:C215)
	//Project Method Name:      ThreadPool_CheckWorkerThreads
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/07/2010 16:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>TRD_al_PoolThreadID;0)
	C_BOOLEAN:C305(<>ThreadPool_Stop)
	C_LONGINT:C283(<>ThreadPool_IPCChannel; <>ThreadPool_StackSize; $_l_ProcessState; $_l_ThreadIndex)
	C_TEXT:C284(<>ThreadPool_ProcessName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ThreadPool_CheckWorkerThreads")

// (PM) ThreadPool_CheckWorkerThreads
// Checks whether all work threads within the threadpool are still running


For ($_l_ThreadIndex; 1; Size of array:C274(<>TRD_al_PoolThreadID))
	
	// Get the process state
	$_l_ProcessState:=Process state:C330(<>TRD_al_PoolThreadID{$_l_ThreadIndex})
	
	Case of 
		: (<>ThreadPool_Stop)
			// We should stop asap, so don't take any further action
		: (($_l_ProcessState=Aborted:K13:1) | ($_l_ProcessState=Does not exist:K13:3))  // If the process has quit, re-launch a new one
			<>TRD_al_PoolThreadID{$_l_ThreadIndex}:=New process:C317("ThreadPool__WorkerThread"; <>ThreadPool_StackSize; <>ThreadPool_ProcessName+" "+String:C10($_l_ThreadIndex))
			DELAY PROCESS:C323(Current process:C322; 30)
		: (($_l_ProcessState=Paused:K13:6) & (IPC Count Messages(<>ThreadPool_IPCChannel)>0))  // In case someone is sleeping while there is work to be done, wake it up
			RESUME PROCESS:C320(<>TRD_al_PoolThreadID{$_l_ThreadIndex})  // This is unlikely to happen
			DELAY PROCESS:C323(Current process:C322; 30)
	End case 
	
End for 
ERR_MethodTrackerReturn("ThreadPool_CheckWorkerThreads"; $_t_oldMethodName)
