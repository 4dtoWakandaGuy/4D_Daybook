//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_StatusMessage
	//------------------ Method Notes ------------------
	
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_StatusMessage (message)
	
	// Updates the iCal status text in the Subscribe dialog.
	// If no parameter is passed, the status is set to "Idle"
	
	// This message is currently not displayed anywhere, but I left
	//   the code here in case we want to use it again it sometime.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : The new message (optional)
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 17, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:30`Method: Cal4D_iCal_StatusMessage
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_iCalLastStatusUpdate; $_l_Tickcount)
	C_TEXT:C284(<>CAL_t_CalendarProcessName; <>CAL_t_iCalStatus; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_StatusMessage")


If (Count parameters:C259>=1)
	<>CAL_t_iCalStatus:=$1
Else 
	<>CAL_t_iCalStatus:="Idle"  // Localize
End if 

// This just makes sure that all of our status messages are
//   displayed for at least one second.
$_l_Tickcount:=Tickcount:C458-<>CAL_l_iCalLastStatusUpdate
If ($_l_Tickcount<60)
	DELAY PROCESS:C323(Current process:C322; 60-$_l_Tickcount)
End if 
<>CAL_l_iCalLastStatusUpdate:=Tickcount:C458

POST OUTSIDE CALL:C329(Process number:C372(<>CAL_t_CalendarProcessName))
ERR_MethodTrackerReturn("Cal4D_iCal_StatusMessage"; $_t_oldMethodName)