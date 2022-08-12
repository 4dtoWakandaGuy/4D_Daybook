//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_WaitForProcessPause
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
	C_BOOLEAN:C305(<>IWS_bo_Shutdown; $Logged)
	C_LONGINT:C283($_l_Process; $_l_ProcessState; $_l_ProcessTime; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_WaitForProcessPause")
//******************************************************************************
//
//Method: IWS_WaitForProcessPause
//
//Written by  John Moore on 10/28/98
//
//Purpose: Waits for a process to be paused
//
//$1 - longint, process number of process which is pausing

//******************************************************************************

$_l_Process:=$1
PROCESS PROPERTIES:C336($_l_Process; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)

$Logged:=False:C215
While (Process state:C330($_l_Process)#Paused:K13:6) & (Not:C34(<>IWS_bo_Shutdown))
	If (Not:C34($Logged))
		// IWS_SendToLog ("Waiting for process "+$_t_ProcessName+" to pause")
		$Logged:=True:C214
	End if 
	DelayTicks(1)
End while 
ERR_MethodTrackerReturn("IWS_WaitForProcessPause"; $_t_oldMethodName)