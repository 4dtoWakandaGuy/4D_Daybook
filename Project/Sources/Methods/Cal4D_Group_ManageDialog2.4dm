//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_Group_ManageDialog2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 11:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_windowReference)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_ManageDialog2")

// ----------------------------------------------------
// Project Method: Cal4D_Group_ManageDialog2

// Called by Cal4D_Group_ManageDialog as a new process.
// Construct arrays to contain all subscribed iCalendar
// Launch iCal Subscriber
// Update the calendar

// Access Type: Private

// Parameters: None

// Returns: Nothing

// Created by Dave Batton
// Based on code by Add Komoncharoensiri, 4D, Inc.
// ----------------------------------------------------


//Cal4D_MenuBar

READ ONLY:C145(*)  // Unless we say otherwise, don't lock any records.

$_l_windowReference:=Open form window:C675("Cal4D_Group_ManageDialog"; Sheet form window:K39:12; Horizontally centered:K39:1; Vertically centered:K39:4)
DIALOG:C40("Cal4D_Group_ManageDialog")
CLOSE WINDOW:C154($_l_windowReference)
ERR_MethodTrackerReturn("Cal4D_Group_ManageDialog2"; $_t_oldMethodName)