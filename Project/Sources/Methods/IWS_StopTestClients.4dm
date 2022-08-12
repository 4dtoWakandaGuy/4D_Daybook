//%attributes = {}

If (False:C215)
	//Project Method Name:      IWS_StopTestClients
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
	C_BOOLEAN:C305(<>IWS_bo_StopTestClients; SYS_bo_NoTrack)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_StopTestClients")

//TRACE
SYS_bo_NoTrack:=True:C214
$_t_oldMethodName:=ERR_MethodTracker("IWS_StopTestClients")
If (KeyCode=27)
	CONFIRM:C162("Stop tests?")
	If (OK=1)
		<>IWS_bo_StopTestClients:=True:C214
	End if 
End if 
SYS_bo_NoTrack:=False:C215
ERR_MethodTrackerReturn("IWS_StopTestClients"; $_t_oldMethodName)