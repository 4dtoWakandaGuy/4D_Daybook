//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_PlaceBoxes
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
	C_BOOLEAN:C305(<>Cal_bo_CalisVisible; <>Cal_bo_DisplayDaysOfTheWeek; <>Cal_bo_DisplayOutermostLines)
	C_LONGINT:C283(<>CAL_l_BoxHeight; <>CAL_l_BoxWidth; <>CAL_l_CalendarBottom; <>CAL_l_CalendarLeft; <>CAL_l_CalendarRight; <>CAL_l_CalendarTop; <>CAL_l_ColumnHeight; <>CAL_l_ColumnWidth; <>CAL_l_DOWHeight; <>CAL_l_DOWVOffset; <>CAL_l_LastBox)
	C_LONGINT:C283($_l_BottomBoundary; $_l_BoxAreaHeight; $_l_BoxAreaWidth; $_l_BoxBottom; $_l_BoxLeft; $_l_BoxRight; $_l_BoxTop; $_l_ColumnIndex; $_l_DowBottom; $_l_DowHeight; $_l_DowTop)
	C_LONGINT:C283($_l_HeightPixelsShort; $_l_LeftBoundary; $_l_ObjectNumber; $_l_RightBoundary; $_l_RowIndex; $_l_RowsNeeded; $_l_TopBoundary; $_l_widthPixelsShort)
	C_TEXT:C284($_t_ObjectNumber; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_PlaceBoxes")

// ----------------------------------------------------
// Project Method: Cal4D_PlaceBoxes

// This method moves around the boxes (text variables without text) and the
//   numbers on top of them.
// Places the days of the week at the top if the developer has enabled that option.
// Moves the background into position, which appears as the grid lines.

// Access Type: Private

// Parameters: None

// Returns: Nothing

// Created by Dave Batton on May 28, 2004
// ----------------------------------------------------


// Get the rect into which we'll be drawing the boxes (not including the days of the week labels).
// If there's a header, the header routines draw the line bove the days of the week.
$_l_TopBoundary:=<>CAL_l_CalendarTop+Cal4D_HeaderHeight
If (<>Cal_bo_DisplayOutermostLines)
	$_l_LeftBoundary:=<>CAL_l_CalendarLeft
	$_l_RightBoundary:=<>CAL_l_CalendarRight
	$_l_BottomBoundary:=<>CAL_l_CalendarBottom
Else 
	$_l_LeftBoundary:=<>CAL_l_CalendarLeft-1
	$_l_RightBoundary:=<>CAL_l_CalendarRight+1
	$_l_BottomBoundary:=<>CAL_l_CalendarBottom+1
End if 

$_l_BoxAreaWidth:=$_l_RightBoundary-$_l_LeftBoundary  // The width of the area in which we'll draw boxes.
If (<>Cal_bo_DisplayDaysOfTheWeek)
	$_l_BoxAreaHeight:=$_l_BottomBoundary-$_l_TopBoundary-<>CAL_l_DOWHeight
	OBJECT SET VISIBLE:C603(*; "Cal4D_DOW@"; <>Cal_bo_CalisVisible)
	$_l_DowHeight:=<>CAL_l_DOWHeight
Else 
	$_l_BoxAreaHeight:=$_l_BottomBoundary-$_l_TopBoundary  // The height of the area in which we'll draw boxes.
	OBJECT SET VISIBLE:C603(*; "Cal4D_DOW@"; False:C215)
	$_l_DowHeight:=0
End if 

// Determine if we need five or six rows to display the selected month.
If (<>CAL_l_LastBox<=35)
	$_l_RowsNeeded:=5
Else 
	$_l_RowsNeeded:=6
End if 

// Calculate the largest box size we can use and still get them all into the available space.
<>CAL_l_BoxWidth:=($_l_BoxAreaWidth-(8*<>CAL_l_ColumnWidth))\7  // Longint division is important here.
<>CAL_l_BoxHeight:=($_l_BoxAreaHeight-(($_l_RowsNeeded+1)*<>CAL_l_ColumnHeight))\$_l_RowsNeeded

// Move the boxes and numbers into position.
$_l_DowTop:=$_l_TopBoundary
$_l_DowBottom:=$_l_DowTop+(<>CAL_l_DOWHeight*Num:C11(<>Cal_bo_DisplayDaysOfTheWeek))
$_l_BoxTop:=$_l_DowBottom+(<>CAL_l_ColumnHeight*Num:C11(<>Cal_bo_DisplayDaysOfTheWeek))

$_l_BoxLeft:=$_l_LeftBoundary+<>CAL_l_ColumnWidth

//Although the box widths and heights listed will all fit within the given area, they may not
//   completely fill it.  So we may need to adjust the width and height of a few columns
//   and rows to make everything look good.  We calculate that here.
$_l_HeightPixelsShort:=$_l_BoxAreaHeight-($_l_RowsNeeded*<>CAL_l_BoxHeight)-(($_l_RowsNeeded+1)*<>CAL_l_ColumnHeight)

For ($_l_RowIndex; 1; 6)
	$_l_BoxBottom:=$_l_BoxTop+<>CAL_l_BoxHeight
	If ($_l_HeightPixelsShort>0)
		$_l_BoxBottom:=$_l_BoxBottom+1
		$_l_HeightPixelsShort:=$_l_HeightPixelsShort-1
	End if 
	
	$_l_widthPixelsShort:=$_l_BoxAreaWidth-(7*<>CAL_l_BoxWidth)-(8*<>CAL_l_ColumnWidth)
	
	For ($_l_ColumnIndex; 1; 7)
		$_l_ObjectNumber:=(($_l_RowIndex-1)*7)+$_l_ColumnIndex
		$_t_ObjectNumber:=String:C10($_l_ObjectNumber; "000")
		
		$_l_BoxRight:=$_l_BoxLeft+<>CAL_l_BoxWidth
		If ($_l_widthPixelsShort>0)
			$_l_BoxRight:=$_l_BoxRight+1
			$_l_widthPixelsShort:=$_l_widthPixelsShort-1
		End if 
		
		// Move the object to its correct position.
		OBJECT MOVE:C664(*; "Cal4D_Box"+$_t_ObjectNumber; $_l_BoxLeft; $_l_BoxTop; $_l_BoxRight; $_l_BoxBottom; *)
		OBJECT MOVE:C664(*; "Cal4D_Num"+$_t_ObjectNumber; $_l_BoxLeft; $_l_BoxTop+3; $_l_BoxRight-4; $_l_BoxBottom; *)
		
		// When we do the first row, move the days of the week (Sunday..Saturday) into position.
		// They get the same left-right coordinates as the boxes, but with their own top and bottom.
		If ($_l_RowIndex=1)
			If (<>Cal_bo_DisplayDaysOfTheWeek)  // A separate "If" line makes it (very slightly) faster.
				OBJECT MOVE:C664(*; "Cal4D_DOWBackground"+$_t_ObjectNumber; $_l_BoxLeft; $_l_DowTop; $_l_BoxRight; $_l_DowBottom; *)
				OBJECT MOVE:C664(*; "Cal4D_DOWLabel"+$_t_ObjectNumber; $_l_BoxLeft; $_l_DowTop+<>CAL_l_DOWVOffset; $_l_BoxRight; $_l_DowBottom; *)
			End if 
		End if 
		
		$_l_BoxLeft:=$_l_BoxRight+<>CAL_l_ColumnWidth  // Set for the next box in the loop.
	End for 
	
	$_l_BoxLeft:=$_l_LeftBoundary+<>CAL_l_ColumnWidth
	
	// If we need only five rows to display the month, move the last row offscreen.
	If (($_l_RowIndex=5) & ($_l_RowsNeeded=5))
		$_l_BoxTop:=8000
	Else 
		$_l_BoxTop:=$_l_BoxBottom+<>CAL_l_ColumnHeight
	End if 
End for 

// Move the background into place.
Case of 
	: (<>Cal_bo_DisplayOutermostLines)
		OBJECT MOVE:C664(*; "Cal4D_BackgroundRect"; $_l_LeftBoundary; $_l_TopBoundary; $_l_RightBoundary; $_l_BottomBoundary; *)
	: (Cal4D_HeaderHeight>0)
		OBJECT MOVE:C664(*; "Cal4D_BackgroundRect"; $_l_LeftBoundary+1; $_l_TopBoundary-1; $_l_RightBoundary-1; $_l_BottomBoundary-1; *)
	Else 
		OBJECT MOVE:C664(*; "Cal4D_BackgroundRect"; $_l_LeftBoundary+1; $_l_TopBoundary; $_l_RightBoundary-1; $_l_BottomBoundary-1; *)
End case 
ERR_MethodTrackerReturn("Cal4D_PlaceBoxes"; $_t_oldMethodName)