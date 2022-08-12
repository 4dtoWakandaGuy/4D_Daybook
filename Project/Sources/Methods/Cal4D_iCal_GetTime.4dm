//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_GetTime
	//------------------ Method Notes ------------------
	// Project Method: iCal_GetTime
	// Description: Remove : from the time string and return it as the result
	//
	// Author: Add Komoncharoensiri - 4D, Inc.
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:32`Method: Cal4D_iCal_GetTime
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
	C_TIME:C306($1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_GetTime")

$0:=Replace string:C233(String:C10($1); ":"; "")
ERR_MethodTrackerReturn("Cal4D_iCal_GetTime"; $_t_oldMethodName)