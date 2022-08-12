//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_Display
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Event_Display (ID; title; start date; start time; {end date; end time{; group ID}}) --> Number
	
	// Adds an event to the calendar without saving it as a record.
	// If the event isn't displayed on the current month, it is ignored.
	// Used for displaying events that are stored in another table.
	// The parameters match the Cal4D_Event_Create parameters, except
	//   an additional parameter is required at the beginning.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Longint : Event ID
	//   $2 : Text : The event title
	//   $3 : Date : Start date
	//   $4 : Time : Start time
	//   $5 : Date : End date (optional)
	//   $6 : Time : End time (optional)
	//   $7 : Longint : Group ID (optional)
	
	// Returns:
	//   $0 : Longint : The event ID
	
	// Created by Dave Batton on Mar 12, 2006
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:38`Method: Cal4D_Event_Display
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(<>Cal4D_ad_EventOEndDates;0)
	//ARRAY DATE(<>Cal4D_ad_EventOStartDates;0)
	//ARRAY INTEGER(<>Cal_ad_EventOEndDates;0)
	//ARRAY INTEGER(<>Cal_ad_EventOStartDates;0)
	//ARRAY LONGINT(<>Cal_al_EventColors;0)
	//ARRAY LONGINT(<>Cal_al_EventGroupIDs;0)
	//ARRAY LONGINT(<>Cal_al_EventIDS;0)
	//ARRAY LONGINT(<>Cal4D_al_EventColors;0)
	//ARRAY LONGINT(<>Cal4D_al_EventGroupIDs;0)
	//ARRAY LONGINT(<>CAL4D_al_EventIDS;0)
	//ARRAY LONGINT(<>Cal4D_ati_EventOStartTimes;0)
	ARRAY LONGINT:C221($_al_EventIDS; 0)
	//ARRAY TEXT(<>Cal_at_EventNotes;0)
	//ARRAY TEXT(<>Cal_at_EventTitles;0)
	//ARRAY TEXT(<>Cal_at_EventTypes;0)
	//ARRAY TEXT(<>Cal4D_at_EventNotes;0)
	//ARRAY TEXT(<>CAL4D_at_EventTitles;0)
	//ARRAY TEXT(<>CAL4D_at_EventTypes;0)
	//ARRAY TIME(<>Cal_ati_EventOEndTimes;0)
	//ARRAY TIME(<>Cal_ati_EventOStartTimes;0)
	//ARRAY TIME(<>Cal4D_ati_EventOEndTimes;0)
	C_BOOLEAN:C305(<>Cal_bo_FormUpdateNeeded)
	C_DATE:C307(<>CAL_d_Box1Date; <>CAL_d_BoxLastDate; $_d_EndDate; $_d_StartDate; $3; $5)
	C_LONGINT:C283(<>CAL_l_SemaphoreTimeout; <>CAL_l_UseGroupColor; $_l_Element; $_l_EventID; $_l_GroupID; $0; $1; $7)
	C_TEXT:C284(<>Cal_t_Event_DefaultTitle; <>CAL_t_SemaphoreName; $_t_EventType; $_t_oldMethodName; $_t_Title; $2)
	C_TIME:C306($_ti_EndTime; $_ti_StartTime; $4; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_Display")


$_l_GroupID:=0  // Default value for optional parameter 7.
$_l_EventID:=$1
$_t_Title:=$2
$_d_StartDate:=$3
$_ti_StartTime:=$4
If (Count parameters:C259>=5)
	$_d_EndDate:=$5
	$_ti_EndTime:=$6
	If (Count parameters:C259>=7)
		$_l_GroupID:=$7
	End if 
Else 
	$_d_EndDate:=$_d_StartDate
	$_ti_EndTime:=$_ti_StartTime
End if 

Cal4D_Init

If (($_d_StartDate<=<>CAL_d_BoxLastDate) & ($_d_EndDate>=<>CAL_d_Box1Date))
	// Make sure the end date and time are valid.
	// This may not be necessary, but it seems like a good idea.
	If ($_d_EndDate<$_d_StartDate)
		$_d_EndDate:=$_d_StartDate
	End if 
	
	// Make sure the start and end times fall in the right order.
	If ($_d_EndDate=$_d_StartDate) & ($_ti_EndTime<$_ti_StartTime)
		$_ti_EndTime:=$_ti_StartTime
	End if 
	
	$_t_EventType:=Cal4D_Event_GuessEventType($_d_StartDate; $_ti_StartTime; $_d_EndDate; $_ti_EndTime)
	
	// Make sure we have a title to display.
	$_t_Title:=Cal4D_ReplaceSpecialCharacters($_t_Title)
	If (Replace string:C233($_t_Title; " "; "")="")
		$_t_Title:=<>Cal_t_Event_DefaultTitle
	End if 
	
	If (Not:C34(Semaphore:C143(<>CAL_t_SemaphoreName; <>CAL_l_SemaphoreTimeout)))
		// If no event ID was supplied, find a unique number.
		If ($_l_EventID=0)
			If (Size of array:C274(<>Cal_al_EventIDS)=0)
				$_l_EventID:=1
			Else 
				COPY ARRAY:C226(<>Cal_al_EventIDS; $_al_EventIDS)
				SORT ARRAY:C229($_al_EventIDS; <)
				$_l_EventID:=$_al_EventIDS{1}+1
			End if 
		End if 
		
		$_l_Element:=Find in array:C230(<>Cal_al_EventIDS; $_l_EventID)
		
		If (($_l_Element=-1) | ($_l_EventID=0))
			APPEND TO ARRAY:C911(<>Cal_al_EventIDS; $_l_EventID)
			APPEND TO ARRAY:C911(<>Cal_at_EventTypes; $_t_EventType)
			APPEND TO ARRAY:C911(<>Cal_at_EventTitles; $_t_Title)
			APPEND TO ARRAY:C911(<>Cal_ad_EventOStartDates; $_d_StartDate)
			APPEND TO ARRAY:C911(<>Cal_ati_EventOStartTimes; $_ti_StartTime)
			APPEND TO ARRAY:C911(<>Cal_ad_EventOEndDates; $_d_EndDate)
			APPEND TO ARRAY:C911(<>Cal_ati_EventOEndTimes; $_ti_EndTime)
			APPEND TO ARRAY:C911(<>Cal_al_EventColors; <>CAL_l_UseGroupColor)
			APPEND TO ARRAY:C911(<>Cal_al_EventGroupIDs; 0)
			APPEND TO ARRAY:C911(<>Cal_at_EventNotes; "")
		Else 
			<>Cal_al_EventIDS{$_l_Element}:=$_l_EventID
			<>Cal_at_EventTypes{$_l_Element}:=$_t_EventType
			<>Cal_at_EventTitles{$_l_Element}:=$_t_Title
			<>Cal_ad_EventOStartDates{$_l_Element}:=$_d_StartDate
			<>Cal_ati_EventOStartTimes{$_l_Element}:=$_ti_StartTime
			<>Cal_ad_EventOEndDates{$_l_Element}:=$_d_EndDate
			<>Cal_ati_EventOEndTimes{$_l_Element}:=$_ti_EndTime
			<>Cal_al_EventColors{$_l_Element}:=<>CAL_l_UseGroupColor
			<>Cal_al_EventGroupIDs{$_l_Element}:=0
			<>Cal_at_EventNotes{$_l_Element}:=""
		End if 
		
		CLEAR SEMAPHORE:C144(<>CAL_t_SemaphoreName)
	End if 
	
	<>Cal_bo_FormUpdateNeeded:=True:C214
	
Else 
	$_l_EventID:=0  // We're not currently displaying this event.
End if 

$0:=$_l_EventID
ERR_MethodTrackerReturn("Cal4D_Event_Display"; $_t_oldMethodName)