//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_SetObjectColor
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_SetObjectColor (->form object; type; start date; color)
	
	// This method will set the foreground and background colors of the specified
	//   object.  The color will be determined by the value of [Calendar]Event Color
	//   and the type of event (banners are colored differently than text events)
	//   unless the optional type and color parameters are passed.
	//   The background color also depends on whether the text item is in the current
	//   month or an adjacent month.
	// Assumes a [Cal4D_Event] record is loaded.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : The form object to modify
	//   $2 : Text : The event type
	//   $3 : Date : The start date
	//   $4 : Longint : The color to use
	
	// Returns:
	//   $0 : Longint : Description
	
	// Created by Dave Batton on Jul 26, 2004
	//------------------ Revision Control ----------------
	//Date Created: 20/12/2009 14:33`Method: Cal4D_SetObjectColor
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_StartDate; $3; CAL_d_SelectedDate)
	C_LONGINT:C283(<>CAL_l_DisplayedMonthBoxColor; <>CAL_l_Month; <>CAL_l_OtherMonthBoxColor; <>CAL_l_SelectedBoxColor; <>CAL_l_TodayBoxColor; $_l_BackgroundColour; $_l_colour; $_l_ForegroundColour; $4)
	C_POINTER:C301(<>CAL_ptr_SelectedObject; $_ptr_FormObject; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_Type; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_SetObjectColor")

$_ptr_FormObject:=$1
$_t_Type:=$2
$_d_StartDate:=$3
$_l_colour:=$4

// A default, in case we don't set these otherwise in the code below.
$_l_ForegroundColour:=Foreground color:K23:1


If ($_t_Type="Banner")
	$_l_ForegroundColour:=0x00FFFFFF
	If ($_ptr_FormObject=<>CAL_ptr_SelectedObject)  // We use this color on the drag area of banners.
		$_l_BackgroundColour:=Cal4D_Util_ModifyColor($_l_colour; -0x0033)
	Else 
		$_l_BackgroundColour:=$_l_colour
	End if 
	
Else   // It's a text event.
	Case of 
		: ($_d_StartDate=CAL_d_SelectedDate)
			$_l_BackgroundColour:=<>CAL_l_SelectedBoxColor
		: ($_d_StartDate=Current date:C33)
			$_l_BackgroundColour:=<>CAL_l_TodayBoxColor
		: (Month of:C24($_d_StartDate)=<>CAL_l_Month)  // The date is in the selected month.
			$_l_BackgroundColour:=<>CAL_l_DisplayedMonthBoxColor
		Else 
			$_l_BackgroundColour:=<>CAL_l_OtherMonthBoxColor
	End case 
	
	$_l_ForegroundColour:=$_l_colour
End if 

OBJECT SET RGB COLORS:C628($_ptr_FormObject->; $_l_ForegroundColour; $_l_BackgroundColour)
ERR_MethodTrackerReturn("Cal4D_SetObjectColor"; $_t_oldMethodName)