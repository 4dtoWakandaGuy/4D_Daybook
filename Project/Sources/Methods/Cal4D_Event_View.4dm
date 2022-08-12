//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_View
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Event_View (event ID)
	
	// Displays the specified event record in read-only mode.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Longint : The event ID number
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 21, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:34`Method: Cal4D_Event_View
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_eventID; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_View")
$_l_eventID:=$1
READ ONLY:C145([DIARY:12])
QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$_l_eventID)

If (Records in selection:C76([DIARY:12])=1)
	//SD2_SetInputForm("Schedule";[DIARY]Action_Code)
	
	//$windowRef_i:=Cal4D_CenterWindow ("Cal4D_Event_d";Sheet form window )
	//DIALOG("Cal4D_Event_d")
	//CLOSE WINDOW($windowRef_i)
End if 
ERR_MethodTrackerReturn("Cal4D_Event_View"; $_t_oldMethodName)