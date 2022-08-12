//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45:41//Method Name: ErrorDebugInit
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
End if 
C_LONGINT:C283(<>Err_l_DebugLogStatus)
CONFIRM:C162("Do you want to log actions to clipboard?"; "Yes"; "No")
If (OK=1)
	//TRACE
	<>Err_l_DebugLogStatus:=2
Else 
	//TRACE
	<>Err_l_DebugLogStatus:=1
End if 