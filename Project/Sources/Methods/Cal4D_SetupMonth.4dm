//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_SetupMonth
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 13:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>CAL_d_Box1Date; <>CAL_d_BoxLastDate; $_d_FirstDayOftheMonth)
	C_LONGINT:C283(<>CAL_l_FirstBox; <>CAL_l_LastBox; <>CAL_l_Month; <>CAL_l_Year)
	C_TEXT:C284(<>CAL_t_MonthYear; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_SetupMonth")

// ----------------------------------------------------
// Project Method: Cal4D_SetupMonth

// Set up some IP variables that describe what the calendar looks like for the
//   currently displayed month. We also set the month name and year displayed
//   on the calendar here.

// Access Type: Private

// Parameters: None

// Returns: Nothing

// Created by Dave Batton on May 1, 2004
// ----------------------------------------------------


// Get the first day of the month we're going to display.
$_d_FirstDayOftheMonth:=Cal4D_YearMonthDayToDate(<>CAL_l_Year; <>CAL_l_Month; 1)

// Determine the first and last boxes used to display this month.
<>CAL_l_FirstBox:=Day number:C114($_d_FirstDayOftheMonth)
<>CAL_l_LastBox:=Day of:C23(Cal4D_EndOfMonth($_d_FirstDayOftheMonth))+<>CAL_l_FirstBox-1

// Calculate the dates of the first and last date boxes on the form.
<>CAL_d_Box1Date:=Add to date:C393($_d_FirstDayOftheMonth; 0; 0; 1-<>CAL_l_FirstBox)
If (<>CAL_l_LastBox<=35)
	<>CAL_d_BoxLastDate:=Add to date:C393(<>CAL_d_Box1Date; 0; 0; (5*7)-1)  // A 5 week calendar.
Else 
	<>CAL_d_BoxLastDate:=Add to date:C393(<>CAL_d_Box1Date; 0; 0; (6*7)-1)  // A 6 week calendar.
End if 

<>CAL_t_MonthYear:=Cal4D_MonthName(<>CAL_l_Month)+" "+String:C10(<>CAL_l_Year)
ERR_MethodTrackerReturn("Cal4D_SetupMonth"; $_t_oldMethodName)