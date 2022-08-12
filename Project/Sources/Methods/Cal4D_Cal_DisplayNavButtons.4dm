//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_DisplayNavButtons
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Cal_DisplayNavButtons (display?) --> Boolean
	
	// Allows the developer to get and set the navigation button settings.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Boolean : True to display the day of the week
	
	// Returns:
	//   $0 : Longint : True if the day of the week are set to display
	
	// Created by Dave Batton on Jun 1, 2004
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:23`Method: Cal4D_Cal_DisplayNavButtons
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_DisplayNavButtons; $0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_DisplayNavButtons")

Cal4D_Init

If (Count parameters:C259>=1)
	<>Cal_bo_DisplayNavButtons:=$1
	Cal4D_Cal_Redraw
End if 

$0:=<>Cal_bo_DisplayNavButtons
ERR_MethodTrackerReturn("Cal4D_Cal_DisplayNavButtons"; $_t_oldMethodName)