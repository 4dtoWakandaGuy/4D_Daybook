//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_FormatEventDisplay
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_FormatEventDisplay (type; title; start time) --> Text
	
	// Returns the text string to be displayed on the calendar.
	// Assumes an event is loaded.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text :
	//   $2 : Text :
	//   $3 : Time :
	
	// Returns:
	//   $0 : Text :
	
	// Created by Dave Batton on Aug 1, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:34`Method: Cal4D_FormatEventDisplay
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_Display; $_t_oldMethodName; $_t_Title; $_t_Type; $0; $1; $2)
	C_TIME:C306($_ti_StartTime; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_FormatEventDisplay")


$_t_Type:=$1
$_t_Title:=$2
$_ti_StartTime:=$3

$_t_Display:=""

If ($_t_Type="Appointment")
	$_t_Display:=String:C10($_ti_StartTime; HH MM AM PM:K7:5)+" "
	$_t_Display:=Replace string:C233($_t_Display; ":00"; "")  // Remove ":00" if it's in there.
	$_t_Display:=Replace string:C233($_t_Display; "M"; "")  // Display just the "a" or "p".
	$_t_Display:=Replace string:C233($_t_Display; " "; "")  // Remove spaces.
	$_t_Display:=Lowercase:C14($_t_Display)
	$_t_Display:=$_t_Display+" "
End if 

$_t_Display:=$_t_Display+$_t_Title

$0:=$_t_Display
ERR_MethodTrackerReturn("Cal4D_FormatEventDisplay"; $_t_oldMethodName)