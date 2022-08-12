//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_Calendar
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_Cal_Calendar
	
	// Opens the Calendar window in a new process.  If the calendar is
	//   already open, it is brought to the front.
	// Parts of this calendar are based on the an example posted in the
	//   ACIUS forum on CompuServe (many years ago) by Lee Hinde.
	
	// Access Type: Protected
	
	// Parameters: None
	
	// Returns: Nothing
	
	// Created by Dave Batton on Apr 27, 2004
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:49`Method: Cal4D_Cal_Calendar
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_CalendarWindowRef; $_i_processNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_Calendar")

If (Application type:C494#4D Server:K5:6)  // This shouldn't be called from 4D Server.
	Cal4D_Init
	
	// // Modified by: Charles Vass (02/26/2009, 18:33)
	// // Moving to a process self start method
	// //
	//If (Shell_SelfStart($_t_MethodName;"Cal4D_Calendar"))
	BRING TO FRONT:C326(Current process:C322)
	READ ONLY:C145(*)  // Unless we say otherwise, don't lock any records.
	
	//Cal4D_MenuBar   ` Update the menu bar.
	<>CAL_l_CalendarWindowRef:=Open form window:C675("Cal4D_Cal_CalendarWithMinis_d"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4; *)
	
	//◊Cal4D_i_CalendarWindowRef:=Open form window("Cal4D_Cal_Calendar";Plain form window ;Horizontally Centered ;Vertically Centered ;*)
	DIALOG:C40("Cal4D_Cal_CalendarWithMinis_d")
	CLOSE WINDOW:C154(<>CAL_l_CalendarWindowRef)
	<>CAL_l_CalendarWindowRef:=0
	
	// // Modified by: Charles Vass (02/26/2009, 18:34)
	//$_i_processNumber:=New Process("Cal4D_Cal_Calendar2";◊Cal4D_StackSize_i;"Cal4D_Calendar";*)
	//BRING TO FRONT($_i_processNumber)
	//End if
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_Calendar"; $_t_oldMethodName)