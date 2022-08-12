//%attributes = {}
If (False:C215)
	//Project Method Name:      DelayIfProcessRunning
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ProcessVisible)
	C_LONGINT:C283($_l_Process; $_l_ProcessOrigin; $_l_ProcessState; $_l_ProcessTime; $_l_TaskIndex; $_l_UniqueProcessID)
	C_TEXT:C284($_t_CheckingProcessName; $_t_oldMethodName; $_t_processName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DelayIfProcessRunning")

If (Count parameters:C259>0)
	If ($1#"")
		$_t_CheckingProcessName:=$1
		
		For ($_l_TaskIndex; 1; Count tasks:C335)
			PROCESS PROPERTIES:C336($_l_TaskIndex; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
			//NG June 2004
			If ($_t_processName=$_t_CheckingProcessName) & ($_l_ProcessState>=0)  //asked Process is running so delay this process until indexing finishes
				If (Db_Testing)
					MESSAGE:C88($_t_CheckingProcessName+" is running so everything in "+Process_Name(Current process:C322)+" is delayed!")
				End if 
				Repeat   //Delay until the asked process finishes or doesn't exsit
					IDLE:C311
					DelayTicks(60*30)  //might be called from user customer proc u see
					PROCESS PROPERTIES:C336($_l_TaskIndex; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
				Until ((Process aborted:C672) | ($_l_ProcessState<0))
			End if 
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("DelayIfProcessRunning"; $_t_oldMethodName)