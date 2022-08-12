//%attributes = {}
If (False:C215)
	//Project Method Name:      ThreadPool__WorkerThread
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
	//ARRAY BOOLEAN(<>TRD_bo_PoolisAvailable;0)
	//ARRAY LONGINT(<>TRD_al_PoolThreadID;0)
	C_BOOLEAN:C305(<>ThreadPool_Stop)
	C_LONGINT:C283(<>ThreadPool_IPCChannel; $_l_ProcessRow)
	C_TEXT:C284($_t_Data; $_t_Message; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ThreadPool__WorkerThread")

// (PM) ThreadPool__WorkerThread
// Performs work for the thread pool


// Loop until we're told to quit
While ((Process aborted:C672=False:C215) & (<>ThreadPool_Stop=False:C215))
	
	// Check if there is work available
	If (IPC Receive(<>ThreadPool_IPCChannel; $_t_Message; $_t_Data)=1)
		
		$_l_ProcessRow:=Find in array:C230(<>TRD_al_PoolThreadID; Current process:C322)
		<>TRD_bo_PoolisAvailable{$_l_ProcessRow}:=False:C215
		EXECUTE FORMULA:C63($_t_Message+"("+$_t_Data+")")
		<>TRD_bo_PoolisAvailable{$_l_ProcessRow}:=True:C214
		
	Else 
		
		// Goto sleep until someone wakes us
		PAUSE PROCESS:C319(Current process:C322)
		
	End if 
	
End while 
ERR_MethodTrackerReturn("ThreadPool__WorkerThread"; $_t_oldMethodName)
