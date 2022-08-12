//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_PlaceMonthYearText
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
	C_BOOLEAN:C305(<>Cal_bo_CalisVisible; <>Cal_bo_DisplayMonthYearText; <>Cal_bo_DisplayNavButtons)
	C_LONGINT:C283(<>CAL_l_CalendarLeft; <>CAL_l_CalendarRight; <>CAL_l_CalendarTop; $_l_HeaderHeight; $_l_MonthHorizontalOffset; $_l_MonthVerticallOffset)
	C_TEXT:C284(<>CAL_t_MonthYear; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_PlaceMonthYearText")

// ----------------------------------------------------
// Project Method: Cal4D_PlaceMonthYearText

// Positions or hides the month and year name.

// Access Type: Private

// Parameters: None

// Returns: Nothing

// Created by Dave Batton on May 27, 2004
// ----------------------------------------------------


If (<>Cal_bo_DisplayMonthYearText)
	$_l_HeaderHeight:=Cal4D_HeaderHeight
	OBJECT MOVE:C664(*; "Cal4D_HeaderBackgroundRect"; <>CAL_l_CalendarLeft; <>CAL_l_CalendarTop; <>CAL_l_CalendarRight; <>CAL_l_CalendarTop+$_l_HeaderHeight; *)
	
	$_l_MonthVerticallOffset:=5
	$_l_MonthHorizontalOffset:=16  // Match this value to the $hGap_i value in Cal4D_PlaceNavButtons.
	OBJECT MOVE:C664(<>CAL_t_MonthYear; <>CAL_l_CalendarLeft+$_l_MonthHorizontalOffset; <>CAL_l_CalendarTop+$_l_MonthVerticallOffset; <>CAL_l_CalendarRight-$_l_MonthHorizontalOffset; <>CAL_l_CalendarTop+$_l_HeaderHeight; *)
	OBJECT SET VISIBLE:C603(<>CAL_t_MonthYear; <>Cal_bo_CalisVisible)
	
	If ((<>Cal_bo_DisplayNavButtons) & ((<>CAL_l_CalendarRight-<>CAL_l_CalendarLeft)<500))  // If the width gets too small, move the month and year to the left to leave room for the nav buttons.
		OBJECT SET HORIZONTAL ALIGNMENT:C706(<>CAL_t_MonthYear; Align left:K42:2)
	Else 
		OBJECT SET HORIZONTAL ALIGNMENT:C706(<>CAL_t_MonthYear; Align center:K42:3)
	End if 
	
Else 
	OBJECT SET VISIBLE:C603(<>CAL_t_MonthYear; False:C215)
End if 
ERR_MethodTrackerReturn("Cal4D_PlaceMonthYearText"; $_t_oldMethodName)