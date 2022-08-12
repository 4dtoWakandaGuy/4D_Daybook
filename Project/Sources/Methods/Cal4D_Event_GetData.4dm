//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_GetData
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_Event_GetData (event ID; ->type; ->title; ->start date; ->start time; ->end date; ->end time; ->color; ->group ID)
	
	// Loads the event specified by the event ID into the provided pointers.
	// The values are cleared if the event isn't found.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : Event ID
	//   $2 : Pointer : The event type
	//   $3 : Pointer : The event title
	//   $4 : Pointer : Start date
	//   $5 : Pointer : Start time
	//   $6 : Pointer : End date
	//   $7 : Pointer : End time
	//   $8 : Pointer : Color
	//   $9 : Pointer : Group ID
	
	// Returns:
	//   $0 : Longint : Description
	
	// Created by Dave Batton on Mar 12, 2006
	//------------------ Revision Control ----------------
	//Date Created: 20/12/2009 14:29`Method: Cal4D_Event_GetData
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
	//ARRAY TEXT(<>Cal_at_EventTitles;0)
	//ARRAY TEXT(<>Cal_at_EventTypes;0)
	//ARRAY TEXT(<>CAL4D_at_EventTitles;0)
	//ARRAY TEXT(<>CAL4D_at_EventTypes;0)
	//ARRAY TIME(<>Cal_ati_EventOEndTimes;0)
	//ARRAY TIME(<>Cal_ati_EventOStartTimes;0)
	//ARRAY TIME(<>Cal4D_ati_EventOEndTimes;0)
	//ARRAY TIME(<>Cal4D_ati_EventOStartTimes;0)
	C_BOOLEAN:C305($_bo_Found)
	C_LONGINT:C283(<>CAL_l_SemaphoreTimeout; <>CAL_l_UseGroupColor; $_l_element; $_l_eventID; $1)
	C_POINTER:C301(<>Cal_ptr_EventColorField; <>CAL_ptr_EventEndDateFld; <>Cal_ptr_EventEndTimeField; <>Cal_ptr_EventGroupIDField; <>CAL_ptr_EventIDField; <>CAL_ptr_EventStartDateFld; <>Cal_ptr_EventStartTimeField; <>Cal_ptr_EventTable; <>Cal_ptr_EventTitleField; <>Cal_ptr_EventTypeFldField; $_ptr_Colour)
	C_POINTER:C301($_ptr_EndDate; $_ptr_EndTime; $_ptr_GroupID; $_ptr_StartDate; $_ptr_StartTime; $_ptr_Title; $_ptr_Type; $2; $3; $4; $5)
	C_POINTER:C301($6; $7; $8; $9)
	C_TEXT:C284(<>CAL_t_SemaphoreName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_GetData")


$_l_eventID:=$1
$_ptr_Type:=$2
$_ptr_Title:=$3
$_ptr_StartDate:=$4
$_ptr_StartTime:=$5
$_ptr_EndDate:=$6
$_ptr_EndTime:=$7
$_ptr_Colour:=$8
$_ptr_GroupID:=$9

$_bo_Found:=False:C215

If ($_l_eventID>0)  // It's an array-based event.
	If (Not:C34(Semaphore:C143(<>CAL_t_SemaphoreName; <>CAL_l_SemaphoreTimeout)))
		$_l_element:=Find in array:C230(<>Cal_al_EventIDS; $_l_eventID)
		
		If ($_l_element>0)
			$_bo_Found:=True:C214
			$_ptr_Type->:=<>Cal_at_EventTypes{$_l_element}
			$_ptr_Title->:=<>Cal_at_EventTitles{$_l_element}
			$_ptr_StartDate->:=<>Cal_ad_EventOStartDates{$_l_element}
			$_ptr_StartTime->:=<>Cal_ati_EventOStartTimes{$_l_element}
			$_ptr_EndDate->:=<>Cal_ad_EventOEndDates{$_l_element}
			$_ptr_EndTime->:=<>Cal_ati_EventOEndTimes{$_l_element}
			$_ptr_Colour->:=<>Cal_al_EventColors{$_l_element}
			$_ptr_GroupID->:=<>Cal_al_EventGroupIDs{$_l_element}
		End if 
		CLEAR SEMAPHORE:C144(<>CAL_t_SemaphoreName)
	End if 
	
Else 
	// We can assume our data is in a read-only state. Calling READ ONLY is slow on a WAN.
	QUERY:C277(<>Cal_ptr_EventTable->; <>CAL_ptr_EventIDField->=$_l_eventID)
	If (Records in selection:C76(<>Cal_ptr_EventTable->)=1)
		$_bo_Found:=True:C214
		$_ptr_Type->:=<>Cal_ptr_EventTypeFldField->
		$_ptr_Title->:=<>Cal_ptr_EventTitleField->
		$_ptr_StartDate->:=<>CAL_ptr_EventStartDateFld->
		$_ptr_StartTime->:=<>Cal_ptr_EventStartTimeField->
		$_ptr_EndDate->:=<>CAL_ptr_EventEndDateFld->
		$_ptr_EndTime->:=<>Cal_ptr_EventEndTimeField->
		$_ptr_Colour->:=<>Cal_ptr_EventColorField->
		$_ptr_GroupID->:=<>Cal_ptr_EventGroupIDField->
	End if 
	
End if 

If (Not:C34($_bo_Found))
	$_ptr_Title->:=""
	$_ptr_Type->:=""
	$_ptr_StartDate->:=!00-00-00!
	$_ptr_StartTime->:=?00:00:00?
	$_ptr_EndDate->:=!00-00-00!
	$_ptr_EndTime->:=?00:00:00?
	$_ptr_Colour->:=<>CAL_l_UseGroupColor
	$_ptr_GroupID->:=0
End if 
ERR_MethodTrackerReturn("Cal4D_Event_GetData"; $_t_oldMethodName)