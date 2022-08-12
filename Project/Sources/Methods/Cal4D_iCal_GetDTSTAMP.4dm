//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_GetDTSTAMP
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_GetDTSTAMP
	
	// Return the iCal time stamp.
	
	// Access Type: Private
	
	// Parameters: None
	
	// Returns:
	//   $0 : Text : A date-time stamp
	
	// Created by Add Komoncharoensiri, 4D, Inc.
	//   Method originally named iCal_GetDTSTAMP.
	// ----------------------------------------------------
	//// Modified by: Charles Vass (02/24/2009, 17:11)
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:32`Method: Cal4D_iCal_GetDTSTAMP
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0; $String_A19)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_GetDTSTAMP")

$String_A19:=Substring:C12(String:C10(Current date:C33(*); ISO date:K1:8); 1; 11)+Substring:C12(String:C10(Current time:C178(*); ISO time:K7:8); 12)
$0:=$String_A19
ERR_MethodTrackerReturn("Cal4D_iCal_GetDTSTAMP"; $_t_oldMethodName)