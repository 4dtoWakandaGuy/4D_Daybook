//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_LogTimer
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
	C_BOOLEAN:C305(<>IWS_bo_Shutdown)
	C_LONGINT:C283($1; $_l_ProcessID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_LogTimer")
$_l_ProcessID:=$1
Repeat 
	DelayTicks(60)
	POST OUTSIDE CALL:C329($_l_ProcessID)
Until (<>IWS_bo_Shutdown)
ERR_MethodTrackerReturn("IWS_LogTimer"; $_t_oldMethodName)