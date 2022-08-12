//%attributes = {}
If (False:C215)
	//Project Method Name:      ThreadPool__Init
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
	C_BOOLEAN:C305(<>ThreadPool_IsInitialised; <>ThreadPool_Stop)
	C_LONGINT:C283(<>ThreadPool_IPCChannel; <>ThreadPool_StackSize)
	C_TEXT:C284(<>ThreadPool_ProcessName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ThreadPool__Init")

// (PM) ThreadPool__Init
// Initializes the variables used by the thread pool


If (<>ThreadPool_IsInitialised=False:C215)
	
	<>ThreadPool_IsInitialised:=True:C214
	<>ThreadPool_IPCChannel:=99999
	
	ARRAY LONGINT:C221(<>TRD_al_PoolThreadID; 0)
	ARRAY BOOLEAN:C223(<>TRD_bo_PoolisAvailable; 0)
	
End if 
ERR_MethodTrackerReturn("ThreadPool__Init"; $_t_oldMethodName)