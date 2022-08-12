//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_StopRestart
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
	C_BOOLEAN:C305(<>IWS_bo_RestartServer)
	C_TEXT:C284($_t_oldMethodName; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_StopRestart")
//******************************************************************************
//
//Method: IWS_StopRestart
//
//Written by  John Moore on 10/19/98
//
//Purpose: Little ON EVENT CALL method
//
//
IWS_t_CurrentMethodName:="IWS_StopRestart"
//
//******************************************************************************
If (Keycode=27)
	<>IWS_bo_RestartServer:=False:C215
End if 
ERR_MethodTrackerReturn("IWS_StopRestart"; $_t_oldMethodName)