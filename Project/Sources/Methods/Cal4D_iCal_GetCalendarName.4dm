//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_GetCalendarName
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_GetCalendarName (file name) --> Text
	
	// Extracts the name of the calendar from the give path or file name.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : A full path name
	
	// Returns:
	//   $0 : Text : The calendar name
	
	// Created by Add Komoncharoensiri, 4D, Inc.
	//   Method originally named iCal_GetCalendarName.
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:32`Method: Cal4D_iCal_GetCalendarName
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_DocumentName; $_t_oldMethodName; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_GetCalendarName")


$_t_DocumentName:=$1

$_t_DocumentName:=Cal4D_iCal_GetFileName($_t_DocumentName)

// iCal uses "32" instead of spaces. Convert these back to spaces.
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "32"; " ")

// Remove the file extension (if any).
$_t_DocumentName:=Replace string:C233($_t_DocumentName; ".ics"; "")

$0:=$_t_DocumentName
ERR_MethodTrackerReturn("Cal4D_iCal_GetCalendarName"; $_t_oldMethodName)