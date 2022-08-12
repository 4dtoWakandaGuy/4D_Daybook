//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_UpdateEvents
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_EventUpdateNeeded)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime)
	C_POINTER:C301(CAL_Ptr_4DCalendarDay; CAL_ptr_4DCalendarWeek; CAL_ptr_4DFullCalendar; CAL_ptr_BannerDay; CAL_ptr_BannerWeek)
	C_TEXT:C284(<>CAL_t_FullAndMinisProcName; $_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_UpdateEvents")

// ----------------------------------------------------
// Project Method: Cal4D_Cal_Update

// Tells the calendar window (if it's open) to update its events.

// Access Type: Private

// Parameters: None

// Returns: Nothing

// Created by Dave Batton on Apr 30, 2004
// // Modified by: Charles Vass (04/23/2009, 11:22)
// ----------------------------------------------------

Cal4D_Init

PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
If (<>CAL_t_FullAndMinisProcName=$_t_ProcessName)
	<>Cal_bo_EventUpdateNeeded:=True:C214
	POST OUTSIDE CALL:C329(Current process:C322)
Else 
	If (Not:C34(Is nil pointer:C315(CAL_ptr_4DFullCalendar)))
		Cal4D_Cal_GetFullCalendar(CAL_ptr_4DFullCalendar)
	End if 
	If (Not:C34(Is nil pointer:C315(CAL_ptr_4DCalendarWeek)))
		Cal4D_Cal_GetWeekCalendar(CAL_ptr_4DCalendarWeek; CAL_ptr_BannerWeek)
	End if 
	If (Not:C34(Is nil pointer:C315(CAL_Ptr_4DCalendarDay)))
		Cal4D_Cal_GetDayCalendar(CAL_Ptr_4DCalendarDay; CAL_ptr_BannerDay)
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_UpdateEvents"; $_t_oldMethodName)