//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_AddSecondsToDateTime
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_AddSecondsToDateTime (->date; ->time; seconds)
	
	// Pass pointers to a date and a time value, and the number of seconds to add.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : Description
	
	// Returns:
	//   $0 : Longint : Description
	
	// Created by Dave Batton on Jun 28, 2004
	// ----------------------------------------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:33`Method: Cal4D_iCal_AddSecondsToDateTime
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Days; $_l_seconds; $3)
	C_POINTER:C301($_ptr_Date; $_ptr_Time; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_AddSecondsToDateTime")


$_ptr_Date:=$1
$_ptr_Time:=$2
$_l_seconds:=$3

$_l_Days:=Trunc:C95($_l_seconds/24/60/60; 0)

$_l_seconds:=$_l_seconds-($_l_Days*24*60*60)  // Now remove the full days, to leave us with the number of seconds remaining.

// Add the days to the date.
$_ptr_Date->:=Add to date:C393($_ptr_Date->; 0; 0; $_l_Days)

// Add the seconds to the time.
$_ptr_Time->:=Time:C179(Time string:C180($_ptr_Time->+$_l_seconds))

// If the time pushes past midnight, roll it over to the next day.
If ($_ptr_Time->>=?24:00:00?)
	$_ptr_Date->:=Add to date:C393($_ptr_Date->; 0; 0; 1)
	$_ptr_Time->:=$_ptr_Time->-?24:00:00?
End if 
ERR_MethodTrackerReturn("Cal4D_iCal_AddSecondsToDateTime"; $_t_oldMethodName)