//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_DisplayedDate
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_Cal_DisplayedDate ({date}) --> Date
	
	// Allows the user to set and get the month and year displayed by the calendar.
	// Any date can be passed to this routine, but it will always return the first
	//   day of the displayed month and year.
	// Call Cal4D_Cal_SelectedDate after calling this to highlight the date (if desired).
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Date : The date to display on the calendar
	
	// Returns: Nothing
	//   $0 : Date : The date currently displayed
	
	// Created by Dave Batton on May 25, 2004
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:22`Method: Cal4D_Cal_DisplayedDate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_MonthUpdateNeeded)
	C_DATE:C307($0; $1; $_d_Date)
	C_LONGINT:C283(<>CAL_l_Month; <>CAL_l_Year)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_DisplayedDate")

Cal4D_Init

If (Count parameters:C259>=1)
	$_d_Date:=$1
	If ($_d_Date#!00-00-00!)
		If ((Month of:C24($_d_Date)#<>CAL_l_Month) | (Year of:C25($_d_Date)#<>CAL_l_Year))
			<>CAL_l_Month:=Month of:C24($_d_Date)
			<>CAL_l_Year:=Year of:C25($_d_Date)
			<>Cal_bo_MonthUpdateNeeded:=True:C214
			Cal4D_Cal_Redraw
		End if 
	End if 
End if 

$0:=Cal4D_YearMonthDayToDate(<>CAL_l_Year; <>CAL_l_Month; 1)
ERR_MethodTrackerReturn("Cal4D_Cal_DisplayedDate"; $_t_oldMethodName)