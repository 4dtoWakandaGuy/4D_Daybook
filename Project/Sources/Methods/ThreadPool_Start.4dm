//%attributes = {}
If (False:C215)
	//Project Method Name:      ThreadPool_Start
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
	C_LONGINT:C283(<>ThreadPool_IPCChannel; <>ThreadPool_StackSize; $_l_Channel; $_l_Index; $_l_ProcessID; $_l_StackSize; $_l_ThreadCount; $1; $2)
	C_TEXT:C284(<>ThreadPool_ProcessName; $_t_oldMethodName; $_t_ProcessName; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ThreadPool_Start")

// (PM) ThreadPool_Start
// Launches a pool of threads (processes)
// $1 = Thread count
// $2 = Stack size
// $3 = Process_Name


$_l_ThreadCount:=$1
$_l_StackSize:=$2
$_t_ProcessName:=Substring:C12($3; 1; 28)
//
ThreadPool__Init

$_l_Channel:=<>ThreadPool_IPCChannel
IPC Delete Channel(<>ThreadPool_IPCChannel)
<>ThreadPool_IPCChannel:=$_l_Channel

UTI_ArrayResize($_l_ThreadCount; -><>TRD_al_PoolThreadID; -><>TRD_bo_PoolisAvailable)

<>ThreadPool_Stop:=False:C215
<>ThreadPool_StackSize:=$_l_StackSize
<>ThreadPool_ProcessName:=$_t_ProcessName

// Launch the processes for our thread pool
For ($_l_Index; 1; $_l_ThreadCount)
	
	$_l_ProcessID:=Process number:C372($_t_ProcessName+" "+String:C10($_l_Index))
	
	If ($_l_ProcessID=0)
		<>TRD_bo_PoolisAvailable{$_l_Index}:=True:C214
		<>TRD_al_PoolThreadID{$_l_Index}:=New process:C317("ThreadPool__WorkerThread"; $_l_StackSize; $_t_ProcessName+" "+String:C10($_l_Index))
	Else 
		<>TRD_al_PoolThreadID{$_l_Index}:=$_l_ProcessID
	End if 
	
End for 
ERR_MethodTrackerReturn("ThreadPool_Start"; $_t_oldMethodName)
