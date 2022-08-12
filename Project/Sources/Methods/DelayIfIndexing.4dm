//%attributes = {}

If (False:C215)
	//Project Method Name:      DelayIfIndexing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ProcessVisible; $_bo_WindowOpen)
	C_LONGINT:C283($_l_ProcessOrigin; $_l_ProcessState; $_l_ProcessTime; $_l_TaskIndex; $_l_UniqueProcessID)
	C_TEXT:C284($_t_oldMethodName; $_t_processName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DelayIfIndexing")

If (False:C215)
	//Also see `DelayIfProcessRunning ("Layout Defs")  `bsw 28/07/04
End if 
//TRACE
$_t_oldMethodName:=ERR_MethodTracker("DelayIfIndexing")  // to keep login faster
//UnloadAllRecords
For ($_l_TaskIndex; 1; Count tasks:C335)
	PROCESS PROPERTIES:C336($_l_TaskIndex; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
	//NG June 2004
	If ($_t_processName="Index Builder") & ($_l_ProcessState>=0)  //Index Process is running so delay this process until indexing finishes
		If (Db_Testing)
			MESSAGE:C88("Index Builder is running so everything is delayed!")
		End if 
		Repeat   //Delay until index process finishes or doesn't exsit
			DelayTicks(60*30)
			PROCESS PROPERTIES:C336($_l_TaskIndex; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
		Until ((Process aborted:C672) | ($_l_ProcessState<0))
		$_l_TaskIndex:=Count tasks:C335
	End if 
End for 
$_bo_WindowOpen:=False:C215
While (Semaphore:C143("BackupinProgress"))
	If (Not:C34($_bo_WindowOpen))
		$_bo_WindowOpen:=True:C214
		Open window:C153(40; 60; 800; 200)
	End if 
	MESSAGE:C88("Transaction may not start while backup is progress")
	DelayTicks(20)
End while 
If ($_bo_WindowOpen)
	CLOSE WINDOW:C154
End if 

CLEAR SEMAPHORE:C144("BackupinProgress")
//ERR_MethodTrackerReturn ("DelayIfIndexing";$_t_oldMethodName)