//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_onServerShutdown
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
	C_BOOLEAN:C305(<>MIR_bo_Quit)
	C_LONGINT:C283($LProcessID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_onServerShutdown")

//  ` Purpose: Handles shutting down the database

// Declare local variables

<>MIR_bo_Quit:=True:C214

$LProcessID:=Process number:C372("MirroringProcess"; *)
If ($LProcessID>0)
	DELAY PROCESS:C323($LProcessID; 0)  // Shut down the mirror process for a clean quit
End if 
//End of method
ERR_MethodTrackerReturn("MIR_onServerShutdown"; $_t_oldMethodName)