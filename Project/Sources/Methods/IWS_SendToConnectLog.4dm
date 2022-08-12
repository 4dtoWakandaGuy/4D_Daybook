//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SendToConnectLog
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
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; $_t_Message; $_t_oldMethodName; $1)
	C_TIME:C306(<>IWS_ti_ConnectDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SendToConnectLog")
$_t_Message:=$1
If (<>IWS_ti_ConnectDoc#?00:00:00?)
	SEND PACKET:C103(<>IWS_ti_ConnectDoc; $_t_Message+<>STR_t_CR+<>STR_t_LF)
End if 
ERR_MethodTrackerReturn("IWS_SendToConnectLog"; $_t_oldMethodName)