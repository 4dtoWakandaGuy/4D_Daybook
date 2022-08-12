//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ServerIsRunning
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284(<>IWS_t_LogProcess; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ServerIsRunning")
//******************************************************************************
//
//Method: IWS_ServerIsRunning
//
//Written by  John Moore on 10/13/98
//
//Purpose: returns true if IWS server is running

//
//******************************************************************************

If (Process number:C372(<>IWS_t_LogProcess)>0)
	$0:=True:C214
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("IWS_ServerIsRunning"; $_t_oldMethodName)