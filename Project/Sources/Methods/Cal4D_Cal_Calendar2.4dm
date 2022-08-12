//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_Calendar2
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_Cal_Calendar2
	
	// Called from Cal4D_Cal_OpenWindow as a new process to open the calendar window.
	
	// Access Type: Private
	
	// Parameters: None
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 1, 2004
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:53`Method: Cal4D_Cal_Calendar2
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_CalendarWindowRef)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_Calendar2")

Cal4D_Init

READ ONLY:C145(*)  // Unless we say otherwise, don't lock any records.

//Cal4D_MenuBar   ` Update the menu bar.

<>CAL_l_CalendarWindowRef:=Open form window:C675("Cal4D_Cal_Calendar_Mini"; Palette form window:K39:9; Horizontally centered:K39:1; Vertically centered:K39:4; *)
DIALOG:C40("Cal4D_Cal_Calendar_Mini")
CLOSE WINDOW:C154(<>CAL_l_CalendarWindowRef)
ERR_MethodTrackerReturn("Cal4D_Cal_Calendar2"; $_t_oldMethodName)