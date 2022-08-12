//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_PlaceBannerObject
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_PlaceBannerObject (event ID; title; start date; end date; color{; continued?})
	
	// If the optional start Date parameter is passed, it is used instead of the
	//   event's actual start date. This allows us to call this method recursively to
	//   place banners that span multiple rows.
	// If the "continued?" Boolean is passed, it means the start date is not actually
	//   the banner's start date, but rather where we left off after drawing a
	//   previous part of the banner.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : Event ID
	//   $2 : Text : The event title
	//   $3 : Date : Start date
	//   $4 : Date : End date
	//   $5 : Longint : Color
	//   $6 : Boolean : Continued?
	
	// Returns: Nothing
	
	// Created by Dave Batton on Aug 5, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:25`Method: Cal4D_PlaceBannerObject
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>Cal4D_al_BoxBannerLevels;0)
	C_BOOLEAN:C305($_bo_BeginingofBanner; $6)
	C_DATE:C307(<>CAL_d_Box1Date; <>CAL_d_BoxLastDate; $_d_EndDate; $_d_LastDatePlaced; $_d_StartDate; $3; $4)
	C_LONGINT:C283(<>CAL_l_BannerHeight; <>CAL_l_DragAreaWidth; <>CAL_l_NextObjectNum; <>CAL_l_TextHeight; $_l_BannerBottom; $_l_BannerLeft; $_l_BannerLevel; $_l_BannerRight; $_l_BannerTop; $_l_BoxBottom; $_l_BoxLeft)
	C_LONGINT:C283($_l_BoxNumber; $_l_BoxRight; $_l_BoxTop; $_l_Color; $_l_EndBoxNumber; $_l_EndBoxRight; $_l_EventID; $_l_FirstBoxBottom; $_l_Ignore; $_l_StartBoxNumber; $1)
	C_LONGINT:C283($5)
	C_POINTER:C301($_ptr_dragHandleFormObject; $_ptr_FormObject)
	C_TEXT:C284($_t_FormObjectVariableName; $_t_ObjectType; $_t_oldMethodName; $_t_Title; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_PlaceBannerObject")

$_l_EventID:=$1
$_t_Title:=$2
$_d_StartDate:=$3
$_d_EndDate:=$4
$_l_Color:=$5
$_bo_BeginingofBanner:=$6

$_t_ObjectType:="Banner"

// Our start and end dates may not be represented on this calendar. Modify them so
//   we don't bother plotting banners offscreen.
If ($_d_StartDate<<>CAL_d_Box1Date)
	$_d_StartDate:=<>CAL_d_Box1Date-1
End if 

If ($_d_EndDate><>CAL_d_BoxLastDate)
	$_d_EndDate:=<>CAL_d_BoxLastDate+1
End if 

If (($_d_StartDate<=<>CAL_d_BoxLastDate) & ($_d_EndDate>=<>CAL_d_Box1Date))
	$_t_FormObjectVariableName:="<>Cal4D_Banner"+String:C10(<>CAL_l_NextObjectNum; "000")+"_t"  // Yes, "<>" works on Mac too.
	Cal4D_AddTrackingElement($_l_EventID; $_t_FormObjectVariableName)  // Update the arrays that let us track which record the object is associated with.
	
	// Get a pointer to the variable object.
	$_ptr_FormObject:=Get pointer:C304($_t_FormObjectVariableName)
	
	// Set the object's text.
	$_ptr_FormObject->:=Cal4D_FormatEventDisplay($_t_ObjectType; $_t_Title; ?00:00:00?)
	
	// Set the object's color.
	Cal4D_SetObjectColor($_ptr_FormObject; $_t_ObjectType; $_d_StartDate; $_l_Color)
	
	$_l_StartBoxNumber:=$_d_StartDate-<>CAL_d_Box1Date+1
	$_l_EndBoxNumber:=$_l_StartBoxNumber+($_d_EndDate-$_d_StartDate)
	
	$_l_BoxNumber:=$_l_StartBoxNumber
	
	If ($_l_BoxNumber>1)
		OBJECT GET COORDINATES:C663(*; "Cal4D_Box"+String:C10($_l_BoxNumber; "000"); $_l_BoxLeft; $_l_BoxTop; $_l_BoxRight; $_l_BoxBottom)
	Else 
		OBJECT GET COORDINATES:C663(*; "Cal4D_Box001"; $_l_BoxLeft; $_l_BoxTop; $_l_BoxRight; $_l_BoxBottom)
	End if 
	
	$_l_FirstBoxBottom:=$_l_BoxBottom
	$_l_EndBoxRight:=$_l_BoxRight
	$_d_LastDatePlaced:=$_d_StartDate
	
	If (($_l_BoxNumber>=1) & ($_l_BoxNumber<=42))
		$_l_BannerLevel:=<>Cal_al_BoxBannerLevels{$_l_BoxNumber}+1  // This is the stacking level we'll use for this banner. We start at level 1.
		<>Cal_al_BoxBannerLevels{$_l_BoxNumber}:=$_l_BannerLevel
	Else 
		$_l_BannerLevel:=1
	End if 
	
	// Continue until we're done with the event, or we're at the last box in the
	//   current row.
	While (($_l_BoxNumber<$_l_EndBoxNumber) & ($_l_BoxBottom=$_l_FirstBoxBottom))
		$_l_BoxNumber:=$_l_BoxNumber+1
		If (($_l_BoxNumber>=1) & ($_l_BoxNumber<=42))
			OBJECT GET COORDINATES:C663(*; "Cal4D_Box"+String:C10($_l_BoxNumber; "000"); $_l_ignore; $_l_ignore; $_l_BoxRight; $_l_BoxBottom)
			If ($_l_BoxBottom=$_l_FirstBoxBottom)
				$_d_LastDatePlaced:=$_d_LastDatePlaced+1
				$_l_EndBoxRight:=$_l_BoxRight
				If (<>Cal_al_BoxBannerLevels{$_l_BoxNumber}>=$_l_BannerLevel)  // If there's already a banner in this box...
					$_l_BannerLevel:=$_l_BannerLevel+1  // ...move up one level from the highest banner in the box.
				End if 
				<>Cal_al_BoxBannerLevels{$_l_BoxNumber}:=$_l_BannerLevel
			End if 
		End if 
	End while 
	
	$_l_BannerLeft:=$_l_BoxLeft
	$_l_BannerRight:=$_l_EndBoxRight
	$_l_BannerTop:=$_l_FirstBoxBottom-((<>CAL_l_TextHeight+3)*$_l_BannerLevel)
	
	// Don't allow the banner to cover up the number. This area is needed for the "more stuff" button too.
	If ($_l_BannerTop<($_l_BoxTop+16))
		$_l_BannerTop:=$_l_BoxTop+16
	End if 
	
	$_l_BannerBottom:=$_l_BannerTop+<>CAL_l_BannerHeight
	
	// This code starts the left side of the banner 3 pixels from the edge of the
	//   box if it's the first banner piece we're drawing for this event.  It also
	//   moves an invisible button (used for resizing the banner) to the beginning of
	//   the banner.
	If ($_bo_BeginingofBanner)
		$_l_BannerLeft:=$_l_BannerLeft+3
		$_t_FormObjectVariableName:="<>Cal4D_l_DragButtonLeft"+String:C10(<>CAL_l_NextObjectNum; "000")  // The invisible button next to the banner.
		Cal4D_AddTrackingElement($_l_EventID; $_t_FormObjectVariableName)
		$_ptr_dragHandleFormObject:=Get pointer:C304($_t_FormObjectVariableName)
		OBJECT MOVE:C664($_ptr_dragHandleFormObject->; $_l_BannerLeft; $_l_BannerTop; $_l_BannerLeft+<>CAL_l_DragAreaWidth; $_l_BannerBottom; *)
	End if 
	
	// This does the same thing for the right side of the banner.
	If ($_d_LastDatePlaced=$_d_EndDate)
		$_l_BannerRight:=$_l_BannerRight-3
		$_t_FormObjectVariableName:="<>Cal4D_l_DragButtonRight"+String:C10(<>CAL_l_NextObjectNum; "000")
		Cal4D_AddTrackingElement($_l_EventID; $_t_FormObjectVariableName)
		$_ptr_dragHandleFormObject:=Get pointer:C304($_t_FormObjectVariableName)
		OBJECT MOVE:C664($_ptr_dragHandleFormObject->; $_l_BannerRight-<>CAL_l_DragAreaWidth; $_l_BannerTop; $_l_BannerRight; $_l_BannerBottom; *)
	End if 
	
	OBJECT MOVE:C664($_ptr_FormObject->; $_l_BannerLeft; $_l_BannerTop; $_l_BannerRight; $_l_BannerBottom; *)
	
	<>CAL_l_NextObjectNum:=<>CAL_l_NextObjectNum+1
	
	If ($_d_LastDatePlaced<$_d_EndDate)
		$_d_StartDate:=$_d_LastDatePlaced+1
		Cal4D_PlaceBannerObject($_l_EventID; $_t_Title; $_d_StartDate; $_d_EndDate; $_l_Color; False:C215)
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_PlaceBannerObject"; $_t_oldMethodName)