//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_SetObjectColors
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
	C_DATE:C307(CAL_d_SelectedDate)
	C_LONGINT:C283(<>CAL_l_DisplayedMonthBoxColor; <>CAL_l_DividerLineColor; <>CAL_l_FirstBox; <>CAL_l_LastBox; <>CAL_l_OtherMonthBoxColor; <>CAL_l_SelectedBoxColor; <>CAL_l_TodayBoxColor; $_l_BoxNumber)
	C_TEXT:C284($_t_BoxName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_SetObjectColors")

// ----------------------------------------------------
// Project Method: Cal4D_SetObjectColors

// Updates the object background colors.

// Access Type: Private

// Parameters: None

// Returns: Nothing

// Created by Dave Batton on May 27, 2004
// ----------------------------------------------------


// Set the background color (the lines between objects).
OBJECT SET RGB COLORS:C628(*; "Cal4D_BackgroundRect"; <>CAL_l_DividerLineColor; <>CAL_l_DividerLineColor)

// Reset all of the boxes to their default color.
For ($_l_BoxNumber; 1; <>CAL_l_FirstBox-1)
	OBJECT SET RGB COLORS:C628(*; "Cal4D_Box"+String:C10($_l_BoxNumber; "000"); Foreground color:K23:1; <>CAL_l_OtherMonthBoxColor)
End for 

For ($_l_BoxNumber; <>CAL_l_FirstBox; <>CAL_l_LastBox)
	OBJECT SET RGB COLORS:C628(*; "Cal4D_Box"+String:C10($_l_BoxNumber; "000"); Foreground color:K23:1; <>CAL_l_DisplayedMonthBoxColor)
End for 

For ($_l_BoxNumber; <>CAL_l_LastBox+1; 42)
	OBJECT SET RGB COLORS:C628(*; "Cal4D_Box"+String:C10($_l_BoxNumber; "000"); Foreground color:K23:1; <>CAL_l_OtherMonthBoxColor)
End for 

// Set the color of today's box.
$_l_BoxNumber:=Cal4D_GetBoxNumberByDate(Current date:C33)
If ($_l_BoxNumber#0)
	OBJECT SET RGB COLORS:C628(*; "Cal4D_Box"+String:C10($_l_BoxNumber; "000"); Foreground color:K23:1; <>CAL_l_TodayBoxColor)
End if 

// Set the color if the selected box.
$_l_BoxNumber:=Cal4D_GetBoxNumberByDate(CAL_d_SelectedDate)
If ($_l_BoxNumber#0)
	OBJECT SET RGB COLORS:C628(*; "Cal4D_Box"+String:C10($_l_BoxNumber; "000"); Foreground color:K23:1; <>CAL_l_SelectedBoxColor)
End if 
ERR_MethodTrackerReturn("Cal4D_SetObjectColors"; $_t_oldMethodName)