//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_Edit2
	//------------------ Method Notes ------------------
	
	//Project Method: Cal4D_Event_Edit2(event ID)
	
	// Displays the specified event record using MODIFY RECORD.  If the record
	//   ID is -3 (4D's New record constant value) then a new record will be
	//   created using the ADD RECORD command.
	// Called from Cal4D_Event_Edit.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : The event ID number
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 21, 2004
	// Modified by Charlie Vass 2009
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:39`Method: Cal4D_Event_Edit2
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Cal_at_GroupPopupMenu;0)
	//ARRAY TEXT(<>Cal4D_at_GroupPopupMenu;0)
	C_BOOLEAN:C305(vDeleteBtnClicked_B)
	C_DATE:C307(Cal4D_d_EventEndDate; Cal4D_d_EventStartDate)
	C_LONGINT:C283(<>Cal_rb1; <>Cal_rb2; $_l_eventID; $_l_WindowReference; $1)
	C_POINTER:C301(<>Cal_ptr_EventDescripField; <>CAL_ptr_EventEndDateFld; <>Cal_ptr_EventEndTimeField; <>Cal_ptr_EventGroupIDField; <>Cal_ptr_EventIDField; <>Cal_ptr_EventLastModifiedField; <>CAL_ptr_EventLastModifiedFld; <>Cal_ptr_EventLEndDateField; <>CAL_ptr_EventLEndTimeFld; <>Cal_ptr_EventLocationField; <>Cal_ptr_EventLStartTimeField)
	C_POINTER:C301(<>Cal_ptr_EventLZoneField; <>Cal_ptr_EventSeqNoField; <>CAL_ptr_EventStartDateFld; <>Cal_ptr_EventStartTimeField; <>Cal_ptr_EventTable; <>Cal_ptr_EventTitleField; <>Cal_ptr_EventTypeFldField; <>Cal_ptr_EventZoneField; <>Cal_ptr_FieldLEventStartField; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name)
	C_POINTER:C301(<>Cal_ptr_GroupTable)
	C_TEXT:C284($_t_DateTimeString; $_t_oldMethodName)
	C_TIME:C306(Cal4D_ti_EventEndTime; Cal4D_ti_EventStartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_Edit2")

vDeleteBtnClicked_B:=False:C215

$_l_eventID:=$1

$_l_WindowReference:=Cal4D_CenterWindow("Cal4D_Event_d"; Sheet form window:K39:12)

If ($_l_eventID=New record:K29:1)
	CREATE RECORD:C68(<>Cal_ptr_EventTable->)
	DIALOG:C40("Cal4D_Event_d")
Else 
	READ WRITE:C146(<>Cal_ptr_EventTable->)
	QUERY:C277(<>Cal_ptr_EventTable->; <>Cal_ptr_EventIDField->=$_l_eventID)
	If (Records in selection:C76(<>Cal_ptr_EventTable->)=1)
		If (Locked:C147(<>Cal_ptr_EventTable->))
			Cal4D_Alert("LockedRecord")
		Else 
			DIALOG:C40("Cal4D_Event_d")
		End if 
	End if 
End if 

CLOSE WINDOW:C154($_l_WindowReference)

If (OK=1)
	<>Cal_ptr_EventTitleField->:=Cal4D_t_EventTitle
	Case of 
		: (<>Cal_rb1=1)
			<>Cal_ptr_EventTypeFldField->:="All-Day"
		: (<>Cal_rb2=1)
			<>Cal_ptr_EventTypeFldField->:="Appointment"
		Else 
			<>Cal_ptr_EventTypeFldField->:="Banner"
	End case 
	
	<>Cal_ptr_EventLocationField->:=Cal_t_EventLocation
	//◊Cal4D_EventNotesFld_ptr->:=Cal4D_t_EventNotes
	<>Cal_ptr_EventDescripField->:=Cal4D_t_Description
	
	If ($_l_eventID=New record:K29:1)
		// //  If it is a new record set the originating time zone to loacl
		//{
		<>Cal_ptr_EventIDField->:=0-(Sequence number:C244(<>Cal_ptr_EventTable->)+1000)
		<>Cal_ptr_EventSeqNoField->:=0
		<>Cal_ptr_EventLastModifiedField->:=Cal4D_iCal_GetDTSTAMP_ZULU
		
		QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_Name->=<>Cal_at_GroupPopupMenu{<>Cal_at_GroupPopupMenu})
		<>Cal_ptr_EventGroupIDField->:=<>Cal_ptr_GroupFld_ID->
		UNLOAD RECORD:C212(<>Cal_ptr_GroupTable->)
		
		<>CAL_ptr_EventStartDateFld->:=Cal4D_d_EventStartDate
		If (<>Cal_ptr_EventTypeFldField->="Appointment")
			<>Cal_ptr_EventStartTimeField->:=Cal4D_ti_EventStartTime
		Else 
			<>Cal_ptr_EventStartTimeField->:=?00:01:00?
		End if 
		<>CAL_ptr_EventEndDateFld->:=Cal4D_d_EventEndDate
		<>Cal_ptr_EventEndTimeField->:=Cal4D_ti_EventEndTime
		<>Cal_ptr_EventZoneField->:=Substring:C12(Cal4D_iCal_GetTimezone; 1; 1)
		
		<>Cal_ptr_FieldLEventStartField->:=<>CAL_ptr_EventStartDateFld->
		<>Cal_ptr_EventLStartTimeField->:=<>Cal_ptr_EventStartTimeField->
		<>Cal_ptr_EventLEndDateField->:=<>CAL_ptr_EventEndDateFld->
		<>CAL_ptr_EventLEndTimeFld->:=<>Cal_ptr_EventEndTimeField->
		<>Cal_ptr_EventLZoneField->:=<>Cal_ptr_EventZoneField->
		//}
	Else 
		// //  Assume changes were made, increment sequence #
		// //  Update last modified
		//{
		<>Cal_ptr_EventSeqNoField->:=<>Cal_ptr_EventSeqNoField->+1
		<>CAL_ptr_EventLastModifiedFld->:=Cal4D_iCal_GetDTSTAMP_ZULU
		//}
		
		// //  Local fields for speed of execution, no conversion on the fly
		//{
		<>Cal_ptr_FieldLEventStartField->:=Cal4D_d_EventStartDate
		<>Cal_ptr_EventLStartTimeField->:=Cal4D_ti_EventStartTime
		<>Cal_ptr_EventLEndDateField->:=Cal4D_d_EventEndDate
		<>CAL_ptr_EventLEndTimeFld->:=Cal4D_ti_EventEndTime
		<>Cal_ptr_EventLZoneField->:=Substring:C12(Cal4D_iCal_GetTimezone; 1; 1)
		//}
		
		// //  If existing record, account for time zone differences
		//{
		If (<>Cal_ptr_EventLZoneField->#<>Cal_ptr_EventZoneField->)
			// //  Convert Local Time To Orignator Time, 03/30/09
			//{
			$_t_DateTimeString:=Cal4D_iCal_ApplyTimezoneOffset(<>Cal_ptr_EventZoneField->; <>Cal_ptr_EventLZoneField->; Cal4D_d_EventStartDate; Cal4D_ti_EventStartTime)
			Cal4D_iCal_ParseDateTimeStamp($_t_DateTimeString; ->Cal4D_d_EventStartDate; ->Cal4D_ti_EventStartTime)
			$_t_DateTimeString:=Cal4D_iCal_ApplyTimezoneOffset(<>Cal_ptr_EventZoneField->; <>Cal_ptr_EventLZoneField->; Cal4D_d_EventEndDate; Cal4D_ti_EventEndTime)
			Cal4D_iCal_ParseDateTimeStamp($_t_DateTimeString; ->Cal4D_d_EventEndDate; ->Cal4D_ti_EventEndTime)
			//}
		End if 
		
		<>CAL_ptr_EventStartDateFld->:=Cal4D_d_EventStartDate
		<>Cal_ptr_EventStartTimeField->:=Cal4D_ti_EventStartTime
		<>CAL_ptr_EventEndDateFld->:=Cal4D_d_EventEndDate
		<>Cal_ptr_EventEndTimeField->:=Cal4D_ti_EventEndTime
		//}
		
	End if 
	
	SAVE RECORD:C53(<>Cal_ptr_EventTable->)
Else 
	If (vDeleteBtnClicked_B)
		Cal4D_Event_Delete_Handler
		
	End if 
End if 

UNLOAD RECORD:C212(<>Cal_ptr_EventTable->)
READ ONLY:C145(<>Cal_ptr_EventTable->)
LOAD RECORD:C52(<>Cal_ptr_EventTable->)

If (OK=1)
	Cal4D_UpdateEvents
End if 
ERR_MethodTrackerReturn("Cal4D_Event_Edit2"; $_t_oldMethodName)