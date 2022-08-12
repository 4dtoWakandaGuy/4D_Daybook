//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_DocLog
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
	C_BOOLEAN:C305(<>IWS_bo_Log)
	C_LONGINT:C283(<>IWS_l_LogChannel)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_DocLog")
//LOG_SetMethod ("IWS_DocLog")
// IWS_DocLog
// send to log process and statistics
// $1 -> message to send
If (<>IWS_bo_Log=True:C214)
	$_t_Message:=$1
	IPC_SendMessage(<>IWS_l_LogChannel; $_t_Message)
	// CALL PROCESS(Process number(IWS_ks_LogProcess))
End if 

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_DocLog"; $_t_oldMethodName)