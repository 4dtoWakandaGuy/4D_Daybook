//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_Create
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Event_Create (title; start date; start time; end date; end time{; group ID}) --> Number
	
	// A quick, safe way to create a new event record.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Text : The event title
	//   $2 : Date : Start date
	//   $3 : Time : Start time
	//   $4 : Date : End date
	//   $5 : Time : End time
	//   $6 : Longint : Group ID (optional)
	
	// Returns:
	//   $0 : Longint : The new event record ID
	
	// Created by Dave Batton on May 19, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:38`Method: Cal4D_Event_Create
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(Cal4D_at_iCalColor;0)
	//ARRAY TEXT(Cal4D_iCal_Color_at;0)
	C_DATE:C307($_d_EndDate; $_d_StartDate; $2; $4)
	C_LONGINT:C283(<>CAL_l_UseGroupColor; $_l_GroupID; $0; $6; Cal_l_CalImportElement)
	C_POINTER:C301(<>CAL_ptr_EventLEndTimeFld; <>Cal_ptr_EventCatagoriesField; <>Cal_ptr_EventColorField; <>Cal_ptr_EventCommentsField; <>Cal_ptr_EventDescripField; <>Cal_ptr_EventDurationField; <>CAL_ptr_EventEndDateFld; <>Cal_ptr_EventEndTimeField; <>Cal_ptr_EventGroupIDField; <>Cal_ptr_EventIDField; <>Cal_ptr_EventLastModifiedField)
	C_POINTER:C301(<>Cal_ptr_EventLEndDateField; <>Cal_ptr_EventLocationField; <>Cal_ptr_EventLZoneField; <>Cal_ptr_EventRecurranceField; <>Cal_ptr_EventSeqNoField; <>CAL_ptr_EventStartDateFld; <>Cal_ptr_EventStartTimeField; <>Cal_ptr_EventStatusField; <>Cal_ptr_EventTable; <>Cal_ptr_EventTitleField; <>Cal_ptr_EventTypeFldField)
	C_POINTER:C301(<>Cal_ptr_EventURLField; <>Cal_ptr_EventZoneField; <>Cal_ptr_FieldLEventStartField)
	C_TEXT:C284(<>Cal_t_Event_DefaultTitle; $_t_DateTimeString; $_t_Location; $_t_oldMethodName; $_t_Title; $1; $7; CAL_t_lZone; CAL_t_oZone)
	C_TIME:C306($_ti_EndTime; $_ti_StartTime; $3; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_Create")



$_t_Title:=$1
$_d_StartDate:=$2
$_ti_StartTime:=$3
$_d_EndDate:=$4
$_ti_EndTime:=$5
If (Count parameters:C259>=6)
	$_l_GroupID:=$6
Else 
	$_l_GroupID:=0
End if 

Cal4D_Init

CREATE RECORD:C68(<>Cal_ptr_EventTable->)
// // Our records use negative IDs to differentiate them from array-based events.
// // We start at -1000 to avoid ID -3 matching 4D's New Record constant.
<>Cal_ptr_EventIDField->:=0-(Sequence number:C244(<>Cal_ptr_EventTable->)+1000)
<>Cal_ptr_EventGroupIDField->:=$_l_GroupID
<>Cal_ptr_EventTitleField->:=Cal4D_ReplaceSpecialCharacters($_t_Title)
<>CAL_ptr_EventStartDateFld->:=$_d_StartDate
<>Cal_ptr_EventStartTimeField->:=$_ti_StartTime
<>CAL_ptr_EventEndDateFld->:=$_d_EndDate
<>Cal_ptr_EventEndTimeField->:=$_ti_EndTime
<>Cal_ptr_EventLocationField->:=$_t_Location
<>Cal_ptr_EventZoneField->:=CAL_t_oZone
If (Cal4D_at_iCalColor{Cal_l_CalImportElement}#"")
	
	<>Cal_ptr_EventColorField->:=<>CAL_l_UseGroupColor
	
Else 
	<>Cal_ptr_EventColorField->:=<>CAL_l_UseGroupColor
End if 

<>Cal_ptr_EventSeqNoField->:=0
<>Cal_ptr_EventURLField->:=""
<>Cal_ptr_EventCommentsField->:=""
<>Cal_ptr_EventDescripField->:=""

<>Cal_ptr_EventStatusField->:=""
<>Cal_ptr_EventDurationField->:=""
<>Cal_ptr_EventRecurranceField->:=""
<>Cal_ptr_EventCatagoriesField->:=""
<>Cal_ptr_EventLastModifiedField->:=Cal4D_iCal_GetDTSTAMP_ZULU

// //  Convert Orignator Time to Local Time, 03/30/09
//{
$_t_DateTimeString:=Cal4D_iCal_ApplyTimezoneOffset(CAL_t_lZone; CAL_t_oZone; $_d_StartDate; $_ti_StartTime)
Cal4D_iCal_ParseDateTimeStamp($_t_DateTimeString; ->$_d_StartDate; ->$_ti_StartTime)
$_t_DateTimeString:=Cal4D_iCal_ApplyTimezoneOffset(CAL_t_lZone; CAL_t_oZone; $_d_EndDate; $_ti_EndTime)
Cal4D_iCal_ParseDateTimeStamp($_t_DateTimeString; ->$_d_EndDate; ->$_ti_EndTime)

<>Cal_ptr_FieldLEventStartField->:=$_d_StartDate
<>Cal_ptr_FieldLEventStartField->:=$_ti_StartTime
<>Cal_ptr_EventLEndDateField->:=$_d_EndDate
<>CAL_ptr_EventLEndTimeFld->:=$_ti_EndTime
<>Cal_ptr_EventLZoneField->:=CAL_t_lZone
//}

Case of 
	: ((<>Cal_ptr_EventEndTimeField->-<>Cal_ptr_EventStartTimeField->)>=60)  // The event is at least one minute in length.
		<>Cal_ptr_EventTypeFldField->:="Appointment"
	Else 
		<>Cal_ptr_EventTypeFldField->:="All-Day"
End case 

// Make sure we have a title to display.
If (Replace string:C233(<>Cal_ptr_EventTitleField->; " "; "")="")
	<>Cal_ptr_EventTitleField->:=<>Cal_t_Event_DefaultTitle
End if 

// Make sure the end date and time are valid.
// This may not be necessary, but it seems like a good idea.
If (<>CAL_ptr_EventEndDateFld-><<>CAL_ptr_EventStartDateFld->)
	<>CAL_ptr_EventEndDateFld->:=<>CAL_ptr_EventStartDateFld->
End if 

If (<>CAL_ptr_EventEndDateFld->=<>CAL_ptr_EventStartDateFld->) & (<>Cal_ptr_EventEndTimeField-><<>Cal_ptr_EventStartTimeField->)
	<>Cal_ptr_EventEndTimeField->:=<>Cal_ptr_EventStartTimeField->
End if 

$0:=<>Cal_ptr_EventIDField->

SAVE RECORD:C53(<>Cal_ptr_EventTable->)
UNLOAD RECORD:C212(<>Cal_ptr_EventTable->)
ERR_MethodTrackerReturn("Cal4D_Event_Create"; $_t_oldMethodName)