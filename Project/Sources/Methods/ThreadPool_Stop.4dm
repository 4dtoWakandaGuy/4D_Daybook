//%attributes = {}
If (False:C215)
	//Project Method Name:      ThreadPool_Stop
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
	//ARRAY LONGINT(<>TRD_al_PoolThreadID;0)
	C_BOOLEAN:C305(<>ThreadPool_Stop)
	C_LONGINT:C283($_l_ThreadIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ThreadPool_Stop")

// (PM) ThreadPool_Stop
// Stops the thread pool


<>ThreadPool_Stop:=True:C214

// Wake up all the worker threads so they can stop
For ($_l_ThreadIndex; 1; Size of array:C274(<>TRD_al_PoolThreadID))
	RESUME PROCESS:C320(<>TRD_al_PoolThreadID{$_l_ThreadIndex})
End for 

// Wait until all processes have quit
For ($_l_ThreadIndex; 1; Size of array:C274(<>TRD_al_PoolThreadID))
	While (Process state:C330(<>TRD_al_PoolThreadID{$_l_ThreadIndex})>=Executing:K13:4)
		RESUME PROCESS:C320(<>TRD_al_PoolThreadID{$_l_ThreadIndex})
		DELAY PROCESS:C323(Current process:C322; 1)
	End while 
End for 

UTI_ArrayResize(0; -><>TRD_al_PoolThreadID)
ERR_MethodTrackerReturn("ThreadPool_Stop"; $_t_oldMethodName)
