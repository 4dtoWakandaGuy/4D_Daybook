//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SendToLog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>IWS_bo_LogCacheing; <>IWS_bo_MessageLogging; $_bo_Flush; $2)
	C_LONGINT:C283(<>IWS_l_LoggedMessages; <>IWS_l_MaxLoggedMessages; $_l_ProcessState; $_l_ProcessTime)
	C_TEXT:C284(<>IWS_t_LogMessage; <>STR_t_CR; <>STR_t_LF; $_t_Method; $_t_oldMethodName; $_t_ProcessName; $_t_Semaphore; $1; IWS_t_LogMessage)
	C_TIME:C306(<>IWS_ti_Doc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SendToLog")
//IWS_t_CurrentMethodName:="IWS_SendToLog"

$_t_Method:=""  //LOG_s_MethodName  `we need to capture it before clearing

//LOG_SetMethod ("IWS_SendToLog")

If (Count parameters:C259=2)
	$_bo_Flush:=$2
Else 
	$_bo_Flush:=False:C215
End if 

PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)

If (<>IWS_ti_Doc#?00:00:00?) & (<>IWS_bo_MessageLogging)
	IWS_t_LogMessage:=$1
	$_t_Semaphore:=""
	If (<>IWS_bo_LogCacheing)
		$_t_Semaphore:="$WriteToLog"
		If (UTI_Semaphore($_t_Semaphore))
			
			<>IWS_t_LogMessage:=<>IWS_t_LogMessage+IWS_t_LogMessage
			<>IWS_l_LoggedMessages:=<>IWS_l_LoggedMessages+1
			If ((<>IWS_l_LoggedMessages><>IWS_l_MaxLoggedMessages) | ($_bo_Flush))  //we want any unflushed messages ` Axel 2/7/2001 fixed ( )
				$_t_Semaphore:=<>IWS_t_LogMessage
				<>IWS_t_LogMessage:=""
				<>IWS_l_LoggedMessages:=0
			Else 
				<>IWS_t_LogMessage:=<>IWS_t_LogMessage+<>STR_t_CR+<>STR_t_LF
			End if 
			UTI_ClearSemaphore($_t_Semaphore)
		End if 
	Else 
		$_t_Semaphore:=IWS_t_LogMessage
	End if 
	If ($_t_Semaphore#"")
		SEND PACKET:C103(<>IWS_ti_Doc; STR_ParamBlock(String:C10(SYS_Sequence); String:C10(0); $_t_ProcessName; String:C10(Current process:C322); IWS_t_LogMessage; SYS_GetCurrentTime; $_t_Method)+<>STR_t_CR+<>STR_t_LF)
	End if 
End if 
//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_SendToLog"; $_t_oldMethodName)