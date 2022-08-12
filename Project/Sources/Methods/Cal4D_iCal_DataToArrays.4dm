//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_DataToArrays
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_DataToArrays
	
	// Increase the size of the array and extract the data from
	//   the given text and insert it in to the appropriate array.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : The imported text to parse
	//   $_ptr_SummariesArray : Pointer :
	//   $_ptr_descriptionsArray : Pointer :
	//   $_ptr_startDatesArray : Pointer :
	//   $_ptr_endDatesArray : Pointer :
	//   $6 : Pointer :
	//   $7 : Pointer :
	
	// Returns: Nothing
	
	// Created by Add Komoncharoensiri, 4D, Inc.
	//   Method originally named iCal_Data_To_Arrays.
	//   Added code to strip carriage returns from the data.
	//   Fixed a bug with the time stamp.
	//  Modified by Charlie Vass 2009
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:33`Method: Cal4D_iCal_DataToArrays
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_EndDates; 0)
	ARRAY DATE:C224($_ad_StartDates; 0)
	//ARRAY DATE(Cal4D_ad_CalStartDates;0)
	//ARRAY DATE(Cal4D_ad_iCalEndDates;0)
	ARRAY LONGINT:C221($_al_DurationSeconds; 0)
	ARRAY LONGINT:C221($_al_EndTimes; 0)
	ARRAY LONGINT:C221($_al_SequenceNos; 0)
	ARRAY LONGINT:C221($_al_StartTimes; 0)
	//ARRAY LONGINT(CAL_al_iCalSeqNo;0)
	//ARRAY LONGINT(Cal4D_al_iCalDurationSecs;0)
	//ARRAY LONGINT(Cal4D_ati_iCalStartTimes;0)
	//ARRAY LONGINT(Cal4D_iCal_SeqNo_aL;0)
	ARRAY TEXT:C222($_at_Catagories; 0)
	ARRAY TEXT:C222($_at_Colours; 0)
	ARRAY TEXT:C222($_at_Comments; 0)
	ARRAY TEXT:C222($_at_DateTimeStamps; 0)
	ARRAY TEXT:C222($_at_Descriptions; 0)
	ARRAY TEXT:C222($_at_Durations; 0)
	ARRAY TEXT:C222($_at_LastModified; 0)
	ARRAY TEXT:C222($_at_Locations; 0)
	ARRAY TEXT:C222($_at_Recurrance; 0)
	ARRAY TEXT:C222($_at_Status; 0)
	ARRAY TEXT:C222($_at_Summaries; 0)
	ARRAY TEXT:C222($_at_URLS; 0)
	ARRAY TEXT:C222($_at_userIDs; 0)
	//ARRAY TEXT(CAL_at_CalLastModified;0)
	//ARRAY TEXT(CAL_at_iCalCategories;0)
	//ARRAY TEXT(CAL_at_iCalComments;0)
	//ARRAY TEXT(CAL_at_iCalDuration;0)
	//ARRAY TEXT(CAL_at_iCalLastModified;0)
	//ARRAY TEXT(Cal_at_iCalStatus;0)
	//ARRAY TEXT(CAL_at_iCalURLS;0)
	//ARRAY TEXT(CAL_at_iCalUserIDs;0)
	//ARRAY TEXT(Cal4D_at_iCalColor;0)
	//ARRAY TEXT(Cal4D_at_iCalDateTimeStamps;0)
	//ARRAY TEXT(Cal4D_at_iCalDescriptions;0)
	//ARRAY TEXT(Cal4D_at_iCalSummaries;0)
	//ARRAY TEXT(Cal4D_at_iCalUserIDs;0)
	//ARRAY TEXT(Cal4D_iCal_Categories;0)
	//ARRAY TEXT(Cal4D_iCal_Color_at;0)
	//ARRAY TEXT(Cal4D_iCal_Comments_at;0)
	//ARRAY TEXT(Cal4D_iCal_Duration;0)
	//ARRAY TEXT(Cal4D_iCal_LastModified;0)
	//ARRAY TEXT(Cal4D_iCal_Locations_at;0)
	//ARRAY TEXT(Cal4D_iCal_Recurrance;0)
	//ARRAY TEXT(Cal4D_iCal_Status;0)
	//ARRAY TEXT(Cal4D_iCal_URL_at;0)
	//ARRAY TEXT(CAT_at_iCalRecurrance;0)
	//ARRAY TIME(Cal4D_ati_iCalEndTimes;0)
	C_DATE:C307(CAL_d_iCalTempDate)
	C_LONGINT:C283($_l_Day; $_l_Month; $_l_position; $_l_Year; Cal_l_CalImportElement)
	C_POINTER:C301($_ptr_DateTimeStampsArray; $_ptr_descriptionsArray; $_ptr_DurationsArray; $_ptr_endDatesArray; $_ptr_endTimesArray; $_ptr_LocationArray; $_ptr_startDatesArray; $_ptr_startTimesArray; $_ptr_SummariesArray; $_ptr_UserIDsArray; $10)
	C_POINTER:C301($11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Data; $_t_Date; $_t_oldMethodName; $_t_Tag; $_t_Time; $_t_value; $1; CAL_t_CalImportLastTag)
	C_TIME:C306(Cal4D_ti_iCalTempTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_DataToArrays")


$_t_Data:=$1
$_t_Data:=Replace string:C233($1; Char:C90(Carriage return:K15:38); "")  // DB040518 - Added this because it didn't work without it.

ARRAY TEXT:C222($_at_userIDs; 0)
ARRAY TEXT:C222($_at_DateTimeStamps; 0)
ARRAY TEXT:C222($_at_Summaries; 0)
ARRAY TEXT:C222($_at_Descriptions; 0)
ARRAY DATE:C224($_ad_StartDates; 0)
ARRAY LONGINT:C221($_al_StartTimes; 0)
ARRAY DATE:C224($_ad_EndDates; 0)
ARRAY LONGINT:C221($_al_EndTimes; 0)
ARRAY LONGINT:C221($_al_DurationSeconds; 0)
ARRAY TEXT:C222($_at_Locations; 0)  // // Modified by: Charles Vass (04/01/2009, 10:10)

ARRAY TEXT:C222($_at_Colours; 0)
ARRAY TEXT:C222($_at_URLS; 0)
ARRAY TEXT:C222($_at_Comments; 0)
ARRAY LONGINT:C221($_al_SequenceNos; 0)

ARRAY TEXT:C222($_at_Status; 0)
ARRAY TEXT:C222($_at_Durations; 0)
ARRAY TEXT:C222($_at_Recurrance; 0)
ARRAY TEXT:C222($_at_Catagories; 0)
ARRAY TEXT:C222($_at_LastModified; 0)

If (Cal_l_CalImportElement=0)
	If ($_t_Data="BEGIN:VEVENT")
		Cal_l_CalImportElement:=Size of array:C274(CAL_at_iCalUserIDs)+1
		INSERT IN ARRAY:C227(CAL_at_iCalUserIDs; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(Cal4D_at_iCalDateTimeStamps; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(Cal4D_at_iCalSummaries; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(Cal4D_at_iCalDescriptions; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(Cal4D_ad_CalStartDates; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(Cal4D_ati_iCalStartTimes; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(Cal4D_ad_iCalEndDates; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(Cal4D_ati_iCalEndTimes; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(Cal4D_al_iCalDurationSecs; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(CAL_at_iCalLocations; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(Cal4D_at_iCalColor; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(CAL_at_iCalURLS; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(CAL_at_iCalComments; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(CAL_al_iCalSeqNo; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(Cal_at_iCalStatus; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(CAL_at_iCalDuration; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(CAT_at_iCalRecurrance; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(CAL_at_iCalCategories; Cal_l_CalImportElement)
		INSERT IN ARRAY:C227(CAL_at_iCalLastModified; Cal_l_CalImportElement)
	End if 
	
Else 
	$_l_position:=Position:C15(":"; $_t_Data)
	$_t_Tag:=Substring:C12($_t_Data; 1; $_l_position-1)
	Case of 
		: (($_t_Data=" @") & (CAL_t_CalImportLastTag="DESCRIPTION"))  // It's a continuation of the description.
			Cal4D_at_iCalDescriptions{Cal_l_CalImportElement}:=Cal4D_at_iCalDescriptions{Cal_l_CalImportElement}+Substring:C12($_t_Data; 2)
			$_t_Tag:="DESCRIPTION"  // Since the $tag_t variable will be wrong.
			
		: ($_t_Tag="UID")
			CAL_at_iCalUserIDs{Cal_l_CalImportElement}:=Substring:C12($_t_Data; $_l_position+1)
			
		: ($_t_Tag="SEQUENCE")
			CAL_al_iCalSeqNo{Cal_l_CalImportElement}:=Num:C11(Substring:C12($_t_Data; $_l_position+1))
			
		: ($_t_Tag="DTSTAMP")  // //  The property value MUST be specified in the UTC time format.
			Cal4D_at_iCalDateTimeStamps{Cal_l_CalImportElement}:=Substring:C12($_t_Data; $_l_position+1)
			
		: ($_t_Tag="SUMMARY")
			Cal4D_at_iCalSummaries{Cal_l_CalImportElement}:=Cal4D_Text_Unfold(Substring:C12($_t_Data; $_l_position+1))
			
		: ($_t_Tag="DESCRIPTION")
			Cal4D_at_iCalDescriptions{Cal_l_CalImportElement}:=Cal4D_Text_Unfold(Substring:C12($_t_Data; $_l_position+1))
			
		: ($_t_Tag="DTSTART@")
			Cal4D_iCal_ParseDateTimeStamp($_t_Data; ->CAL_d_iCalTempDate; ->Cal4D_ti_iCalTempTime)
			Cal4D_ad_CalStartDates{Cal_l_CalImportElement}:=CAL_d_iCalTempDate
			Cal4D_ati_iCalStartTimes{Cal_l_CalImportElement}:=Cal4D_ti_iCalTempTime
			
		: ($_t_Tag="DTEND@")
			Cal4D_iCal_ParseDateTimeStamp($_t_Data; ->CAL_d_iCalTempDate; ->Cal4D_ti_iCalTempTime)
			Cal4D_ad_iCalEndDates{Cal_l_CalImportElement}:=CAL_d_iCalTempDate
			Cal4D_ati_iCalEndTimes{Cal_l_CalImportElement}:=Cal4D_ti_iCalTempTime
			
			//: ($tag_t="DURATION")
			
		: ($_t_Tag="DURATION")
			CAL_at_iCalDuration{Cal_l_CalImportElement}:=Substring:C12($_t_Data; $_l_position+1)
			Cal4D_al_iCalDurationSecs{Cal_l_CalImportElement}:=Cal4D_iCal_DurationToSeconds(CAL_at_iCalDuration{Cal_l_CalImportElement})
			
		: ($_t_Tag="LOCATION")  // // Modified by: Charles Vass (04/01/2009, 10:15)
			CAL_at_iCalLocations{Cal_l_CalImportElement}:=Substring:C12($_t_Data; $_l_position+1)
			
		: ($_t_Tag="")
			//$_at_userIDs{Cal4D_l_iCalImportElement}:=Substring($data_t;$_l_position+1)
			
		: (($_t_Tag="X-4D-EVENT-COLOR") | ($_t_Tag="X-APPLE-CALENDAR-COLOR") | ($_t_Tag="X-4D-CALENDAR-COLOR"))
			Cal4D_at_iCalColor{Cal_l_CalImportElement}:=Substring:C12($_t_Data; $_l_position+1)
			
		: ($_t_Tag="URL")  // //;"VALUE=URI:http://www.4d.com/support/training.html#Application_Building"
			CAL_at_iCalURLS{Cal_l_CalImportElement}:=Substring:C12($_t_Data; $_l_position+1)
			CAL_at_iCalURLS{Cal_l_CalImportElement}:=Replace string:C233(CAL_at_iCalURLS{Cal_l_CalImportElement}; "VALUE=URI:"; "")
			
		: ($_t_Tag="COMMENT")
			CAL_at_iCalComments{Cal_l_CalImportElement}:=Substring:C12($_t_Data; $_l_position+1)
			
		: ($_t_Tag="STATUS")
			Cal_at_iCalStatus{Cal_l_CalImportElement}:=Substring:C12($_t_Data; $_l_position+1)
			
		: ($_t_Tag="RECURRENCE-ID")
			CAT_at_iCalRecurrance{Cal_l_CalImportElement}:=Substring:C12($_t_Data; $_l_position+1)
			
		: ($_t_Tag="CATEGORIES")
			CAL_at_iCalCategories{Cal_l_CalImportElement}:=Substring:C12($_t_Data; $_l_position+1)
			
		: ($_t_Tag="DUE")
			
		: ($_t_Tag="LAST-MODIFIED")  // //  The property value MUST be specified in the UTC time format.
			CAL_at_iCalLastModified{Cal_l_CalImportElement}:=Substring:C12($_t_Data; $_l_position+1)
			
		: ($_t_Data="END:VEVENT")
			Cal_l_CalImportElement:=0
	End case 
	
	CAL_t_CalImportLastTag:=$_t_Tag
End if 
ERR_MethodTrackerReturn("Cal4D_iCal_DataToArrays"; $_t_oldMethodName)