//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Group_Subscribe
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_Subscribe (URL{; user name; password}) --> Number
	
	// Downloads the calendar file with the specified URL and creates
	//  a new [Cal4D_iCal] record.  If you already have a [Cal4D_iCal]
	//   record for the calendar, call Cal4D_iCal_Refresh instead.
	// Sets 4D's Error variable if there's a problem.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Text : The calendar's URL
	//   $2 : Text : Login user name (optional)
	//   $3 : Text : Login password (optional)
	
	// Returns:
	//   $0 : Longint : The new group ID
	
	// Created by Add Komoncharoensiri, 4D, Inc.
	//   Method originally named iCal_Subscribe.
	// Modified by Dave Batton on May 17, 2004
	//   Made the user name and password parameters optional.
	//   Now uses the system's Temporary Items folder rather than
	//   the 4D folder to temporarily save the calendar file.
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:30`Method: Cal4D_Group_Subscribe
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CalendarID; $0)
	C_POINTER:C301(<>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupicalPasswordField; <>Cal_ptr_GroupicalURLField; <>Cal_ptr_GroupicaluserNameField; <>Cal_ptr_GroupTable)
	C_TEXT:C284($_l_CalendarURL; $_t_CalendarName; $_t_oldMethodName; $_t_Password; $_t_Path; $_t_TempFilePath; $_t_UserName; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_Subscribe")


Cal4D_Init

$_l_CalendarURL:=$1
If (Count parameters:C259>=2)
	$_t_UserName:=$2
	$_t_Password:=$3
Else 
	$_t_UserName:=""
	$_t_Password:=""
End if 

Error:=0
$_l_CalendarID:=0  // The record ID of the new [iCal4D_iCal] record.

$_t_TempFilePath:=Cal4D_iCal_DownloadCalendarFile(<>Cal_ptr_GroupicalURLField->; <>Cal_ptr_GroupicaluserNameField->; <>Cal_ptr_GroupicalPasswordField->)
If (Error=0)
	Cal4D_iCal_ImportCalendarFile($_t_TempFilePath; <>Cal_ptr_GroupFld_ID->)
End if 
Cal4D_iCal_DeleteCalendarFile($_t_TempFilePath)

If (Error=0)
	CREATE RECORD:C68(<>Cal_ptr_GroupTable->)
	<>Cal_ptr_GroupFld_ID->:=Sequence number:C244(<>Cal_ptr_GroupTable->)
	<>Cal_ptr_GroupicalURLField->:=$_l_CalendarURL
	<>Cal_ptr_GroupFld_Name->:=$_t_CalendarName
	<>Cal_ptr_GroupicaluserNameField->:=$_t_UserName
	<>Cal_ptr_GroupicalPasswordField->:=$_t_Password
	SAVE RECORD:C53(<>Cal_ptr_GroupTable->)
	$_l_CalendarID:=<>Cal_ptr_GroupFld_ID->
End if 

$0:=$_l_CalendarID
ERR_MethodTrackerReturn("Cal4D_Group_Subscribe"; $_t_oldMethodName)