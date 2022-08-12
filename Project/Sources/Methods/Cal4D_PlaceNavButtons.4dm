//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_PlaceNavButtons
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
	C_LONGINT:C283(<>CAL_l_CalendarLeft; <>CAL_l_CalendarRight; <>CAL_l_CalendarTop; <>CAL_l_NavJumpButton; <>CAL_l_NavNextButton; <>CAL_l_NavPrevButton; $_l_Gap; $_l_HeaderHeight; $_l_Height; $_l_HGap; $_l_ObjectBottom)
	C_LONGINT:C283($_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_Width)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_PlaceNavButtons")

If ((<>Cal_bo_DisplayNavButtons) & ((Not:C34(<>Cal_bo_DisplayMonthYearText)) | ((<>CAL_l_CalendarRight-<>CAL_l_CalendarLeft)>350)))  // If the window is narrower than this size the buttons interfere with the date.
	$_l_HeaderHeight:=Cal4D_HeaderHeight
	OBJECT MOVE:C664(*; "Cal4D_HeaderBackgroundRect"; <>CAL_l_CalendarLeft; <>CAL_l_CalendarTop; <>CAL_l_CalendarRight; <>CAL_l_CalendarTop+$_l_HeaderHeight; *)
	
	$_l_Width:=28  // Yes, hard coding is bad. But these are sized very small in the inherited form, so there's no way to procedurally get their size.
	$_l_Height:=21
	$_l_HGap:=16  // Match this to the $monthYearTextHOffset_i value in Cal4D_PlaceMonthYearText.
	$_l_Gap:=($_l_HeaderHeight-$_l_Height)\2
	
	$_l_ObjectTop:=<>CAL_l_CalendarTop+$_l_Gap
	
	$_l_ObjectLeft:=<>CAL_l_CalendarRight-(($_l_Width+$_l_HGap)*3)
	OBJECT MOVE:C664(<>CAL_l_NavPrevButton; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_Width; $_l_ObjectTop+$_l_Height; *)
	
	$_l_ObjectLeft:=<>CAL_l_CalendarRight-(($_l_Width+$_l_HGap)*2)
	OBJECT MOVE:C664(<>CAL_l_NavJumpButton; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_Width; $_l_ObjectTop+$_l_Height; *)
	
	$_l_ObjectLeft:=<>CAL_l_CalendarRight-($_l_Width+$_l_HGap)
	OBJECT MOVE:C664(<>CAL_l_NavNextButton; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_Width; $_l_ObjectTop+$_l_Height; *)
	
	OBJECT SET VISIBLE:C603(*; "Cal4D_Nav@"; <>Cal_bo_CalisVisible)
	
Else 
	OBJECT SET VISIBLE:C603(*; "Cal4D_Nav@"; False:C215)
End if 
ERR_MethodTrackerReturn("Cal4D_PlaceNavButtons"; $_t_oldMethodName)