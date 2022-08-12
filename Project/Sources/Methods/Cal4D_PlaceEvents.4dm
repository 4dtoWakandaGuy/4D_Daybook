//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_PlaceEvents
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_PlaceEvents
	
	// Draws the events on the calendar by moving offscreen objects onscreen.
	
	// Access Type: Private
	
	// Parameters: None
	
	// Returns: Nothing
	
	// Created by Dave Batton on Jul 28, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:31`Method: Cal4D_PlaceEvents
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>Cal_Lb_CalenderList;0)
	//ARRAY BOOLEAN(<>Cal4D_Lb_CalenderList;0)
	//ARRAY DATE(<>Cal4D_ad_EventOEndDates;0)
	//ARRAY DATE(<>Cal4D_ad_EventOStartDates;0)
	//ARRAY DATE(CAL_ad_EndDates;0)
	//ARRAY DATE(CAL_ad_StartDates;0)
	//ARRAY INTEGER(<>Cal_ad_EventOEndDates;0)
	//ARRAY INTEGER(<>Cal_ad_EventOStartDates;0)
	//ARRAY INTEGER(<>Cal_al_TrackBoxNumbers;0)
	//ARRAY INTEGER(<>CAL4D_al_TrackBoxNumbers;0)
	//ARRAY LONGINT(<>Cal_al_BoxBannerLevels;0)
	//ARRAY LONGINT(<>Cal_al_EventColors;0)
	//ARRAY LONGINT(<>Cal_al_EventGroupIDs;0)
	//ARRAY LONGINT(<>Cal_al_EventIDS;0)
	//ARRAY LONGINT(<>Cal_al_TrackEventColors;0)
	//ARRAY LONGINT(<>Cal_al_TrackRecordEventIDs;0)
	//ARRAY LONGINT(<>Cal4D_al_BoxBannerLevels;0)
	//ARRAY LONGINT(<>Cal4D_al_EventColors;0)
	//ARRAY LONGINT(<>Cal4D_al_EventGroupIDs;0)
	//ARRAY LONGINT(<>CAL4D_al_EventIDS;0)
	//ARRAY LONGINT(<>CAL4D_al_TrackEventColors;0)
	//ARRAY LONGINT(<>Cal4D_al_TrackRecordEventIDs;0)
	ARRAY LONGINT:C221($_al_Days; 0)
	ARRAY LONGINT:C221($_al_EndTimes; 0)
	ARRAY LONGINT:C221($_al_GroupColours; 0)
	ARRAY LONGINT:C221($_al_StartTimes; 0)
	//ARRAY LONGINT(CAL4d_al_Colours;0)
	//ARRAY LONGINT(CAL_al_GroupIDs;0)
	//ARRAY LONGINT(SD2_al_EventIDs;0)
	//ARRAY TEXT(<>Cal_at_EventTitles;0)
	//ARRAY TEXT(<>Cal_at_EventTypes;0)
	//ARRAY TEXT(<>Cal_at_TrackFormVarNames;0)
	//ARRAY TEXT(<>CAL4D_at_EventTitles;0)
	//ARRAY TEXT(<>CAL4D_at_EventTypes;0)
	//ARRAY TEXT(<>cal4d_at_TrackFormVarNames;0)
	//ARRAY TEXT(SD2_at_Titles;0)
	//ARRAY TEXT(SD2_at_Types;0)
	//ARRAY TIME(<>Cal_ati_EventOEndTimes;0)
	//ARRAY TIME(<>Cal_ati_EventOStartTimes;0)
	//ARRAY TIME(<>Cal4D_ati_EventOEndTimes;0)
	//ARRAY TIME(<>Cal4D_ati_EventOStartTimes;0)
	C_BOOLEAN:C305(<>Cal_bo_EventUpdateNeeded; <>Cal_bo_FormUpdateNeeded; $_bo_BeginningofBanner; $_bo_CanView; $_bo_OldManyRelations; $_bo_OldOneRelations; $_bo_tooManyObjects)
	C_DATE:C307(<>CAL_d_Box1Date; <>CAL_d_BoxLastDate; <>CAL_d_LastDatePlaced; <>CAL_d_LastPictureDate)
	C_LONGINT:C283(<>CAL_l_CurrentUserID; <>CAL_l_MaxBannerObjects; <>CAL_l_MaxPictureObjects; <>CAL_l_MaxTextObjects; <>CAL_l_NextObjectNum; <>CAL_l_NextTextTop; <>CAL_l_UseGroupColor; $_l_BoxNumber; $_l_element; $_l_Elements; $_l_EventIndex)
	C_LONGINT:C283($_l_Offset; $_l_SelectedRecordID)
	C_POINTER:C301(<>CAL_ptr_DragBanner; <>Cal_ptr_EventColorField; <>CAL_ptr_EventEndDateFld; <>Cal_ptr_EventEndTimeField; <>Cal_ptr_EventGroupIDField; <>Cal_ptr_EventIDField; <>CAL_ptr_EventStartDateFld; <>Cal_ptr_EventStartTimeField; <>Cal_ptr_EventTable; <>Cal_ptr_EventTitleField; <>Cal_ptr_EventTypeFldField)
	C_POINTER:C301(<>Cal_ptr_GroupFld_Colour; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupotherscanviewField; <>Cal_ptr_GroupTable; <>Cal_ptr_GroupUserIDField; <>CAL_ptr_Nil; <>CAL_ptr_SelectedObject; $_ptr_FormObject)
	C_TEXT:C284(<>Cal_t_CallbackMethodforUpdates; $_t_oldMethodName; $_t_SQL)
	C_TIME:C306($_ti_EndTime; $_ti_StartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_PlaceEvents")

<>Cal_bo_EventUpdateNeeded:=False:C215

$_bo_tooManyObjects:=False:C215  // We'll set this to true if we have more events to display than we have form objects.

READ ONLY:C145(<>Cal_ptr_EventTable->)  // This method won't be modifying any data.
MESSAGES OFF:C175
GET AUTOMATIC RELATIONS:C899($_bo_OldOneRelations; $_bo_OldManyRelations)
SET AUTOMATIC RELATIONS:C310(True:C214)

<>CAL_ptr_DragBanner:=<>CAL_ptr_Nil  // Since a redraw will make this pointer invalid.

// If an event is currently selected, get the record ID here so we can restore
//   the highlight after we've moved everything around.
$_l_SelectedRecordID:=Cal4D_GetEventIDfromFormObject(<>CAL_ptr_SelectedObject)
Cal4D_DeselectObject(<>CAL_ptr_SelectedObject)

OBJECT MOVE:C664(*; "Cal4D_Text@"; 5000; 5000; 5005; 5005; *)  // Move the text boxes offscreen until they're needed.
OBJECT MOVE:C664(*; "Cal4D_Banner@"; 5000; 5000; 5005; 5005; *)  // Move the banners offscreen until they're needed.
OBJECT MOVE:C664(*; "Cal4D_DragButton@"; 5000; 5000; 5005; 5005; *)  // Move the drag buttons offscreen until they're needed.
OBJECT MOVE:C664(*; "Cal4D_Image@"; 5000; 5000; 5005; 5005; *)  // Move the picture variables offscreen until they're needed.
OBJECT MOVE:C664(*; "Cal4D_MoreStuffButton@"; 5000; 5000; 5005; 5005; *)  // Move the "more stuff" buttons offscreen until they're needed.
OBJECT SET VISIBLE:C603(<>Cal_Lb_CalenderList; False:C215)

// Clear the array we use to track what boxes already have banners in them.
For ($_l_BoxNumber; 1; Size of array:C274(<>Cal_al_BoxBannerLevels))
	<>Cal_al_BoxBannerLevels{$_l_BoxNumber}:=0
End for 

// We're going to create two matching (in the number of elements) arrays that will
//   allow us to keep track of which ◊Cal_Po_EventTable-> record each variable object has
//   been associated with.  Keep in mind that one Banner event may require
//   multiple variable objects, because it may span multiple rows.  So at this
//   point we don't know how many array elements we're going to need.
ARRAY LONGINT:C221(<>Cal_al_TrackRecordEventIDs; 0)
ARRAY TEXT:C222(<>Cal_at_TrackFormVarNames; 0)
ARRAY INTEGER:C220(<>Cal_al_TrackBoxNumbers; 0)
ARRAY LONGINT:C221(<>Cal_al_TrackEventColors; 0)

// If an update callback method has been installed, call it so the developer
//   can populate the calendar with events from other sources.
Cal4D_ClearEventArrays
If (<>Cal_t_CallbackMethodforUpdates#"")
	// // Modified by: Charles Vass (02/26/2009, 12:22)
	//EXECUTE FORMULA(◊Cal_t_CallbackMethodforUpdates+"(!"+String(◊Cal4D_Box1Date)+"!;!"+String(◊Cal4D_BoxLastDate)+"!)")
	EXECUTE METHOD:C1007(<>Cal_t_CallbackMethodforUpdates; *; <>CAL_d_Box1Date; <>CAL_d_BoxLastDate)
	<>Cal_bo_FormUpdateNeeded:=False:C215  // Prevents endless loops.
	<>Cal_bo_EventUpdateNeeded:=False:C215  // Prevents endless loops.
End if 


// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


// Start with banners first. These are so obtrusive, that everythign else tries to work around them.
// This query is a little involved, since we need to find banners that will be visible on the
//   current calendar, even though they might start long before this calendar.

QUERY:C277(<>Cal_ptr_EventTable->; <>CAL_ptr_EventStartDateFld-><=<>CAL_d_BoxLastDate; *)
QUERY:C277(<>Cal_ptr_EventTable->;  & ; <>CAL_ptr_EventEndDateFld->>=<>CAL_d_Box1Date; *)
QUERY:C277(<>Cal_ptr_EventTable->;  & ; <>Cal_ptr_EventTypeFldField->="Banner")

QUERY SELECTION:C341(<>Cal_ptr_EventTable->; <>Cal_ptr_GroupUserIDField->=<>CAL_l_CurrentUserID; *)
QUERY SELECTION:C341(<>Cal_ptr_EventTable->;  | ; <>Cal_ptr_GroupotherscanviewField->=True:C214)

ARRAY LONGINT:C221(SD2_al_EventIDs; 0)
ARRAY TEXT:C222(SD2_at_Types; 0)
ARRAY TEXT:C222(SD2_at_Titles; 0)
ARRAY DATE:C224(CAL_ad_StartDates; 0)
ARRAY DATE:C224(CAL_ad_EndDates; 0)
ARRAY LONGINT:C221(CAL4d_al_Colours; 0)
ARRAY LONGINT:C221(CAL_al_GroupIDs; 0)

SELECTION TO ARRAY:C260(<>Cal_ptr_EventIDField->; SD2_al_EventIDs; <>Cal_ptr_EventTypeFldField->; SD2_at_Types; <>Cal_ptr_EventTitleField->; SD2_at_Titles; <>CAL_ptr_EventStartDateFld->; CAL_ad_StartDates; <>CAL_ptr_EventEndDateFld->; CAL_ad_EndDates; <>Cal_ptr_EventColorField->; CAL4d_al_Colours; <>Cal_ptr_EventGroupIDField->; CAL_al_GroupIDs)


// We get the best visual results by placing the longer bars first.
ARRAY LONGINT:C221($_al_Days; Size of array:C274(CAL_ad_StartDates))
For ($_l_EventIndex; 1; Size of array:C274($_al_Days))
	$_al_Days{$_l_EventIndex}:=CAL_ad_StartDates{$_l_EventIndex}-CAL_ad_EndDates{$_l_EventIndex}
End for 
MULTI SORT ARRAY:C718($_al_Days; >; SD2_al_EventIDs; SD2_at_Types; SD2_at_Titles; CAL_ad_StartDates; >; CAL_ad_EndDates; CAL4d_al_Colours; CAL_al_GroupIDs)

// We have a limited number of banner objects available to place on the calendar.
If (Size of array:C274(SD2_al_EventIDs)><>CAL_l_MaxBannerObjects)
	ARRAY LONGINT:C221(SD2_al_EventIDs; <>CAL_l_MaxBannerObjects)
	$_bo_tooManyObjects:=True:C214
End if 

<>CAL_l_NextObjectNum:=1

For ($_l_EventIndex; 1; Size of array:C274(SD2_al_EventIDs))
	$_bo_BeginningofBanner:=(CAL_ad_StartDates{$_l_EventIndex}>=<>CAL_d_Box1Date)
	Cal4D_PlaceBannerObject(SD2_al_EventIDs{$_l_EventIndex}; SD2_at_Titles{$_l_EventIndex}; CAL_ad_StartDates{$_l_EventIndex}; CAL_ad_EndDates{$_l_EventIndex}; CAL4d_al_Colours{$_l_EventIndex}; $_bo_BeginningofBanner)
End for 


// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

// //  To use standard 4D Relations instead of SQL change the If (True) to If (False)
//{
// //  First, find the "All-Day" and "Appointment" events with text to display.
If (False:C215)
	
	$_bo_CanView:=True:C214
	$_t_SQL:="SELECT "+Table name:C256(<>Cal_ptr_EventTable)+"."+Field name:C257(<>Cal_ptr_EventIDField)+", "
	$_t_SQL:=$_t_SQL+Table name:C256(<>Cal_ptr_EventTable)+"."+Field name:C257(<>Cal_ptr_EventTitleField)+", "
	$_t_SQL:=$_t_SQL+Table name:C256(<>Cal_ptr_EventTable)+"."+Field name:C257(<>CAL_ptr_EventStartDateFld)+", "
	$_t_SQL:=$_t_SQL+Table name:C256(<>Cal_ptr_EventTable)+"."+Field name:C257(<>CAL_ptr_EventEndDateFld)+", "
	$_t_SQL:=$_t_SQL+Table name:C256(<>Cal_ptr_EventTable)+"."+Field name:C257(<>Cal_ptr_EventColorField)+", "
	$_t_SQL:=$_t_SQL+Table name:C256(<>Cal_ptr_EventTable)+"."+Field name:C257(<>Cal_ptr_EventGroupIDField)
	$_t_SQL:=$_t_SQL+" FROM "+Table name:C256(<>Cal_ptr_EventTable)+", "+Table name:C256(<>Cal_ptr_GroupTable)
	$_t_SQL:=$_t_SQL+" WHERE ( "+Field name:C257(<>Cal_ptr_EventTypeFldField)+" = 'All-Day' OR "+Field name:C257(<>Cal_ptr_EventTypeFldField)+" = 'Appointment' )"
	$_t_SQL:=$_t_SQL+" AND "+Field name:C257(<>Cal_ptr_EventTitleField)+" <> ''"
	$_t_SQL:=$_t_SQL+" AND "+Field name:C257(<>CAL_ptr_EventStartDateFld)+" >= :$Box1Date"
	$_t_SQL:=$_t_SQL+" AND "+Field name:C257(<>CAL_ptr_EventStartDateFld)+" <= :$BoxLastDate"
	$_t_SQL:=$_t_SQL+" AND "+Field name:C257(<>Cal_ptr_EventGroupIDField)+" = "+Field name:C257(<>Cal_ptr_GroupUserIDField)
	$_t_SQL:=$_t_SQL+" AND "+Field name:C257(<>Cal_ptr_GroupUserIDField)+" = :[<>Cal4D_UserID_i]"
	$_t_SQL:=$_t_SQL+" AND "+Field name:C257(<>Cal_ptr_GroupotherscanviewField)+" = :$_bo_CanView "
	$_t_SQL:=$_t_SQL+" INTO :SD2_al_EventIDs, :SD2_at_Types, :SD2_at_Titles, :CAL_ad_StartDates, :CAL_ad_EndDates, :CAL4d_al_Colours, :CAL_al_GroupIDs;"
	
	Begin SQL
		EXECUTE IMMEDIATE :$_t_SQL
	End SQL
	
Else 
	// First, find the "All-Day" and "Appointment" events with text to display.
	QUERY:C277(<>Cal_ptr_EventTable->; <>Cal_ptr_EventTypeFldField->="All-Day"; *)
	QUERY:C277(<>Cal_ptr_EventTable->;  | ; <>Cal_ptr_EventTypeFldField->="Appointment"; *)
	QUERY:C277(<>Cal_ptr_EventTable->;  & ; <>Cal_ptr_EventTitleField->#""; *)
	QUERY:C277(<>Cal_ptr_EventTable->;  & ; <>CAL_ptr_EventStartDateFld->>=<>CAL_d_Box1Date; *)
	QUERY:C277(<>Cal_ptr_EventTable->;  & ; <>CAL_ptr_EventStartDateFld-><=<>CAL_d_BoxLastDate)
	
	QUERY SELECTION:C341(<>Cal_ptr_EventTable->; <>Cal_ptr_GroupUserIDField->=<>CAL_l_CurrentUserID; *)
	QUERY SELECTION:C341(<>Cal_ptr_EventTable->;  | ; <>Cal_ptr_GroupotherscanviewField->=True:C214)
	
	ARRAY LONGINT:C221(SD2_al_EventIDs; 0)
	ARRAY LONGINT:C221($_al_StartTimes; 0)
	ARRAY LONGINT:C221($_al_EndTimes; 0)
	ARRAY LONGINT:C221($_al_GroupColours; 0)
	
	//SELECTION TO ARRAY(◊Cal_Po_EventIDField->;SD2_al_EventIDs;◊Cal_Po_EventTypeFldField->;SD2_at_Types;◊Cal_Po_EventTitleField->;SD2_at_Titles;◊Cal4D_Po_EventStartDateFld->;CAL_ad_StartDates;◊Cal_Po_EventStartTimeField->;$_al_StartTimes;◊Cal4D_Po_EventEndDateFDates_aD;◊Cal_Po_EventEndTimeField->;$_al_EndTimes;◊Cal_Po_EventColorField->;CAL4d_al_Colours;◊Cal_po_GroupFld_Colour->;$_al_GroupColours)  `◊Cal_po_EventGroupIDField->;CAL_al_GroupIDs)
	SELECTION TO ARRAY:C260(<>Cal_ptr_EventIDField->; SD2_al_EventIDs; <>Cal_ptr_EventTypeFldField->; SD2_at_Types; <>Cal_ptr_EventTitleField->; SD2_at_Titles; <>CAL_ptr_EventStartDateFld->; CAL_ad_StartDates; <>Cal_ptr_EventStartTimeField->; $_al_StartTimes; <>CAL_ptr_EventEndDateFld->; CAL_ad_EndDates; <>Cal_ptr_EventEndTimeField->; $_al_EndTimes; <>Cal_ptr_EventColorField->; CAL4d_al_Colours; <>Cal_ptr_GroupFld_Colour->; $_al_GroupColours; <>Cal_ptr_EventGroupIDField->; CAL_al_GroupIDs)  //Josh fixed 3/5/2007
End if 
//}

For ($_l_element; 1; Size of array:C274(SD2_al_EventIDs))
	If (CAL4d_al_Colours{$_l_element}=<>CAL_l_UseGroupColor)
		CAL4d_al_Colours{$_l_element}:=$_al_GroupColours{$_l_element}
	End if 
End for 

// Append the temporary array-based events, if any.
For ($_l_element; 1; Size of array:C274(<>Cal_al_EventIDS))
	If (<>Cal_ad_EventOStartDates{$_l_element}=<>Cal_ad_EventOEndDates{$_l_element})  // Only single day events.
		If (<>Cal_ad_EventOStartDates{$_l_element}>=<>CAL_d_Box1Date)  // Only events that would appear on the current calendar.
			If (<>Cal_ad_EventOEndDates{$_l_element}<=<>CAL_d_BoxLastDate)
				APPEND TO ARRAY:C911(SD2_al_EventIDs; <>Cal_al_EventIDS{$_l_element})
				APPEND TO ARRAY:C911(SD2_at_Types; <>Cal_at_EventTypes{$_l_element})
				APPEND TO ARRAY:C911(SD2_at_Titles; <>Cal_at_EventTitles{$_l_element})
				APPEND TO ARRAY:C911(CAL_ad_StartDates; <>Cal_ad_EventOStartDates{$_l_element})
				APPEND TO ARRAY:C911($_al_StartTimes; <>Cal_ati_EventOStartTimes{$_l_element})
				APPEND TO ARRAY:C911(CAL_ad_EndDates; <>Cal_ad_EventOEndDates{$_l_element})
				APPEND TO ARRAY:C911($_al_EndTimes; <>Cal_ati_EventOEndTimes{$_l_element})
				APPEND TO ARRAY:C911(CAL4d_al_Colours; <>Cal_al_EventColors{$_l_element})
				APPEND TO ARRAY:C911(CAL_al_GroupIDs; <>Cal_al_EventGroupIDs{$_l_element})
				
				If ((CAL4d_al_Colours{Size of array:C274(CAL4d_al_Colours)}=<>CAL_l_UseGroupColor) & (CAL_al_GroupIDs{Size of array:C274(CAL4d_al_Colours)}#0))
					QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_ID->=Size of array:C274(CAL4d_al_Colours))
					CAL4d_al_Colours{Size of array:C274(CAL4d_al_Colours)}:=<>Cal_ptr_GroupFld_Colour->
				End if 
			End if 
		End if 
	End if 
End for 


// The date must be our first sort item. It affects stacking of events in the calendar.
// Sorting in reverse type order puts events with times at the top.
MULTI SORT ARRAY:C718(CAL_ad_StartDates; >; SD2_at_Types; <; $_al_StartTimes; >; SD2_at_Titles; >; SD2_al_EventIDs; CAL_ad_EndDates; $_al_EndTimes; CAL4d_al_Colours)

// We have a limited number of text objects available to place on the calendar.
If (Size of array:C274(SD2_al_EventIDs)><>CAL_l_MaxTextObjects)
	ARRAY LONGINT:C221(SD2_al_EventIDs; <>CAL_l_MaxTextObjects)
	$_bo_tooManyObjects:=True:C214
End if 
//
<>CAL_d_LastDatePlaced:=!00-00-00!  // Used by Cal4D_PlaceTextObject.
<>CAL_l_NextTextTop:=15  // Used by Calendar_PlaceTextObject.
<>CAL_l_NextObjectNum:=1

For ($_l_EventIndex; 1; Size of array:C274(SD2_al_EventIDs))
	$_ti_StartTime:=$_al_StartTimes{$_l_EventIndex}  // This is a necessary conversion before passing the data as a time value.
	$_ti_EndTime:=$_al_EndTimes{$_l_EventIndex}
	Cal4D_PlaceTextObject(SD2_al_EventIDs{$_l_EventIndex}; SD2_at_Types{$_l_EventIndex}; SD2_at_Titles{$_l_EventIndex}; CAL_ad_StartDates{$_l_EventIndex}; $_ti_StartTime; CAL_ad_EndDates{$_l_EventIndex}; $_ti_EndTime; CAL4d_al_Colours{$_l_EventIndex})
End for 


// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


// Now we'll place the pictures.
QUERY:C277(<>Cal_ptr_EventTable->; <>CAL_ptr_EventStartDateFld->>=<>CAL_d_Box1Date; *)
QUERY:C277(<>Cal_ptr_EventTable->;  & ; <>CAL_ptr_EventStartDateFld-><=<>CAL_d_BoxLastDate)

QUERY SELECTION:C341(<>Cal_ptr_EventTable->; <>Cal_ptr_GroupUserIDField->=<>CAL_l_CurrentUserID; *)
QUERY SELECTION:C341(<>Cal_ptr_EventTable->;  | ; <>Cal_ptr_GroupotherscanviewField->=True:C214)

// // Modified by: Charles Vass (03/31/2009, 10:02)
//QUERY SELECTION BY FORMULA(◊Cal_Po_EventTable->;Picture size(◊Cal4D_EventPictureFld_ptr->)>0
//ARRAY PICTURE($images_apic;0)

// // Modified by: Charles Vass (03/31/2009, 10:02)
//SELECTION TO ARRAY(◊Cal_Po_EventIDField->;SD2_al_EventIDs;◊Cal4D_Po_EventStartDateFld->;CAL_ad_StartDates;◊Cal4D_EventPictureFld_ptr->;$images_apic)
//MULTI SORT ARRAY(SD2_al_EventIDs;CAL_ad_StartDates;>;$images_apic)

// We have a limited number of picture objects available to place on the calendar.
If (Size of array:C274(SD2_al_EventIDs)><>CAL_l_MaxPictureObjects)
	ARRAY LONGINT:C221(SD2_al_EventIDs; <>CAL_l_MaxPictureObjects)
	$_bo_tooManyObjects:=True:C214
End if 

<>CAL_l_NextObjectNum:=1
<>CAL_d_LastPictureDate:=!00-00-00!

// // Modified by: Charles Vass (04/01/2009, 10:56)
//For ($_l_EventIndex;1;Size of array(SD2_al_EventIDs))
//Cal4D_PlacePictureObject (SD2_al_EventIDs{$_l_EventIndex};CAL_ad_StartDates{$_l_EventIndex};$images_apic{$_l_EventIndex})
//End for


// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


MESSAGES ON:C181
SET AUTOMATIC RELATIONS:C310($_bo_OldOneRelations; $_bo_OldManyRelations)

// If an event was selected (highlighted) then reselect it.
If ($_l_SelectedRecordID#0)
	$_l_element:=Find in array:C230(<>Cal_al_TrackRecordEventIDs; $_l_SelectedRecordID)
	If ($_l_element>0)
		$_ptr_FormObject:=Get pointer:C304("<>"+<>Cal_at_TrackFormVarNames{$_l_element})  // Since we stored the var names without "<>", we add it back.
		Cal4D_SelectObject($_ptr_FormObject)
	End if 
End if 

If ($_bo_tooManyObjects)
	Cal4D_Alert("TooManyEvents")
End if 
ERR_MethodTrackerReturn("Cal4D_PlaceEvents"; $_t_oldMethodName)