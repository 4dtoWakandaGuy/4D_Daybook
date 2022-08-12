
If (False:C215)
	//Table Name:      Trigger on [PROCESSES_TO_HANDLE]
	//------------------ Trigger Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:PROCESSES_TO_HANDLE
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PROCESSES_TO_HANDLE]")
$_l_Event:=Trigger event:C369
Case of 
	: ($_l_Event=On Saving Existing Record Event:K3:2)
		If ([PROCESSES_TO_HANDLE:115]TableNumber:1=24) & ([PROCESSES_TO_HANDLE:115]Status:2=2)
			
			//TRACE
		End if 
End case 
//ERR_MethodTrackerReturn ("TRIGGER [PROCESSES_TO_HANDLE]";$_t_oldMethodName)
