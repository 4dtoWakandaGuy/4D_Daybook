//%attributes = {}
If (False:C215)
	//Project Method Name:      ThreadPool_GetThreadIDs
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
	C_POINTER:C301($_ptr_Array; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ThreadPool_GetThreadIDs")

// (PM) ThreadPool_GetThreadIDs
// Fills an array with the process IDs used by the thread pool
// $1 = Pointer to longint array


$_ptr_Array:=$1

COPY ARRAY:C226(<>TRD_al_PoolThreadID; $_ptr_Array->)
ERR_MethodTrackerReturn("ThreadPool_GetThreadIDs"; $_t_oldMethodName)
