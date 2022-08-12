//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_Refresh
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_Refresh ({[Cal4D_Group]ID})
	
	// Downloads the calendar file again to update the subscriptions.
	// If no ID number is passed, all of the calendars are refreshed.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Longint : A [Cal4D_Group] record ID (optional)
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 17, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:31`Method: Cal4D_iCal_Refresh
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_StackSize; $1; $_l_processNumber)
	C_TEXT:C284(<>CAL_t_iCalRefreshProcessName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_Refresh")


Cal4D_Init

If (Count parameters:C259>=1)
	$_l_processNumber:=New process:C317("Cal4D_iCal_Refresh2"; <>CAL_l_StackSize; <>CAL_t_iCalRefreshProcessName; $1)
Else 
	$_l_processNumber:=New process:C317("Cal4D_iCal_Refresh2"; <>CAL_l_StackSize; <>CAL_t_iCalRefreshProcessName)
End if 
ERR_MethodTrackerReturn("Cal4D_iCal_Refresh"; $_t_oldMethodName)