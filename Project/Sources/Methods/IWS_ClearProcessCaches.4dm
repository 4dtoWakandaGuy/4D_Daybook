//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ClearProcessCaches
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
	C_BOOLEAN:C305($_bo_ProcessVisible)
	C_LONGINT:C283(<>IWS_l_HandlerOffset; $_l_ProcessState; $_l_ProcessTime; $HandlerChannel; $i)
	C_TEXT:C284(<>IWS_t_HandlerProcess; $_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ClearProcessCaches")

//******************************************************************************
//
//Method: IWS_ClearProcessCaches
//
//Written by  Rollo on 12/1/98
//
//Purpose: Clear the IWS local process caches

//******************************************************************************


For ($i; 1; Count tasks:C335)
	PROCESS PROPERTIES:C336($i; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
	If ($_t_ProcessName=(<>IWS_t_HandlerProcess+"@")) & ($_l_ProcessState>=0)  //currently running IWS Handler
		$HandlerChannel:=$i+<>IWS_l_HandlerOffset
		IPC_SendMessage($HandlerChannel; "CLEAR CACHES")
	End if 
	IDLE:C311
End for 
ERR_MethodTrackerReturn("IWS_ClearProcessCaches"; $_t_oldMethodName)