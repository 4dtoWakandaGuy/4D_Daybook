//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_BannerDrag
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_BannerDrag
	
	// Called by the Cal4D_Calendar form method during On Timer events while the
	//   user is dragging a banner end to modify its duration.
	
	// Access Type: Private
	
	// Parameters: None
	
	// Returns: Nothing
	
	// Created by Dave Batton on Aug 1, 2004
	//------------------ Revision Control ----------------
	//Date Created: 20/12/2009 14:12`Method: Cal4D_BannerDrag
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_DragStart)
	C_LONGINT:C283(<>CAL_l_CalendarLeft; <>CAL_l_DragAreaWidth; <>CAL_l_DragBannerBottom; <>CAL_l_DragBannerLeft; <>CAL_l_DragBannerOffset; <>CAL_l_DragBannerRight; <>CAL_l_DragBannerTop; <>CAL_l_DragRightLimit; $_i_mouseButton; $_i_mouseX; $_i_mouseY)
	C_POINTER:C301(<>CAL_ptr_DragBanner; <>CAL_ptr_DragBttn; <>CAL_ptr_Nil)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_BannerDrag")


GET MOUSE:C468($_i_mouseX; $_i_mouseY; $_i_mouseButton)
If ($_i_mouseButton#0)
	
	If (<>Cal_bo_DragStart)  // We're changing the start date.
		<>CAL_l_DragBannerLeft:=$_i_mouseX-<>CAL_l_DragBannerOffset
		Case of 
			: (<>CAL_l_DragBannerLeft>(<>CAL_l_DragBannerRight-10))
				<>CAL_l_DragBannerLeft:=<>CAL_l_DragBannerRight-10
			: (<>CAL_l_DragBannerLeft<<>CAL_l_CalendarLeft)
				<>CAL_l_DragBannerLeft:=<>CAL_l_CalendarLeft
		End case 
	Else   // We're changing the end date.
		<>CAL_l_DragBannerRight:=$_i_mouseX+<>CAL_l_DragBannerOffset
		Case of 
			: (<>CAL_l_DragBannerRight<(<>CAL_l_DragBannerLeft+10))
				<>CAL_l_DragBannerRight:=<>CAL_l_DragBannerLeft+10
			: (<>CAL_l_DragBannerRight><>CAL_l_DragRightLimit)  // We set <>Cal_DragRightLimit in Cal4D_DragObjectMethod.
				<>CAL_l_DragBannerRight:=<>CAL_l_DragRightLimit
		End case 
	End if 
	
	// Move the banner as the user drags the mouse.
	OBJECT MOVE:C664(<>CAL_ptr_DragBanner->; <>CAL_l_DragBannerLeft; <>CAL_l_DragBannerTop; <>CAL_l_DragBannerRight; <>CAL_l_DragBannerBottom; *)
	
	// We also need to move the invisible button, because its position is used to  If
	//   highlight the end of the banner, and we're also going to redraw the selection
	//   objects.
	If (<>Cal_bo_DragStart)
		OBJECT MOVE:C664(<>CAL_ptr_DragBttn->; <>CAL_l_DragBannerLeft; <>CAL_l_DragBannerTop; <>CAL_l_DragBannerLeft+<>CAL_l_DragAreaWidth; <>CAL_l_DragBannerBottom; *)
	Else 
		OBJECT MOVE:C664(<>CAL_ptr_DragBttn->; <>CAL_l_DragBannerRight-<>CAL_l_DragAreaWidth; <>CAL_l_DragBannerTop; <>CAL_l_DragBannerRight; <>CAL_l_DragBannerBottom; *)
	End if 
	
	// Finally, move the selection rectangle.
	Cal4D_SelectObject(<>CAL_ptr_DragBanner)
	
	
Else   // This gets called when the mouse button is released.
	SET TIMER:C645(0)
	If (<>CAL_ptr_DragBanner#<>CAL_ptr_Nil)
		Cal4D_RecalcBanner(<>CAL_ptr_DragBanner)
		
		Cal4D_SelectObject(<>CAL_ptr_DragBanner)
		Cal4D_PlaceEvents
		
		<>CAL_ptr_DragBanner:=<>CAL_ptr_Nil
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_BannerDrag"; $_t_oldMethodName)