//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_MenuBar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 12:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_MenuBar")

// ----------------------------------------------------
// Project Method: Calendar_MenuBar

// Called when the Calendar window is displayed to update the menu bar.
// This is public so that you can specify another menu bar number.

// Access Type: Public

// Parameters: None

// Returns: Nothing

// Created by Dave Batton on Apr 27, 2004
// ----------------------------------------------------

SET MENU BAR:C67(1)
ERR_MethodTrackerReturn("Cal4D_MenuBar"; $_t_oldMethodName)