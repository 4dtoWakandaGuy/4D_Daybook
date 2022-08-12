//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_WaitForHandlerPause
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
	C_BOOLEAN:C305(<>IWS_bo_Shutdown; $_bo_Continue; $HandlerWaiting; $Logged; IWS_bo_HandlerWaiting)
	C_LONGINT:C283($_l_Process; $_l_ProcessState; $_l_ProcessTime; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_WaitForHandlerPause")
//Method: IWS_WaitForHandlerPause
//
//Purpose: Waits for a handler process to be in a paused state
//ready to receive a connection

//$1 - longint, process number of handler process which is pausing


$_l_Process:=$1
$Logged:=False:C215
$_bo_Continue:=False:C215
PROCESS PROPERTIES:C336($_l_Process; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
Repeat 
	If (<>IWS_bo_Shutdown)
		$_bo_Continue:=True:C214  //we need to continue if we're shutting down
	Else 
		//see whether we're paused and ready yet
		GET PROCESS VARIABLE:C371($_l_Process; IWS_bo_HandlerWaiting; $HandlerWaiting)
		If (($HandlerWaiting) & (Process state:C330($_l_Process)=Paused:K13:6))
			$_bo_Continue:=True:C214
		Else 
			DelayTicks(1)
		End if   //  If (($HandlerWaiting) & (Process state($_l_Process)=Paused ))
	End if   //  If (<>IWS_bo_Shutdown)
Until ($_bo_Continue)
//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_WaitForHandlerPause"; $_t_oldMethodName)