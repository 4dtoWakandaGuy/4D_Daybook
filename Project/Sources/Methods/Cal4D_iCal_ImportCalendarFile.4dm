//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_ImportCalendarFile
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_ImportCalendarFile (path; group ID)
	
	// Imports a calendar file and creates the [Cal4D_Event] records.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : The path to the file to import
	//   $2 : Longint : The group to link the new items to
	
	// Returns: Nothing
	
	// Created by Dave Add Komoncharoensiri, 4D, Inc.
	//   Method originally named iCal_SaveCalendar.
	// Modified by Dave Batton on May 17, 2004
	//   Fixed a potential (but unlikely) bug.
	//   This method no longer deletes the calendar file. It just reads it.
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:31`Method: Cal4D_iCal_ImportCalendarFile
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(Cal4D_ad_CalStartDates;0)
	//ARRAY DATE(Cal4D_ad_iCalEndDates;0)
	//ARRAY LONGINT(CAL_al_iCalSeqNo;0)
	//ARRAY LONGINT(Cal4D_al_iCalDurationSecs;0)
	//ARRAY LONGINT(Cal4D_iCal_SeqNo_aL;0)
	//ARRAY TEXT(CAL_at_CalLastModified;0)
	//ARRAY TEXT(CAL_at_iCalCategories;0)
	//ARRAY TEXT(CAL_at_iCalComments;0)
	//ARRAY TEXT(CAL_at_iCalDuration;0)
	//ARRAY TEXT(CAL_at_iCalLastModified;0)
	//ARRAY TEXT(CAL_at_iCalLocations;0)
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
	//ARRAY TIME(Cal4D_ati_iCalStartTimes;0)
	C_BOOLEAN:C305($_bo_ReadOnlyState)
	C_DATE:C307($_d_EndDate)
	C_LONGINT:C283($_l_EventNumber; $_l_GroupID; $2; Tmp_l_Count)
	C_POINTER:C301(<>Cal_ptr_EventGroupIDField; <>Cal_ptr_EventiCalUIDField; <>Cal_ptr_EventLastModifiedField; <>Cal_ptr_EventSeqNoField; <>Cal_ptr_EventTable; <>Cal_ptr_GroupotherscanModField)
	C_TEXT:C284($_t_CalendarPath; $_t_oldMethodName; $_t_SQL; $1)
	C_TIME:C306($_ti_EndTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_ImportCalendarFile")

$_t_CalendarPath:=$1
$_l_GroupID:=$2

// DB040517 - Changed these to Process_Arrays so there won't be a
//   problem if two processes call this method at the same time.
ARRAY TEXT:C222(CAL_at_iCalUserIDs; 0)
ARRAY TEXT:C222(Cal4D_at_iCalDateTimeStamps; 0)
ARRAY TEXT:C222(Cal4D_at_iCalSummaries; 0)
ARRAY TEXT:C222(Cal4D_at_iCalDescriptions; 0)
ARRAY DATE:C224(Cal4D_ad_CalStartDates; 0)
ARRAY TIME:C1223(Cal4D_ati_iCalStartTimes; 0)
ARRAY DATE:C224(Cal4D_ad_iCalEndDates; 0)
ARRAY TIME:C1223(Cal4D_ati_iCalEndTimes; 0)
ARRAY LONGINT:C221(Cal4D_al_iCalDurationSecs; 0)
ARRAY TEXT:C222(CAL_at_iCalLocations; 0)  // // Modified by: Charles Vass (04/01/2009, 10:10)

ARRAY TEXT:C222(Cal4D_at_iCalColor; 0)
ARRAY TEXT:C222(CAL_at_iCalURLS; 0)
ARRAY TEXT:C222(CAL_at_iCalComments; 0)
ARRAY LONGINT:C221(CAL_al_iCalSeqNo; 0)

ARRAY TEXT:C222(Cal_at_iCalStatus; 0)
ARRAY TEXT:C222(CAL_at_iCalDuration; 0)
ARRAY TEXT:C222(CAT_at_iCalRecurrance; 0)
ARRAY TEXT:C222(CAL_at_iCalCategories; 0)
ARRAY TEXT:C222(CAL_at_iCalLastModified; 0)

Error:=0

Cal4D_iCal_ReadSubscription($_t_CalendarPath)

If (Error=0)  // DB040518 - Now we delete the existing events only if we were able to read the calendar file.
	
	//Cal4D_Group_DeleteEvents ($groupID_i)  `// Modified by: Charles Vass (04/08/2009, 13:20)
	
	If (Error=0)  // Don't create events if we couldn't delete the older ones.
		// Then recreate the calendar events.
		For ($_l_EventNumber; 1; Size of array:C274(Cal4D_at_iCalSummaries))
			// //  First find out if this record already exists
			//{
			$_t_SQL:="SELECT COUNT(*)"
			$_t_SQL:=$_t_SQL+" FROM "+Table name:C256(<>Cal_ptr_EventTable)
			$_t_SQL:=$_t_SQL+" WHERE "+Field name:C257(<>Cal_ptr_EventiCalUIDField)+" = '"+CAL_at_iCalUserIDs{$_l_EventNumber}+"'"
			$_t_SQL:=$_t_SQL+" INTO :Tmp_l_Count;"
			Begin SQL
				EXECUTE IMMEDIATE :$_t_SQL;
			End SQL
			//}
			
			If (Tmp_l_Count=0)
				// //  Event does not already exist in the DB, so create it...
				//{
				Cal4D_Event_Create_v11($_l_EventNumber; $_l_GroupID)
				//}
				
			Else 
				$_bo_ReadOnlyState:=Read only state:C362(<>Cal_ptr_EventTable->)
				If ($_bo_ReadOnlyState)
					READ WRITE:C146(<>Cal_ptr_EventTable->)
				End if 
				
				QUERY:C277(<>Cal_ptr_EventTable->; <>Cal_ptr_EventiCalUIDField->=CAL_at_iCalUserIDs{$_l_EventNumber})
				RELATE ONE:C42(<>Cal_ptr_EventGroupIDField->)
				If (<>Cal_ptr_GroupotherscanModField->)
					If (Not:C34(Locked:C147(<>Cal_ptr_EventTable->)))
						If ((<>Cal_ptr_EventSeqNoField->#CAL_al_iCalSeqNo{$_l_EventNumber}) | (CAL_at_iCalLastModified{$_l_EventNumber}#<>Cal_ptr_EventLastModifiedField->))
							Cal4D_Event_Update($_l_EventNumber)
						End if 
					End if 
				End if 
				
				If ($_bo_ReadOnlyState)
					READ ONLY:C145(<>Cal_ptr_EventTable->)
				End if 
				
			End if 
		End for 
	End if 
End if 

ARRAY TEXT:C222(CAL_at_iCalUserIDs; 0)
ARRAY TEXT:C222(Cal4D_at_iCalDateTimeStamps; 0)
ARRAY TEXT:C222(Cal4D_at_iCalSummaries; 0)
ARRAY TEXT:C222(Cal4D_at_iCalDescriptions; 0)
ARRAY DATE:C224(Cal4D_ad_CalStartDates; 0)
ARRAY TIME:C1223(Cal4D_ati_iCalStartTimes; 0)
ARRAY DATE:C224(Cal4D_ad_iCalEndDates; 0)
ARRAY TIME:C1223(Cal4D_ati_iCalEndTimes; 0)
ARRAY LONGINT:C221(Cal4D_al_iCalDurationSecs; 0)

// // Modified by: Charles Vass (04/01/2009, 10:10)
ARRAY TEXT:C222(CAL_at_iCalLocations; 0)
ARRAY TEXT:C222(Cal4D_at_iCalColor; 0)
ARRAY TEXT:C222(CAL_at_iCalURLS; 0)
ARRAY TEXT:C222(CAL_at_iCalComments; 0)
ARRAY LONGINT:C221(CAL_al_iCalSeqNo; 0)
ARRAY TEXT:C222(Cal_at_iCalStatus; 0)
ARRAY TEXT:C222(CAL_at_iCalDuration; 0)
ARRAY TEXT:C222(CAT_at_iCalRecurrance; 0)
ARRAY TEXT:C222(CAL_at_iCalCategories; 0)
ARRAY TEXT:C222(CAL_at_iCalLastModified; 0)
ERR_MethodTrackerReturn("Cal4D_iCal_ImportCalendarFile"; $_t_oldMethodName)