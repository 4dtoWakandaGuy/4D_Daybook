//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_GetBoxNumberByCoordinates
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_GetBoxNumberByCoordinates (x; y) --> Number
	
	// Figure out which box is in the position of the specified x & y coordinates.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : The horizontal screen coordinate
	//   $2 : Longint : The vertical screen coordinate
	
	// Returns:
	//   $0 : Longint : The box number at that position
	
	// Created by Dave Batton on May 25, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:34`Method: Cal4D_GetBoxNumberByCoordinates
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_DisplayDaysOfTheWeek)
	C_LONGINT:C283(<>CAL_l_BoxHeight; <>CAL_l_BoxWidth; <>CAL_l_CalendarBottom; <>CAL_l_CalendarLeft; <>CAL_l_CalendarRight; <>CAL_l_CalendarTop; <>CAL_l_ColumnHeight; <>CAL_l_ColumnWidth; <>CAL_l_DOWHeight; $_l_Box; $_l_CalendarTop)
	C_LONGINT:C283($_l_Column; $_l_ObjectLeft; $_l_ObjectTop; $_l_Row; $0; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_GetBoxNumberByCoordinates")


$_l_ObjectLeft:=$1
$_l_ObjectTop:=$2

$_l_Box:=0

$_l_CalendarTop:=<>CAL_l_CalendarTop+Cal4D_HeaderHeight+(<>CAL_l_DOWHeight*Num:C11(<>Cal_bo_DisplayDaysOfTheWeek))

// First check to see if the mouse is over the calendar area.
If (($_l_ObjectLeft>=<>CAL_l_CalendarLeft) & ($_l_ObjectLeft<=<>CAL_l_CalendarRight) & ($_l_ObjectTop>=$_l_CalendarTop) & ($_l_ObjectTop<=<>CAL_l_CalendarBottom))
	// Then do some simple math to determine which box the cursor is over.
	$_l_Column:=Trunc:C95(($_l_ObjectLeft-<>CAL_l_CalendarLeft)/(<>CAL_l_BoxWidth+<>CAL_l_ColumnWidth); 0)+1
	$_l_Row:=Trunc:C95(($_l_ObjectTop-$_l_CalendarTop)/(<>CAL_l_BoxHeight+<>CAL_l_ColumnHeight); 0)+1
	$_l_Box:=(($_l_Row-1)*7)+$_l_Column
End if 

$0:=$_l_Box
ERR_MethodTrackerReturn("Cal4D_GetBoxNumberByCoordinates"; $_t_oldMethodName)