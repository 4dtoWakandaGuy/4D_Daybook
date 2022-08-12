//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_PlacePictureObject
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_PlacePictureObject
	
	// Called from the Cal4D_PlaceEvents method to place Picture events.
	// Important: This routine assumes the events have been sorted by date.
	
	// Access Type: Private
	
	// Parameters: None
	
	// Returns: Nothing
	
	// Created by Dave Batton on Jul 28, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:25`Method: Cal4D_PlacePictureObject
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>Cal_al_BoxBannerLevels;0)
	//ARRAY LONGINT(<>Cal4D_al_BoxBannerLevels;0)
	C_DATE:C307(<>CAL_d_Box1Date; <>CAL_d_LastPictureDate; $_d_StartDate; $2)
	C_LONGINT:C283(<>CAL_l_NextObjectNum; <>CAL_l_NextPictRightOffset; <>CAL_l_TextHeight; $_l_Bottom; $_l_BoxBottom; $_l_BoxLeft; $_l_BoxNumber; $_l_BoxRight; $_l_BoxTop; $_l_EventID; $_l_ImageHeight)
	C_LONGINT:C283($_l_ImageWidth; $_l_Left; $_l_Right; $_l_top; $1)
	C_PICTURE:C286($_Pic_Picture; $3)
	C_POINTER:C301($_ptr_CurrentObject)
	C_TEXT:C284($_t_formObjectVariableName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_PlacePictureObject")

$_l_EventID:=$1
$_d_StartDate:=$2
$_Pic_Picture:=$3

$_t_formObjectVariableName:="<>Cal4D_pi_Image"+String:C10(<>CAL_l_NextObjectNum; "000")  // Yes, <> works on Mac too.
<>CAL_l_NextObjectNum:=<>CAL_l_NextObjectNum+1

// Update the arrays that let us track which record the object is associated with.
Cal4D_AddTrackingElement($_l_EventID; $_t_formObjectVariableName)

// Get a pointer to the variable object.
$_ptr_CurrentObject:=Get pointer:C304($_t_formObjectVariableName)

// Stick the picture from the record in the variable.
$_ptr_CurrentObject->:=$_Pic_Picture

PICTURE PROPERTIES:C457($_ptr_CurrentObject->; $_l_ImageWidth; $_l_ImageHeight)

// Find the box into which we want to place this event.
$_l_BoxNumber:=$_d_StartDate-<>CAL_d_Box1Date+1
OBJECT GET COORDINATES:C663(*; "Cal4D_Box"+String:C10($_l_BoxNumber; "000"); $_l_BoxLeft; $_l_BoxTop; $_l_BoxRight; $_l_BoxBottom)

// Figure out if we need to move the picture because we've
//   already placed one in this date's box.
If ($_d_StartDate#<>CAL_d_LastPictureDate)
	<>CAL_l_NextPictRightOffset:=0
End if 

$_l_Left:=$_l_BoxRight-<>CAL_l_NextPictRightOffset-$_l_ImageWidth-2
$_l_top:=$_l_BoxBottom-$_l_ImageHeight-((<>CAL_l_TextHeight+3)*<>Cal_al_BoxBannerLevels{$_l_BoxNumber})-2  // Place the image above any banners displayed in this box.
$_l_Right:=$_l_Left+$_l_ImageWidth
$_l_Bottom:=$_l_top+$_l_ImageHeight

// Now make sure our picture variable doesn't extend outside of the date box.
If ($_l_Left<($_l_BoxLeft+2))
	$_l_Left:=$_l_BoxLeft+2
End if 
If ($_l_top<($_l_BoxTop+2))
	$_l_top:=$_l_BoxTop+2
End if 

// Move the picture object into place.
OBJECT MOVE:C664($_ptr_CurrentObject->; $_l_Left; $_l_top; $_l_Right; $_l_Bottom; *)

<>CAL_d_LastPictureDate:=$_d_StartDate

<>CAL_l_NextPictRightOffset:=<>CAL_l_NextPictRightOffset+$_l_ImageWidth
ERR_MethodTrackerReturn("Cal4D_PlacePictureObject"; $_t_oldMethodName)