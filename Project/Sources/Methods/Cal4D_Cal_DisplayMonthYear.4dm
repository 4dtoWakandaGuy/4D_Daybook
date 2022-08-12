//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_DisplayMonthYear
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_CAl_DisplayMonthYear (display?) --> Boolean
	
	// Allows the developer to get and set the Month and Year label option.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Boolean : True to display the month and year
	
	// Returns:
	//   $0 : Longint : True if the month and year are set to display
	
	// Created by Dave Batton on May 28, 2004
	// ----------------------------------------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:22`Method: Cal4D_Cal_DisplayMonthYear
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_DisplayMonthYearText; $0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_DisplayMonthYear")


Cal4D_Init

If (Count parameters:C259>=1)
	<>Cal_bo_DisplayMonthYearText:=$1
	Cal4D_Cal_Redraw
End if 

$0:=<>Cal_bo_DisplayMonthYearText
ERR_MethodTrackerReturn("Cal4D_Cal_DisplayMonthYear"; $_t_oldMethodName)