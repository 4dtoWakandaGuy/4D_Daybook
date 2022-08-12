//%attributes = {}
If (False:C215)
	//Project Method Name:      ThreadPool_Queue
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
	C_LONGINT:C283(<>ThreadPool_IPCChannel; $_l_AvailableRow)
	C_TEXT:C284($_l_CountParameters; $_t_Method; $_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ThreadPool_Queue")

// (PM) ThreadPool_Queue
// Queues a work item for the thread pool
// $1 = Method name to execute
// $2 = Parameter


$_t_Method:=$1
$_l_CountParameters:=$2

IPC Send(<>ThreadPool_IPCChannel; $_t_Method; $_l_CountParameters)

// Check if there is a thread available
$_l_AvailableRow:=Find in array:C230(<>TRD_bo_PoolisAvailable; True:C214)
If ($_l_AvailableRow#-1)
	// If so, wake it up
	RESUME PROCESS:C320(<>TRD_al_PoolThreadID{$_l_AvailableRow})
Else 
	// Otherwise the first available thread will automatically pick up the task
End if 
ERR_MethodTrackerReturn("ThreadPool_Queue"; $_t_oldMethodName)
