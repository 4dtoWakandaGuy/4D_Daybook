//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Event_Update
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/12/2009 16:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(Cal4D_ad_CalStartDates;0)
	//ARRAY DATE(Cal4D_ad_iCalEndDates;0)
	//ARRAY TIME(Cal4D_ati_iCalEndTimes;0)
	//ARRAY TIME(Cal4D_ati_iCalStartTimes;0)
	C_DATE:C307($_d_EndDate; $_d_StartDate)
	C_LONGINT:C283($_l_SelectedRow; $1)
	C_POINTER:C301(<>Cal_ptr_EventCatagoriesField; <>Cal_ptr_EventColorField; <>Cal_ptr_EventCommentsField; <>Cal_ptr_EventDescripField; <>Cal_ptr_EventDurationField; <>CAL_ptr_EventEndDateFld; <>Cal_ptr_EventEndTimeField; <>Cal_ptr_EventiCalDateTimeField; <>Cal_ptr_EventLastModifiedField; <>Cal_ptr_EventLEndDateField; <>CAL_ptr_EventLEndTimeFld)
	C_POINTER:C301(<>Cal_ptr_EventLocationField; <>Cal_ptr_EventLStartTimeField; <>Cal_ptr_EventLZoneField; <>Cal_ptr_EventRecurranceField; <>Cal_ptr_EventSeqNoField; <>CAL_ptr_EventStartDateFld; <>Cal_ptr_EventStartTimeField; <>Cal_ptr_EventStatusField; <>Cal_ptr_EventTable; <>Cal_ptr_EventTitleField; <>Cal_ptr_EventTypeFldField)
	C_POINTER:C301(<>Cal_ptr_EventURLField; <>Cal_ptr_EventZoneField; <>Cal_ptr_FieldLEventStartField)
	C_TEXT:C284($_t_DateTimeString; $_t_MethodName; $_t_oldMethodName; CAL_t_lZone; CAL_t_oZone)
	C_TIME:C306($_ti_EndTime; $_ti_StartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_Update")




$_l_SelectedRow:=$1


<>Cal_ptr_EventSeqNoField->:=CAL_al_iCalSeqNo{$_l_SelectedRow}
<>Cal_ptr_EventLastModifiedField->:=CAL_at_iCalLastModified{$_l_SelectedRow}
<>Cal_ptr_EventStatusField->:=Cal_at_iCalStatus{$_l_SelectedRow}

<>Cal_ptr_EventZoneField->:=CAL_t_oZone

<>CAL_ptr_EventStartDateFld->:=Cal4D_ad_CalStartDates{$_l_SelectedRow}
<>Cal_ptr_EventStartTimeField->:=Cal4D_ati_iCalStartTimes{$_l_SelectedRow}
<>CAL_ptr_EventEndDateFld->:=Cal4D_ad_iCalEndDates{$_l_SelectedRow}
<>Cal_ptr_EventEndTimeField->:=Cal4D_ati_iCalEndTimes{$_l_SelectedRow}

// //  Convert Orignator Time to Local Time, 03/30/09
//{
$_t_DateTimeString:=Cal4D_iCal_ApplyTimezoneOffset(CAL_t_lZone; CAL_t_oZone; Cal4D_ad_CalStartDates{$_l_SelectedRow}; Cal4D_ati_iCalStartTimes{$_l_SelectedRow})
Cal4D_iCal_ParseDateTimeStamp($_t_DateTimeString; ->$_d_StartDate; ->$_ti_StartTime)
$_t_DateTimeString:=Cal4D_iCal_ApplyTimezoneOffset(CAL_t_lZone; CAL_t_oZone; Cal4D_ad_iCalEndDates{$_l_SelectedRow}; Cal4D_ati_iCalEndTimes{$_l_SelectedRow})
Cal4D_iCal_ParseDateTimeStamp($_t_DateTimeString; ->$_d_EndDate; ->$_ti_EndTime)
//}

<>Cal_ptr_FieldLEventStartField->:=$_d_StartDate
<>Cal_ptr_EventLStartTimeField->:=$_ti_StartTime
<>Cal_ptr_EventLEndDateField->:=$_d_EndDate
<>CAL_ptr_EventLEndTimeFld->:=$_ti_EndTime
<>Cal_ptr_EventLZoneField->:=CAL_t_lZone

<>Cal_ptr_EventDurationField->:=CAL_at_iCalDuration{$_l_SelectedRow}
<>Cal_ptr_EventURLField->:=CAL_at_iCalURLS{$_l_SelectedRow}
<>Cal_ptr_EventColorField->:=Cal4D_at_iCalColor{$_l_SelectedRow}

<>Cal_ptr_EventDescripField->:=Cal4D_at_iCalDescriptions{$_l_SelectedRow}
<>Cal_ptr_EventLocationField->:=CAL_at_iCalLocations{$_l_SelectedRow}
<>Cal_ptr_EventTitleField->:=Cal4D_ReplaceSpecialCharacters(Cal4D_at_iCalSummaries{$_l_SelectedRow})

<>Cal_ptr_EventCommentsField->:=CAL_at_iCalComments{$_l_SelectedRow}
<>Cal_ptr_EventRecurranceField->:=CAT_at_iCalRecurrance{$_l_SelectedRow}
<>Cal_ptr_EventCatagoriesField->:=CAL_at_iCalCategories{$_l_SelectedRow}
<>Cal_ptr_EventiCalDateTimeField->:=Cal4D_at_iCalDateTimeStamps{$_l_SelectedRow}

Case of 
	: ((<>Cal_ptr_EventEndTimeField->-<>Cal_ptr_EventStartTimeField->)>=60)  // The event is at least one minute in length.
		<>Cal_ptr_EventTypeFldField->:="Appointment"
	Else 
		<>Cal_ptr_EventTypeFldField->:="All-Day"
End case 


SAVE RECORD:C53(<>Cal_ptr_EventTable->)
ERR_MethodTrackerReturn("Cal4D_Event_Update"; $_t_oldMethodName)