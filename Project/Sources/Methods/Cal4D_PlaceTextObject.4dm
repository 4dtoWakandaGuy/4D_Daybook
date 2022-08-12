//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_PlaceTextObject
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_PlaceTextObject (id; type; title; start date; start time; end date; end time; color; group ID)
	
	// Called from Cal4D_PlaceEvents to place All-Day and Appointment events.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : Event ID
	//   $2 : Longint : The event type
	//   $3 : Text : The event title
	//   $4 : Date : Start date
	//   $5 : Time : Start time
	//   $6 : Date : End date
	//   $7 : Time : End time
	//   $8 : Longint : Color
	
	// Returns: Nothing
	
	// Created by Dave Batton on Aug 5, 2004
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:25`Method: Cal4D_PlaceTextObject
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>Cal_al_BoxBannerLevels;0)
	//ARRAY LONGINT(<>Cal4D_al_BoxBannerLevels;0)
	C_DATE:C307(<>CAL_d_Box1Date; <>CAL_d_LastDatePlaced; $_d_EndDate; $_d_StartDate; $4; $6)
	C_LONGINT:C283(<>CAL_l_MoreStuffButtonHeight; <>CAL_l_MoreStuffButtonWidth; <>CAL_l_NextObjectNum; <>CAL_l_NextTextTop; <>CAL_l_TextHeight; $_l_BoxBottom; $_l_BoxLeft; $_l_BoxNumber; $_l_BoxRIght; $_l_BoxTop; $_l_Colour)
	C_LONGINT:C283($_l_EventID; $_l_FieldNumber; $_l_GroupID; $_l_TableNumber; $_l_TextLeft; $_l_TextRight; $1; $8)
	C_POINTER:C301($_ptr_FormObject)
	C_TEXT:C284($_t_formObjectVariableName; $_t_oldMethodName; $_t_Title; $_t_Type; $_t_VariableName; $2; $3)
	C_TIME:C306($_ti_EndTime; $_ti_StartTime; $5; $7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_PlaceTextObject")

$_l_EventID:=$1
$_t_Type:=$2
$_t_Title:=$3
$_d_StartDate:=$4
$_ti_StartTime:=$5
$_d_EndDate:=$6
$_ti_EndTime:=$7
$_l_Colour:=$8

// Pick a form object to use.
$_t_formObjectVariableName:="<>Cal4D_Text"+String:C10(<>CAL_l_NextObjectNum; "000")+"_t"  // Yes, "<>" works on Mac too.
<>CAL_l_NextObjectNum:=<>CAL_l_NextObjectNum+1

// Get a pointer to the variable object.
$_ptr_FormObject:=Get pointer:C304($_t_formObjectVariableName)
RESOLVE POINTER:C394($_ptr_FormObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)

// Set the object's text.
$_ptr_FormObject->:=Cal4D_FormatEventDisplay($_t_Type; $_t_Title; $_ti_StartTime)

// Set the object's color.
Cal4D_SetObjectColor($_ptr_FormObject; $_t_Type; $_d_StartDate; $_l_Colour)

// We handle the stacking of event objects here.
If ($_d_StartDate#<>CAL_d_LastDatePlaced)
	<>CAL_l_NextTextTop:=15
	<>CAL_d_LastDatePlaced:=$_d_StartDate
Else 
	<>CAL_l_NextTextTop:=<>CAL_l_NextTextTop+<>CAL_l_TextHeight
End if 

// Find the box into which we want to place this event.
$_l_BoxNumber:=$_d_StartDate-<>CAL_d_Box1Date+1

// Update the arrays that let us track which record the object is associated with.
Cal4D_AddTrackingElement($_l_EventID; $_t_formObjectVariableName; $_l_BoxNumber; $_l_Colour)

OBJECT GET COORDINATES:C663(*; "Cal4D_Box"+String:C10($_l_BoxNumber; "000"); $_l_BoxLeft; $_l_BoxTop; $_l_BoxRIght; $_l_BoxBottom)
$_l_BoxTop:=$_l_BoxTop+<>CAL_l_NextTextTop

If (<>Cal_al_BoxBannerLevels{$_l_BoxNumber}>0)
	$_l_BoxBottom:=$_l_BoxBottom-((<>CAL_l_TextHeight+3)*<>Cal_al_BoxBannerLevels{$_l_BoxNumber})-3  // Pretend the bottom of the box is above any banners.
End if 

If ($_l_BoxTop<=$_l_BoxBottom)  // Don't draw anything if it would be below the bottom of the box anyway.
	// Make sure the item's text doesn't extend beyond the bottom of the box for that date.
	$_l_BoxBottom:=$_l_BoxTop+<>CAL_l_NextTextTop+<>CAL_l_TextHeight
	If ($_l_BoxBottom>$_l_BoxBottom)
		$_l_BoxBottom:=$_l_BoxBottom
	End if 
	
	// Move the text event object into place.
	OBJECT MOVE:C664($_ptr_FormObject->; $_l_BoxLeft+3; $_l_BoxTop; $_l_BoxRIght-3; $_l_BoxBottom; *)
End if 

// If the event is partially hidden, draw the "more stuff" button so the user can click to see everything.
If (($_l_BoxBottom-$_l_BoxTop)<11)
	$_ptr_FormObject:=Get pointer:C304("<>Cal4D_MoreStuffButton"+String:C10($_l_BoxNumber; "000")+"_i")
	$_l_TextRight:=$_l_BoxRIght
	$_l_BoxBottom:=$_l_BoxBottom
	$_l_TextLeft:=$_l_TextRight-<>CAL_l_MoreStuffButtonWidth
	$_l_BoxTop:=$_l_BoxBottom-<>CAL_l_MoreStuffButtonHeight
	If ($_l_BoxTop<($_l_BoxTop+16))  // Don't let it creep too high. Once it gets up to the number, switch it to the right side.
		$_l_TextLeft:=$_l_BoxLeft
		$_l_BoxTop:=$_l_BoxTop
		$_l_TextRight:=$_l_TextLeft+<>CAL_l_MoreStuffButtonWidth
		$_l_BoxBottom:=$_l_BoxTop+<>CAL_l_MoreStuffButtonHeight
	End if 
	OBJECT MOVE:C664($_ptr_FormObject->; $_l_TextLeft; $_l_BoxTop; $_l_TextRight; $_l_BoxBottom; *)
End if 
ERR_MethodTrackerReturn("Cal4D_PlaceTextObject"; $_t_oldMethodName)