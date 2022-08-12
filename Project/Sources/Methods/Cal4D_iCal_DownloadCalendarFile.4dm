//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_DownloadCalendarFile
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_DownloadCalendarFile (URL{; user name; password}) --> Text
	
	// Downloads the specified calendar file. Returns the path to the calendar file, or
	//   an empty string if the file couldn't be downloaded.
	// Also sets the Error varilable if there's a problem.
	// Normally you'll want to call Cal4D_iCal_Subscribe to create a new subscription, or
	//   Cal4D_iCal_Refresh to refresh an existing calendar. Those routines will call this
	//   one for you.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : The calendar's URL
	//   $2 : Text : Login user name (optional)
	//   $3 : Text : Login password (optional)
	
	// Returns:
	//   $0 : Text : The path to the downloaded calendar file
	
	// Created by Dave Batton on May 18, 2004
	// Based on code by Add Komoncharoensiri, 4D, Inc.
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:33`Method: Cal4D_iCal_DownloadCalendarFile
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FirstSlash; $_l_URLLength)
	C_TEXT:C284($_t_CalendarFileName; $_t_CalendarURL; $_t_Host; $_t_oldMethodName; $_t_Password; $_t_Path; $_t_Target; $_t_TempFilePath; $_t_UserName; $0; $1)
	C_TEXT:C284($2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_DownloadCalendarFile")


$_t_CalendarURL:=$1
If (Count parameters:C259>=3)
	$_t_UserName:=$2
	$_t_Password:=$3
Else 
	$_t_UserName:=""
	$_t_Password:=""
End if 

Error:=0

If (($_t_CalendarURL="http://@") | ($_t_CalendarURL="https://@") | ($_t_CalendarURL="webcal://@"))
	$_l_URLLength:=Length:C16($_t_CalendarURL)
	
	Repeat 
		If ($_t_CalendarURL[[$_l_URLLength]]="/")
			$_t_CalendarFileName:=Substring:C12($_t_CalendarURL; $_l_URLLength+1; Length:C16($_t_CalendarURL)-$_l_URLLength)
			$_l_URLLength:=0
		Else 
			$_l_URLLength:=$_l_URLLength-1
		End if 
	Until ($_l_URLLength<=0)
	
	$_t_CalendarFileName:=Cal4D_iCal_GetFileName($_t_CalendarURL)
	$_t_TempFilePath:=Temporary folder:C486+$_t_CalendarFileName
	
	If (($_t_TempFilePath#"") & ($_t_CalendarFileName#""))
		If ($_t_CalendarURL="webcal://@")
			$_t_CalendarURL:=Replace string:C233($_t_CalendarURL; "webcal://"; "http://"; 1)
		End if 
		
		If ($_t_CalendarURL="@://ical.mac.com@")
			$_t_CalendarURL:=Replace string:C233($_t_CalendarURL; "://ical.mac.com"; "://homepage.mac.com"; 1)
			$_t_CalendarURL:=Replace string:C233($_t_CalendarURL; $_t_CalendarFileName; ".calendars/"+$_t_CalendarFileName; 1)
		End if 
		
		$_t_CalendarURL:=Replace string:C233($_t_CalendarURL; "http://"; ""; 1)
		
		$_l_FirstSlash:=Position:C15("/"; $_t_CalendarURL)
		$_t_Host:="http://"+Substring:C12($_t_CalendarURL; 1; $_l_FirstSlash-1)
		$_t_Path:=Substring:C12($_t_CalendarURL; $_l_FirstSlash+1)
		$_t_Target:=$_t_Host+":80/"+Cal4D_iCal_WDAV_URLEncoder($_t_Path)
		Cal4D_iCal_WDAV_DownloadFile($_t_TempFilePath; $_t_Target; $_t_UserName+":"+$_t_Password)
		
	Else 
		Error:=19330  // Invalid URL.
	End if 
Else 
	Error:=19330  // Invalid URL.
End if 

$0:=$_t_TempFilePath
ERR_MethodTrackerReturn("Cal4D_iCal_DownloadCalendarFile"; $_t_oldMethodName)