//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetHandlerCount
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
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $0; $CurrentHandlers; $i)
	C_TEXT:C284(<>IWS_t_HandlerProcess; $_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetHandlerCount")
//******************************************************************************
//
//Method: IWS_GetHandlerCount
//
//Written by  John Moore on 3/5/01 to help disappearing handler problem
//
//Returns number of active handlers
//******************************************************************************
$CurrentHandlers:=0
For ($i; 1; Count tasks:C335)
	PROCESS PROPERTIES:C336($i; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
	If (($_t_ProcessName=(<>IWS_t_HandlerProcess+"@")) & ($_l_ProcessState>=Executing:K13:4))
		//it's a valid  handler
		$CurrentHandlers:=$CurrentHandlers+1
	End if 
End for 
$0:=$CurrentHandlers
ERR_MethodTrackerReturn("IWS_GetHandlerCount"; $_t_oldMethodName)