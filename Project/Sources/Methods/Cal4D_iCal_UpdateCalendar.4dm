//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_UpdateCalendar
	//------------------ Method Notes ------------------
	// ### Updating is not yet supported in this component. - DB
	
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_UpdateCalendar
	
	// Updates the specified calendar.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : A [Cal4D_iCal] record ID
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 17, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:30`Method: Cal4D_iCal_UpdateCalendar
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Done; $_bo_isInvisible; $_bo_isLocked)
	C_DATE:C307($_d_CreatedDate; $_d_ModifiedDate)
	C_LONGINT:C283($_l_CalendarID; $_l_CountRecords; $_l_Index; $1)
	C_POINTER:C301(<>Cal_ptr_EventEndTimeField; <>Cal_ptr_EventGroupIDField; <>Cal_ptr_EventiCalDateTimeField; <>Cal_ptr_EventiCalUIDField; <>Cal_ptr_EventNotesField; <>CAL_ptr_EventStartDateFld; <>Cal_ptr_EventStartTimeField; <>Cal_ptr_EventTable; <>Cal_ptr_EventTitleField; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name)
	C_POINTER:C301(<>Cal_ptr_GroupicalPasswordField; <>Cal_ptr_GroupicalURLField; <>Cal_ptr_GroupicaluserNameField; <>Cal_ptr_GroupTable)
	C_TEXT:C284($_t_CalenderPath; $_t_Data; $_t_oldMethodName; $_t_UpdateCalendar)
	C_TIME:C306($_ti_CreatedTime; $_ti_DocumentRef; $_ti_ModifiedTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_UpdateCalendar")


$_l_CalendarID:=$1

Cal4D_Init

$_t_CalenderPath:=Get 4D folder:C485+"Cal4D_"+String:C10($_l_CalendarID)

QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_ID->=$_l_CalendarID)

If (Records in selection:C76(<>Cal_ptr_GroupTable->)>0)
	Cal4D_iCal_StatusMessage("Synchronizing "+<>Cal_ptr_GroupFld_Name->)  // Localize
	
	Cal4D_iCal_WDAV_DownloadFile(<>Cal_ptr_GroupicalURLField->; <>Cal_ptr_GroupicaluserNameField->+":"+<>Cal_ptr_GroupicalPasswordField->; $_t_CalenderPath)
	
	If (Error=0)
		QUERY:C277(<>Cal_ptr_EventTable->; <>Cal_ptr_EventGroupIDField->=$_l_CalendarID)
		$_l_CountRecords:=Records in selection:C76(<>Cal_ptr_EventTable->)
		If ($_l_CountRecords>0)
			$_ti_DocumentRef:=DB_OpenDocument($_t_CalenderPath)
			If (OK=1)
				Repeat 
					RECEIVE PACKET:C104($_ti_DocumentRef; $_t_Data; Char:C90(10))
					If ($_t_Data="BEGIN:VEVENT")
						$_bo_Done:=True:C214
					Else 
						$_t_UpdateCalendar:=$_t_UpdateCalendar+$_t_Data+Char:C90(10)
					End if 
				Until ($_bo_Done)
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
			End if 
			
			For ($_l_Index; 1; $_l_CountRecords)
				$_t_UpdateCalendar:=$_t_UpdateCalendar+"BEGIN:VEVENT"+Char:C90(10)
				$_t_UpdateCalendar:=$_t_UpdateCalendar+"DTSTAMP:"+<>Cal_ptr_EventiCalDateTimeField->+Char:C90(10)
				$_t_UpdateCalendar:=$_t_UpdateCalendar+"SUMMARY:"+<>Cal_ptr_EventTitleField->+Char:C90(10)
				$_t_UpdateCalendar:=$_t_UpdateCalendar+"UID:"+<>Cal_ptr_EventiCalUIDField->+Char:C90(10)
				$_t_UpdateCalendar:=$_t_UpdateCalendar+"DTSTART:"+Cal4D_iCal_GetDate(<>CAL_ptr_EventStartDateFld->)+"T"+Cal4D_iCal_GetTime(<>Cal_ptr_EventStartTimeField->)+Char:C90(10)
				If (<>Cal_ptr_EventEndTimeField->=?00:00:00?)
					$_t_UpdateCalendar:=$_t_UpdateCalendar+"DURATION:PT1H"+Char:C90(10)
				Else 
					$_t_UpdateCalendar:=$_t_UpdateCalendar+"DTEND:"+Cal4D_iCal_GetDate(<>CAL_ptr_EventStartDateFld->)+"T"+Cal4D_iCal_GetTime(<>Cal_ptr_EventEndTimeField->)+Char:C90(10)
				End if 
				$_t_UpdateCalendar:=$_t_UpdateCalendar+"DESCRIPTION:"+Replace string:C233(<>Cal_ptr_EventNotesField->; Char:C90(13); "\n")+Char:C90(10)
				$_t_UpdateCalendar:=$_t_UpdateCalendar+"END:VEVENT"+Char:C90(10)
				NEXT RECORD:C51(<>Cal_ptr_EventTable->)
			End for 
			$_t_UpdateCalendar:=$_t_UpdateCalendar+"END:VCALENDAR"+Char:C90(10)
			
			//$creator:=_o_Document creator($_t_CalenderPath)
			GET DOCUMENT PROPERTIES:C477($_t_CalenderPath; $_bo_isLocked; $_bo_isInvisible; $_d_CreatedDate; $_ti_CreatedTime; $_d_ModifiedDate; $_ti_ModifiedTime)
			DELETE DOCUMENT:C159($_t_CalenderPath)
			$_ti_DocumentRef:=DB_CreateDocument($_t_CalenderPath)
			If (OK=1)
				SEND PACKET:C103($_ti_DocumentRef; $_t_UpdateCalendar)
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				//_O_SET DOCUMENT CREATOR(document;$creator)
				SET DOCUMENT PROPERTIES:C478(document; $_bo_isLocked; $_bo_isInvisible; $_d_CreatedDate; $_ti_CreatedTime; $_d_ModifiedDate; $_ti_ModifiedTime)
				Error:=Cal4D_iCal_WDAV_UploadFile(document; <>Cal_ptr_GroupicalURLField->; <>Cal_ptr_GroupicaluserNameField->+":"+<>Cal_ptr_GroupicalPasswordField->)
				DELETE DOCUMENT:C159($_t_CalenderPath)
			End if 
		End if 
	End if 
End if 

Cal4D_iCal_StatusMessage("Idle")  // Localize

UNLOAD RECORD:C212(<>Cal_ptr_EventTable->)
UNLOAD RECORD:C212(<>Cal_ptr_GroupTable->)
ERR_MethodTrackerReturn("Cal4D_iCal_UpdateCalendar"; $_t_oldMethodName)