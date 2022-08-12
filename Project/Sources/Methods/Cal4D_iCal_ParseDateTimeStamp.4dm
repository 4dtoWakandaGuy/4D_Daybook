//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_ParseDateTimeStamp
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_ParseDateTimeStamp (Date_Time stamp; ->date; ->time)
	
	// Parses a date/time stamp into separate date and time values.
	// Excpects a Date_Time stamp that looks like one of these:
	//   ANYTAG:19970903T163000Z
	//   DTSTART;VALUE=DATE:20030202
	//   19970903T163000Z
	//
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : Date_Time Stamp (with tag is okay)
	//   $2 : Pointer : Receives the date
	//   $3 : Pointer : Receives the time
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 18, 2004
	//   Based on code by Add Komoncharoensiri, 4D, Inc.
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:31`Method: Cal4D_iCal_ParseDateTimeStamp
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Day; $_l_Month; $_l_position; $_l_Year)
	C_POINTER:C301($_ptr_Date; $_ptr_Time; $2; $3)
	C_TEXT:C284($_t_DateSTR; $_t_DateTimeStamp; $_t_oldMethodName; $_t_TimeSTR; $_t_value; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_ParseDateTimeStamp")


$_t_DateTimeStamp:=$1
$_ptr_Date:=$2
$_ptr_Time:=$3

// Remove the tag from the Date_Time stamp.
$_l_position:=Position:C15(":"; $_t_DateTimeStamp)
$_t_value:=Substring:C12($_t_DateTimeStamp; $_l_position+1)

// Break the date and time values into separate strings.
$_l_position:=Position:C15("T"; $_t_value)
If ($_l_position=0)
	$_t_DateSTR:=$_t_value
	$_t_TimeSTR:="00:00:00"
Else 
	$_t_DateSTR:=Substring:C12($_t_value; 1; $_l_position-1)
	$_t_TimeSTR:=Substring:C12($_t_value; $_l_position+1; 6)
	$_t_TimeSTR:=Insert string:C231($_t_TimeSTR; ":"; 3)
	$_t_TimeSTR:=Insert string:C231($_t_TimeSTR; ":"; 6)
End if 

$_l_Year:=Num:C11(Substring:C12($_t_DateSTR; 1; 4))
$_l_Month:=Num:C11(Substring:C12($_t_DateSTR; 5; 2))
$_l_Day:=Num:C11(Substring:C12($_t_DateSTR; 7; 2))

$_ptr_Date->:=Add to date:C393(!00-00-00!; $_l_Year; $_l_Month; $_l_Day)
$_ptr_Time->:=Time:C179($_t_TimeSTR)
ERR_MethodTrackerReturn("Cal4D_iCal_ParseDateTimeStamp"; $_t_oldMethodName)