//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_PlaceDaysOfWeek
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/12/2009 15:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_CalendarRight; <>CAL_l_FirstDayOfWeek; <>CAL_l_CalendarLeft)
	C_TEXT:C284(<>CAL_t_DOWLabel001; <>CAL_t_DOWLabel002; <>CAL_t_DOWLabel003; <>CAL_t_DOWLabel004; <>CAL_t_DOWLabel005; <>CAL_t_DOWLabel006; <>CAL_t_DOWLabel007; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_PlaceDaysOfWeek")

// ----------------------------------------------------
// Project Method: Cal4D_PlaceDaysOfWeek

// Actually, the days of the week objects are placed by the Cal4D_PlaceBoxes method.
// We're actually just providing the label text here.

// Access Type: Private

// Parameters: None

// Returns: Nothing

// Created by Dave Batton on Jun 1, 2004
// ----------------------------------------------------

// Set up the days of the week labels.
// A loop and Get pointer would work too, but we'll keep it simple.
<>CAL_t_DOWLabel001:=Cal4D_GetDayOfWeek(<>CAL_l_FirstDayOfWeek; <>CAL_l_CalendarRight-<>CAL_l_CalendarLeft)
<>CAL_t_DOWLabel002:=Cal4D_GetDayOfWeek(<>CAL_l_FirstDayOfWeek+1; <>CAL_l_CalendarRight-<>CAL_l_CalendarLeft)
<>CAL_t_DOWLabel003:=Cal4D_GetDayOfWeek(<>CAL_l_FirstDayOfWeek+2; <>CAL_l_CalendarRight-<>CAL_l_CalendarLeft)
<>CAL_t_DOWLabel004:=Cal4D_GetDayOfWeek(<>CAL_l_FirstDayOfWeek+3; <>CAL_l_CalendarRight-<>CAL_l_CalendarLeft)
<>CAL_t_DOWLabel005:=Cal4D_GetDayOfWeek(<>CAL_l_FirstDayOfWeek+4; <>CAL_l_CalendarRight-<>CAL_l_CalendarLeft)
<>CAL_t_DOWLabel006:=Cal4D_GetDayOfWeek(<>CAL_l_FirstDayOfWeek+5; <>CAL_l_CalendarRight-<>CAL_l_CalendarLeft)
<>CAL_t_DOWLabel007:=Cal4D_GetDayOfWeek(<>CAL_l_FirstDayOfWeek+6; <>CAL_l_CalendarRight-<>CAL_l_CalendarLeft)

// // Modified by: Charles Vass (02/26/2009, 11:15)
// If the calendar is too small to display full labels, show the first three or one char only.
//Case of
//: ((◊Cal4D_CalendarRight_i-◊Cal4D_i_CalendarLeft)<250)
//◊Cal4D_DOWLabel001_t:=Substring(◊Cal4D_DOWLabel001_t;1;1)
//◊Cal4D_DOWLabel002_t:=Substring(◊Cal4D_DOWLabel002_t;1;1)
//◊Cal4D_DOWLabel003_t:=Substring(◊Cal4D_DOWLabel003_t;1;1)
//◊Cal4D_DOWLabel004_t:=Substring(◊Cal4D_DOWLabel004_t;1;1)
//◊Cal4D_DOWLabel005_t:=Substring(◊Cal4D_DOWLabel005_t;1;1)
//◊Cal4D_DOWLabel006_t:=Substring(◊Cal4D_DOWLabel006_t;1;1)
//◊Cal4D_DOWLabel007_t:=Substring(◊Cal4D_DOWLabel007_t;1;1)
//
//: ((◊Cal4D_CalendarRight_i-◊Cal4D_i_CalendarLeft)<500)
//◊Cal4D_DOWLabel001_t:=Substring(◊Cal4D_DOWLabel001_t;1;3)
//◊Cal4D_DOWLabel002_t:=Substring(◊Cal4D_DOWLabel002_t;1;3)
//◊Cal4D_DOWLabel003_t:=Substring(◊Cal4D_DOWLabel003_t;1;3)
//◊Cal4D_DOWLabel004_t:=Substring(◊Cal4D_DOWLabel004_t;1;3)
//◊Cal4D_DOWLabel005_t:=Substring(◊Cal4D_DOWLabel005_t;1;3)
//◊Cal4D_DOWLabel006_t:=Substring(◊Cal4D_DOWLabel006_t;1;3)
//◊Cal4D_DOWLabel007_t:=Substring(◊Cal4D_DOWLabel007_t;1;3)
//End case
ERR_MethodTrackerReturn("Cal4D_PlaceDaysOfWeek"; $_t_oldMethodName)