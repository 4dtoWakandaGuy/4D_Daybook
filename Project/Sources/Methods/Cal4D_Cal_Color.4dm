//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_Color
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_Cal_Color (object name{; RGB color}) --> Number
	
	// Allows the developer to set and get the color for a calendar object.
	// The following object names are available:
	//      this_month - background color for all day of the current month
	//      other_month - background color for weekend days
	//      today - the background color for today
	//      selected_day - the background color for the selected day
	//      grid - the grid lines
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Text : A calendar object name
	//   $2 : Longint : An RGB color value
	
	// Returns:
	//   $0 : Longint : An RGB color value
	
	// Created by Dave Batton on Jul 26, 2004
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:36`Method: Cal4D_Cal_Color
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_DisplayedMonthBoxColor; <>CAL_l_DividerLineColor; <>CAL_l_OtherMonthBoxColor; <>CAL_l_SelectedBoxColor; <>CAL_l_TodayBoxColor; $_l_Colour; $0; $2)
	C_TEXT:C284($_t_objectName; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_Color")
$_t_objectName:=$1
If (Count parameters:C259>=2)
	$_l_Colour:=$2
Else 
	$_l_Colour:=-1
End if 

Case of 
	: ($_t_objectName="current_month")
		$_l_Colour:=Cal4D_Cal_Color2(-><>CAL_l_DisplayedMonthBoxColor; $_l_Colour)
		
	: ($_t_objectName="other_month")
		$_l_Colour:=Cal4D_Cal_Color2(-><>CAL_l_OtherMonthBoxColor; $_l_Colour)
		
	: ($_t_objectName="today")
		$_l_Colour:=Cal4D_Cal_Color2(-><>CAL_l_TodayBoxColor; $_l_Colour)
		
	: ($_t_objectName="selected_day")
		$_l_Colour:=Cal4D_Cal_Color2(-><>CAL_l_SelectedBoxColor; $_l_Colour)
		
	: ($_t_objectName="grid")
		$_l_Colour:=Cal4D_Cal_Color2(-><>CAL_l_DividerLineColor; $_l_Colour)
		
	Else 
		Cal4D_Alert("The object name \""+$_t_objectName+"\" was not recognized by the "+Current method name:C684+" method.")
End case 

$0:=$_l_Colour
ERR_MethodTrackerReturn("Cal4D_Cal_Color"; $_t_oldMethodName)